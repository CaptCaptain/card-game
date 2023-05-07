const sentences = data.sentences;
const cards = data.cards;

// shuffling
function shuffleArray(arr) {
	arr.sort(() => Math.random() - 0.5);
}

result = "";
result += "\n";

// Set Cards
let remaining = 0;
let subNumber = 0;
result += "subroutine setCardPack_" + subNumber + "\n";
result += "def setCardPack_" + subNumber + "():\n";
shuffleArray(cards);
for (var card of cards) {
	if (remaining >= 300) {
		remaining = 0;
		subNumber += 1;
		result += "subroutine setCardPack_" + subNumber + "\n";
		result += "def setCardPack_" + subNumber + "():\n";
	} else {
		remaining += 1;
	}
	result += "    cards.append(" + '"' + card + '"' + ")\n";
}

shuffleArray(sentences);
remaining = 0;
subNumber += 1;
result += "subroutine setCardPack_" + subNumber + "\n";
result += "def setCardPack_" + subNumber + "():\n";
for (var sentence of sentences) {
	if (remaining >= 300) {
		remaining = 0;
		subNumber += 1;
		result += "subroutine setCardPack_" + subNumber + "\n";
		result += "def setCardPack_" + subNumber + "():\n";
	} else {
		remaining += 1;
	}
	result += "    sentences.append(" + '"' + sentence + '"' + ")\n";
}

// Load cards
result += 'rule "Load Card Pack":\n';

for (let index = 0; index < subNumber; index++) {
	result += "    setCardPack_" + index + "()\n";
	result += "    waitUntil(getServerLoad() < 255, 9999)\n";
}
result +=
	'    cards.remove([card for card in cards if strContains(card, "**")])\n';
result +=
	'    sentences.remove([sentence for sentence in sentences if strContains(sentence, "**")])\n';
result += "    cardsLoaded = true\n";
result;
