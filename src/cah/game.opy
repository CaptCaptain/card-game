settings {
    "main": {
        # <FGFD841FFF>
        "modeName": "◇ Cards Against Humanity",
        "description": "A fill-in-the-blank party game that turns your awkward personality and lackluster social skills into hours of fun!\n◈ Each round, one topic card is provided, and everyone else answers with their funniest card.\n◈ Create funny combinations to win everyone's vote.\n◈ Over 600+ cards and topic cards available.\n\nLatest Version:\n1.9.0 / 05-07-2023\n\nJoin Workshop Creators at: https://workshop.codes/discord",
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
                "havana", "petra", "workshopIsland", "workshopChamber", 'malevento', 'paris', 'dorado', 'hollywood', 'oasisGardens', 'oasisUniversity', 'templeOfAnubis', 'kingsRow', 'necropolis', 'castillo', 'chateauGuillard', 'lijiangNightMarket', 'horizonLunarColony', 'lijiangControlCenter', 'lijiangControlCenterLny', 'lijiangGarden', 'lijiangGardenLny', 'volskaya', 'blizzWorld', 'blizzWorldWinter', 'kanezaka'
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "scoreToWin": 1,
            "spawnHealthPacks": "disabled",
            "enableHeroSwitching": false
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

enum gameStyle:
    DEFAULT,
    CRAB,
    TURNOVER,
    TWOONE

globalvar WS_SET_RULES_RAW = 0
globalvar WS_SET_RULES = [gameStyle.DEFAULT, gameStyle.CRAB, gameStyle.TURNOVER, gameStyle.TWOONE][WS_SET_RULES_RAW]

#!define sentenceSelection ['{} + {}'.format(random.choice(sentences.exclude(cardSentence)), random.choice(sentences.exclude(cardSentence)))] if WS_SET_RULES == gameStyle.TWOONE else cards.exclude(cardSentence) if WS_SET_RULES == gameStyle.TURNOVER else sentences.exclude(cardSentence)

#!define cardSelection sentences if WS_SET_RULES == gameStyle.TURNOVER else cards

#!define GetStrings(data) __script__('../../../overpy-modules/src/translation.js')
GetStrings({
    availableLanguages: ["en-US"],
    practiceRangeTranslations: ["Practice Range"],
    disableDynamicTranslation: true,
    strings: {
        GAME_NAME: {
            "en-US": "Cards Against Humanity"
        },
        CREATOR: {
            "en-US": "Created by: CaptCaptain#11421"
        },
        WEBLINK: {
            "en-US": "Always import 709ZF to play on the latest version"
        },
        VERSION: {
            "en-US": "Version: 1.9.0"
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
            "en-US": "Card #{}/{}",
            format: "cardJudge.selectedCardJudge + 1, len(getJudgeCards)"
        },
        YOUR_CARDS: {
            "en-US": "Your Cards"
        },
        YOUR_CARDS_JUDGE:{
            "en-US": "All Cards"
        },
        PLAYER_WON: {
            "en-US": "'s card"
        },
        GAME_CONTROLS: {
            "en-US": "{0} CONTROLS {0}",
            format: "iconString(Icon.ARROW_DOWN)"
        },
        SELECTED_CARD: {
            "en-US": "Your selected card"
        },
        CARD_SELECTION_TUTORIAL_1:{
            "en-US": "Press {} or {} to select a card",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        CARD_SELECTION_TUTORIAL_2:{
            "en-US": "Press {} to confirm your selection",
            format: "buttonString(Button.INTERACT)"
        },
        SELECTED_CARD_CONTROLS: {
            "en-US": "{}{} Select {}{}",
            format: "iconString(Icon.ARROW_LEFT), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), iconString(Icon.ARROW_RIGHT)"
        },
        PLAY_CARD_CONTROL_ICON: {
            "en-US": "{}[{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_1), buttonString(Button.INTERACT)"
        },
        PLAY_CARD_CONTROL: {
            "en-US": "Play Card"
        },
        VOTE_SKIP_CONTROL_ICON: {
            "en-US": "{} [{}]",
            format: "abilityIconString(Hero.LUCIO, Button.ABILITY_2), buttonString(Button.INTERACT)"
        },
        VOTE_SKIP_CONTROL: {
            "en-US": "Hurry Up!"
        },
        HURRY_UP: {
            "en-uS": "{} wishes to hurry it up!",
            format: "eventPlayer"
        },
        JUDGE_VOTED:{
            "en-US": "The Card Czar has voted for",
        },
        BOX:{
            "en-US": "┌─ CARD CZAR'S SELECTION ─┐\n<space>\n└───────────────┘",
        },
        CURRENT_JUDGE_CARD:{
            "en-US": "{0}\n",
            format: 'getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard]'
        },
        WINNING_PLAYER:{
            "en-US": "Winner",
        },
        CARD_FORMAT:{
            "en-US": "{} {}",
            format: "heroIcon(getJudgeCards[cardJudge.selectedCardJudge].getCurrentHero()), cardJudge.cardVoted",
        }, 
        PLAY_CARD:{
            "en-US": '{} SELECTED "{}"',
            format: 'iconString(Icon.CHECKMARK), eventPlayer.cards[eventPlayer.selectedCard]'
        },
        FORFEIT_CARD_CONTROL_ICON: {
            "en-US": "{}[{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_2), buttonString(Button.ULTIMATE)"
        },
        FORFEIT_CARD_CONTROL: {
            "en-US": "Redraw Cards (Forfeit Turn)"
        },
        TOGGLE_CHAT_ICON: {
            "en-US": "{}[{}]",
            format: "iconString(Icon.CHECKMARK) if localPlayer.chatEnabled else iconString(Icon.NO), buttonString(Button.ABILITY_2)"
        },
        TOGGLE_CHAT: {
            "en-US": "Toggle Chat ({})",
            format: "localPlayer.chatEnabled"
        },
        SELECT_CARD_ICON: {
            "en-US": "{} / {}",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        SELECT_CARD: {
            "en-US": "Select Card",
        },
        CARD_CONTROLS_TITLE: {
            "en-US": "{} Controls:",
            format: "iconString(Icon.EXCLAMATION_MARK)"
        },
        CARD_CONTROLS: {
            "en-US": "{} — Play Selected Card\n{} — Get New Cards (Forfeit your turn)\n{} (Up) / {} (Down) — Select Card\n{} — Toggle Chat ({})",
            format: "buttonString(Button.INTERACT), buttonString(Button.ULTIMATE), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.ABILITY_2), localPlayer.chatEnabled"
        },
        CHAT_VISIBLE: {
            "en-US": "{} Chat visible",
            format: "iconString(Icon.CHECKMARK)"
        },
        CHAT_HIDDEN: {
            "en-US": "{} Chat hidden",
            format: "iconString(Icon.NO)"
        },
        CAMERA_MODE: {
            "en-US": "Switch Camera View ({})",
            format: "localPlayer.cameraMode"
        },
        CAMERA_MODE_ICON: {
            "en-US": "{} [{}]",
            format: "iconString(Icon.NO) if localPlayer.cameraMode == 0 else iconString(Icon.CHECKMARK), buttonString(Button.ABILITY_1)"
        },
        SWITCHED_CAMERA_MODE:{
            "en-US": "Switched Camera to View [{}]",
            format: "localPlayer.cameraMode"
        },
        SWITCHED_CAMERA_MODE:{
            "en-US": "Switched Camera to View [{}]",
            format: "localPlayer.cameraMode"
        },
        SWITCH_HERO: {
            "en-US": "Switch Hero (Hold)"
        },
        SWITCH_HERO_ICON: {
            "en-US": "{} [{}]",
            format: "heroIcon(localPlayer.getCurrentHero()), buttonString(Button.RELOAD)"
        },
        SWITCHING_HEROES:{
            "en-US": "Entering hero select..."
        },
        SWITCHING_HEROES_CANCELLED:{
            "en-US": "Hero switch cancelled"
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
        WYW_NOT_ENOUGH_PLAYERS:{
            "en-US": "{} Not enough players for match, enabling while you wait",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        WYW_ENOUGH_PLAYERS:{
            "en-US": "{} Enough players for match, disabling while you wait",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        TURN_FORFEITED:{
            "en-US": "{} Turn forfeited, new cards given on next turn",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        }
    }
})

#!define PRIMARY_COLOR Color.BLACK
#!define SUB_COLOR Color.ORANGE
#!define VOTE_COLOR Color.WHITE
#!define USE_SMALL_CARD_FONT true
#!define USE_SMALL_UI_TEXT_FONT true

#!include "../shared/setting.opy"

rule "Double Time":
    WS_SET_PICK_TIME *= 1
    WS_SET_VOTING_TIME *= 2

#!include "../shared/game.opy"
#!include "../shared/player.opy"