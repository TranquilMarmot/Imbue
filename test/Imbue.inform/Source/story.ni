"Imbue" by Nate Moore

Release along with an interpreter.

Include Imbue by Nate Moore.

[Uncomment to turn off HTML tags]
[Using Imbue is false.]

The player's first name is an indexed text that varies. The player's full name is an indexed text that varies.

When play begins:
	now the command prompt is "Tell me your name: ".
	
To decide whether collecting names:
	if the command prompt is "Tell me your name: ", yes; no.
	
After reading a command when collecting names:
	if the number of words in the player's command is greater than 5:
		say "[italic type][number of words in the player's command][roman type] names? Yeah, right. Try again.";
		reject the player's command;
	now the player's full name is "[the player's command in title case]";
	now the player's full name is the substituted form of the player's full name;
	now the player's first name is word number 1 in the player's full name;
	now the command prompt is ">";
	say "[one of]Hey, [player's first name], what's up?[or]Hello, [player's first name], how's it going?[or][player's first name], huh?[or]Oh, I used to have a good friend named [player's first name]![or][player's first name]? Well, then.[or][player's first name]? That's the most ridiculous name I've ever heard![purely at random]Let's go on an adventure!";
	move the player to the location; [this causes the game to 'look' after a name has been entered]
	reject the player's command;
	
Instead of looking when collecting names: do nothing. [forces the game to not start until a name has been entered]

To say the red test text: say (span for "This is some red text" attributes "class='red'");
To say the blue test text: say (span for "And this is some blue text" attributes "class='blue'");
To say the green test text: say (span for "And, some green text!" attributes "class='green'");

To say the imbue testcouch link: say (direction for "south" text "Imbue Testcouch" attributes "class='direction'");

Imbue Testbed is a room. "[if unvisited]Hello, and welcome to the Imbue Testbed![paragraph break][the red test text][paragraph break][the blue test text][paragraph break][the green test text][paragraph break][end if]To the [south link], you see the [the imbue testcouch link]."

[-- Edible Test Object--]
To say test object action: say (action for "a test object" name "test object" actions "examine,pick up,eat" attributes "class='object'");

The test object is in the Imbue Testbed. "You see here [test object action], ripe for interaction.".
The test object is edible.
The description of the test object is "Yup, it's a test object alright! It looks pretty tasty...".
After eating the test object, say "Damn, that's a tasty test!".

[-- Switchable Test Switch --]
To say test switch action: say (action for "a test switch" name "test switch" actions "examine,switch" attributes "class='object'");

The test switch is in the Imbue Testbed. "[if the test switch is switched off]Attached to the wall in the test room there's [test switch action] in the off position. I wonder what you could do with that?[else]There's [test switch action] on the wall here, in the on position.[end if]".
The test switch is a device. The test switch is switched off.
The test switch is fixed in place.
The description of the test switch is "[if the test switch is switched off]It's pretty big... I wonder what it does?[else]It's on, but nothing is happening...[end if]".
After switching on the test switch:
	say "Yup, you flipped the switch to on! But nothing seems different...";
After switching off the test switch:
	say "Now the switch is off... but still nothing.";
	
[-- Testcouch --]
To say the imbue testbed link: say (direction for "north" text "Imbue Testbed" attributes "class='direction'");

The Imbue Testcouch is south of the Imbue Testbed. "There's a couch here![paragraph break]To the [north link] leads back to the [the imbue testbed link]";