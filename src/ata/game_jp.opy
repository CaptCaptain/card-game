settings {
    "main": {
        "modeName": "<FGFF8FB1FF>言葉遊び アップルトゥアップル",
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
                "havana", "petra", "workshopIsland", "workshopChamber", 'malevento', 'paris', 'dorado', 'hollywood', 'oasisGardens', 'oasisUniversity', 'templeOfAnubis', 'kingsRow', 'necropolis', 'castillo', 'chateauGuillard', 'lijiangNightMarket', 'horizonLunarColony'
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

#!define sentenceSelection ['{} + {}'.format(random.choice(sentences.exclude(cardSentence)), random.choice(sentences.exclude(cardSentence)))] if WS_SET_RULES == gameStyle.TWOONE else cards.exclude(cardSentence) if WS_SET_RULES == gameStyle.TURNOVER else sentences.exclude(cardSentence)

#!define cardSelection sentences if WS_SET_RULES == gameStyle.TURNOVER else cards

#!define GetStrings(data) __script__('../../../overpy-modules/src/translation.js')
GetStrings({
    availableLanguages: ["ja-JP"],
    practiceRangeTranslations: ["Practice Range"],
    disableDynamicTranslation: true,
    strings: {
        GAME_NAME: {
            "ja-JP": "Apples to Apples by CaptCaptain#11421"
        },
        WEBLINK: {
            "ja-JP": "原語版: https://workshop.codes/apples-to-apples"
        },
        VERSION: {
            "ja-JP": "基礎原語版バージョン: 2.7.0"
        },
        PLAY_CARDS: {
            "ja-JP": "Play your cards"
        },
        VOTING: {
            "ja-JP": "The Judge is Voting"
        },
        TITLE_MESSAGE: {
            "ja-JP": "Apples to Apples"
        },
        WAITING_FOR_PLAYERS: {
            "ja-JP": "他のプレイヤーを待機中"
        },
        CARD_JUDGE: {
            "ja-JP": "親役"
        },
        IS_JUDGE: {
            "ja-JP": "{0} あなたは親役です {0}",
            format: 'abilityIconString(cardJudge.getCurrentHero(), Button.ULTIMATE)'
        },
        NO_CARDS: {
            "ja-JP": "カードを使った人がいませんでした。"
        },
        WAIT_FOR_CARDS: {
            "ja-JP": "子役がカードを使い終わるのを待機中"
        },
        WAIT_FOR_JUDGE: {
            "ja-JP": "親の選出を待機中"
        },
        RULESET_GAME_STYLE:{
            "ja-JP": "ゲームのルールセット: {}",
            format: "[STR_GAME_STYLE_DEFAULT, STR_GAME_STYLE_CRAB, STR_GAME_STYLE_TURNOVER, STR_GAME_STYLE_TWOONE][WS_SET_RULES_RAW]"
        },
        GAME_STYLE_DEFAULT:{
            "ja-JP": "Default"
        },
        GAME_STYLE_CRAB:{
            "ja-JP": "Crab Apples"
        },
        GAME_STYLE_TURNOVER:{
            "ja-JP": "Apple Turnover"
        },
        GAME_STYLE_TWOONE:{
            "ja-JP": "2 for 1 Apples"
        },
        CARD_INSTRUCTION: {
            "ja-JP": "{}",
            format: "[STR_CARD_INSTRUCTION_DEFAULT, STR_CARD_INSTRUCTION_CRAB, STR_CARD_INSTRUCTION_TURNOVER, STR_CARD_INSTRUCTION_TWOONE][WS_SET_RULES_RAW]"
        },
        CARD_INSTRUCTION_DEFAULT: {
            "ja-JP": "上の句に一番合うと思う下の句を選ぼう"
        },
        CARD_INSTRUCTION_CRAB: {
            "ja-JP": "Select the Card that least fits"
        },
        CARD_INSTRUCTION_TURNOVER: {
            "ja-JP": "Select the Card that best describes"
        },
        CARD_INSTRUCTION_TWOONE: {
            "ja-JP": "Select the Card that best fits"
        },
        JUDGE_VOTE_INSTRUCTION: {
            "ja-JP": "{}/{}",
            format: "cardJudge.selectedCardJudge + 1, len(getJudgeCards)"
        },
        YOUR_CARDS: {
            "ja-JP": "あなたの手札:"
        },
        YOUR_CARDS_JUDGE:{
            "en-US": "皆の手札:"
        },
        PLAYER_WON: {
            "ja-JP": " のカード"
        },
        SELECTED_CARD: {
            "ja-JP": "選択したカード"
        },
        SELECTED_CARD_CONTROLS: {
            "ja-JP": "{}{} カードを交換する {}{}",
            format: "iconString(Icon.ARROW_LEFT), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), iconString(Icon.ARROW_RIGHT)"
        },
        GAME_CONTROLS: {
            "ja-JP": "{0} キーボードショートカット {0}",
            format: "iconString(Icon.ARROW_DOWN)"
        },
        PLAY_CARD_CONTROL_ICON: {
            "ja-JP": "{} [{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_1), buttonString(Button.INTERACT)"
        },
        PLAY_CARD_CONTROL: {
            "ja-JP": "カードを選ぶ"
        },
        FORFEIT_CARD_CONTROL_ICON: {
            "ja-JP": "{} [{}]",
            format: "abilityIconString(Hero.TRACER, Button.ABILITY_2), buttonString(Button.ULTIMATE)"
        },
        FORFEIT_CARD_CONTROL: {
            "ja-JP": "カードを入れ替える\n(このターンはカードを出せない)"
        },
        TOGGLE_CHAT_ICON: {
            "ja-JP": "{} [{}]",
            format: "iconString(Icon.CHECKMARK) if localPlayer.chatEnabled else iconString(Icon.NO), buttonString(Button.ABILITY_2)"
        },
        TOGGLE_CHAT: {
            "ja-JP": "チャットを切り替える ({})",
            format: "localPlayer.chatEnabled"
        },
        CHAT_VISIBLE: {
            "ja-JP": "{} チャット表示中",
            format: "iconString(Icon.CHECKMARK)"
        },
        CHAT_HIDDEN: {
            "ja-JP": "{} チャットを非表示",
            format: "iconString(Icon.NO)"
        },
        CAMERA_MODE: {
            "ja-JP": "カメラ ビューの切り替える ({})",
            format: "localPlayer.cameraMode"
        },
        CAMERA_MODE_ICON: {
            "ja-JP": "{} [{}]",
            format: "iconString(Icon.NO) if localPlayer.cameraMode == 0 else iconString(Icon.CHECKMARK), buttonString(Button.ABILITY_1)"
        },
        SELECT_CARD_ICON: {
            "ja-JP": "{} / {}",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        SELECT_CARD: {
            "ja-JP": "カードを交換する",
        },
        SWITCHED_CAMERA_MODE:{
            "ja-JP": "現在のカメラ ビュー: [{}]",
            format: "localPlayer.cameraMode"
        },
        SWITCH_HERO: {
            "ja-JP": "長押し [{}] ヒーローの切り替える",
            format: "buttonString(Button.RELOAD)"
        },
        SWITCH_HERO_ICON: {
            "ja-JP": "{} [{}]",
            format: "heroIcon(localPlayer.getCurrentHero()), buttonString(Button.RELOAD)"
        },
        SWITCHING_HEROES:{
            "ja-JP": "ヒーロー選択を開始しています..."
        },
        SWITCHING_HEROES_CANCELLED:{
            "ja-JP": "ヒーロー選択のキャンセル"
        },
        CARD_CONTROLS_TITLE: {
            "ja-JP": "{} キーボードショートカット:",
            format: "iconString(Icon.EXCLAMATION_MARK)"
        },
        CARD_CONTROLS: {
            "ja-JP": "{} — Play Selected Card\n{} — Get New Cards (Forfeit your turn)\n{} (Up) / {} (Down) — Select Card\n{} — Toggle Chat ({})",
            format: "buttonString(Button.INTERACT), buttonString(Button.ULTIMATE), buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.ABILITY_2), localPlayer.chatEnabled"
        },
        CARD_SELECTION_TUTORIAL_1:{
            "ja-JP": "{} または {} を押して句を入れ替えます",
            format: "buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE)"
        },
        CARD_SELECTION_TUTORIAL_2:{
            "ja-JP": "{} を押して句を選択します",
            format: "buttonString(Button.INTERACT)"
        },
        JUDGE_VOTED:{
            "ja-JP": "親役は {}{} を選びました",
            format: 'heroIcon(cardJudge.cardVoted.getCurrentHero()), cardJudge.cardVoted'
        },
        CURRENT_JUDGE_CARD:{
            "ja-JP": "{} 親役は 「{}」 を選択",
            format: 'heroIcon(cardJudge.getCurrentHero()), getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard]'
        },
        WINNING_PLAYER:{
            "ja-JP": "カードの所有者",
        },
        CARD_FORMAT:{
            "ja-JP": "{}{}",
            format: "cardSentence, getJudgeCards[cardJudge.selectedCardJudge].cards[getJudgeCards[cardJudge.selectedCardJudge].selectedCard]"
        }, 
        PLAY_CARD:{
            "ja-JP": '{} 選択した「{}」',
            format: 'iconString(Icon.CHECKMARK), eventPlayer.cards[eventPlayer.selectedCard]'
        },
        LOBBY_RULESET:{
            "ja-JP": "{0} ロビー設定:",
            format: 'abilityIconString(Hero.TORBJORN, Button.ABILITY_2)'
        },
        RULESET_SCORE_TO_WIN:{
            "ja-JP": "勝つためのスコア: {}",
            format: 'WS_SET_SCORE_NEEDED'
        },
        RULESET_PLAY_CARD_TIME:{
            "ja-JP": "カードを選ぶ時間: {}",
            format: 'WS_SET_PICK_TIME'
        },
        RULESET_JUDGE_VOTE_TIME:{
            "ja-JP": "親役の投票時間: {}",
            format: 'WS_SET_VOTING_TIME'
        },
        WYW_NOT_ENOUGH_PLAYERS:{
            "en-US": "{} 他のプレイヤーを待機中",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        WYW_ENOUGH_PLAYERS:{
            "en-US": "{} ゲーム開始",
            format: 'iconString(Icon.EXCLAMATION_MARK)'
        },
        TURN_FORFEITED:{
            "en-US": "{} 次のターンに新しいカード",
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
    #果物
    cards.append(["リンゴ", "梨", "バナナ", "メロン", "柿", "みかん", "スイカ", "ドリアン", "苺", "ぶどう"])
    #書物
    cards.append(["地図", "折り込みチラシ", "日記帳", "メモ", "寄せ書き", "新聞", "カタログ", "卒業証書", "ティッシュペーパー", "キッチンペーパー"])
    #文房具
    cards.append(["鉛筆", "消しゴム", "ものさし", "分度器", "三角定規", "ボールペン", "シャープペンシル", "筆"])
    #職業
    cards.append(["農家", "アナウンサー", "料理人", "建築士", "エンジニア", "コンビニ店員", "社長", "秘書", "漫画家", "教師", "会社員", "発明家", "僧侶", "実業家", "音楽家"])
    #自然の場所
    cards.append(["山", "森", "川", "砂漠", "草原", "荒野", "浜", "海", "谷", "崖", "島"])
    #場所・施設
    cards.append(["病院", "学校", "オフィス", "住宅", "公園", "道路", "遊園地", "ホテル", "ステージ", "競技場", "墓地"])
    #哺乳類
    cards.append(["犬", "猫", "人", "猿", "牛", "馬", "ライオン", "象", "イルカ", "パンダ", "熊"])
    #感情
    cards.append(["喜び", "悲しみ", "怒り", "尊敬", "侮蔑", "嫌悪", "好感", "苦しみ", "驚き", "期待", "達成感", "幸せ"])
    #生活
    cards.append(["睡眠", "起床", "入浴", "食事", "会話", "遊び", "労働", "洗濯", "調理", "散歩", "掃除"])
    #陸の乗り物
    cards.append(["自動車", "自転車", "電車", "新幹線", "トロッコ", "バイク", "ロープウェイ", "バス"])
    #顔のパーツ
    cards.append(["顔", "頭", "髪", "目", "鼻", "口", "耳", "ほっぺた", "歯", "舌", "あご", "のど"])
    #スポーツ
    cards.append(["野球", "サッカー", "テニス", "水泳", "陸上", "剣道", "バスケットボール", "卓球", "弓道", "柔道", "バレーボール"])
    #親族
    cards.append(["兄", "姉", "弟", "妹", "父", "母", "祖父", "祖母", "孫"])
    #精神
    cards.append(["心", "魂", "思考", "気持ち"])
    #部屋の設備
    cards.append(["部屋", "押し入れ", "トイレ", "リビング", "台所", "玄関", "壁", "柱", "床", "屋根", "天井"])
    #時間帯
    cards.append(["朝", "昼", "夕方", "夜"])
    #アクセサリー
    cards.append(["帽子", "指輪", "ネックレス", "入れ墨"])
    #首から下のパーツ
    cards.append(["肩", "腕", "手", "指", "爪", "胸", "へそ", "背中", "腹", "尻", "脚", "足"])
    #国
    cards.append(["アメリカ", "日本", "中国", "スペイン", "ブラジル", "パリ", "韓国"])
    #量・規模
    sentences.append(["大きい", "小さい", "広い", "狭い", "長い", "短い", "数多くの", "数少ない", "たくさんの", "わずかな", "満ち足りた", "不足した"])
    sentences.append(["甘い", "しょっぱい", "からい", "苦い", "酸っぱい", "コクのある", "旨みのある", "薄味の", "濃厚な"])
    #幅、勾配、形状
    sentences.append(["ぶ厚い", "薄っぺらい", "急な", "ゆるやかな", "とがった", "丸い", "角ばった", "流線型の", "ゆがんだ", "扇形の", "星形の", "開いた", "閉じた"])
    #手触り
    sentences.append(["すべすべした", "ざらざらした", "やわらかい", "弾力のある", "かたい", "ふわふわした", "もちもちした", "低反発の"])
    #温度
    sentences.append(["冷たい", "熱い"])
    #性格
    sentences.append(["優しい", "厳しい", "陽気な", "憂鬱な", "怒りっぽい", "涙もろい", "寛大な", "狭量な", "図々しい", "慎み深い", "粘り強い", "勇敢な", "臆病な", "穏やかな", "激しい", "気まぐれな", "恥ずかしい", "誇らしい"])
    #気候
    sentences.append(["寒い", "暑い", "不毛の", "肥沃な", "湿った", "乾燥した"])
    #色
    sentences.append(["赤い", "紫色の", "青い", "水色の", "緑の", "黄色い", "茶色い", "橙色の", "白い", "灰色の", "黒い"])
    #分布・配置
    sentences.append(["密集した", "まばらな", "乱雑な", "整列した"])
    #分離、欠損
    sentences.append(["欠けた", "砕けた", "割れた", "分かれた"])
    #健康状態
    sentences.append(["健康な", "元気な", "病気の", "元気のない"])
    #見た目
    sentences.append(["輝く", "艶のある", "くすんだ", "暗い", "明るい", "鮮やかな", "色とりどりの", "モノクロの"])
    #年齢年少の
    sentences.append(["生まれたての", "幼い", "年少の", "思春期の", "若い", "ピチピチの", "大人びた", "中年の", "老いた", "よぼよぼの"])
    #価値
    sentences.append(["高級な", "豪華な", "安価な", "しょぼい"])
    #物理
    sentences.append(["重い", "軽い", "放射性の", "電気を帯びた", "磁気を帯びた", "速い", "遅い"])
    #認知度
    sentences.append(["有名な", "無名の", "忘れ去られた", "未知の", "既知の", "明らかな", "謎めいた"])
    #手触り
    sentences.append(["すべすべした", "ざらざらした", "やわらかい", "弾力のある", "かたい", "ふわふわした", "もちもちした", "低反発の"])
    #新しさ
    sentences.append(["古代の", "現代的な", "懐かしい", "未来の", "前時代の", "新しい", "古い"])
    cards = [random.choice(card) for card in cards]
    sentences = [random.choice(sentences) for sentence in sentences]
    cardsLoaded = true