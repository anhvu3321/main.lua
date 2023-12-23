print("Script executed")
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
    if v:IsA("TextLabel") and v.Name == "NotificationTemplate" then
        if string.find(v.Text, "QUEST COMPLETED") then
            print("Quest done")
        end
    end
end
