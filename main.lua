local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
for i, v in pairs(game.Players.LocalPlayer.PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
    if v:IsA("TextLabel") and child.Name == "NotificationTemplate" then
        if string.find(v.Text, "QUEST COMPLETED") then
            OrionLib:MakeNotification({
                Name = "Status",
                Content = "Quest Done",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
end
