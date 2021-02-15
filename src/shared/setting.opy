globalvar WS_SET_SCORE_NEEDED = createWorkshopSetting(int[3:10], "Ruleset", "Score to Win", 5, 1)
globalvar WS_SET_PICK_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Pick Card Time", 20, 2)
globalvar WS_SET_VOTING_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Judge Voting Time", 40, 3)
globalvar WS_SET_CARDS = createWorkshopSetting(int[3:8], "Ruleset", "Max Cards Per Player", 8, 4)
globalvar WS_SET_ENABLE_BOTS = createWorkshopSetting(bool, "Ruleset", "Enable Bots", false, 5)
globalvar WS_SET_SKIP = createWorkshopSetting(bool, "Ruleset", "Skip Assembling Heroes", true, 5)
globalvar WS_SET_END_RAW = createWorkshopSetting(enum["Skip End Game Screen", "Skip Play of the Game", "Do Nothing"], "Ruleset", "When Match is Complete", 1, 6)
globalvar WS_SET_END = [20.4, 2.5, 9999][WS_SET_END_RAW]