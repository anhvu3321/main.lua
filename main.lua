local function CheckBossQuest()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    local NameBoss = nil
    local QuestNumber = nil
    local NameQuest = nil
    local CFrameBoss = nil
    local CFrameQuest = nil
    local LevelReq = -999
    local Quests = require(game:GetService("ReplicatedStorage").Quests)
    local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
    local MaxLevelReqCurrentSea = -999
    for i,v in pairs(Quests) do
        for i1,v1 in pairs(v) do
            if i ~= "CitizenQuest" and i ~= "BartiloQuest" and v1["LevelReq"] <= Level then
                for i2,v2 in pairs(v1["Task"]) do
                    if v2 == 1 then
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
                    NameBoss = i2
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
    print(NameQuest, QuestNumber, CFrameQuest, NameBoss, CFrameBoss)
end
CheckBossQuest()
