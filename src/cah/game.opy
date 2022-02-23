settings {
    "main": {
        "modeName": "Cards Against Humanity",
        "description": "A fill-in-the-blank party game that turns your awkward personality and lackluster social skills into hours of fun!\nEach round, one topic card is provided, and everyone else answers with their funniest card.\n\nBased on the card game by Cards Against Humanity LLC\n[Note: This workshop mode contains content not suitable for all audiences] [Workshop Mode created by CaptCaptain#11421]",
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

enum gameStyle:
    DEFAULT,
    CRAB,
    TURNOVER,
    TWOONE

globalvar WS_SET_RULES_RAW = 0
globalvar WS_SET_RULES = [gameStyle.DEFAULT, gameStyle.CRAB, gameStyle.TURNOVER, gameStyle.TWOONE][WS_SET_RULES_RAW]

#!define sentenceSelection ['{} + {}'.format(random.choice(sentences.exclude(cardSentence)), random.choice(sentences.exclude(cardSentence)))] if WS_SET_RULES == gameStyle.TWOONE else cards.exclude(cardSentence) if WS_SET_RULES == gameStyle.TURNOVER else sentences.exclude(cardSentence)

#!define cardSelection sentences.exclude(eventPlayer.cards) if WS_SET_RULES == gameStyle.TURNOVER else cards.exclude(eventPlayer.cards)

#!define GetStrings(obj) __script__('../../../overpy-modules/src/translation.js')
GetStrings({
    availableLanguages: ["en-US"],
    practiceRangeTranslations: ['"Practice Range"'],
    translations: {
        GAME_NAME: {
            "en-US": "Cards Against Humanity by CaptCaptain#11421"
        },
        WEBLINK: {
            "en-US": ""
        },
        VERSION: {
            "en-US": "Version: 1.0.0"
        },
        PLAY_CARDS: {
            "en-US": "Play your cards"
        },
        VOTING: {
            "en-US": "The Card Czar is Voting"
        },
        TITLE_MESSAGE: {
            "en-US": "Cards Against Humanity"
        },
        WAITING_FOR_PLAYERS: {
            "en-US": "Waiting For 3 Players"
        },
        CARD_JUDGE: {
            "en-US": "Card Czar"
        },
        IS_JUDGE: {
            "en-US": "{0} You are the Card Czar {0}",
            format: 'abilityIconString(cardJudge.getCurrentHero(), Button.ULTIMATE)'
        },
        NO_CARDS: {
            "en-US": "No one played a card, moving to the next round"
        },
        WAIT_FOR_CARDS: {
            "en-US": "Waiting for everyone to select their cards"
        },
        WAIT_FOR_JUDGE: {
            "en-US": "Waiting for Card Czar"
        },
        RULESET_GAME_STYLE:{
            "en-US": "Game Style: {}",
            format: "[STR_GAME_STYLE_DEFAULT, STR_GAME_STYLE_CRAB, STR_GAME_STYLE_TURNOVER, STR_GAME_STYLE_TWOONE][WS_SET_RULES_RAW]"
        },
        GAME_STYLE_DEFAULT:{
            "en-US": "Default"
        },
        GAME_STYLE_CRAB:{
            "en-US": "Crab Apples"
        },
        GAME_STYLE_TURNOVER:{
            "en-US": "Apple Turnover"
        },
        GAME_STYLE_TWOONE:{
            "en-US": "2 for 1 Apples"
        },
        CARD_INSTRUCTION: {
            "en-US": "{}",
            format: "[STR_CARD_INSTRUCTION_DEFAULT, STR_CARD_INSTRUCTION_CRAB, STR_CARD_INSTRUCTION_TURNOVER, STR_CARD_INSTRUCTION_TWOONE][WS_SET_RULES_RAW]"
        },
        CARD_INSTRUCTION_DEFAULT: {
            "en-US": "Select the Card that best fits"
        },
        CARD_INSTRUCTION_CRAB: {
            "en-US": "Select the Card that least fits"
        },
        CARD_INSTRUCTION_TURNOVER: {
            "en-US": "Select the Card that best describes"
        },
        CARD_INSTRUCTION_TWOONE: {
            "en-US": "Select the Card that best fits"
        },
        JUDGE_VOTE_INSTRUCTION: {
            "en-US": "Card #{}/{}\n{} — Choose Card\n{} (Left) / {} (Right) — Select Card",
            format: "cardJudge.selectedCardJudge + 1, len(getJudgeCards), buttonString(Button.INTERACT), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        YOUR_CARDS: {
            "en-US": "Your Cards"
        },
        CARD_CONTROLS_TITLE: {
            "en-US": "{} Controls:",
            format: "iconString(Icon.EXCLAMATION_MARK)"
        },
        CARD_CONTROLS: {
            "en-US": "{} — Play Selected Card\n{} — Get New Cards (Forfeit your turn)\n{} (Up) / {} (Down) — Select Card\n{} — Toggle Chat ({})",
            format: "buttonString(Button.INTERACT), buttonString(Button.ULTIMATE), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.ABILITY_2), localPlayer.chatEnabled"
        },
        JUDGE_VOTED:{
            "en-US": "The Judge has voted for {}",
            format: 'cardJudge.cardVoted'
        },
        LOBBY_RULESET:{
            "en-US": "{0} Host Settings:",
            format: 'abilityIconString(Hero.TORBJORN, Button.ABILITY_2)'
        },
        RULESET_SCORE_TO_WIN:{
            "en-US": "Score to Win: {}",
            format: 'WS_SET_SCORE_NEEDED'
        },
        RULESET_PLAY_CARD_TIME:{
            "en-US": "Pick Card Time: {}",
            format: 'WS_SET_PICK_TIME'
        },
        RULESET_JUDGE_VOTE_TIME:{
            "en-US": "Judge Voting Time: {}",
            format: 'WS_SET_VOTING_TIME'
        },
    }
})

#!define PRIMARY_COLOR Color.BLACK
#!define SUB_COLOR Color.ORANGE
#!define VOTE_COLOR Color.WHITE

#!include "../shared/setting.opy"
#!include "../shared/game.opy"
#!include "../shared/player.opy"

#!define GetGameData() __script__("cards.js")
GetGameData()