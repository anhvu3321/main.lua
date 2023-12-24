-- Load
if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end
-- Join Team
if getgenv().Team ~= "Pirates" and getgenv().Team ~= "Marines" then
    getgenv().Team = "Pirates"
end
if game:GetService("Players").LocalPlayer.Team == nil then
    local Button = game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[getgenv().Team].Frame.TextButton
    for i,v in pairs(getconnections(Button.Activated)) do
        v.Function()
    end
end
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
OrionLib:MakeNotification({
    Name = "Status",
    Content = "V1.0.7",
    Image = "rbxassetid://4483345998",
    Time = 5
})
-- Variables
local CFrame_Mobs = {
    ["Bandit"] = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125),
    ["Monkey"] = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209),
    ["Gorilla"] = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875),
    ["Pirate"] = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125),
    ["Brute"] = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875),
    ["Desert Bandit"] = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375),
    ["Desert Officer"] = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875),
    ["Snow Bandit"] = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125),
    ["Snowman"] = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625),
    ["Chief Petty Officer"] = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625),
    ["Sky Bandit"] = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625),
    ["Dark Master"] = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625),
    ["Prisoner"] = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781),
    ["Dangerous Prisoner"] = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375),
    ["Toga Warrior"] = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625),
    ["Gladiator"] = {CFrame.new(-1483, 36, -3188), CFrame.new(-1282, 36, -3059), CFrame.new(-1380, 36, -3405), CFrame.new(-1104, 36, -3260)},
    ["Military Soldier"] = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875),
    ["Military Spy"] = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375),
    ["Fishman Warrior"] = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625),
    ["Fishman Commando"] = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875),
    ["God's Guard"] = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375),
    ["Shanda"] = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531),
    ["Royal Squad"] = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875),
    ["Royal Soldier"] = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625),
    ["Galley Pirate"] = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875),
    ["Galley Captain"] = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375),
    ["Raider"] = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125),
    ["Mercenary"] = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625),
    ["Swan Pirate"] = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625),
    ["Factory Staff"] = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875),
    ["Marine Lieutenant"] = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125),
    ["Marine Captain"] = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625),
    ["Zombie"] = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875),
    ["Vampire"] = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625),
    ["Snow Trooper"] = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875),
    ["Winter Warrior"] = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625),
    ["Lab Subordinate"] = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375),
    ["Horned Warrior"] = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375),
    ["Magma Ninja"] = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375),
    ["Lava Pirate"] = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875),
    ["Ship Deckhand"] = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375),
    ["Ship Engineer"] = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875),
    ["Ship Steward"] = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625),
    ["Ship Officer"] = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625),
    ["Arctic Warrior"] = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125),
    ["Snow Lurker"] = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375),
    ["Sea Soldier"] = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125),
    ["Water Fighter"] = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875),
    ["Pirate Millionaire"] = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375),
    ["Pistol Billionaire"] = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875),
    ["Dragon Crew Warrior"] = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625),
    ["Dragon Crew Archer"] = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125),
    ["Female Islander"] = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312),
    ["Giant Islander"] = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508),
    ["Marine Commodore"] = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125),
    ["Marine Rear Admiral"] = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125),
    ["Fishman Raider"] = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625),
    ["Fishman Captain"] = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625),
    ["Forest Pirate"] = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625),
    ["Mythological Pirate"] = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125),
    ["Jungle Pirate"] = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625),
    ["Musketeer Pirate"] = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375),
    ["Reborn Skeleton"] = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625),
    ["Living Zombie"] = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875),
    ["Demonic Soul"] = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625),
    ["Posessed Mummy"] = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625),
    ["Peanut Scout"] = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875),
    ["Peanut President"] = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875),
    ["Ice Cream Chef"] = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125),
    ["Ice Cream Commander"] = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625),
    ["Cookie Crafter"] = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375),
    ["Cake Guard"] = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875),
    ["Baking Staff"] = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375),
    ["Head Baker"] = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125),
    ["Cocoa Warrior"] = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125),
    ["Chocolate Bar Battler"] = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375),
    ["Sweet Thief"] = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625),
    ["Candy Rebel"] = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625),
    ["Candy Pirate"] = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875),
    ["Isle Outlaw"] = CFrame.new(-16479.900390625, 226.6117401123047, -300.3114318847656),
    ["Island Boy"] = CFrame.new(-16849.396484375, 192.86505126953125, -150.7853240966797),
    ["Sun-kissed Warrior"] = CFrame.new(-16347, 64, 984),
    ["Isle Champion"] = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875)
}
local Priority = {
    ["Auto Farm Level"] = 1,
    ["Auto Farm Boss"] = 2,
    ["Auto Bring Fruit"] = 3
}
local Islands = {}
local W = false
local W2 = false
local W3 = false
local Tween = nil
local Stop_Tween = false
local plr = game:GetService("Players").LocalPlayer
local CbFw = getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
local Request_Places = {}
local Auto_Farm_Level_Toggle = nil
local Anti_AFK_Connection = nil
local Auto_Rejoin_Connection = nil
local Quest_Done = 0
local Auto_Farm_Boss_Toggle = nil
getgenv().Auto_Farm_Boss = false
getgenv().Auto_Farm_Boss_Hop = false
getgenv().Weapon_Type = nil
getgenv().Weapon = nil
getgenv().Bring_Mob = true
getgenv().Auto_Farm_Level = false
getgenv().Anti_AFK = false
getgenv().Auto_Rejoin = false
getgenv().Max_Players = 1
getgenv().Melee_Stats = false
getgenv().Defense_Stats = false
getgenv().Sword_Stats = false
getgenv().Gun_Stats = false
getgenv().Fruit_Stats = false
getgenv().Stat_Points = 1
getgenv().Auto_New_World = false
getgenv().Fruit_Auto_Third_Sea = nil
getgenv().Fruit_To_Snipe = nil
getgenv().Snipe_Fruit = false
getgenv().Auto_Buy_Random_Fruit = false
getgenv().Auto_Store_Fruit = false
getgenv().Auto_Buy_Bone = false
getgenv().Auto_Bring_Fruit_Hop = false
getgenv().Auto_Bring_Fruit = false
getgenv().Safe_Auto_Farm_Level = false
getgenv().Boss_To_Farm = nil

