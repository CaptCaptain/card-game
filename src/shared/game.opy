#!define getDummyNames() ["フラスマ", "AmNot", "AimBot", "SomeDude", "Someone Else", "DeadHead", "Statescript", "Soulless", "EventPlayer", "ThatGuy", "Target Practice", "Deltinteger", "Workshop", "aimkid", "BeepBeepBoop", "DancingBacon", "EloHell", "OneTrick", "Jeff Kaplan", "Shiny", "Splat", "Magzie", "MelodySheep", "Dream", "AlreadyTracer", "Lemonade", "WildBites", "Probotxin", "rock", "Zach Metcalf", "Blizzard", "Chef You Wack", "Kurzgesagt", "桜井政博", "DeadMeat", "Abroad in Japan", "NiceStick", "THEM", "Me", "NotMe", "RageQuit", "HeroTalents", "BattleNet", "PatchNotes", "BalanceTeam", "NerfBrig", "Nanoblade", "NerfThis", "NeedHealing"]

#!include "../../../overpy-modules/src/fixedSmallMessages.opy"

#!suppressWarnings w_ow2_communicate_bug w_wait_until

# waitThrottle pauses execution of the code for x seconds based on current server load
#!define waitThrottle(minTime, maxTime) waitUntil(getAverageServerLoad() < 255, maxTime)\
wait(minTime)\

#!define GetMapData(data) __script__('../../../overpy-modules/src/map.js')
GetMapData({
    availableMapData: ['CENTER'],
    availableMaps: {
        PETRA: {
            CENTER: '[vect(7, -12.10, 55.94), 7]'
        },
        HAVANA: {
            CENTER: '[vect(185.93, 11.25, -46.55), 7]'
        },
        WORKSHOP_ISLAND: {
            CENTER: '[vect(0, 0, 0), 7]'
        },
        WORKSHOP_EXPANSE: {
            CENTER: '[vect(0, 0, 0), 7]'
        },
        WORKSHOP_CHAMBER: {
            CENTER: '[vect(0, 0, 0), 7]'
        },
        WORKSHOP_ISLAND_NIGHT: {
            CENTER: '[vect(0, 0, 0), 7]'
        },
        VOLSKAYA: {
            CENTER: '[vect(-13.680, -3.713, 90.259), 7]'
        },
        BLIZZ_WORLD: {
            CENTER: '[vect(3.24, -6, -77.62), 8]'
        },
        BLIZZ_WORLD_WINTER: {
            CENTER: '[vect(3.24, -6, -77.62), 8]'
        },
        KANEZAKA:{
            CENTER: '[vect(-30.67, 6.55, -9.58), 6]'
        },
        DORADO: {
            CENTER: '[vect(183.99, 13.80, 40.96), 7]'
        },
        LIJIANG_NIGHT_MARKET: {
            CENTER: '[vect(1, -0.97, -61.59), 8]'
        },
        LIJIANG_NIGHT_MARKET_LNY: {
            CENTER: '[vect(1, -0.97, -61.59), 8]'
        },
        NEPAL_VILLAGE: {
            CENTER: '[vect(-195.075, -93.874, -0.174), 6]'
        },
        BLACK_FOREST: {
            CENTER: '[vect(-20.055, 12.057, 4.054), 6]'
        },
        BLACK_FOREST_WINTER: {
            CENTER: '[vect(-20.055, 12.057, 4.054), 6]'
        },
        PARIS: {
            CENTER: '[vect(27.13, 12, -80.43), 6]'
        },
        OASIS_CITY_CENTER: {
            CENTER: '[vect(143.49, 2.15, 247.49), 9]'
        },
        OASIS_UNIVERSITY: {
            CENTER: '[vect(-188.07, 15, 0.02), 7]'
        },
        OASIS_GARDENS: {
            CENTER: '[vect(121.35, 5.50, -227.58), 7]'
        },
        CHATEAU_GUILLARD: {
            CENTER: '[vect(206.22, 8, 56.98), 7]'
        },
        CHATEAU_GUILLARD_HALLOWEEN: {
            CENTER: '[vect(206.22, 8, 56.98), 7]'
        },
        HOLLYWOOD: {
            CENTER: '[vect(-12.459, -0.108, 56.391), 7]'
        },
        EICHENWALDE: {
            CENTER: '[vect(11.95, 5.81, -72.78), 7]'
        },
        EICHENWALDE_HALLOWEEN: {
            CENTER: '[vect(11.95, 5.81, -72.78), 7]'
        },
        KINGS_ROW: {
            CENTER: '[vect(-149.26, -2.85, 24.29), 6]'
        },
        KINGS_ROW_WINTER: {
            CENTER: '[vect(-149.26, -2.85, 24.29), 6]'
        },
        MALEVENTO: {
            CENTER: '[vect(0.08, -1, -10.72), 6]'
        },
        HOLLYWOOD: {
            CENTER: '[vect(-5.46, 1.52, -98.59), 7]'
        },
        NECROPOLIS: {
            CENTER: '[vect(0, 1, 0), 9]'
        },
        TEMPLE_OF_ANUBIS:{
            CENTER: '[vect(-6.07, 20.43, 129.45), 7]'
        },
        CASTILLO:{
            CENTER: '[vect(-102.48, 33.28, 58.33), 9]'
        },
        ILIOS_WELL:{
            CENTER: '[vect(-208.48, 0, -16.63), 7]'
        },
        HORIZON_LUNAR_COLONY:{
            CENTER: '[vect(-24.71, 2.79, -120.84), 7]'
        },
        LIJIANG_CONTROL_CENTER:{
            CENTER: '[vect(-0.03, 267.28, 280.09), 6]'
        },
        LIJIANG_CONTROL_CENTER_LNY:{
            CENTER: '[vect(-0.03, 267.28, 280.09), 6]'
        },
        LIJIANG_GARDEN:{
            CENTER: '[vect(0.05, 94.00, 150.04), 6]'
        },
        LIJIANG_GARDEN_LNY:{
            CENTER: '[vect(0.05, 94.00, 150.04), 6]'
        },
        VOLSKAYA:{
            CENTER: '[vect(-94.31, -1.98, 49.25), 6]'
        }
    }
})

