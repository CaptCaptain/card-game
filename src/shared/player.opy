#!define theta(totalPoints) ((Math.PI*2) / totalPoints)
#!define angle(currentPoint, totalPoints) (theta(totalPoints) * currentPoint)
#!define getX(player, radius) radius * cos(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))
#!define getZ(player, radius) radius * sin(angle(sortedPlayers().index(player), getNumberOfPlayers(Team.ALL)))

#!define getSpot(player) MAP_CENTER[mapData.POSITION] + vect(getX(player, MAP_CENTER[mapData.RADIUS]), 0, getZ(player, MAP_CENTER[mapData.RADIUS]))

#!define changeCard(value) eventPlayer.selectedCard += value\
eventPlayer.selectedCard = max(0, min(WS_SET_CARDS - 1, eventPlayer.selectedCard))

#!define changeJudgeCard(value) eventPlayer.selectedCardJudge += value\
eventPlayer.selectedCardJudge = max(0, min(len(playersInMatch(Team.ALL)) - 2, eventPlayer.selectedCardJudge))

#!define cardSelectionFilter(player) cardSelection.exclude(player.cards)

#!define lerp(start, end, frac) start + frac * (end - start)
#!define lerp_color(start, end, frac) rgba(lerp(start[0], end[0], frac), lerp(start[1], end[1], frac), lerp(start[2], end[2], frac), lerp(start[3], end[3], frac))

playervar playerHudIndex
playervar hud_cards = []
playervar chatEnabled = false
playervar cameraMode = 0
playervar tutorialComplete = false
playervar judgeTutorialComplete = false
playervar wantsToSkipVotingDuring

subroutine getCards
subroutine renderCards

def getCards():
    if eventPlayer.cards == null:
        eventPlayer.cards = []
    for eventPlayer.playerHudIndex in range(len(eventPlayer.cards), WS_SET_CARDS, 1):
        if cardSelectionFilter(eventPlayer) != [] or cardSelectionFilter(eventPlayer) != null:
            eventPlayer.cards.append(random.choice(cardSelectionFilter(eventPlayer)))
        else:
            eventPlayer.cards.append(random.choice(cardSelection))
        waitThrottle(0.016, 1)

