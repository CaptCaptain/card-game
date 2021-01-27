#!define GetMapData() __script__("../shared/mapData.js")
GetMapData()

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

#!define getJudgeCards sorted([player for player in getLivingPlayers(Team.ALL).exclude(cardJudge) if len(player.cards) > 0], lambda player: player.getSlot())

enum mapData:
    POSITION = 0,
    RADIUS = 1

enum gameState:
    WAITING,
    ROUND,
    VOTING,
    END

globalvar globalHudIndex

globalvar cardJudge
globalvar slot = -1
globalvar cardSentence
globalvar currentGameState = gameState.WAITING
globalvar roundTime = 0
globalvar hud_gameMessages = []

playervar cards = []
playervar cardVoted = false
globalvar cardVotedName = []
playervar playedCard = false
playervar selectedCardJudge = 0

globalvar sentences = []
globalvar cards = []
globalvar lastDummy

rule "Create Effects":
    # Create Center Effect
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLACK if currentGameState == gameState.VOTING else PRIMARY_COLOR, CENTER[mapData.POSITION], 2, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    # Create Title
    createInWorldText(getAllPlayers(), STR_TITLE_MESSAGE, CENTER[mapData.POSITION] + (Vector.UP * 4), 5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())
    createInWorldText(getAllPlayers(), STR_WAITING_FOR_PLAYERS, CENTER[mapData.POSITION] + (Vector.UP * 3), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

rule "Disable Inspector / Update Match Time":
    disableInspector()
    waitUntil(isGameInProgress(), 9999)
    
    while true:
        setMatchTime(roundTime)
        wait()

rule "Waiting For Players":
    @Condition currentGameState == gameState.WAITING
    disableAnnouncer()
    disableGamemodeCompletion()
    disableScoring()

    waitUntil(isGameInProgress(), 9999)
    disableMusic()
    pauseMatchTime()
    waitUntil(getNumberOfLivingPlayers(Team.ALL) >= 3, 9999)

    destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)
    wait(1)
    currentGameState = gameState.ROUND

rule "Round":
    @Condition currentGameState == gameState.ROUND

    setObjectiveDescription(getAllPlayers(), STR_PLAY_CARDS, HudReeval.VISIBILITY)

    # Each player takes turns, the game skips any players that have not spawned in or do not exist.
    slot += 1
    while not (entityExists(getPlayersInSlot(slot, Team.ALL)) and getPlayersInSlot(slot, Team.ALL).hasSpawned()):
        if slot > 12:
            slot = 0
            break
        else:
            slot += 1
        wait()
    roundTime = WS_SET_PICK_TIME

    # Select judge and sentence
    cardJudge = getPlayersInSlot(slot, Team.ALL)
    cardSentence = random.choice(sentences.exclude(cardSentence))

    # Create center text
    createInWorldText(getAllPlayers(), STR_WAIT_FOR_CARDS, CENTER[mapData.POSITION] + (Vector.UP * 2), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    createInWorldText(getAllPlayers(), round(roundTime), CENTER[mapData.POSITION] + (Vector.UP * 0.5), 3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 10)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 100)

    # Wait for everyone to get their cards
    waitUntil(all([len(player.cards) > 0 for player in getLivingPlayers(Team.ALL).exclude(cardJudge)]), 9999)

    chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    # Dummy bots automatically play cards
    if any([player.isDummy() for player in getAllPlayers()]):
        wait(2)
        [player for player in getAllPlayers() if player.isDummy()].playedCard = true

    wait(0.1)
    
    # Wait until everyone plays their cards or the time runs out
    waitUntil(roundTime == 0 or all([player.playedCard == true for player in getLivingPlayers(Team.ALL).exclude(cardJudge)]), 9999)

    stopChasingVariable(roundTime)
    
    # Any players automatically play their cards if they haven't already
    getAllPlayers().exclude(cardJudge).playedCard = true

    destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)

    currentGameState = gameState.VOTING

rule "Voting":
    @Condition currentGameState == gameState.VOTING

    setObjectiveDescription(getAllPlayers(), STR_VOTING, HudReeval.VISIBILITY)
    
    roundTime = WS_SET_VOTING_TIME

    createInWorldText(getAllPlayers(), STR_WAIT_FOR_JUDGE, CENTER[mapData.POSITION] + (Vector.UP * 2), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    createInWorldText(getAllPlayers(), round(roundTime), CENTER[mapData.POSITION] + (Vector.UP * 0.5), 3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 10)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 100)

    chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    # Dummy bots automatically vote
    if cardJudge.isDummy():
        wait(2)
        cardJudge.selectedCardJudge = random.randint(0, len(getJudgeCards) - 1)
        cardJudge.cardVoted = getJudgeCards[cardJudge.selectedCardJudge]
        if cardJudge.cardVoted.isDummy():
            cardJudge.cardVoted.communicate(Comms.THANKS)

    wait(0.1)

    # Wait until time runs out or judge has voted
    waitUntil(roundTime == 0 or entityExists(cardJudge.cardVoted) or not entityExists(cardJudge), 9999)

    stopChasingVariable(roundTime)

    # If the judge does not vote, force them to
    if not entityExists(cardJudge.cardVoted):
        cardJudge.cardVoted = getJudgeCards[cardJudge.selectedCardJudge]

    destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)

    createInWorldText(getAllPlayers(), STR_JUDGE_VOTED, CENTER[mapData.POSITION] + (Vector.UP * 2), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    # Play effect
    wait(0.1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, VOTE_COLOR, cardJudge.cardVoted.getPosition(), 2)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, VOTE_COLOR, cardJudge.cardVoted.getPosition(), 10)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, cardJudge.cardVoted.getPosition(), 100)
    cardJudge.cardVoted.addToScore(1)

    wait(3)

    cardJudge.selectedCardJudge = 0
    cardJudge.cardVoted = null
    cardJudge = null

    destroyInWorldTextLoop(globalHudIndex, hud_gameMessages)

    currentGameState = gameState.ROUND

rule "Player Reached Score":
    @Event global
    @Condition any([player.getScore() >= WS_SET_SCORE_NEEDED for player in getAllPlayers()])

    declarePlayerVictory(sorted(getAllPlayers(), lambda player: player.getScore()).last())
    enableMusic()

rule "Debug: Spawn Bots":
    if not WS_SET_ENABLE_BOTS: return
    while getNumberOfPlayers(Team.ALL) < 12:
        createDummy(random.choice(getAllHeroes()), Team.ALL, -1, nearestWalkablePosition(getSpawnPoints(Team.1)), null)
        lastDummy = getLastCreatedEntity()
        wait(0.25)
    wait(9999)