#!define createCenterText(title, subtitle) createInWorldText(getAllPlayers(), title, MAP_CENTER[mapData.POSITION] + (Vector.UP * 0.6), 1.2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)\
hud_gameMessages.append(getLastCreatedText())\
\
createInWorldText(getAllPlayers(), subtitle, MAP_CENTER[mapData.POSITION] + (Vector.UP * 0), 3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)\
hud_gameMessages.append(getLastCreatedText())\
\
playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, SUB_COLOR, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1), 10)\
playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, SUB_COLOR, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1), 100)

#!define destroyInWorldTextLoop(i, var) for i in range(0, len(var), 1):\
    destroyInWorldText(var[i])\
var = []

#!define destroyMultipleLoop(i, var) for i in range(0, len(var), 1):\
    destroyEffect(var[i])\
    destroyHudText(var[i])\
    destroyInWorldText(var[i])\
var = []

#!define destroyHudTextLoop(i, var) for i in range(0, len(var), 1):\
    destroyHudText(var[i])\
var = []

#!define destroyEffectLoop(i, var) for i in range(0, len(var), 1):\
    destroyEffect(var[i])\
var = []

#!define getJudgeCards sorted([player for player in playersInMatch(Team.ALL).exclude(cardJudge) if len(player.cards) > 0 and player.playedCard and not (len(player.cards) == 0 or player.cards == null or player.cards == 0 or player.cards == [])], lambda player: player.getSlot())

#!define playersInMatch(team) [player for player in getLivingPlayers(team) if player.hasSpawned() or player.hasSpawnedOnce]

#!define sortedPlayers() sorted(getAllPlayers(), lambda x: x.getSlot())

enum mapData:
    POSITION = 0,
    RADIUS = 1

enum gameState:
    WAITING,
    ROUND,
    VOTING,
    END

globalvar globalHudIndex
globalvar globalIndex
globalvar dummyBotIndex

globalvar cardJudge
globalvar slot = -1
globalvar cardSentence
globalvar currentGameState = gameState.WAITING
globalvar roundTime = 0
globalvar hud_gameMessages = []

globalvar ignoreCardFilter = []
playervar cards = []
playervar cardVoted = false
playervar playedCard = false
playervar selectedCardJudge = 0

globalvar sentences = []
globalvar cards = []
globalvar lastDummy
globalvar dummyNames = getDummyNames()
globalvar selectedDummyName

globalvar scoringEnabled = true
globalvar cardsLoaded = false

playervar selectedCard = 0
playervar hasSpawnedOnce = false
playervar wantsToSkipVoting = false

subroutine dummyVote
subroutine dummyJudgeVote

def dummyVote():
    wait(2)
    [player for player in getAllPlayers() if player.isDummy()].playedCard = true