-- Settings
-- getgenv().Settings = {
--     ["Weapon Type"] = getgenv().Weapon_Type,
--     ["Bring Mob"] = getgenv().Bring_Mob,
--     ["Auto Farm Level"] = getgenv().Auto_Farm_Level,
--     ["Anti AFK"] = getgenv().Anti_AFK,
--     ["Auto Rejoin"] = getgenv().Auto_Rejoin,
--     ["Melee Stats"] = getgenv().Melee_Stats,
--     ["Defense Stats"] = getgenv().Defense_Stats,
--     ["Sword Stats"] = getgenv().Sword_Stats,
--     ["Gun Stats"] = getgenv().Gun_Stats,
--     ["Fruit Stats"] = getgenv().Fruit_Stats,
--     ["Stat Points"] = getgenv().Stat_Points,
--     ["Auto New World"] = getgenv().Auto_New_World,
--     ["Fruit To Snipe"] = getgenv().Fruit_To_Snipe,
--     ["Snipe Fruit"] = getgenv().Snipe_Fruit,
--     ["Auto Buy Random Fruit"] = getgenv().Auto_Buy_Random_Fruit,
--     ["Auto Store Fruit"] = getgenv().Auto_Store_Fruit,
--     ["Auto Buy Bone"] = getgenv().Auto_Buy_Bone,
--     ["Auto Bring Fruit Hop"] = getgenv().Auto_Bring_Fruit_Hop,
--     ["Auto Bring Fruit"] = getgenv().Auto_Bring_Fruit,
--     ["Safe Auto Farm Level"] = getgenv().Safe_Auto_Farm_Level,
--     ["Boss To Farm"] = getgenv().Boss_To_Farm,
--     ["Auto Farm Boss"] = getgenv().Auto_Farm_Boss,
--     ["Auto Farm Boss Hop"] = getgenv().Auto_Farm_Boss_Hop
-- }
-- local function SaveSettings()
--     getgenv().Settings = {
--         ["Weapon Type"] = getgenv().Weapon_Type,
--         ["Bring Mob"] = getgenv().Bring_Mob,
--         ["Auto Farm Level"] = getgenv().Auto_Farm_Level,
--         ["Anti AFK"] = getgenv().Anti_AFK,
--         ["Auto Rejoin"] = getgenv().Auto_Rejoin,
--         ["Melee Stats"] = getgenv().Melee_Stats,
--         ["Defense Stats"] = getgenv().Defense_Stats,
--         ["Sword Stats"] = getgenv().Sword_Stats,
--         ["Gun Stats"] = getgenv().Gun_Stats,
--         ["Fruit Stats"] = getgenv().Fruit_Stats,
--         ["Stat Points"] = getgenv().Stat_Points,
--         ["Auto New World"] = getgenv().Auto_New_World,
--         ["Fruit To Snipe"] = getgenv().Fruit_To_Snipe,
--         ["Snipe Fruit"] = getgenv().Snipe_Fruit,
--         ["Auto Buy Random Fruit"] = getgenv().Auto_Buy_Random_Fruit,
--         ["Auto Store Fruit"] = getgenv().Auto_Store_Fruit,
--         ["Auto Buy Bone"] = getgenv().Auto_Buy_Bone,
--         ["Auto Bring Fruit Hop"] = getgenv().Auto_Bring_Fruit_Hop,
--         ["Auto Bring Fruit"] = getgenv().Auto_Bring_Fruit,
--         ["Safe Auto Farm Level"] = getgenv().Safe_Auto_Farm_Level,
--         ["Boss To Farm"] = getgenv().Boss_To_Farm,
--         ["Auto Farm Boss"] = getgenv().Auto_Farm_Boss,
--         ["Auto Farm Boss Hop"] = getgenv().Auto_Farm_Boss_Hop
--     }
--     local jsonSettings = game:GetService("HttpService"):JSONEncode(getgenv().Settings)
--     if not isfolder("Xero Hub") then
--         makefolder("Xero Hub")
--     end
--     writefile("Xero Hub/Settings.json", jsonSettings)
-- end
-- local function LoadSettings()
--     if isfile("Xero Hub/Settings.json") then
--         getgenv().Settings = game:GetService("HttpService"):JSONDecode(readfile("Xero Hub/Settings.json"))
--         getgenv().Weapon_Type = getgenv().Settings["Weapon Type"] or nil
--         getgenv().Bring_Mob = getgenv().Settings["Bring Mob"] or true
--         getgenv().Auto_Farm_Level = getgenv().Settings["Auto Farm Level"] or false
--         getgenv().Anti_AFK = getgenv().Settings["Anti AFK"] or false
--         getgenv().Auto_Rejoin = getgenv().Settings["Auto Rejoin"] or false
--         getgenv().Melee_Stats = getgenv().Settings["Melee Stats"] or false
--         getgenv().Defense_Stats = getgenv().Settings["Defense Stats"] or false
--         getgenv().Sword_Stats = getgenv().Settings["Sword Stats"] or false
--         getgenv().Gun_Stats = getgenv().Settings["Gun Stats"] or false
--         getgenv().Fruit_Stats = getgenv().Settings["Fruit Stats"] or false
--         getgenv().Stat_Points = getgenv().Settings["Stat Points"] or 1
--         getgenv().Auto_New_World = getgenv().Settings["Auto New World"] or false
--         getgenv().Fruit_To_Snipe = getgenv().Settings["Fruit To Snipe"] or nil
--         getgenv().Snipe_Fruit = getgenv().Settings["Snipe Fruit"] or false
--         getgenv().Auto_Buy_Random_Fruit = getgenv().Settings["Auto Buy Random Fruit"] or false
--         getgenv().Auto_Store_Fruit = getgenv().Settings["Auto Store Fruit"] or false
--         getgenv().Auto_Buy_Bone = getgenv().Settings["Auto Buy Bone"] or false
--         getgenv().Auto_Bring_Fruit_Hop = getgenv().Settings["Auto Bring Fruit Hop"] or false
--         getgenv().Auto_Bring_Fruit = getgenv().Settings["Auto Bring Fruit"] or false
--         getgenv().Safe_Auto_Farm_Level = getgenv().Settings["Safe Auto Farm Level"] or false
--         getgenv().Boss_To_Farm = getgenv().Settings["Boss To Farm"] or nil
--         getgenv().Auto_Farm_Boss = getgenv().Settings["Auto Farm Boss"] or false
--         getgenv().Auto_Farm_Boss_Hop = getgenv().Settings["Auto Farm Boss Hop"] or false
--     end
-- end
-- LoadSettings()
-- spawn(function()
--     while wait() do
--         SaveSettings()
--     end
-- end)

-- Priority Queue
local PriorityQueue = {}
function PriorityQueue:new()
    local obj = {queue = {}}
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function PriorityQueue:push(element, priority)
    for i, task in ipairs(self.queue) do
        if task.element == element then
            return
        end
    end
    table.insert(self.queue, {element = element, priority = priority})
    table.sort(self.queue, function(a, b)
        return a.priority > b.priority
    end)
end
function PriorityQueue:pop(element)
    for i, task in ipairs(self.queue) do
        if task.element == element then
            return table.remove(self.queue, i)
        end
    end
end
function PriorityQueue:top()
    return self.queue[1] and self.queue[1].element
end
function PriorityQueue:empty()
    return #self.queue == 0
end
local queue = PriorityQueue:new()

-- Functions
local function UpdateWeapon()
    if getgenv().Weapon_Type ~= nil then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if getgenv().Weapon_Type == "Fruit" then
                    if string.find(v.ToolTip, getgenv().Weapon_Type) then
                        if v.Name == 'Ice-Ice' or v.Name == 'Light-Light' then
                            getgenv().Weapon = v.Name
                            return
                        else
                            OrionLib:MakeNotification({
                                Name = "Error",
                                Content = "Fruit must be either Ice or Light!",
                                Image = "rbxassetid://4483345998",
                                Time = 5
                            })
                        end
                    end
                else
                    if string.find(v.ToolTip, getgenv().Weapon_Type) then
                        getgenv().Weapon = v.Name
                        return
                    end
                end
            end
        end
    end
end
local function EquipWeapon(weapon)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(weapon) then
		local tool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(weapon)
		game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
local function AddVelocity()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Xero") then
        local body = Instance.new("BodyVelocity")
        body.Name = "Xero"
        body.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        body.MaxForce=Vector3.new(1000000000,1000000000,1000000000)
        body.Velocity=Vector3.new(0,0,0)
    end
end
local function RemoveVelocity()
    for _,v in pairs(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):GetChildren()) do
        if v.Name == "Xero" then
            v:Destroy()
        end
    end
