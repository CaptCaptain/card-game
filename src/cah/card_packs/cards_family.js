const sentences = [
	`_? No.`,
	`Alright, which one of you little terds is responsible for _?!`,
	`At school, I'm just Mandy. But at summer camp, I'm \`_ Mandy.\``,
	`Attention students. This is Principal Butthead. Please remember that we do not alow _ in the hallway. Thank you.`,
	`Beep beep! _ coming through!`,
	`Before I attend your sleepover, I must inform you: toys vore me, and I don't care for sweets. I prefer _.`,
	`Bow before me, for I am the Queen of _!`,
	`Boys? No. _? Yes!`,
	`CHUNGO FEEL SICK. CHUNGO NO LIKE _ ANYMORE.`,
	`Class, pay close attention. I will now demonstrate the physics of _.`,
	`Come on, Danny. All the cool kids are doin' it. Wanna try _?`,
	`Come with me, and I will show you a world of _.`,
	`Coming soon! Batman vs. _.`,
	"Coming to theaters this holiday season, `Star Wars: The Rise of _.`",
	`Did you know that Benjamin Franklin invented _?`,
	`ENOUGH! I will not let _ tear this family apart!`,
	`Ew. Grandpa smells like _.`,
	`Foolish child! Did you think you could escape from _?`,
	`Guys, stop it! There's nothing funny about _.`,
	`Hey guys. I just want to tell all my followers who are struggling wit _: it DOES get better.`,
	"Hey, check out my band! We're called `Rage Against _.`",
	`Hey, kids. I'm Sensei Todd. Today, I'm gonna teach you how to defend yourself against _.`,
	`Huddle up, Wildcats! They may be bigger. They may be faster. But we've got a secret weapon: _.`,
	`I don't really know what my mom's job is, but I think it has something to do with _.`,
	"I have invented a new sport. I call it `_ ball.`",
	`I lost my arm in a _ accident.`,
	`Isn't this great, honey? Just you, me, the kids, and _.`,
	`It's BIG.\nIt's SCARY.\nIt's _!`,
	"James Bond will return in `No Time for _.`",
	`Joey, look out behind you! It's _!`,
	"Kids, Dad is trying something new this week. It's called `_`.",
	`Ladies and gentlemen, I have discovered something amazing. I have discovered _.`,
	`Madam President, we've run out of time. The only option is _.`,
	`Me and my friends don't play with dolls anymore. We're into _ now.`,
	`ME HUNGRY. ME WANT _.`,
	`Mom? You have to come pick me up! There's _ at this party.`,
	`Moms love _.`,
	`My dad and I enjoy _ together.`,
	"My favorite book is `The Amazing Adventures of _.`",
	`MY NAME IS CHUNGO. CHUNGO LOVE _.`,
	`My name is Peter Parker. I was bitten by a radioactive spider, and now I'm _.`,
	`Never fear, Captain _ is here!`,
	`New from Mattel! It's BUNGO: The Game of _.\``,
	`Next from J.K. Rowling: Harry Potter and the chamber of _.`,
	`Now in bookstores: Nancy Drew and the Mystery of _.`,
	`Oh Dark Lord, we show out devotion with a humble offering of _!`,
	`Oh, no thank you, Mrs. Lee. I've had plenty of _ for now.`,
	`One nation, under God, indivisible, with liberty and _ for all.`,
	`Outback Steakhouse: No rules. Just _.`,
	`Police! Arrest this man! He's _!`,
	`Run, run, as fast as you can. You can't catch me, I'm _!`,
	`Shut up, Becky! At least I'm not _.`,
	`Thanks for watching! IF you want to seee more vids of _, smash that subscribe.`,
	`The easiest way to tell me and my twin apart is that I have a freckle on my cheek and she's _.`,
	`The warm August air was filled with change. Things were different, for Emily was now _.`,
	`There's nothing better than a peanut butter and _ sandwich.`,
	"They call me `Mr. _.`",
	`This is gonna be the best sleepover ever. Once Mom and Dad go to bed, it's time for _!`,
	"Time to put on my favorite t-shirt, the one that says `I heart _.`",
	`Today we honor St. Mungo, the patron saint of _.`,
	`We're off to see the wizard, the wonderful wizard of _!`,
	`Well, look at what we have here! A big fancy man walkin' like he's _.`,
	`What killed Old Jim?`,
	`What's about to take this school to the next level?`,
	`When i pooped, what came out?`,
	`Where in the world is _?`,
	`Whoa there, partner! Looks like _ spooked my horse.`,
	`You don't love me, Sam. All you care about is _.`,
];