def dummyJudgeVote():
    if cardJudge.isDummy():
        for globalIndex in range(0, len(playersInMatch(Team.ALL))):
            cardJudge.selectedCardJudge = random.randint(0, len(getJudgeCards) - 1)
            wait(1)
        cardJudge.cardVoted = getJudgeCards[cardJudge.selectedCardJudge]
        if cardJudge.cardVoted.isDummy():
            cardJudge.cardVoted.communicate(Comms.THANKS)

globalvar antiCrashActivated

rule "Anti Crash":
    @Condition antiCrashActivated == false
    @Condition getServerLoad() > 200
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    setSlowMotion(10)
    antiCrashActivated = true

rule "Disable Anti Crash":
    @Condition antiCrashActivated == true
    @Condition getServerLoad() < 175
    
    setSlowMotion(100)
    antiCrashActivated = false

rule "Create Effects":
    # Create Center Effect
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLACK if currentGameState == gameState.VOTING else PRIMARY_COLOR, MAP_CENTER[mapData.POSITION], 2, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    # Create Title
    createInWorldText(getAllPlayers(), STR_TITLE_MESSAGE, MAP_CENTER[mapData.POSITION] + (Vector.UP * 2), 5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())
    createInWorldText(getAllPlayers(), STR_WAITING_FOR_PLAYERS, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

rule "Disable Inspector / Update Match Time":
    disableInspector()
    waitUntil(isGameInProgress(), 9999)
    
    while true:
        setMatchTime(roundTime)
        waitThrottle(0.016, 1)

rule "Game Loop":
    @Condition currentGameState == gameState.WAITING

    # Waiting phase
    disableAnnouncer()
    disableGamemodeCompletion()
    disableScoring()

    waitUntil(isGameInProgress(), 9999)
    disableMusic()
    pauseMatchTime()

    # Wait for all cards to be loaded
    waitUntil(cardsLoaded, 9999)

    waitUntil(len(playersInMatch(Team.ALL)) >= 3, 9999)

    destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
    wait(1)

    while true:
        while true:
            # Change game state to round
            currentGameState = gameState.ROUND

            # Each player takes turns, the game skips any players that have not spawned in or do not exist.
            slot += 1
            while not (entityExists(sortedPlayers()[slot]) and sortedPlayers()[slot].hasSpawned()):
                if slot > 11:
                    slot = 0
                    break
                else:
                    slot += 1
                waitThrottle(0.016, 1)
            roundTime = WS_SET_PICK_TIME

            # Select judge and sentence
            cardJudge = sortedPlayers()[slot]
            cardSentence = random.choice(sentenceSelection)

            # Make dummy bot wave if they are judge
            if cardJudge.isDummy():
                cardJudge.communicate(Comms.HELLO)

            # Create center text
            createCenterText("", floor(roundTime))

            # Wait for everyone to get their cards
            waitUntil(all([len(player.cards) > 0 for player in playersInMatch(Team.ALL).exclude(cardJudge)]), 9999)

            # Dummy bots automatically play cards
            if any([player.isDummy() for player in getAllPlayers()]):
                async(dummyVote, AsyncBehavior.NOOP)

            chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)
            
            # Wait until everyone plays their cards or the time runs out
            waitUntil(roundTime == 0 or all([player.playedCard == true for player in playersInMatch(Team.ALL).exclude(cardJudge)]) or not entityExists(cardJudge), WS_SET_PICK_TIME)

            stopChasingVariable(roundTime)
            
            # Any players automatically play their cards if they haven't already
            playersInMatch(Team.ALL).exclude(cardJudge).playedCard = true

            destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
            
            # Change game state to voting
            currentGameState = gameState.VOTING
            getAllPlayers().wantsToSkipVoting = false

            # If judge does not exist, skip round
            if not entityExists(cardJudge):
                currentGameState = gameState.END
                
                getAllPlayers().playedCard = false
                getAllPlayers().wantsToSkipVoting = false
                cardJudge.selectedCardJudge = 0
                cardJudge.cardVoted = null
                cardJudge = null

                destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
                wait(0.25)
                break

            # If everyone forfeits, move to the next round
            if all([player.cards == [] for player in playersInMatch(Team.ALL).exclude(cardJudge)]):
                createCenterText(STR_NO_CARDS, '')

                wait(2.5)
                destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
                break
            
            roundTime = WS_SET_VOTING_TIME

            createCenterText(STR_CURRENT_JUDGE_CARD if not localPlayer == cardJudge else "", floor(roundTime))

            # Dummy bots automatically vote
            async(dummyJudgeVote, AsyncBehavior.RESTART)

            chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)

            # Wait until time runs out or judge has voted
            waitUntil(roundTime == 0 or entityExists(cardJudge.cardVoted) or not entityExists(cardJudge), WS_SET_VOTING_TIME)

            stopChasingVariable(roundTime)

            # If the judge does not exist, skip round
            if not entityExists(cardJudge):
                currentGameState = gameState.END
                
                getAllPlayers().playedCard = false
                cardJudge.selectedCardJudge = 0
                cardJudge.cardVoted = null
                cardJudge = null

                destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
                wait(0.25)
                break

            # If the judge does not vote, force them to
            if not entityExists(cardJudge.cardVoted):
                cardJudge.cardVoted = getJudgeCards[cardJudge.selectedCardJudge]

            destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)

            createCenterText(STR_JUDGE_VOTED, STR_CARD_FORMAT)

            # Play effect
            playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, VOTE_COLOR, cardJudge.cardVoted.getPosition() + Vector.UP, 5)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, VOTE_COLOR, cardJudge.cardVoted.getPosition() + Vector.UP, 10)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, cardJudge.cardVoted.getPosition() + Vector.UP, 100)
            cardJudge.cardVoted.addToScore(1)

            if cardJudge.cardVoted.isDummy():
                cardJudge.cardVoted.communicate(Comms.THANKS)
            if cardJudge.isDummy():
                cardJudge.cardVoted.communicate(Comms.YOURE_WELCOME)

            currentGameState = gameState.END

            wait(5)
            
            getAllPlayers().playedCard = false
            getAllPlayers().wantsToSkipVoting = false
            cardJudge.selectedCardJudge = 0
            cardJudge.cardVoted = null
            cardJudge = null

            # If player has reached score, declare victory
            if any([player.getScore() >= WS_SET_SCORE_NEEDED for player in getAllPlayers()]):
                declarePlayerVictory(sorted(getAllPlayers(), lambda player: player.getScore()).last())
                enableMusic()
                wait(9999)

            destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)

