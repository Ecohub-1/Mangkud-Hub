
local notrejoin = false
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local DataSer = require(game:GetService("ReplicatedStorage").Modules.DataService)
local function IsTargetPet(name)
    for _, pet in ipairs(_G.Pets) do
        if name == pet then
            return true
        end
    end
    return false
end

while true do
    task.wait()

    for _, v in pairs(DataSer:GetData().SavedObjects) do
        if v.ObjectType == "PetEgg" then
            local data = v.Data
            if data.RandomPetData and data.CanHatch and IsTargetPet(data.RandomPetData.Name) then
                notrejoin = true
                break
            end
        end
    end

    if notrejoin then
        print("Found target egg(s)!")
    else
        task.wait(3)
        Players.LocalPlayer:Kick("Don't have your target pet\nRejoining...")
        task.wait(1)
        TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
    end
end
