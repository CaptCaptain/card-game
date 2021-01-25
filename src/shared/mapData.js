let availableMapData = {
    PETRA: {
        CENTER: '[vect(1.964, -10, 8.875), 7]'
    },
    HAVANA: {
        CENTER: '[vect(135.35, 6, -46.49), 7]'
    },
    WORKSHOP_ISLAND: {
        CENTER: '[vect(0, 0, 0), 7]'
    }
}

// Some maps share the same map data
availableMapData.WORKSHOP_ISLAND_NIGHT = availableMapData.WORKSHOP_ISLAND
availableMapData.WORKSHOP_CHAMBER = availableMapData.WORKSHOP_ISLAND
availableMapData.WORKSHOP_EXPANSE_NIGHT = availableMapData.WORKSHOP_ISLAND
availableMapData.WORKSHOP_GREEN_SCREEN = availableMapData.WORKSHOP_ISLAND

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