$(window).on('load', function() {
  $('.WindowFrame.BufferWindow').bind('DOMNodeInserted', function(event) { imbue.onNodeAdded(event); });
});

imbue = {
  /** Called every time a node is added to the buffer window */
  onNodeAdded: function(event) {
    // currently, each BufferLine with actual text has the text in a span defining
    // what kind of text it is (normal, header, etc.)
    if(event.target.tagName == 'SPAN') {
      // naive but simple approach (for now)
      // TODO only do this to lines that actually have HTML (checking for a '<' good enough?)
      //      or is it faster to just do this to ever node...? Maybe some tests are needed
      event.target.innerHTML = event.target.innerText;

      for(let i = 0; i < event.target.children.length; i++) {
        let child = event.target.children[i];
        
        // execute any added javascript (*gasp* eval!)
        if(child.tagName == 'SCRIPT') {
          eval(child.innerText);
          //event.target.parentNode.parentNode.removeChild(event.target.parentNode);
        }
      }
    }
  }
};
