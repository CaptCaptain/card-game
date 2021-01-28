settings {
    "main": {
        "description": 'The Game of Hilarious Comparisons! Based on the Apples to Apples card game by Mattel Games. [Gamemode created by CaptCaptain#11421]'
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
                "petra", "havana", "workshopIsland", "workshopIslandNight", "iliosRuins", "volskaya", "blizzWorld", "blizzWorldWinter", "dorado", "lijiangNightMarket", "lijiangNightMarketLny", "nepalVillage", "blackForest", "blackForestWinter", "paris", "oasisUniversity", "chateauGuillard", "chateauGuillardHalloween"
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

#!define PRIMARY_COLOR Color.WHITE
#!define SUB_COLOR Color.ROSE
#!define VOTE_COLOR Color.TURQUOISE

#!include "../shared/setting.opy"
#!include "../shared/game.opy"
#!include "../shared/player.opy"

#!define GetGameData() __script__("cards.js")
GetGameData()