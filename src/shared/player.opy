#!define getSpot(player) CENTER[mapData.POSITION] + angleToDirection(player.getSlot() * (360 / getNumberOfPlayers(Team.ALL)), 0) * CENTER[mapData.RADIUS]

#!define changeCard(value) eventPlayer.selectedCard += value\
if eventPlayer.selectedCard >= len(eventPlayer.cards) - 1:\
    eventPlayer.selectedCard = len(eventPlayer.cards) - 1\
elif eventPlayer.selectedCard < 0:\
    eventPlayer.selectedCard = 0\
renderCards()\

#!define changeJudgeCard(value) eventPlayer.selectedCardJudge += value\
if eventPlayer.selectedCardJudge >= len(getJudgeCards) - 1:\
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
    if eventPlayer.isDummy(): return
    stopRenderingCards()

    # Create hud text for each card, and show the selected card
    for eventPlayer.playerHudIndex in range(0, 5, 1):
        hudHeader(eventPlayer if eventPlayer != cardJudge else null, "{} {}".format("" if eventPlayer.selectedCard != evalOnce(eventPlayer.playerHudIndex) else ">", eventPlayer.cards[evalOnce(eventPlayer.playerHudIndex)]) if len(eventPlayer.cards) > 0 else "", HudPosition.LEFT, evalOnce(eventPlayer.playerHudIndex), Color.LIME_GREEN if eventPlayer.selectedCard == evalOnce(eventPlayer.playerHudIndex) and eventPlayer.playedCard == true else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        eventPlayer.hud_cards.append(getLastCreatedText())

rule "Global Huds":

    # Your cards hud text
    hudSubtext([player for player in getLivingPlayers(Team.ALL).exclude(cardJudge) if len(player.cards) > 0], STR_YOUR_CARDS, HudPosition.LEFT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Control hud text
    hudSubtext([player for player in getLivingPlayers(Team.ALL).exclude(cardJudge) if len(player.cards) > 0], STR_CARD_CONTROLS, HudPosition.LEFT, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Credit huds
    hudSubheader(getAllPlayers(), STR_VERSION, HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubheader(getAllPlayers(), STR_WEBLINK, HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubtext(getAllPlayers(), STR_GAME_NAME, HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    # Select the card that best fits the word hud
    hudSubtext(getAllPlayers().exclude(cardJudge if currentGameState == gameState.ROUND else null) if currentGameState != gameState.WAITING else null, "{}:".format(STR_CARD_INSTRUCTION), HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Current word
    hudHeader(getAllPlayers() if currentGameState != gameState.WAITING else null, cardSentence, HudPosition.TOP, 3, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #Judge hud
    hudHeader(cardJudge if entityExists(cardJudge) else null, STR_IS_JUDGE, HudPosition.TOP, 1, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(cardJudge if entityExists(cardJudge) and currentGameState == gameState.ROUND else null, STR_WAIT_FOR_CARDS, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudText(cardJudge if entityExists(cardJudge) and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 4, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(getAllPlayers().exclude(cardJudge if not entityExists(cardJudge.cardVoted) else null) if entityExists(cardJudge) and currentGameState == gameState.VOTING else null, Effect.LIGHT_SHAFT, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(getAllPlayers().exclude(cardJudge if not entityExists(cardJudge.cardVoted) else null) if entityExists(cardJudge) and currentGameState == gameState.VOTING else null, Effect.GOOD_AURA, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge], 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The text that will be shown on the player the judge is currently selecting
    createInWorldText(getAllPlayers().exclude(cardJudge if not entityExists(cardJudge.cardVoted) else null) if entityExists(cardJudge) and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], getJudgeCards[cardJudge.selectedCardJudge], 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)

    # Judge title
    createInWorldText(getAllPlayers() if entityExists(cardJudge) else null, STR_CARD_JUDGE, cardJudge, 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)

    # Judge light shaft
    createEffect(getAllPlayers() if entityExists(cardJudge) else null, Effect.LIGHT_SHAFT, SUB_COLOR, getSpot(cardJudge), 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

rule "Player Setup":
    @Event eachPlayer

    waitUntil(eventPlayer.hasSpawned(), 9999)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setReloadEnabled(false)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.disallowButton(Button.INTERACT)
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)

    createEffect(getAllPlayers(), Effect.RING, SUB_COLOR if cardJudge == eventPlayer else VOTE_COLOR if eventPlayer.playedCard else PRIMARY_COLOR, getSpot(eventPlayer), 1.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    eventPlayer.teleport(getSpot(eventPlayer))
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), CENTER[mapData.POSITION] + Vector.UP), Relativity.TO_WORLD)

rule "Get Cards":
    @Event eachPlayer
    @Condition currentGameState == gameState.ROUND
    
    eventPlayer.cards.remove(eventPlayer.cards[eventPlayer.selectedCard])
    eventPlayer.playedCard = false

    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), 5, 1):
        eventPlayer.cards.append(random.choice(cards.exclude(eventPlayer.cards)))
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

rule "Clean up":
    @Event playerLeft

    stopRenderingCards()

rule "Outline Card Judge":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer

    eventPlayer.startForcingOutlineFor(getAllPlayers(), true, SUB_COLOR, OutlineVisibility.DEFAULT)

    waitUntil(cardJudge != eventPlayer, 9999)

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
    @Condition distance(eventPlayer.getPosition(), getSpot(eventPlayer)) > 1.5

    eventPlayer.teleport(getSpot(eventPlayer))
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