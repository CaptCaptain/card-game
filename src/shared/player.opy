#!define theta(totalPoints) ((Math.PI*2) / totalPoints)
#!define angle(currentPoint, totalPoints) (theta(totalPoints) * currentPoint)
#!define getX(player, radius) radius * cos(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))
#!define getZ(player, radius) radius * sin(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))

#!define getSpot(player) MAP_CENTER[mapData.POSITION] + vect(getX(player, MAP_CENTER[mapData.RADIUS]), 0, getZ(player, MAP_CENTER[mapData.RADIUS]))

#!define changeCard(value) eventPlayer.selectedCard += value\
if eventPlayer.cards[eventPlayer.selectedCard] == null or eventPlayer.cards[eventPlayer.selectedCard] == 0:\
    eventPlayer.selectedCard -= value\

#!define changeJudgeCard(value) eventPlayer.selectedCardJudge += value\
if eventPlayer.selectedCardJudge >= len(getJudgeCards) - 1:\
    eventPlayer.selectedCardJudge = len(getJudgeCards) - 1\
if eventPlayer.selectedCardJudge < 0:\
    eventPlayer.selectedCardJudge = 0\
if eventPlayer.cards[eventPlayer.selectedCardJudge] == null or eventPlayer.cards[eventPlayer.selectedCardJudge] == 0:\
    eventPlayer.selectedCardJudge -= value\

#!define cardSelectionFilter(player) cardSelection.exclude(player.cards).exclude(ignoreCardFilter)

#!define lerp(start, end, frac) start + frac * (end - start)
#!define lerp_color(start, end, frac) rgba(lerp(start[0], end[0], frac), lerp(start[1], end[1], frac), lerp(start[2], end[2], frac), lerp(start[3], end[3], frac))

playervar playerHudIndex
playervar hud_cards = []
playervar chatEnabled = false
playervar cameraMode = 0
playervar tutorialComplete = false
playervar judgeTutorialComplete = false

subroutine getCards
subroutine renderCards

def getCards():
    if eventPlayer.cards == null:
        eventPlayer.cards = []
    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), WS_SET_CARDS, 1):
        if len(ignoreCardFilter) >= len(cardSelection) or len(cardSelectionFilter(eventPlayer)) == 0:
            ignoreCardFilter = []

        eventPlayer.cards.append(random.choice(cardSelectionFilter(eventPlayer)))
        ignoreCardFilter.append(eventPlayer.cards.last())
        wait(0.016)

def renderCards():
    # Create hud text for each card, and show the selected card
    for globalHudIndex in range(0, WS_SET_CARDS, 1):
        if USE_SMALL_CARD_FONT:
            hudSubheader(localPlayer if localPlayer != cardJudge else null, "{} < {} >".format("" if localPlayer.selectedCard != evalOnce(globalHudIndex) else "▶▶", localPlayer.cards[evalOnce(globalHudIndex)]) if localPlayer.cards[evalOnce(globalHudIndex)] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.LIME_GREEN if localPlayer.selectedCard == evalOnce(globalHudIndex) and localPlayer.playedCard == true else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)) if localPlayer.selectedCard == evalOnce(globalHudIndex) else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
            continue
        hudHeader(localPlayer if localPlayer != cardJudge else null, "{} {}".format("" if localPlayer.selectedCard != evalOnce(globalHudIndex) else "▶▶", localPlayer.cards[evalOnce(globalHudIndex)]) if localPlayer.cards[evalOnce(globalHudIndex)] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.LIME_GREEN if localPlayer.selectedCard == evalOnce(globalHudIndex) and localPlayer.playedCard == true else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)) if localPlayer.selectedCard == evalOnce(globalHudIndex) else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        wait(0.016)

