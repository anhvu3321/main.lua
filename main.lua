-- Check
local time = os.date("*t", os.time())
if time.year ~= 2024 then
    return
elseif time.month > 2 then
    return
end

-- Load
if not game:IsLoaded() then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

-- Key System
local function KeySystem()
    local yeswhynot = false
    local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/xrer_mstudio45.lua"))()
    KeySystemUI.New({
        ApplicationName = "XeroHub", -- Your Key System Application Name
        Name = "XeroHub Key System", -- Your Script name
        Info = "Get Key for XeroHub", -- Info text in the GUI, keep empty for default text.
        DiscordInvite = "https://discord.gg/DmdVQcAMh8" -- Optional.
    })
    repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
end
-- if game:GetService("Players").LocalPlayer.Name ~= "anhvu3321"then
--     KeySystem()
-- end

-- Join Team
if getgenv().Team ~= "Pirates" and getgenv().Team ~= "Marines" then
    getgenv().Team = "Marines"
end
if game:GetService("Players").LocalPlayer.Team == nil then
    local Button = game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[getgenv().Team].Frame.TextButton
    for i,v in pairs(getconnections(Button.Activated)) do
        v.Function()
    end
end
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Variables
local CFrame_Mobs = {
    ["Trainee"] = CFrame.new(-2965.82373, 41.8615341, 2170.80029),
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
    ["Auto Race V2"] = 1,
    ["Auto Done Trial"] = 2,
    ["Auto Kill Player"] = 3,
    ["Auto Collect Azure Ember"] = 4,
    ["Auto Farm Sea Event"] = 5,
    ["Auto Raid"] = 6,
    ["Auto Farm Level"] = 7,
    ["Auto Farm Bone"] = 8,
    ["Auto Farm Kata"] = 9,
    ["Auto Farm Boss"] = 10,
    ["Auto Kill Elite"] = 11,
    ["Auto Bring Fruit"] = 12
}
local Sea_Level = {
    ["0"] = CFrame.new(-18805.6602, 20, 1014.23145, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["1"] = CFrame.new(-22526.0098, 20, 1716.89185, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["2"] = CFrame.new(-25645.3535, 20, 2554.41016, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["3"] = CFrame.new(-29842.2227, 20, 4070.85767, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["4"] = CFrame.new(-32654.7188, 20, 4788.14697, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["5"] = CFrame.new(-37813.6953, 20, 6105.16895, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203),
    ["6"] = CFrame.new(-42250.2227, 20, 9247.07715, -0.210707203, 1.100981e-07, 0.977549195, 2.74631451e-09, 1, -1.12034698e-07, -0.977549195, -2.09218598e-08, -0.210707203)
}
local Bosses = {}
local Islands = {}
local Ports = {}
local Weapon_Spam = {}
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
local Auto_Farm_Bone_Toggle = nil
local Check_Boss = false
local Check_Fruit = false
local Mob_Kata_Killed = nil
local Auto_Farm_Kata_Toggle = nil
local Fast_Attack_Delay = 0.03
local Auto_Raid_Toggle = nil
local Dungeon_Wait = false
local Haki_Color = nil
local Moon_Status = nil
local Mirage_Island = nil
local Kitsune_Island = nil
local Mirage_Stock = false
local Elite_Killed = nil
local Check_Elite = false
local Auto_Farm_Sea_Event_Toggle = nil
local Auto_Race_V2_Toggle = nil
local Go_Left = true
local Race_V4_Status = nil
local Counter_Attack = 0
local Boats = {"Dinghy", "PirateSloop", "PirateBrigade", "PirateGrandBrigade", "Guardian", "Lantern", "Sleigh", "Beast Hunter"}
getgenv().Auto_Farm_Boss = false
getgenv().Auto_Farm_Boss_Hop = false
getgenv().Weapon_Type = "Melee"
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
getgenv().Safe_Auto_Farm_Level = true
getgenv().Boss_To_Farm = nil
getgenv().Claim_Boss_Quest = false
getgenv().Auto_Buso = true
getgenv().Auto_Ken_Haki = false
getgenv().Auto_Set_Spawn = false
getgenv().Auto_Farm_Bone = false
getgenv().Auto_Claim_Quest_Farm_Bone = false
getgenv().Auto_Farm_Kata = false
getgenv().Auto_Claim_Quest_Farm_Kata = false
getgenv().Auto_Raid = false
getgenv().Dungeon = nil
getgenv().Auto_Raid_Hop = false
getgenv().Auto_Awaken_Fruit = false
getgenv().Auto_Buy_Haki_Color = false
getgenv().Auto_Buy_Legend_Sword = false
getgenv().Weapon_Type_Mastery = "Fruit"
getgenv().Farm_Mastery_Health = 0
getgenv().Skill_Z_Mastery = false
getgenv().Skill_X_Mastery = false
getgenv().Skill_C_Mastery = false
getgenv().Skill_V_Mastery = false
getgenv().Skill_F_Mastery = false
getgenv().Farm_Mastery = false
getgenv().Auto_Kill_Elite = false
getgenv().Auto_Kill_Elite_Hop = false
getgenv().Boat = "Dinghy"
getgenv().Sea_Danger_Level = "4"
getgenv().Auto_Farm_Sea_Event = false
getgenv().Kill_Shark = false
getgenv().Kill_Piranha = false
getgenv().Kill_Terror_Shark = false
getgenv().Kill_Sea_Beast = false
getgenv().Kill_Ship = false
getgenv().Melee_Spam = true
getgenv().Sword_Spam = false
getgenv().Fruit_Spam = false
getgenv().Gun_Spam = false
getgenv().Auto_Done_Trial = false
getgenv().Auto_Kill_Player = false
getgenv().Auto_Turn_On_Race_V3 = false
getgenv().Auto_Turn_On_Race_V4 = false
getgenv().Auto_Race_V2 = false
getgenv().Auto_Collect_Azure_Ember = false
getgenv().Auto_Trade_Azure_Ember = false
getgenv().Trade_Azure_Ember_At = 20
getgenv().Auto_Buy_Upgrade_Gear = false

-- Settings
getgenv().Settings = {
    ["Weapon Type"] = getgenv().Weapon_Type,
    ["Bring Mob"] = getgenv().Bring_Mob,
    ["Auto Farm Level"] = getgenv().Auto_Farm_Level,
    ["Anti AFK"] = getgenv().Anti_AFK,
    ["Auto Rejoin"] = getgenv().Auto_Rejoin,
    ["Melee Stats"] = getgenv().Melee_Stats,
    ["Defense Stats"] = getgenv().Defense_Stats,
    ["Sword Stats"] = getgenv().Sword_Stats,
    ["Gun Stats"] = getgenv().Gun_Stats,
    ["Fruit Stats"] = getgenv().Fruit_Stats,
    ["Stat Points"] = getgenv().Stat_Points,
    ["Auto New World"] = getgenv().Auto_New_World,
    ["Fruit To Snipe"] = getgenv().Fruit_To_Snipe,
    ["Snipe Fruit"] = getgenv().Snipe_Fruit,
    ["Auto Buy Random Fruit"] = getgenv().Auto_Buy_Random_Fruit,
    ["Auto Store Fruit"] = getgenv().Auto_Store_Fruit,
    ["Auto Buy Bone"] = getgenv().Auto_Buy_Bone,
    ["Auto Bring Fruit Hop"] = getgenv().Auto_Bring_Fruit_Hop,
    ["Auto Bring Fruit"] = getgenv().Auto_Bring_Fruit,
    ["Safe Auto Farm Level"] = getgenv().Safe_Auto_Farm_Level,
    ["Boss To Farm"] = getgenv().Boss_To_Farm,
    ["Auto Farm Boss"] = getgenv().Auto_Farm_Boss,
    ["Auto Farm Boss Hop"] = getgenv().Auto_Farm_Boss_Hop,
    ["Claim Boss Quest"] = getgenv().Claim_Boss_Quest,
    ["Auto Buso"] = getgenv().Auto_Buso,
    ["Auto Ken Haki"] = getgenv().Auto_Ken_Haki,
    ["Auto Set Spawn"] = getgenv().Auto_Set_Spawn,
    ["Max Players"] = getgenv().Max_Players,
    ["Auto Farm Bone"] = getgenv().Auto_Farm_Bone,
    ["Auto Claim Quest Farm Bone"] = getgenv().Auto_Claim_Quest_Farm_Bone,
    ["Auto Farm Kata"] = getgenv().Auto_Farm_Kata,
    ["Auto Claim Quest Farm Kata"] = getgenv().Auto_Claim_Quest_Farm_Kata,
    ["Fruit Auto Third Sea"] = getgenv().Fruit_Auto_Third_Sea,
    ["Auto Raid"] = getgenv().Auto_Raid,
    ["Dungeon"] = getgenv().Dungeon,
    ["Auto Raid Hop"] = getgenv().Auto_Raid_Hop,
    ["Auto Awaken Fruit"] = getgenv().Auto_Awaken_Fruit,
    ["Auto Buy Haki Color"] = getgenv().Auto_Buy_Haki_Color,
    ["Auto Buy Legend Sword"] = getgenv().Auto_Buy_Legend_Sword,
    ["Weapon Type Mastery"] = getgenv().Weapon_Type_Mastery,
    ["Farm Mastery Health"] = getgenv().Farm_Mastery_Health,
    ["Skill Z Mastery"] = getgenv().Skill_Z_Mastery,
    ["Skill X Mastery"] = getgenv().Skill_X_Mastery,
    ["Skill C Mastery"] = getgenv().Skill_C_Mastery,
    ["Skill V Mastery"] = getgenv().Skill_V_Mastery,
    ["Skill F Mastery"] = getgenv().Skill_F_Mastery,
    ["Farm Mastery"] = getgenv().Farm_Mastery,
    ["Auto Kill Elite"] = getgenv().Auto_Kill_Elite,
    ["Auto Kill Elite Hop"] = getgenv().Auto_Kill_Elite_Hop,
    ["Boat"] = getgenv().Boat,
    ["Sea Danger Level"] = getgenv().Sea_Danger_Level,
    ["Auto Farm Sea Event"] = getgenv().Auto_Farm_Sea_Event,
    ["Kill Shark"] = getgenv().Kill_Shark,
    ["Kill Piranha"] = getgenv().Kill_Piranha,
    ["Kill Terror Shark"] = getgenv().Kill_Terror_Shark,
    ["Kill Sea Beast"] = getgenv().Kill_Sea_Beast,
    ["Kill Ship"] = getgenv().Kill_Ship,
    ["Melee Spam"] = getgenv().Melee_Spam,
    ["Sword Spam"] = getgenv().Sword_Spam,
    ["Fruit Spam"] = getgenv().Fruit_Spam,
    ["Gun Spam"] = getgenv().Gun_Spam,
    ["Auto Done Trial"] = getgenv().Auto_Done_Trial,
    ["Auto Kill Player"] = getgenv().Auto_Kill_Player,
    ["Auto Turn On Race V3"] = getgenv().Auto_Turn_On_Race_V3,
    ["Auto Turn On Race V4"] = getgenv().Auto_Turn_On_Race_V4,
    ["Auto Race V2"] = getgenv().Auto_Race_V2,
    ["Auto Collect Azure Ember"] = getgenv().Auto_Collect_Azure_Ember,
    ["Auto Trade Azure Ember"] = getgenv().Auto_Trade_Azure_Ember,
    ["Trade Azure Ember At"] = getgenv().Trade_Azure_Ember_At,
    ["Auto Buy Upgrade Gear"] = getgenv().Auto_Buy_Upgrade_Gear
}
local function SaveSettings()
    getgenv().Settings = {
        ["Weapon Type"] = getgenv().Weapon_Type,
        ["Bring Mob"] = getgenv().Bring_Mob,
        ["Auto Farm Level"] = getgenv().Auto_Farm_Level,
        ["Anti AFK"] = getgenv().Anti_AFK,
        ["Auto Rejoin"] = getgenv().Auto_Rejoin,
        ["Melee Stats"] = getgenv().Melee_Stats,
        ["Defense Stats"] = getgenv().Defense_Stats,
        ["Sword Stats"] = getgenv().Sword_Stats,
        ["Gun Stats"] = getgenv().Gun_Stats,
        ["Fruit Stats"] = getgenv().Fruit_Stats,
        ["Stat Points"] = getgenv().Stat_Points,
        ["Auto New World"] = getgenv().Auto_New_World,
        ["Fruit To Snipe"] = getgenv().Fruit_To_Snipe,
        ["Snipe Fruit"] = getgenv().Snipe_Fruit,
        ["Auto Buy Random Fruit"] = getgenv().Auto_Buy_Random_Fruit,
        ["Auto Store Fruit"] = getgenv().Auto_Store_Fruit,
        ["Auto Buy Bone"] = getgenv().Auto_Buy_Bone,
        ["Auto Bring Fruit Hop"] = getgenv().Auto_Bring_Fruit_Hop,
        ["Auto Bring Fruit"] = getgenv().Auto_Bring_Fruit,
        ["Safe Auto Farm Level"] = getgenv().Safe_Auto_Farm_Level,
        ["Boss To Farm"] = getgenv().Boss_To_Farm,
        ["Auto Farm Boss"] = getgenv().Auto_Farm_Boss,
        ["Auto Farm Boss Hop"] = getgenv().Auto_Farm_Boss_Hop,
        ["Claim Boss Quest"] = getgenv().Claim_Boss_Quest,
        ["Auto Buso"] = getgenv().Auto_Buso,
        ["Auto Ken Haki"] = getgenv().Auto_Ken_Haki,
        ["Auto Set Spawn"] = getgenv().Auto_Set_Spawn,
        ["Max Players"] = getgenv().Max_Players,
        ["Auto Farm Bone"] = getgenv().Auto_Farm_Bone,
        ["Auto Claim Quest Farm Bone"] = getgenv().Auto_Claim_Quest_Farm_Bone,
        ["Auto Farm Kata"] = getgenv().Auto_Farm_Kata,
        ["Auto Claim Quest Farm Kata"] = getgenv().Auto_Claim_Quest_Farm_Kata,
        ["Fruit Auto Third Sea"] = getgenv().Fruit_Auto_Third_Sea,
        ["Auto Raid"] = getgenv().Auto_Raid,
        ["Dungeon"] = getgenv().Dungeon,
        ["Auto Raid Hop"] = getgenv().Auto_Raid_Hop,
        ["Auto Awaken Fruit"] = getgenv().Auto_Awaken_Fruit,
        ["Auto Buy Haki Color"] = getgenv().Auto_Buy_Haki_Color,
        ["Auto Buy Legend Sword"] = getgenv().Auto_Buy_Legend_Sword,
        ["Weapon Type Mastery"] = getgenv().Weapon_Type_Mastery,
        ["Farm Mastery Health"] = getgenv().Farm_Mastery_Health,
        ["Skill Z Mastery"] = getgenv().Skill_Z_Mastery,
        ["Skill X Mastery"] = getgenv().Skill_X_Mastery,
        ["Skill C Mastery"] = getgenv().Skill_C_Mastery,
        ["Skill V Mastery"] = getgenv().Skill_V_Mastery,
        ["Skill F Mastery"] = getgenv().Skill_F_Mastery,
        ["Farm Mastery"] = getgenv().Farm_Mastery,
        ["Auto Kill Elite"] = getgenv().Auto_Kill_Elite,
        ["Auto Kill Elite Hop"] = getgenv().Auto_Kill_Elite_Hop,
        ["Boat"] = getgenv().Boat,
        ["Sea Danger Level"] = getgenv().Sea_Danger_Level,
        ["Auto Farm Sea Event"] = getgenv().Auto_Farm_Sea_Event,
        ["Kill Shark"] = getgenv().Kill_Shark,
        ["Kill Piranha"] = getgenv().Kill_Piranha,
        ["Kill Terror Shark"] = getgenv().Kill_Terror_Shark,
        ["Kill Sea Beast"] = getgenv().Kill_Sea_Beast,
        ["Kill Ship"] = getgenv().Kill_Ship,
        ["Melee Spam"] = getgenv().Melee_Spam,
        ["Sword Spam"] = getgenv().Sword_Spam,
        ["Fruit Spam"] = getgenv().Fruit_Spam,
        ["Gun Spam"] = getgenv().Gun_Spam,
        ["Auto Done Trial"] = getgenv().Auto_Done_Trial,
        ["Auto Kill Player"] = getgenv().Auto_Kill_Player,
        ["Auto Turn On Race V3"] = getgenv().Auto_Turn_On_Race_V3,
        ["Auto Turn On Race V4"] = getgenv().Auto_Turn_On_Race_V4,
        ["Auto Race V2"] = getgenv().Auto_Race_V2,
        ["Auto Collect Azure Ember"] = getgenv().Auto_Collect_Azure_Ember,
        ["Auto Trade Azure Ember"] = getgenv().Auto_Trade_Azure_Ember,
        ["Trade Azure Ember At"] = getgenv().Trade_Azure_Ember_At,
        ["Auto Buy Upgrade Gear"] = getgenv().Auto_Buy_Upgrade_Gear
    }
    local jsonSettings = game:GetService("HttpService"):JSONEncode(getgenv().Settings)
    if not isfolder("Xero Hub") then
        makefolder("Xero Hub")
    end
    writefile("Xero Hub/Settings.json", jsonSettings)
end
local function LoadSettings()
    if isfile("Xero Hub/Settings.json") then
        getgenv().Settings = game:GetService("HttpService"):JSONDecode(readfile("Xero Hub/Settings.json"))
        getgenv().Weapon_Type = getgenv().Settings["Weapon Type"] or "Melee"
        getgenv().Bring_Mob = getgenv().Settings["Bring Mob"] or true
        getgenv().Auto_Farm_Level = getgenv().Settings["Auto Farm Level"] or false
        getgenv().Anti_AFK = getgenv().Settings["Anti AFK"] or false
        getgenv().Auto_Rejoin = getgenv().Settings["Auto Rejoin"] or false
        getgenv().Melee_Stats = getgenv().Settings["Melee Stats"] or false
        getgenv().Defense_Stats = getgenv().Settings["Defense Stats"] or false
        getgenv().Sword_Stats = getgenv().Settings["Sword Stats"] or false
        getgenv().Gun_Stats = getgenv().Settings["Gun Stats"] or false
        getgenv().Fruit_Stats = getgenv().Settings["Fruit Stats"] or false
        getgenv().Stat_Points = getgenv().Settings["Stat Points"] or 1
        getgenv().Auto_New_World = getgenv().Settings["Auto New World"] or false
        getgenv().Fruit_To_Snipe = getgenv().Settings["Fruit To Snipe"] or nil
        getgenv().Snipe_Fruit = getgenv().Settings["Snipe Fruit"] or false
        getgenv().Auto_Buy_Random_Fruit = getgenv().Settings["Auto Buy Random Fruit"] or false
        getgenv().Auto_Store_Fruit = getgenv().Settings["Auto Store Fruit"] or false
        getgenv().Auto_Buy_Bone = getgenv().Settings["Auto Buy Bone"] or false
        getgenv().Auto_Bring_Fruit_Hop = getgenv().Settings["Auto Bring Fruit Hop"] or false
        getgenv().Auto_Bring_Fruit = getgenv().Settings["Auto Bring Fruit"] or false
        getgenv().Safe_Auto_Farm_Level = getgenv().Settings["Safe Auto Farm Level"] or true
        getgenv().Boss_To_Farm = getgenv().Settings["Boss To Farm"] or nil
        getgenv().Auto_Farm_Boss = getgenv().Settings["Auto Farm Boss"] or false
        getgenv().Auto_Farm_Boss_Hop = getgenv().Settings["Auto Farm Boss Hop"] or false
        getgenv().Claim_Boss_Quest = getgenv().Settings["Claim Boss Quest"] or false
        getgenv().Auto_Buso = getgenv().Settings["Auto Buso"] or true
        getgenv().Auto_Ken_Haki = getgenv().Settings["Auto Ken Haki"] or false
        getgenv().Auto_Set_Spawn = getgenv().Settings["Auto Set Spawn"] or false
        getgenv().Max_Players = getgenv().Settings["Max Players"] or 1
        getgenv().Auto_Farm_Bone = getgenv().Settings["Auto Farm Bone"] or false
        getgenv().Auto_Claim_Quest_Farm_Bone = getgenv().Settings["Auto Claim Quest Farm Bone"] or false
        getgenv().Auto_Farm_Kata = getgenv().Settings["Auto Farm Kata"] or false
        getgenv().Auto_Claim_Quest_Farm_Kata = getgenv().Settings["Auto Claim Quest Farm Kata"] or false
        getgenv().Fruit_Auto_Third_Sea = getgenv().Settings["Fruit Auto Third Sea"] or nil
        getgenv().Auto_Raid = getgenv().Settings["Auto Raid"] or false
        getgenv().Dungeon = getgenv().Settings["Dungeon"] or nil
        getgenv().Auto_Raid_Hop = getgenv().Settings["Auto Raid Hop"] or false
        getgenv().Auto_Awaken_Fruit = getgenv().Settings["Auto Awaken Fruit"] or false
        getgenv().Auto_Buy_Haki_Color = getgenv().Settings["Auto Buy Haki Color"] or false
        getgenv().Auto_Buy_Legend_Sword = getgenv().Settings["Auto Buy Legend Sword"] or false
        getgenv().Weapon_Type_Mastery = getgenv().Settings["Weapon Type Mastery"] or "Fruit"
        getgenv().Farm_Mastery_Health = getgenv().Settings["Farm Mastery Health"] or 0
        getgenv().Skill_Z_Mastery = getgenv().Settings["Skill Z Mastery"] or false
        getgenv().Skill_X_Mastery = getgenv().Settings["Skill X Mastery"] or false
        getgenv().Skill_C_Mastery = getgenv().Settings["Skill C Mastery"] or false
        getgenv().Skill_V_Mastery = getgenv().Settings["Skill V Mastery"] or false
        getgenv().Skill_F_Mastery = getgenv().Settings["Skill F Mastery"] or false
        getgenv().Farm_Mastery = getgenv().Settings["Farm Mastery"] or false
        getgenv().Auto_Kill_Elite = getgenv().Settings["Auto Kill Elite"] or false
        getgenv().Auto_Kill_Elite_Hop = getgenv().Settings["Auto Kill Elite Hop"] or false
        getgenv().Boat = getgenv().Settings["Boat"] or "Dinghy"
        getgenv().Sea_Danger_Level = getgenv().Settings["Sea Danger Level"] or "4"
        getgenv().Auto_Farm_Sea_Event = getgenv().Settings["Auto Farm Sea Event"] or false
        getgenv().Kill_Shark = getgenv().Settings["Kill Shark"] or false
        getgenv().Kill_Piranha = getgenv().Settings["Kill Piranha"] or false
        getgenv().Kill_Terror_Shark = getgenv().Settings["Kill Terror Shark"] or false
        getgenv().Kill_Sea_Beast = getgenv().Settings["Kill Sea Beast"] or false
        getgenv().Kill_Ship = getgenv().Settings["Kill Ship"] or false
        getgenv().Melee_Spam = getgenv().Settings["Melee Spam"] or true
        getgenv().Sword_Spam = getgenv().Settings["Sword Spam"] or false
        getgenv().Fruit_Spam = getgenv().Settings["Fruit Spam"] or false
        getgenv().Gun_Spam = getgenv().Settings["Gun Spam"] or false
        getgenv().Auto_Done_Trial = getgenv().Settings["Auto Done Trial"] or false
        getgenv().Auto_Kill_Player = getgenv().Settings["Auto Kill Player"] or false
        getgenv().Auto_Turn_On_Race_V3 = getgenv().Settings["Auto Turn On Race V3"] or false
        getgenv().Auto_Turn_On_Race_V4 = getgenv().Settings["Auto Turn On Race V4"] or false
        getgenv().Auto_Race_V2 = getgenv().Settings["Auto Race V2"] or false
        getgenv().Auto_Collect_Azure_Ember = getgenv().Settings["Auto Collect Azure Ember"] or false
        getgenv().Auto_Trade_Azure_Ember = getgenv().Settings["Auto Trade Azure Ember"] or false
        getgenv().Trade_Azure_Ember_At = getgenv().Settings["Trade Azure Ember At"] or 20
        getgenv().Auto_Buy_Upgrade_Gear = getgenv().Settings["Auto Buy Upgrade Gear"] or false
    end
end
LoadSettings()
task.spawn(function()
    while task.wait() do
        SaveSettings()
    end
end)

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

-- Hook functions
local firesv
local funfire
local functosend = {}
local remotetosend = {}
local function changeposmobtouseskill(PosToUseSkillFruit, skill)
    firesv = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent
    funfire = game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("")
    if(skill == "Z") then
        functosend = {
            [1] = "Z",
            [2] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif (skill == 'X') then
        functosend = {
            [1] = "X",
            [2] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif (skill == 'C') then
        functosend = {
            [1] = "C",
            [2] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    elseif(skill == 'V') then
        functosend = {
            [1] = "V",
            [2] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    else 
        functosend = {
            [1] = "F",
            [2] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
        }
    end
    remotetosend ={
        [1] = (PosToUseSkillFruit:FindFirstChild("Engine") and PosToUseSkillFruit:FindFirstChild("Engine").CFrame*CFrame.new(0, -30, 0).Position) or PosToUseSkillFruit:FindFirstChild("HumanoidRootPart").Position
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
callhook()
local function Hook()
    local old
    old = hookmetamethod(game, "__namecall", function(Self, ...)
        local type = getnamecallmethod()
        if type == "InvokeServer" then
            local param = {...}
            if #param == 1 then
                if param[1] == "GetFruits" and Mirage_Stock then
                    table.insert(param, true)
                    return old(Self, unpack(param))
                end
            end
        end
        return old(Self, ...)
    end)
end
Hook()

-- Functions
local Codes = {"Sub2Fer999", "Enyu_is_Pro", "JCWK", "StarcodeHEO", "MagicBUS", "KittGaming", "Sub2CaptainMaui", "Sub2OfficialNoobie", "TheGreatAce", "Sub2NoobMaster123", "Sub2Daigrock", "Axiore", "StrawHatMaine", "TantaiGaming", "Bluxxy", "SUB2GAMERROBOT_EXP1"}
local function RedeemAllCode()
    for i=1,16,1 do
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Codes[i])
    end
end
local function FindBossCFrame(boss)
    local CFrameBoss = nil
    if not CFrameBoss then
        for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if v.Name:find(boss, 1, true) and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                CFrameBoss = CFrame.new(v.WorldPivot.Position) * CFrame.new(0, 30, 0)
            end
        end
    end
    if not CFrameBoss then
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name:find(boss, 1, true) and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                CFrameBoss = v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0)
            end
        end
    end
    return CFrameBoss
end
local function UpdateWeapon()
    if getgenv().Weapon_Type ~= nil then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if not getgenv().Farm_Mastery and not getgenv().Auto_Farm_Sea_Event and not getgenv().Auto_Kill_Player and not getgenv().Auto_Done_Trial then
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
                elseif getgenv().Farm_Mastery or getgenv().Auto_Farm_Sea_Event or getgenv().Auto_Kill_Player or getgenv().Auto_Done_Trial then
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
    CFrameBoss = FindBossCFrame(NameBoss)
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
        CFrameBoss = FindBossCFrame(NameBoss)
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
    if Level <= 9 then
        if tostring(game:GetService("Players").LocalPlayer.Team) == "Pirates" then
            NameQuest = "BanditQuest1"
            QuestNumber = 1
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231)
            NameMob = "Bandit"
            CFrameMon = CFrame_Mobs[NameMob]
            LevelReq = 0
            return NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq
        end
    end
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
        repeat task.wait()
            if Tween.PlaybackState == Enum.PlaybackState.Playing then
                Tween:Cancel()
            end
        until Tween.PlaybackState ~= Enum.PlaybackState.Playing
    end
    RemoveVelocity()
    Stop_Tween = false
end
local function GetShrinePosition()
    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland"):FindFirstChild("ShrineActive") then
            for _, v in pairs(game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland"):FindFirstChild("ShrineActive"):GetDescendants()) do
                if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                    return v.CFrame
                end
            end
        end
    end
    return nil
end
local function tween(place, item, boss, state, fruit)
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
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
        if Distance <= 100 and getgenv().Auto_Kill_Player then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = place
        else
            local speed = 350
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
                repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                AddVelocity()
            end
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
        if boss ~= nil then
            local CFrameBoss = FindBossCFrame(boss)
            if CFrameBoss == nil then
                StopTween()
                break
            end
        end
        if state ~= nil then
            if state == "Auto Farm Level" then
                if not getgenv().Auto_Farm_Level then
                    StopTween()
                    break
                end
            elseif state == "Auto Farm Boss" then
                if not getgenv().Auto_Farm_Boss then
                    StopTween()
                    break
                end
            elseif state == "Auto Farm Bone" then
                if not getgenv().Auto_Farm_Bone then
                    StopTween()
                    break
                end
            elseif state == "Auto Farm Kata" then
                if not getgenv().Auto_Farm_Kata then
                    StopTween()
                    break
                end
            elseif state == "Auto Bring Fruit" then
                if not getgenv().Auto_Bring_Fruit then
                    StopTween()
                    break
                end
            elseif state == "Auto Raid" then
                if not getgenv().Auto_Raid then
                    StopTween()
                    break
                end
            elseif state == "Auto Kill Elite" then
                if not getgenv().Auto_Kill_Elite then
                    StopTween()
                    break
                end
            elseif state == "Auto Farm Sea Event" then
                if not getgenv().Auto_Farm_Sea_Event then
                    StopTween()
                    break
                end
            elseif state == "Auto Collect Azure Ember" then
                if not getgenv().Auto_Collect_Azure_Ember or not GetShrinePosition() then
                    StopTween()
                    break
                end
            end
        end
        if fruit ~= nil then
            local Check_Fruit = false
            for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("Fruit") then
                    if v.Name == fruit then
                        Check_Fruit = true
                    end
                end
            end
            if not Check_Fruit then
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
        if v.Name == NameMon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v:FindFirstChild("HumanoidRootPart").Position - PosMon.Position).Magnitude <= 350 then
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
local function FarmMastery(target)
    local Temp_Weapon_Type = getgenv().Weapon_Type
    getgenv().Weapon_Type = getgenv().Weapon_Type_Mastery
    UpdateWeapon()
    EquipWeapon(getgenv().Weapon)
    local skill = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[getgenv().Weapon]
    if getgenv().Skill_Z_Mastery and skill:FindFirstChild("Z") and skill.Z.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(target, "Z")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
    end
    if getgenv().Skill_X_Mastery and skill:FindFirstChild("X") and skill.X.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(target, "X")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
    end
    if getgenv().Skill_C_Mastery and skill:FindFirstChild("C") and skill.C.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(target, "C")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
    end
    if getgenv().Skill_V_Mastery and skill:FindFirstChild("V") and skill.V.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(target, "V")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
    end
    if getgenv().Skill_F_Mastery and skill:FindFirstChild("F") and skill.F.Cooldown.Size.X.Scale == 0 then
        changeposmobtouseskill(target, "F")
        game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,"F",false,game)
    end
    getgenv().Weapon_Type = Temp_Weapon_Type
end
local function AutoSecondSea()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        StopTween()
        return
    end
    if game:GetService("Workspace").Map.Ice.Door.CanCollide == true and game:GetService("Workspace").Map.Ice.Door.Transparency == 0 then
        repeat task.wait()
            tween(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563), nil, nil, "Auto Farm Level")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            AddVelocity()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
            EquipWeapon("Key")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            tween(CFrame.new(1347.7124, 37.3751602, -1325.6488), "Key", nil, "Auto Farm Level")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            AddVelocity()
            task.wait(3)
        until game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1
    end
    if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
        local CFrameBoss = nil
        CFrameBoss = FindBossCFrame("Ice Admiral")
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Boss not found. Server hoping...",
                Image = "rbxassetid://4483345998",
                Time = 1
            })
            HopServer()
            return
        else
            tween(CFrameBoss, nil, "Ice Admiral", "Auto Farm Level")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            AddVelocity()
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Ice Admiral" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    repeat task.wait(Fast_Attack_Delay)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                            StopTween()
                            return
                        end
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Level")
                        AddVelocity()
                        if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                            FarmMastery(v)
                        else
                            UpdateWeapon()
                            EquipWeapon(getgenv().Weapon)
                            AttackNoCD()
                        end
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
        StopTween()
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
        tween(CFrame.new(-336.312, 331.986, 646.689), nil, nil, "Auto Farm Level")
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            StopTween()
            return
        end
        AddVelocity()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", getgenv().Fruit_Auto_Third_Sea)
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            StopTween()
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
            StopTween()
            return
        end
        task.wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
        task.wait(1)
    end
    if not game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") then
        local CFrameBoss = nil
        CFrameBoss = FindBossCFrame("Don Swan")
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Boss not found. Server hoping...",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            HopServer()
            return
        else
            tween(CFrameBoss, nil, "Don Swan", "Auto Farm Level")
            if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            AddVelocity()
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Don Swan" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    repeat task.wait(Fast_Attack_Delay)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                            StopTween()
                            return
                        end
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Level")
                        AddVelocity()
                        if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                            FarmMastery(v)
                        else
                            UpdateWeapon()
                            EquipWeapon(getgenv().Weapon)
                            AttackNoCD()
                        end
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        end
    end
    tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016), nil, nil, "Auto Farm Level")
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        StopTween()
        return
    end
    AddVelocity()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
        StopTween()
        return
    end
    task.wait(3)
    local CFrameBoss = nil
    CFrameBoss = FindBossCFrame("rip_indra")
    if CFrameBoss == nil then
        OrionLib:MakeNotification({
            Name = "Status",
            Content = "Boss not found. Server hoping...",
            Image = "rbxassetid://4483345998",
            Time = 1
        })
        HopServer()
        return
    else
        tween(CFrameBoss, nil, "rip_indra", "Auto Farm Level")
        if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
            StopTween()
            return
        end
        AddVelocity()
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "rip_indra" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                repeat task.wait(Fast_Attack_Delay)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if not getgenv().Auto_New_World or queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), "Third Sea", nil, "Auto Farm Level")
                    AddVelocity()
                    if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                        FarmMastery(v)
                    else
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    end
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
                task.wait(1)
                AutoSecondSea()
                return
            elseif Level >= 1500 and W2 and getgenv().Auto_New_World then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                task.wait(1)
                AutoThirdSea()
                return
            end
            local NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq = CheckQuest()
            local NameQuestBoss, QuestBossNumber, CFrameQuestBoss, NameBoss, CFrameBoss, LevelReqBoss = CheckBossQuest()
            if LevelReqBoss > LevelReq and CFrameBoss ~= nil then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameBoss, 1, true) then
                    tween(CFrameQuestBoss, nil, NameBoss, "Auto Farm Level")
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestBossNumber)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    tween(CFrameBoss * CFrame.new(0, 30, 0), nil, NameBoss, "Auto Farm Level")
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == NameBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                            repeat task.wait(Fast_Attack_Delay)
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                    repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                    AddVelocity()
                                end
                                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                    StopTween()
                                    return
                                end
                                tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Level")
                                AddVelocity()
                                if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                    FarmMastery(v)
                                else
                                    UpdateWeapon()
                                    EquipWeapon(getgenv().Weapon)
                                    AttackNoCD()
                                end
                            until v:FindFirstChild("Humanoid").Health <= 0
                        end
                    end
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    StopTween()
                    return
                end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if not game:GetService("Workspace").Enemies:FindFirstChild(NameMob) then
                tween(CFrameMon, nil, nil, "Auto Farm Level")
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    StopTween()
                    return
                end
                AddVelocity()
            end
            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameMob, 1, true) then
                tween(CFrameQuest, nil, nil, "Auto Farm Level")
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    StopTween()
                    return
                end
                AddVelocity()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestNumber)
            end
            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                    repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                    AddVelocity()
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    StopTween()
                    return
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameMob, 1, true) then
                    NameQuest, QuestNumber, CFrameQuest, NameMob, CFrameMon, LevelReq = CheckQuest()
                    NameQuestBoss, QuestBossNumber, CFrameQuestBoss, NameBoss, CFrameBoss, LevelReqBoss = CheckBossQuest()
                    if LevelReqBoss > LevelReq and CFrameBoss ~= nil then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(NameBoss, 1, true) then
                            tween(CFrameQuestBoss, nil, NameBoss, "Auto Farm Level")
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                StopTween()
                                return
                            end
                            AddVelocity()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestBossNumber)
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                StopTween()
                                return
                            end
                            tween(CFrameBoss * CFrame.new(0, 30, 0), nil, NameBoss, "Auto Farm Level")
                            if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                StopTween()
                                return
                            end
                            AddVelocity()
                            for _, boss in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if boss.Name == NameBoss and boss:FindFirstChild("Humanoid") and boss:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                                    repeat task.wait(Fast_Attack_Delay)
                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                            AddVelocity()
                                        end
                                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                                            StopTween()
                                            return
                                        end
                                        tween(boss:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Level")
                                        AddVelocity()
                                        if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                            FarmMastery(v)
                                        else
                                            UpdateWeapon()
                                            EquipWeapon(getgenv().Weapon)
                                            AttackNoCD()
                                        end
                                    until boss:FindFirstChild("Humanoid").Health <= 0
                                end
                            end
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                            StopTween()
                            return
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    tween(CFrameQuest, nil, nil, "Auto Farm Level")
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestNumber)
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    tween(CFrameMon, nil, nil, "Auto Farm Level")
                    if queue:empty() or queue:top() ~= "Auto Farm Level" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                end
                if queue:empty() or queue:top() ~= "Auto Farm Level" then
                    StopTween()
                    return
                end
                if v.Name == NameMob and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if getgenv().Bring_Mob then
                        local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                        BringMob(PosMon, NameMob)
                    end
                    repeat task.wait(Fast_Attack_Delay)
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Level" then
                            StopTween()
                            return
                        end
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Level")
                        AddVelocity()
                        if getgenv().Bring_Mob then
                            local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                            BringMob(PosMon, NameMob)
                        end
                        if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                            FarmMastery(v)
                        else
                            UpdateWeapon()
                            EquipWeapon(getgenv().Weapon)
                            AttackNoCD()
                        end
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
        Anti_AFK_Connection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
            task.wait(0.5)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
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
            task.wait(1)
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
            task.wait(1)
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
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", fruit, false)
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
            if queue:empty() or queue:top() ~= "Auto Bring Fruit" then
                StopTween()
                return
            end
            tween(v.Handle.CFrame, nil, nil, "Auto Bring Fruit", v.Name)
            if queue:empty() or queue:top() ~= "Auto Bring Fruit" then
                StopTween()
                return
            end
            AddVelocity()
            if queue:empty() or queue:top() ~= "Auto Bring Fruit" then
                StopTween()
                return
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
                if Quest_Done >= 10 then
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
local function FindBossQuest(boss)
    local QuestBossNumber = nil
    local NameQuestBoss = nil
    local LevelReqBoss = -999
    local CFrameQuestBoss = nil
    local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
    local Quests = require(game:GetService("ReplicatedStorage").Quests)
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" then
                for i2,v2 in pairs(v1["Task"]) do
                    if i2 == boss then
                        QuestBossNumber = i1
                        NameQuestBoss = i
                        LevelReqBoss = v1["LevelReq"]
                    end
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
    return NameQuestBoss, QuestBossNumber, CFrameQuestBoss, LevelReqBoss
