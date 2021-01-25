let availableMapData = {
    PETRA: {
        CENTER: '[vect(1.964, -10, 8.875), 7]'
    }
}

let maps = ''
let center = ''

result = ''

for (var mapData in availableMapData) {
    maps += 'Map.'+mapData+', '
    for (var data in mapData) {
        center += availableMapData[mapData].CENTER+', '
    }
}

result += 'globalvar CENTER = '+'['+center+']'+'[['+maps+'].index(getCurrentMap())]\n'