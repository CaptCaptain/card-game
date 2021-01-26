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
    }
}

// Some maps share the same map data
availableMapData.WORKSHOP_ISLAND_NIGHT = availableMapData.WORKSHOP_ISLAND
availableMapData.LIJIANG_NIGHT_MARKET_LNY = availableMapData.LIJIANG_NIGHT_MARKET

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