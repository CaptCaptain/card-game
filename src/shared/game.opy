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

#!define getJudgeCards [player for player in getLivingPlayers(Team.ALL).exclude(cardJudge) if len(player.cards) > 0]

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

globalvar sentences = getSentence
globalvar cards = getCard

rule "Create Effects":
    # Create Center Effect
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, PRIMARY_COLOR if currentGameState != gameState.VOTING else Color.BLACK, CENTER[mapData.POSITION], 2, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    # Create Title
    createInWorldText(getAllPlayers(), STR_TITLE_MESSAGE, CENTER[mapData.POSITION] + (Vector.UP * 4), 5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())
    createInWorldText(getAllPlayers(), STR_WAITING_FOR_PLAYERS, CENTER[mapData.POSITION] + (Vector.UP * 3), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    hudHeader(getAllPlayers(), getServerLoad(), HudPosition.RIGHT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudHeader(getAllPlayers(), currentGameState, HudPosition.RIGHT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

rule "Update Match Time":
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
    slot += 1
    while not entityExists(getPlayersInSlot(slot, Team.ALL)) and not getPlayersInSlot(slot, Team.ALL).hasSpawned():
        if slot > 12:
            slot = 0
            break
        else:
            slot += 1
        wait()
    roundTime = WS_SET_PICK_TIME

    cardJudge = getPlayersInSlot(slot, Team.ALL)
    cardSentence = random.choice(sentences)

    createInWorldText(getAllPlayers(), STR_CARD_INSTRUCTION, CENTER[mapData.POSITION] + (Vector.UP * 4), 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    createInWorldText(getAllPlayers(), cardSentence, CENTER[mapData.POSITION] + (Vector.UP * 3), 1.25, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    createInWorldText(getAllPlayers(), round(roundTime), CENTER[mapData.POSITION] + (Vector.UP * 0.5), 5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)
    hud_gameMessages.append(getLastCreatedText())

    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 10)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, SUB_COLOR, CENTER[mapData.POSITION] + (Vector.UP * 3.5), 100)

    waitUntil(all([len(player.cards) > 0 for player in getLivingPlayers(Team.ALL).exclude(cardJudge)]), 9999)

    chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    # Dummy bots automatically play
    [player for player in getAllPlayers() if player.isDummy()].playedCard = true

    wait()
    
    waitUntil(roundTime == 0 or all([player.playedCard == true for player in getAllPlayers().exclude(cardJudge)]), 9999)

    stopChasingVariable(roundTime)

    getAllPlayers().exclude(cardJudge).playedCard = true

    currentGameState = gameState.VOTING

rule "Voting":
    @Condition currentGameState == gameState.VOTING
    
    roundTime = WS_SET_VOTING_TIME

    chase(roundTime, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)

    # Dummy bots automatically vote
    if cardJudge.isDummy(): cardJudge.cardVoted = cardJudge.getPlayerClosestToReticle(getOppositeTeam(cardJudge.getTeam()))

    wait()

    waitUntil(roundTime == 0 or entityExists(cardJudge.cardVoted), 9999)

    stopChasingVariable(roundTime)

    if not entityExists(cardJudge.cardVoted): cardJudge.cardVoted = getJudgeCards[cardJudge.selectedCardJudge]

    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, VOTE_COLOR, cardJudge.cardVoted.getPosition(), 2)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, VOTE_COLOR, cardJudge.cardVoted.getPosition(), 10)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, cardJudge.cardVoted.getPosition(), 100)

    cardJudge.cardVoted.addToScore(1)

    #smallMessage(getAllPlayers(), STR_JUDGE_VOTED)

    wait(2)

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
    @Condition hostPlayer.isCommunicating(Comms.READY)    

    while getNumberOfPlayers(Team.ALL) < 12:
        createDummy(random.choice(getAllHeroes()), Team.ALL, -1, nearestWalkablePosition(getSpawnPoints(Team.1)), null)
        wait(0.25)
    wait(9999)