end
local function AutoFarmBoss(boss)
    pcall(function()
        local CFrameBoss = nil
        CFrameBoss = FindBossCFrame(boss)
        if CFrameBoss == nil then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Boss not found!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            return
        end
        if getgenv().Claim_Boss_Quest then
            local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
            local NameQuestBoss, QuestBossNumber, CFrameQuestBoss, LevelReqBoss = FindBossQuest(boss)
            if CFrameQuestBoss ~= nil and LevelReqBoss <= Level then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(boss, 1, true) then
                    tween(CFrameQuestBoss, nil, boss, "Auto Farm Boss")
                    if queue:empty() or queue:top() ~= "Auto Farm Boss" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestBossNumber)
                    if queue:empty() or queue:top() ~= "Auto Farm Boss" then
                        StopTween()
                        return
                    end
                end
            end
        end
        tween(CFrameBoss, nil, boss, "Auto Farm Boss")
        if queue:empty() or queue:top() ~= "Auto Farm Boss" then
            StopTween()
            return
        end
        AddVelocity()
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name:find(boss, 1, true) and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                repeat task.wait(Fast_Attack_Delay)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if queue:empty() or queue:top() ~= "Auto Farm Boss" then
                        StopTween()
                        return
                    end
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Boss")
                    AddVelocity()
                    if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                        FarmMastery(v)
                    else
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    end
                until v:FindFirstChild("Humanoid").Health <= 0
            end
        end
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
end
local function AutoKen()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Status") ~= nil then
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        end
    end
