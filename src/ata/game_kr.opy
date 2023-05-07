settings {
    "main": {
        "modeName": "<FGFF8FB1FF> 단어 놀이 애플 투 애플",
        "description": '上の句・下の句としての言葉は一から収録しなおしています。\n言葉はどんどん追加する予定です。\n[日本語版作成:nakamoooooo, CaptCaptain]\n[元ネタのゲーム:Apples to Apples card game by Mattel Games]\n[原語版作成: CaptCaptain#11421]'
    },
    "lobby": {
        "mapRotation": "afterGame",
        "enableMatchVoiceChat": true,
        "ffaSlots": 12,
        "spectatorSlots": 12,
        "returnToLobby": "never",
        "allowPlayersInQueue": true
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "havana", "petra", "workshopIsland", "workshopChamber", 'malevento', 'paris', 'dorado', 'hollywood', 'oasisGardens', 'oasisUniversity', 'templeOfAnubis', 'kingsRow', 'necropolis', 'castillo'
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "scoreToWin": 1,
            "spawnHealthPacks": "disabled",
            "enableHeroSwitching": false
        }
    },
    "heroes": {
        "allTeams": {
            "general": {
                "enableInfiniteAmmo": true,
                "enableUlt": false
            }
        }
    }
}

#!optimizeForSize

enum gameStyle:
    DEFAULT,
    CRAB,
    TURNOVER,
    TWOONE

globalvar WS_SET_RULES_RAW = createWorkshopSetting(enum["Default Apples", "Crab Apples", "Apple Turnover", "2 for 1 Apples"], "Ruleset", "Game Style", 0, 0)
globalvar WS_SET_RULES = [gameStyle.DEFAULT, gameStyle.CRAB, gameStyle.TURNOVER, gameStyle.TWOONE][WS_SET_RULES_RAW]

#!define sentenceSelection ['{} + {}'.format(random.choice(sentences.exclude(cardSentence)), random.choice(sentences.exclude(cardSentence)))] if WS_SET_RULES == gameStyle.TWOONE else cards.exclude(cardSentence) if WS_SET_RULES == gameStyle.TURNOVER else random.choice(sentences).exclude(cardSentence)

#!define cardSelection sentences if WS_SET_RULES == gameStyle.TURNOVER else random.choice(cards)

