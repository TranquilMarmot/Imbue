Version 1 of Imbue by Nate Moore begins here.

"Helpers for adding HTML to Inform 7 code. When released on the web and using imbue.js, will result in a rich-text interactive fiction experience."

Using Imbue is a truth state that varies. Using Imbue is usually true.

To say html for (tag - text) text (text - text) attributes (attributes - text):
	say "[if Using Imbue is true]<[tag] [attributes]>[text]</[tag]>[else][text][end if]";

To say span for (text - text) attributes (attributes - text):
	say (html for "span" text "[text]" attributes "[attributes]");	

To say action for (text - text) name (name - text) actions (action - text) attributes (attributes - text):
	say (html for "a" text "[if Using Imbue is true] [end if][text]" attributes "href='#' data-name='[name]' data-actions='[action]' [attributes]");

To say direction for (direction - text) text (text - text) attributes (attributes - text):
	say (html for "a" text "[if Using Imbue is true] [end if][text]" attributes "href='#' data-direction='[direction]' [attributes]");

To say javascript/js for (js - text):
	if Using Imbue is true:
		say html for "script" text js attributes "";

To say north link: say (direction for "north" text "north" attributes "");
To say east link: say (direction for "east" text "east" attributes "");
To say south link: say (direction for "south" text "south" attributes "");
To say west link: say (direction for "west" text "west" attributes "");
To say northeast link: say (direction for "northeast" text "northeast" attributes "");
To say southeast link: say (direction for "southeast" text "southeast" attributes "");
To say southwest link: say (direction for "southwest" text "southwest" attributes "");
To say northwest link: say (direction for "northwest" text "northwest" attributes "");

A thing has a text called inventory-properties.

To say imbue-inventory:
	repeat with i running from 1 to the number of things carried by the player:
		let item be entry i in the list of things carried by the player;
		say "{'name': '[item]'";
		if the inventory-properties of the item is not empty:
			say ",[inventory-properties of the item]";
		say "}";
		if i is not the number of things carried by the player:
			say ",";
		
Every turn when Using Imbue is true:
	say js for "imbue.setInventory(['][bracket][imbue-inventory][close bracket][']);";

Include (-

[ glk_send_external_event _vararg_count;
  ! glk_send_external_event(string)
  @glk 215 _vararg_count 0;
  return 0;
];

-) after "Glulx.i6t".

To execute javascript (js - text): (-
	glk_send_external_event( {js} );
-)

Imbue ends here.
