settings {
    "main": {
        "description": ''
    },
    "lobby": {
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "ffaSlots": 12,
        "spectatorSlots": 12,
        "returnToLobby": "never"
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "petra"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "scoreToWin": 1,
            "spawnHealthPacks": "disabled"
        }
    },
    "heroes": {
        "allTeams": {
            "general": {
                "enableInfiniteAmmo": true,
                "enableUlt": false
            }
        }
    }
}

globalvar WS_SET_SCORE_NEEDED = createWorkshopSetting(int[3:10], "Ruleset", "Score to Win", 10, 1)
globalvar WS_SET_PICK_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Play Card Time", 30, 2)
globalvar WS_SET_VOTING_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Voting Time", 30, 2)