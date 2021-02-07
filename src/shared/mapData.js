let availableMapData = {
    PETRA: {
        CENTER: '[vect(1.964, -10, 8.875), 7]'
    },
    HAVANA: {
        CENTER: '[vect(135.35, 6, -46.49), 7]'
    },
    WORKSHOP_ISLAND: {
        CENTER: '[vect(0, 0, 0), 7]'
    },
    ILIOS_RUINS: {
        CENTER: '[vect(28.414, 57.353, -157.183), 6]'
    },
    VOLSKAYA: {
        CENTER: '[vect(-13.680, -3.713, 90.259), 7]'
    },
    BLIZZ_WORLD: {
        CENTER: '[vect(-122.206, -0.156, 110.472), 7]'
    },
    DORADO: {
        CENTER: '[vect(131.219, 11.030, 26.117), 7]'
    },
    LIJIANG_NIGHT_MARKET: {
        CENTER: '[vect(1.193, -0.996, -60.635), 7]'
    },
    NEPAL_VILLAGE: {
        CENTER: '[vect(-195.075, -93.874, -0.174), 6]'
    },
    BLACK_FOREST: {
        CENTER: '[vect(-20.055, 12.057, 4.054), 6]'
    },
    PARIS: {
        CENTER: '[vect(-95.152, 12, -82.360), 7]'
    },
    OASIS_UNIVERSITY: {
        CENTER: '[vect(-188.021, 14.912, -0.099), 7]'
    },
    CHATEAU_GUILLARD: {
        CENTER: '[vect(206.236, 7.993, 56.962), 7]'
    },
    HANAMURA: {
        CENTER: '[vect(-11.438, -0.861, -85.328), 7]'
    },
    HOLLYWOOD: {
        CENTER: '[vect(-12.459, -0.108, 56.391), 7]'
    },
    EICHENWALDE: {
        CENTER: '[vect(119.594, 8.726, -43.914), 6]'
    },
    KINGS_ROW: {
        CENTER: '[vect(-149.030, -2.932, 24.228), 6]'
    }
}

// Some maps share the same map data
availableMapData.WORKSHOP_ISLAND_NIGHT = availableMapData.WORKSHOP_ISLAND
availableMapData.BLIZZ_WORLD_WINTER = availableMapData.BLIZZ_WORLD
availableMapData.BLACK_FOREST_WINTER = availableMapData.BLACK_FOREST
availableMapData.LIJIANG_NIGHT_MARKET_LNY = availableMapData.LIJIANG_NIGHT_MARKET
availableMapData.HANAMURA_WINTER = availableMapData.HANAMURA
availableMapData.HOLLYWOOD_HALLOWEEN = availableMapData.HOLLYWOOD
availableMapData.CHATEAU_GUILLARD_HALLOWEEN = availableMapData.CHATEAU_GUILLARD
availableMapData.EICHENWALDE_HALLOWEEN = availableMapData.EICHENWALDE
availableMapData.KINGS_ROW_WINTER = availableMapData.KINGS_ROW

let maps = ''
let center = ''

result = ''

for (var mapData in availableMapData) {
    maps += 'Map.'+mapData+', '
    for (var data in mapData) {
        if (data == 0) {
            center += availableMapData[mapData].CENTER+', '
        }
    }
}

result += 'globalvar CENTER = '+'['+center+']'+'[['+maps+'].index(getCurrentMap())]\n'