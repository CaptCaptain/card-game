const availableLanguages = ["en-US"]
const practiceRangeTranslations = ['"Practice Range"']
const translations = {
    GAME_NAME: {
        "en-US": "Apples to Apples by CaptCaptain#11421"
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
        "en-US": "Wait for everyone to select their cards"
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
    },
    // Green cards
    GREEN_:{
        "en-US": ""
    },
    GREEN_ABSURD:{
        "en-US": "Absurd"
    },
    GREEN_ABUNDANT:{
        "en-US": "Abundant"
    },
    GREEN_ADDICTIVE:{
        "en-US": "Addictive"
    },
    GREEN_ADORABLE:{
        "en-US": "Adorable"
    },
    GREEN_AGED:{
        "en-US": "Aged"
    },
    GREEN_AMAZING:{
        "en-US": "Amazing"
    },
    GREEN_AMERICAN:{
        "en-US": "American"
    },
    GREEN_ANCIENT:{
        "en-US": "Ancient"
    },
    GREEN_ANIMATED:{
        "en-US": "Animated"
    },
    GREEN_ANNOYING:{
        "en-US": "Annoying"
    },
    GREEN_APPETIZING:{
        "en-US": "Appetizing"
    },
    GREEN_ARMED_DANGEROUS:{
        "en-US": "Armed & Dangerous"
    },
    // Red cards
    RED_: {
        "en-US": ""
    },
    RED_BAD_HAIRCUT: {
        "en-US": "A Bad Haircut"
    },
    RED_BAKERY: {
        "en-US": "A Bakery"
    },
    RED_BROKEN_LEG: {
        "en-US": "A Broken Leg"
    },
    RED_BULL_FIGHT: {
        "en-US": "A Bull Fight"
    },
    RED_CABIN: {
        "en-US": "A Cabin In The Woods"
    },
    RED_CAN_WORMS: {
        "en-US": "A Can of Worms"
    },
    RED_CAR_CRASH: {
        "en-US": "A Car Crash"
    },
    RED_CHEAP_MOTEL: {
        "en-US": "A Cheap Motel"
    },
    RED_COOKBOOK: {
        "en-US": "A Cookbook"
    },
    RED_CRAWL_SPACE: {
        "en-US": "A Crawl Space"
    },
    RED_CROWN: {
        "en-US": "A Crown"
    },
    RED_DESERT: {
        "en-US": "A Desert"
    },
    RED_DOLLAR: {
        "en-US": "A Dollar"
    },
    RED_DOZEN_ROSES: {
        "en-US": "A Dozen Red Roses"
    },
    RED_FAIRY: {
        "en-US": "A Fairy"
    },
    RED_GOOD_MEN: {
        "en-US": "A Few Good Men"
    },
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