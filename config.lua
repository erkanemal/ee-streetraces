Config = {}

-- Race Settings
Config.MinBuyIn = 100
Config.MaxBuyIn = 10000
Config.MinPlayers = 2
Config.MaxPlayers = 8
Config.CountdownTime = 10
Config.FinishTimeout = 300 -- 5 minutes

-- Checkpoint Settings
Config.CheckpointSize = 8.0
Config.CheckpointHeight = 2.0
Config.MinCheckpoints = 2
Config.MaxCheckpoints = 30

-- Race Types
Config.RaceTypes = {
    ['sprint'] = {
        name = "Sprint Race",
        multiplier = 1.0
    },
    ['circuit'] = {
        name = "Circuit Race",
        multiplier = 1.2
    },
    ['drift'] = {
        name = "Drift Race",
        multiplier = 1.5
    }
}

-- Anti-Cheat Settings
Config.MaxSpeed = 200.0 -- mph
Config.TeleportDetection = true
Config.SpeedHackDetection = true

-- Reward Settings
Config.WinnerPercentage = 0.7 -- 70% to winner
Config.SecondPlacePercentage = 0.2 -- 20% to second
Config.ThirdPlacePercentage = 0.1 -- 10% to third

-- Notification Settings
Config.UseCustomNotifications = false
Config.NotificationDistance = 100.0

-- Debug Settings
Config.Debug = false
Config.ShowCoords = false
