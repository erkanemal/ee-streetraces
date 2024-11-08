local races = {}
local raceCounter = 0

RegisterServerEvent('dynamicrace:createRace')
AddEventHandler('dynamicrace:createRace', function(checkpoints, buyIn)
    local source = source
    raceCounter = raceCounter + 1
    
    local race = {
        id = raceCounter,
        creator = source,
        checkpoints = checkpoints,
        buyIn = buyIn,
        participants = {},
        started = false,
        finished = false
    }
    
    races[raceCounter] = race
    TriggerClientEvent('dynamicrace:raceCreated', -1, race)
end)

RegisterServerEvent('dynamicrace:joinRace')
AddEventHandler('dynamicrace:joinRace', function(raceId)
    local source = source
    local race = races[raceId]
    
    if not race or race.started or race.finished then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            message = "Cannot join this race!"
        })
        return
    end
    
    -- Check if player has enough money
    if CheckPlayerMoney(source, race.buyIn) then
        RemovePlayerMoney(source, race.buyIn)
        table.insert(race.participants, source)
        
        TriggerClientEvent('chat:addMessage', -1, {
            color = {0, 255, 0},
            message = GetPlayerName(source) .. " joined the race! (" .. #race.participants .. " racers)"
        })
        
        -- Start race when there are at least 2 participants
        if #race.participants >= 2 and not race.started then
            StartRace(raceId)
        end
    end
end)