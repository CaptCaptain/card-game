const sentences = [
    `In L.A. County Jail, word is you can trade 200 cigarettes for _____.` ,
    `In Michael Jackson's final moments, he thought about _____.` ,
    `In Rome, there are whisperings that the Vatican has a secret room devoted to _____.` ,
    `In the distant future, historians will agree that _____ marked the beginning of America's decline.` ,
    `In the new Disney Channel Original Movie, Hannah Montana struggles with _____ for the first time.` ,
    `Instead of coal, Santa now gives the bad children _____.` ,
    `It's a pity that kids these days are all getting involved with _____.` ,
    `It's a trap!` ,
    `Life for American Indians was forever changed when the White Man introduced them to _____.` ,
    `Life was difficult for cavemen before _____.` ,
    `Major League Baseball has banned _____ for giving players an unfair advantage.` ,
    `Maybe she's born with it. Maybe it's _____.` ,
    `MTV's new reality show features eight washed-up celebrities living with _____.` ,
    `Next from J.K. Rowling: Harry Potter and the Chamber of _____.` ,
    `Next on ESPN2: The World Series of _____.` ,
    `Science will never explain the origin of _____.` ,
    `Sorry everyone, I just _____.` ,
    `Studies show that lab rats navigate mazes 50% faster after being exposed to _____.` ,
    `The CIA now interrogates enemy agents by repeatedly subjecting them to _____.` ,
    `The class field trip was completely ruined by _____.` ,
    `The socialist governments of Scandinavia have declared that access to _____ is a basic human right.` ,
    `The U.S. has begun airdropping _____ to the children of Afghanistan.` ,
    `This is the way the world ends. Not with a bang but with _____.` ,
    `This season on Man vs. Wild, Bear Grylls must survive in the depths of the Amazon with only _____ and his wits.` ,
    `TSA guidelines now prohibit _____ on airplanes.` ,
    `War! What is it good for?` ,
    `What am I giving up for Lent?` ,
    `What are my parents hiding from me?` ,
    `What brought the orgy to a grinding halt?` ,
    `What did I bring back from Mexico?` ,
    `What did the US airdrop to the children of Afghanistan?` ,
    `What did Vin Diesel eat for dinner?` ,
    `What do old people smell like?` ,
    `_____ is a slippery slope that leads to _____.` ,
    `_____: Good to the last drop.` ,
    `_____: Kid-tested, mother-approved.` ,
    `_____? There's an app for that.` ,
    `_____. Betcha can't have just one!` ,
    `_____. High five, bro.` ,
    `_____. It's a trap!` ,
    `_____. That's how I want to die.` ,
    `A romantic, candlelit dinner would be incomplete without _____.` ,
    `After Hurricane Katrina, Sean Penn brought _____ to the people of New Orleans.` ,
    `After the earthquake, Sean Penn brought _____ to the people of Haiti.` ,
    `Alternative medicine is now embracing the curative powers of _____.` ,
    `And I would have gotten away with it, too, if it hadn't been for _____.` ,
    `Anthropologists have recently discovered a primitive tribe that worships _____.` ,
    `Betcha can't have just one!` ,
    `BILLY MAYS HERE FOR _____!` ,
    `But before I kill you, Mr. Bond, I must show you _____.` ,
    `Coming to Broadway this season, _____: The Musical.` ,
    `Dear Abby, I'm having some trouble with _____ and would like your advice.` ,
    `Due to a PR fiasco, Walmart no longer offers _____.` ,
    `During Picasso's often-overlooked Brown Period, he produced hundreds of paintings of _____.` ,
    `During sex, I like to think about _____.` ,
    `He who controls _____ controls the world.` ,
    `How am I maintaining my relationship status?` ,
    `I do not know with what weapons World War III will be fought, but World War IV will be fought with _____.` ,
    `I drink to forget _____.` ,
    `I got 99 problems but _____ ain't one.` ,
    `I learned the hard way that you can't cheer up a grieving friend with _____.` ,
    `I wish I hadn't lost the instruction manual for _____.` ,
    `I'm sorry, Professor, but I couldn't complete my homework because of _____.` ,
    `In 1,000 years, when paper money is but a distant memory, _____ will be our currency.` ,
    `In an attempt to reach a wider audience, the Smithsonian Museum of Natural History has opened an interactive exhibit on _____.` ,
    `In his new self-produced album, Kanye West raps over the sounds of _____.` ,
    `What does Dick Cheney prefer?` ,
    `What don't you want to find in your Chinese food?` ,
    `What ended my last relationship?` ,
    `What gets better with age?` ,
    `What gives me uncontrollable gas?` ,
    `What has been making life difficult at the nudist colony?` ,
    `What helps Obama unwind?` ,
    `What is Batman's guilty pleasure?` ,
    `What never fails to liven up the party?` ,
    `What will always get you laid?` ,
    `What will I bring back in time to convince people that I am a powerful wizard?` ,
    `What would grandma find disturbing, yet oddly charming?` ,
    `What's a girl's best friend?` ,
    `What's my anti-drug?` ,
    `What's my secret power?` ,
    `What's Teach for America using to inspire inner city students to succeed?` ,
    `What's that smell?` ,
    `What's that sound?` ,
    `What's the crustiest?` ,
    `What's the gift that keeps on giving?` ,
    `What's the most emo?` ,
    `What's the new fad diet?` ,
    `What's the next Happy Meal toy?` ,
    `What's the next superhero/sidekick duo?` ,
    `What's there a ton of in heaven?` ,
    `When all else fails, I can always masturbate to _____.` ,
    `When I am a billionaire, I shall erect a 50-foot statue to commemorate _____.` ,
    `When I am President of the United States, I will create the Department of _____.` ,
    `When I pooped, what came out of my butt?` ,
    `When I'm in prison, I'll have _____ smuggled in.` ,
    `When Pharaoh remained unmoved, Moses called down a Plague of _____.` ,
    `While the United States raced the Soviet Union to the moon, the Mexican government funneled millions of pesos into research on _____.` ,
    `White people like _____.` ,
    `Who stole the cookies from the cookie jar?` ,
    `Why am I sticky?` ,
    `Why can't I sleep at night?` ,
    `Why do I hurt all over?`,
]
const cards = [
    `Cockfights`,
    `Friendly fire`,
    `Ronald Reagan`,
    `A disappointing birthday party`,
    `A sassy black woman`,
    `Mathletes`,
    `A tiny horse`,
    `William Shatner`,
    `Riding off into the sunset`,
    `An M. Night Shyamalan plot twist`,
    `Jew-fros`,
    `Mutually-assured destruction`,
    `Pedophiles`,
    `Yeast`,
    `Grave robbing`,
    `Eating the last known bison`,
    `Catapults`,
    `Poor people`,
    `Forgetting the Alamo`,
    `The Hustle`,
    `The Force`,
    `Wiping her butt`,
    `Intelligent design`,
    `Loose lips`,
    `AIDS`,
    `Pictures of boobs`,
    `The Übermensch`,
    `Sarah Palin`,
    `American Gladiators`,
    `Getting really high`,
    `Scientology`,
    `Penis envy`,
    `Praying the gay away`,
    `Frolicking`,
    `Two midgets shitting into a bucket`,
    `The KKK`,
    `Genghis Khan`,
    `Crystal meth`,
    `Serfdom`,
    `Stranger danger`,
    `A Bop It`,
    `Shaquille O'Neal's acting career`,
    `Prancing`,
    `Vigilante justice`,
    `Overcompensation`,
    `Pixelated bukkake`,
    `A lifetime of sadness`,
    `Racism`,
    `Dwarf tossing`,
    `Sunshine and rainbows`,
    `A monkey smoking a cigar`,
    `Flash flooding`,
    `Lance Armstrong's missing testicle`,
    `Dry heaving`,
    `The terrorists`,
    `Linsday Lohan at 55`,
    `Attitude`,
    `Breaking out into song and dance`,
    `Leprosy`,
    `Gloryholes`,
    `Nipple blades`,
    `The heart of a child`,
    `Puppies!`,
    `Waking up half-naked in a Denny's parking lot`,
    `Dental dams`,
    `Toni Morrison's vagina`,
    `The taint; the grundle; the fleshy fun-bridge`,
    `Active listening`,
    `Ethnic cleansing`,
    `The Little Engine That Could`,
    `The invisible hand`,
    `Waiting 'til marriage`,
    `Unfathomable stupidity`,
    `Euphoria by Calvin Klein`,
    `Re-gifting`,
    `Autocannibalism`,
    `Erectile dysfunction`,
    `My collection of high-tech sex toys`,
    `The Pope`,
    `White people`,
    `Tentacle porn`,
    `Glenn Beck convulsively vomiting as a brood of crab spiders hatches in his brain and erupts from his tear ducts`,
    `Too much hair gel`,
    `Seppuku`,
    `Same-sex ice dancing`,
    `Cheating in the Special Olympics`,
    `Charisma`,
    `Keanu Reeves`,
    `Sean Penn`,
    `Nickelback`,
    `A look-see`,
    `Pooping back and forth. Forever.`,
    `Menstruation`,
    `Kids with ass cancer`,
    `A salty surprise`,
    `The South`,
    `The violation of our most basic human rights`,
    `YOU MUST CONSTRUCT ADDITIONAL PYLONS`,
    `Date rape`,
    `Being fabulous`,
    `Necrophilia`,
    `Centaurs`,
    `Bill Nye the Science Guy`,
    `Black people`,
    `Chivalry`,
    `Lunchables`,
    `Bitches`,
    `The profoundly handicapped`,
    `Heartwarming orphans`,
    `MechaHitler`,
    `Fiery poops`,
    `Another goddamn vampire movie`,
    `Tangled Slinkys`,
    `The true meaning of Christmas`,
    `Estrogen`,
    `A zesty breakfast burrito`,
    `That thing that electrocutes your abs`,
    `Passing a kidney stone`,
    `A bleached asshole`,
    `Michael Jackson`,
    `Cybernetic enhancements`,
    `Guys who don't call`,
    `Smallpox blankets`,
    `Masturbation`,
    `Classist undertones`,
    `Queefing`,
    `Concealing a boner`,
    `Edible underpants`,
    `Viagra`,
    `Soup that is too hot`,
    `Muhammad (Praise Be Unto Him)`,
    `Surprise Butt-Sex!`,
    `Five-Dollar Footlongs`,
    `Drinking alone`,
    `Dick fingers`,
    `Multiple stab wounds`,
    `Soiling oneself`,
    `Child abuse`,
    `Anal beads`,
    `Civilian casualties`,
    `Pulling out`,
    `Robert Downey, Jr`,
    `Horse meat`,
    `A really cool hat`,
    `Kim Jong-il`,
    `A stray pube`,
    `Jewish fraternities`,
    `The token minority`,
    `Doin' it in the butt`,
    `Feeding Rosie O'Donnell`,
    `Teaching a robot to love`,
    `A can of whoop-ass`,
    `A windmill full of corpses`,
    `Count Chocula`,
    `Wearing underwear inside-out to avoid doing laundry`,
    `A death ray`,
    `The glass ceiling`,
    `A cooler full of organs`,
    `The American Dream`,
    `Keg stands`,
    `When you fart and a little bit comes out`,
    `Take-backsies`,
    `Dead babies`,
    `Foreskin`,
    `Saxophone solos`,
    `Italians`,
    `A fetus`,
    `Firing a rifle into the air while balls deep in a squealing hog`,
    `Dick Cheney`,
    `Amputees`,
    `Eugenics`,
    `My relationship status`,
    `Christopher Walken`,
    `Bees?`,
    `Harry Potter erotica`,
    `College`,
    `Getting drunk on mouthwash`,
    `Nazis`,
    `8 oz of sweet Mexican black-tar heroin`,
    `Stephen Hawking talking dirty`,
    `Dead parents`,
    `Object permanence`,
    `Opposable thumbs`,
    `Racially-biased SAT questions`,
    `Jibber-jabber`,
    `Chainsaws for hands`,
    `Nicolas Cage`,
    `Child beauty pageants`,
    `Explosions`,
    `Shapeshifters`,
    `Glenn Beck being harried by a swarm of buzzards`,
    `Repression`,
    `Roofies`,
    `My vagina`,
    `Assless chaps`,
    `A murder most foul`,
    `Giving 110 percent`,
    `Her Royal Highness, Queen Elizabeth II`,
    `The Trail of Tears`,
    `Being marginalized`,
    `Goblins`,
    `Hope`,
    `The Rev. Dr. Martin Luther King, Jr.`,
    `A micro-penis`,
    `My soul`,
    `A hot mess`,
    `Vikings`,
    `Hot people`,
    `Seduction`,
    `An Oedipus complex`,
    `Geese`,
    `Global warming`,
    `New Age music`,
    `Hot Pockets`,
    `Making a pouty face`,
    `Vehicular manslaughter`,
    `Women's suffrage`,
    `A defective condom`,
    `Judge Judy`,
    `African children`,
    `The Virginia Tech Massacre`,
    `Barack Obama`,
    `Asians who aren't good at math`,
    `Elderly Japanese men`,
    `Exchanging pleasantries`,
    `Heteronormativity`,
    `Parting the Red Sea`,
    `Arnold Schwarzenegger`,
    `Road head`,
    `Spectacular abs`,
    `Figgy pudding`,
    `A mopey zoo lion`,
    `A bag of magic beans`,
    `Poor life choices`,
    `My sex life`,
    `Auschwitz`,
    `A snapping turtle biting the tip of your penis`,
    `A thermonuclear detonation`,
    `The clitoris`,
    `The Big Bang`,
    `Land mines`,
    `Friends who eat all the snacks`,
    `Goats eating cans`,
    `The Dance of the Sugar Plum Fairy`,
    `Jerking off into a pool of children's tears`,
    `Man meat`,
    `Me time`,
    `The Underground Railroad`,
    `Poorly-timed Holocaust jokes`,
    `A sea of troubles`,
    `Lumberjack fantasies`,
    `Morgan Freeman's voice`,
    `Women in yogurt commercials`,
    `Natural male enhancement`,
    `Being a motherfucking sorcerer`,
    `Genital piercings`,
    `Passable transvestites`,
    `Sexy pillow fights`,
    `Balls`,
    `Grandma`,
    `Friction`,
    `Party Poopers`,
    `Farting and walking away`,
    `Being a dick to children`,
    `Booby-trapping the house to foil burglars`,
    `The Tempur-Pedic Swedish Sleep System`,
    `Dying`,
    `Hurricane Katrina`,
    `The gays`,
    `The folly of man`,
    `Men`,
    `Passive-aggressive Post-it notes`,
    `Pterodactyl eggs`,
    `Team-building exercises`,
    `A brain tumor`,
    `Cards Against Humanity`,
    `Fear itself`,
    `Lady Gaga`,
    `The milk man`,
    `A foul mouth`,
    `A big black dick`,
    `A beached whale`,
    `A bloody pacifier`,
    `A crappy little hand`,
    `A low standard of living`,
    `A nuanced critique`,
    `Panty raids`,
    `A passionate Latino lover`,
    `A rival dojo`,
    `A web of lies`,
    `A woman scorned`,
    `Clams`,
    `Apologizing`,
    `Appreciative snapping`,
    `Neil Patrick Harris`,
    `Beating your wives`,
    `Being a dinosaur`,
    `Shaft`,
    `Bosnian chicken farmers`,
    `Nubile slave boys`,
    `Carnies`,
    `Coughing into a vagina`,
    `Suicidal thoughts`,
    `Dancing with a broom`,
    `Deflowering the princess`,
    `Dorito breath`,
    `Eating an albino`,
    `Enormous Scandinavian women`,
    `Fabricating statistics`,
    `Finding a skeleton`,
    `Gandalf`,
    `Inappropriate yodeling`,
    `George Clooney's musk`,
    `Getting abducted by Peter Pan`,
    `Getting in her pants, politely`,
    `Gladiatorial combat`,
    `Good grammar`,
    `Hipsters`,
    `Historical revisionism`,
    `Insatiable bloodlust`,
    `Jafar`,
    `Jean-Claude Van Damme`,
    `Just the tip`,
    `Mad hacky-sack skills`,
    `Leveling up`,
    `Literally eating shit`,
    `Making the penises kiss`,
    `Media coverage`,
    `Medieval Times Dinner and Tournament`,
    `Moral ambiguity`,
    `My machete`,
    `One thousand Slim Jims`,
    `Ominous background music`,
    `Overpowering your father`,
    `Pistol-whipping a hostage`,
    `Quiche`,
    `Quivering jowls`,
    `Revenge fucking`,
    `Ripping into a man's chest and pulling out his still-beating heart`,
    `Ryan Gosling riding in on a white horse`,
    `Santa Claus`,
    `Scrotum tickling`,
    `Sexual humiliation`,
    `Sexy Siamese twins`,
    `Slow motion`,
    `Space muffins`,
    `Statistically validated stereotypes`,
    `Sudden Poop Explosion Disease`,
    `The boners of the elderly`,
    `The economy`,
    `The Fanta girls`,
    `The Gulags`,
    `The harsh light of day`,
    `Old-people smell`,
    `The shambling corpse of Larry King`,
    `The four arms of Vishnu`,
    `Being a busy adult with many important things to do`,
    `Tripping balls`,
    `Cuddling`,
    `Zeus's sexual appetites`,
    `A Gypsy curse`,
    `A moment of silence`,
    `A sausage festival`,
    `An honest cop with nothing left to lose`,
    `Famine`,
    `Flesh-eating bacteria`,
    `Flying sex snakes`,
    `Not giving a shit about the Third World`,
    `Sexting`,
    `Sniffing glue`,
    `Porn stars`,
    `Raping and pillaging`,
    `72 virgins`,
    `A drive-by shooting`,
    `A time travel paradox`,
    `Authentic Mexican cuisine`,
    `Bling`,
    `Consultants`,
    `Crippling debt`,
    `Daddy issues`,
    `The Donald Trump Seal of Approval`,
    `Dropping a chandelier on your enemies and riding the rope up`,
    `Former President George W. Bush`,
    `Full frontal nudity`,
    `Hormone injections`,
    `Laying an egg`,
    `Getting naked and watching Nickelodeon`,
    `Pretending to care`,
    `Public ridicule`,
    `Sharing needles`,
    `Boogers`,
    `The inevitable heat death of the universe`,
    `The miracle of childbirth`,
    `The Rapture`,
    `Whipping it out`,
    `White privilege`,
    `Wifely duties`,
    `The Hamburglar`,
    `AXE Body Spray`,
    `The Blood of Christ`,
    `Horrifying laser hair removal accidents`,
    `BATMAN!!!`,
    `Agriculture`,
    `A robust mongoloid`,
    `Natural selection`,
    `Coat hanger abortions`,
    `Eating all of the cookies before the AIDS bake-sale`,
    `Michelle Obama's arms`,
    `The World of Warcraft`,
    `Swooping`,
    `Obesity`,
    `A homoerotic volleyball montage`,
    `Lockjaw`,
    `A mating display`,
    `Testicular torsion`,
    `All-you-can-eat shrimp for $4.99`,
    `Domino's Oreo Dessert Pizza`,
    `Kanye West`,
    `Hot cheese`,
    `Raptor attacks`,
    `Taking off your shirt`,
    `Smegma`,
    `Alcoholism`,
    `A middle-aged man on roller skates`,
    `The Care Bear Stare`,
    `Bingeing and purging`,
    `Oversized lollipops`,
    `Self-loathing`,
    `Children on leashes`,
    `Half-assed foreplay`,
    `The Holy Bible`,
    `German dungeon porn`,
    `Being on fire`,
    `Teenage pregnancy`,
    `Gandhi`,
    `Leaving an awkward voicemail`,
    `Uppercuts`,
    `Customer service representatives`,
    `An erection that lasts longer than four hours`,
    `My genitals`,
    `Picking up girls at the abortion clinic`,
    `Science`,
    `Not reciprocating oral sex`,
    `Flightless birds`,
    `A good sniff`,
    `Waterboarding`,
    `A balanced breakfast`,
    `Historically black colleges`,
    `Actually taking candy from a baby`,
    `The Make-A-Wish Foundation`,
    `A clandestine butt scratch`,
    `The Amish`,
    `The Chinese gymnastics team`,
    `Switching to Geico`,
    `Peeing a little bit`,
    `Home video of Oprah sobbing into a Lean Cuisine`,
    `Nocturnal emissions`,
    `The Jews`,
    `My humps`,
    `Powerful thighs`,
    `Winking at old people`,
    `Mr. Clean, right behind you`,
    `A gentle caress of the inner thigh`,
    `Sexual tension`,
    `The forbidden fruit`,
    `Skeletor`,
    `Fancy Feast`,
    `Being rich`,
    `Sweet, sweet vengeance`,
    `Republicans`,
    `A gassy antelope`,
    `Natalie Portman`,
    `Copping a feel`,
    `Kamikaze pilots`,
    `Sean Connery`,
    `The homosexual agenda`,
    `The hardworking Mexican`,
    `A falcon with a cap on its head`,
    `Altar boys`,
    `The Kool-Aid Man`,
    `Getting so angry that you pop a boner`,
    `Free samples`,
    `A big hoopla about nothing`,
    `Doing the right thing`,
    `The Three-Fifths compromise`,
    `Lactation`,
    `World peace`,
    `RoboCop`,
    `Chutzpah`,
    `Justin Bieber`,
    `Oompa-Loompas`,
    `Genetically engineered super-soldiers`,
    `Puberty`,
    `Ghosts`,
    `An asymmetric boob job`,
    `Vigorous jazz hands`,
    `Fingering`,
    `Glenn Beck catching his scrotum on a curtain hook`,
    `GoGurt`,
    `Police brutality`,
    `John Wilkes Booth`,
    `Preteens`,
    `Scalping`,
    `Stifling a giggle at the mention of Hutus and Tutsis`,
    `Tweeting`,
    `Darth Vader`,
    `A sad handjob`,
    `Exactly what you'd expect`,
    `Expecting a burp and vomiting on the floor`,
    `Adderall`,
    `Embryonic stem cells`,
    `Tasteful side-boob`,
    `Panda sex`,
    `An icepick lobotomy`,
    `Tom Cruise`,
    `Mouth herpes`,
    `Sperm whales`,
    `Homeless people`,
    `Third base`,
    `Incest`,
    `Pac-Man uncontrollably guzzling cum`,
    `A mime having a stroke`,
    `Hulk Hogan`,
    `God`,
    `Scrubbing under the folds`,
    `Golden showers`,
    `Emotions`,
    `Licking things to claim them as your own`,
    `Pabst Blue Ribbon`,
    `The placenta`,
    `Spontaneous human combustion`,
    `Friends with benefits`,
    `Finger painting`,
    `The hiccups`,
    `Dying of dysentery`,
    `My inner demons`,
    `A Super Soaker full of cat pee`,
    `Aaron Burr`,
    `Words, words, words`,
    `The chronic`,

]

// shuffling
function shuffleArray(arr) {
arr.sort(() => Math.random() - 0.5);
}

result += '\n'

// Set Cards
result += 'rule "Set Card Pack":\n'
shuffleArray(cards)
for (var card of cards) {
    if (cards.indexOf(card) > 300) {
        break
    }
    result += '    cards.append('+'"'+card+'"'+')\n'
}
shuffleArray(sentences)
for (var sentence of sentences) {
    if (sentences.indexOf(sentence) > 300) {
        break
    }
    result += '    sentences.append('+'"'+sentence+'"'+')\n'
}
result += '    cards.remove([card for card in cards if strContains(card, "**")])\n'
result += '    sentences.remove([sentence for sentence in sentences if strContains(sentence, "**")])\n'
result