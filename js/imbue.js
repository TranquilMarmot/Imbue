$(window).on('load', function() {
  // event to listen to lines being added
  $('.WindowFrame.BufferWindow').bind('DOMNodeInserted', function(event) { imbue.onNodeAdded(event); });

  // event to close action menu when clicking outside of it
  $(document).on('click', imbue.removeActionMenuOnClick);
});

imbue = {
  /** Called every time a node is added to the buffer window */
  onNodeAdded: function(event) {
    // currently, each BufferLine with actual text has the text in a span defining
    // what kind of text it is (normal, header, etc.)
    if(event.target.tagName == 'SPAN' && !event.target.newNode) {
      // TODO only do this to lines that actually have HTML (checking for a '<' good enough?)
      //      or is it faster to just do this to every node...? Maybe some tests are needed
      
      // naive but simple approach (for now)
      event.target.innerHTML = event.target.innerText;
 
      // if a node is inserted into this node as a result of setting the html,
      // it can cause the even to trigger again... no good!
      event.target.newNode = true;

      for(let i = 0; i < event.target.children.length; i++) {
        let child = event.target.children[i];

        if(child.tagName == 'A' && 
           child.dataset.name != undefined &&
           child.dataset.actions != undefined) {
          // action link
          child.addEventListener('click', imbue.onActionClicked);
        } else if(child.tagName == 'SCRIPT') {
          // execute any added javascript (*gasp* eval!)
          eval(child.innerText);
        }
      }
    }
  },

  /** Called when an action link is clicked */
  onActionClicked: function(event) {
    // if we're clicking the origin of the menu, just close it
    if(imbue.actionMenuOrigin == this) {
      imbue.removeActionMenu();
      return;
    }

    // remove any existing menu
    imbue.removeActionMenu();

    let menu = document.createElement('div');
    menu.classList.add('ActionList');

    // create menu for selecting an action
    let actions = this.dataset.actions.split(',');
    for(let i = 0; i < actions.length; i++) {
      let choice = document.createElement('a');

      choice.textContent = actions[i];
      choice.classList.add('ActionListItem');
      choice.setAttribute('href', '#');

      choice.dataset.action = actions[i];
      choice.dataset.name = this.dataset.name;

      menu.appendChild(choice);

      choice.addEventListener('click', function() {
        imbue.removeActionMenu();
        imbue.carryOut(
          this.dataset.action + ' ' + this.dataset.name
        );
      });
    }

    this.parentNode.insertBefore(menu, this);
    imbue.actionMenu = menu;
    imbue.actionMenuOrigin = this;

    event.preventDefault();
  },

  /**
    * Called whenever the document is clicked.
    * If the event's target isn't the action menu
    * or an ancestor of it, the action menu will be removed
    */
  removeActionMenuOnClick(event) {
    if(!$(event.target).closest('.ActionMenu').length &&
       !$(event.target).is('.ActionMenu, a'))
       {
          imbue.removeActionMenu();
       }
  },

  /**
   * Removes the action menu, if there is one.
   * Returns true if the menu was removed, false if there was no menu
   */
  removeActionMenu() {
    if(imbue.actionMenu) {
      imbue.actionMenu.parentNode.removeChild(imbue.actionMenu);
      imbue.actionMenu = undefined;
      imbue.actionMenuOrigin = undefined;
      return true;
    }

    return false;
  },

  /** Inputs the given command and submits it */
  carryOut(command) {
    let input = $('.Input.LineInput');
    input.val(command);
    input.trigger({ type: 'keypress', which: 13, keyCode: 13 }); // enter
  }
};