end
local function CheckBossQuest()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    local NameBoss = nil
    local QuestBossNumber = nil
    local NameQuestBoss = nil
    local CFrameBoss = nil
    local CFrameQuestBoss = nil
    local LevelReqBoss = -999
    local Quests = require(game:GetService("ReplicatedStorage").Quests)
    local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
    local MaxLevelReqCurrentSea = -999
    if W then
        if Level < 20 then
            return nil, nil, nil, nil, nil, -999
        end
    end
    if W2 then
        if Level < 750 then
            return nil, nil, nil, nil, nil, -999
        end
    end
    if W3 then
        if Level < 1550 then
            return nil, nil, nil, nil, nil, -999
        end
    end
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] <= Level then
                for i2,v2 in pairs(v1["Task"]) do
                    if v2 == 1 then
                        LevelReqBoss = math.max(LevelReqBoss, v1["LevelReq"])
                    end
                end
            end
        end
    end
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] == LevelReqBoss then
                for i2,v2 in pairs(v1["Task"]) do
                    NameBoss = i2
                    QuestBossNumber = i1
                    NameQuestBoss = i
                end
            end
        end
    end
    for a,b in pairs(GuideModule["Data"]["NPCList"]) do
        for c,d in pairs(b["Levels"]) do
            if LevelReqBoss == d then
                CFrameQuestBoss = a["CFrame"]
            end
            MaxLevelReqCurrentSea = math.max(d, MaxLevelReqCurrentSea)
        end
    end
    if not CFrameBoss then
        pcall(function()
            CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(NameBoss).WorldPivot.Position) * CFrame.new(0, 30, 0)
        end)
    end
    if not CFrameBoss then
        pcall(function()
            CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild(NameBoss):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
        end)
    end
    if CFrameQuestBoss == nil then
        LevelReqBoss = -999
        CFrameBoss = nil
        for i,v in pairs(Quests) do
            for i1,v1 in pairs(v) do
                if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] <= MaxLevelReqCurrentSea then
                    for i2,v2 in pairs(v1["Task"]) do
                        if v2 == 1 then
                            LevelReqBoss = math.max(LevelReqBoss, v1["LevelReq"])
                        end
                    end
                end
            end
        end
        for i,v in pairs(Quests) do
            for i1,v1 in pairs(v) do
                if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] == LevelReqBoss then
                    for i2,v2 in pairs(v1["Task"]) do
                        NameBoss = i2
                        QuestBossNumber = i1
                        NameQuestBoss = i
                    end
                end
            end
        end
        for a,b in pairs(GuideModule["Data"]["NPCList"]) do
            for c,d in pairs(b["Levels"]) do
                if LevelReqBoss == d then
                    CFrameQuestBoss = a["CFrame"]
                end
            end
        end
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(NameBoss).WorldPivot.Position) * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild(NameBoss):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end)
        end
    end
    return NameQuestBoss, QuestBossNumber, CFrameQuestBoss, NameBoss, CFrameBoss, LevelReqBoss
