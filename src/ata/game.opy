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
                "petra", "havana", "workshopIsland", "workshopIslandNight", "iliosRuins", "volskaya", "blizzWorld", "blizzWorldWinter", "dorado", "lijiangNightMarket", "lijiangNightMarketLny", "nepalVillage", "blackForest", "blackForestWinter", "paris", "oasisUniversity", "chateauGuillard", "chateauGuillardHalloween", "hanamura", "hanamuraWinter", "hollywood", "hollywoodHalloween", "eichenwalde", "eichenwaldeHalloween", "kingsRow", "kingsRowWinter"
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

#!define GetStrings(obj) __script__('../../../overpy-modules/src/translation.js')
GetStrings({
    availableLanguages: ["en-US"],
    practiceRangeTranslations: ['"Practice Range"'],
    translations: {
        GAME_NAME: {
            "en-US": "Apples to Apples by CaptCaptain#11421"
        },
        WEBLINK: {
            "en-US": "https://workshop.codes/apples-to-apples"
        },
        VERSION: {
            "en-US": "Version: 1.5.0"
        },
        PLAY_CARDS: {
            "en-US": "Play your cards"
        },
        VOTING: {
            "en-US": "The Judge is Voting"
        },
        TITLE_MESSAGE: {
            "en-US": "Apples to Apples"
        },
        WAITING_FOR_PLAYERS: {
            "en-US": "Waiting For Players"
        },
        CARD_JUDGE: {
            "en-US": "Judge"
        },
        IS_JUDGE: {
            "en-US": "{0} You are the Judge {0}",
            format: 'abilityIconString(cardJudge.getCurrentHero(), Button.ULTIMATE)'
        },
        NO_CARDS: {
            "en-US": "No one played a card, moving to the next round"
        },
        WAIT_FOR_CARDS: {
            "en-US": "Waiting for everyone to select their cards"
        },
        WAIT_FOR_JUDGE: {
            "en-US": "Waiting for Judge"
        },
        CARD_INSTRUCTION: {
            "en-US": "Select the Card that best fits the word"
        },
        JUDGE_VOTE_INSTRUCTION: {
            "en-US": "Card #{}/{}\n{} - Confirm\n{} (Left) / {} (Right) - Select",
            format: "cardJudge.selectedCardJudge, len(getJudgeCards) - 1, buttonString(Button.PRIMARY_FIRE), buttonString(Button.ABILITY_1), buttonString(Button.ABILITY_2)"
        },
        YOUR_CARDS: {
            "en-US": "Your Cards"
        },
        CARD_CONTROLS: {
            "en-US": "{} - Play Card\n{} - Get New Cards (Forfeit your turn)\n{} (Up) / {} (Down) - Select Card",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.ABILITY_2), buttonString(Button.ABILITY_1)"
        },
        JUDGE_VOTED:{
            "en-US": "The Judge has voted for {}",
            format: 'cardJudge.cardVoted'
        }
    }
})

#!define PRIMARY_COLOR Color.WHITE
#!define SUB_COLOR Color.ROSE
#!define VOTE_COLOR Color.TURQUOISE

#!include "../shared/setting.opy"
#!include "../shared/game.opy"
#!include "../shared/player.opy"

#!define GetGameData() __script__("cards.js")
GetGameData()