end
local function SetSpawn()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
local function AutoFarmBone()
    if game.PlaceId ~= 7449423635 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Sea 3 only!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Bone_Toggle:Set(false)
        getgenv().Auto_Farm_Bone = false
        return
    end
    local CFrame_Bone = {
        ["Reborn Skeleton"] = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625),
        ["Living Zombie"] = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875),
        ["Demonic Soul"] = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625),
        ["Posessed Mummy"] = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
    }
    local NameMob_Bone = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
    if not queue:empty() and queue:top() == "Auto Farm Bone" and getgenv().Weapon ~= nil then
        pcall(function()
            if getgenv().Auto_Claim_Quest_Farm_Bone then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Reborn Skeleton") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Living Zombie") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Posessed Mummy")) then
                    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
                    if Level >= 1975 and Level <= 1999 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
                    elseif Level >= 2000 and Level <= 2024 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 2)
                    elseif Level >= 2025 and Level <= 2049 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                    elseif Level >= 2050 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
                    end
                end
            end
            if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                StopTween()
                return
            end
            local CFrameMon = nil
            local NameMob = NameMob_Bone[math.random(1, #NameMob_Bone)]
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
                CFrameMon = CFrame_Bone[NameMob]
            end
            if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                StopTween()
                return
            end
            if not game:GetService("Workspace").Enemies:FindFirstChild(NameMob) then
                tween(CFrameMon, nil, nil, "Auto Farm Bone")
                if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                    StopTween()
                    return
                end
                AddVelocity()
            end
            if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if getgenv().Auto_Claim_Quest_Farm_Bone then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Reborn Skeleton") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Living Zombie") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Posessed Mummy")) then
                        local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if Level >= 1975 and Level <= 1999 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
                        elseif Level >= 2000 and Level <= 2024 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 2)
                        elseif Level >= 2025 and Level <= 2049 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                        elseif Level >= 2050 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
                        end
                    end
                end
                if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                    StopTween()
                    return
                end
                if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if getgenv().Bring_Mob then
                            local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                            BringMob(PosMon, NameMob)
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                            StopTween()
                            return
                        end
                        repeat task.wait(Fast_Attack_Delay)
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                AddVelocity()
                            end
                            if queue:empty() or queue:top() ~= "Auto Farm Bone" then
                                StopTween()
                                return
                            end
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Bone")
                            AddVelocity()
                            if getgenv().Bring_Mob then
                                local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                                BringMob(PosMon, NameMob)
                            end
                            if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                FarmMastery(v)
                            else
                                UpdateWeapon()
                                EquipWeapon(getgenv().Weapon)
                                AttackNoCD()
                            end
                        until v:FindFirstChild("Humanoid").Health <= 0
                    end
                end
            end
        end)
    elseif not queue:empty() and queue:top() == "Auto Farm Bone" and getgenv().Weapon == nil then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Weapon not selected!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Bone_Toggle:Set(false)
        getgenv().Auto_Farm_Bone = false
    end
end
local function AutoFarmKata()
    if game.PlaceId ~= 7449423635 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Sea 3 only!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Kata_Toggle:Set(false)
        getgenv().Auto_Farm_Kata = false
        return
    end
    local CFrame_Kata = {
        ["Cookie Crafter"] = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375),
        ["Cake Guard"] = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875),
        ["Baking Staff"] = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375),
        ["Head Baker"] = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
    }
    local NameMob_Kata = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
    local NameBoss = "Cake Prince"
    if not queue:empty() and queue:top() == "Auto Farm Kata" and getgenv().Weapon ~= nil then
        pcall(function()
            if getgenv().Auto_Claim_Quest_Farm_Kata then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cake Guard") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Head Baker") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Baking Staff")) then
                    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
                    if Level >= 2200 and Level <= 2224 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                    elseif Level >= 2225 and Level <= 2249 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 2)
                    elseif Level >= 2250 and Level <= 2274 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 1)
                    elseif Level >= 2275 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 2)
                    end
                end
            end
            local CFrameBoss = FindBossCFrame(NameBoss)
            if CFrameBoss == nil then
                NameBoss = "Dough King"
                CFrameBoss = FindBossCFrame(NameBoss)
            end
            if CFrameBoss ~= nil then
                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                    StopTween()
                    return
                end
                tween(CFrameBoss, nil, NameBoss, "Auto Farm Kata")
                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                    StopTween()
                    return
                end
                AddVelocity()
                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                    StopTween()
                    return
                end
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                        StopTween()
                        return
                    end
                    if v.Name == NameBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        repeat task.wait(Fast_Attack_Delay)
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                AddVelocity()
                            end
                            if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                                StopTween()
                                return
                            end
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, -40, 0), nil, nil, "Auto Farm Kata")
                            AddVelocity()
                            if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                FarmMastery(v)
                            else
                                UpdateWeapon()
                                EquipWeapon(getgenv().Weapon)
                                AttackNoCD()
                            end
                        until v:FindFirstChild("Humanoid").Health <= 0
                    end
                end
            end
            local CFrameMon = nil
            local NameMob = NameMob_Kata[math.random(1, #NameMob_Kata)]
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
                CFrameMon = CFrame_Kata[NameMob]
            end
            if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                StopTween()
                return
            end
            if not game:GetService("Workspace").Enemies:FindFirstChild(NameMob) then
                tween(CFrameMon, nil, nil, "Auto Farm Kata")
                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                    StopTween()
                    return
                end
                AddVelocity()
            end
            if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if getgenv().Auto_Claim_Quest_Farm_Kata then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cake Guard") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Head Baker") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Baking Staff")) then
                        local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if Level >= 2200 and Level <= 2224 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                        elseif Level >= 2225 and Level <= 2249 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 2)
                        elseif Level >= 2250 and Level <= 2274 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 1)
                        elseif Level >= 2275 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 2)
                        end
                    end
                end
                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                    StopTween()
                    return
                end
                NameBoss = "Cake Prince"
                CFrameBoss = FindBossCFrame(NameBoss)
                if CFrameBoss == nil then
                    NameBoss = "Dough King"
                    CFrameBoss = FindBossCFrame(NameBoss)
                end
                if CFrameBoss ~= nil then
                    if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                        StopTween()
                        return
                    end
                    tween(CFrameBoss, nil, NameBoss, "Auto Farm Kata")
                    if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                        StopTween()
                        return
                    end
                    AddVelocity()
                    if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                        StopTween()
                        return
                    end
                    for _, boss in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                            StopTween()
                            return
                        end
                        if boss.Name == NameBoss and boss:FindFirstChild("Humanoid") and boss:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                            repeat task.wait(Fast_Attack_Delay)
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                    repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                    AddVelocity()
                                end
                                if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                                    StopTween()
                                    return
                                end
                                tween(boss:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, -40, 0), nil, nil, "Auto Farm Kata")
                                AddVelocity()
                                if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                    FarmMastery(v)
                                else
                                    UpdateWeapon()
                                    EquipWeapon(getgenv().Weapon)
                                    AttackNoCD()
                                end
                            until boss:FindFirstChild("Humanoid").Health <= 0
                        end
                    end
                end
                if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                            AddVelocity()
                        end
                        if getgenv().Bring_Mob then
                            local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                            BringMob(PosMon, NameMob)
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                            StopTween()
                            return
                        end
                        repeat task.wait(Fast_Attack_Delay)
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                                AddVelocity()
                            end
                            if queue:empty() or queue:top() ~= "Auto Farm Kata" then
                                StopTween()
                                return
                            end
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Kata")
                            AddVelocity()
                            if getgenv().Bring_Mob then
                                local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                                BringMob(PosMon, NameMob)
                            end
                            if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                                FarmMastery(v)
                            else
                                UpdateWeapon()
                                EquipWeapon(getgenv().Weapon)
                                AttackNoCD()
                            end
                        until v:FindFirstChild("Humanoid").Health <= 0
                    end
                end
            end
        end)
    elseif not queue:empty() and queue:top() == "Auto Farm Kata" and getgenv().Weapon == nil then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Weapon not selected!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Kata_Toggle:Set(false)
        getgenv().Auto_Farm_Kata = false
    end