end
local function CheckQuest()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    local NameMob = nil
    local QuestNumber = nil
    local NameQuest = nil
    local CFrameMon = nil
    local CFrameQuest = nil
    local LevelReq = -999
    local RNameMob = nil
    local Quests = require(game:GetService("ReplicatedStorage").Quests)
    local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
    local MaxLevelReqCurrentSea = -999
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] <= Level then
                for i2,v2 in pairs(v1["Task"]) do
                    if v2 ~= 1 then
                        LevelReq = math.max(LevelReq, v1["LevelReq"])
                    end
                end
            end
        end
    end
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] == LevelReq then
                for i2,v2 in pairs(v1["Task"]) do
                    RNameMob = i2 .. " [Lv. ".. v1["LevelReq"] .. "]"
                    NameMob = i2
                    QuestNumber = i1
                    NameQuest = i
                end
            end
        end
    end
    for a,b in pairs(GuideModule["Data"]["NPCList"]) do
        for c,d in pairs(b["Levels"]) do
            if LevelReq == d then
                CFrameQuest = a["CFrame"]
            end
            MaxLevelReqCurrentSea = math.max(d, MaxLevelReqCurrentSea)
        end
    end
    if not CFrameMon then
        pcall(function()
            CFrameMon = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(NameMob).WorldPivot.Position) * CFrame.new(0, 30, 0)
        end)
    end
    if not CFrameMon then
        pcall(function()
            CFrameMon = game:GetService("Workspace").Enemies:FindFirstChild(NameMob):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
        end)
    end
    if not CFrameMon then
        pcall(function()
            CFrameMon = game:GetService("Workspace")._WorldOrigin:FindFirstChild("EnemySpawns"):FindFirstChild(RNameMob).CFrame * CFrame.new(0, 30, 0)
        end)
    end
    if not CFrameMon then
        if NameMob == "Gladiator" then
            local List = CFrame_Mobs[NameMob]
            CFrameMon = List[math.random(1, #List)]
        else
            CFrameMon = CFrame_Mobs[NameMob]
        end
    end
    if CFrameQuest == nil then
        LevelReq = -999
        CFrameMon = nil
        for i,v in pairs(Quests) do
            for i1,v1 in pairs(v) do
                if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] <= MaxLevelReqCurrentSea then
                    for i2,v2 in pairs(v1["Task"]) do
                        if v2 ~= 1 then
                            LevelReq = math.max(LevelReq, v1["LevelReq"])
                        end
                    end
                end
            end
        end
        for i,v in pairs(Quests) do
            for i1,v1 in pairs(v) do
                if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] == LevelReq then
                    for i2,v2 in pairs(v1["Task"]) do
                        RNameMob = i2 .. " [Lv. ".. v1["LevelReq"] .. "]"
                        NameMob = i2
                        QuestNumber = i1
                        NameQuest = i
                    end
                end
            end
        end
        for a,b in pairs(GuideModule["Data"]["NPCList"]) do
            for c,d in pairs(b["Levels"]) do
                if LevelReq == d then
                    CFrameQuest = a["CFrame"]
                end
            end
        end
        if not CFrameMon then
            pcall(function()
                CFrameMon = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(NameMob).WorldPivot.Position) * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameMon then
            pcall(function()
                CFrameMon = game:GetService("Workspace").Enemies:FindFirstChild(NameMob):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameMon then
            pcall(function()
                CFrameMon = game:GetService("Workspace")._WorldOrigin:FindFirstChild("EnemySpawns"):FindFirstChild(RNameMob).CFrame * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameMon then
            if NameMob == "Gladiator" then
                local List = CFrame_Mobs[NameMob]
                CFrameMon = List[math.random(1, #List)]
            else
                CFrameMon = CFrame_Mobs[NameMob]
            end
        end
    end
    return NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq
end
local function CheckNearestRequestIsland(place)
    local min_distance = math.huge
    local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for request_place, cframe in pairs(Request_Places) do
        min_distance = math.min(min_distance, math.abs((place.Position - cframe.Position).Magnitude))
    end
    min_distance = math.min(min_distance, math.abs((place.Position - player.Position).Magnitude))
    for request_place, cframe in pairs(Request_Places) do
        if math.abs((place.Position - cframe.Position).Magnitude) == min_distance then
            return request_place
        end
    end
    return nil
end
local function NoClip()
    local character = game:GetService("Players").LocalPlayer.Character
    for _, v in pairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end
local function StopTween()
    Stop_Tween = true
    if Tween ~= nil then
        repeat wait()
            if Tween.PlaybackState == Enum.PlaybackState.Playing then
                Tween:Cancel()
            end
        until Tween.PlaybackState ~= Enum.PlaybackState.Playing
    end
    RemoveVelocity()
    Stop_Tween = false
end
local function tween(place, item)
    repeat wait()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
            AddVelocity()
        end
        local request_place = CheckNearestRequestIsland(place)
        if request_place ~= nil then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Request_Places[request_place].Position)
        end
        local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
        end
        AddVelocity()
        NoClip()
        local Distance = (place.Position - player.Position).Magnitude
        local speed = 300
        if Distance < 250 then
            speed = 5000
        elseif Distance < 500 then
            speed = 450
        elseif Distance < 1000 then
            speed = 350
        elseif Distance >= 1000 then
            speed = 300
        end
        local TweenService = game:GetService("TweenService")
        local start = player.Position
        local _end = place.Position
        local distance = (start - _end).Magnitude
        local _time = distance/(speed)
        local info = TweenInfo.new(
            _time,
            Enum.EasingStyle.Linear
        )
        Tween = TweenService:Create(player, info, {CFrame = place})
        Tween:Play()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
            AddVelocity()
        end
        if Stop_Tween then
            break
        end
        if item ~= nil then
            if item == "Third Sea" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(item) and not game:GetService("Players").LocalPlayer.Character:FindFirstChild(item) then
                StopTween()
                break
            end
        end
    until Distance <= 10
    RemoveVelocity()
end
local function GetCurrentBlade()
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game:GetService("Players").LocalPlayer.Character do ret=ret.Parent end
    return ret
end
local function AttackNoCD()
    local AC = CbFw2.activeController
    for i = 1, 1 do
        local bladehit = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                    AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                    game:GetService("ReplicatedStorage").Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                end
            end)
        end
    end
end
local function AutoBuso()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
local function BringMob(PosMon, NameMon)
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == NameMon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v:FindFirstChild("HumanoidRootPart").Position - PosMon.Position).Magnitude <= 1000 then
            sethiddenproperty(game:GetService("Players").LocalPlayer, "MaximumSimulationRadius",  math.huge)
            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",  9e20)
            if v:FindFirstChild("Humanoid"):FindFirstChild("Animator") then
                v:FindFirstChild("Humanoid").Animator:Destroy()
            end
            v:FindFirstChild("Humanoid"):ChangeState(11)
            v:FindFirstChild("Humanoid").JumpPower = 0
            v:FindFirstChild("Humanoid").WalkSpeed = 0
            v:FindFirstChild("HumanoidRootPart").CanCollide = false
            v:FindFirstChild("HumanoidRootPart").CFrame = PosMon
        end
    end
end
local function AutoSecondSea()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        return
    end
    if game:GetService("Workspace").Map.Ice.Door.CanCollide == true and game:GetService("Workspace").Map.Ice.Door.Transparency == 0 then
        repeat wait()
            tween(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            AddVelocity()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
            EquipWeapon("Key")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            tween(CFrame.new(1347.7124, 37.3751602, -1325.6488), "Key")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            AddVelocity()
            wait(3)
        until game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1
    end
    if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
        local CFrameBoss = nil
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").WorldPivot.Position) * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral"):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end)
        end
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Boss not found. Server hoping...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            HopServer()
        else
            tween(CFrameBoss * CFrame.new(0, 30, 0))
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            AddVelocity()
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Ice Admiral" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    repeat wait(0.03)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                            return
                        end
                        UpdateWeapon()
                        AutoBuso()
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                        AddVelocity()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        end
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
local function AutoThirdSea()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        return
    end
    if not game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess then
        if getgenv().Fruit_Auto_Third_Sea == nil then
            OrionLib:MakeNotification({
                Name = "Error!",
                Content = "Select a fruit first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            return
        end
        tween(CFrame.new(-336.312, 331.986, 646.689))
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            return
        end
        AddVelocity()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", getgenv().Fruit_Auto_Third_Sea)
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            return
        end
        local fruit = nil
        for a, b in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if string.match(b.Name, "Fruit$") then
                local name = b.Name:match("(%S+)")
                fruit = name.. "-" ..name
            end
        end
        for a, b in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if string.match(b.Name, "Fruit$") then
                local name = b.Name:match("(%S+)")
                fruit = name.. "-" ..name
            end
        end
        if not fruit then
            OrionLib:MakeNotification({
                Name = "Error!",
                Content = "Fruit not found!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            return
        end
        EquipWeapon(fruit)
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            return
        end
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
        wait(1)
    end
    if not game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") then
        local CFrameBoss = nil
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan").WorldPivot.Position) * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild("Don Swan"):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end)
        end
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Boss not found. Server hoping...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            HopServer()
        else
            tween(CFrameBoss * CFrame.new(0, 30, 0))
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            AddVelocity()
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Don Swan" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    repeat wait(0.03)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                            return
                        end
                        UpdateWeapon()
                        AutoBuso()
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                        AddVelocity()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        end
    end
    tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        return
    end
    AddVelocity()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        return
    end
    wait(3)
    local CFrameBoss = nil
    if not CFrameBoss then
        pcall(function()
            CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra").WorldPivot.Position) * CFrame.new(0, 30, 0)
        end)
    end
    if not CFrameBoss then
        pcall(function()
            CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra"):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
        end)
    end
    if CFrameBoss == nil then
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Boss not found. Server hoping...",
            Image = "rbxassetid://4483345998",
            Time = 1
        })
        HopServer()
    else
        tween(CFrameBoss * CFrame.new(0, 30, 0))
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            return
        end
        AddVelocity()
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "rip_indra" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                repeat wait(0.03)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    UpdateWeapon()
                    AutoBuso()
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), "Third Sea")
                    AddVelocity()
                    EquipWeapon(getgenv().Weapon)
                    AttackNoCD()
                until v:FindFirstChild("Humanoid").Health <= 0
            end
        end
    end
end
local function AutoFarmLevel()
    if not queue:empty() and queue:top() == "Auto Farm Level" and getgenv().Weapon ~= nil then
        pcall(function()
            local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
            if Level >= 700 and W and getgenv().Auto_New_World then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                wait(1)
                AutoSecondSea()
            elseif Level >= 1500 and W2 and getgenv().Auto_New_World then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                wait(1)
                AutoThirdSea()
            end
            local NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq = CheckQuest()
            local NameQuestBoss, QuestBossNumber, CFrameQuestBoss, NameBoss, CFrameBoss, LevelReqBoss = CheckBossQuest()
            if LevelReqBoss > LevelReq and CFrameBoss ~= nil then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameBoss, 1, true) then
                    tween(CFrameQuestBoss)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    AddVelocity()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestBossNumber)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    tween(CFrameBoss * CFrame.new(0, 30, 0))
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    AddVelocity()
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == NameBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                            repeat wait(0.03)
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                    repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                    AddVelocity()
                                end
                                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                    return
                                end
                                UpdateWeapon()
                                AutoBuso()
                                tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                                AddVelocity()
                                EquipWeapon(getgenv().Weapon)
                                AttackNoCD()
                            until v:FindFirstChild("Humanoid").Health <= 0
                        end
                    end
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    return
                end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if not game:GetService("Workspace").Enemies:FindFirstChild(NameMob) then
                tween(CFrameMon)
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    return
                end
                AddVelocity()
            end
            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameMob, 1, true) then
                tween(CFrameQuest)
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    return
                end
                AddVelocity()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestNumber)
            end
            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                    repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                    AddVelocity()
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    return
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameMob, 1, true) then
                    NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq = CheckQuest()
                    NameQuestBoss, QuestBossNumber, CFrameQuestBoss, NameBoss, CFrameBoss, LevelReqBoss = CheckBossQuest()
                    if LevelReqBoss > LevelReq and CFrameBoss ~= nil then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameBoss, 1, true) then
                            tween(CFrameQuestBoss)
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                return
                            end
                            AddVelocity()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestBossNumber)
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                return
                            end
                            tween(CFrameBoss * CFrame.new(0, 30, 0))
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                return
                            end
                            AddVelocity()
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == NameBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                                    repeat wait(0.03)
                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                            AddVelocity()
                                        end
                                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                            return
                                        end
                                        UpdateWeapon()
                                        AutoBuso()
                                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                                        AddVelocity()
                                        EquipWeapon(getgenv().Weapon)
                                        AttackNoCD()
                                    until v:FindFirstChild("Humanoid").Health <= 0
                                end
                            end
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                            return
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    tween(CFrameQuest)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    AddVelocity()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestNumber)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    tween(CFrameMon)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        return
                    end
                    AddVelocity()
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    return
                end
                if v.Name == NameMob and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if getgenv().Bring_Mob then
                        local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                        BringMob(PosMon, NameMob)
                    end
                    repeat wait(0.1)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                            return
                        end
                        UpdateWeapon()
                        AutoBuso()
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                        AddVelocity()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        end)
    elseif not queue:empty() and queue:top() == "Auto Farm Level" and getgenv().Weapon == nil then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Weapon not selected!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Level_Toggle:Set(false)
        getgenv().Auto_Farm_Level = false
    end
