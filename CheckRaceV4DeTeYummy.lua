local RaceV4 = false
local NumberOfGear = 0
local plr = game.Players.LocalPlayer
local char = plr.Character
-- bool gạt cần
local gatcan = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("CheckTempleDoor")
-- Kiểm tra xem có v4 chưa

if plr.Backpack:FindFirstChild("Awakening") or char:FindFirstChild("Awakening") then
    RaceV4 = true
end

-- Đếm số gear
for i,v in pairs(plr.PlayerGui:FindFirstChild("TempleGui"):FindFirstChild("GearButtons"):GetChildren()) do
    NumberOfGear = NumberOfGear + 1
end

if RaceV4 == true then
    print("Có V4 không? : có")
    print("Số gear(s): ".. NumberOfGear)
else
    print("Có V4 không? : không")
end

if gatcan == true then
    print("UwU, gạt cần rùi nèk")
else
    print("TwT, chưa gần cần huhu")
end
