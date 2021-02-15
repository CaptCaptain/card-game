#!define getSpot(player) CENTER[mapData.POSITION] + angleToDirection(player.getSlot() * (360 / getNumberOfPlayers(Team.ALL)), 0) * CENTER[mapData.RADIUS]

#!define changeCard(value) eventPlayer.selectedCard += value\
if eventPlayer.selectedCard >= len(eventPlayer.cards) - 1:\
    eventPlayer.selectedCard = len(eventPlayer.cards) - 1\
elif eventPlayer.selectedCard < 0:\
    eventPlayer.selectedCard = 0\

#!define changeJudgeCard(value) eventPlayer.selectedCardJudge += value\
if eventPlayer.selectedCardJudge >= len(getJudgeCards) - 1:\
    eventPlayer.selectedCardJudge = len(getJudgeCards) - 1\
elif eventPlayer.selectedCardJudge < 0:\
    eventPlayer.selectedCardJudge = 0\

playervar playerHudIndex
playervar hud_cards = []
playervar selectedCard = 0

subroutine renderCards
def renderCards():
    # Create hud text for each card, and show the selected card
    for globalHudIndex in range(0, WS_SET_CARDS, 1):
        hudHeader(localPlayer if localPlayer != cardJudge else null, "{} {}".format("" if localPlayer.selectedCard != evalOnce(globalHudIndex) else ">", localPlayer.cards[evalOnce(globalHudIndex)]) if len(localPlayer.cards) > 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.LIME_GREEN if localPlayer.selectedCard == evalOnce(globalHudIndex) and localPlayer.playedCard == true else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        wait()

rule "Global Huds":

    renderCards()

    # Your cards hud text
    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_YOUR_CARDS, HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Control hud text
    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_CARD_CONTROLS, HudPosition.LEFT, WS_SET_CARDS + 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Credit huds
    hudSubheader(localPlayer, STR_VERSION, HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubheader(localPlayer, STR_WEBLINK, HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer, STR_GAME_NAME, HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    # Lobby Ruleset
    hudSubtext(localPlayer, "———————————\n{}".format(STR_LOBBY_RULESET), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubheader(localPlayer, "{}\n{}\n{}".format(STR_RULESET_SCORE_TO_WIN, STR_RULESET_PLAY_CARD_TIME, STR_RULESET_JUDGE_VOTE_TIME), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    # Select the card that best fits the word hud
    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING) or (localPlayer == cardJudge and currentGameState != gameState.ROUND) else null, "{}:".format(STR_CARD_INSTRUCTION), HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Current word
    hudHeader(localPlayer if currentGameState != gameState.WAITING else null, cardSentence, HudPosition.TOP, 3, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #Judge hud
    hudHeader(localPlayer if localPlayer == cardJudge else null, STR_IS_JUDGE, HudPosition.TOP, 1, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if localPlayer == cardJudge and currentGameState == gameState.ROUND else null, STR_WAIT_FOR_CARDS, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #hudSubtext(localPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudText(localPlayer if localPlayer == cardJudge and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 5, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and currentGameState == gameState.VOTING) else null, Effect.LIGHT_SHAFT, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and currentGameState == gameState.VOTING) else null, Effect.GOOD_AURA, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge], 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The text that will be shown on the player the judge is currently selecting
    createInWorldText(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and currentGameState == gameState.VOTING) else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], getJudgeCards[cardJudge.selectedCardJudge], 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.ALWAYS)

    # Judge title
    createInWorldText(localPlayer if entityExists(cardJudge) else null, STR_CARD_JUDGE, cardJudge, 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)

    # Judge light shaft
    createEffect(localPlayer if entityExists(cardJudge) else null, Effect.LIGHT_SHAFT, SUB_COLOR, getSpot(cardJudge), 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

rule "Player Setup":
    @Event eachPlayer

    waitUntil(eventPlayer.hasSpawned(), 9999)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setReloadEnabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.disableHeroHUD()

    createEffect(getAllPlayers(), Effect.RING, SUB_COLOR if cardJudge == eventPlayer else VOTE_COLOR if eventPlayer.playedCard else PRIMARY_COLOR, getSpot(eventPlayer), 1.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    eventPlayer.teleport(getSpot(eventPlayer))
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), CENTER[mapData.POSITION] + Vector.UP), Relativity.TO_WORLD)

rule "Get Cards":
    @Event eachPlayer
    @Condition currentGameState == gameState.ROUND
    
    ignoreCardFilter.remove(eventPlayer.cards[eventPlayer.selectedCard])
    eventPlayer.cards.remove(eventPlayer.cards[eventPlayer.selectedCard])

    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), WS_SET_CARDS, 1):
        eventPlayer.cards.append(random.choice(cards.exclude(eventPlayer.cards).exclude(ignoreCardFilter)))
        ignoreCardFilter.append(eventPlayer.cards.last())
        wait()
    waitUntil(entityExists(cardJudge), 9999)

rule "Change Card (Left)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)

    changeCard(-1)

rule "Change Card (Right)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1)

    changeCard(1)

rule "Play Card":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    eventPlayer.playedCard = true

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
    @Condition currentGameState == gameState.VOTING

    waitUntil(eventPlayer.hasSpawned(), 9999)
    eventPlayer.playedCard = true

rule "Clean up":
    @Event playerLeft

    eventPlayer.cards = []
    eventPlayer.playedCard = false

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
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1)

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

rule "Keep in Circle":
    @Event eachPlayer
    @Condition distance(eventPlayer.getPosition(), getSpot(eventPlayer)) >= 1.5

    eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), getSpot(eventPlayer)), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION_XYZ)
    wait()
    if RULE_CONDITION: goto RULE_START

rule "Close to Score Fire":
    @Event eachPlayer
    @Condition eventPlayer.getScore() >= WS_SET_SCORE_NEEDED - 1

    eventPlayer.setStatusEffect(null, Status.BURNING, 9999)

    smallMessage(getAllPlayers(), "{} is one point away from winning!".format(eventPlayer))

    waitUntil(eventPlayer.getScore() < WS_SET_SCORE_NEEDED - 1, 9999)

    eventPlayer.clearStatusEffect(Status.BURNING)

rule "Disable Jump / Crouch":
    @Event eachPlayer
    @Condition eventPlayer.isInAir()

    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.CROUCH)
    waitUntil(eventPlayer.isOnGround(), 9999)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)