const cards = [
	`14 cheeseburgers, 6 large fries, and a medium Sprite.`,
	`A baby boomer.`,
	`A baby with a full mustache.`,
	`A beard longer than 12 inches.`,
	`A big sad dragon with no friends.`,
	`A big, and I mean BIG turle.`,
	`A bird pooping on the president's head.`,
	`A black hole.`,
	`A bunch of dead squirrels on a trampoline.`,
	`A butt that eats underwear.`,
	`A corn dog.`,
	`A cowboy who is half boy, half cow.`,
	`A dead body.`,
	`A dead whale.`,
	`A Democrat.`,
	`A dollw that pees real pee!`,
	`A fake kid made out of wood.`,
	`A flamethrower.`,
	"A gerbil named `Gerbil.`",
	`A hot air balloon powered by fart gas.`,
	`A huge bitch.`,
	`A hundred screaming monkeys.`,
	`A killer clown.`,
	`A long, hot pee.`,
	`A long, long snake.`,
	`A naked lady in a painting.`,
	`A nice, warm glass of pee.`,
	"A plant-devouring space-worm named `Rachel.`",
	`A poop as big as mom.`,
	`A pregnant person.`,
	`A Republican.`,
	`A scoop of tuna.`,
	`A screaming soccer dad.`,
	`A super angry cat I found outside.`,
	`A turd that just won't flush.`,
	`A whole thing of cottage cheese.`,
	`A wise, old woman with no teeth and cloudy eyes.`,
	`Abraham Lincoln.`,
	`An invisible giant who takes giant, visible poops.`,
	`An old, dirty cat with bad breath.`,
	`An order of mozzarella sticks.`,
	`An owl that hates you.`,
	`Ariana Grande.`,
	`Aunt Linda.`,
	`Baby Yoda.`,
	`Bad parenting.`,
	`Balls. Big balls. Really big balls.`,
	`Barf.`,
	`Barfing into a popcorn bucket.`,
	`Batman.`,
	`Beautiful grandma.`,
	`Becoming taller and stronger than Father.`,
	`Becoming the president.`,
	`Beer.`,
	`Being adopted.`,
	`Being dead.`,
	`Being famous on YouTube.`,
	`Being French, hoh-hoh-hoh!`,
	`Being super serious right now.`,
	`Bench pressing a horse.`,
	`Beyonce's Superbowl performance.`,
	`Big butt cheeks filled with poop.`,
	`Big Mississippi boys.`,
	`Big Randy.`,
	`Big, juicy pimples.`,
	`Big, slappy hands.`,
	`Biting a rich person.`,
	`Blasting farts in the powder room.`,
	`Blasting my math teacher into the sun.`,
	`Bleeding.`,
	`Blossoming into a beautiful young man.`,
	`Blowing up the Moon.`,
	`Boobies.`,
	`Boogie-boarding down Huka Falls`,
	`Boys.`,
	`Building a nuclear bunker at my parents' house.`,
	`BULBASAUR.`,
	`Burning books.`,
	`Bursting into flames.`,
	`Butt hair.`,
	`Butt surgery.`,
	`Butthole.`,
	`Butts of all shapes and sizes.`,
	`Cat pee.`,
	`Cavities.`,
	`Cheeto fingers.`,
	`Chest hair.`,
	`Chinese campaign clothing.`,
	`Chugging a lava lamp.`,
	`Chungo, the talking gorilla.`,
	`Chunks.`,
	`Cigarettes.`,
	`Climate change.`,
	`Climbing into a cow's butt.`,
	`Coffee.`,
	`Comign back from the dead.`,
	`Completely drunk organizers.`,
	`Covering myself with ketchup and mustard because I am a hot dog.`,
	`Crab-walking from the toilet to get more toilet paper.`,
	`Crying in the bathroom.`,
	`Dad's famous poops.`,
	`Dad's meatloaf.`,
	`Dancing with my son.`,
	`Debating cartoon logic`,
	`Diarrhea.`,
	`Doing karate.`,
	`Dreaming about boys.`,
	`Drinkig a whole bottle of ranch.`,
	`Drinking gasoline to see what it tastes like.`,
	`Drinking out of the toilet and eating rubbish.`,
	`Dump cake.`,
	"Dwayne `The Rock` Johnson's acting career.",
	`Dying of old age.`,
	`Eating a baby.`,
	`Eating a whole roll of toilet paper.`,
	`Eating toenail clippings.`,
	`Elegant party hats.`,
	`Evil.`,
	`Failure.`,
	`Fake news.`,
	`Falling into a pit of waffles.`,
	`Famous peanut scientist George Washington Carver.`,
	`Farting a lot today.`,
	`Farting Antelopes`,
	`Farting, barfing, and passing out.`,
	`Fat stacks of cash.`,
	`Father's forbidden chocolates.`,
	`Feasting upon human flesh.`,
	`Feminist men.`,
	`Filling my butt with spaghetti.`,
	`Finger teeth.`,
	`Fire farts.`,
	`Flamin' Hot Cheetos.`,
	`Floating through the void of space and time.`,
	`Flushing myself down the toilet.`,
	`Forgetting to put on underwear.`,
	`Fortnite.`,
	`Freeing a fart from its butt prison.`,
	`Garbage.`,
	`Getting a girlfriend.`,
	`Getting a skull tattoo.`,
	`Getting crushed by a piano.`,
	`Getting drunk.`,
	`Getting kicked in the nuts.`,
	`Getting married.`,
	`Getting my ponytail stuck in my butt.`,
	`Getting naked.`,
	`Getting run over by a train.`,
	`Getting scalded in the fave with hot beans.`,
	`Getting skin cancer after 5 minutes at Takapuna beach`,
	`Getting slapped with a fish.`,
	`Getting struck in the toilet.`,
	`Giggling and farting and slurping milkshakes.`,
	`Girly drinks`,
	`Glen's fabulous body.`,
	`Gluing my butt cheeks together.`,
	`Going around sniffing people's armpits.`,
	`Going ballistic`,
	`Going beast mode.`,
	`Going night night.`,
	`Going to Hobbiton for your hairy foot fetish`,
	`Grandma panties.`,
	`Grandpa.`,
	`Greta Thunberg.`,
	`Ham.`,
	`Happy Endings.`,
	`Harry Potter.`,
	`Having a baby.`,
	`Having a really big head.`,
	`Having many husbands.`,
	`Having no bones.`,
	`Having no friends.`,
	`Having to pee so bad.`,
	`Hogs.`,
	`Horrible allergies.`,
	`Hot, fresh doodies.`,
	`How much wood a woodchuck would chuck if a woodchuck could chuck wood.`,
	`Huge pants.`,
	`Huge, hairy men.`,
	`Hurting people's feelings.`,
	`Idiots.`,
	`Illegal drugs.`,
	`Jesus's death.`,
	`Johnny Depp, dancing all sexy.`,
	`JoJo Siwa.`,
	`Josh.`,
	`Kevin's mom.`,
	`Kisisng mom on the lips.`,
	`Knives.`,
	`Legs.`,
	`Lice.`,
	`Licking a used bandaid.`,
	`Lighting stuff on fire.`,
	`Literally ruining my life.`,
	`Living in a pineapple under the sea.`,
	`Living in the dumpster.`,
	`Locking Mother in the pantry.`,
	`love's quick pants`,
	`Making out in a closet.`,
	`Many wolves.`,
	`Martin Luther King Jr.`,
	`Mashing a banana into your belly button.`,
	`Mayonaise.`,
	`Me, your dad.`,
	`Mean people`,
	`Mom's butt.`,
	`Mom's friend, Donna.`,
	`Mom's new haircut.`,
	`Most of a horse.`,
	`Moving to Ohio.`,
	`Mowing the stupid lawn.`,
	`Murdering.`,
	`My annoying brother.`,
	`My annoying sister.`,
	`My big donkey brother.`,
	`My father, who is a walrus.`,
	`My future husband.`,
	`My girlfriend, who goes to another school.`,
	`My sister's stupid boyfriend.`,
	`Naked people.`,
	`Never showering.`,
	`Nipples.`,
	`Not wearing trousers.`,
	`Nothing. Absolutely nothing.`,
	`Nunchucks.`,
	`Obama.`,
	`Old Jim's Steamy Butt Sauce.`,
	`Old people.`,
	`One long hair growing out of a mole.`,
	`One tought mama.`,
	`One weird lookin' toe.`,
	`Only beans.`,
	`Overthrowing the government.`,
	`Pee-pee.`,
	`Peeing in the cat's litter box.`,
	`Peeing into everyone's mouth.`,
	`Peer pressure.`,
	`Person milk.`,
	`Pizza.`,
	`Playing trumpet for the mayor.`,
	`Polka dot underwear`,
	`Poo-poo.`,
	`Pooping barf forever.`,
	`Pooping on the neighbor's lawn.`,
	`Pork.`,
	`Poseidon, Lord of the Sea.`,
	`Principal Butthead.`,
	`Pubes held together in a little ponytail holder.`,
	`Punching a guy through a wall.`,
	`Punching everyone.`,
	`Putting my brain into the body of a tiger.`,
	`Putting my butt on stuff.`,
	`Questioning authority.`,
	`Racism, sexism, and homophobia.`,
	`Rated-R stuff.`,
	`Respecting personal boundaries.`,
	`Richi McCaw; the PM we want, but will never deserve`,
	`Running away from home.`,
	`Running full speed into a wall.`,
	`Sacrificing Uncle Tim.`,
	`Satan.`,
	`Saving up my boogers for ten years and then building the world's largest booger.`,
	`Screaming and screaming and never waking up.`,
	`Screaming into a can of Pringles.`,
	`Screaming the F-word.`,
	`Seymour Butts.`,
	`Sharks.`,
	`Shaving Dad's back.`,
	`Shoplifiting.`,
	`Shrek.`,
	`Shutting up.`,
	`SILENCE!`,
	`Sitting on a cake.`,
	`Sitting on the toilet and going poop.`,
	`Slapping that butt.`,
	`Slowly turning into cheese.`,
	`Smelling like onions.`,
	`Sniffing a dog's butt.`,
	`Social media.`,
	`Some freakin' privacy.`,
	`Soup.`,
	`Space lasers.`,
	`Spending my parent's hard-earned money.`,
	`Spider-Man.`,
	`Squirty cheese.`,
	`Stank breath.`,
	`Stealing people's money and going to jail.`,
	`Stuff.`,
	`Stuffing my underwear with pancakes.`,
	`Supreme Court Justice Ruth Bader Ginsburg.`,
	`Swords.`,
	`Taking a dump in the pool.`,
	`Teaching a chicken to kill.`,
	`Teeny, tiny turds.`,
	`The baby.`,
	`The babysitter.`,
	`The beautiful potato.`,
	`The British.`,
	`The bus driver.`,
	`The Denver Satanic Gardens.`,
	`The divorce.`,
	`The entire state of Texas.`,
	`The first female President of the United States of America.`,
	`The garbage man.`,
	`The gluteus maximus.`,
	`the government's secret stockpile of confiscated marijuana`,
	`The huge, stupid moon.`,
	"The loose skin at the joing of the elbow known as `the weenus.`",
	`The middle finger.`,
	`The octopus stuck to my face.`,
	`The old man with the rake who lives down the dark and winding road.`,
	`The oppressive system of capitalism.`,
	`The police.`,
	`The president.`,
	`The Rwandan Genocide.`,
	`The sweet honking or Karen's bassoon.`,
	`The terrible winter of 1609.`,
	`The underrepresentation of African-American dancers at Blues events.`,
	`The way grandpa smells.`,
	`The way I feel when I see Kyle.`,
	`The wettest fart you ever heard.`,
	`The whole family.`,
	`Think, nasty burps.`,
	`This goat, who is my friend.`,
	`This stupid game.`,
	`Thousands of lasagna`,
	`Throwing up double peace signs with my besties at Starbucks.`,
	`Tongue kissing.`,
	`Tossed salads and scrambled eggs.`,
	`Total crap.`,
	`Trekkies`,
	`Triangles.`,
	`Trying to catch that dang raccoon.`,
	`Turning 70 and still being fuckable.`,
	`Twig and berries.`,
	`Uncle Bob.`,
	`Unleashing a hell demon that will destroy our world.`,
	`Urban legends`,
	`Using balloons as boobies.`,
	`Using my butt as a microwave.`,
	`Volleyball shorts.`,
	`Waterboarding a Muslim.`,
	`Whatever dad does at work.`,
	`Wiping my butt.`,
	`Your face.`,
	`Your mom!`,
];

