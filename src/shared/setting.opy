globalvar WS_SET_SCORE_NEEDED = createWorkshopSetting(int[3:50], "Ruleset", "Score to Win", 15, 1)
globalvar WS_SET_PICK_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Play Card Time", 30, 2)
globalvar WS_SET_VOTING_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Voting Time", 60, 2)
globalvar WS_SET_ENABLE_BOTS = createWorkshopSetting(bool, "Ruleset", "Enable Bots", false, 3)