#!define theta(totalPoints) ((Math.PI*2) / totalPoints)
#!define angle(currentPoint, totalPoints) (theta(totalPoints) * currentPoint)
#!define getX(player, radius) radius * cos(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))
#!define getZ(player, radius) radius * sin(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))

#!define getSpot(player) MAP_CENTER[mapData.POSITION] + vect(getX(player, MAP_CENTER[mapData.RADIUS]), 0, getZ(player, MAP_CENTER[mapData.RADIUS]))

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

#!define cardSelectionFilter(player) cardSelection.exclude(player.cards).exclude(ignoreCardFilter)

#!define lerp(start, end, frac) start + frac * (end - start)
#!define lerp_color(start, end, frac) rgba(lerp(start[0], end[0], frac), lerp(start[1], end[1], frac), lerp(start[2], end[2], frac), lerp(start[3], end[3], frac))

playervar playerHudIndex
playervar hud_cards = []
playervar selectedCard = 0
playervar chatEnabled = false

subroutine getCards
subroutine renderCards

def getCards():
    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), WS_SET_CARDS, 1):
        if len(ignoreCardFilter) >= len(cardSelection) or len(cardSelectionFilter(eventPlayer)) == 0:
            ignoreCardFilter = []

        eventPlayer.cards.append(random.choice(cardSelectionFilter(eventPlayer)))
        ignoreCardFilter.append(eventPlayer.cards.last())
        wait()

def renderCards():
    # Create hud text for each card, and show the selected card
    for globalHudIndex in range(0, WS_SET_CARDS, 1):
        hudHeader(localPlayer if localPlayer != cardJudge else null, "{} {}".format("" if localPlayer.selectedCard != evalOnce(globalHudIndex) else "▶▶", localPlayer.cards[evalOnce(globalHudIndex)]) if len(localPlayer.cards) > 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.LIME_GREEN if localPlayer.selectedCard == evalOnce(globalHudIndex) and localPlayer.playedCard == true else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)) if localPlayer.selectedCard == evalOnce(globalHudIndex) else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        wait()

rule "Global Huds":

    renderCards()

    # Your cards hud text
    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_YOUR_CARDS, HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Credit huds
    hudSubheader(localPlayer, STR_VERSION, HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubheader(localPlayer, STR_WEBLINK, HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer, STR_GAME_NAME, HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    # Lobby Ruleset
    hudHeader(localPlayer, STR_LOBBY_RULESET, HudPosition.RIGHT, 0, SUB_COLOR, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer, "{}\n{}\n{}\n{}".format(STR_RULESET_GAME_STYLE, STR_RULESET_SCORE_TO_WIN, STR_RULESET_PLAY_CARD_TIME, STR_RULESET_JUDGE_VOTE_TIME), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)
    
    # Control hud text
    #hudHeader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_CARD_CONTROLS_TITLE, HudPosition.RIGHT, WS_SET_CARDS + 6, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    #hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_CARD_CONTROLS, HudPosition.RIGHT, WS_SET_CARDS + 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubheader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge  and not localPlayer.playedCard else null, " \n{}{}  {}{}".format(iconString(Icon.ARROW_UP), buttonString(Button.PRIMARY_FIRE), iconString(Icon.ARROW_DOWN), buttonString(Button.SECONDARY_FIRE)), HudPosition.LEFT, WS_SET_CARDS + 7, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, " \n", HudPosition.LEFT, WS_SET_CARDS + 8, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Play Card
    hudHeader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_PLAY_CARD_CONTROL_ICON, HudPosition.LEFT, WS_SET_CARDS + 9, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_PLAY_CARD_CONTROL, HudPosition.LEFT, WS_SET_CARDS + 10, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Redraw Card
    hudHeader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_FORFEIT_CARD_CONTROL_ICON, HudPosition.LEFT, WS_SET_CARDS + 11, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_FORFEIT_CARD_CONTROL, HudPosition.LEFT, WS_SET_CARDS + 12, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Toggle Chat
    hudHeader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_TOGGLE_CHAT_ICON, HudPosition.LEFT, WS_SET_CARDS + 13, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_TOGGLE_CHAT, HudPosition.LEFT, WS_SET_CARDS + 14, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Select the card that best fits the word hud
    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState != gameState.ROUND) else null, "{}:".format(STR_CARD_INSTRUCTION), HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Current word
    hudHeader(localPlayer if currentGameState != gameState.WAITING else null, cardSentence, HudPosition.TOP, 3, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Selected card
    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState != gameState.ROUND) else null, "{}:".format(STR_SELECTED_CARD), HudPosition.TOP, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudHeader(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING) or (localPlayer == cardJudge and currentGameState == gameState.END) else null, localPlayer.cards[localPlayer.selectedCard] if currentGameState != gameState.END else getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], HudPosition.TOP, 5, VOTE_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, STR_SELECTED_CARD_CONTROLS, HudPosition.TOP, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState == gameState.END) or (localPlayer == cardJudge and currentGameState == gameState.END) else null, "{} {}".format(getJudgeCards[cardJudge.selectedCardJudge], STR_PLAYER_WON), HudPosition.TOP, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, "[{}]".format(buttonString(Button.INTERACT)), HudPosition.TOP, 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #Judge hud
    hudHeader(localPlayer if localPlayer == cardJudge else null, STR_IS_JUDGE, HudPosition.TOP, 1, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if localPlayer == cardJudge and currentGameState == gameState.ROUND else null, STR_WAIT_FOR_CARDS, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #hudSubtext(localPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudText(localPlayer if localPlayer == cardJudge and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 5, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.VOTING or currentGameState == gameState.END)) else null, Effect.LIGHT_SHAFT, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.VOTING or currentGameState == gameState.END)) else null, Effect.GOOD_AURA, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge], 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The text that will be shown on the player the judge is currently selecting
    createInWorldText(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.VOTING or currentGameState == gameState.END)) else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], getJudgeCards[cardJudge.selectedCardJudge], 1.5, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)

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
    eventPlayer.disallowButton(Button.INTERACT)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setDamageDealt(0)
    eventPlayer.setDamageReceived(0)
    eventPlayer.disableHeroHUD()
    eventPlayer.disableTextChat()

    createEffect(getAllPlayers(), Effect.RING, SUB_COLOR if cardJudge == eventPlayer else VOTE_COLOR if eventPlayer.playedCard else PRIMARY_COLOR, getSpot(eventPlayer), 1.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    eventPlayer.teleport(getSpot(eventPlayer))
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), MAP_CENTER[mapData.POSITION] + Vector.UP), Relativity.TO_WORLD)

    waitUntil(eventPlayer.isAlive(), 9999)
    wait(1)
    if not scoringEnabled:
        smallMessage(eventPlayer, "{} While You Wait is enabled, waiting for 3 players".format(iconString(Icon.EXCLAMATION_MARK)))

