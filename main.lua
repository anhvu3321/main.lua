local function tween(place, item, boss, state, fruit)
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
            
        end
        local request_place = CheckNearestRequestIsland(place)
        if request_place ~= nil then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Request_Places[request_place].Position)
        end
        local player = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
        end
        
        
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
            repeat task.wait(1) until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
            
        end
        if Stop_Tween then
            break
        end
        if item ~= nil then
            if item == "Third Sea" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(item) and not game:GetService("Players").LocalPlayer.Character:FindFirstChild(item) then
                
                break
            end
        end
        if boss ~= nil then
            local CFrameBoss = FindBossCFrame(boss)
            if CFrameBoss == nil then
                
                break
            end
        end
        if state ~= nil then
            if state == "Auto Farm Level" then
                if not getgenv().Auto_Farm_Level then
                    
                    break
                end
            elseif state == "Auto Farm Boss" then
                if not getgenv().Auto_Farm_Boss then
                    
                    break
                end
            elseif state == "Auto Farm Bone" then
                if not getgenv().Auto_Farm_Bone then
                    
                    break
                end
            elseif state == "Auto Farm Kata" then
                if not getgenv().Auto_Farm_Kata then
                    
                    break
                end
            elseif state == "Auto Bring Fruit" then
                if not getgenv().Auto_Bring_Fruit then
                    
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
                
                break
            end
        end
    until Distance <= 10
    RemoveVelocity()
end
tween(CFrame.new(-1126.82251, 16.9443321, -14430.4238))
