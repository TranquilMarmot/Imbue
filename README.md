# Imbue

Imbue is a combination of a JavaScript plugin and (*eventually*) an Inform 7 plugin to add additional functionality to the already wonderful [Quixe](https://github.com/erkyrath/quixe/) interpreter to make reading web-based interactive fiction a little more beginner- and user-friendly.

### Current Features
- Allows for HTML in Inform 7 text that is rendered in a browser using Quixe

### Planned Features
- Inform 7 plugin for wrapping things in HTML tags and turning off HTML wrapping for doing non-web releases
- Built-in attributes that make it so that clicking on a noun will examine it, clicking on a room name will go in its direction, etc. (carrying out author-defined actions when clicking words)
- More mobile-friendly interactive fiction

### Usage
- Write some HTML in your Inform 7 code
- Release your Inform 7 project with an interpreter (put `Release along with an interpreter.` somewhere in your source text)
- Grab `imbue.js` from the `js` directory in this repo and copy it to the `[YOUR PROJECT].materials/Release/interpreter` folder
- In `[YOUR PROJECT].materials/Release/play.html` **underneath** `<script src="interpreter/jquery....."></script>` add:
  -    <script src="interpreter/imbue.js" type="text/javascript"></script>
- Play your game in your favorite web browser by opening `play.html` and see magic happen
- ???
- More coming soon!

### Notes
- Due to the way Inform 7 handles quotation marks, writing HTML is kind of funny, but intuitive if you're familiar with the language.
  - For example, to produce
  - `<span class="red">This is red text</span>`
  - you would write...
  - `say "<span class='red'>This is red text</span>"`
  - (note the single quotation marks- these are rendered by Inform 7 as double quotation marks)
- The first bit of text that gets printed currently won't be effected by Imbue since the event it registers to listen to added text isn't in effect right away.
- Quixe prints every line of content in a `div` with the `BufferLine` class. As such, multi-line HTML isn't supported right now (but support might be added later on)

### Why?
I've tried opening up the world of interactive fiction to many friends and family members, but there's a huge barrier of entry in learning how to play. Even playing them myself, it can get tedious typing in `x pig`, `n`, `e`, `look`, etc. and all the guesswork involved. So, I decided to create a way to make it easier on beginners to learn the basic syntax of interactive fiction and for authors to give better hints through rich text.

I was also pretty unsastsfied with the lack of custom text styles when writing with Inform 7 (especially when using Glulx, where you can only have two custom styles and they don't work in the browser) and decided I wanted something more powerful that HTML and CSS could easily deliver.

I've looked into alternatives such as [Undum](http://undum.com/) or [ChoiceScript](https://www.choiceofgames.com/make-your-own-games/choicescript-intro/), but nothing came close to the level of sophistication and adaptiveness of Inform 7 that keeps me coming back; writing interactive fiction in other languages just feels constrained.

### Links
- [Inform 7](http://inform7.com/)
- [Quixe](http://eblong.com/zarf/glulx/quixe/)
- [Interactive Fiction Database](http://ifdb.tads.org/)