result = "";

// shuffling
function shuffleArray(arr) {
	arr.sort(() => Math.random() - 0.5);
}

const wrap = (s, w) =>
	s.replace(new RegExp(`(?![^\\n]{1,${w}}$)([^\\n]{1,${w}})\\s`, "g"), "$1\n");
result += "\n";

// Set Cards
let remaining = 0;
let subNumber = 0;
let maxCards = 100;
let cardTracker = 0;
result += "subroutine setCardPack_" + subNumber + "\n";
result += "def setCardPack_" + subNumber + "():\n";
shuffleArray(cards);
for (var card of cards) {
	if (cardTracker >= maxCards) {
		break;
	} else {
		cardTracker += 1;
	}
	card = wrap(card, 22);
	if (remaining >= 300) {
		remaining = 0;
		subNumber += 1;
		result += "subroutine setCardPack_" + subNumber + "\n";
		result += "def setCardPack_" + subNumber + "():\n";
	} else {
		remaining += 1;
	}
	result += "    cards.append(" + JSON.stringify(card) + ")\n";
}

shuffleArray(sentences);
remaining = 0;
subNumber += 1;
cardTracker = 0;
result += "subroutine setCardPack_" + subNumber + "\n";
result += "def setCardPack_" + subNumber + "():\n";
for (var sentence of sentences) {
	if (cardTracker >= maxCards) {
		break;
	} else {
		cardTracker += 1;
	}
	if (remaining >= 300) {
		remaining = 0;
		subNumber += 1;
		result += "subroutine setCardPack_" + subNumber + "\n";
		result += "def setCardPack_" + subNumber + "():\n";
	} else {
		remaining += 1;
	}
	if (sentence.includes("{Insert Name}")) {
		result +=
			"    sentences.append(" +
			'"' +
			wrap(sentence.replace("{Insert Name}", "{}"), 60) +
			'".format(random.choice(getAllHeroes()))' +
			")\n";
	} else {
		sentence = wrap(sentence, 60);
		result += "    sentences.append(" + JSON.stringify(sentence) + ")\n";
	}
}
subNumber += 1;
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