end
local function AntiReset()
    assert(getrawmetatable)
    local grm = getrawmetatable(game)
    setreadonly(grm, false)
    local old = grm.__namecall
    grm.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return
        elseif tostring(args[1]) == "BR_KICKMOBILE" then
            return
        end
        return old(self, ...)
    end)
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetChildren()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
end
local function AntiAFK()
    if getgenv().Anti_AFK then
        Anti_AFK_Connection = game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(.5)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    else
        if Anti_AFK_Connection ~= nil then
            Anti_AFK_Connection:Disconnect()
            Anti_AFK_Connection = nil
        end
    end
end
local function AutoRejoin()
    if getgenv().Auto_Rejoin then
        Auto_Rejoin_Connection = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end)
    else
        if Auto_Rejoin_Connection ~= nil then
            Auto_Rejoin_Connection:Disconnect()
            Auto_Rejoin_Connection = nil
        end
    end
end
local function HopServer(page)
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
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Server has " .. value.playing .. " player(s).",
            Image = "rbxassetid://4483345998",
            Time = 1
        })
        if value.maxPlayers > value.playing then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found server with " .. value.playing .. " player(s). Teleporting...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            check = true
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeid, value.id, game:GetService("Players").LocalPlayer)
            wait(1)
        end
    end
    if not check and next_page and next_page ~= "" and next_page ~= nil then
        HopServer(next_page)
    elseif not check or not next_page or next_page == "" or next_page == nil then
        HopServer()
    end
end
local function HopLowServer(max_players, page)
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
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Server has " .. value.playing .. " player(s).",
            Image = "rbxassetid://4483345998",
            Time = 1
        })
        if value.maxPlayers > value.playing and max_players >= value.playing then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found server with " .. value.playing .. " player(s). Teleporting...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            check = true
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeid, value.id, game:GetService("Players").LocalPlayer)
            wait(1)
        end
    end
    if not check and next_page and next_page ~= "" and next_page ~= nil then
        HopLowServer(max_players, next_page)
    elseif not check or not next_page or next_page == "" or next_page == nil then
        HopLowServer(max_players)
    end
end
local function AddStats()
    if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
        if getgenv().Melee_Stats == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", getgenv().Stat_Points)
        end
        if getgenv().Defense_Stats == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", getgenv().Stat_Points)
        end
        if getgenv().Sword_Stats == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", getgenv().Stat_Points)
        end
        if getgenv().Gun_Stats == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", getgenv().Stat_Points)
        end
        if getgenv().Fruit_Stats == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", getgenv().Stat_Points)
        end
    end
end
local function BuyRandomFruit()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end
local function SnipeFruit(fruit)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",fruit)
end
local function CanStoreFruit(fruit)
    local Max_Fruit_Cap = game:GetService("Players").LocalPlayer.Data.FruitCap.Value
    local Fruit_Storage = 0
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        if v.Name == fruit then
            Fruit_Storage = Fruit_Storage + 1
        end
    end
    if Fruit_Storage < Max_Fruit_Cap then
        return true
    end
    return false
end
local function StoreFruit()
    for a, b in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if string.match(b.Name, "Fruit$") then
            local name = b.Name:match("(%S+)")
            local fruit = name.. "-" ..name
            if CanStoreFruit(fruit) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", fruit, game:GetService("Players").LocalPlayer.Character:FindFirstChild(b.Name) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(b.Name))
            end
        end
    end
    for a, b in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if string.match(b.Name, "Fruit$") then
            local name = b.Name:match("(%S+)")
            local fruit = name.. "-" ..name
            if CanStoreFruit(fruit) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", fruit, game:GetService("Players").LocalPlayer.Character:FindFirstChild(b.Name) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(b.Name))
            end
        end
    end
end
local function BuyBone()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
end
local function CheckFruit()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Fruit") then
            return true
        end
    end
    return false
end
local function BringFruit()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Fruit") then
            if v:IsA("Tool") then
                v.Handle.CFrame = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0)
                wait(0.3)
                firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v.Handle,0)
            else
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Handle.CFrame
                firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v.Handle,0)
            end
        end
    end
end
local function SafeAutoFarmLevel()
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
        if v:IsA("TextLabel") and v.Name == "NotificationTemplate" then
            if string.find(v.Text, "QUEST COMPLETED") then
                v:Destroy()
                Quest_Done = Quest_Done + 1
                if Quest_Done >= 20 then
                    if getgenv().Safe_Auto_Farm_Level then
                        OrionLib:MakeNotification({
                            Name = "Status",
                            Content = "Done " .. Quest_Done .. " quests. Server hoping...",
                            Image = "rbxassetid://4483345998",
                            Time = 1
                        })
                        HopServer()
                    end
                end
            end
        end
    end
end
local function AutoFarmBoss(boss)
    if not queue:empty() and queue:top() == "Auto Farm Boss" then
        local CFrameBoss = nil
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(boss).WorldPivot.Position) * CFrame.new(0, 30, 0)
            end)
        end
        if not CFrameBoss then
            pcall(function()
                CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild(boss):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end)
        end
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Boss not found!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            return
        end
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Boss found!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        tween(CFrameBoss * CFrame.new(0, 30, 0))
        if queue:empty() or queue:top() ~= "Auto Farm Boss" then
            return
        end
        AddVelocity()
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Tween Done!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            print(v.Name)
            if v.Name == boss and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                OrionLib:MakeNotification({
                    Name = "Status",
                    Content = "Attempt to kill boss",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
                repeat wait(0.03)
                    OrionLib:MakeNotification({
                        Name = "Status",
                        Content = "Killing boss",
                        Image = "rbxassetid://4483345998",
                        Time = 1
                    })
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if queue:empty() or queue:top() ~= "Auto Farm Boss" then
                        return
                    end
                    UpdateWeapon()
                    AutoBuso()
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0))
                    AddVelocity()
                    EquipWeapon(getgenv().Weapon)
                    AttackNoCD()
                until v:FindFirstChild("Humanoid").Health <= 0
            end
        end
    end
end

