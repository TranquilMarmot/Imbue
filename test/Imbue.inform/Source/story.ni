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

Imbue Testbed is a room. "Hello, and welcome to the Imbue Testbed![paragraph break][the red test text][paragraph break][the blue test text][paragraph break][the green test text]"

To say test object action: say (action for "a test object" name "test object" actions "examine" attributes "class='object'");

The test object is in the Imbue Testbed. "You see here [test object action].".
The description of the test object is "Yup, it's a test object alright!".
	