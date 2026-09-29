if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")

while true do
    local player = Players.LocalPlayer
    local character = player and player.Character

    if character and character:IsDescendantOf(workspace) then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoid.Health > 0
            and root and root:IsA("BasePart") then
            break
        end
    end

    task.wait(0.1)
end

for _, obj in next, getgc(true) do
    if typeof(obj) ~= "table" or getrawmetatable(obj) then
        continue
    end

    local mainrun = false
    for _, v in next, obj do
        if v == obj then
            mainrun = true
            break
        end
    end

    if not mainrun then
        continue
    end

    for _, v in next, obj do
        if typeof(v) == "number"
            and v >= 1 and v <= 3
            and obj[v] == nil then
            setmetatable(obj, {
                __newindex = function() end
            })
            break
        end
    end
end