-- Check Sea
if game.PlaceId == 2753915549 then
    W = true
    Request_Places = {
        ["Whirl Pool"] = CFrame.new(3864.6884765625, 6.736950397491455, -1926.214111328125),
        ["Sky Area 1"] = CFrame.new(-4607.82275, 872.54248, -1667.55688),
        ["Sky Area 2"] = CFrame.new(-7894.61767578125, 5547.1416015625, -380.29119873046875),
        ["Fish Man"] = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
    }
    Islands = {
        ["Wind Mill"] = CFrame.new(1027.58875, 16.4154949, 1367.28564),
        ["Town"] = CFrame.new(-529.4104, 7.8525033, 1604.88416),
        ["Jungle"] = CFrame.new(-1255.14795, 11.8520432, 349.906677), 
        ["Pirate"] = CFrame.new(-1120.14856, 4.7520504, 3855.31763),
        ["Mob boss"] = CFrame.new(Vector3.new(-2837.60669, 7.39224672, 5321.62109)),
        ["Desert"] = CFrame.new(Vector3.new(1094.15, 6.43846, 4192.89)),
        ["Marine Base"] = CFrame.new(Vector3.new(-4810.17, 20.7623, 4355.83)),
        ["Sky"] = CFrame.new(Vector3.new(-4897.01, 717.686, -2624.6)),
        ["Prison"] = CFrame.new(Vector3.new(4880.64, 5.65229, 737.439)),
        ["Fountain"] = CFrame.new(Vector3.new(5227.1, 38.5011, 4077.84)),
        ["Sky Area 2"] = CFrame.new(-7894.61767578125, 5547.1416015625, -380.29119873046875),
        ["Whirl Pool"] = CFrame.new(3864.6884765625, 6.736950397491455, -1926.214111328125),
        ["Sky Area 1"] = CFrame.new(-4607.82275, 872.54248, -1667.55688),
        ["Magma"] = CFrame.new(Vector3.new(-5352.62, 8.59067, 8466.86)),
        ["Ice"] = CFrame.new(Vector3.new(1342.66, 87.2728, -1358.63)),
        ["Marine Start"] = CFrame.new(Vector3.new(-2756.49, 24.4388, 2109.86)),
        ["Colosseum"] = CFrame.new(Vector3.new(-1482.86, 7.38934, -2940.23)),
        ["Fish Man"] = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
    }
elseif game.PlaceId == 4442272183 then
    W2 = true
    Request_Places = {
        ["Swan's room"] = CFrame.new(2284.912109375, 15.152046203613281, 905.48291015625),
        ["Mansion"] = CFrame.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        ["Ghost Ship"] = CFrame.new(923.21252441406, 126.9760055542, 32852.83203125),
        ["Ghost Ship Entrance"] = CFrame.new(-6508.5581054688, 89.034996032715, -132.83953857422)
    }
    Islands = {
        ["Dock"] = CFrame.new(-12.519311904907, 19.302536010742, 2827.853515625),
        ["Swan Mansion"] = CFrame.new(-390.34829711914, 321.89730834961, 869.00506591797),
        ["Kingdom Of Rose"] = CFrame.new(-388.29895019531, 138.35575866699, 1132.1662597656),
        ["Cafe"] = CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813),
        ["Colossuem"] = CFrame.new(-1871.8974609375, 45.820514678955, 1359.6843261719),
        ["Factory"] = CFrame.new(349.53750610352, 74.446998596191, -355.62420654297),
        ["The Bridge"] = CFrame.new(-1860.6354980469, 88.384948730469, -1859.1593017578),
        ["Green Bit"] = CFrame.new(-2202.3706054688, 73.097663879395, -2819.2687988281),
        ["Graveyard"] = CFrame.new(-5617.5927734375, 492.22183227539, -778.3017578125),
        ["Dark Area"] = CFrame.new(3464.7700195313, 13.375151634216, -3368.90234375),
        ["Snow Mountain"] = CFrame.new(561.23834228516, 401.44781494141, -5297.14453125),
        ["Hot Island"] = CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875),
        ["Cold Island"] = CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375),
        ["Ice Castle"] = CFrame.new(6111.7109375, 294.41259765625, -6716.4829101563),
        ["Usopp's Island"] = CFrame.new(4760.4985351563, 8.3444719314575, 2849.2426757813),
        ["Inscription Island"] = CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531),
        ["Forgotten Island"] = CFrame.new(-3051.9514160156, 238.87203979492, -10250.807617188),
        ["Ghost Ship"] = CFrame.new(923.21252441406, 126.9760055542, 32852.83203125),
        ["Mini Sky"] = CFrame.new(-262.11901855469, 49325.69140625, -35272.49609375)
    }
elseif game.PlaceId == 7449423635 then
    W3 = true
    Request_Places = {
        ["Castle on the sea"] = CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375),
        ["Mansion"] = CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375),
        ["Hydra Island"] = CFrame.new(5753.5478515625, 610.7880859375, -282.33172607421875),
        ["Temple Of Time"] = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875),
        ["Beautiful Pirate Entrance"] = CFrame.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
        ["Beautiful Pirate Place"] = CFrame.new(5314.58203125, 25.419387817382812, -125.94227600097656)
    }
    Islands = {
        ["Port Town"] = CFrame.new(-275.21615600586, 43.755737304688, 5451.0659179688),
        ["Hydra Island"] = CFrame.new(5541.2685546875, 668.30456542969, 195.48069763184),
        ["Giant Tree"] = CFrame.new(2276.0859375, 25.87850189209, -6493.03125),
        ["Zou Island"] = CFrame.new(-10034.40234375, 331.78845214844, -8319.6923828125),
        ["Pineapple Village"] = CFrame.new(-11172.950195313, 331.8049621582, -10151.033203125),
        ["Mansion"] = CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375),
        ["Castle on the sea"] = CFrame.new(-5498.0458984375, 313.79473876953, -2860.6022949219),
        ["Haunted Castle"] = CFrame.new(-9515.07324, 142.130615, 5537.58398),
        ["Ice Cream Island"] = CFrame.new(-691.829, 371.943, -11106.4),
        ["Sea of treats"] = CFrame.new(-2073.262451171875, 37.16134262084961, -10183.3271484375),
        ["Cake Loaf"] = CFrame.new(-2099.33, 66.9971, -12128.6),
        ["Isle Outpost"] = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625),
        ["Mini Sky"] = CFrame.new(-262.11901855469, 49325.69140625, -35272.49609375)
    }
