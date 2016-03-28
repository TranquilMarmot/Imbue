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
      event.target.innerHTML = event.target.innerText;
    }
  }
};
