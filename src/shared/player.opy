#!define getSpot CENTER[mapData.POSITION] + angleToDirection(eventPlayer.getSlot() * (360 / getNumberOfPlayers(Team.ALL)), 0) * CENTER[mapData.RADIUS]

#!define changeCard(value) eventPlayer.selectedCard += value\
if eventPlayer.selectedCard >= len(eventPlayer.cards):\
    eventPlayer.selectedCard = len(eventPlayer.cards) - 1\
elif eventPlayer.selectedCard < 0:\
    eventPlayer.selectedCard = 0\
renderCards()\

#!define changeJudgeCard(value) eventPlayer.selectedCardJudge += value\
if eventPlayer.selectedCardJudge >= len(getJudgeCards):\
    eventPlayer.selectedCardJudge = len(getJudgeCards) - 1\
elif eventPlayer.selectedCardJudge < 0:\
    eventPlayer.selectedCardJudge = 0\

playervar playerHudIndex
playervar hud_cardJudge = []
playervar hud_cards = []
playervar hud_selectedCard = []
playervar selectedCard = 0

subroutine stopRenderingCards
def stopRenderingCards():
    if eventPlayer.isDummy(): return
    destroyHudTextLoop(eventPlayer.playerHudIndex, eventPlayer.hud_cards)

subroutine renderCards
def renderCards():
    if len(eventPlayer.hud_cards) > 0: return
    stopRenderingCards()

    hudSubtext(eventPlayer if eventPlayer != cardJudge else false, STR_YOUR_CARDS, HudPosition.LEFT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.hud_cards.append(getLastCreatedText())

    # Create hud text for each card, and show the selected card
    for eventPlayer.playerHudIndex in range(0, 5, 1):
        hudHeader(eventPlayer if eventPlayer != cardJudge else false, "{} {}".format("" if eventPlayer.selectedCard != evalOnce(eventPlayer.playerHudIndex) else ">", eventPlayer.cards[evalOnce(eventPlayer.playerHudIndex)]), HudPosition.LEFT, evalOnce(eventPlayer.playerHudIndex), Color.LIME_GREEN if eventPlayer.selectedCard == evalOnce(eventPlayer.playerHudIndex) and eventPlayer.playedCard == true else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        eventPlayer.hud_cards.append(getLastCreatedText())

    hudSubtext(eventPlayer if eventPlayer != cardJudge else false, STR_CARD_CONTROLS, HudPosition.LEFT, len(eventPlayer.cards) + 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.hud_cards.append(getLastCreatedText())

rule "Global Huds":
    hudSubheader(getAllPlayers(), STR_VERSION, HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubheader(getAllPlayers(), STR_WEBLINK, HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubtext(getAllPlayers(), STR_GAME_NAME, HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

rule "Player Setup":
    @Event eachPlayer

    waitUntil(eventPlayer.hasSpawned(), 9999)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setMeleeEnabled(false)

    createEffect(getAllPlayers(), Effect.RING, SUB_COLOR if cardJudge == eventPlayer else VOTE_COLOR if eventPlayer.playedCard else PRIMARY_COLOR, getSpot, 1.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    eventPlayer.teleport(getSpot)

rule "Get Cards":
    @Event eachPlayer
    @Condition currentGameState == gameState.ROUND
    
    eventPlayer.cards.remove(eventPlayer.cards[eventPlayer.selectedCard])
    eventPlayer.playedCard = false

    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), 5, 1):
        eventPlayer.cards.append(random.choice(cards))
    waitUntil(entityExists(cardJudge), 9999)
    if eventPlayer == cardJudge: return
    renderCards()

rule "Change Card (Left)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)

    changeCard(-1)

rule "Change Card (Right)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    changeCard(1)

rule "Play Card":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    eventPlayer.playedCard = true
    renderCards()

rule "Redraw Cards":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    @Condition cardJudge != eventPlayer
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.playedCard == false

    eventPlayer.playedCard = true
    eventPlayer.cards = []

rule "Forfeit":
    @Event playerJoined
    @Condition currentGameState == gameState.ROUND

    waitUntil(eventPlayer.hasSpawned(), 9999)
    eventPlayer.playedCard = true

rule "Label Card Judge":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer

    eventPlayer.startForcingOutlineFor(getAllPlayers(), true, SUB_COLOR, OutlineVisibility.DEFAULT)

    createInWorldText(getAllPlayers(), STR_CARD_JUDGE, eventPlayer, 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)
    eventPlayer.hud_cardJudge.append(getLastCreatedText())

    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, SUB_COLOR, getSpot, 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.hud_cardJudge.append(getLastCreatedEntity())

    if eventPlayer.isDummy(): goto skip_hud_creation
    hudHeader(eventPlayer, STR_IS_JUDGE, HudPosition.TOP, 1, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.hud_cardJudge.append(getLastCreatedText())

    hudSubtext(eventPlayer if currentGameState == gameState.ROUND else false, STR_WAIT_FOR_CARDS, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.hud_cardJudge.append(getLastCreatedText())

    hudText(eventPlayer if currentGameState == gameState.VOTING else false, getJudgeCards[eventPlayer.selectedCardJudge].cards[getJudgeCards[eventPlayer.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 4, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.hud_cardJudge.append(getLastCreatedText())
    skip_hud_creation:

    createEffect(getAllPlayers().exclude(cardJudge) if currentGameState == gameState.VOTING else false, Effect.LIGHT_SHAFT, VOTE_COLOR, getJudgeCards[eventPlayer.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.hud_cardJudge.append(getLastCreatedEntity())

    createInWorldText(getAllPlayers().exclude(cardJudge if not entityExists(eventPlayer.cardVoted) else false) if currentGameState == gameState.VOTING else false, getJudgeCards[eventPlayer.selectedCardJudge].cards[getJudgeCards[eventPlayer.selectedCardJudge].selectedCard], getJudgeCards[eventPlayer.selectedCardJudge], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, PRIMARY_COLOR, SpecVisibility.DEFAULT)
    eventPlayer.hud_cardJudge.append(getLastCreatedText())

    waitUntil(cardJudge != eventPlayer, 9999)

    destroyMultipleLoop(eventPlayer.playerHudIndex, eventPlayer.hud_cardJudge)
    eventPlayer.stopForcingOutlineFor(getAllPlayers())

rule "Change Judge Card (Left)":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)

    changeJudgeCard(-1)

rule "Change Judge Card (Right)":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)

    changeJudgeCard(1)

rule "Judge Vote":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    eventPlayer.cardVoted = getJudgeCards[eventPlayer.selectedCardJudge]
    cardVotedName = getJudgeCards[eventPlayer.selectedCardJudge]

rule "Keep in Circle":
    @Event eachPlayer
    @Condition distance(eventPlayer.getPosition(), getSpot) > 1.5

    eventPlayer.teleport(getSpot)
    wait()
    if RULE_CONDITION: goto RULE_START

rule "Disable Jump / Crouch":
    @Event eachPlayer
    @Condition eventPlayer.isInAir()

    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.CROUCH)
    waitUntil(eventPlayer.isOnGround(), 9999)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)