#!define GetStrings(data) __script__('../../../overpy-modules/src/translation.js')
GetStrings({
    availableLanguages: ["ja-JP"],
    practiceRangeTranslations: ["Practice Range"],
    disableDynamicTranslation: true,
    strings: {
        GAME_NAME : {
            "ko-KR": "Apples to Apples by CaptCaptain#11421"
        },
        WEBLINK: {
            "ko-KR": "원어 버전: https://workshop.codes/apples-to-apples"
        },
        VERSION: {
            "ko-KR": "기본 원어 버전: 2.7.0"
        },
        PLAY_CARDS: {
            "ko-KR": "Play your cards"
        },
        VOTING: {
            "ko-KR": "The Judge is Voting"
        },
        TITLE_MESSAGE : {
            "ko-KR": "Apples to Apples"
        },
        WAITING_FOR_PLAYERS : {
            "ko-KR": "다른 플레이어를 기다리는 중"
        },
        CARD_JUDGE: {
            "ko-KR": "부모"
        },
        IS_JUDGE: {
            "ko-KR": "{0} 당신은 부모님 {0}",
            format: 'abilityIconString(cardJudge.getCurrentHero(), Button.ULTIMATE)'
        },
        NO_CARDS: {
            "ko-KR": "카드를 사용한 사람이 없습니다."
        },
        WAIT_FOR_CARDS: {
            "ko-KR": "아이 역할이 카드 사용을 기다리는 중"
        },
        WAIT_FOR_JUDGE: {
            "ko-KR": "부모 선출을 기다리는 중"
        },
        RULESET_GAME_STYLE:{
            "ko-KR": "게임 규칙 집합: {}",
            format: "[STR_GAME_STYLE_DEFAULT, STR_GAME_STYLE_CRAB, STR_GAME_STYLE_TURNOVER, STR_GAME_STYLE_TWOONE][WS_SET_RULES_RAW]"
        },
        GAME_STYLE_DEFAULT: {
            "ko-KR": "Default"
        },
        GAME_STYLE_CRAB: {
            "ko-KR": "Crab Apples"
        },
        GAME_STYLE_TURNOVER:{
            "ko-KR": "Apple Turnover"
        },
        GAME_STYLE_TWOONE: {
            "ko-KR": "2 for 1 Apples"
        },
        CARD_INSTRUCTION: {
            "ko-KR": "{}",
            format: "[STR_CARD_INSTRUCTION_DEFAULT, STR_CARD_INSTRUCTION_CRAB, STR_CARD_INSTRUCTION_TURNOVER, STR_CARD_INSTRUCTION_TWOONE][WS_SET_RULES_RAW]"
        },
        CARD_INSTRUCTION_DEFAULT: {
            "ko-KR": "위의 구에 가장 잘 맞는 아래 구를 선택하자"
        },
        CARD_INSTRUCTION_CRAB: {
            "ko-KR": "Select the Card that least fits"
        },
        CARD_INSTRUCTION_TURNOVER: {
            "ko-KR": "Select the Card that best describes"
        },
        CARD_INSTRUCTION_TWOONE: {
            "ko-KR": "Select the Card that best fits"
        },
        JUDGE_VOTE_INSTRUCTION : {
            "ko-KR": "{}/{}",
            format: "cardJudge.selectedCardJudge + 1, len(getJudgeCards)"
        },
        YOUR_CARDS: {
            "ko-KR": "당신의 패:"
        },
        YOUR_CARDS_JUDGE:{
            "en-US": "모든 패:"
        },
        PLAYER_WON: {
            "ko-KR": " 카드"
        },
        SELECTED_CARD: {
            "ko-KR": "선택한 카드"
        },
        SELECTED_CARD_CONTROLS: {
            "ko-KR": "{}{} 카드 교체 {}{}",
            format: "iconString(Icon.ARROW_LEFT), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), iconString(Icon.ARROW_RIGHT)"
        },
        GAME_CONTROLS: {
            "ko-KR": "{0} 키보드 단축키 {0}",
            format: "iconString(Icon.ARROW_DOWN)"
        },
        PLAY_CARD_CONTROL_ICON: {
            "ko-KR": "{} [{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_1), buttonString(Button.INTERACT)"
        },
        PLAY_CARD_CONTROL: {
            "ko-KR": "카드 선택"
        },
        FORFEIT_CARD_CONTROL_ICON: {
            "ko-KR": "{} [{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_2), buttonString(Button.ULTIMATE)"
        },
        FORFEIT_CARD_CONTROL: {
            "ko-KR": "카드 교체\n(이 턴은 카드를 꺼낼 수 없음)"
        },
        TOGGLE_CHAT_ICON: {
            "ko-KR": "{} [{}]",
            format: "iconString(Icon.CHECKMARK) if localPlayer.chatEnabled else iconString(Icon.NO), buttonString(Button.ABILITY_2)"
        },
        TOGGLE_CHAT: {
            "ko-KR": "채팅 전환({})",
            format: "localPlayer.chatEnabled"
        },
        CHAT_VISIBLE: {
            "ko-KR": "{} 채팅 중",
            format: "iconString(Icon.CHECKMARK)"
        },
        CHAT_HIDDEN: {
            "ko-KR": "{} 채팅 숨기기",
            format: "iconString(Icon.NO)"
        },
        CAMERA_MODE: {
            "ko-KR": "카메라 보기 전환({})",
            format: "localPlayer.cameraMode"
        },
        CAMERA_MODE_ICON: {
            "ko-KR": "{} [{}]",
            format: "iconString(Icon.NO) if localPlayer.cameraMode == 0 else iconString(Icon.CHECKMARK), buttonString(Button.ABILITY_1)"
        },
        SELECT_CARD_ICON: {
            "ko-KR": "{} / {}",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        SELECT_CARD: {
            "ko-KR": "카드 교체",
        },
        SWITCHED_CAMERA_MODE:{
            "ko-KR": "현재 카메라 보기: [{}]",
            format: "localPlayer.cameraMode"
        },
        SWITCH_HERO: {
            "ko-KR": "길게 누르기 [{}] 영웅 전환",
            format: "buttonString(Button.RELOAD)"
        },
        SWITCH_HERO_ICON: {
            "ko-KR": "{} [{}]",
            format: "heroIcon(localPlayer.getCurrentHero()), buttonString(Button.RELOAD)"
        },
        SWITCHING_HEROES:{
            "ko-JP": "영웅 선택을 시작하는 중..."
        },
        SWITCHING_HEROES_CANCELLED:{
            "ko-KR": "영웅 선택 취소"
        },
        CARD_CONTROLS_TITLE: {
            "ko-KR": "{} 키보드 단축키:",
            format: "iconString(Icon.EXCLAMATION_MARK)"
        },
        CARD_CONTROLS: {
            "ko-KR": "{} — Play Selected Card\n{} — Get New Cards (Forfeit your turn)\n{} (Up) / {} (Down) — Select Card\n{} — Toggle Chat ( {})",
            format: "buttonString(Button.INTERACT), buttonString(Button.ULTIMATE), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.ABILITY_2), localPlayer.chatEnabled"
        },
        CARD_SELECTION_TUTORIAL_1: {
            "ko-KR": "{} 또는 {}을 눌러 절을 바꿉니다.",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        CARD_SELECTION_TUTORIAL_2:{
            "ko-KR": "{} 키를 눌러 절을 선택합니다",
            format: "buttonString(Button.INTERACT)"
        },
        JUDGE_VOTED:{
            "ko-KR": "부모님이 {}{}을(를) 선택했습니다.",
            format: 'heroIcon(cardJudge.cardVoted.getCurrentHero()), cardJudge.cardVoted'
        },
        CURRENT_JUDGE_CARD:{
            "ko-KR": "{} 부모님은 {} 선택",
            format: 'heroIcon(cardJudge.getCurrentHero()), getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard]'
        },
        WINNING_PLAYER:{
            "ko-KR": "카드 소유자",
        },
        CARD_FORMAT:{
            "ko-KR": "{}{}",
            format: "cardSentence, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard]"
        },
        PLAY_CARD:{
            "ko-KR": '{} 선택한 {}',
            format: 'iconString(Icon.CHECKMARK), eventPlayer.cards[eventPlayer.selectedCard]'
        },
        LOBBY_RULESET:{
            "ko-KR": "{0} 로비 설정:",
            format: 'abilityIconString(Hero.TORBJORN, Button.ABILITY_2)'
        },
        RULESET_SCORE_TO_WIN: {
            "ko-KR": "승리 점수: {}",
            format: 'WS_SET_SCORE_NEEDED'
        },
        RULESET_PLAY_CARD_TIME:{
            "ko-KR": "카드 선택 시간: {}",
            format: 'WS_SET_PICK_TIME'
        },
        RULESET_JUDGE_VOTE_TIME:{
            "ko-KR": "친척 투표 시간: {}",
            format: 'WS_SET_VOTING_TIME'
        },
        WYW_NOT_ENOUGH_PLAYERS:{
            "en-US": "{} 다른 플레이어를 기다리는 중",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        WYW_ENOUGH_PLAYERS:{
            "en-US": "{} 게임 시작",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        TURN_FORFEITED:{
            "en-US": "{} 다음 턴에 새 카드",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        }
    }
})

#!define PRIMARY_COLOR Color.WHITE
#!define SUB_COLOR Color.ROSE
#!define VOTE_COLOR Color.TURQUOISE
#!define USE_SMALL_CARD_FONT false
#!define USE_SMALL_UI_TEXT_FONT false

#!include "../shared/setting.opy"
#!include "../shared/game.opy"
#!include "../shared/player.opy"

rule "Set Card Pack":
    #과일
    cards.append(["사과", "배", "바나나", "멜론", "감", "귤", "수박", "두리안", "딸기", "포도"])
    #책
    cards.append(["지도", "접기 전단지", "일기장", "메모", "편지 쓰기", "신문", "카탈로그", "졸업장", "티슈 페이퍼", "주방 종이"]) 
    #문구
    cards.append(["연필", "지우개", "사물", "각도기", "삼각 눈금자", "볼펜", "샤프 연필", "붓"])
    #직업
    cards.append(["농가", "아나운서", "요리사", "건축사", "엔지니어", "편의점 점원", "사장", "비서", "만화가", "교사", " 회사원", "발명가", "승려", "실업가", "음악가"])
    #자연장소
    cards.append(["산", "숲", "강", "사막", "초원", "황야", "바닷가", "바다", "골짜기", "절벽", "섬"])
    #장소・시설
    cards.append(["병원", "학교", "사무실", "주택", "공원", "도로", "유원지", "호텔", "무대", "경기장", "묘지"])
    #포유류
    cards.append(["개", "고양이", "사람", "원숭이", "소", "말", "사자", "코끼리", "돌고래", "팬더", "곰"])
    #감정
    cards.append(["기쁨", "슬픔", "분노", "존경", "모멸", "혐오", "호감", "고통", "놀람", "기대", "성취감", "행복"])
    #생활
    cards.append(["수면", "기상", "목욕", "식사", "대화", "놀이", "노동", "세탁", "조리", "산책", "청소"])
    #육지
    cards.append(["자동차", "자전거", "기차", "신칸센", "토롯코", "자전거", "로프웨이", "버스"])
    #얼굴파트
    cards.append(["얼굴", "머리", "머리", "눈", "코", "입", "귀", "뺨", "치아", "혀", "턱", " 목구멍"])
    #스포츠
    cards.append(["야구", "축구", "테니스", "수영", "육상", "검도", "농구", "탁구", "궁도", "유도", "배구"])
    #친척
    cards.append(["형", "언니", "동생", "여동생", "아버지", "어머니", "할아버지", "할머니", "손"])
    #정신
    cards.append(["마음", "영혼", "사고", "기분"])
    #방설비
    cards.append(["방", "밀어넣기", "화장실", "거실", "부엌", "현관", "벽", "기둥", "바닥", "지붕", "천장"])
    #시간대
    cards.append(["아침", "낮", "저녁", "밤"])
    #액세서리
    cards.append(["모자", "반지", "목걸이", "문신"])
    #목에서아래
    cards.append(["어깨", "팔", "손", "손가락", "손톱", "가슴", "배꼽", "등", "배", "엉덩이", "다리", " 발"])
    #양·규모
    sentences.append(["큰", "작음", "넓음", "좁은", "긴", "짧음", "수많은", "많은", "많은", "작은", "충분함", "부족한"])
    sentences.append(["달콤한", "신맛", "농어", "쓰라린", "신맛", "맛있는", "맛있는", "얇은", "농후한"])
    #폭, 기울기, 모양
    sentences.append(["두꺼운", "얇은", "가파른", "부드러운", "뾰족한", "둥근", "굵은", "유선형", "왜곡", "부채꼴", "별 모양", "열린", "닫힌"])
    #감동
    sentences.append(["미끄러운", "시끄러운", "부드러운", "탄력있는", "카타이", "푹신푹신", "떡", "저반발"])
    #온도
    sentences.append(["차가운", "뜨거운"])
    #성격
    sentences.append(["부드러운", "가혹한", "쾌활한", "우울한", "분노한", "눈물 솟은", "관대한", "좁은", "엉성한", "조심스럽다", "끈기", "용감한", "겁쟁이", "부드러운", "격렬한", "신발한", "부끄러운", "자랑스럽다"])
    #기후
    sentences.append(["추운", "뜨거운", "불모", "비옥한", "젖은", "건조한"])
    #색상
    sentences.append(["빨간색", "보라색", "파란색", "파란색", "녹색", "노란색", "갈색", "주황색", "흰색", "회색", "검은"])
    #분포・배치
    sentences.append(["밀집한", "눈부신", "난잡한", "정렬된"])
    #분리
    sentences.append(["부족한", "부서진", "깨진", "분할된"])
    #건강상태
    sentences.append(["건강한", "건강한", "아픈", "건강한"])
    #외모
    sentences.append(["빛나는", "윤기있는", "흐린", "어두운", "밝은", "선명한", "다채로운", "흑백"])
    #연령
    sentences.append(["갓 태어난", "어린", "어린", "사춘기", "젊은", "삐삐삐", "성인", "중년", "늙은", "요보요보노"])
    #가치
    sentences.append(["고급", "럭셔리", "저렴", "쇼보이"])
    #물리
    sentences.append(["무거운", "가벼운", "방사성", "전기", "자기", "빠른", "느린"])
    #인지도
    sentences.append(["유명한", "무명의", "잊혀진", "알 수 없음", "알려진", "분명한", "수수께끼"])
    #감동
    sentences.append(["미끄러운", "시끄러운", "부드러운", "탄력있는", "카타이", "푹신푹신", "떡", "저반발"])
    #새로움
    sentences.append(["고대", "현대적인", "그리운", "미래의", "전시대의", "새로운", "오래된"])
    cardsLoaded = true