end
local function UpdateMobKataKilled()
    pcall(function()
        Mob_Kata_Killed:Set("Mob Kata Killed: " .. (500 - tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"):match("([-]?%d+)"))) .. "/500")
    end)
end
local function FPSBoost()
    pcall(function()
        if not getgenv().Setting then
            getgenv().Setting = {
                Players = {
                    ["Ignore Me"] = true,
                    ["Ignore Others"] = true,
                    ["Ignore Tools"] = true
                },
                Meshes = {
                    NoMesh = false,
                    NoTexture = false,
                    Destroy = false
                },
                Images = {
                    Invisible = false,
                    Destroy = false
                },
                Explosions = {
                    Smaller = true,
                    Invisible = false,
                    Destroy = false
                },
                Particles = {
                    Invisible = true,
                    Destroy = false
                },
                TextLabels = {
                    LowerQuality = false,
                    Invisible = false,
                    Destroy = false
                },
                MeshParts = {
                    LowerQuality = true,
                    Invisible = false,
                    NoTexture = false,
                    NoMesh = false,
                    Destroy = false
                },
                Other = {
                    ["FPS Cap"] = 60,
                    ["No Camera Effects"] = true,
                    ["No Clothes"] = true,
                    ["Low Water Graphics"] = false,
                    ["No Shadows"] = true,
                    ["Low Rendering"] = false,
                    ["Low Quality Parts"] = true,
                    ["Low Quality Models"] = true,
                    ["Reset Materials"] = false,
                    ["Lower Quality MeshParts"] = true
                }
            }
        end
        local Players, Lighting, StarterGui, MaterialService = game:GetService("Players"), game:GetService("Lighting"), game:GetService("StarterGui"), game:GetService("MaterialService")
        local ME, CanBeEnabled = Players.LocalPlayer, {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles"}
        local function PartOfCharacter(Instance)
            for i, v in pairs(Players:GetPlayers()) do
                if v ~= ME and v.Character and Instance:IsDescendantOf(v.Character) then
                    return true
                end
            end
            return false
        end
        local function DescendantOfIgnore(Instance)
            for i, v in pairs(getgenv().Ignore) do
                if Instance:IsDescendantOf(v) or (Instance:IsDescendantOf("BodyVelocity"))then
                    return true
                end
            end
            return false
        end
        local function CheckIfBad(Instance)
            if(Instance.Parent ~= game:GetService("Workspace").Map) then
                return
            end
            if not Instance:IsDescendantOf(Players) and (getgenv().Setting.Players["Ignore Others"] and not PartOfCharacter(Instance) or not getgenv().Setting.Players["Ignore Others"]) and (getgenv().Setting.Players["Ignore Me"] and ME.Character and not Instance:IsDescendantOf(ME.Character) or not getgenv().Setting.Players["Ignore Me"]) and (getgenv().Setting.Players["Ignore Tools"] and not Instance:IsA("BackpackItem") and not Instance:FindFirstAncestorWhichIsA("BackpackItem") or not getgenv().Setting.Players["Ignore Tools"])--[[not PartOfCharacter(Instance)]] and (getgenv().Ignore and not table.find(getgenv().Ignore, Instance) and not DescendantOfIgnore(Instance) or (not getgenv().Ignore or type(getgenv().Ignore) ~= "table" or #getgenv().Ignore <= 0)) then
                if table.find(CanBeEnabled, Instance.ClassName) then
                    if true then
                        Instance.Enabled = false
                    end
                elseif Instance:IsA("PostEffect") and (getgenv().Setting["No Camera Effects"] or (getgenv().Setting.Other and getgenv().Setting.Other["No Camera Effects"])) then
                    Instance.Enabled = false
                elseif Instance:IsA("Explosion") then
                    if getgenv().Setting["Smaller Explosions"] or (getgenv().Setting.Other and getgenv().Setting.Other["Smaller Explosions"]) or (getgenv().Setting.Explosions and getgenv().Setting.Explosions.Smaller) then
                        Instance.BlastPressure = 1
                        Instance.BlastRadius = 1
                    end
                elseif Instance:IsA("Clothing") or Instance:IsA("SurfaceAppearance") or Instance:IsA("BaseWrap") then
                    if getgenv().Setting["No Clothes"] or (getgenv().Setting.Other and getgenv().Setting.Other["No Clothes"]) then
                        Instance:Destroy()
                    end
                elseif Instance:IsA("BasePart") and not Instance:IsA("MeshPart") then
                    if getgenv().Setting["Low Quality Parts"] or (getgenv().Setting.Other and getgenv().Setting.Other["Low Quality Parts"]) then
                        Instance.Material = Enum.Material.Plastic
                        Instance.Reflectance = 0
                    end
                elseif Instance:IsA("Model") then
                    if getgenv().Setting["Low Quality Models"] or (getgenv().Setting.Other and getgenv().Setting.Other["Low Quality Models"]) then
                        Instance.LevelOfDetail = 1
                    end
                elseif Instance:IsA("MeshPart") then
                    if getgenv().Setting["Invisible MeshParts"] or (getgenv().Setting.Other and getgenv().Setting.Other["Invisible MeshParts"]) or (getgenv().Setting.MeshParts and getgenv().Setting.MeshParts.Invisible) then
                        Instance.Transparency = 1
                        Instance.RenderFidelity = 2
                        Instance.Reflectance = 0
                        Instance.Material = Enum.Material.Plastic
                    end
                    if getgenv().Setting.MeshParts and getgenv().Setting.MeshParts.NoTexture then
                        Instance.TextureID = ""
                    end
                    if getgenv().Setting.MeshParts and getgenv().Setting.MeshParts.NoMesh then
                        Instance.MeshId = ""
                    end
                    if getgenv().Setting["No MeshParts"] or (getgenv().Setting.Other and getgenv().Setting.Other["No MeshParts"]) or (getgenv().Setting.MeshParts and getgenv().Setting.MeshParts.Destroy) then
                        Instance:Destroy()
                    end
                end
            end
        end
        coroutine.wrap(pcall)(function()
            if (getgenv().Setting["Low Water Graphics"] or (getgenv().Setting.Other and getgenv().Setting.Other["Low Water Graphics"])) then
                if not workspace:FindFirstChildOfClass("Terrain") then
                    repeat
                        task.wait()
                    until workspace:FindFirstChildOfClass("Terrain")
                end
                workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
                workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
                workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
                workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
                if sethiddenproperty then
                    sethiddenproperty(workspace:FindFirstChildOfClass("Terrain"), "Decoration", false)
                else
                end
            end
        end)
        coroutine.wrap(pcall)(function()
            if getgenv().Setting["No Shadows"] or (getgenv().Setting.Other and getgenv().Setting.Other["No Shadows"]) then
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                Lighting.ShadowSoftness = 0
                if sethiddenproperty then
                    sethiddenproperty(Lighting, "Technology", 2)
                else
                end
            end
        end)
        coroutine.wrap(pcall)(function()
            if getgenv().Setting["FPS Cap"] or (getgenv().Setting.Other and getgenv().Setting.Other["FPS Cap"]) then
                if setfpscap then
                    if type(getgenv().Setting["FPS Cap"] or (getgenv().Setting.Other and getgenv().Setting.Other["FPS Cap"])) == "string" or type(getgenv().Setting["FPS Cap"] or (getgenv().Setting.Other and getgenv().Setting.Other["FPS Cap"])) == "number" then
                        setfpscap(tonumber(getgenv().Setting["FPS Cap"] or (getgenv().Setting.Other and getgenv().Setting.Other["FPS Cap"])))
                    elseif getgenv().Setting["FPS Cap"] or (getgenv().Setting.Other and getgenv().Setting.Other["FPS Cap"]) == true then
                        setfpscap(1e6)
                    end
                else
                end
            end
        end)
        game.DescendantAdded:Connect(function(value)
            task.wait(getgenv().LoadedWait or 1)
            CheckIfBad(value)
        end)
        local Descendants = game:GetDescendants()
        local StartNumber = getgenv().WaitPerAmount or 500
        local WaitNumber = getgenv().WaitPerAmount or 500
        for i, v in pairs(Descendants) do
            CheckIfBad(v)
            if i == WaitNumber then
                task.wait()
                WaitNumber = WaitNumber + StartNumber
            end
        end
    end)
    local decalsyeeted = true
    local g = game
    local w = g:GetService("Workspace")
    local l = g.Lighting
    local t = w.Terrain
    l.Brightness = 0
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end
local function trim(string)
    return (string:gsub("^%s*(.-)%s*$", "%1"))
end
local function GetLowestValueFruit()
    local min = math.huge
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        min = math.min(min, v.Price)
    end
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        if v.Price == min and v.Price <= 1000000 then
            return v.Name
        end
    end
    return nil
end
local function KillAura()
    for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            pcall(function()
                sethiddenproperty(game:GetService("Players").LocalPlayer, "MaximumSimulationRadius",  math.huge)
                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",  9e20)
                v.Humanoid.Health = 0
                v.HumanoidRootPart.CanCollide = false
            end)
        end
    end
end
local function AutoRaid()
    if not W then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
            if not Dungeon_Wait then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                    task.wait(10)
                    if getgenv().Auto_Awaken_Fruit then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                    end
                end
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                    local fruit = GetLowestValueFruit()
                    if fruit == nil then
                        if getgenv().Auto_Raid_Hop then
                            if CheckFruit() then
                                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                                    if v:FindFirstChild("Fruit") then
                                        if queue:empty() or queue:top() ~= "Auto Raid" then
                                            StopTween()
                                            return
                                        end
                                        tween(v.Handle.CFrame, nil, nil, "Auto Raid", v.Name)
                                        if queue:empty() or queue:top() ~= "Auto Raid" then
                                            StopTween()
                                            return
                                        end
                                        AddVelocity()
                                        if queue:empty() or queue:top() ~= "Auto Raid" then
                                            StopTween()
                                            return
                                        end
                                    end
                                end
                                StoreFruit()
                                return
                            elseif not CheckFruit() then
                                OrionLib:MakeNotification({
                                    Name = "Status",
                                    Content = "No more trash fruit. Server hoping to get more...",
                                    Image = "rbxassetid://4483345998",
                                    Time = 1
                                })
                                HopServer()
                            end
                        elseif not getgenv().Auto_Raid_Hop then
                            OrionLib:MakeNotification({
                                Name = "Status",
                                Content = "Uh-oh. No more trash fruits. End auto raid here.",
                                Image = "rbxassetid://4483345998",
                                Time = 1
                            })
                            queue:pop("Auto Raid")
                            Auto_Raid_Toggle:Set(false)
                            getgenv().Auto_Raid = false
                            return
                        end
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", fruit)
                    if queue:empty() or queue:top() ~= "Auto Raid" then
                        StopTween()
                        return
                    end
                    EquipWeapon(fruit)
                    if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", getgenv().Dungeon)) ~= 1 then
                        OrionLib:MakeNotification({
                            Name = "Error",
                            Content = "Seems like you can't select this dungeon",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        return
                    end
                    if queue:empty() or queue:top() ~= "Auto Raid" then
                        StopTween()
                        return
                    end
                end
                if W2 then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif W3 then
                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                Dungeon_Wait = true
                repeat task.wait(1)
                    if queue:empty() or queue:top() ~= "Auto Raid" then
                        StopTween()
                        break
                    end
                until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                Dungeon_Wait = false
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
            if queue:empty() or queue:top() ~= "Auto Raid" then
                StopTween()
                return
            end
            KillAura()
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame*CFrame.new(0,80,0), nil, nil, "Auto Raid")
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                AddVelocity()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame*CFrame.new(0,80,0), nil, nil, "Auto Raid")
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                AddVelocity()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame*CFrame.new(0,80,0), nil, nil, "Auto Raid")
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                AddVelocity()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(0,80,0), nil, nil, "Auto Raid")
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                AddVelocity()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                tween(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame*CFrame.new(0,80,0), nil, nil, "Auto Raid")
                if queue:empty() or queue:top() ~= "Auto Raid" then
                    StopTween()
                    return
                end
                AddVelocity()
            end
        end
    end
end
local function BuyHakiColor()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "2")
end
local function BuyLegendSword()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
end
local function UpdateMoonStatus()
    local Moon_Phase = tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase"))
    if Moon_Phase < 4 or Moon_Phase > 5 then
        Moon_Status:Set("Moon Status: " .. tostring(Moon_Phase) .. "/8 (Bad Moon)")
    elseif Moon_Phase == 4 then
        Moon_Status:Set("Moon Status: " .. tostring(Moon_Phase) .. "/8 (Near Full Moon)")
    elseif Moon_Phase == 5 then
        Moon_Status:Set("Moon Status: " .. tostring(Moon_Phase) .. "/8 (Full Moon)")
    end
end
local function UpdateHakiColor()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= nil and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= "1" then
        Haki_Color:Set("Haki Color: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))
    else
        Haki_Color:Set("Haki Color: Not Found")
    end
end
local function CheckNight()
    if game:GetService("Lighting").ClockTime >= 18 or game:GetService("Lighting").ClockTime <= 5 then
        return true
    else
        return false
    end
end
local function UpdateMirageIsland()
    if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        Mirage_Island:Set("Mirage Island: Found")
    elseif not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        Mirage_Island:Set("Mirage Island: Not Found")
    end
end
local function UpdateKitsuneIsland()
    if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
        Kitsune_Island:Set("Kitsune Island: Found")
    elseif not game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
        Kitsune_Island:Set("Kitsune Island: Not Found")
    end
end
local function GetMirageHighestPoint()
    if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for _, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
    return nil
end
local function GetBlueGear()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        for _, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
    return nil
end
local function GetMirageDealer()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            if v.Name == "Advanced Fruit Dealer" then
                return v:FindFirstChild("HumanoidRootPart").CFrame
            end
        end
    end
    return nil
end
local function FarmElite()
    local Name_Elite = "Diablo"
    local CFrame_Elite = FindBossCFrame(Name_Elite)
    if not CFrame_Elite then
        Name_Elite = "Deandre"
        CFrame_Elite = FindBossCFrame(Name_Elite)
    end
    if not CFrame_Elite then
        Name_Elite = "Urban"
        CFrame_Elite = FindBossCFrame(Name_Elite)
    end
    if CFrame_Elite ~= nil then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(Name_Elite, 1, true) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
        end
        if queue:empty() or queue:top() ~= "Auto Kill Elite" then
            StopTween()
            return
        end
        tween(CFrame_Elite, nil, Name_Elite, "Auto Kill Elite")
        if queue:empty() or queue:top() ~= "Auto Kill Elite" then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if queue:empty() or queue:top() ~= "Auto Kill Elite" then
                StopTween()
                return
            end
            if v.Name == Name_Elite and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                repeat task.wait(Fast_Attack_Delay)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        AddVelocity()
                    end
                    if queue:empty() or queue:top() ~= "Auto Kill Elite" then
                        StopTween()
                        return
                    end
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Kill Elite")
                    AddVelocity()
                    if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                        FarmMastery(v)
                    else
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    end
                until v:FindFirstChild("Humanoid").Health <= 0
            end
        end
    end
end
local function UpdateEliteKilled()
    Elite_Killed:Set("Elite Killed: " .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")))
end
local function CheckNearestPort()
    local min_distance = math.huge
    local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for request_place, cframe in pairs(Ports) do
        min_distance = math.min(min_distance, math.abs((player.Position - cframe.Position).Magnitude))
    end
    for request_place, cframe in pairs(Ports) do
        if math.abs((player.Position - cframe.Position).Magnitude) == min_distance then
            return request_place
        end
    end
    return nil
end
local function SpamSkill(target, enable, delay)
    local Temp_Weapon_Type = getgenv().Weapon_Type
    for _, v in pairs(Weapon_Spam) do
        getgenv().Weapon_Type = v
        UpdateWeapon()
        EquipWeapon(getgenv().Weapon)
        local skill = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[getgenv().Weapon]
        if skill:FindFirstChild("Z") and skill.Z.Cooldown.Size.X.Scale == 0 then
            changeposmobtouseskill(target, "Z")
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
        end
        if skill:FindFirstChild("X") and skill.X.Cooldown.Size.X.Scale == 0 then
            changeposmobtouseskill(target, "X")
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
        end
        if skill:FindFirstChild("C") and skill.C.Cooldown.Size.X.Scale == 0 then
            changeposmobtouseskill(target, "C")
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
        end
        if skill:FindFirstChild("V") and skill.V.Cooldown.Size.X.Scale == 0 then
            changeposmobtouseskill(target, "V")
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
        end
        if skill:FindFirstChild("F") and skill.F.Cooldown.Size.X.Scale == 0 then
            changeposmobtouseskill(target, "F")
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"F",false,game)
        end
        if delay ~= nil then
            task.wait(delay)
        end
    end
    -- Enable
    if enable ~= nil then
        if enable == true then
            getgenv().Weapon_Type = Temp_Weapon_Type
            UpdateWeapon()
            EquipWeapon(getgenv().Weapon)
            AttackNoCD()
        end
    end

    getgenv().Weapon_Type = Temp_Weapon_Type
end
local function CheckShipRaid()
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade" or v.Name == "FishBoat" then
            if v:FindFirstChild("Health") and v:FindFirstChild("Engine") and v.Health.Value > 0 then
                return true
            end
        end
    end
    return false
end
local function CheckSeaBeast()
    for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000 and tonumber(v.Health.Value) > 0 then
            return true
        end
    end
    return false
end
local function CheckShark()
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
            return true
        end
    end
    return false
end
local function CheckPiranha()
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
            return true
        end
    end
    return false
end
local function CheckTerrorShark()
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Terrorshark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
            return true
        end
    end
    return false
end
local function tweenboat(place, speed, state, event)
    local Check_Fly = false
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
            AddVelocity()
        end
        local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local Check_Boat = false
        local Boat = nil
        local Seat = nil
        local Object = nil
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if v.Name == getgenv().Boat then
                if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                    if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                        if v.Humanoid.Value > 0 and tonumber(v.VehicleSeat.CFrame.Position.y) > 0 then
                            Check_Boat = true
                            Boat = v
                            Object = v.VehicleSeat
                            Seat = v.VehicleSeat.CFrame
                        end
                    end
                end
            end
        end
        if not Check_Boat then
            StopTween()
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Can't find your boat! Make sure to buy a boat first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            break
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == false then
            StopTween()
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Sit at your boat first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            break
        end
        if (player.Position - Seat.Position).Magnitude > 5 then
            StopTween()
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Sit at your boat first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            break
        end
        if not Boat:FindFirstChild("Humanoid") or Boat.Humanoid.Value < 0 then
            StopTween()
            break
        end
        AddVelocity()
        if not Object:FindFirstChild("Xero Hub 1") then
            NoClipBoat = Instance.new("BodyVelocity", Object)
            NoClipBoat.Name = "Xero Hub 1"
            NoClipBoat.P = 15000
            NoClipBoat.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            NoClipBoat.Velocity = Vector3.new(0,0,0) 
        end
        if not Object:FindFirstChild("Xero Hub 2") then
            local Gyro = Instance.new("BodyGyro", Object)
            Gyro.P = 9e4
            Gyro.Name = "Xero Hub 2"
            Gyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        end
        if not Check_Fly then
            Object.CFrame = Seat * CFrame.new(0, 30, 0)
            Check_Fly = true
        end
        for i, v in pairs(Boat:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Part") then
                v.CanCollide = false
            end
        end
        NoClip()
        local request_place = CheckNearestRequestIsland(place)
        if request_place ~= nil then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Request_Places[request_place].Position)
        end
        local Distance = (place.Position - Seat.Position).Magnitude
        if speed == nil then
            speed = 350
        end
        local TweenService = game:GetService("TweenService")
        local start = Seat.Position
        local _end = place.Position
        local distance = (start - _end).Magnitude
        local _time = distance/speed
        local info = TweenInfo.new(
            _time,
            Enum.EasingStyle.Linear
        )
        Tween = TweenService:Create(Object, info, {CFrame = place})
        Tween:Play()
        if Stop_Tween then
            break
        end
        if state ~= nil then
            if state == "Auto Farm Sea Event" then
                if not getgenv().Auto_Farm_Sea_Event then
                    StopTween()
                    break
                end
            end
        end
        if event ~= nil then
            if event == true then
                if getgenv().Kill_Sea_Beast and CheckSeaBeast() then
                    StopTween()
                    break
                elseif getgenv().Kill_Terror_Shark and CheckTerrorShark() then
                    StopTween()
                    break
                elseif getgenv().Kill_Shark and CheckShark() then
                    StopTween()
                    break
                elseif getgenv().Kill_Piranha and CheckPiranha() then
                    StopTween()
                    break
                elseif getgenv().Kill_Ship and CheckShipRaid() then
                    StopTween()
                    break
                elseif getgenv().Auto_Collect_Azure_Ember and CheckNight() and tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase")) == 5 and game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
                    StopTween()
                    break
                end
            end
        end
    until Distance <= 10
    RemoveVelocity()
end
local function AutoCollectAzureEmber()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and CheckNight() then
        local Shrine_Pos = GetShrinePosition()
        if Shrine_Pos ~= nil then
            if queue:empty() or queue:top() ~= "Auto Collect Azure Ember" or not CheckNight() then
                StopTween()
                return
            end
            StopTween()
            tween(Shrine_Pos, nil, nil, "Auto Collect Azure Ember")
            if queue:empty() or queue:top() ~= "Auto Collect Azure Ember" or not CheckNight() then
                StopTween()
                return
            end
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/TouchKitsuneStatue"):FireServer()
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        if queue:empty() or queue:top() ~= "Auto Collect Azure Ember" then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Workspace").EmberTemplate:GetDescendants()) do
            if queue:empty() or queue:top() ~= "Auto Collect Azure Ember" then
                StopTween()
                return
            end
            if v:IsA("BasePart") and v.Name == "Part" and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000 then
                OrionLib:MakeNotification({
                    Name = "Status",
                    Content = "Found Azure Ember!",
                    Image = "rbxassetid://4483345998",
                    Time = 1
                })
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                end
                if queue:empty() or queue:top() ~= "Auto Collect Azure Ember" then
                    StopTween()
                    return
                end
                AddVelocity()
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame
            end
        end
    end
end
local function AutoFarmSeaEvent()
    if not W3 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Sea 3 Only!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Farm_Sea_Event_Toggle:Set(false)
        getgenv().Auto_Farm_Sea_Event = false
        return
    end
    pcall(function()
        if getgenv().Auto_Collect_Azure_Ember and tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase")) == 5 and game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') and GetShrinePosition() ~= nil then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Kitsune Island!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and CheckNight() then
                local Shrine_Pos = GetShrinePosition()
                if Shrine_Pos ~= nil then
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not CheckNight() then
                        StopTween()
                        return
                    end
                    StopTween()
                    tween(Shrine_Pos, nil, nil, "Auto Farm Sea Event")
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not CheckNight() then
                        StopTween()
                        return
                    end
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/TouchKitsuneStatue"):FireServer()
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                    StopTween()
                    return
                end
                for _, v in pairs(game:GetService("Workspace").EmberTemplate:GetDescendants()) do
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                        StopTween()
                        return
                    end
                    if v:IsA("BasePart") and v.Name == "Part" and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000 then
                        OrionLib:MakeNotification({
                            Name = "Status",
                            Content = "Found Azure Ember!",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                            StopTween()
                            return
                        end
                        AddVelocity()
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame
                    end
                end
                return
            end
        elseif getgenv().Kill_Terror_Shark and CheckTerrorShark() then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Terror Shark!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Terror_Shark or not CheckTerrorShark() then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Terror_Shark or not CheckTerrorShark() then
                    StopTween()
                    return
                end
                if v.Name == "Terrorshark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Terror_Shark or not CheckTerrorShark() then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    repeat task.wait(0.01)
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Terror_Shark or not CheckTerrorShark() then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        if (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 50 then
                            OrionLib:MakeNotification({
                                Name = "Status",
                                Content = "Dodge",
                                Image = "rbxassetid://4483345998",
                                Time = 5
                            })
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 250, 0), nil, nil, "Auto Farm Sea Event")
                            AddVelocity()
                            task.wait(2)
                        else
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 40, 0), nil, nil, "Auto Farm Sea Event")
                        end
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Terror_Shark or not CheckTerrorShark() then
                            StopTween()
                            return
                        end
                        AddVelocity()
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        elseif getgenv().Kill_Sea_Beast and CheckSeaBeast() then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Sea Beast!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Sea_Beast or not CheckSeaBeast() then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Sea_Beast or not CheckSeaBeast() then
                    StopTween()
                    return
                end
                if v:FindFirstChild("HumanoidRootPart") and (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and tonumber(v.Health.Value) > 0 then
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Sea_Beast or not CheckSeaBeast() then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    repeat task.wait(0.01)
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Sea_Beast or not CheckSeaBeast() then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        if tonumber(v:FindFirstChild("HumanoidRootPart").CFrame.Position.y) + 500 > 0 then
                            tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(math.random(-50, 50), 500, math.random(-50, 50)), nil, nil, "Auto Farm Sea Event")
                            AddVelocity()
                            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Sea_Beast or not CheckSeaBeast() then
                                StopTween()
                                return
                            end
                            SpamSkill(v, nil, 0.25)
                        end
                    until tonumber(v.Health.Value) <= 0
                end
            end
        elseif getgenv().Kill_Shark and CheckShark() then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Shark!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Shark or not CheckShark() then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Shark or not CheckShark() then
                    StopTween()
                    return
                end
                if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Shark or not CheckShark() then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    repeat task.wait(Fast_Attack_Delay)
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Shark or not CheckShark() then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Sea Event")
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Shark or not CheckShark() then
                            StopTween()
                            return
                        end
                        AddVelocity()
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        elseif getgenv().Kill_Piranha and CheckPiranha() then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Piranha!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Piranha or not CheckPiranha() then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Piranha or not CheckPiranha() then
                    StopTween()
                    return
                end
                if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Piranha or not CheckPiranha() then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    repeat task.wait(Fast_Attack_Delay)
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Piranha or not CheckPiranha() then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Farm Sea Event")
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Piranha or not CheckPiranha() then
                            StopTween()
                            return
                        end
                        AddVelocity()
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    until v:FindFirstChild("Humanoid").Health <= 0
                end
            end
        elseif getgenv().Kill_Ship and CheckShipRaid() then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Found Ship Raid!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Ship or not CheckShipRaid() then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Ship or not CheckShipRaid() then
                    StopTween()
                    return
                end
                if v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade" or v.Name == "FishBoat" then
                    if v:FindFirstChild("Health") and v:FindFirstChild("Engine") and v.Health.Value > 0 then
                        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Ship or not CheckShipRaid() then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        repeat task.wait(0.01)
                            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Ship or not CheckShipRaid() then
                                StopTween()
                                return
                            end
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                StopTween()
                                return
                            end
                            tween(v.Engine.CFrame*CFrame.new(0, -20, 0), nil, nil, "Auto Farm Sea Event")
                            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" or not getgenv().Kill_Ship or not CheckShipRaid() then
                                StopTween()
                                return
                            end
                            AddVelocity()
                            SpamSkill(v, nil, 0.25)
                        until v.Health.Value <= 0
                    end
                end
            end
        end
        local Check_Boat = false
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if v.Name == getgenv().Boat then
                if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                    if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                        if v.Humanoid.Value > 0 and tonumber(v.VehicleSeat.CFrame.Position.y) > 0 then
                            Check_Boat = true
                        end
                    end
                end
            end
        end
        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
            StopTween()
            return
        end
        if not Check_Boat then
            local Port = CheckNearestPort()
            if Port ~= nil then
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                    StopTween()
                    return
                end
                StopTween()
                tween(Ports[Port], nil, nil, "Auto Farm Sea Event")
            end
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                StopTween()
                return
            end
            if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", getgenv().Boat)) == 1 then
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                    StopTween()
                    return
                end
                for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                        StopTween()
                        return
                    end
                    if v.Name == getgenv().Boat then
                        if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                            if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                                StopTween()
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                                end
                                repeat
                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                                        break
                                    end
                                    if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                                        StopTween()
                                        return
                                    end
                                    tween(v.VehicleSeat.CFrame, nil, nil, "Auto Farm Sea Event")
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                                    task.wait(2)
                                until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true or not v or Stop_Tween or queue:empty() or queue:top() ~= "Auto Farm Sea Event"
                            end
                        elseif not v:FindFirstChild("Owner") then
                            OrionLib:MakeNotification({
                                Name = "Error",
                                Content = "Can't get any information about the boat! Destroying the boat...",
                                Image = "rbxassetid://4483345998",
                                Time = 5
                            })
                            v:Destroy()
                            return
                        end
                    end
                end
            elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", getgenv().Boat)) ~= 1 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Can't buy boat! Make sure the boat is unlocked or you are near the sea.",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
                StopTween()
                return
            end
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == false then
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                StopTween()
                return
            end
            for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                    StopTween()
                    return
                end
                if v.Name == getgenv().Boat then
                    if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                        if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                            StopTween()
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                            end
                            repeat
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                                    break
                                end
                                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                                    StopTween()
                                    return
                                end
                                tween(v.VehicleSeat.CFrame, nil, nil, "Auto Farm Sea Event")
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                                task.wait(2)
                            until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true or not v or Stop_Tween or queue:empty() or queue:top() ~= "Auto Farm Sea Event"
                        end
                    elseif not v:FindFirstChild("Owner") then
                        OrionLib:MakeNotification({
                            Name = "Error",
                            Content = "Can't get any information about the boat! Destroying the boat...",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        v:Destroy()
                        return
                    end
                end
            end
        end
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.Visible == true then
            if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.TextLabel.Text) ~= tonumber(getgenv().Sea_Danger_Level) then
                if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                    StopTween()
                    return
                end
                StopTween()
                tweenboat(Sea_Level[getgenv().Sea_Danger_Level], nil, "Auto Farm Sea Event")
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.Visible == false then
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                StopTween()
                return
            end
            StopTween()
            tweenboat(Sea_Level[getgenv().Sea_Danger_Level], nil, "Auto Farm Sea Event")
        end
        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
            StopTween()
            return
        end
        local Boat = nil
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if v.Name == getgenv().Boat then
                if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                    if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                        if v.Humanoid.Value > 0 and tonumber(v.VehicleSeat.CFrame.Position.y) > 0 then
                            Boat = v
                        end
                    end
                end
            end
        end
        if not Boat then
            return
        end
        if (Sea_Level[getgenv().Sea_Danger_Level] * CFrame.new(-5000, 0, 0).Position - Boat.VehicleSeat.CFrame * CFrame.new(0, 20, 0).Position).Magnitude <= 100 then
            Go_Left = false
        elseif (Sea_Level[getgenv().Sea_Danger_Level] * CFrame.new(5000, 0, 0).Position - Boat.VehicleSeat.CFrame * CFrame.new(0, 20, 0).Position).Magnitude <= 100 then
            Go_Left = true
        end
        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
            StopTween()
            return
        end
        if Go_Left then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Left",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                StopTween()
                return
            end
            tweenboat(Sea_Level[getgenv().Sea_Danger_Level] * CFrame.new(-5000, 0, 0), 150, "Auto Farm Sea Event", true)
        elseif not Go_Left then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Right",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
                StopTween()
                return
            end
            tweenboat(Sea_Level[getgenv().Sea_Danger_Level] * CFrame.new(5000, 0, 0), 150, "Auto Farm Sea Event", true)
        end
        if queue:empty() or queue:top() ~= "Auto Farm Sea Event" then
            StopTween()
            return
        end
    end)
end
local function AutoDoneTrial()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" or game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
            KillAura()
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            for _, v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                if queue:empty() or queue:top() ~= "Auto Done Trial" then
                    StopTween()
                    return
                end
                if v.Name ==  "snowisland_Cylinder.081" then
                    tween(v.CFrame, nil, nil, "Auto Done Trial")
                end
            end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
            if queue:empty() or queue:top() ~= "Auto Done Trial" then
                StopTween()
                return
            end
            for _, v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                if queue:empty() or queue:top() ~= "Auto Done Trial" then
                    StopTween()
                    return
                end
                if v.Name == "HumanoidRootPart" then
                    OrionLib:MakeNotification({
                        Name = "Status",
                        Content = "Found Sea Beast!",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                    if queue:empty() or queue:top() ~= "Auto Done Trial" then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    repeat task.wait(0.01)
                        if queue:empty() or queue:top() ~= "Auto Done Trial" then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        if tonumber(v.CFrame.Position.y) + 250 > 0 then
                            tween(v.CFrame*CFrame.new(math.random(-50, 50), 250, math.random(-50, 50)), nil, nil, "Auto Done Trial")
                            AddVelocity()
                            if queue:empty() or queue:top() ~= "Auto Done Trial" then
                                StopTween()
                                return
                            end
                            SpamSkill(v.Parent, nil, 0.25)
                        end
                    until not v.Name or game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                end
            end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
            tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1), nil, nil, "Auto Done Trial")
            AddVelocity()
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
            for _ ,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if queue:empty() or queue:top() ~= "Auto Done Trial" then
                    StopTween()
                    return
                end
                if v.Name == "StartPoint" then
                    tween(v.CFrame, nil, nil, "Auto Done Trial")
                end
            end
        end
    end
end
local function AutoKillPlayer()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        if queue:empty() or queue:top() ~= "Auto Kill Player" then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Players"):GetChildren()) do
            if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and (v.Character:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 200 then
                    StopTween()
                    repeat task.wait()
                        if queue:empty() or queue:top() ~= "Auto Kill Player" then
                            StopTween()
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                            StopTween()
                            return
                        end
                        Counter_Attack = Counter_Attack + 1
                        if Counter_Attack % 2 == 0 then
                            tween(v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame(math.random(0, 100), math.random(0, 50), math.random(0, 100)), nil, nil, "Auto Kill Player")
                        else
                            tween(v.Character:FindFirstChild("HumanoidRootPart").CFrame, nil, nil, "Auto Kill Player")
                        end
                        if queue:empty() or queue:top() ~= "Auto Kill Player" then
                            StopTween()
                            return
                        end
                        UpdateWeapon()
                        SpamSkill(v.Character, true)
                        if Counter_Attack > 100000000 then
                            Counter_Attack = 0
                        end
                    until v.Character:FindFirstChild("Humanoid").Health <= 0 or not v.Character or not v or game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                end
            end
        end
    end
end
local function TurnOnRaceV3()
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
end
local function TurnOnRaceV4()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
end
local function AutoRaceV2()
    if game.PlaceId ~= 4442272183 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Sea 2 Only!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Race_V2_Toggle:Set(false)
        getgenv().Auto_Race_V2 = false
        return
    end
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == -2 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Your race is already V2 or above!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Race_V2_Toggle:Set(false)
        getgenv().Auto_Race_V2 = false
        return
    end
    if game:GetService("Players").LocalPlayer.Data.Beli.Value < 500000 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "You must have at least $500.000!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Race_V2_Toggle:Set(false)
        getgenv().Auto_Race_V2 = false
        return
    end
    if queue:empty() or queue:top() ~= "Auto Race V2" then
        StopTween()
        return
    end
    if not CheckNight() and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Only work at night!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        Auto_Race_V2_Toggle:Set(false)
        getgenv().Auto_Race_V2 = false
        return
    end
    if queue:empty() or queue:top() ~= "Auto Race V2" then
        StopTween()
        return
    end
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002), nil, nil, "Auto Race V2")
        AddVelocity()
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
    end
    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") and CheckNight() then
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if queue:empty() or queue:top() ~= "Auto Race V2" then
                StopTween()
                return
            end
            if v.Name == "Flower1" then
                repeat task.wait()
                    if queue:empty() or queue:top() ~= "Auto Race V2" then
                        StopTween()
                        return
                    end
                    if not CheckNight() then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    tween(v.CFrame, nil, nil, "Auto Race V2")
                    if queue:empty() or queue:top() ~= "Auto Race V2" then
                        StopTween()
                        return
                    end
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,0)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                    task.wait(2)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")
            end
        end
    end
    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if queue:empty() or queue:top() ~= "Auto Race V2" then
                StopTween()
                return
            end
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                StopTween()
                return
            end
            if v.Name == "Flower2" then
                repeat task.wait()
                    if queue:empty() or queue:top() ~= "Auto Race V2" then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    tween(v.CFrame, nil, nil, "Auto Race V2")
                    if queue:empty() or queue:top() ~= "Auto Race V2" then
                        StopTween()
                        return
                    end
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,0)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                    task.wait(2)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")
            end
        end
    end
    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            StopTween()
            return
        end
        tween(CFrame.new(-5854.39014, 145.093857, -686.942017), nil, nil, "Auto Race V2")
        if queue:empty() or queue:top() ~= "Auto Race V2" then
            StopTween()
            return
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            StopTween()
            return
        end
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                break
            end
            if queue:empty() or queue:top() ~= "Auto Race V2" then
                StopTween()
                return
            end
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                StopTween()
                return
            end
            if v.Name == "Zombie" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                if queue:empty() or queue:top() ~= "Auto Race V2" then
                    StopTween()
                    return
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                    StopTween()
                    return
                end
                if getgenv().Bring_Mob then
                    local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                    BringMob(PosMon, NameMob)
                end
                repeat task.wait(Fast_Attack_Delay)
                    if queue:empty() or queue:top() ~= "Auto Race V2" then
                        StopTween()
                        return
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                        StopTween()
                        return
                    end
                    tween(v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 30, 0), nil, nil, "Auto Race V2")
                    AddVelocity()
                    if getgenv().Bring_Mob then
                        local PosMon = v:FindFirstChild("HumanoidRootPart").CFrame
                        BringMob(PosMon, NameMob)
                    end
                    if getgenv().Farm_Mastery and (tonumber(v:FindFirstChild("Humanoid").Health) / tonumber(v:FindFirstChild("Humanoid").MaxHealth)) * 100 <= tonumber(getgenv().Farm_Mastery_Health) then
                        FarmMastery(v)
                    else
                        UpdateWeapon()
                        EquipWeapon(getgenv().Weapon)
                        AttackNoCD()
                    end
                until v:FindFirstChild("Humanoid").Health <= 0
            end
        end
    end
    if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
        StopTween()
        Auto_Race_V2_Toggle:Set(false)
        getgenv().Auto_Race_V2 = false
        return
    end