rule "Shorten Voting Time":
    @Event global
    @Condition len([player for player in getAllPlayers() if player.wantsToSkipVoting]) >= len(playersInMatch(Team.ALL)) / 2

    roundTime = roundTime / 2

rule "Restart Match":
    @Condition isMatchComplete()

    wait(WS_SET_END)

    restartMatch()

rule "Skip Assembling Heroes":
    @Condition isAssemblingHeroes()

    if WS_SET_SKIP:
        setMatchTime(0)

rule "Spawn Bots":
    @Condition WS_SET_ENABLE_BOTS == 1
    @Condition getNumberOfPlayers(Team.ALL) < 12

    waitThrottle(0.25, 1)
    for dummyBotIndex in range(getNumberOfPlayers(Team.ALL), 12):
        createDummy(random.choice(getAllHeroes()), Team.ALL, -1, nearestWalkablePosition(getSpawnPoints(Team.1)), null)
        lastDummy = getLastCreatedEntity()

        if dummyNames == []:
            dummyNames = getDummyNames()

        selectedDummyName = random.choice(dummyNames)
        dummyNames.remove(selectedDummyName)

        lastDummy.startForcingName(selectedDummyName)
        lastDummy.startFacing(directionTowards(evalOnce(lastDummy).getEyePosition(), MAP_CENTER[mapData.POSITION] + Vector.UP), 100, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        waitThrottle(0.25, 1)
    if RULE_CONDITION: goto RULE_START

rule "Spawn Bots While You Wait":
    @Condition WS_SET_ENABLE_BOTS == 2
    @Condition len([player for player in getAllPlayers() if not player.isDummy()]) < 3

    waitThrottle(0.25, 1)
    for dummyBotIndex in range(getNumberOfPlayers(Team.ALL), 12):
        createDummy(random.choice(getAllHeroes()), Team.ALL, -1, nearestWalkablePosition(getSpawnPoints(Team.1)), null)
        lastDummy = getLastCreatedEntity()

        if dummyNames == []:
            dummyNames = getDummyNames()

        selectedDummyName = random.choice(dummyNames)
        dummyNames.remove(selectedDummyName)

        lastDummy.startForcingName(selectedDummyName)
        lastDummy.startFacing(directionTowards(evalOnce(lastDummy).getEyePosition(), MAP_CENTER[mapData.POSITION] + Vector.UP), 100, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        waitThrottle(0.25, 1)

    fixedSmallMessage(getAllPlayers(), STR_WYW_NOT_ENOUGH_PLAYERS)

    waitUntil(len([player for player in getAllPlayers() if not player.isDummy()]) >= 3, 9999)

    fixedSmallMessage(getAllPlayers(), STR_WYW_ENOUGH_PLAYERS)

    destroyAllDummies()

    if RULE_CONDITION: goto RULE_START