rule "Global Huds":

    renderCards()

    # Your cards hud text
    hudSubtext(localPlayer if localPlayer.cards != null and localPlayer != cardJudge else null, STR_YOUR_CARDS, HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

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

    # Controls
    hudSubtext(localPlayer, STR_GAME_CONTROLS, HudPosition.LEFT, WS_SET_CARDS + 9, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Play Card
    hudText(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_PLAY_CARD_CONTROL_ICON, STR_PLAY_CARD_CONTROL, null, HudPosition.LEFT, WS_SET_CARDS + 10,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Redraw Card
    hudText(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_FORFEIT_CARD_CONTROL_ICON, STR_FORFEIT_CARD_CONTROL, null, HudPosition.LEFT, WS_SET_CARDS + 11,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Toggle Chat
    hudText(localPlayer, STR_TOGGLE_CHAT_ICON, STR_TOGGLE_CHAT, null, HudPosition.LEFT, WS_SET_CARDS + 12,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Camera Mode
    hudText(localPlayer, STR_CAMERA_MODE_ICON, STR_CAMERA_MODE, null, HudPosition.LEFT, WS_SET_CARDS + 13,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Select the card that best fits the word hud
    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, "{}:".format(STR_CARD_INSTRUCTION), HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Current word
    hudHeader(localPlayer if currentGameState != gameState.WAITING else null, cardSentence, HudPosition.TOP, 3, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # Selected card
    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, "{}:".format(STR_SELECTED_CARD), HudPosition.TOP, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudHeader(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING) or (localPlayer == cardJudge and currentGameState == gameState.END) else null, localPlayer.cards[localPlayer.selectedCard] if currentGameState != gameState.END else getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], HudPosition.TOP, 5, VOTE_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, STR_SELECTED_CARD_CONTROLS, HudPosition.TOP, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState == gameState.END) or (localPlayer == cardJudge and currentGameState == gameState.END) else null, "{} {}{}:".format(heroIcon(getJudgeCards[cardJudge.selectedCardJudge].getCurrentHero()), getJudgeCards[cardJudge.selectedCardJudge], STR_PLAYER_WON), HudPosition.TOP, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState == gameState.VOTING) else null, STR_WAIT_FOR_JUDGE, HudPosition.TOP, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if (localPlayer != cardJudge and currentGameState != gameState.WAITING and not localPlayer.playedCard) or (localPlayer == cardJudge and currentGameState == gameState.VOTING) else null, "[{}]".format(buttonString(Button.INTERACT)), HudPosition.TOP, 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #Judge hud
    hudHeader(localPlayer if (localPlayer == cardJudge and currentGameState != gameState.END) else null, STR_IS_JUDGE, HudPosition.TOP, 1, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer if localPlayer == cardJudge and currentGameState == gameState.ROUND else null, STR_WAIT_FOR_CARDS, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    #hudSubtext(localPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_SORT_ORDER, SpecVisibility.DEFAULT)

    hudText(localPlayer if localPlayer == cardJudge and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 5, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, Effect.LIGHT_SHAFT, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, Effect.GOOD_AURA, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge], 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The text that will be shown on the player the judge is currently selecting
    createInWorldText(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, "{}".format(STR_WINNING_PLAYER), getJudgeCards[cardJudge.selectedCardJudge], 1.5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, VOTE_COLOR, SpecVisibility.DEFAULT)

    # Judge title
    createInWorldText(localPlayer if entityExists(cardJudge) else null, STR_CARD_JUDGE, cardJudge, 1.5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)

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
    eventPlayer.disallowButton(Button.RELOAD)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setDamageDealt(0)
    eventPlayer.setDamageReceived(0)
    eventPlayer.disableHeroHUD()
    eventPlayer.disableTextChat()
    eventPlayer.disableGamemodeHud()
    eventPlayer.disableEnvironmentCollision(false)

    createEffect(getAllPlayers(), Effect.RING, SUB_COLOR if cardJudge == eventPlayer else VOTE_COLOR if eventPlayer.playedCard else PRIMARY_COLOR, getSpot(eventPlayer), 1.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)
    
    eventPlayer.teleport(getSpot(eventPlayer))
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), MAP_CENTER[mapData.POSITION] + Vector.UP), Relativity.TO_WORLD)

    waitUntil(eventPlayer.isAlive(), 9999)
    wait(1)
    if not scoringEnabled:
        fixedSmallMessage(eventPlayer, "{} While You Wait is enabled, waiting for 3 players".format(iconString(Icon.EXCLAMATION_MARK)))

    # Bot faces random player
    while not isMatchComplete() and eventPlayer.isDummy():
        eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), evalOnce(random.choice(getLivingPlayers(Team.ALL).exclude(eventPlayer)).getEyePosition())), 250, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
        wait(7 + random.uniform(-2, 3))

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
    eventPlayer.tutorialComplete = true

    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION, VOTE_COLOR, getSpot(eventPlayer), 5)
    playEffect(eventPlayer, DynamicEffect.BUFF_IMPACT_SOUND, PRIMARY_COLOR, getSpot(eventPlayer), 100)

    fixedSmallMessage(eventPlayer, STR_PLAY_CARD.replace("\n", " "))

rule "Redraw Cards":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)
    @Condition cardJudge != eventPlayer
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.playedCard == false

    eventPlayer.playedCard = true
    eventPlayer.cards = null

    playEffect(eventPlayer, DynamicEffect.BAD_PICKUP_EFFECT, VOTE_COLOR, getSpot(eventPlayer), 5)
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, PRIMARY_COLOR, getSpot(eventPlayer), 100)

    fixedSmallMessage(eventPlayer, "{} Turn forfeited, new cards given on next turn".format(iconString(Icon.EXCLAMATION_MARK)))

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
    eventPlayer.judgeTutorialComplete = true

