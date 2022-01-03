const sentences = [
	`Absurd`,
	`Abundant`,
	`Addictive`,
	`Adorable`,
	`Adorable`,
	`Aged`,
	`Amazing`,
	`Amazing`,
	`American`,
	`Ancient`,
	`Animated`,
	`Annoying`,
	`Annoying`,
	`Appetizing`,
	`Armed & Dangerous`,
	`Arrogant`,
	`Attractive`,
	`Attractive`,
	`Awesome`,
	`Awful`,
	`Awkward`,
	`Bad`,
	`Bashful`,
	`Beautiful`,
	`Believable`,
	`Best`,
	`Big`,
	`Big & Tall`,
	`Bitter`,
	`Black & Blue`,
	`Black & White`,
	`Bogus`,
	`Boisterous`,
	`Bold`,
	`Bold`,
	`Boring`,
	`Boring`,
	`Brains & Brawn`,
	`Brave`,
	`Bright`,
	`Bright`,
	`Bright & Shining`,
	`Brilliant`,
	`Brutal`,
	`Bumpy`,
	`Busy`,
	`Busy`,
	`Calm`,
	`Calm`,
	`Careful`,
	`Caring`,
	`Casual`,
	`Charismatic`,
	`Charming`,
	`Charming`,
	`Cheerful`,
	`Cheesy`,
	`Chewy`,
	`Chewy`,
	`Chubby`,
	`Chunky`,
	`Classic`,
	`Clean`,
	`Clean`,
	`Clear`,
	`Clever`,
	`Clueless`,
	`Clumsy`,
	`Clumsy`,
	`Cold`,
	`Cold`,
	`Colorful`,
	`Colorful`,
	`Comfortable`,
	`Comfortable`,
	`Comical`,
	`Complicated`,
	`Conceited`,
	`Confused`,
	`Confusing`,
	`Controversial`,
	`Cool`,
	`Cool`,
	`Cool & Collected`,
	`Corrupt`,
	`Cosmic`,
	`Cosmopolitan`,
	`Costly`,
	`Courageous`,
	`Courageous`,
	`Cowardly`,
	`Cozy`,
	`Cozy`,
	`Cranky`,
	`Crazed`,
	`Crazy`,
	`Crazy`,
	`Creative`,
	`Creepy`,
	`Creepy`,
	`Creepy & Crawly`,
	`Crisp`,
	`Crisp & Delicious`,
	`Crooked`,
	`Cruel`,
	`Cruel & Unusual`,
	`Crunchy`,
	`Cuddly`,
	`Cuddly`,
	`Curved`,
	`Cut & Dried`,
	`Cute`,
	`Cute`,
	`Cute & Cuddly`,
	`Dainty`,
	`Dainty`,
	`Dangerous`,
	`Dangerous`,
	`Daring`,
	`Dark`,
	`Dark`,
	`Dashing`,
	`Dazed & Confused`,
	`Dead`,
	`Dead & Gone`,
	`Deadly`,
	`Delicate`,
	`Delicate`,
	`Delicious`,
	`Delicious`,
	`Delightful`,
	`Demanding`,
	`Depressing`,
	`Desperate`,
	`Devious`,
	`Difficult`,
	`Dignified`,
	`Dirty`,
	`Dirty`,
	`Disgusting`,
	`Distinguished`,
	`Disturbing`,
	`Down & Dirty`,
	`Down & Out`,
	`Dramatic`,
	`Dreamy`,
	`Drunk & Disorderly`,
	`Dull`,
	`Dull`,
	`Dumb`,
	`Dumb & Dumber`,
	`Dysfunctional`,
	`Earthy`,
	`Easy`,
	`Easy`,
	`Eccentric`,
	`Edgy`,
	`Elderly`,
	`Elitist`,
	`Emotional`,
	`Enchanting`,
	`Endangered`,
	`Energetic`,
	`Energetic`,
	`Enjoyable`,
	`Enjoyable`,
	`Enormous`,
	`Enormous`,
	`Entertaining`,
	`Entertaining`,
	`Eternal`,
	`European`,
	`Evil`,
	`Excellent`,
	`Exciting`,
	`Exciting`,
	`Exhausting`,
	`Expensive`,
	`Expensive`,
	`Explosive`,
	`Exquisite`,
	`Extreme`,
	`Fabulous`,
	`Fake`,
	`Famous`,
	`Famous`,
	`Fancy`,
	`Fancy`,
	`Fantastic`,
	`Fascinating`,
	`Fashionable`,
	`Fast`,
	`Fast`,
	`Fast & Furious`,
	`Fast & Loose`,
	`Fat`,
	`Fat & Happy`,
	`Favorite`,
	`Fearful`,
	`Feminine`,
	`Filthy`,
	`Fine`,
	`Flaky`,
	`Flamboyant`,
	`Flat`,
	`Flavorful`,
	`Flavorful`,
	`Flawed`,
	`Flirtatious`,
	`Foot Loose & Fancy Free`,
	`Foreign`,
	`Fragile`,
	`Fragile`,
	`Fragrant`,
	`Frail`,
	`Frazzled`,
	`Fresh`,
	`Fresh`,
	`Friendly`,
	`Friendly`,
	`Frightening`,
	`Frightening`,
	`Frivolous`,
	`Funky`,
	`Fun`,
	`Fun`,
	`Funny`,
	`Funny`,
	`Furious`,
	`Furry`,
	`Fuzzy`,
	`Fuzzy`,
	`Gentle`,
	`Gigantic`,
	`Glamorous`,
	`Glitzy`,
	`Global`,
	`Gloomy`,
	`Glorious`,
	`Good`,
	`Goody-Goody`,
	`Goofy`,
	`Goofy`,
	`Gorgeous`,
	`Gorgeous`,
	`Graceful`,
	`Graceful`,
	`Great`,
	`Grueling`,
	`Gruesome`,
	`Grungy`,
	`Hairy`,
	`Hale & Hearty`,
	`Handsome`,
	`Handy`,
	`Handy`,
	`Happy`,
	`Hard`,
	`Hardworking`,
	`Hardworking`,
	`Harmful`,
	`Harmful`,
	`Harsh`,
	`Haunting`,
	`Hazardous`,
	`Healthy`,
	`Healthy`,
	`Heartless`,
	`Heavy`,
	`Helpful`,
	`High & Dry`,
	`High & Low`,
	`High & Mighty`,
	`Hilarious`,
	`Hit & Miss`,
	`Honest`,
	`Honorable`,
	`Hopeless`,
	`Horrible`,
	`Horrifying`,
	`Hostile`,
	`Hot`,
	`Hot`,
	`Hot & Bothered`,
	`Hot & Cold`,
	`Hot & Heavy`,
	`Hot & Muggy`,
	`Hot & Spicy`,
	`Hot & Sweaty`,
	`Huge`,
	`Huge`,
	`Humorous`,
	`Icky`,
	`Ideal`,
	`Idiotic`,
	`Important`,
	`Important`,
	`Industrious`,
	`Influential`,
	`Innocent`,
	`Insane`,
	`Inspirational`,
	`Insulting`,
	`Intelligent`,
	`Intense`,
	`Interesting`,
	`Irresistible`,
	`Irritating`,
	`Jolly`,
	`Jolly`,
	`Juicy`,
	`Juicy`,
	`Kind`,
	`Large`,
	`Lazy`,
	`Lazy`,
	`Lean & Mean`,
	`Legendary`,
	`Lewd & Lascivious`,
	`Light`,
	`Light & Fluffy`,
	`Little`,
	`Lively`,
	`Long`,
	`Long & Lean`,
	`Loud`,
	`Loud`,
	`Loud & Clear`,
	`Lovable`,
	`Lovable`,
	`Loving`,
	`Lucky`,
	`Lucky`,
	`Lumpy`,
	`Luscious`,
	`Luxurious`,
	`Magical`,
	`Magical`,
	`Manly`,
	`Masculine`,
	`Mean`,
	`Mean`,
	`Meek`,
	`Meek & Mild`,
	`Melodramatic`,
	`Mesmerizing`,
	`Messy`,
	`Messy`,
	`Mischievous`,
	`Miserable`,
	`Miserable`,
	`Misunderstood`,
	`Modern`,
	`Mushy`,
	`Mysterious`,
	`Mysterious`,
	`Mystical`,
	`Naive`,
	`Nasty`,
	`Nasty`,
	`Natural`,
	`Natural`,
	`Naughty & Nice`,
	`Neat`,
	`Neat`,
	`Neat & Clean`,
	`Neglected`,
	`Nerdy`,
	`New`,
	`New & Improved`,
	`Nice`,
	`Noisy`,
	`Normal`,
	`Nutty`,
	`Obnoxious`,
	`Obscene`,
	`Odd`,
	`Odd`,
	`Offensive`,
	`Old`,
	`Old`,
	`Old & Cranky`,
	`Old & Wise`,
	`On The Up & Up`,
	`Orderly`,
	`Ordinary`,
	`Ordinary`,
	`Organic`,
	`Outrageous`,
	`Overwhelming`,
	`Painful`,
	`Painful`,
	`Pale`,
	`Pathetic`,
	`Patriotic`,
	`Peaceful`,
	`Peaceful`,
	`Perfect`,
	`Perfect`,
	`Perverse`,
	`Philosophical`,
	`Phony`,
	`Plain`,
	`Plain`,
	`Plain & Simple`,
	`Playful`,
	`Playful`,
	`Pleasant`,
	`Plug & Play`,
	`Plump & Tender`,
	`Polite`,
	`Poor`,
	`Popular`,
	`Powerful`,
	`Powerful`,
	`Practical`,
	`Pretty`,
	`Pretty`,
	`Prim & Proper`,
	`Primitive`,
	`Principled`,
	`Profound`,
	`Proud`,
	`Puffy`,
	`Pure`,
	`Quick`,
	`Quick & Dirty`,
	`Quiet`,
	`Quiet`,
	`Radiant`,
	`Radical`,
	`Rare`,
	`Raw`,
	`Realistic`,
	`Refreshing`,
	`Refined`,
	`Relaxed`,
	`Relaxing`,
	`Repulsive`,
	`Respectable`,
	`Responsible`,
	`Revolutionary`,
	`Rich`,
	`Rich`,
	`Ridiculous`,
	`Risky`,
	`Rough`,
	`Rough`,
	`Rough & Ready`,
	`Round`,
	`Sad`,
	`Saintly`,
	`Sappy`,
	`Scary`,
	`Scary`,
	`Scenic`,
	`Scented`,
	`Secretive`,
	`Selfish`,
	`Sensational`,
	`Senseless`,
	`Sensitive`,
	`Sensual`,
	`Serious`,
	`Sexy`,
	`Shaggy`,
	`Shallow`,
	`Sharp`,
	`Sharp`,
	`Shiny`,
	`Shiny`,
	`Shocking`,
	`Short`,
	`Short & Stout`,
	`Short & Sweet`,
	`Shy`,
	`Shy`,
	`Sick & Tired`,
	`Sick & Twisted`,
	`Sickening`,
	`Sickening`,
	`Silent`,
	`Silky`,
	`Silly`,
	`Silly`,
	`Simple`,
	`Skillful`,
	`Skinny`,
	`Slender`,
	`Slimy`,
	`Slippery`,
	`Sloppy`,
	`Slow`,
	`Slow & Steady`,
	`Sluggish`,
	`Small`,
	`Smart`,
	`Smart`,
	`Smelly`,
	`Smelly`,
	`Smooth`,
	`Smooth`,
	`Smooth & Creamy`,
	`Snappy`,
	`Sneaky`,
	`Soft`,
	`Soft`,
	`Sophisticated`,
	`Sour`,
	`Special`,
	`Special`,
	`Speedy`,
	`Speedy`,
	`Spic & Span`,
	`Spicy`,
	`Spiritual`,
	`Spooky`,
	`Spooky`,
	`Sporty`,
	`Spotless`,
	`Spunky`,
	`Square`,
	`Squeaky Clean`,
	`Stereotyped`,
	`Sticky`,
	`Stinky`,
	`Straight`,
	`Strange`,
	`Strong`,
	`Stunning`,
	`Stupid`,
	`Sultry`,
	`Surprising`,
	`Sweet`,
	`Sweet`,
	`Swift`,
	`Swift & Sure`,
	`Talented`,
	`Talented`,
	`Tall`,
	`Tame`,
	`Tame`,
	`Tasty`,
	`Tasty`,
	`Technological`,
	`Temperamental`,
	`Tempting`,
	`Tender`,
	`Terrible`,
	`Terrific`,
	`Thick`,
	`Thick & Chunky`,
	`Thin`,
	`Thoughtful`,
	`Timeless`,
	`Tiny`,
	`Tormenting`,
	`Torn & Tattered`,
	`Touch & Go`,
	`Touchy-Feely`,
	`Tough`,
	`Tough`,
	`Trashy`,
	`Tried & True`,
	`True & Blue`,
	`Trustworthy`,
	`Trustworthy`,
	`Twisted`,
	`Ugly`,
	`Unbelievable`,
	`Unforgettable`,
	`Unforgettable`,
	`Unhappy`,
	`Unhealthy`,
	`Unnatural`,
	`Unreal`,
	`Unscrupulous`,
	`Unusual`,
	`Untamed`,
	`Up & Coming`,
	`Up & Down`,
	`Useful`,
	`Useless`,
	`Useless`,
	`Vain`,
	`Valuable`,
	`Violent`,
	`Virtuous`,
	`Visionary`,
	`Warm`,
	`Warm`,
	`Warm & Cozy`,
	`Warm & Fuzzy`,
	`Wash & Wear`,
	`Weak`,
	`Weird`,
	`Weird`,
	`Wet`,
	`Whimsical`,
	`Wicked`,
	`Wide`,
	`Wild`,
	`Wild`,
	`Wild & Wooly`,
	`Wired`,
	`Witty`,
	`Woebegone`,
	`Wonderful`,
	`Worldly`,
	`Worthless`,
	`Young`,
	`Young & Restless`,
	`Yucky`,
	`Zany`,
];
const cards = [
	`A Bad Haircut`,
	`A Bakery`,
	`A Broken Leg`,
	`A Bull Fight`,
	`A Cabin In The Woods`,
	`A Can Of Worms`,
	`A Car Crash`,
	`A Cheap Motel`,
	`A Cookbook`,
	`A Crawl Space`,
	`A Crown`,
	`A Desert`,
	`A Dollar`,
	`A Dozen Red Roses`,
	`A Fairy`,
	`A Few Good Men`,
	`A Flat Tire`,
	`A Fool & His Money`,
	`A Forest`,
	`A French Maid`,
	`A Full Moon`,
	`A Funeral`,
	`A Giant`,
	`A Haunted House`,
	`A High School Bathroom`,
	`A Hole In One`,
	`A Honeymoon`,
	`A King`,
	`A Leaky Boat`,
	`A Little White Lie`,
	`A Locker Room`,
	`A Log Cabin`,
	`A Mermaid`,
	`A Microwave Oven`,
	`A Million Dollars`,
	`A Morgue`,
	`A Movie Theater`,
	`A Mummy`,
	`A Nine Iron`,
	`A Parade`,
	`A Piano`,
	`A Pile Of Leaves`,
	`A Prince`,
	`A Princess`,
	`A Queen`,
	`A Refrigerator`,
	`A Ringing In My Ears`,
	`A Saw`,
	`A School Bus`,
	`A School Cafeteria`,
	`A School Dance`,
	`A Spare Tire`,
	`A Submarine`,
	`A Sunrise`,
	`A Sunset`,
	`A Surprise`,
	`A Swimming Pool`,
	`A Tree House`,
	`A Used Car Lot`,
	`A Volcano`,
	`Abbot & Costello`,
	`Abraham Lincoln`,
	`Actors`,
	`Actresses`,
	`Adam & Eve`,
	`Adam Sandler`,
	`Adolph Hitler`,
	`Africa`,
	`AIDS`,
	`Airline Food`,
	`Airplane`,
	`Airplanes`,
	`Al Pacino`,
	`Aladdin`,
	`Alan Greenspan`,
	`Alaska`,
	`Albert Einstein`,
	`Alfred Hitchcock`,
	`Alien Abductions`,
	`Aliens`,
	`Alligators`,
	`AM & FM`,
	`Americans`,
	`Amputations`,
	`Amsterdam`,
	`An Igloo`,
	`Ancient Rome`,
	`Andy Warhol`,
	`Angry Hornets`,
	`Anna & The King`,
	`Anna Kournikova`,
	`Anne Frank`,
	`Antarctica`,
	`Anthony Hopkins`,
	`Anthrax`,
	`Antiques Roadshow`,
	`Antony & Cleopatra`,
	`Ants`,
	`Apple Juice`,
	`Apple Pie`,
	`Apples`,
	`Apples & Oranges`,
	`Aristotle`,
	`Arm & A Leg`,
	`Armadillo`,
	`Armed Robbery`,
	`Arnold Schwarzenegger`,
	`Aroma Therapy`,
	`Arsenic & Old Lace`,
	`Artists`,
	`Assault & Battery`,
	`Assembly Lines`,
	`Astronauts`,
	`At My Parent's House`,
	`Atlantis`,
	`Atomic Bombs`,
	`Attack On Pearl Harbor`,
	`Austin Powers`,
	`Australian Outback`,
	`Babe Ruth`,
	`Babies`,
	`Baby Dolls`,
	`Baby Food`,
	`Baby Showers`,
	`Babysitters`,
	`Backstreet Boys`,
	`Backyards`,
	`Bacon`,
	`Bad Dogs`,
	`Bad Dreams`,
	`Bagels And Lox`,
	`Bagpipes`,
	`Baked Beans`,
	`Baked Potatoes`,
	`Baking Cookies`,
	`Bald Eagles`,
	`Ball & Chain`,
	`Ballerinas`,
	`Balloons`,
	`Ballroom Dancing`,
	`Bananas`,
	`Band-Aids`,
	`Bangkok`,
	`Bankruptcy`,
	`Barbara Walters`,
	`Barbed Wire`,
	`Barbershops`,
	`Barbie & Ken`,
	`Barbie Dolls`,
	`Barfing`,
	`Barney`,
	`Bart Simpson`,
	`Baseball`,
	`Baseball Games`,
	`Baseball Fields`,
	`Basketball`,
	`Bates Motel`,
	`Batman`,
	`Batman & Robin`,
	`Bats`,
	`Bats & Balls`,
	`BB Guns`,
	`Beach Balls`,
	`Beach Parties`,
	`Beanbag Chairs`,
	`Beanie Babies`,
	`Bears`,
	`Beauty & The Beast`,
	`Beauty And The Beast`,
	`Beavis & Butt-Head`,
	`Bed & Breakfast`,
	`Bee Stings`,
	`Beef Stew`,
	`Beer`,
	`Beer & Pretzels`,
	`Beer Bellies`,
	`Beethoven`,
	`Beets`,
	`Being & Nothingness`,
	`Being In Love`,
	`Bell-Bottoms`,
	`Bells & Whistles`,
	`Belt Buckles`,
	`Ben Stiller`,
	`Berlin - 1945`,
	`Bert & Ernie`,
	`Bert And Ernie`,
	`Bigfoot`,
	`Big Bang Theory`,
	`Big Bird`,
	`Big Cities`,
	`Big Dogs`,
	`Big Macs`,
	`Bill & Ted`,
	`Bill Clinton`,
	`Bill Gates`,
	`Bill Murray`,
	`Billboards`,
	`Billy Crystal`,
	`Bingo`,
	`Bird Watching`,
	`Birds`,
	`Birthday Cake`,
	`Black Cats`,
	`Black Holes`,
	`Black Licorice`,
	`Black Lingerie`,
	`Black Velvet`,
	`Blackouts`,
	`Blizzard`,
	`Blood`,
	`Blood & Tears`,
	`Blowing Bubbles`,
	`Blowing Your Nose`,
	`Blue Velvet`,
	`Blueberries`,
	`Board Games`,
	`Boardwalk & Park Place`,
	`Boats`,
	`Body & Soul`,
	`Body Odor`,
	`Body Piercing`,
	`Body Snatchers`,
	`Body Surfing`,
	`Bodybuilders`,
	`Bonbons`,
	`Bongos`,
	`Bonnie & Clyde`,
	`Bora Bora`,
	`Bottled Water`,
	`Bow & Arrows`,
	`Bowling`,
	`Boxing`,
	`Boy Scouts`,
	`Boyfriends`,
	`Boys`,
	`Braces`,
	`Brad Pitt`,
	`Brain Surgeons`,
	`Brains`,
	`Bread & Water`,
	`Breaking & Entering`,
	`Bride & Groom`,
	`Britney Spears`,
	`Broadway`,
	`Brooks & Dunn`,
	`Brothers`,
	`Brothers & Sisters`,
	`Bruce Willis`,
	`Bruises`,
	`Brushing Your Teeth`,
	`Bubble Bath`,
	`Bubble Gum`,
	`Bubbles`,
	`Buddies`,
	`Buffalo`,
	`Bugs`,
	`Bugs Bunny`,
	`Bulls & Bears`,
	`Bullfighting`,
	`Bullwinkle`,
	`Bumble Bees`,
	`Bumper Cars`,
	`Bumper Stickers`,
	`Bungee Jumping`,
	`Bunk Beds`,
	`Burger & Fries`,
	`Burned Toast`,
	`Bus Drivers`,
	`Butter`,
	`Buttons & Bows`,
	`Butterflies`,
	`Buying A House`,
	`Buzz Lightyear`,
	`Cabbage`,
	`Cactus`,
	`California`,
	`Calvin & Hobbs`,
	`Camelot`,
	`Camels`,
	`Cameras`,
	`Campfire`,
	`Camping`,
	`Camping Trip`,
	`Canada`,
	`Canadians`,
	`Candles`,
	`Candy`,
	`Candy Corn`,
	`Canoes`,
	`Captain Kirk`,
	`Car Bombs`,
	`Car Crash`,
	`Car Horns`,
	`Card Games`,
	`Carl Sagan`,
	`Carlos Santana`,
	`Carnival Workers`,
	`Carpenters`,
	`Carrot & A Stick`,
	`Carrots`,
	`Cary Grant`,
	`Casablanca`,
	`Casinos`,
	`Castles`,
	`Cat & Mouse`,
	`Catfish`,
	`Catherine Zeta-Jones`,
	`Cats & Dogs`,
	`Catsup`,
	`Catsup & Mustard`,
	`Cattle Ranch`,
	`Cavities`,
	`Cauliflower`,
	`Caves`,
	`Caviar`,
	`CD Players`,
	`Celine Dion`,
	`Cell Phones`,
	`Cesar Chavez`,
	`Chain Letters`,
	`Chain Link Fences`,
	`Chains`,
	`Challenger Explosion`,
	`Chameleons`,
	`Charging Rhinos`,
	`Charles & Diana`,
	`Charlie Brown`,
	`Charlotte's Web`,
	`Chat Rooms`,
	`Cheerleaders`,
	`Cheese`,
	`Cheese Sandwich`,
	`Cheesecake`,
	`Chernobyl`,
	`Cherries`,
	`Cherry Pie`,
	`Chewing Your Fingernails`,
	`Chicken Nuggets`,
	`Chicago`,
	`Chicken Pox`,
	`Chickens`,
	`Chimpanzees`,
	`China`,
	`Chinatown`,
	`Chips & Dip`,
	`Chips & Salsa`,
	`Chocolate Milk`,
	`Choir Boys`,
	`Chopsticks`,
	`Chorus Girls`,
	`Christmas`,
	`Churches`,
	`Chutes & Ladders`,
	`Cigarette Burns`,
	`Cigarettes`,
	`Cinco de Mayo`,
	`Cinderella`,
	`Cindy Crawford`,
	`Circus Peanuts`,
	`Clark Gable`,
	`Claude Monet`,
	`Clay`,
	`Cleaning The Bathroom`,
	`Cleaning Your Room`,
	`Cleopatra`,
	`Cleveland`,
	`Climbing A Ladder`,
	`Climbing A Tree`,
	`Clint Eastwood`,
	`Cloned Sheep`,
	`Clouds`,
	`Clowns`,
	`Cocaine`,
	`Cockles & Mussels`,
	`Cockroaches`,
	`Coconuts`,
	`Coffee`,
	`Cold Pizza`,
	`Colin Powell`,
	`Collection Shells`,
	`Comic Books`,
	`Communists`,
	`Commuting`,
	`Computer Hackers`,
	`Computers`,
	`Confucius`,
	`Conspiracy Theories`,
	`Construction Workers`,
	`Convenience Stores`,
	`Cookies`,
	`Cooking Dinner`,
	`Cops & Robbers`,
	`Coral Reef`,
	`Corn Fields`,
	`Corn Flakes`,
	`Corn On The Cob`,
	`Corned Beef & Cabbage`,
	`Corrugated Cardboard`,
	`Corvettes`,
	`Cottage Cheese`,
	`Cotton Candy`,
	`Coughing & Sneezing`,
	`Count Dracula`,
	`Country Music`,
	`Cow-Pies`,
	`Cowboys`,
	`Cowboys & Indians`,
	`Cows`,
	`Crabs`,
	`Crash & Burn`,
	`Crazy Horse`,
	`Cream & Sugar`,
	`Creamed Corn`,
	`Crime & Punishment`,
	`Crying`,
	`Crystal Balls`,
	`Cuba`,
	`Cults`,
	`Cup & Saucer`,
	`Cupcakes`,
	`Curds & Whey`,
	`Currier & Ives`,
	`Custer's Last Stand`,
	`Cut & Curl`,
	`Cutting The Grass`,
	`D-Day, 1944`,
	`Dallas & Fort Worth`,
	`Dance Class`,
	`Dancing`,
	`Dandruff`,
	`Danielle Steel`,
	`Danny DeVito`,
	`Dark Alleys`,
	`Darth Vader`,
	`Dating`,
	`David & Goliath`,
	`David Letterman`,
	`Day Care Centers`,
	`Daytime TV`,
	`Dead Fish`,
	`Death & Dying`,
	`Death & Taxes`,
	`Death Valley`,
	`Deer Hunting`,
	`Demi Moore`,
	`Democrats`,
	`Dennis Rodman`,
	`Denzel Washington`,
	`Detroit`,
	`Diamonds`,
	`Dictionaries`,
	`Dinner & A Movie`,
	`Dinosaurs`,
	`Dirt`,
	`Dirty Diapers`,
	`Dirty Dishes`,
	`Dirty Socks`,
	`Discos`,
	`Discovering America`,
	`Disneyland`,
	`Divorce`,
	`Doctors`,
	`Doctors & Dentists`,
	`Dollars & Cents`,
	`Dodo Birds`,
	`Dog Days`,
	`Dog Food`,
	`Doing The Dishes`,
	`Doing The Hokey-Pokey`,
	`Dolly Parton`,
	`Dolphins`,
	`Donuts`,
	`Doorbells`,
	`Double Thick Malts`,
	`Dr. Evil`,
	`Dr. Jekyll & Mr. Hyde`,
	`Dr. Kevorkin`,
	`Dr. Laura`,
	`Dr. Seuss`,
	`Dragons`,
	`Drew Barrymore`,
	`Drew Carey`,
	`Drinking & Driving`,
	`Driving A Car`,
	`Driving Off A Cliff`,
	`Drums`,
	`Drunk Drivers`,
	`Ducks`,
	`Duct Tape`,
	`Dumb Blonde Jokes`,
	`Dumbo`,
	`Dump Trucks`,
	`Dungeons & Dragons`,
	`Dustin Hoffman`,
	`E-Mail`,
	`Ear Wax`,
	`Early Morning`,
	`Ears`,
	`Earthquakes`,
	`Earwigs`,
	`East Coast`,
	`Eating Breakfast`,
	`Ebony & Ivory`,
	`Eddie Murphy`,
	`Egg Rolls`,
	`Eggplant`,
	`Eggs`,
	`Eleanor Roosevelt`,
	`Electric Eels`,
	`Electricity`,
	`Elephants`,
	`Elevators`,
	`Elizabeth Taylor`,
	`Elmo`,
	`Elvis Presley`,
	`Emergency Rooms`,
	`Emily Dickinson`,
	`Erasers`,
	`Ernest Hemingway`,
	`Europe`,
	`Exorcism`,
	`Exterminators`,
	`Eyes`,
	`Face Paint`,
	`Factories`,
	`Fairies`,
	`Faith Hill`,
	`Falling Down`,
	`Fame & Fortune`,
	`Family Reunions`,
	`Family Vacations`,
	`Family Values`,
	`Farmers`,
	`Farms`,
	`Fast Food`,
	`Fat`,
	`Fear & Loathing`,
	`Feathers`,
	`Feminists`,
	`Ferdinand & Isabella`,
	`Fertilizer`,
	`Festering Wounds`,
	`Fidel Castro`,
	`Field & Stream`,
	`Finger Painting`,
	`Fire`,
	`Firefighters`,
	`Firestorms`,
	`Fireworks`,
	`First Man On The Moon`,
	`Fish & Chips`,
	`Fishing`,
	`Flags`,
	`Flannel Shirts`,
	`Flash Floods`,
	`Flashlights`,
	`Flies`,
	`Flip-Flops`,
	`Flipper`,
	`Floods`,
	`Florence Nightengale`,
	`Flour`,
	`Flower Gardens`,
	`Flowers & Candy`,
	`Fly Fishing`,
	`Flying A Kite`,
	`Flying Monkeys`,
	`Folk Music`,
	`Food & Shelter`,
	`Food Poisoning`,
	`Foot & Mouth`,
	`Football`,
	`Football Players`,
	`Forest Fires`,
	`Forever & Ever`,
	`Fort Knox`,
	`Fortune Cookies`,
	`Fortune Teller`,
	`Fourth Of July`,
	`Frank Lloyd Wright`,
	`Frank Sinatra`,
	`Freaks & Geeks`,
	`Freckles`,
	`Fred & Ginger`,
	`Fred & Wilma`,
	`Fred Flintstone`,
	`Freedom`,
	`French Fries`,
	`French Wines`,
	`Fresh Water Pearls`,
	`Friction`,
	`Friends & Family`,
	`Frisbees`,
	`Frog & Toad`,
	`Frogs`,
	`Frosty The Snowman`,
	`Frozen Peas`,
	`Fund Raising`,
	`Funerals`,
	`Fur`,
	`Fuzz`,
	`Gall Bladder`,
	`Gang Members`,
	`Garages`,
	`Garbage Cans`,
	`Gardening`,
	`Garrison Keillor`,
	`Garth Brooks`,
	`Gas Stations`,
	`Geishas`,
	`Gen. George S. Patton`,
	`Genetic Engineering`,
	`George & Jane, His Wife`,
	`Ghosts & Goblins`,
	`George W. Bush`,
	`George Washington`,
	`Georgia O'Keeffe`,
	`Getting A Haircut`,
	`Getting A Hug`,
	`Getting A Shot`,
	`Getting Head Lice`,
	`Getting Lost`,
	`Getting Mail`,
	`Getting Sick`,
	`Getting Stitches`,
	`Getting The Flu`,
	`Gettysburg, 1863`,
	`Ghost Towns`,
	`Ghosts`,
	`GI Joe`,
	`Giant Squid`,
	`Gila Monsters`,
	`Gilligan's Island`,
	`Ginger & Mary Ann`,
	`Gingko Trees`,
	`Ginseng`,
	`Giraffes`,
	`Girl Scouts`,
	`Girlfriends`,
	`Girls`,
	`Giving A Hug`,
	`Glaciers`,
	`Glass`,
	`Glazed Donuts`,
	`Global Warming`,
	`Globes`,
	`Glue`,
	`Go Karts`,
	`Goats`,
	`Going On A Cruise`,
	`Going On A Safari`,
	`Going On Vacation`,
	`Going To A Movie`,
	`Going To Church`,
	`Going To Grandma's`,
	`Going To School`,
	`Going To The Dentist`,
	`Going To The Gym`,
	`Gold`,
	`Gold & Silver`,
	`Gold Chains`,
	`Goldfish`,
	`Goldie Hawn`,
	`Golf-Ball-Sized Hail`,
	`Good & Plenty`,
	`Goose & The Gander`,
	`Gorillas`,
	`Gossip`,
	`Gourmet Coffee Shops`,
	`Grace Kelly`,
	`Graffiti`,
	`Grape Jelly`,
	`Grapefruit`,
	`Grapes`,
	`Grass Skirts`,
	`Grassy Hill`,
	`Grave Robbers`,
	`Gravity`,
	`Gravy`,
	`Grease`,
	`Grease & Grime`,
	`Green Beans`,
	`Greenpeace`,
	`Grocery Stores`,
	`Guitars`,
	`Gummi Bears`,
	`Gym Teachers`,
	`Gymnastics`,
	`Haiku`,
	`Hair Transplants`,
	`Hairballs`,
	`Halloween`,
	`Ham Sandwhich`,
	`Hamburgers`,
	`Hammer & Nails`,
	`Hammer & Sickle`,
	`Hammerhead Sharks`,
	`Hammers`,
	`Hamsters`,
	`Hand Grenades`,
	`Handcuffs`,
	`Handguns`,
	`Hang Gliding`,
	`Hangnails`,
	`Hansel & Gretel`,
	`Hanukkah`,
	`Hard Boiled Eggs`,
	`Harrison Ford`,
	`Harry Potter`,
	`Harvard & Yale`,
	`Haunted House`,
	`Having A Baby`,
	`Having A Party`,
	`Having An Operation`,
	`Hawaii`,
	`Hawks & Doves`,
	`Head Lice`,
	`Heart & Soul`,
	`Heaven & Hell`,
	`Helen Keller`,
	`Helicopters`,
	`Herb Gardens`,
	`Here & There`,
	`Hiccups`,
	`Hiding Places`,
	`High Heels`,
	`High School`,
	`High School Football`,
	`High School Reunions`,
	`Hiking In The Woods`,
	`Hillary Rodham Clinton`,
	`Hills & Valleys`,
	`Hip Hop`,
	`Hippopotamus`,
	`Hiroshima - 1945`,
	`Hit & Run`,
	`Hitting A Home-Run`,
	`HMOs`,
	`Hockey`,
	`Hollywood`,
	`Hollywood & Vine`,
	`Homeless Shelters`,
	`Homework`,
	`Homer Simpson`,
	`Honey`,
	`Hook & Ladder Trucks`,
	`Hooligans`,
	`Hootie & The Blowfish`,
	`Hopscotch`,
	`Horse & Cart`,
	`Horseback Riding`,
	`Horses`,
	`Hospital Gowns`,
	`Hospitals`,
	`Hot Chocolate`,
	`Hot Lava`,
	`Hot Tubs`,
	`Hot Wheels Cars`,
	`Hotdogs`,
	`Hotels & Motels`,
	`House & Home`,
	`House Guests`,
	`Howard Stern`,
	`Hugs`,
	`Hummingbirds`,
	`Humphrey Bogart`,
	`Hunters`,
	`Husbands & Wives`,
	`Ice`,
	`Ice & Snow`,
	`Ice Cream`,
	`Ice Skating`,
	`Icebergs`,
	`In A Coma`,
	`In The Attic`,
	`In The Basement`,
	`In The Doghouse`,
	`Incense`,
	`Inchworm`,
	`India`,
	`Indiana Jones`,
	`Industrial Revolution`,
	`Infomercials`,
	`Inside The Sun`,
	`Intellectuals`,
	`Ireland`,
	`Irrational Fears`,
	`Israel`,
	`Italy`,
	`Itchy Clothes`,
	`Jack Nicholson`,
	`Jack The Ripper`,
	`Jackie Chan`,
	`Jacques Cousteau`,
	`Jail`,
	`Jamaica`,
	`James Bond`,
	`James Dean`,
	`Japan`,
	`Japanese`,
	`Jell-O`,
	`Jelly Beans`,
	`Jenna & Barbara`,
	`Jennifer Lopez`,
	`Jerry Springer`,
	`Jesse Jackson`,
	`Jesse Ventura`,
	`Jim Carrey`,
	`Jimmy Stewart`,
	`Joan Of Arc`,
	`Jodie Foster`,
	`John F. Kennedy`,
	`John Glenn`,
	`John Philip Sousa`,
	`John Travolta`,
	`John Wayne`,
	`Johnny Depp`,
	`Jonah & The Whale`,
	`Judge Judy`,
	`Juggling`,
	`Julia Roberts`,
	`Jumping Rope`,
	`Junk Mail`,
	`Junkyard Dogs`,
	`Jupiter`,
	`Jurassic Park`,
	`Kangaroos`,
	`Katherine Hepburn`,
	`Keanu Reeves`,
	`Kickball`,
	`Killer Whales`,
	`Kilts`,
	`Kindergarten`,
	`King Arthur`,
	`King Henry VIII`,
	`King Tut`,
	`Kiss & Tell`,
	`Kisses`,
	`Kittens`,
	`Knife & Fork`,
	`Knitting Needles`,
	`Knock-Knock Jokes`,
	`Labor Unions`,
	`Lady & The Tramp`,
	`Ladybugs`,
	`Lance Armstrong`,
	`Large Mouth Bass`,
	`Las Vegas`,
	`Lassie`,
	`Last Night`,
	`Last Will & Testament`,
	`Laurel & Hardy`,
	`Laverne & Shirley`,
	`Law & Order`,
	`Lawyers`,
	`Leaf Blowers`,
	`Learning Spanish`,
	`Learning To Ski`,
	`Leather`,
	`Leather & Lace`,
	`Leeches`,
	`Lego Building Blocks`,
	`Legs`,
	`Lemon & Lime`,
	`Lemon Meringue Pie`,
	`Lemonade`,
	`Lemons`,
	`Lenin's Tomb`,
	`Leonardo Da Vinci`,
	`Lethal Injection`,
	`Lewis & Clark`,
	`Liberty & Justice`,
	`Life Jackets`,
	`Lifeguard`,
	`Lightning`,
	`Linguine With Clam Sauce`,
	`Lions`,
	`Lions & Tigers`,
	`Liposuction`,
	`Listening To Music`,
	`Little Brown Mice`,
	`Liver And Onions`,
	`Lizards`,
	`Llamas`,
	`Loan Sharks`,
	`Lobster`,
	`Lobsters`,
	`Local Police`,
	`Loch Ness Monster`,
	`Lock & Key`,
	`Lock & Load`,
	`Log Cabins`,
	`Lollipops`,
	`London`,
	`Long Hair`,
	`Looking For A Job`,
	`Looney Tunes`,
	`Los Angeles`,
	`Losing Your Backpack`,
	`Losing Your Job`,
	`Love & Marriage`,
	`Love Letters`,
	`Lox & Bagels`,
	`Lucille Ball`,
	`Lucy & Desi`,
	`M & M's`,
	`Macaroni & Cheese`,
	`Macaroni And Cheese`,
	`Machine Guns`,
	`Mad Cow Disease`,
	`Madame Curie`,
	`Madeline`,
	`Madonna`,
	`Mae West`,
	`Magic Tricks`,
	`Maggots`,
	`Mahatma Gandhi`,
	`Mail Carrier`,
	`Manhattan`,
	`Maple Syrup`,
	`Mardi Gras`,
	`Marilyn Monroe`,
	`Marlon Brando`,
	`Mars`,
	`Mark Twain`,
	`Marriage`,
	`Martha Stewart`,
	`Martin Luther King, Jr.`,
	`Mary-Kate And Ashley`,
	`Mashed Potatoes`,
	`Math`,
	`Matzo Balls`,
	`Maui`,
	`Maximum Security Prison`,
	`McDonald's`,
	`Me & My Shadow`,
	`Meat & Potatoes`,
	`Meat Cleavers`,
	`Meat Markets`,
	`Meatballs`,
	`Meatloaf`,
	`Meg Ryan`,
	`Mel Gibson`,
	`Men`,
	`Men In Black`,
	`Mensa High IQ Society`,
	`Meryl Streep`,
	`Mexico`,
	`Mice`,
	`Michael Jackson`,
	`Michael Jordon`,
	`Michelangelo`,
	`Michelle Pfeiffer`,
	`Mickey & Minnie`,
	`Mickey Mouse`,
	`Microsoft`,
	`Midlife Crisis`,
	`Midnight`,
	`Migraine Headaches`,
	`Mike Tyson`,
	`Miles Davis`,
	`Milk`,
	`Milk & Cookies`,
	`Milk Duds`,
	`Milking A Cow`,
	`Milwaukee`,
	`Miniature Golf`,
	`Minneapolis & St. Paul`,
	`Mirrors`,
	`Mittens`,
	`Mold`,
	`Mom & Apple Pie`,
	`Mom & Pop`,
	`Mom's Cooking`,
	`Money`,
	`Monitor & The Merrimac`,
	`Monkeys`,
	`Monster Trucks`,
	`Monsters`,
	`Moon & The Stars`,
	`Morticians`,
	`Mosquito Bites`,
	`Mosquitoes`,
	`Motorcycles`,
	`Mount Rushmore`,
	`Mount Vesuvius`,
	`Mountain Bikes`,
	`Mountains`,
	`Mr. Potato Head`,
	`MTV`,
	`Mud`,
	`Muddy Feet`,
	`Mudslides`,
	`Muffins`,
	`Muhammad Ali`,
	`Mushrooms`,
	`Music`,
	`Music Lessons`,
	`Musicals`,
	`Mustard`,
	`Mutual Funds`,
	`My 16th Birthday`,
	`My Baby Blanket`,
	`My Bank Account`,
	`My Bathroom`,
	`My Bedroom`,
	`My Best Friend`,
	`My Body`,
	`My Boss`,
	`My Dad`,
	`My Dreams`,
	`My Family`,
	`My Father`,
	`My First Kiss`,
	`My Friends`,
	`My Future`,
	`My Grandma`,
	`My Grandpa`,
	`My Hair`,
	`My High School Prom`,
	`My Home`,
	`My Job`,
	`My Life`,
	`My Love Life`,
	`My Memories`,
	`My Mind`,
	`My Mom`,
	`My Mother`,
	`My Neighborhood`,
	`My Past`,
	`My Personality`,
	`My Refrigerator`,
	`My Room`,
	`My School`,
	`My Shoes`,
	`My Stuffed Animals`,
	`My Teacher`,
	`My Town`,
	`Nail Polish`,
	`Napoleon Bonaparte`,
	`NASA`,
	`NASCAR`,
	`Nashville`,
	`Neighbors`,
	`Neil Simon`,
	`New Orleans`,
	`New Shoes`,
	`New York City`,
	`New Yorkers`,
	`Niagara Falls`,
	`Nicholas Cage`,
	`Night`,
	`Ninjas`,
	`Nirvana`,
	`Nobel Peace Prize`,
	`Noisy Neighbors`,
	`Noodles`,
	`Normal Rockwell`,
	`North & South Dakota`,
	`North Pole`,
	`Nosebleeds`,
	`NSYNC`,
	`Nuclear Power Plants`,
	`Nuts & Bolts`,
	`NYPD`,
	`Oatmeal`,
	`Octopus`,
	`Odds & Ends`,
	`Oil & Filter`,
	`Oil & Vinegar`,
	`Oil Spills`,
	`Old Age`,
	`Olive Oil`,
	`On The Roof`,
	`On-Line Shopping`,
	`Onions`,
	`Oprah Winfrey`,
	`Oral Surgery`,
	`Orange Juice`,
	`Oranges`,
	`Ordinary People`,
	`Outer Space`,
	`Owls`,
	`Oxygen`,
	`Pablo Picasso`,
	`Pacific Ocean`,
	`Pail & Shovel`,
	`Painting A Fence`,
	`Pajamas`,
	`Pancakes`,
	`Panda Bears`,
	`Panning For Gold`,
	`Paper Route`,
	`Parachutes`,
	`Parenting`,
	`Paris, France`,
	`Parties`,
	`Paul McCartney & Wings`,
	`Paying Bills`,
	`Paying Taxes`,
	`Peace & Love`,
	`Peace & Quiet`,
	`Peaches`,
	`Peaches & Cream`,
	`Peacocks`,
	`Peanut Butter`,
	`Peanut Butter & Jelly`,
	`Peanuts`,
	`Peanuts & Popcorn`,
	`Pearl Earrings`,
	`Pebbles & Bamm-Bamm`,
	`Pencil & Paper`,
	`Pencils`,
	`Penguins`,
	`Penn & Teller`,
	`Pennies`,
	`Peppers`,
	`Perfume`,
	`Peter Pan`,
	`Pez Dispensers`,
	`Phone & Fax`,
	`Picking Your Nose`,
	`Pickles`,
	`Picnics`,
	`Pierced Ears`,
	`Pigeons`,
	`Pigs`,
	`Pillow Fights`,
	`Pillows`,
	`Pilots`,
	`Pimples`,
	`Pinatas`,
	`Pine Cones`,
	`Pine Trees`,
	`Pineapple`,
	`Pineapples`,
	`Pink Flamingos`,
	`Pinocchio`,
	`Pins & Needles`,
	`Piranha`,
	`Pirates`,
	`Pit Bulls`,
	`Pizza`,
	`Plane Crashes`,
	`Planting Flowers`,
	`Plastic`,
	`Play-Doh`,
	`Playgrounds`,
	`Playing Checkers`,
	`Playing Chess`,
	`Playing Golf`,
	`Pluto`,
	`Poison Ivy`,
	`Pokemon`,
	`Pole Vaulting`,
	`Pomp & Circumstance`,
	`Pond Scum`,
	`Poodles`,
	`Popcorn`,
	`Porcupines`,
	`Pork & Beans`,
	`Porsche Boxster`,
	`Postal Workers`,
	`Potato Chips`,
	`Pounding Nails`,
	`Power & Glory`,
	`Power Drills`,
	`Power Rangers`,
	`Power Tools`,
	`President Bush`,
	`Pretzels`,
	`Pride & Prejudice`,
	`Prince Charming`,
	`Princess Di`,
	`Pro Wrestling`,
	`Psychiatrists`,
	`Psychics`,
	`Public Radio`,
	`Puff Daddy`,
	`Pulling Weeds`,
	`Pumping Iron`,
	`Pumpkins`,
	`Puppets`,
	`Puppies`,
	`Pushups`,
	`Pyramids`,
	`Queen Elizabeth II`,
	`Quentin Terantino`,
	`Quicksand`,
	`R & B`,
	`R & D`,
	`R & R`,
	`Rabbits`,
	`Raccoons`,
	`Race Car Drivers`,
	`Radios`,
	`Raggedy Ann`,
	`Ragweed`,
	`Rain`,
	`Rain Forests`,
	`Rainbows`,
	`Raisins`,
	`Raking Leaves`,
	`Ramona`,
	`Rap Music`,
	`Rappers`,
	`Rats`,
	`Raves`,
	`Reading & Writing`,
	`Reading A Book`,
	`Reading A Good Book`,
	`Recess`,
	`Recreational Vehicles`,
	`Recycling`,
	`Red Raspberries`,
	`Red Roses`,
	`Rednecks`,
	`Redwood Forests`,
	`Reggae Music`,
	`Regis & ...`,
	`Regis Philbin`,
	`Remote Controls`,
	`Republicans`,
	`Restaurants`,
	`Rice`,
	`Rice & Beans`,
	`Rice Krispies Treats`,
	`Richard Nixon`,
	`Richard Simmons`,
	`Riding A Bike`,
	`Riding A Horse`,
	`Riding A Scooter`,
	`Rio De Janeiro`,
	`Rivers`,
	`Road Kill`,
	`Road Rage`,
	`Road Trips`,
	`Robert DeNiro`,
	`Robin Hood`,
	`Robin Williams`,
	`Robots`,
	`Rock & Roll`,
	`Rock And Roll`,
	`Rock Candy`,
	`Rock Concert`,
	`Rock Concerts`,
	`Rock Stars`,
	`Rocket Scientists`,
	`Rocking Chairs`,
	`Rocks`,
	`Rocky Mountains`,
	`Rod & Reel`,
	`Rogers & Hammerstein`,
	`Roller Coaster`,
	`Rollerblading`,
	`Rolling The Car`,
	`Roman Numerals`,
	`I`,
	`VII`,
	`Romeo And Juliet`,
	`Ronald McDonald`,
	`Roosters`,
	`Root Beer`,
	`Root Beer Floats`,
	`Rope Burns`,
	`Rosa Parks`,
	`Rosie O'Donnell`,
	`Rubber Gloves`,
	`Rugrats`,
	`Running A Marathon`,
	`Running In A Race`,
	`Rush Limbaugh`,
	`Russia`,
	`Rust`,
	`Rusty Nails`,
	`Saddam Hussein`,
	`Sailors`,
	`Salads`,
	`Salsa Dancing`,
	`Salt`,
	`Salt 'N Pepa`,
	`Salt & Pepper`,
	`Salvador Dali`,
	`Samuel L. Jackson`,
	`San Francisco`,
	`Sand`,
	`Sand & Surf`,
	`Sand Castles`,
	`Sandra Bullock`,
	`Saturday Cartoons`,
	`Saturn`,
	`Scavenger Hunt`,
	`Scene Of The Crime`,
	`Scented Candles`,
	`Schindler's List`,
	`School Buses`,
	`School Lunch`,
	`School Pictures`,
	`Science Experiments`,
	`Science Fair Projects`,
	`Science Fiction`,
	`Science Tests`,
	`Scientists`,
	`Scooby-Doo`,
	`Screaming`,
	`Screeching`,
	`Sean Connery`,
	`Seashells`,
	`Sesame Street`,
	`Shake & Bake`,
	`Shania Twain`,
	`Sharks`,
	`Sharp Knives`,
	`Shave & A Haircut`,
	`Ships`,
	`Shipwrecks`,
	`Shoplifting`,
	`Shopping`,
	`Shopping Mall`,
	`Shrimp`,
	`Sigmund Freud`,
	`Silk`,
	`Silly Putty`,
	`Sin & Redemption`,
	`Singing`,
	`Sisters`,
	`Sitcoms`,
	`Skateboarding`,
	`Skateboards`,
	`Skeletons`,
	`Skiing`,
	`Skin & Bones`,
	`Skinheads`,
	`Skinned Knees`,
	`Skunks`,
	`Skydiving`,
	`Slash & Burn`,
	`Slasher Films`,
	`Sledding`,
	`Sleep`,
	`Sleeping Pills`,
	`Sleepovers`,
	`Slice & Dice`,
	`Slip & Fall`,
	`Slivers`,
	`Slobodan Milosevic`,
	`Sloppy Joes`,
	`Smith & Wesson`,
	`Smithsonian Institution`,
	`Smoke`,
	`Smoke & Mirrors`,
	`Snakes`,
	`Sneezing`,
	`Snips & Snails`,
	`Snoopy`,
	`Snoopy & The Red Barron`,
	`Snow`,
	`Snow Cones`,
	`Snow White`,
	`Snowballs`,
	`Snowboarding`,
	`Snowflakes`,
	`Snowstorm`,
	`Soccer`,
	`Social Security`,
	`Socks`,
	`Soldiers`,
	`South Africa`,
	`South Park`,
	`Soy Sauce`,
	`Space & Time`,
	`Spaghetti`,
	`Spam`,
	`Sparklers`,
	`Speeding Tickets`,
	`Spelling Bees`,
	`Spider-Man`,
	`Spiders`,
	`Spiders & Snakes`,
	`Spike Lee`,
	`Spilled Milk`,
	`Spinach`,
	`Spit`,
	`Spit & Polish`,
	`Spontaneous Combustion`,
	`Sport Utility Vehicles`,
	`Sports Channels`,
	`Square Dancing`,
	`Squirrels`,
	`Stalactites & Stalagmites`,
	`Stamp Collecting`,
	`Stanley & Livingston`,
	`Star Fruit`,
	`Starry Night`,
	`Stars & Stripes`,
	`Starfish`,
	`Stars`,
	`State Fair`,
	`Steak And Potatoes`,
	`Stephen King`,
	`Steve Martin`,
	`Steven Spielberg`,
	`Sticks & Stones`,
	`Stocks & Bonds`,
	`Stomach Ache`,
	`Stonehenge`,
	`Stop Signs`,
	`Strained Peas`,
	`Strawberries`,
	`Strawberry Shortcake`,
	`Street Mimes`,
	`Stretch Limos`,
	`Strip Malls`,
	`Stuart Little`,
	`Stubbed Toes`,
	`Stunt People`,
	`Substitute Teachers`,
	`Sugar & Spice`,
	`Suit & Tie`,
	`Summer`,
	`Summer Camp`,
	`Sumo Wrestlers`,
	`Sunburns`,
	`Sunday Drivers`,
	`Sunflower`,
	`Sugar`,
	`Sunken Ships`,
	`Sunshine`,
	`Superman`,
	`Supermarkets`,
	`Supermodels`,
	`Surf & Turf`,
	`Surfing`,
	`Surfing The Net`,
	`Surprise Parties`,
	`Sushi`,
	`Swamps`,
	`Swans`,
	`Swimming`,
	`Swiss Bank Accounts`,
	`Swiss Cheese`,
	`Swiss Chocolate`,
	`Swordfighting`,
	`Tacos`,
	`Taking A Bath`,
	`Taking A Shower`,
	`Talk Radio`,
	`Tarred & Feathered`,
	`Tarzan & Jane`,
	`Tattoo Parlors`,
	`Tattoos`,
	`Tea & Crumpets`,
	`Teachers`,
	`Teenagers`,
	`Teeth`,
	`Telemarketers`,
	`Teletubbies`,
	`Televangelists`,
	`Television`,
	`Telling Scary Stories`,
	`Telling The Truth`,
	`Tents`,
	`Terrorist Attack`,
	`Texas`,
	`Thanksgiving Day`,
	`The 1920s`,
	`The 1950s`,
	`The 1960s`,
	`The 1970s`,
	`The 1980s`,
	`The 1990s`,
	`The 21st Century`,
	`The Academy Awards`,
	`The Atlantic & Pacific`,
	`The Baby-Sitters Club`,
	`The Beach`,
	`The Beatles`,
	`The Big Dipper`,
	`The Birds & The Bees`,
	`The Chicken & The Egg`,
	`The Chicken Dance`,
	`The CIA`,
	`The Circus`,
	`The Cold War`,
	`The Common Loon`,
	`The Dalai Lama`,
	`The Dallas Cowboys`,
	`The Dixie Chicks`,
	`The Dump`,
	`The Earth`,
	`The Eiffel Tower`,
	`The Electric Chair`,
	`The End Of The World`,
	`The Everglades`,
	`The Far Left`,
	`The Far Right`,
	`The FBI`,
	`The First Day Of School`,
	`The French Riviera`,
	`The Godfather`,
	`The Grand Canyon`,
	`The Grateful Dead`,
	`The Graveyard Shift`,
	`The Great Barrier Reef`,
	`The Great Chicago Fire`,
	`The Great Depression`,
	`The Great Wall Of China`,
	`The Green Bay Packers`,
	`The Gulf War`,
	`The Ice Age`,
	`The Indy 500`,
	`The Internet`,
	`The IRS`,
	`The JFK Assassination`,
	`The Judge`,
	`The KKK`,
	`The Land Of Oz`,
	`The Last Day Of School`,
	`The Library`,
	`The Little Mermaid`,
	`The Lunchroom`,
	`The Mafia`,
	`The Mall`,
	`The Marx Brothers`,
	`The Metric System`,
	`The Midwest`,
	`The Milky Way`,
	`The Mississippi River`,
	`The Moon`,
	`The Mounties`,
	`The National Enquirer`,
	`The New York Yankees`,
	`The North Pole`,
	`The NRA`,
	`The Ocean`,
	`The Old Man And The Sea`,
	`The Olympics`,
	`The Opera`,
	`The Ozone Layer`,
	`The Pentagon`,
	`The Police`,
	`The President`,
	`The Princess & The Pea`,
	`The Pyramids`,
	`The Renaissance`,
	`The Rolling Stones`,
	`The San Andreas Fault`,
	`The Scarlet Letter`,
	`The South`,
	`The Statue Of Liberty`,
	`The Super Bowl`,
	`The Supreme Court`,
	`The Symphony`,
	`The Three Stooges`,
	`The Three Tenors`,
	`The Titanic`,
	`The U.S. Constitution`,
	`The Universe`,
	`The Vatican`,
	`The Vietnam Memorial`,
	`The Williams Sisters`,
	`The Wright Brothers`,
	`The YMCA`,
	`The Young & The Restless`,
	`The Zoo`,
	`Thelma & Louise`,
	`Thomas Edison`,
	`Three Men & A Baby`,
	`Throwing Rocks`,
	`Throwing Up`,
	`Thunder`,
	`Thunder & Lightning`,
	`Thunderstorms`,
	`Tibet`,
	`Ticks`,
	`Tidal Waves`,
	`Tiger Woods`,
	`Tightrope Walking`,
	`Timbuktu`,
	`Time Travel`,
	`Timothy McVey`,
	`Toasted Marshmallows`,
	`Toasters`,
	`Tobacco Companies`,
	`Toenails`,
	`Toes`,
	`Tom & Jerry`,
	`Tom Cruise`,
	`Tom Hanks`,
	`Tomato Soup`,
	`Tomatoes`,
	`Tony Blair`,
	`Tooth Fairy`,
	`Toothpaste`,
	`Top Of A Rollercoaster`,
	`Tornadoes`,
	`Toy Poodles`,
	`Toys`,
	`Track & Field`,
	`Tractors`,
	`Trailer Parks`,
	`Training Wheels`,
	`Trains`,
	`Trampolines`,
	`Treasure Hunting`,
	`Tree Huggers`,
	`Treehouse`,
	`Trees`,
	`Trekkies`,
	`Trinidad & Tobago`,
	`Truck Drivers`,
	`Truck Stops`,
	`Truth & Justice`,
	`Tulips`,
	`Turkey & Stuffing`,
	`Turkeys`,
	`Turtles`,
	`Tyra Banks`,
	`Tyrannosaurus Rex`,
	`Umbrella Drinks`,
	`Umbrellas`,
	`Under My Bed`,
	`Underwear`,
	`Unicorns`,
	`United Nations`,
	`United States`,
	`Urban Sprawl`,
	`Vacations`,
	`Vacuum Cleaners`,
	`Valentine's Day`,
	`Vampires`,
	`Vanilla Pudding`,
	`Velcro`,
	`Venus & Mars`,
	`Viagra`,
	`Victorian England`,
	`Video Games`,
	`Vietnam, 1968`,
	`Vincent Van Gogh`,
	`Violins`,
	`Volcanoes`,
	`Volleyball`,
	`VW Beetles`,
	`Waco, Texas`,
	`Waffles`,
	`Walking The Dog`,
	`Wall Street`,
	`Walt Disney`,
	`War & Peace`,
	`Warts`,
	`Washer & Dryer`,
	`Washington, DC`,
	`Watching Cartoons`,
	`Watching Football`,
	`Watching TV`,
	`Water`,
	`Water Balloons`,
	`Water Guns`,
	`Water Parks`,
	`Water Skiing`,
	`Waterbeds`,
	`Waterfalls`,
	`Watermelon`,
	`Watermelons`,
	`Waterparks`,
	`Waxing The Floor`,
	`Weapons Dealers`,
	`Weddings`,
	`Weed & Feed`,
	`Weird Al Yankovic`,
	`Whales`,
	`Wheat`,
	`Wheel Of Fortune`,
	`Whipped Cream`,
	`Whips`,
	`Whips & Chains`,
	`White Bread`,
	`White Collar Crime`,
	`Whoopie Goldberg`,
	`Will & Grace`,
	`Will Smith`,
	`William Shakespeare`,
	`Wimbledon`,
	`Windsurfing`,
	`Wine Tasting`,
	`Winnie The Pooh`,
	`Winning A Trophy`,
	`Winning The Lottery`,
	`Winter`,
	`Wishbone`,
	`Witch Hunts`,
	`Witches`,
	`Women`,
	`Women's Soccer`,
	`Wood Chippers`,
	`Woodpeckers`,
	`Woodstock`,
	`Woody Allen`,
	`Woolly Mammoth`,
	`Working Out`,
	`Worms`,
	`Wrestling`,
	`Writing A Letter`,
	`X-Ray Vision`,
	`X-Rays`,
	`Xena, Warrior Princess`,
	`Yellowstone Park`,
	`Yin & Yang`,
	`Yo-Yos`,
	`Zebras`,
	`Zen`,
	`Zippers`,
	`Zombies`,
	`Zucchini`,
];

// shuffling
function shuffleArray(arr) {
	arr.sort(() => Math.random() - 0.5);
}

result += "\n";

// Set Cards
let remaining = 0;
let subNumber = 0;
result += "subroutine setCardPack_" + subNumber + "\n";
result += "def setCardPack_" + subNumber + "():\n";
shuffleArray(cards);
for (var card of cards) {
	if (remaining >= 600) {
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
	if (remaining >= 600) {
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
	result += "    wait()\n";
}
result +=
	'    cards.remove([card for card in cards if strContains(card, "**")])\n';
result +=
	'    sentences.remove([sentence for sentence in sentences if strContains(sentence, "**")])\n';

result;
