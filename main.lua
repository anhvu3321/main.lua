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
local NameQuestBoss, QuestBossNumber, CFrameQuestBoss, LevelReqBoss = FindBossQuest("Stone")
print(NameQuestBoss, QuestBossNumber, CFrameQuestBoss, LevelReqBoss)
