if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cake Guard") or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Head Baker") or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Baking Staff") then
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