rule "Keep in Circle":
    @Event eachPlayer
    @Condition distance(eventPlayer.getPosition(), getSpot(eventPlayer)) >= 1.1

    if distance(eventPlayer.getPosition(), getSpot(eventPlayer)) >= 2:
        eventPlayer.teleport(getSpot(eventPlayer))
    else:
        eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), getSpot(eventPlayer)), 1, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION_XYZ)
        eventPlayer.startForcingThrottle(0, 0, 0, 0, 0, 0)
    wait(0.016)
    if RULE_CONDITION: goto RULE_START

    eventPlayer.stopForcingThrottle()

rule "Close to Score Fire":
    @Event eachPlayer
    @Condition eventPlayer.getScore() >= WS_SET_SCORE_NEEDED - 1

    eventPlayer.setStatusEffect(null, Status.BURNING, 9999)

    fixedSmallMessage(getAllPlayers(), "{} is one point away from winning!".format(eventPlayer))

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
        fixedSmallMessage(eventPlayer, STR_CHAT_VISIBLE)
    else:
        eventPlayer.disableTextChat()
        fixedSmallMessage(eventPlayer, STR_CHAT_HIDDEN)

rule "Tutorial":
    @Event eachPlayer

    if eventPlayer.isDummy():
        return
    
    waitUntil(eventPlayer.hasSpawned(), 9999)
    while not isMatchComplete():
        if eventPlayer == cardJudge and not eventPlayer.judgeTutorialComplete:
            waitUntil(currentGameState == gameState.VOTING, 9999)
            waitUntil(eventPlayer.cardVoted or roundTime <= WS_SET_PICK_TIME, WS_SET_PICK_TIME)
            if eventPlayer.cardVoted == null:
                wait(2)
                fixedSmallMessage(eventPlayer, STR_CARD_SELECTION_TUTORIAL_1)
                wait(2)
                fixedSmallMessage(eventPlayer, STR_CARD_SELECTION_TUTORIAL_2)
        elif eventPlayer != cardJudge and not eventPlayer.tutorialComplete:
            waitUntil(currentGameState == gameState.ROUND, 9999)
            waitUntil(eventPlayer.playedCard or roundTime <= WS_SET_VOTING_TIME, WS_SET_VOTING_TIME)
            if not eventPlayer.playedCard:
                wait(2)
                fixedSmallMessage(eventPlayer, STR_CARD_SELECTION_TUTORIAL_1)
                wait(2)
                fixedSmallMessage(eventPlayer, STR_CARD_SELECTION_TUTORIAL_2)

        wait(1)
        waitUntil(currentGameState == gameState.END, 9999)
        waitUntil(currentGameState == gameState.ROUND, 9999)

        if eventPlayer.judgeTutorialComplete and eventPlayer.tutorialComplete:
            break
    

rule "Switch Camera Mode":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)
    
    eventPlayer.cameraMode += 1
    if eventPlayer.cameraMode > 3:
        eventPlayer.cameraMode = 0
    fixedSmallMessage(eventPlayer, STR_SWITCHED_CAMERA_MODE)
    
    switch (eventPlayer.cameraMode):
        case 0:
            eventPlayer.startCamera(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + (eventPlayer.getFacingDirection() * 1), 15)

            wait(0.32)

            eventPlayer.stopCamera()
            break
        case 1:
            # Transition
            eventPlayer.startCamera(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + (eventPlayer.getFacingDirection() * 1), 60)

            # Third Person Camera
            eventPlayer.startCamera(updateEveryTick(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(vect(1 * -1, 0, 0), eventPlayer, Transform.ROTATION) + eventPlayer.getFacingDirection() * -2.5, getAllPlayers(), eventPlayer, false).getHitPosition()), updateEveryTick(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200, getAllPlayers(), eventPlayer, false).getHitPosition()), 60)
            break
        case 2:
            # Global Camera (No Raycast)
            eventPlayer.startCamera(MAP_CENTER + angleToDirection(getTotalTimeElapsed() * 5, -15) * (10), MAP_CENTER, 50)
            break
        case 3:
            # Global Camera (Raycast)
            eventPlayer.startCamera(raycast(MAP_CENTER, MAP_CENTER + angleToDirection(getTotalTimeElapsed() * 5, -15) * (10), null, null, false).getHitPosition(), MAP_CENTER, 50)
            break