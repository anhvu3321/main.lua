-- Config
getgenv().Configs = {
    ["Team"] = "Marines", -- Pirates/Marines
    ["Weapons"] = { -- Put your config here
        ["Melee"] = {
            ["Enable"] = false,
            ["Delay"] = 2,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
                ["X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
                ["C"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
            },
        },
        ["Blox Fruit"] = {
            ["Enable"] = false,
            ["Delay"] = 1,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
                ["X"] = {
                    ["Enable"] = false,
                    ["HoldTime"] = 0,
                },

                ["C"] = {
                    ["Enable"] = false,
                    ["HoldTime"] = 0,
                },
                ["V"] = {
                    ["Enable"] = false,
                    ["HoldTime"] = 0,
                },
                ["F"] = {
                    ["Enable"] = false,
                    ["HoldTime"] = 0,
                },
            },
        },
        ["Sword"] = {
            ["Enable"] = true,
            ["Delay"] = 2,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0.1,
                },
                ["X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0.1,
                },
            },
        }
    }
}

-- Functions
local plr = game:GetService("Players").LocalPlayer
local CbFw = getupvalues(require(plr:GetService("Players").PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
local Weapon_Type = nil
local Weapon = nil
local firesv
local funfire
local remotetosend = {}
local functosend = {}
local function GetCurrentBlade()
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game:GetService("Players").LocalPlayer.Character do ret=ret.Parent end
    return ret
end
local function AttackNoCD()
    local Fast = getupvalues(require(game:GetService("Players").LocalPlayer:GetService("Players").PlayerScripts.CombatFramework))
    local y = Fast[2]
    y.activeController.hitboxMagnitude = 80
    y.activeController.active = false
    y.activeController.timeToNextBlock = 0
    y.activeController.focusStart = 0
    y.activeController.increment = 4
    y.activeController.blocking = false
    y.activeController.attacking = false
    y.activeController.humanoid.AutoRotate = true
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
    local AC = CbFw2.activeController
    for i = 1, 1 do
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
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
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                end
            end)
        end
    end
end
local function Buso()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
local function tween(place)
    local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
    end
    if W then
        if (place.Position -  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 10000 and (Vector3.new(61163.8515625, 11.6796875, 1819.7841796875) - player.Position).Magnitude < 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
        end
    elseif W2 then
        if (place.Position -  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 10000 and (Vector3.new(923.21252441406, 126.9760055542, 32852.83203125) - player.Position).Magnitude < 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508, 89, -132))
        end
    end
    local Distance = (place.Position -  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
    local speed = 300
    if Distance < 250 then
        speed = 4000
    elseif Distance < 500 then
        speed = 550
    elseif Distance < 1000 then
        speed = 400
    elseif Distance >= 1000 then
        speed = 300
    end
	local TweenService = game:GetService("TweenService")
	local start =  game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
	local _end = place.Position
	local distance = (start - _end).Magnitude
	local _time = distance/(speed)
	local info = TweenInfo.new(
		_time,
		Enum.EasingStyle.Linear
	)
	local tp = TweenService:Create( game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = place})
	return tp
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
local function NoClip()
    local character = game:GetService("Players").LocalPlayer.Character
    for _, v in pairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end
local function RemoveVelocity() 
    pcall(function()
        if (not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyGyrozz")) then
            return
        end
        for i,v in pairs(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
            if v.Name == "BodyGyrozz" then
                v:Destroy()
            end
        end
    end)
end
local function UpdateWeapon()
    if Weapon_Type ~= nil then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if string.find(v.ToolTip, Weapon_Type) then
                    Weapon = v.Name
                    return
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
local function changeposmobtouseskill(PosToUseSkillFruit, skill)
    firesv = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent
    funfire = game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("")
    if(skill == "Z") then
        functosend = {
            [1] = "Z",
            [2] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif (skill == 'X') then
        functosend = {
            [1] = "X",
            [2] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif (skill == 'C') then
        functosend = {
            [1] = "C",
            [2] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif(skill == 'V') then
        functosend = {
            [1] = "V",
            [2] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    else 
        functosend = {
            [1] = "F",
            [2] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    end
    remotetosend ={
        [1] = PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
    }
end
local function callhook()
    local OldNamecall
    OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
        local method = getnamecallmethod()
        if method == "InvokeServer" and Self == funfire and functosend ~= nil then
                local str = (...)
                if(string.find(str,functosend[1])) then
                    return OldNamecall(Self,unpack(functosend)) 
                elseif(string.find(str,"Vector3.new")) then
                    return OldNamecall(Self,unpack(functosend))
                end
        end
        return OldNamecall(Self, ...)
    end)
    local Newfunc
    Newfunc = hookmetamethod(game, "__namecall", function(Self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and Self == firesv and remotetosend ~= nil then
                local str = {...}
                if(str[1] == true) then
                    return Newfunc(Self,...)
                elseif (str[1] == false) then
                    return Newfunc(Self,...)
                else
                    return Newfunc(Self,unpack(remotetosend))
                end
        end
        return Newfunc(Self, ...)
    end)
end
local function MeleeSkill(Pos)
    Weapon_Type = "Melee"
    UpdateWeapon()
    EquipWeapon(Weapon)
    local skill_ = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[Weapon]
    local skill = getgenv().Configs.Weapons["Melee"].Skills
    local usez = skill.Z.Enable
    local holdz = skill.Z.HoldTime
    local usex = skill.X.Enable
    local holdx = skill.X.HoldTime
    local usec = skill.C.Enable
    local holdc = skill.C.HoldTime
    if usez and skill_.Z.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"Z")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
        wait(holdz)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
    end
    if usex and skill_.X.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"X")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
        wait(holdx)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
    end
    if usec and skill_.C.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"C")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
        wait(holdc)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
    end
end
local function FruitSkill(Pos)
    Weapon_Type = "Fruit"
    UpdateWeapon()
    EquipWeapon(Weapon)
    local skill_ = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[Weapon]
    local skill = getgenv().Configs.Weapons["Blox Fruit"].Skills
    local usez = skill.Z.Enable
    local holdz = skill.Z.HoldTime
    local usex = skill.X.Enable
    local holdx = skill.X.HoldTime
    local usec = skill.C.Enable
    local holdc = skill.C.HoldTime
    local usev = skill.V.Enable
    local holdv = skill.V.HoldTime
    local usef = skill.F.Enable
    local holdf = skill.F.HoldTime
    if usez and skill_.Z.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"Z")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
        wait(holdz)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
    end
    if usex and skill_.X.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"X")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
        wait(holdx)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
    end
    if usec and skill_.C.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"C")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
        wait(holdc)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
    end
    if usev and skill_.V.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"V")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
        wait(holdv)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
    end
    if usef and skill_.F.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"F")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,game)
        wait(holdf)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"F",false,game)
    end
