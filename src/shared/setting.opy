globalvar WS_SET_SCORE_NEEDED = createWorkshopSetting(int[3:10], "Ruleset", "Score to Win", 4, 1)
globalvar WS_SET_PICK_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Pick Card Time", 30, 2)
globalvar WS_SET_VOTING_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Judge Voting Time", 45, 3)
globalvar WS_SET_CARDS = createWorkshopSetting(int[3:13], "Ruleset", "Max Cards Per Player", 13, 4)
globalvar WS_SET_ENABLE_BOTS = createWorkshopSetting(enum["Off", "On", "While You Wait"], "Ruleset", "Enable Bots", 2, 5)
globalvar WS_SET_SKIP = createWorkshopSetting(bool, "Ruleset", "Skip Assembling Heroes", true, 5)
globalvar WS_SET_END = 2.5
globalvar WS_SET_ENABLE_KICK = createWorkshopSetting(bool, "Ruleset", "Enable Inactivity Kick", true, 6)
globalvar WS_SET_ENABLE_VOTING_SKIP = createWorkshopSetting(bool, "Ruleset", "Enable Reduced Timer Vote", true, 7)

globalvar WS_SET_GRAPHICS_SMALL_UI_FONT = createWorkshopSetting(bool, "Graphics", "Use Small UI Text", true, 8)
globalvar WS_SET_GRAPHICS_SMALL_CARD_FONT = createWorkshopSetting(bool, "Graphics", "Use Small Card Text", true, 8)
globalvar WS_SET_GRAPHICS_REDUCE_EFFECTS = createWorkshopSetting(bool, "Graphics", "Reduce Effects", false, 9)