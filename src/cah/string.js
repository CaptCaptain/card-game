const availableLanguages = ["en-US"]
const practiceRangeTranslations = ['"Practice Range"']
const translations = {
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
        "en-US": "Card Czar is Voting"
    },
    TITLE_MESSAGE: {
        "en-US": "Cards Against Humanity"
    },
    WAITING_FOR_PLAYERS: {
        "en-US": "Waiting For Players"
    },
    CARD_JUDGE: {
        "en-US": "Card Czar"
    },
    IS_JUDGE: {
        "en-US": "{0} You are the Card Czar {0}",
        format: 'abilityIconString(cardJudge.getCurrentHero(), Button.ULTIMATE)'
    },
    WAIT_FOR_CARDS: {
        "en-US": "Waiting for everyone to select their cards"
    },
    WAIT_FOR_JUDGE: {
        "en-US": "Waiting for Card Czar"
    },
    CARD_INSTRUCTION: {
        "en-US": "Select the Card that best fits the sentence"
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
        "en-US": "The Card Czar has voted for {}",
        format: 'cardJudge.cardVoted'
    },
    SENTENCE_WIZARD: {
        "en-US": "What will I bring back in time to\nconvince people that I am a powerful wizard?"
    },
    SENTENCE_PRESIDENT: {
        "en-US": "When I am President of the United States,\nI will create the Department of _________."
    },
    SENTENCE_BESTFRIEND: {
        "en-US": "What's a girl's best friend?"
    },
    SENTENCE_DIET: {
        "en-US": "What's the new fad diet?"
    },
    SENTENCE_POWER: {
        "en-US": "What's my secret power?"
    },
    SENTENCE_WW4: {
        "en-US": "I do not know with what weapons World War III will be fought,\nbut World War IV will be fought with ____________."
    },
    SENTENCE_RELATIONSHIP: {
        "en-US": "What ended my last relationship?"
    },
    SENTENCE_BROADWAY: {
        "en-US": "Coming to Broadway this season, ____________: The Musical."
    },
    SENTENCE_RELATIONSHIP_STATUS: {
        "en-US": "How am I maintaining my relationship status?"
    },
    SENTENCE_BOND: {
        "en-US": "But before I kill you, Mr. Bond, I must show you ____________."
    },
    SENTENCE_CHICKEN: {
        "en-US": "What don't you want to find in your kung pao chicken?"
    },
    SENTENCE_HMT: {
        "en-US": "What's the next happy meal toy?"
    },
    SENTENCE_MAYBE_IAM: {
        "en-US": "Maybe I'm born with it, maybe it's ______."
    },
    SENTENCE_TODAY_MAURY: {
        "en-US": "Today on Maury: 'Help my son is ______."
    },
    SENTENCE_MTV: {
        "en-US": "MTV'S new reality show features 8 washed up celebrities living with ______."
    },
    SENTENCE_CANT_HAVE: {
        "en-US": "______, betcha can't have just one."
    },
    SENTENCE_ROMANTIC_DINNER: {
        "en-US": "A romantic candle-lit dinner would be incomplete without ______."
    },
    SENTENCE_SMITH_MUSEUM: {
        "en-US": "The Smithsonian Meseum has just opened an interactive exhibit on ______."
    },
    SENTENCE_VIRGIN: {
        "en-US": "How do I lose my virginity?"
    },
    SENTENCE_WORLD_ENDS: {
        "en-US": "This is the way the world ends. Not with a bang but with a ______."
    },
    SENTENCE_20_20: {
        "en-US": "Tonight on 20/20, what you don't know about ______ could kill you."
    },
    SENTENCE_DR_PHIL: {
        "en-US": "Next time on Dr. Phil, how to talk to your child about ______."
    },
    SENTENCE_SHOW_N_TELL: {
        "en-US": "What did you bring for show and tell?"
    },
    SENTENCE_HIGH_SCHOOL: {
        "en-US": "During high school I never really fit in until I found ______ club."
    },
    SENTENCE_DOCTOR: {
        "en-US": "Doctor! You've gone too far, the human body wasn't meant to withstand that amount of ______."
    },
    SENTENCE_SHOWING: {
        "en-US": "Hey baby, come back to my place and I'll show you ______."
    },
    SENTENCE_REDDIT: {
        "en-US": 'Hey Reddit! I’m __________________. Ask me anything.'
    },
    SENTENCE_BATHROOM: {
        "en-US": 'Dude, do not go in that bathroom. There’s __________ in there.'
    },
    SENTENCE_TSA: {
        "en-US": 'TSA guidelines now prohibit __________________ on airplanes.'
    },
    SENTENCE_HW: {
        "en-US": 'I’m sorry, Professor, but I couldn’t complete my homework because of __________.'
    },
    SENTENCE_GO_DOWN:{
        "en-US": 'Fun tip! When your man asks you to go down on him,\ntry surprising him with __________________ instead.'
    },
    SENTENCE_WAR:{
        "en-US": 'War! What is it good for?'
    },
    CARD_HOLYBIBLE: {
        "en-US": "The Holy Bible."
    },
    CARD_BATMAN: {
        "en-US": "BATMAN!!!"
    },
    CARD_BATMAN_NORMAL: {
        "en-US": "Batman."
    },
    CARD_HANDICAPPED: {
        "en-US": "The profoundly handicapped."
    },
    CARD_PUPPIES: {
        "en-US": "Puppies!"
    },
    CARD_UNDERPANTS: {
        "en-US": "Edible underpants."
    },
    CARD_BACTERIA: {
        "en-US": "Flesh eatting bacteria."
    },
    CARD_BURRITO: {
        "en-US": "A zesty breakfast burrito."
    },
    CARD_LASER: {
        "en-US": "Horrifying laser hair removal accidents."
    },
    CARD_POLICE: {
        "en-US": "Police brutality."
    },
    CARD_SNIFFING: {
        "en-US": "Sniffing glue."
    },
    CARD_CARE_BEAR: {
        "en-US": "The Care Bear Stare."
    },
    CARD_TRAIL_TEARS: {
        "en-US": "A trail of tears."
    },
    CARD_SALTY_SURPRISE: {
        "en-US": "A salty surprise."
    },
    CARD_DRINKING_ALONE: {
        "en-US": "Drinking alone."
    },
    CARD_PEPSI: {
        "en-US": "The cool refreshing taste of pepsi."
    },
    CARD_GOGURT: {
        "en-US": "GoGurt®"
    },
    CARD_CHANDELIER: {
        "en-US": "Dropping a chandelier on your enemies\nand riding the rope up."
    },
    CARD_CHEATING_OLYPIMCS: {
        "en-US": "Cheating in the Special Olympics."
    },
    CARD_MARRIAGE: {
        "en-US": "Waiting until marriage."
    },
    CARD_COURT_REHAB: {
        "en-US": "Court ordered rehab."
    },
    CARD_EX_WIFE: {
        "en-US": "My ex-wife."
    },
    CARD_GRAVE_ROBBING: {
        "en-US": "Grave robbing."
    },
    CARD_WOMEN_SUFFRAGE: {
        "en-US": "Women's suffrage."
    },
    CARD_INCEST: {
        "en-US": "Incest."
    },
    CARD_GOD: {
        "en-US": "God."
    },
    CARD_NO_PANTS: {
        "en-US": "Not wearing pants."
    },
    CARD_ROLLERSKATES: {
        "en-US": "Middle aged man on rollerskates."
    },
    CARD_DARK_MYSTERIOUS_FORCE: {
        "en-US": "Dark and mysterious forces\nbeyond our control."
    },
    CARD_WHIPPING: {
        "en-US": "Whipping it out."
    },
    CARD_ESTROGEN: {
        "en-US": "Estrogen."
    },
    CARD_MOUTH_HERPES: {
        "en-US": "Mouth herpes."
    },
    CARD_MAN_MEAT: {
        "en-US": "Man meat."
    },
    CARD_STUPIDITY: {
        "en-US": "Unfathomable stupidity."
    },
    CARD_YEAST: {
        "en-US": "Yeast."
    },
    CARD_HOES: {
        "en-US": "These hoes."
    },
    CARD_POPEYES: {
        "en-US": "The chicken from Popeyes."
    },
    CARD_NUNCHUCK: {
        "en-US": "Nunchuck moves."
    },
    CARD_PATIO: {
        "en-US": "Fresh dill from the patio."
    },
    CARD_DECENCY: {
        "en-US": "Basic human decency."
    },
    CARD_WOMEN_PERSPECTIVE: {
        "en-US": "A woman's perspective."
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