def renderCards():
    # Create hud text for each card, and show the selected card
    if USE_SMALL_CARD_FONT:
        # Selected Card
        hudSubheader(localPlayer if localPlayer != cardJudge else null, "{0} < {1} > {2}".format("▶▶", "{}...".format(localPlayer.cards[localPlayer.selectedCard].replace("\n", " ").substring(0, 40)) if strLen(localPlayer.cards[localPlayer.selectedCard]) > 40 else localPlayer.cards[localPlayer.selectedCard].replace("\n", " "), "◀◀") if localPlayer.cards[localPlayer.selectedCard] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, localPlayer.selectedCard + 5, Color.LIME_GREEN if localPlayer.playedCard == true else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)), HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        # Selected Judge Card
        hudSubheader(localPlayer if localPlayer == cardJudge else null, "{0} < {1} > {2}".format("▶▶", "{}...".format(getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard].replace("\n", " ").substring(0, 40)) if strLen(getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard]) > 40 else getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard].replace("\n", " "), "◀◀") if getJudgeCards[localPlayer.selectedCardJudge] != null or getJudgeCards[localPlayer.selectedCardJudge] != 0 else "", HudPosition.LEFT, localPlayer.selectedCardJudge + 5, Color.LIME_GREEN if localPlayer.selectedCardJudge == localPlayer.selectedCardJudge and localPlayer.cardVoted != null else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)), HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    else:
        # Selected Card
        hudHeader(localPlayer if localPlayer != cardJudge else null, "{0} {1}".format("▶▶", "{}...".format(localPlayer.cards[localPlayer.selectedCard].replace("\n", " ").substring(0, 40)) if strLen(localPlayer.cards[localPlayer.selectedCard]) > 40 else localPlayer.cards[localPlayer.selectedCard].replace("\n", " ")) if localPlayer.cards[localPlayer.selectedCard] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, localPlayer.selectedCard + 5, Color.LIME_GREEN if localPlayer.playedCard == true else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)), HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.DEFAULT)
        # Selected Judge Card
        hudHeader(localPlayer if localPlayer == cardJudge else null, "{0} {1}".format("▶▶", "{}...".format(getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard].replace("\n", " ").substring(0, 40)) if strLen(getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard]) > 40 else getJudgeCards[localPlayer.selectedCardJudge].cards[getJudgeCards[localPlayer.selectedCardJudge].selectedCard].replace("\n", " ")) if getJudgeCards[localPlayer.selectedCardJudge] != null or getJudgeCards[localPlayer.selectedCardJudge] != 0 else "", HudPosition.LEFT, localPlayer.selectedCardJudge + 5, Color.LIME_GREEN if localPlayer.selectedCardJudge == localPlayer.selectedCardJudge and localPlayer.cardVoted != null else lerp_color([255, 255, 255, 255], [160, 232, 27, 255], sin(getTotalTimeElapsed() * 10)), HudReeval.VISIBILITY_SORT_ORDER_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    for globalHudIndex in range(0, WS_SET_CARDS, 1):
        if USE_SMALL_CARD_FONT:
            # Non Selected Card
            hudSubheader(localPlayer if localPlayer != cardJudge and localPlayer.selectedCard != evalOnce(globalHudIndex) else null, "< {0} >".format("{}...".format(localPlayer.cards[evalOnce(globalHudIndex)].replace("\n", " ").substring(0, 40)) if strLen(localPlayer.cards[evalOnce(globalHudIndex)]) > 40 else localPlayer.cards[evalOnce(globalHudIndex)].replace("\n", " ")) if localPlayer.cards[evalOnce(globalHudIndex)] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
            # Non Selected Judge Card
            hudSubheader(localPlayer if localPlayer == cardJudge and localPlayer.selectedCardJudge != evalOnce(globalHudIndex) else null, "< {0} >".format("{}...".format(getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard].replace("\n", " ").substring(0, 40)) if strLen(getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard]) > 40 else getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard].replace("\n", " ")) if getJudgeCards[evalOnce(globalHudIndex)] != null or getJudgeCards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
            continue
        hudHeader(localPlayer if localPlayer != cardJudge and localPlayer.selectedCard != evalOnce(globalHudIndex) else null, "{0}".format("{}...".format(localPlayer.cards[evalOnce(globalHudIndex)].replace("\n", " ").substring(0, 40)) if strLen(localPlayer.cards[evalOnce(globalHudIndex)]) > 40 else localPlayer.cards[evalOnce(globalHudIndex)].replace("\n", " ")) if localPlayer.cards[evalOnce(globalHudIndex)] != null or localPlayer.cards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, VOTE_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
        # Judge Cards
        hudHeader(localPlayer if localPlayer == cardJudge and localPlayer.selectedCardJudge != evalOnce(globalHudIndex) else null, "{0}".format("{}...".format(getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard].replace("\n", " ").substring(0, 40)) if strLen(getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard]) > 40 else getJudgeCards[evalOnce(globalHudIndex)].cards[getJudgeCards[evalOnce(globalHudIndex)].selectedCard].replace("\n", " ")) if getJudgeCards[evalOnce(globalHudIndex)] != null or getJudgeCards[evalOnce(globalHudIndex)] != 0 else "", HudPosition.LEFT, evalOnce(globalHudIndex) + 5, VOTE_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