end
local function SwordSkill(Pos)
    Weapon_Type = "Sword"
    UpdateWeapon()
    EquipWeapon(Weapon)
    local skill_ = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[Weapon]
    local skill = getgenv().Configs.Weapons["Sword"].Skills
    local usez = skill.Z.Enable
    local holdz = skill.Z.HoldTime
    local usex = skill.X.Enable
    local holdx = skill.X.HoldTime
    if usez and skill_.Z.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"Z")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
        wait(holdz)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
    end
    if usex and skill_.X.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(Pos,"X")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
        wait(holdx)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
    end
end

-- Run main
callhook()
local target = "belguudei999"
local player = game:GetService("Players").LocalPlayer
local Tween = nil
local click_time = 0.1
if game:GetService("Players"):FindFirstChild(target) then
    repeat wait(0.01)
        pcall(function()
            AddVelocity()
            Buso()
            NoClip()
            Tween = tween(game:GetService("Players"):FindFirstChild(target).Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-10, 10), 8, math.random(-10, 10)))
            Tween:Play()
            if (game:GetService("Players"):FindFirstChild(target).Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                if getgenv().Configs.Weapons["Melee"].Enable then
                    local duration = getgenv().Configs.Weapons["Melee"].Delay
                    local start = tick()
                    while wait(click_time) do
                        if tick() - start <= duration then
                            print(tick() - start)
                            Tween = tween(game:GetService("Players"):FindFirstChild(target).Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-10, 10), 8, math.random(-10, 10)))
                            Tween:Play()
                            AttackNoCD()
                            MeleeSkill(game:GetService("Players"):FindFirstChild(target).Character)
                        end
                    end
                end
                if getgenv().Configs.Weapons["Blox Fruit"].Enable then
                    local duration = getgenv().Configs.Weapons["Blox Fruit"].Delay
                    local start = tick()
                    if tick() - start <= duration then
                        print(tick() - start)
                        Tween = tween(game:GetService("Players"):FindFirstChild(target).Character.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                        Tween:Play()
                        FruitSkill(game:GetService("Players"):FindFirstChild(target).Character)
                    end
                end
                if getgenv().Configs.Weapons["Sword"].Enable then
                    local duration = getgenv().Configs.Weapons["Sword"].Delay
                    local start = tick()
                    while wait(click_time) do
                        if tick() - start <= duration then
                            print(tick() - start)
                            Tween = tween(game:GetService("Players"):FindFirstChild(target).Character.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                            Tween:Play()
                            AttackNoCD()
                            SwordSkill(game:GetService("Players"):FindFirstChild(target).Character)
                        end
                    end
                end
            end
        end)
    until player.Character.Humanoid.Health <= 0 or game:GetService("Players"):FindFirstChild(target).Character.Humanoid.Health <= 0
end
