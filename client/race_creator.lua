function StartRaceCreation(buyIn)
    if isCreatingRace then return end
    
    isCreatingRace = true
    checkpoints = {}
    
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        message = "Race creation started! Press E to place checkpoints, ENTER to finish."
    })
    
    -- Checkpoint placement loop
    Citizen.CreateThread(function()
        while isCreatingRace do
            -- Show preview marker at player position
            local playerCoords = GetEntityCoords(PlayerPedId())
            DrawMarker(1, playerCoords.x, playerCoords.y, playerCoords.z - 1.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                8.0, 8.0, 2.0,
                255, 255, 0, 100,
                false, false, 2, false, nil, nil, false)
            
            -- Place checkpoint with E
            if IsControlJustPressed(0, 38) then -- E key
                PlaceCheckpoint(playerCoords)
            end
            
            -- Finish creation with Enter
            if IsControlJustPressed(0, 191) and #checkpoints >= 2 then -- Enter key
                FinishRaceCreation(buyIn)
            end
            
            Citizen.Wait(0)
        end
    end)
end

function PlaceCheckpoint(coords)
    table.insert(checkpoints, coords)
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        message = "Checkpoint " .. #checkpoints .. " placed!"
    })
end