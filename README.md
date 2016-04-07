# Imbue

Imbue is a combination of a JavaScript plugin and an Inform 7 plugin to add additional functionality to the already wonderful [Quixe](https://github.com/erkyrath/quixe/) interpreter. Imbue aims to make reading web-based interactive fiction a little more beginner- and user-friendly while maintaining author sanity.

See it in action at [https://tranquilmarmot.github.io/Imbue](https://tranquilmarmot.github.io/Imbue)

### Current Features
- Allows for HTML in Inform 7 text that is rendered in a browser using Quixe
- Inform 7 extension for wrapping things in HTML tags with the ability to turn off HTML wrapping for non-web releases
- Built-in attributes that make it so that clicking on a noun will examine it, clicking on a room name will go in its direction, etc. (carrying out author-defined actions when clicking words)
- Multi-select menu for nouns that have multiple actions

### Using the JavaScript plugin
- Write some HTML in your Inform 7 code (see below for how to use the extension)
- Release your Inform 7 project with an interpreter (put `Release along with an interpreter.` somewhere in your source text)
- Grab `imbue.js` from the `js` directory and `imbue.css` from the `css` directory in this repo and copy them to your `[YOUR PROJECT].materials/Release/interpreter` folder
- If you want, you can also replace your `play.html` with `imbue_play.html` from the `html` directory.
  - `imbue_play.html` has extra buttons at the bottom for `look`, `inventory`, `wait`, `save`, and `restore` to make everything even more accesable
    - It's super easy to add to these buttons- they're all defined towards the bottom of `imbue_play.html` (eventually there might be a way to add/remove them programmatically)
    - This is a more stripped-down and basic version of the HTML inclued with the default release
  - There's also a `imbue-style.css` to replace the default `style.css`. Not *stricly* necessary, but recommended.
- In `[YOUR PROJECT].materials/Release/play.html` **underneath** `<script src="interpreter/jquery....."></script>` add these two lines:
  - `<script src="interpreter/imbue.js" type="text/javascript"></script>`
  - `<link rel="stylesheet" href="interpreter/imbue.css" type="text/css">`
- Play your game in your favorite web browser by opening `play.html` or `imbue-play.html` and see magic happen!
- **NOTE:** Every time you release your game, Inform will overwrite your `play.html`, but will not erase any files that you have added to your `[YOUR PROJECT].materials` folder. So, using `imbue_play.html` or renaming your `play.html` will prevent you from having to add the Imbue script to it on every release.

### Using the Inform 7 extension
- Grab `Imbue.i7x` from the `inform` folder
- In Inform 7, go to File -> Install Extension... and then choose `Imbue.i7x` (this should copy the file to Inform 7's install directory)
- Add `Include Imbue by Nate Moore.` to your source text
- Once you're using the extension there are a few ways to generate HTML...
  - **To create any HTML tag**, use `(html for [TAG TO USE (i.e. div, strong, etc)] text [TEXT INSIDE TAG] attributes [ATTRIBUTES TO ADD (i.e. class="bar")]);`
    - For example, `To say the strong text: say (html for "strong" text "foo" attributes "class='bar'");` (note the single quote!)
    - Then, in regular text, `"You see here a plaque with [the strong text] written on it"`
      - This would be rendered as `You see here a plaque with <strong class="bar">foo</strong> written on it`
  - **To create a `span`**, use `(span for [TEXT INSIDE SPAN] attributes [ATTRIBUTES TO ADD]);`
    - For example, `To say blood red text: say (span for "blood red text" attributes "class='red'");`
    - Then, in regular text, `"You see here some [red test text]."`
      - This would be rendered as `You see here some <span class="red">blood red text</span>.`
  - **To create an action link**, use `(action for [TEXT INSIDE ACTION LINK] name [NAME OF TO NOUN ACT ON] actions [AVAILABLE ACTIONS TO USE ON OBJECT (**comma separated!**)] attributes [ATTRIBUTES TO ADD]);`
    - For example,
    - `To say the banana link: say (action for "a banana" name "banana" actions "examine,take,eat" attributes "class='object'");`
    - It's also useful to do something like `The printed name of the banana is "[banana-link]"`
    - `The banana is in the hallway. "You see [banana] on the ground, ripe for eating."`
      - This will render as `You see <a href="#" class="object" data-name="banana" data-actions="examine,take,eat">a banana</a> on the ground, ripe for eating.`
      - When the user clicks on this link, a small window will appear with the actions list. Clicking on an action will carry it out (i.e. `take banana` or `eat banana`)
  - **To create a direction link**, use `(direction for [DIRECTION TO MOVE] text [TEXT OF LINK] attributes [ATTRIBUTES TO ADD]);`
    - For example, `to say the northern lights link: say (direction for "north" text "the northern lights" attributes "class='direction'");`
    - Then, in regular text, `"To the north you see [the northern lights link], shining bright in the sky."`
      - This would be rendered as `To the north you see <a href="#" class="direction" data-direction="north">the northern lights</a>, shining bright in the sky.`
    - **There are also simple direction helpers buillt-in for all eight directions**
      - i.e. `say "To the [north link], [south link], [southeast link], and [northwest link] you see nothing but trees."`
      - These will simply render as the text of the direction with a link going in that direction. (`[north link]` is the same as `say (direction for "north" text "north" attributes "");`)
  - **To disable HTML output** add `Using Imbue is false.` to your source text. This will disable all HTML output from the extension and instead simply output the text that would be inside the HTML nodes. This is useful for testing your game from within Inform 7, and for creating releases meant to be played in a regular interpreter (that is, not in a browser and not with the JavaScript plugin)

### Notes
- Due to the way Inform 7 handles quotation marks, writing HTML is kind of funny, but intuitive if you're familiar with the Inform 7 language.
  - For example, to produce
  - `<span class="red">This is red text</span>`
  - you would write...
  - `say "<span class='red'>This is red text</span>"`
  - (note the single quotation marks- these are rendered by Inform 7 as double quotation marks)
- The first bit of text that gets printed currently won't be effected by Imbue since the event it registers to listen to added text isn't in effect right away.
- Quixe prints every line of content in a `div` with the `BufferLine` class. As such, multi-line HTML isn't supported right now (but support *might* be added later on)

### Why?
I've tried opening up the world of interactive fiction to many friends and family members, but there's a huge barrier of entry in learning how to play. Even playing them myself, it can get tedious typing in `x pig`, `n`, `e`, `look`, etc. and all the guesswork involved. So, I decided to create a way to make it easier on beginners to learn the basic syntax of interactive fiction and for authors to give better hints through rich text.

I was also pretty unsastsfied with the lack of custom text styles when writing with Inform 7 (especially when using Glulx, where you can only have two custom styles and they don't work in the browser) and decided I wanted something more powerful that HTML and CSS could easily deliver.

I've looked into alternatives such as [Undum](http://undum.com/) or [ChoiceScript](https://www.choiceofgames.com/make-your-own-games/choicescript-intro/) or [Twine](https://twinery.org/), but nothing came close to the level of sophistication and adaptiveness of Inform 7 that keeps me coming back; writing interactive fiction in other languages just feels constrained.

### Links
- [Inform 7](http://inform7.com/)
- [Quixe](http://eblong.com/zarf/glulx/quixe/)
- [Interactive Fiction Database](http://ifdb.tads.org/)
