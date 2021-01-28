const availableLanguages = ["en-US"]
const practiceRangeTranslations = ['"Practice Range"']
const translations = {
    GAME_NAME: {
        "en-US": "Apples to Apples by CaptCaptain#11421"
    },
    WEBLINK: {
        "en-US": "https://workshop.codes/apples-to-apples"
    },
    VERSION: {
        "en-US": "Version: 1.2.0"
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
        "en-US": "{}/{}\n[{}]: Confirm\n[{} / {}]: Select",
        format: "eventPlayer.selectedCardJudge, len(getJudgeCards) - 1, buttonString(Button.PRIMARY_FIRE), buttonString(Button.ULTIMATE), buttonString(Button.ABILITY_2)"
    },
    YOUR_CARDS: {
        "en-US": "Your Cards"
    },
    CARD_CONTROLS: {
        "en-US": " \n[{}]: Play Card\n[{}]: Redraw Cards (Forfeit your turn)\n[{} / {}]: Select Card",
        format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.RELOAD), buttonString(Button.INTERACT)"
    },
    JUDGE_VOTED:{
        "en-US": "The Judge has voted for {}",
        format: 'cardJudge.cardVoted'
    }
}
result = 'globalvar practiceRangeTranslations = ' + '[' + practiceRangeTranslations.join() + ']';

// translate
for (var translation in translations) {

    //check if all languages are here
    for (var lang of availableLanguages) {
        if (translations[translation][lang] === undefined) {
            throw new Error("Missing language '"+lang+"' for translation '"+translation+"'");
        }
    }

    const varDeclaration = "#!define STR_"+translation+" [";

    console.log(translations[translation].format)

    result += varDeclaration+availableLanguages.map(x => JSON.stringify(translations[translation][x]).replace(/##(\w+)##/g, '"$1"') + (translations[translation].format ? ".format("+translations[translation].format+")" : ""))+'][max(false, practiceRangeTranslations.index("{0}".format(Map.PRACTICE_RANGE)))]\n';
}
result