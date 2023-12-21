-- Wait game to be loaded
if not game:IsLoaded() then
    game.Loaded:Wait()
end
wait(7)

-- Auto choose team
Team = "Pirates" -- Pirates/Marines
if game.Players.LocalPlayer.Team == nil then
    for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam").Container[Team].Frame.TextButton.Activated)) do
        v.Function()
    end
    game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("CommF_"):InvokeServer("SetTeam",Team)
end

local function AddVelocity()
    pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
        end
        if not (game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyGyrozz")) then
            local L_1 = Instance.new("BodyVelocity")
            L_1.Name = "BodyGyrozz"
            L_1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            L_1.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
            L_1.Velocity=Vector3.new(0,0,0)
        end
    end)
end

local function AutoRejoin()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)
end

function HopServer(page)
    local placeid = game.PlaceId
    local next_page = ""
    local servers = nil
    if next_page == "" then
        servers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeid .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        servers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeid .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. next_page))
    end
    next_page = servers.nextPageCursor
    local check = false
    for _, value in pairs(servers.data) do
        if value.maxPlayers > value.playing then
            check = true
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeid, value.id, game.Players.LocalPlayer)
            wait(1)
        end
    end
    if not check and next_page and next_page ~= "" and next_page ~= nil then
        HopServer(next_page)
    elseif not check or not next_page or next_page == "" or next_page == nil then
        HopServer()
    end
end
AutoRejoin()
local chest = 0
local beli = game.Players.LocalPlayer.Data.Beli.Value
local checkfalse = 0
local havechest = true
spawn(function ()
    while wait() do
        local checkchest = false
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.find(v.Name, "Chest") then
                checkchest = true
                break
            end
        end
        if not checkchest then
            havechest = false
        end
        if not havechest then
            checkfalse = checkfalse + 1
            if checkfalse > 100 then
                HopServer()
                break
            end
            havechest = true
        elseif havechest then
            checkfalse = 0
        end
    end
end)
while wait() do
    pcall(function()
        AddVelocity()
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.find(v.Name, "Chest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = v.Position
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
                pcall(function()
                    fireclickdetector(v)
                end)
                local newbeli = game.Players.LocalPlayer.Data.Beli.Value
                if newbeli > beli then
                    chest = chest + 1
                    beli = newbeli
                end
                if chest % 10 == 0 and chest ~= 0 then
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    repeat wait(2)
                    until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                    AddVelocity()
                    chest = 0
                end
            end
        end
    end)
end