rule "Get Cards":
    @Event eachPlayer
    @Condition currentGameState == gameState.ROUND
    
    ignoreCardFilter.remove(eventPlayer.cards[eventPlayer.selectedCard])
    eventPlayer.cards.remove(eventPlayer.cards[eventPlayer.selectedCard])

    async(getCards, AsyncBehavior.NOOP)
    waitUntil(entityExists(cardJudge), 9999)

rule "Change Card (Left)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    changeCard(-1)

rule "Change Card (Right)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    changeCard(1)

rule "Play Card":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    eventPlayer.playedCard = true

    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION, VOTE_COLOR, getSpot(eventPlayer), 5)
    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION_SOUND, PRIMARY_COLOR, getSpot(eventPlayer), 100)

    smallMessage(eventPlayer, '{} Played "{}"'.format(iconString(Icon.CHECKMARK), eventPlayer.cards[evalOnce(eventPlayer.selectedCard)].replace("\n", " ")))

rule "Redraw Cards":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)
    @Condition cardJudge != eventPlayer
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.playedCard == false

    eventPlayer.playedCard = true
    eventPlayer.cards = []

    playEffect(eventPlayer, DynamicEffect.BAD_PICKUP_EFFECT, VOTE_COLOR, getSpot(eventPlayer), 5)
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, PRIMARY_COLOR, getSpot(eventPlayer), 100)

    smallMessage(eventPlayer, "{} Turn forfeited, new cards given on next turn".format(iconString(Icon.EXCLAMATION_MARK)))

rule "Inactivity Kick":
    @Event eachPlayer
    @Condition not eventPlayer.hasSpawned()
    
    if not WS_SET_ENABLE_KICK:
        return

    # Remove players that have not spawned in for 60 seconds
    wait(60, Wait.ABORT_WHEN_FALSE)
    if eventPlayer == hostPlayer:
        # If the player is the host player, force them to spawn
        eventPlayer.startForcingHero(random.choice(eventPlayer.getAllowedHeroes()))
    else:
        removeFromGame(eventPlayer)

rule "Forfeit":
    @Event playerJoined
    @Condition currentGameState == gameState.VOTING

    waitUntil(eventPlayer.hasSpawned(), 9999)
    async(getCards, AsyncBehavior.NOOP)
    eventPlayer.playedCard = true

rule "Clean up":
    @Event playerLeft
    
    ignoreCardFilter.remove(eventPlayer.cards)
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
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    changeJudgeCard(-1)

rule "Change Judge Card (Right)":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    changeJudgeCard(1)

rule "Judge Vote":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    eventPlayer.cardVoted = getJudgeCards[eventPlayer.selectedCardJudge]

rule "Keep in Circle":
    @Event eachPlayer
    @Condition distance(eventPlayer.getPosition(), getSpot(eventPlayer)) >= 1.5

    if distance(eventPlayer.getPosition(), getSpot(eventPlayer)) >= 2:
        eventPlayer.teleport(getSpot(eventPlayer))
    else:
        eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), getSpot(eventPlayer)), 1, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION_XYZ)
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

rule "Toggle Chat":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)

    eventPlayer.chatEnabled = not eventPlayer.chatEnabled

    if eventPlayer.chatEnabled:
        eventPlayer.enableTextChat()
        smallMessage(eventPlayer, "{} Chat visible".format(iconString(Icon.CHECKMARK)))
    else:
        eventPlayer.disableTextChat()
        smallMessage(eventPlayer, "{} Chat hidden".format(iconString(Icon.NO)))