rule "Global Huds":
    # Your cards hud text
    hudSubtext(localPlayer if (localPlayer.cards != null and localPlayer != cardJudge) or ([player.cards for player in getJudgeCards] != [] and localPlayer == cardJudge) else null, STR_YOUR_CARDS if localPlayer != cardJudge else STR_YOUR_CARDS_JUDGE, HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Credit huds
    hudSubheader(localPlayer, "{}\n{}\n{}\n".format(STR_CREATOR, STR_WEBLINK, STR_VERSION), HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer, STR_GAME_NAME, HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

    # Lobby Ruleset
    hudHeader(localPlayer, STR_LOBBY_RULESET, HudPosition.RIGHT, 0, SUB_COLOR, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)

    hudSubtext(localPlayer, "{}\n{}\n{}\n{}".format(STR_RULESET_GAME_STYLE, STR_RULESET_SCORE_TO_WIN, STR_RULESET_PLAY_CARD_TIME, STR_RULESET_JUDGE_VOTE_TIME), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    
    # Control hud text
    #hudHeader(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_CARD_CONTROLS_TITLE, HudPosition.RIGHT, WS_SET_CARDS + 6, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    #hudSubtext(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge else null, STR_CARD_CONTROLS, HudPosition.RIGHT, WS_SET_CARDS + 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubheader(localPlayer if (len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard) or ([player.cards for player in getJudgeCards] != [] and localPlayer == cardJudge and not entityExists(localPlayer.cardVoted)) else null, " \n{}{}  {}{}".format(iconString(Icon.ARROW_UP), buttonString(Button.PRIMARY_FIRE), iconString(Icon.ARROW_DOWN), buttonString(Button.SECONDARY_FIRE)), HudPosition.LEFT, WS_SET_CARDS + 7, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    hudSubtext(localPlayer if (len(localPlayer.cards) > 0 and localPlayer != cardJudge) or ([player.cards for player in getJudgeCards] != [] and localPlayer == cardJudge) else null, " \n", HudPosition.LEFT, WS_SET_CARDS + 8, SUB_COLOR, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Controls
    hudSubtext(localPlayer, STR_GAME_CONTROLS, HudPosition.LEFT, WS_SET_CARDS + 9, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Selection
    hudText(localPlayer if (len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard) or ([player.cards for player in getJudgeCards] != [] and localPlayer == cardJudge and not entityExists(localPlayer.cardVoted)) else null, STR_SELECT_CARD_ICON, STR_SELECT_CARD if USE_SMALL_UI_TEXT_FONT else "", STR_SELECT_CARD if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 9,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Play Card
    hudText(localPlayer if (len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard) or ([player.cards for player in getJudgeCards] != [] and localPlayer == cardJudge and not entityExists(localPlayer.cardVoted)) else null, STR_PLAY_CARD_CONTROL_ICON, STR_PLAY_CARD_CONTROL if  USE_SMALL_UI_TEXT_FONT else "", STR_PLAY_CARD_CONTROL if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 11,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Voting Skip
    hudText(localPlayer if (localPlayer != cardJudge and not localPlayer.wantsToSkipVoting and ((currentGameState == gameState.ROUND and localPlayer.playedCard) or currentGameState == gameState.VOTING) and WS_SET_ENABLE_VOTING_SKIP) else null, STR_VOTE_SKIP_CONTROL_ICON, STR_VOTE_SKIP_CONTROL if  USE_SMALL_UI_TEXT_FONT else "", STR_VOTE_SKIP_CONTROL if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 11,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Redraw Card
    hudText(localPlayer if len(localPlayer.cards) > 0 and localPlayer != cardJudge and not localPlayer.playedCard else null, STR_FORFEIT_CARD_CONTROL_ICON, STR_FORFEIT_CARD_CONTROL if USE_SMALL_UI_TEXT_FONT else "", STR_FORFEIT_CARD_CONTROL if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 12,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Toggle Chat
    hudText(localPlayer, STR_TOGGLE_CHAT_ICON, STR_TOGGLE_CHAT if USE_SMALL_UI_TEXT_FONT else null, STR_TOGGLE_CHAT if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 13,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Camera Mode
    hudText(localPlayer, STR_CAMERA_MODE_ICON, STR_CAMERA_MODE if USE_SMALL_UI_TEXT_FONT else "", STR_CAMERA_MODE if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 14,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

    # Hero Switching
    hudText(localPlayer, STR_SWITCH_HERO_ICON, STR_SWITCH_HERO if USE_SMALL_UI_TEXT_FONT else "", STR_SWITCH_HERO if not USE_SMALL_UI_TEXT_FONT else "", HudPosition.LEFT, WS_SET_CARDS + 15,SUB_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)

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

    hudText(localPlayer if localPlayer == cardJudge and currentGameState == gameState.VOTING else null, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard], "", STR_JUDGE_VOTE_INSTRUCTION,HudPosition.TOP, 5, VOTE_COLOR, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    # The effect that will be shown on the player the judge is currently selecting
    createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, Effect.LIGHT_SHAFT, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge].getPosition(), 0.5, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The effect that will be shown on the player the judge is currently selecting
    if not WS_SET_GRAPHICS_REDUCE_EFFECTS:
        createEffect(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, Effect.GOOD_AURA, VOTE_COLOR if entityExists(cardJudge.cardVoted) else SUB_COLOR, getJudgeCards[cardJudge.selectedCardJudge], 1, EffectReeval.VISIBILITY_POSITION_RADIUS_AND_COLOR)

    # The text that will be shown on the player the judge is currently selecting
    createInWorldText(localPlayer if (localPlayer == cardJudge and entityExists(localPlayer.cardVoted)) or (localPlayer != cardJudge and (currentGameState == gameState.END)) else null, "{}".format(STR_WINNING_PLAYER), getJudgeCards[cardJudge.selectedCardJudge], 1.5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, VOTE_COLOR, SpecVisibility.DEFAULT)

    # Judge title
    createInWorldText(localPlayer if entityExists(cardJudge) else null, STR_CARD_JUDGE, cardJudge, 1.5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, SUB_COLOR, SpecVisibility.DEFAULT)

    # Judge light shaft
    createEffect(localPlayer if entityExists(cardJudge) else null, Effect.LIGHT_SHAFT, SUB_COLOR, getSpot(cardJudge), 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

    # Background for Judge Card
    if not WS_SET_GRAPHICS_REDUCE_EFFECTS:
        createEffect(getAllPlayers().exclude(cardJudge) if currentGameState == gameState.VOTING else null, Effect.BAD_AURA, Color.BLACK, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1.5), 3, EffectReeval.VISIBILITY)
        createEffect(getAllPlayers().exclude(cardJudge) if currentGameState == gameState.VOTING else null, Effect.BAD_AURA, Color.BLACK, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1.5), 3, EffectReeval.VISIBILITY)
        createEffect(getAllPlayers().exclude(cardJudge) if currentGameState == gameState.VOTING else null, Effect.BAD_AURA, Color.BLACK, MAP_CENTER[mapData.POSITION] + (Vector.UP * 1.5), 3, EffectReeval.VISIBILITY)


    # Box for Judge Card
    if not WS_SET_GRAPHICS_REDUCE_EFFECTS:
        createInWorldText(getAllPlayers().exclude(cardJudge) if currentGameState == gameState.VOTING else null, STR_BOX.replace("<space>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n".substring(0, ceil(strLen(STR_CURRENT_JUDGE_CARD) / 22) + 1)), MAP_CENTER[mapData.POSITION] + (Vector.UP * 0.6), 1, Clip.NONE, WorldTextReeval.VISIBILITY_AND_STRING, VOTE_COLOR, SpecVisibility.DEFAULT)

    # Name of Player
    createInWorldText(localPlayer if (localPlayer != cardJudge and localPlayer.cameraMode <= 1 and localPlayer.getPlayerClosestToReticle(Team.ALL) != cardJudge and localPlayer.getPlayerClosestToReticle(Team.ALL) != cardJudge.cardVoted and (currentGameState != gameState.VOTING)) else null, "{}".format(localPlayer.getPlayerClosestToReticle(Team.ALL), localPlayer.getPlayerClosestToReticle(Team.ALL)), localPlayer.getPlayerClosestToReticle(Team.ALL), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, VOTE_COLOR, SpecVisibility.DEFAULT)

    # Render Cards
    renderCards()

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
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setDamageDealt(0)
    eventPlayer.setDamageReceived(0)
    eventPlayer.disableHeroHUD()
    eventPlayer.disableTextChat()
    eventPlayer.disableGamemodeHud()
    eventPlayer.disableEnvironmentCollision(false)
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 9999)
    eventPlayer.hasSpawnedOnce = true

    getAllPlayers().disableNameplatesFor(eventPlayer)
    getAllPlayers().exclude(cardJudge).startForcingOutlineFor(eventPlayer, false, Color.WHITE, OutlineVisibility.DEFAULT)

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
    @Condition eventPlayer.hasSpawned()
    
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
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    while eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
        changeCard(-1)
        wait(0.125, Wait.ABORT_WHEN_FALSE)

rule "Change Card (Right)":
    @Event eachPlayer
    @Condition cardJudge != eventPlayer
    @Condition eventPlayer.playedCard == false
    @Condition currentGameState == gameState.ROUND
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    changeCard(1)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    while eventPlayer.isHoldingButton(Button.SECONDARY_FIRE):
        changeCard(1)
        wait(0.125, Wait.ABORT_WHEN_FALSE)

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

    fixedSmallMessage(eventPlayer, STR_TURN_FORFEITED)

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

rule "Player Joined Late":
    @Event playerJoined
    
    waitUntil(eventPlayer.hasSpawned(), 9999)
    if currentGameState == gameState.ROUND:
        async(getCards, AsyncBehavior.NOOP)
    elif currentGameState == gameState.VOTING:
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

    eventPlayer.startForcingOutlineFor(getAllPlayers(), false, Color.WHITE, OutlineVisibility.DEFAULT)

rule "Change Judge Card (Left)":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    changeJudgeCard(-1)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    while eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
        changeJudgeCard(-1)
        wait(0.125, Wait.ABORT_WHEN_FALSE)

rule "Change Judge Card (Right)":
    @Event eachPlayer
    @Condition cardJudge == eventPlayer
    @Condition not entityExists(eventPlayer.cardVoted)
    @Condition currentGameState == gameState.VOTING
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    changeJudgeCard(1)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    while eventPlayer.isHoldingButton(Button.SECONDARY_FIRE):
        changeJudgeCard(1)
        wait(0.125, Wait.ABORT_WHEN_FALSE)

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
    wait(Math.INFINITY)
    

rule "Switch Camera Mode":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1)
    
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
            eventPlayer.startCamera(updateEveryTick(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(vect(1 * -1, 0, 0), eventPlayer, Transform.ROTATION) + eventPlayer.getFacingDirection() * -2.5, getAllPlayers(), eventPlayer, false).getHitPosition()), updateEveryTick(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 200), 60)
            break
        case 2:
            # Global Camera (No Raycast)
            eventPlayer.startCamera(MAP_CENTER + angleToDirection(getTotalTimeElapsed() * 5, -15) * (10), MAP_CENTER, 50)
            break
        case 3:
            # Global Camera (Raycast)
            eventPlayer.startCamera(raycast(MAP_CENTER, MAP_CENTER + angleToDirection(getTotalTimeElapsed() * 5, -15) * (10), null, null, false).getHitPosition(), MAP_CENTER, 50)
            break

rule "Switch Heroes":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD)

    fixedSmallMessage(eventPlayer, STR_SWITCHING_HEROES)
    waitUntil(not eventPlayer.isHoldingButton(Button.RELOAD), 1)
    if not eventPlayer.isHoldingButton(Button.RELOAD):
        fixedSmallMessage(eventPlayer, STR_SWITCHING_HEROES_CANCELLED)
        return

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    wait(0.25)
    eventPlayer.resetHeroAvailability()
    waitUntil(eventPlayer.hasSpawned(), 9999)
    wait(0.08)
    eventPlayer.setFacing(directionTowards(eventPlayer.getEyePosition(), MAP_CENTER), Relativity.TO_WORLD)

rule "End Voting Phase Faster":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    if not WS_SET_ENABLE_VOTING_SKIP:
        return

    eventPlayer.wantsToSkipVotingDuring = currentGameState

    if currentGameState == gameState.ROUND:
        waitUntil(eventPlayer.playedCard or currentGameState != eventPlayer.wantsToSkipVotingDuring, roundTime)
        wait(0.5)
        waitUntil(eventPlayer.isHoldingButton(Button.INTERACT) or currentGameState != eventPlayer.wantsToSkipVotingDuring, roundTime)

    wait(0.064)

    if eventPlayer == cardJudge:
        return
    if eventPlayer.wantsToSkipVoting:
        return 
    if not currentGameState == gameState.ROUND and not currentGameState == gameState.VOTING:
        return
    if currentGameState != eventPlayer.wantsToSkipVotingDuring:
        return

    playEffect(eventPlayer, DynamicEffect.BAD_PICKUP_EFFECT, VOTE_COLOR, getSpot(eventPlayer), 5)
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, PRIMARY_COLOR, getSpot(eventPlayer), 100)

    fixedSmallMessage(getAllPlayers(), STR_HURRY_UP)

    eventPlayer.wantsToSkipVoting = true

rule "Winston: Disable Secondary":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.isFiringSecondaryFire()

    eventPlayer.cancelPrimaryAction()
    wait(0.016)
    if RULE_CONDITION: goto RULE_START