end
AntiReset()
-- UI
local Window = OrionLib:MakeWindow({
    Name = "Xero Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Xero Hub"
})
-- Main
local Main = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Main:AddDropdown({
	Name = "Select Weapon",
	Default = getgenv().Weapon_Type,
	Options = {"Melee", "Sword", "Fruit"},
	Callback = function(Value)
        getgenv().Weapon_Type = Value
        UpdateWeapon()
	end
})
Main:AddToggle({
    Name = "Anti AFK",
	Default = getgenv().Anti_AFK,
	Callback = function(Value)
		getgenv().Anti_AFK = Value
        AntiAFK()
	end
})
Main:AddToggle({
    Name = "Auto Rejoin On Kick",
	Default = getgenv().Auto_Rejoin,
	Callback = function(Value)
		getgenv().Auto_Rejoin = Value
        AutoRejoin()
	end
})
-- Auto Farm
local AutoFarm = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
AutoFarm:AddToggle({
    Name = "Bring Mob",
    Default = getgenv().Bring_Mob,
    Callback = function(Value)
        getgenv().Bring_Mob = Value
    end
})
Auto_Farm_Level_Toggle = AutoFarm:AddToggle({
    Name = "Auto Farm Level",
    Default = getgenv().Auto_Farm_Level,
    Callback = function(Value)
        getgenv().Auto_Farm_Level = Value
        StopTween()
    end
})
AutoFarm:AddToggle({
    Name = "Safe Auto Farm Level",
    Default = getgenv().Safe_Auto_Farm_Level,
    Callback = function(Value)
        getgenv().Safe_Auto_Farm_Level = Value
    end
})
local Boss_List = {}
local Select_Boss = AutoFarm:AddDropdown({
    Name = "Select Boss",
    Default = getgenv().Boss_To_Farm,
    Options = Boss_List,
    Callback = function(Value)
        getgenv().Boss_To_Farm = Value
        StopTween()
    end
})
AutoFarm:AddButton({
    Name = "Refresh Boss",
    Callback = function()
        Boss_List = {}
        local Quests = require(game:GetService("ReplicatedStorage").Quests)
        for i,v in pairs(Quests) do
            for i1,v1 in pairs(v) do
                for i2,v2 in pairs(v1["Task"]) do
                    if v2 == 1 then
                        local CFrameBoss = nil
                        if not CFrameBoss then
                            pcall(function()
                                CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(i2).WorldPivot.Position) * CFrame.new(0, 30, 0)
                            end)
                        end
                        if not CFrameBoss then
                            pcall(function()
                                CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild(i2):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
                            end)
                        end
                        if CFrameBoss ~= nil then
                            table.insert(Boss_List, i2)
                        end
                    end
                end
            end
        end
        Select_Boss:Refresh(Boss_List, true)
    end
})
Auto_Farm_Boss_Toggle = AutoFarm:AddToggle({
    Name = "Auto Farm Boss",
    Default = getgenv().Auto_Farm_Boss,
    Callback = function(Value)
        getgenv().Auto_Farm_Boss = Value
        StopTween()
    end
})
AutoFarm:AddToggle({
	Name = "Auto Farm Boss Hop Server",
	Default = getgenv().Auto_Farm_Boss_Hop,
	Callback = function(Value)
		getgenv().Auto_Farm_Boss_Hop = Value
	end
})
if not W3 then
    AutoFarm:AddToggle({
        Name = "Auto New World (Turn on with Auto Farm)",
        Default = getgenv().Auto_New_World,
        Callback = function(Value)
            getgenv().Auto_New_World = Value
        end
    })
    if W2 then
        local Fruit_List = {}
        local Select_Fruit = AutoFarm:AddDropdown({
            Name = "Select Fruit for Auto Third Sea",
            Default = nil,
            Options = Fruit_List,
            Callback = function(Value)
                getgenv().Fruit_Auto_Third_Sea = Value
            end
        })
        AutoFarm:AddButton({
            Name = "Refresh Fruit",
            Callback = function()
                Fruit_List = {}
                for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
                    if v.Price >= 1000000 then
                        table.insert(Fruit_List, v.Name)
                    end
                end
                Select_Fruit:Refresh(Fruit_List, true)
            end
        })
    end
end
-- Teleport
local Teleport = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
if W then
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = {"Wind Mill", "Town" , "Jungle" , "Pirate", "Mob boss", "Desert", "Marine Base", "Sky", "Prison", "Fountain", "Sky Area 2", "Whirl Pool", "Sky Area 1", "Magma", "Ice", "Marine Start", "Colosseum", "Fish Man"},
        Callback = function(Value)
            StopTween()
            tween(Islands[Value])
        end
    })
elseif W2 then
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = { "Dock" , "Swan Mansion" , "Kingdom Of Rose" , "Cafe" , "Colossuem" , "Factory" , "The Bridge" , "Green Bit" , "Graveyard" , "Dark Area" , "Snow Mountain" , "Hot Island" , "Cold Island" , "Ice Castle" , "Usopp's Island" , "Inscription Island" , "Forgotten Island" , "Ghost Ship" , "Mini Sky"},
        Callback = function(Value)
            StopTween()
            tween(Islands[Value])
        end
    })
elseif W3 then
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = { "Mini Sky" , "Port Town" , "Hydra Island" , "Giant Tree" , "Zou Island" , "Pineapple Village" , "Mansion" , "Castle on the sea" , "Haunted Castle" , "Ice Cream Island" , "Sea of treats" , "Cake Loaf", "Isle Outpost"},
        Callback = function(Value)
            StopTween()
            tween(Islands[Value])
        end
    })
end
Teleport:AddButton({
	Name = "Stop Tween",
	Callback = function()
        StopTween()
  	end
})
if not W then
    Teleport:AddButton({
        Name = "Teleport to First Sea",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end
    })
end
if not W2 then
    Teleport:AddButton({
        Name = "Teleport to Second Sea",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    })
end
if not W3 then
    Teleport:AddButton({
        Name = "Teleport to Third Sea",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
    })