end
local function GetNumberOfAzureEmber()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if v.Name == "Azure Ember" then
            return v.Count
        end
    end
    return 0
end
local function TradeAzureEmber()
    if GetNumberOfAzureEmber() >= getgenv().Trade_Azure_Ember_At then
        local pos = GetShrinePosition()
        if pos ~= nil then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = pos
        end
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
    end
end
local function BuyUpgradeGear()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("UpgradeRace", "Buy")
end
local function UpdateV4Status()
    local status, stage, fragment = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if status == 1 or status == 3 then
        Race_V4_Status:Set("You need to train more.")
    elseif status == 2 or status == 4 or status == 7 then
        Race_V4_Status:Set("You can buy upgrade with " .. tostring(fragment) .. " Fragments.")
    elseif status == 5 then
        Race_V4_Status:Set("Your V4 is max.")
    elseif status == 6 then
        Race_V4_Status:Set("Stages: " .. tostring(stage - 2) .. "/3 for your V4 to be ready for trial.")
    elseif status == 0 then
        Race_V4_Status:Set("You are ready for trial.")
    elseif status == 8 then
        Race_V4_Status:Set("You have " .. tostring(10 - stage) .. " training sessions to completed to be max.")
    end
end

-- Notify functions
local function encode(string)
    local result = ""

    -- Ceaser Cipher
    for i = 1, string.len(string) do
        local char = string.sub(string, i, i)

        if char:match("%w") then
            if char:match("%a") then
                local base = string.byte('a')
                if char:match("%u") then
                    base = string.byte('A')
                end
                result = result .. string.char((string.byte(char) - base + 1) % 26 + base)
            elseif char:match("%d") then
                result = result .. string.char((string.byte(char) - string.byte('0') + 3) % 10 + string.byte('0'))
            end
        else
            result = result .. char
        end
    end

    -- Hex
    local final_result = ""
    for i = 1, #result do
        final_result = final_result .. string.format("%02x", result:byte(i))
    end

    -- Ascii
    local perfect = ""
    for i = 1, string.len(final_result) do
        local char = string.sub(final_result, i, i)
        perfect = perfect .. string.char(string.byte(char) + 5)
    end

    return perfect
