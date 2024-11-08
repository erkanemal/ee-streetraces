local isCreatingRace = false
local checkpoints = {}
local currentRace = nil
local isInRace = false
local currentCheckpoint = 1
local raceBlip = nil
local checkpointBlips = {}

-- Command to start creating a race
RegisterCommand('createrace', function(source, args)
    if args[1] == nil then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            message = "Usage: /createrace [buy-in amount]"
        })
        return
    end

    local buyIn = tonumber(args[1])
    if buyIn < 0 then return end
    
    StartRaceCreation(buyIn)
end)

-- Command to join a race
RegisterCommand('joinrace', function(source, args)
    if currentRace then
        TriggerServerEvent('dynamicrace:joinRace', currentRace.id)
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            message = "No active race to join!"
        })
    end
end)