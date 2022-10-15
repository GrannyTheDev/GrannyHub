local shit = {}

function shit:Tp(Position)
game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = Position
end

function shit:Tween(Time, Position)
game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), Time, {CFrame = Position}):Play()
end

return shit