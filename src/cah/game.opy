settings {
    "main": {
        "description": ''
    },
    "lobby": {
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "ffaSlots": 12,
        "spectatorSlots": 12,
        "returnToLobby": "never",
        "allowPlayersInQueue": true
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "petra", "havana", "workshopIsland", "workshopIslandNight", "iliosRuins", "volskaya", "blizzWorld", "dorado", "lijiangNightMarket", "lijiangNightMarketLny"
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

#!optimizeForSize

#!define GetStrings() __script__("string.js")
GetStrings()

#!define PRIMARY_COLOR Color.BLACK
#!define SUB_COLOR Color.ORANGE
#!define VOTE_COLOR Color.WHITE

#!include "../shared/setting.opy"
#!include "../shared/game.opy"
#!include "../shared/player.opy"

#!define GetGameData() __script__("cards.js")
GetGameData()