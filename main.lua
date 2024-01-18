function GetLocalBoat()
    for i, v in next, game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if
                v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and
                    v.Humanoid.Value > 0
                then
                return v
            end
        end
    end
end
function FlyBoat(boat,enable) 
    if not boat then return end
    if not enable then 
        if boat:FindFirstChild("Fly Model") then 
            boat:FindFirstChild("Fly Model"):Destroy()
            return 
        end  
        if boat:FindFirstChild("Fly Model V2") then 
            boat:FindFirstChild("Fly Model V2"):Destroy()
            return 
        end 
    end 
    
    local bg = Instance.new("BodyGyro", boat)
    bg.P = 9e4
    bg.Name = "Fly Model V2"
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = boat.VehicleSeat.CFrame
    NoClipInstance = Instance.new("BodyVelocity",boat)
    NoClipInstance.Name = "Fly Model"
    NoClipInstance.P = 15000
    NoClipInstance.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    NoClipInstance.Velocity = Vector3.new(0,0,0) 
    NoClipInstance.CFrame = boat.VehicleSeat.CFrame
    boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.CFrame.X,boat.VehicleSeat.CFrame.Y+250,boat.VehicleSeat.CFrame.Z)
end
FlyBoat(GetLocalBoat(), true)