end
local function shuffle(tbl)
    local rand = math.random
    local n = #tbl

    while n > 2 do
        local k = rand(n)
        tbl[n], tbl[k] = tbl[k], tbl[n]
        n = n - 1
    end
end
local function HakiColorNotify()
    while task.wait(1) do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= nil and tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")) ~= "1" then
            local request = request or fluxus and fluxus_request or http.request

            local code = 'Verudous'
            local type_noti = (trim(tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))) ~= "Snow White" and trim(tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))) ~= "Pure Red" and trim(tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))) ~= "Winter Sky") and 'haki' or 'legendcolor'
            local time = tostring(os.time())
            local list = {code, type_noti, time}
            shuffle(list)
            local key = table.concat(list)
            
            local embed = {
                title = "Haki Color Notifier | Xero Hub",
                type = "rich",
                color = 3447003,
                fields = {
                    {name = "Haki Color Name", value = '```' .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")) .. '```', inline = true},
                    {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = true},
                    {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                    {name = "Join Script", value = '```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(' .. game.PlaceId .. ', \"' .. game.JobId .. '\", game:GetService(\"Players\").LocalPlayer)```', inline = false}
                },
                footer = {text = 'https://discord.gg/FdyuDrRp99'},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
            }

            if type_noti == 'legendcolor' then
                embed.title = "Legend Haki Color Notifier | Xero Hub"
            end

            local payload = {
                embeds = {embed}
            }
            local HttpService = game:GetService("HttpService")

            local data = {
                key = encode(key),
                payload = encode(HttpService:JSONEncode(payload))
            }
            
            local a = nil
            repeat task.wait(0.01)
                a = request({
                        Url = 'http://apixerohub.x10.mx/',
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = HttpService:JSONEncode(data)
                    })
            until a and tostring(a["Body"]) ~= "Expired!"
            repeat task.wait(1) until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") == nil
        end
    end
end
local function MirageNotify()
    while task.wait(1) do
        if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            local request = request or fluxus and fluxus_request or http.request

            local code = 'Verudous'
            local type_noti = 'mirage'
            local time = tostring(os.time())
            local list = {code, type_noti, time}
            shuffle(list)
            local key = table.concat(list)
            
            local time_of_day = (CheckNight() and "Night") or "Day"

            local embed = {
                title = "Mirage Island Notifier | Xero Hub",
                type = "rich",
                color = 3447003,
                fields = {
                    {name = "Time", value = '```' .. time_of_day .. '```', inline = true},
                    {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = true},
                    {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                    {name = "Join Script", value = '```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(' .. game.PlaceId .. ', \"' .. game.JobId .. '\", game:GetService(\"Players\").LocalPlayer)```', inline = false}
                },
                footer = {text = 'https://discord.gg/FdyuDrRp99'},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
            }

            local payload = {
                embeds = {embed}
            }
            local HttpService = game:GetService("HttpService")

            local data = {
                key = encode(key),
                payload = encode(HttpService:JSONEncode(payload))
            }
            
            local a = nil
            repeat task.wait(0.01)
                a = request({
                        Url = 'http://apixerohub.x10.mx/',
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = HttpService:JSONEncode(data)
                    })
            until a and tostring(a["Body"]) ~= "Expired!"
            repeat task.wait(1) until not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild('Mirage Island')
        end
    end
end
local function KitsuneNotify()
    while task.wait(1) do
        if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
            local request = request or fluxus and fluxus_request or http.request

            local code = 'Verudous'
            local type_noti = 'kitsune'
            local time = tostring(os.time())
            local list = {code, type_noti, time}
            shuffle(list)
            local key = table.concat(list)

            local embed = {
                title = "Kitsune Island Notifier | Xero Hub",
                type = "rich",
                color = 3447003,
                fields = {
                    {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = false},
                    {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                    {name = "Join Script", value = '```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(' .. game.PlaceId .. ', \"' .. game.JobId .. '\", game:GetService(\"Players\").LocalPlayer)```', inline = false}
                },
                footer = {text = 'https://discord.gg/FdyuDrRp99'},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
            }

            local payload = {
                embeds = {embed}
            }
            local HttpService = game:GetService("HttpService")

            local data = {
                key = encode(key),
                payload = encode(HttpService:JSONEncode(payload))
            }
            
            local a = nil
            repeat task.wait(0.01)
                a = request({
                        Url = 'http://apixerohub.x10.mx/',
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = HttpService:JSONEncode(data)
                    })
            until a and tostring(a["Body"]) ~= "Expired!"
            repeat task.wait(1) until not game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland')
        end
    end
end
local function MoonNotify()
    while task.wait(1) do
        if W3 then
            local Moon_Phase = tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase"))
            if Moon_Phase == 4 or Moon_Phase == 5 then
                local request = request or fluxus and fluxus_request or http.request

                local code = 'Verudous'
                local type_noti = (Moon_Phase == 4 and "nearmoon") or "fullmoon"
                local moon_status = (Moon_Phase == 4 and "Near Full Moon") or "Full Moon"
                local time = tostring(os.time())
                local list = {code, type_noti, time}
                shuffle(list)
                local key = table.concat(list)

                local embed = {
                    title = "Near Full Moon Notifier | Xero Hub",
                    type = "rich",
                    color = 3447003,
                    fields = {
                        {name = "Moon Status", value = '```' .. moon_status .. '```', inline = true},
                        {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = true},
                        {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                        {name = "Join Script", value = '```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(' .. game.PlaceId .. ', \"' .. game.JobId .. '\", game:GetService(\"Players\").LocalPlayer)```', inline = false}
                    },
                    footer = {text = 'https://discord.gg/FdyuDrRp99'},
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
                }

                if Moon_Phase == 5 then
                    embed.title = "Full Moon Notifier | Xero Hub"
                end

                local payload = {
                    embeds = {embed}
                }
                local HttpService = game:GetService("HttpService")

                local data = {
                    key = encode(key),
                    payload = encode(HttpService:JSONEncode(payload))
                }
                
                local a = nil
                repeat task.wait(0.01)
                    a = request({
                            Url = 'http://apixerohub.x10.mx/',
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = HttpService:JSONEncode(data)
                        })
                until a and tostring(a["Body"]) ~= "Expired!"
                repeat task.wait(1) until tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase")) ~= Moon_Phase
            end
        end
    end
end
task.spawn(MirageNotify)
task.spawn(HakiColorNotify)
task.spawn(KitsuneNotify)
task.spawn(MoonNotify)

-- Log
local function Log()
    local request = request or fluxus and fluxus_request or http.request
    local url = "https://discord.com/api/webhooks/1191345813243318402/AsBv_h5uzRfxTsXqhM0WR9ICw1ee23JGV3GYCKuphumOTTzW6icW5nnujDyEDb62qGnO"
    local embed = {
        title = "**Xero Hub**",
        color = 65280, 
        fields = {
            {name = "**Username**", value = "```" .. game:GetService("Players").LocalPlayer.Name .. "```", inline = true},
        }
    }
    local payload = {
        embeds = {embed}
    }
    request{
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(payload)
    }
end
Log()

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
        ["Pirate Starter"] = CFrame.new(1027.58875, 16.4154949, 1367.28564),
        ["Middle Town"] = CFrame.new(-529.4104, 7.8525033, 1604.88416),
        ["Jungle"] = CFrame.new(-1255.14795, 11.8520432, 349.906677), 
        ["Pirate Village"] = CFrame.new(-1120.14856, 4.7520504, 3855.31763),
        ["Mob boss"] = CFrame.new(Vector3.new(-2837.60669, 7.39224672, 5321.62109)),
        ["Desert"] = CFrame.new(Vector3.new(1094.15, 6.43846, 4192.89)),
        ["Marine Fortress"] = CFrame.new(Vector3.new(-4810.17, 20.7623, 4355.83)),
        ["Skylands"] = CFrame.new(Vector3.new(-4897.01, 717.686, -2624.6)),
        ["Prison"] = CFrame.new(Vector3.new(4880.64, 5.65229, 737.439)),
        ["Fountain City"] = CFrame.new(Vector3.new(5227.1, 38.5011, 4077.84)),
        ["Sky Area 2"] = CFrame.new(-7894.61767578125, 5547.1416015625, -380.29119873046875),
        ["Whirl Pool"] = CFrame.new(3864.6884765625, 6.736950397491455, -1926.214111328125),
        ["Sky Area 1"] = CFrame.new(-4607.82275, 872.54248, -1667.55688),
        ["Magma Village"] = CFrame.new(Vector3.new(-5352.62, 8.59067, 8466.86)),
        ["Frozen Village"] = CFrame.new(Vector3.new(1342.66, 87.2728, -1358.63)),
        ["Marine Starter"] = CFrame.new(Vector3.new(-2756.49, 24.4388, 2109.86)),
        ["Colosseum"] = CFrame.new(Vector3.new(-1482.86, 7.38934, -2940.23)),
        ["Underwater City"] = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
    }
    Bosses = {"The Saw", "Greybeard"}
    Ports = {
        ["1"] = CFrame.new(-2469, 6, 2043),
        ["2"] = CFrame.new(706, 3, 1427),
        ["3"] = CFrame.new(-365, 2, 1599),
        ["4"] = CFrame.new(-1294, 7, 535),
        ["5"] = CFrame.new(880, 2, 4094),
        ["6"] = CFrame.new(-1120, 3, 3772),
        ["7"] = CFrame.new(-4762, 4, 4296),
        ["8"] = CFrame.new(1077, 6, -1085),
        ["9"] = CFrame.new(-5179, 7, 8410),
        ["10"] = CFrame.new(4849, 5, 740),
        ["11"] = CFrame.new(3876, 5, -1892),
        ["12"] = CFrame.new(5506, 1, 4021),
        ["13"] = CFrame.new(-1428, 7, -2745),
        ["14"] = CFrame.new(-4847, 1, -2367)
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
        ["Green Zone"] = CFrame.new(-2202.3706054688, 73.097663879395, -2819.2687988281),
        ["Graveyard"] = CFrame.new(-5617.5927734375, 492.22183227539, -778.3017578125),
        ["Dark Area"] = CFrame.new(3464.7700195313, 13.375151634216, -3368.90234375),
        ["Snow Mountain"] = CFrame.new(561.23834228516, 401.44781494141, -5297.14453125),
        ["Hot Island"] = CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875),
        ["Cold Island"] = CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375),
        ["Ice Castle"] = CFrame.new(6111.7109375, 294.41259765625, -6716.4829101563),
        ["Remote Island"] = CFrame.new(4760.4985351563, 8.3444719314575, 2849.2426757813),
        ["Cave Island"] = CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531),
        ["Forgotten Island"] = CFrame.new(-3051.9514160156, 238.87203979492, -10250.807617188),
        ["Cursed Ship"] = CFrame.new(923.21252441406, 126.9760055542, 32852.83203125),
        ["Mini Sky"] = CFrame.new(-262.11901855469, 49325.69140625, -35272.49609375)
    }
    Bosses = {"Darkbeard", "Cursed Captain"}
    Ports = {
        ["1"] = CFrame.new(-9, 10, 2914),
        ["2"] = CFrame.new(-1913, 6, -2531),
        ["3"] = CFrame.new(3317, 8, -3269),
        ["4"] = CFrame.new(5568, 0, -5741),
        ["5"] = CFrame.new(-73, 8, -4977),
        ["6"] = CFrame.new(-5856, 2, -5136),
        ["7"] = CFrame.new(-5304, 4, -708),
        ["8"] = CFrame.new(-2804, 2, -9404)
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
        ["Great Tree"] = CFrame.new(2276.0859375, 25.87850189209, -6493.03125),
        ["Zou Island"] = CFrame.new(-10034.40234375, 331.78845214844, -8319.6923828125),
        ["Pineapple Village"] = CFrame.new(-11172.950195313, 331.8049621582, -10151.033203125),
        ["Mansion"] = CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375),
        ["Castle on the sea"] = CFrame.new(-5498.0458984375, 313.79473876953, -2860.6022949219),
        ["Haunted Castle"] = CFrame.new(-9515.07324, 142.130615, 5537.58398),
        ["Ice Cream Island"] = CFrame.new(-691.829, 371.943, -11106.4),
        ["Sea of treats"] = CFrame.new(-2073.262451171875, 37.16134262084961, -10183.3271484375),
        ["Cake Loaf"] = CFrame.new(-2099.33, 66.9971, -12128.6),
        ["Isle Outpost"] = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625),
        ["Mini Sky"] = CFrame.new(-262.11901855469, 49325.69140625, -35272.49609375),
        ["Chocolate Island"] = CFrame.new(-92, 9, -11980)
    }
    Bosses = {"rip_indra", "Soul Reaper", "Cake Prince", "Dough King", "Terrorshark"}
    Ports = {
        ["1"] = CFrame.new(-286, 6, 5208),
        ["2"] = CFrame.new(-9527, 7, -8349),
        ["3"] = CFrame.new(-1767, 9, -11364),
        ["4"] = CFrame.new(-2050, 4, -9848),
        ["5"] = CFrame.new(-9529, 21, 4546),
        ["6"] = CFrame.new(2203, 5, -6275),
        ["7"] = CFrame.new(-16924, 9, 410),
        ["8"] = CFrame.new(-965, 7, -10789),
        ["9"] = CFrame.new(3914, 10, -2620),
        ["10"] = CFrame.new(-6090, 16, -2203),
        ["11"] = CFrame.new(-92, 9, -11980)
    }