end
Teleport:AddButton({
	Name = "Rejoin Server",
	Callback = function()
        game:GetService('TeleportService'):Teleport(game.PlaceId)
  	end
})
Teleport:AddSlider({
	Name = "Max players for hop low server",
	Min = 1,
	Max = 11,
	Default = getgenv().Max_Players,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		getgenv().Max_Players = Value
	end
})
Teleport:AddButton({
	Name = "Hop Server",
	Callback = function()
        HopServer()
  	end
})
Teleport:AddButton({
	Name = "Hop Low Server",
	Callback = function()
        HopLowServer(getgenv().Max_Players)
  	end
})
-- Stats
local Stats = Window:MakeTab({
    Name = "Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Stats:AddToggle({
    Name = "Melee",
    Default = getgenv().Melee_Stats,
    Callback = function(Value)
        getgenv().Melee_Stats = Value
    end
})
Stats:AddToggle({
    Name = "Defense",
    Default = getgenv().Defense_Stats,
    Callback = function(Value)
        getgenv().Defense_Stats = Value
    end
})
Stats:AddToggle({
    Name = "Sword",
    Default = getgenv().Sword_Stats,
    Callback = function(Value)
        getgenv().Sword_Stats = Value
    end
})
Stats:AddToggle({
    Name = "Gun",
    Default = getgenv().Gun_Stats,
    Callback = function(Value)
        getgenv().Gun_Stats = Value
    end
})
Stats:AddToggle({
    Name = "Fruit",
    Default = getgenv().Fruit_Stats,
    Callback = function(Value)
        getgenv().Fruit_Stats = Value
    end
})
Stats:AddSlider({
	Name = "Points",
	Min = 1,
	Max = 100,
	Default = getgenv().Stat_Points,
	Color = Color3.fromRGB(255,255,255),
	Increment = 3,
	ValueName = "",
	Callback = function(Value)
		getgenv().Stat_Points = Value
	end
})
-- Fruit
local Fruit = Window:MakeTab({
    Name = "Fruit",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Fruit:AddDropdown({
	Name = "Select Fruit",
	Default = getgenv().Fruit_To_Snipe,
	Options = {"Kilo", "Spin", "Chop", "Spring", "Bomb", "Smoke", "Spike", "Flame", "Falcon", "Ice", "Sand", "Dark", "Revive", "Diamond", "Light", "Rubber", "Barrier", "Magma", "Quake", "Buddha", "Love", "Spider", "Phoenix", "Portal", "Rumble", "Paw", "Blizzard", "Gravity", "Dough", "Shadow", "Venom", "Control", "Spirit", "Dragon", "Leopard", "Kitsune"},
	Callback = function(Value)
		getgenv().Fruit_To_Snipe = tostring(Value).. "-" ..tostring(Value)
	end
})
Fruit:AddToggle({
	Name = "Snipe Fruit",
	Default = getgenv().Snipe_Fruit,
	Callback = function(Value)
		getgenv().Snipe_Fruit = Value
	end
})
Fruit:AddToggle({
	Name = "Auto Buy Random Fruit",
	Default = getgenv().Auto_Buy_Random_Fruit,
	Callback = function(Value)
		getgenv().Auto_Buy_Random_Fruit = Value
	end    
})
Fruit:AddToggle({
	Name = "Auto Store Fruit",
	Default = getgenv().Auto_Store_Fruit,
	Callback = function(Value)
		getgenv().Auto_Store_Fruit = Value
	end    
})
Fruit:AddToggle({
	Name = "Auto Bring Fruit",
	Default = getgenv().Auto_Bring_Fruit,
	Callback = function(Value)
		getgenv().Auto_Bring_Fruit = Value
        StopTween()
	end
})
Fruit:AddToggle({
	Name = "Auto Bring Fruit Hop Server",
	Default = getgenv().Auto_Bring_Fruit_Hop,
	Callback = function(Value)
		getgenv().Auto_Bring_Fruit_Hop = Value
	end
})
-- Shop
local Shop = Window:MakeTab({
    Name = "Shop",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Shop:AddDropdown({
	Name = "Sword",
	Default = nil,
	Options = {"Cutlass ($1.000)", "Dual Katana ($12.000)", "Katana ($1.000)", "Iron Mace ($25.000)", "Triple Katana ($60.000)", "Dual-Headed Blade ($400.000)", "Pipe ($100.000)", "Soul Cane ($750.000)", "Bisento ($1.000.000)"},
	Callback = function(Value)
        local item = string.sub(Value, 1, string.find(Value, "%(") - 2):gsub("^%s*(.-)%s*$", "%1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem",item)
	end    
})
Shop:AddDropdown({
	Name = "Gun",
	Default = nil,
	Options = {"Slingshot ($5.000)", "Flintlock ($10.500)", "Musket ($8.000)", "Cannon ($100.000)", "Refined Flintlock ($65.000)", "Refined Slingshot ($30.000)", "Kabucha (1.500F)"},
	Callback = function(Value)
        local item = string.sub(Value, 1, string.find(Value, "%(") - 2):gsub("^%s*(.-)%s*$", "%1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem",item)
	end    
})
Shop:AddDropdown({
	Name = "Melee",
	Default = nil,
	Options = {"Black Leg ($150.000)", "Electro ($500.000)", "Fishman Karate ($750.000)", "Dragon Breath (1500F)", "Superhuman ($3.000.000)", "Death Step ($2.500.000 & 5.000F)", "Electric Claw ($3.000.000 & 5.000F)", "Sharkman Karate ($2.500.000 & 5.000F)", "Dragon Talon ($3.000.000 & 5.000F)", "Godhuman ($5.000.000 & 5.000F)"},
	Callback = function(Value)
        if Value == "Dragon Breath (1500F)" then
            local args = {
                [1] = "BlackbeardReward",
                [2] = "DragonClaw",
                [3] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else
            local item = string.sub(Value, 1, string.find(Value, "%(") - 2):gsub("^%s*(.-)%s*$", "%1"):gsub(" ", "")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" ..item)
        end
	end    
})
Shop:AddButton({
	Name = "Buy Buso Haki ($25.000)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
  	end
})
Shop:AddButton({
	Name = "Buy Soru ($100.000)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
  	end
})
Shop:AddButton({
	Name = "Buy Geppo ($10.000)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
  	end
})
Shop:AddButton({
	Name = "Buy Ken Haki v1 ($750.000)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
  	end
})
Shop:AddToggle({
	Name = "Auto Buy Bone",
	Default = getgenv().Auto_Buy_Bone,
	Callback = function(Value)
		getgenv().Auto_Buy_Bone = Value
	end
})

-- Execute
--Run extend functions
spawn(function()
    while wait() do
        AddStats()
        SafeAutoFarmLevel()
        if getgenv().Snipe_Fruit then
            SnipeFruit(getgenv().Fruit_To_Snipe)
        end
        if getgenv().Auto_Buy_Random_Fruit then
            BuyRandomFruit()
        end
        if getgenv().Auto_Store_Fruit then
            StoreFruit()
        end
        if getgenv().Auto_Buy_Bone then
            BuyBone()
        end
        if getgenv().Auto_Bring_Fruit then
            if CheckFruit() then
                queue:push("Auto Bring Fruit", Priority["Auto Bring Fruit"])
            elseif not CheckFruit() then
                if getgenv().Auto_Bring_Fruit_Hop then
                    OrionLib:MakeNotification({
                        Name = "Status",
                        Content = "Fruit not found. Server hoping...",
                        Image = "rbxassetid://4483345998",
                        Time = 1
                    })
                    HopServer()
                elseif not getgenv().Auto_Bring_Fruit_Hop then
                    queue:pop("Auto Bring Fruit")
                end
            end
        elseif not getgenv().Auto_Bring_Fruit then
            queue:pop("Auto Bring Fruit")
        end
        if getgenv().Auto_Farm_Boss then
            if not getgenv().Weapon then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Weapon not selected!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
                Auto_Farm_Boss_Toggle:Set(false)
                getgenv().Auto_Farm_Boss = false
                queue:pop("Auto Farm Boss")
            elseif getgenv().Boss_To_Farm ~= nil then
                local CFrameBoss = nil
                if not CFrameBoss then
                    pcall(function()
                        CFrameBoss = CFrame.new(game:GetService("ReplicatedStorage"):FindFirstChild(boss).WorldPivot.Position) * CFrame.new(0, 30, 0)
                    end)
                end
                if not CFrameBoss then
                    pcall(function()
                        CFrameBoss = game:GetService("Workspace").Enemies:FindFirstChild(boss):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
                    end)
                end
                if CFrameBoss ~= nil then
                    queue:push("Auto Farm Boss", Priority["Auto Farm Boss"])
                elseif CFrameBoss == nil then
                    if getgenv().Auto_Farm_Boss_Hop then
                        OrionLib:MakeNotification({
                            Name = "Status",
                            Content = "Boss not found. Server hoping...",
                            Image = "rbxassetid://4483345998",
                            Time = 1
                        })
                        HopServer()
                    elseif not getgenv().Auto_Farm_Boss_Hop then
                        OrionLib:MakeNotification({
                            Name = "Status",
                            Content = "Boss not found. Poping...",
                            Image = "rbxassetid://4483345998",
                            Time = 1
                        })
                        queue:pop("Auto Farm Boss")
                    end
                end
            elseif getgenv().Boss_To_Farm == nil then
                OrionLib:MakeNotification({
                    Name = "Status",
                    Content = "Poping...",
                    Image = "rbxassetid://4483345998",
                    Time = 1
                })
                queue:pop("Auto Farm Boss")
            end
        elseif not getgenv().Auto_Farm_Boss then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Poping...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            queue:pop("Auto Farm Boss")
        end
    end
end)
-- Modify queue
spawn(function()
    while wait() do
        if getgenv().Auto_Farm_Level then
            queue:push("Auto Farm Level", Priority["Auto Farm Level"])
        elseif not getgenv().Auto_Farm_Level then
            queue:pop("Auto Farm Level")
        end
    end
end)
-- Run functions
spawn(function()
    while wait() do
        if not queue:empty() then
            if queue:top() == "Auto Farm Level" then
                AutoFarmLevel()
            elseif queue:top() == "Auto Bring Fruit" then
                BringFruit()
            elseif queue:top() == "Auto Farm Boss" then
                AutoFarmBoss(getgenv().Boss_To_Farm)
            end
        end
    end
end)
