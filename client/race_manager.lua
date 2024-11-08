function StartRace(raceData)
    isInRace = true
    currentRace = raceData
    currentCheckpoint = 1
    
    -- Create checkpoint blips
    for i, coords in ipairs(raceData.checkpoints) do
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, 1)
        SetBlipScale(blip, 1.0)
        table.insert(checkpointBlips, blip)
    end
    
    -- Start race checkpoint monitoring
    Citizen.CreateThread(function()
        while isInRace do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local checkpointCoords = raceData.checkpoints[currentCheckpoint]
            
            -- Check if player reached checkpoint
            local distance = #(playerCoords - vector3(checkpointCoords.x, checkpointCoords.y, checkpointCoords.z))
            if distance < 5.0 then
                PassedCheckpoint()
            end
            
            -- Draw current checkpoint marker
            DrawMarker(1, checkpointCoords.x, checkpointCoords.y, checkpointCoords.z - 1.0,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                8.0, 8.0, 2.0,
                255, 0, 0, 100,
                false, false, 2, false, nil, nil, false)
            
            Citizen.Wait(0)
        end
    end)
end