end
AntiReset()
UpdateWeapon()

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
Main:AddLabel("V4.6.2")
Main:AddTextbox({
    Name = "Input Join Script here",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        pcall(function()
            placeid = trim(string.match(Value, "TeleportToPlaceInstance%((%d+),"))
            jobid = trim(string.match(Value, 'TeleportToPlaceInstance%(%d+,%s*"(.-)"'))
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeid, jobid, game:GetService("Players").LocalPlayer)
            if placeid == '4442272183' then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
            elseif placeid == '2753915549'then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
            elseif placeid == '7449423635' then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            end
        end)
	end
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
Main:AddButton({
    Name = "FPS Boost",
    Callback = function()
        FPSBoost()
    end
})
Main:AddButton({
    Name = "Redeem All EXP Codes",
    Callback = function()
        RedeemAllCode()
    end
})
Auto_Race_V2_Toggle = Main:AddToggle({
    Name = "Auto Race V2",
	Default = getgenv().Auto_Race_V2,
	Callback = function(Value)
        StopTween()
		getgenv().Auto_Race_V2 = Value
	end
})
Main:AddLabel("Select Weapon to spam for auto sea event and auto v4.")
Main:AddToggle({
    Name = "Spam Skill Melee",
	Default = getgenv().Melee_Spam,
	Callback = function(Value)
		getgenv().Melee_Spam = Value
        if getgenv().Melee_Spam then
            table.insert(Weapon_Spam, "Melee")
        elseif not getgenv().Melee_Spam then
            local index = nil
            for i, v in pairs(Weapon_Spam) do
                if v == "Melee" then
                    index = i
                    break
                end
            end
            if index ~= nil then
                table.remove(Weapon_Spam, index)
            end
        end
	end
})
Main:AddToggle({
    Name = "Spam Skill Sword",
	Default = getgenv().Sword_Spam,
	Callback = function(Value)
		getgenv().Sword_Spam = Value
        if getgenv().Sword_Spam then
            table.insert(Weapon_Spam, "Sword")
        elseif not getgenv().Sword_Spam then
            local index = nil
            for i, v in pairs(Weapon_Spam) do
                if v == "Sword" then
                    index = i
                    break
                end
            end
            if index ~= nil then
                table.remove(Weapon_Spam, index)
            end
        end
	end
})
Main:AddToggle({
    Name = "Spam Skill Fruit",
	Default = getgenv().Fruit_Spam,
	Callback = function(Value)
		getgenv().Fruit_Spam = Value
        if getgenv().Fruit_Spam then
            table.insert(Weapon_Spam, "Fruit")
        elseif not getgenv().Fruit_Spam then
            local index = nil
            for i, v in pairs(Weapon_Spam) do
                if v == "Fruit" then
                    index = i
                    break
                end
            end
            if index ~= nil then
                table.remove(Weapon_Spam, index)
            end
        end
	end
})
Main:AddToggle({
    Name = "Spam Skill Gun",
	Default = getgenv().Gun_Spam,
	Callback = function(Value)
		getgenv().Gun_Spam = Value
        if getgenv().Gun_Spam then
            table.insert(Weapon_Spam, "Gun")
        elseif not getgenv().Gun_Spam then
            local index = nil
            for i, v in pairs(Weapon_Spam) do
                if v == "Gun" then
                    index = i
                    break
                end
            end
            if index ~= nil then
                table.remove(Weapon_Spam, index)
            end
        end
	end
})
Main:AddLabel("------------------------------------------------------------------------------")
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
Main:AddToggle({
    Name = "Auto Turn On Buso",
	Default = getgenv().Auto_Buso,
	Callback = function(Value)
		getgenv().Auto_Buso = Value
  	end
})
Main:AddToggle({
    Name = "Auto Turn On Ken Haki",
	Default = getgenv().Auto_Ken_Haki,
	Callback = function(Value)
		getgenv().Auto_Ken_Haki = Value
  	end
})
Main:AddToggle({
    Name = "Auto Turn On Race V3",
	Default = getgenv().Auto_Turn_On_Race_V3,
	Callback = function(Value)
		getgenv().Auto_Turn_On_Race_V3 = Value
  	end
})
Main:AddToggle({
    Name = "Auto Turn On Race V4",
	Default = getgenv().Auto_Turn_On_Race_V4,
	Callback = function(Value)
		getgenv().Auto_Turn_On_Race_V4 = Value
  	end
})
Main:AddToggle({
    Name = "Auto Set Spawn Point",
	Default = getgenv().Auto_Set_Spawn,
	Callback = function(Value)
		getgenv().Auto_Set_Spawn = Value
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
    Name = "Safe Auto Farm Level (Supports English)",
    Default = getgenv().Safe_Auto_Farm_Level,
    Callback = function(Value)
        getgenv().Safe_Auto_Farm_Level = Value
    end
})
AutoFarm:AddToggle({
    Name = "White Screen",
    Default = false,
    Callback = function(Value)
        if Value then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
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
            Default = getgenv().Fruit_Auto_Third_Sea,
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
                        CFrameBoss = FindBossCFrame(i2)
                        if CFrameBoss ~= nil then
                            table.insert(Boss_List, i2)
                        end
                    end
                end
            end
        end
        for _, boss in pairs(Bosses) do
            local CFrameBoss = nil
            CFrameBoss = FindBossCFrame(boss)
            if CFrameBoss ~= nil then
                table.insert(Boss_List, boss)
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
AutoFarm:AddToggle({
	Name = "Claim Boss Quest",
	Default = getgenv().Claim_Boss_Quest,
	Callback = function(Value)
		getgenv().Claim_Boss_Quest = Value
	end
})
AutoFarm:AddLabel("Farm Mastery")
AutoFarm:AddDropdown({
	Name = "Select Weapon To Farm Mastery",
	Default = getgenv().Weapon_Type_Mastery,
	Options = {"Fruit"},
	Callback = function(Value)
        getgenv().Weapon_Type_Mastery = Value
	end
})
AutoFarm:AddTextbox({
    Name = "Use Skill When Health At (%)",
    Default = getgenv().Farm_Mastery_Health,
    TextDisappear = false,
    Callback = function(Value)
        local Number = tonumber(Value)
        if Number then
            if Number < 0 or Number > 100 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "0 -> 100 Only!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            else
                getgenv().Farm_Mastery_Health = Number
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Make sure to input a number!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})
AutoFarm:AddToggle({
	Name = "Farm Mastery",
	Default = getgenv().Farm_Mastery,
	Callback = function(Value)
		getgenv().Farm_Mastery = Value
	end
})
AutoFarm:AddToggle({
	Name = "Skill Z",
	Default = getgenv().Skill_Z_Mastery,
	Callback = function(Value)
		getgenv().Skill_Z_Mastery = Value
	end
})
AutoFarm:AddToggle({
	Name = "Skill X",
	Default = getgenv().Skill_X_Mastery,
	Callback = function(Value)
		getgenv().Skill_X_Mastery = Value
	end
})
AutoFarm:AddToggle({
	Name = "Skill C",
	Default = getgenv().Skill_C_Mastery,
	Callback = function(Value)
		getgenv().Skill_C_Mastery = Value
	end
})
AutoFarm:AddToggle({
	Name = "Skill V",
	Default = getgenv().Skill_V_Mastery,
	Callback = function(Value)
		getgenv().Skill_V_Mastery = Value
	end
})
AutoFarm:AddToggle({
	Name = "Skill F",
	Default = getgenv().Skill_F_Mastery,
	Callback = function(Value)
		getgenv().Skill_F_Mastery = Value
	end
})
-- Sub Farm
local SubFarm = Window:MakeTab({
    Name = "Sub-Farming",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Auto_Farm_Bone_Toggle = SubFarm:AddToggle({
    Name = "Auto Farm Bone",
    Default = getgenv().Auto_Farm_Bone,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Farm_Bone = Value
    end
})
SubFarm:AddToggle({
    Name = "Auto Claim Quest When Farm Bone",
    Default = getgenv().Auto_Claim_Quest_Farm_Bone,
    Callback = function(Value)
        getgenv().Auto_Claim_Quest_Farm_Bone = Value
    end
})
Mob_Kata_Killed = SubFarm:AddLabel("Mob Kata Killed: 0/500")
Auto_Farm_Kata_Toggle = SubFarm:AddToggle({
    Name = "Auto Farm Katakuri",
    Default = getgenv().Auto_Farm_Kata,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Farm_Kata = Value
    end
})
SubFarm:AddToggle({
    Name = "Auto Claim Quest When Farm Katakuri",
    Default = getgenv().Auto_Claim_Quest_Farm_Kata,
    Callback = function(Value)
        getgenv().Auto_Claim_Quest_Farm_Kata = Value
    end
})
Elite_Killed = SubFarm:AddLabel("Elite Killed: 0")
SubFarm:AddToggle({
    Name = "Auto Kill Elite",
    Default = getgenv().Auto_Kill_Elite,
    Callback = function(Value)
        getgenv().Auto_Kill_Elite = Value
    end
})
SubFarm:AddToggle({
    Name = "Auto Kill Elite Hop",
    Default = getgenv().Auto_Kill_Elite_Hop,
    Callback = function(Value)
        getgenv().Auto_Kill_Elite_Hop = Value
    end
})
-- Race V4
local RaceV4 = Window:MakeTab({
    Name = "Race V4",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Race_V4_Status = RaceV4:AddLabel("You don't have V4.")
RaceV4:AddToggle({
    Name = "Auto Done Trial V4",
    Default = getgenv().Auto_Done_Trial,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Done_Trial = Value
    end
})
RaceV4:AddToggle({
    Name = "Auto Kill Player After Trial V4",
    Default = getgenv().Auto_Kill_Player,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Kill_Player = Value
    end
})
RaceV4:AddToggle({
    Name = "Auto Buy Upgrade Gear",
    Default = getgenv().Auto_Buy_Upgrade_Gear,
    Callback = function(Value)
        getgenv().Auto_Buy_Upgrade_Gear = Value
    end
})
RaceV4:AddButton({
    Name = "Teleport To Acient One",
    Callback = function()
        StopTween()
        tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
})
RaceV4:AddButton({
    Name = "Teleport To Acient Clock",
    Callback = function()
        StopTween()
        tween(CFrame.new(29548, 15068, -89))
    end
})
RaceV4:AddButton({
    Name = "Teleport To Mirage Island",
    Callback = function()
        if GetMirageHighestPoint() ~= nil then
            local Highest_Point = GetMirageHighestPoint()
            StopTween()
            tween(Highest_Point.CFrame * CFrame.new(0, 211.88, 0))
        end
    end
})
RaceV4:AddButton({
    Name = "Teleport To Advanced Fruit Dealer",
    Callback = function()
        if GetMirageDealer() ~= nil then
            local Mirage_Dealer = GetMirageDealer()
            StopTween()
            tween(Mirage_Dealer)
        end
    end
})
RaceV4:AddButton({
    Name = "Remove Fog",
    Callback = function()
        game.Lighting.FogEnd = math.huge
    end
})
RaceV4:AddButton({
    Name = "Move Camera To Moon Direction (Also turn on race ability)",
    Callback = function()
        local Moon_Direction = game.Lighting:GetMoonDirection()
        local Pos = game:GetService("Workspace").CurrentCamera.CFrame.p + Moon_Direction * 100
        game:GetService("Workspace").CurrentCamera.CFrame = CFrame.lookAt(game:GetService("Workspace").CurrentCamera.CFrame.p, Pos)
        game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
        game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
    end
})
RaceV4:AddButton({
    Name = "Teleport To Blue Gear",
    Callback = function()
        if GetBlueGear() ~= nil then
            local Blue_Gear = GetBlueGear()
            StopTween()
            tween(Blue_Gear.CFrame)
        end
    end
})
RaceV4:AddButton({
    Name = "Teleport To Temple Of Time",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875).Position)
    end
})
RaceV4:AddButton({
    Name = "Pull Lever",
    Callback = function()
        StopTween()
        tween(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        for i,v in pairs(game:GetService("Workspace").Map["Temple of Time"]:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Lever") then
                fireproximityprompt(v.Prompt.ProximityPrompt, 5)
            end
        end
    end
})
RaceV4:AddButton({
    Name = "Teleport To Trial Door",
    Callback = function()
        StopTween()
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
            tween(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
            tween(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
            tween(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            tween(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
            tween(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
            tween(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        end
    end
})
-- Kitsune Event
local KitsuneEvent = Window:MakeTab({
    Name = "Kitsune Event",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
KitsuneEvent:AddButton({
    Name = "Teleport To Kitsune Island",
    Callback = function()
        local Shrine_Pos = GetShrinePosition()
        if Shrine_Pos ~= nil then
            StopTween()
            tween(Shrine_Pos)
        end
    end
})
KitsuneEvent:AddToggle({
    Name = "Auto Collect Azure Ember",
    Default = getgenv().Auto_Collect_Azure_Ember,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Collect_Azure_Ember = Value
    end
})
KitsuneEvent:AddToggle({
    Name = "Auto Trade Azure Ember",
    Default = getgenv().Auto_Trade_Azure_Ember,
    Callback = function(Value)
        getgenv().Auto_Trade_Azure_Ember = Value
    end
})
KitsuneEvent:AddTextbox({
    Name = "Trade Azure Ember At",
    Default = tostring(getgenv().Trade_Azure_Ember_At),
    TextDisappear = false,
    Callback = function(Value)
        local Number = tonumber(Value)
        if Number then
            if Number < 0 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Must be greater or equal 0!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            elseif Number > 25 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Max is 25!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            else
                getgenv().Trade_Azure_Ember_At = Number
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Make sure to input a number!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})
-- Sea Event
local SeaEvent = Window:MakeTab({
    Name = "Sea Event",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
SeaEvent:AddDropdown({
	Name = "Select Boat To Buy",
	Default = getgenv().Boat,
	Options = Boats,
	Callback = function(Value)
        getgenv().Boat = Value
	end
})
SeaEvent:AddButton({
    Name = "Tween To Nearest Port",
    Callback = function()
        local Port = CheckNearestPort()
        if Port ~= nil then
            StopTween()
            tween(Ports[Port])
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Something not right happened. Please try again!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
SeaEvent:AddButton({
    Name = "Buy Boat",
    Callback = function()
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", getgenv().Boat) ~= 1 then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Can't buy boat! Make sure the boat is unlocked or you are near the sea.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
SeaEvent:AddButton({
    Name = "Sit At Boat",
    Callback = function()
        local Check_Boat = false
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if v.Name == getgenv().Boat then
                if v:FindFirstChild("Owner") and v:FindFirstChild("VehicleSeat") then
                    if tostring(v:FindFirstChild("Owner").Value) == game:GetService("Players").LocalPlayer.Name then
                        Check_Boat = true
                        StopTween()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                        end
                        repeat
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                                break
                            end
                            tween(v.VehicleSeat.CFrame)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                            task.wait(2)
                        until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true or not v or Stop_Tween
                    end
                elseif not v:FindFirstChild("Owner") then
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "Can't get any information about the boat! Destroying the boat...",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                    v:Destroy()
                end
            end
        end
        if not Check_Boat then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Can't find your boat! Make sure to buy a boat first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
SeaEvent:AddDropdown({
	Name = "Select Sea Danger Level",
	Default = getgenv().Sea_Danger_Level,
	Options = {"0", "1", "2", "3", "4", "5", "6"},
	Callback = function(Value)
        getgenv().Sea_Danger_Level = Value
	end
})
SeaEvent:AddButton({
    Name = "Teleport To Selected Sea Danger Level",
    Callback = function()
        StopTween()
        tweenboat(Sea_Level[getgenv().Sea_Danger_Level])
    end
})
Auto_Farm_Sea_Event_Toggle = SeaEvent:AddToggle({
    Name = "Auto Farm Sea Event",
    Default = getgenv().Auto_Farm_Sea_Event,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Farm_Sea_Event = Value
    end
})
SeaEvent:AddToggle({
    Name = "Kill Shark",
    Default = getgenv().Kill_Shark,
    Callback = function(Value)
        StopTween()
        getgenv().Kill_Shark = Value
    end
})
SeaEvent:AddToggle({
    Name = "Kill Piranha",
    Default = getgenv().Kill_Piranha,
    Callback = function(Value)
        StopTween()
        getgenv().Kill_Piranha = Value
    end
})
SeaEvent:AddToggle({
    Name = "Kill Terror Shark",
    Default = getgenv().Kill_Terror_Shark,
    Callback = function(Value)
        StopTween()
        getgenv().Kill_Terror_Shark = Value
    end
})
SeaEvent:AddToggle({
    Name = "Kill Sea Beast",
    Default = getgenv().Kill_Sea_Beast,
    Callback = function(Value)
        StopTween()
        getgenv().Kill_Sea_Beast = Value
    end
})
SeaEvent:AddToggle({
    Name = "Kill Ship",
    Default = getgenv().Kill_Ship,
    Callback = function(Value)
        StopTween()
        getgenv().Kill_Ship = Value
    end
})
-- Teleport
local Teleport = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
if W then
    local Island_List = {}
    for i, v in pairs(Islands) do
        table.insert(Island_List, i)
    end
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = Island_List,
        Callback = function(Value)
            StopTween()
            tween(Islands[Value])
        end
    })
elseif W2 then
    local Island_List = {}
    for i, v in pairs(Islands) do
        table.insert(Island_List, i)
    end
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = Island_List,
        Callback = function(Value)
            StopTween()
            tween(Islands[Value])
        end
    })
elseif W3 then
    local Island_List = {}
    for i, v in pairs(Islands) do
        table.insert(Island_List, i)
    end
    Teleport:AddDropdown({
        Name = "Teleport island",
        Default = "Choose island to teleport",
        Options = Island_List,
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
Teleport:AddTextbox({
    Name = "Max players for hop low server",
    Default = getgenv().Max_Players,
    TextDisappear = false,
    Callback = function(Value)
        local Number = tonumber(Value)
        if Number then
            if Number < 0 or Number > 12 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Must be greater or equal 0 and smaller or equal 12!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            else
                getgenv().Max_Players = Number
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Make sure to input a number!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
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
-- Raid
local Raid = Window:MakeTab({
    Name = "Raid",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Raid:AddDropdown({
    Name = "Select Dungeon",
    Default = getgenv().Dungeon,
    Options = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Buddha", "Sand", "Dough", "Phoenix"},
    Callback = function(Value)
        getgenv().Dungeon = Value
    end
})
Raid:AddButton({
    Name = "Buy Chip",
    Callback = function()
        if getgenv().Dungeon ~= nil then
            if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", getgenv().Dungeon)) ~= 1 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Seems like you can't select this dungeon",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        elseif getgenv().Dungeon == nil then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Select a dungeon first!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})
Auto_Raid_Toggle = Raid:AddToggle({
    Name = "Auto Raid",
    Default = getgenv().Auto_Raid,
    Callback = function(Value)
        StopTween()
        getgenv().Auto_Raid = Value
    end
})
Raid:AddToggle({
    Name = "Auto Raid Hop",
    Default = getgenv().Auto_Raid_Hop,
    Callback = function(Value)
        getgenv().Auto_Raid_Hop = Value
    end
})
Raid:AddToggle({
    Name = "Auto Awaken Fruit",
    Default = getgenv().Auto_Awaken_Fruit,
    Callback = function(Value)
        getgenv().Auto_Awaken_Fruit = Value
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
Stats:AddTextbox({
    Name = "Points",
    Default = getgenv().Stat_Points,
    TextDisappear = false,
    Callback = function(Value)
        local Number = tonumber(Value)
        if Number then
            if Number < 0 then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Must be greater or equal 0!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            else
                getgenv().Stat_Points = Number
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Make sure to input a number!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
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
	Options = {"Kilo", "Spin", "Chop", "Spring", "Bomb", "Smoke", "Spike", "Flame", "Falcon", "Ice", "Sand", "Dark", "Revive", "Diamond", "Light", "Rubber", "Barrier", "Magma", "Quake", "Buddha", "Love", "Spider", "Phoenix", "Portal", "Rumble", "Paw", "Blizzard", "Gravity", "T-rex", "Dough", "Shadow", "Venom", "Control", "Spirit", "Dragon", "Leopard", "Kitsune"},
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
        if string.find(item, "Kabucha") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
        else
		    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem",item)
        end
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
Shop:AddButton({
	Name = "Buy Refund Stat (2500F)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
	    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
  	end
})
Shop:AddButton({
	Name = "Buy Reroll Race (3000F)",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
  	end
})
Shop:AddButton({
	Name = "Buy True Triple Katana",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan", "2")
  	end
})
Shop:AddToggle({
	Name = "Auto Buy Bone",
	Default = getgenv().Auto_Buy_Bone,
	Callback = function(Value)
		getgenv().Auto_Buy_Bone = Value
	end
})
Shop:AddToggle({
	Name = "Auto Buy Haki Color",
	Default = getgenv().Auto_Buy_Haki_Color,
	Callback = function(Value)
		getgenv().Auto_Buy_Haki_Color = Value
	end
})
if W2 then
    Shop:AddToggle({
        Name = "Auto Buy Legend Sword",
        Default = getgenv().Auto_Buy_Legend_Sword,
        Callback = function(Value)
            getgenv().Auto_Buy_Legend_Sword = Value
        end
    })
end
-- Misc
local Misc = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Haki_Color = Misc:AddLabel("Haki Color: Not Found")
Moon_Status = Misc:AddLabel("Moon Status: Checking...")
Mirage_Island = Misc:AddLabel("Mirage Island: Not Found")
Kitsune_Island = Misc:AddLabel("Kitsune Island: Not Found")
Misc:AddButton({
	Name = "Open Devil Fruit Shop",
	Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
  	end
})
Misc:AddButton({
	Name = "Open Advanced Devil Fruit Shop",
	Callback = function()
        Mirage_Stock = true
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        Mirage_Stock = false
  	end
})
Misc:AddButton({
	Name = "Open Haki Color Menu",
	Callback = function()
        game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
  	end
})
Misc:AddButton({
	Name = "Open Titles Menu",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true 
  	end
})
Misc:AddButton({
	Name = "Open Fruit Awaken Menu",
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
  	end
})
Misc:AddButton({
	Name = "Change Team To Marines",
	Callback = function()
        game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("CommF_"):InvokeServer("SetTeam", "Marines")
  	end
})
Misc:AddButton({
	Name = "Change Team To Pirates",
	Callback = function()
        game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("CommF_"):InvokeServer("SetTeam", "Pirates")
  	end
})

-- Execute
--Run extend functions
task.spawn(function()
    while task.wait() do
        pcall(function()
            AddStats()
            SafeAutoFarmLevel()
            if getgenv().Auto_Buy_Legend_Sword then
                BuyLegendSword()
            end
            if getgenv().Auto_Buy_Haki_Color then
                BuyHakiColor()
            end
            if getgenv().Auto_Set_Spawn then
                SetSpawn()
            end
            if getgenv().Auto_Ken_Haki then
                AutoKen()
            end
            if getgenv().Auto_Buso then
                AutoBuso()
            end
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
            if getgenv().Auto_Turn_On_Race_V3 then
                TurnOnRaceV3()
            end
            if getgenv().Auto_Turn_On_Race_V4 then
                TurnOnRaceV4()
            end
            if getgenv().Auto_Trade_Azure_Ember then
                TradeAzureEmber()
            end
            if getgenv().Auto_Buy_Upgrade_Gear then
                BuyUpgradeGear()
            end
        end)
    end
end)
-- Update status functions
task.spawn(function()
    while task.wait() do
        UpdateMoonStatus()
        if W3 then
            UpdateMirageIsland()
            UpdateKitsuneIsland()
            UpdateMobKataKilled()
        end
        if not W then
            UpdateHakiColor()
        end
        UpdateEliteKilled()
        UpdateV4Status()
    end
end)
-- Modify queue
task.spawn(function()
    while task.wait() do
        if getgenv().Auto_Farm_Level then
            queue:push("Auto Farm Level", Priority["Auto Farm Level"])
        elseif not getgenv().Auto_Farm_Level then
            queue:pop("Auto Farm Level")
        end
        if getgenv().Auto_Bring_Fruit then
            if CheckFruit() then
                if not Check_Fruit then
                    StopTween()
                    Check_Fruit = true
                end
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
                    Check_Fruit = false
                    queue:pop("Auto Bring Fruit")
                end
            end
        elseif not getgenv().Auto_Bring_Fruit then
            Check_Fruit = false
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
                Check_Boss = false
                queue:pop("Auto Farm Boss")
            elseif getgenv().Boss_To_Farm ~= nil then
                local CFrameBoss = nil
                CFrameBoss = FindBossCFrame(getgenv().Boss_To_Farm)
                if CFrameBoss ~= nil then
                    if not Check_Boss then
                        StopTween()
                        Check_Boss = true
                    end
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
                        Check_Boss = false
                        queue:pop("Auto Farm Boss")
                    end
                end
            elseif getgenv().Boss_To_Farm == nil then
                Check_Boss = false
                queue:pop("Auto Farm Boss")
            end
        elseif not getgenv().Auto_Farm_Boss then
            Check_Boss = false
            queue:pop("Auto Farm Boss")
        end
        if getgenv().Auto_Farm_Bone then
            queue:push("Auto Farm Bone", Priority["Auto Farm Bone"])
        elseif not getgenv().Auto_Farm_Bone then
            queue:pop("Auto Farm Bone")
        end
        if getgenv().Auto_Farm_Kata then
            queue:push("Auto Farm Kata", Priority["Auto Farm Kata"])
        elseif not getgenv().Auto_Farm_Kata then
            queue:pop("Auto Farm Kata")
        end
        if getgenv().Auto_Raid then
            if getgenv().Dungeon == nil then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Select a dungeon first!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
                queue:pop("Auto Raid")
                Auto_Raid_Toggle:Set(false)
                getgenv().Auto_Raid = false
            elseif getgenv().Dungeon ~= nil then
                queue:push("Auto Raid", Priority["Auto Raid"])
            end
        elseif not getgenv().Auto_Raid then
            queue:pop("Auto Raid")
        end
        if getgenv().Auto_Kill_Elite then
            local Name_Elite = "Diablo"
            local CFrame_Elite = FindBossCFrame(Name_Elite)
            if not CFrame_Elite then
                Name_Elite = "Deandre"
                CFrame_Elite = FindBossCFrame(Name_Elite)
            end
            if not CFrame_Elite then
                Name_Elite = "Urban"
                CFrame_Elite = FindBossCFrame(Name_Elite)
            end
            if CFrame_Elite == nil then
                if getgenv().Auto_Kill_Elite_Hop then
                    OrionLib:MakeNotification({
                        Name = "Status",
                        Content = "Elite not found. Server hoping...",
                        Image = "rbxassetid://4483345998",
                        Time = 1
                    })
                    HopServer()
                elseif not getgenv().Auto_Kill_Elite_Hop then
                    Check_Elite = false
                    queue:pop("Auto Kill Elite")
                end
            elseif CFrame_Elite ~= nil then
                if not Check_Elite then
                    StopTween()
                    Check_Elite = true
                end
                queue:push("Auto Kill Elite", Priority["Auto Kill Elite"])
            end
        elseif not getgenv().Auto_Kill_Elite then
            Check_Elite = false
            queue:pop("Auto Kill Elite")
        end
        if getgenv().Auto_Farm_Sea_Event then
            queue:push("Auto Farm Sea Event", Priority["Auto Farm Sea Event"])
        elseif not getgenv().Auto_Farm_Sea_Event then
            queue:pop("Auto Farm Sea Event")
        end
        if getgenv().Auto_Done_Trial then
            queue:push("Auto Done Trial", Priority["Auto Done Trial"])
        elseif not getgenv().Auto_Done_Trial then
            queue:pop("Auto Done Trial")
        end
        if getgenv().Auto_Kill_Player then
            queue:push("Auto Kill Player", Priority["Auto Kill Player"])
        elseif not getgenv().Auto_Kill_Player then
            queue:pop("Auto Kill Player")
        end
        if getgenv().Auto_Race_V2 then
            queue:push("Auto Race V2", Priority["Auto Race V2"])
        elseif not getgenv().Auto_Race_V2 then
            queue:pop("Auto Race V2")
        end
        if getgenv().Auto_Collect_Azure_Ember then
            if CheckNight() and tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase")) == 5 and game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') and GetShrinePosition() ~= nil then
                queue:push("Auto Collect Azure Ember", Priority["Auto Collect Azure Ember"])
            else
                queue:pop("Auto Collect Azure Ember")
            end
        elseif not getgenv().Auto_Collect_Azure_Ember then
            queue:pop("Auto Collect Azure Ember")
        end
    end
end)
-- Run functions
task.spawn(function()
    while task.wait() do
        if not queue:empty() then
            if queue:top() == "Auto Farm Level" then
                AutoFarmLevel()
            elseif queue:top() == "Auto Bring Fruit" then
                BringFruit()
            elseif queue:top() == "Auto Farm Boss" then
                AutoFarmBoss(getgenv().Boss_To_Farm)
            elseif queue:top() == "Auto Farm Bone" then
                AutoFarmBone()
            elseif queue:top() == "Auto Farm Kata" then
                AutoFarmKata()
            elseif queue:top() == "Auto Raid" then
                AutoRaid()
            elseif queue:top() == "Auto Kill Elite" then
                FarmElite()
            elseif queue:top() == "Auto Farm Sea Event" then
                AutoFarmSeaEvent()
            elseif queue:top() == "Auto Done Trial" then
                AutoDoneTrial()
            elseif queue:top() == "Auto Kill Player" then
                AutoKillPlayer()
            elseif queue:top() == "Auto Race V2" then
                AutoRaceV2()
            elseif queue:top() == "Auto Collect Azure Ember" then
                AutoCollectAzureEmber()
            end
        end
    end
end)
