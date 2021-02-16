enum gameStyle:
    DEFAULT,
    CRAB,
    TURNOVER,
    TWOONE

globalvar WS_SET_RULES_RAW = createWorkshopSetting(enum["Default Apples", "Crab Apples", "Apple Turnover", "2 for 1 Apples"], "Ruleset", "Game Style", 0, 0)
globalvar WS_SET_RULES = [gameStyle.DEFAULT, gameStyle.CRAB, gameStyle.TURNOVER, gameStyle.TWOONE][WS_SET_RULES_RAW]
globalvar WS_SET_SCORE_NEEDED = createWorkshopSetting(int[3:10], "Ruleset", "Score to Win", 5, 1)
globalvar WS_SET_PICK_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Pick Card Time", 20, 2)
globalvar WS_SET_VOTING_TIME = createWorkshopSetting(int[15:120], "Ruleset", "Judge Voting Time", 40, 3)
globalvar WS_SET_CARDS = createWorkshopSetting(int[3:9], "Ruleset", "Max Cards Per Player", 9, 4)
globalvar WS_SET_ENABLE_BOTS = createWorkshopSetting(bool, "Ruleset", "Enable Bots", false, 5)
globalvar WS_SET_SKIP = createWorkshopSetting(bool, "Ruleset", "Skip Assembling Heroes", true, 5)
globalvar WS_SET_END = 2.5