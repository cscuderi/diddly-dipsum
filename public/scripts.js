(function () {

  /**
   * Initialize the button and required functions.
   * @return {N/A}
   */
  let init = function() {
    buttonClickHandler();
  };

  /**
   * Validate input and call AJAX function when the button
   * is clicked.
   * @return {N/A}
   */
  let buttonClickHandler = function() {
    let numRequested;
    let button = document.getElementsByClassName('js-do')[0];

     // Make the request for diddly dipsum when the button is clicked.
     button.addEventListener('click', function(e) {
      e.preventDefault();

      // Get the value from the input
      numRequested = parseInt(document.getElementsByClassName('js-input')[0].value);

      // Validate
      if( Number.isInteger(numRequested) && numRequested > 0 ) {
        console.log('👍 Input is good');
        requestDiddlyDoodlies(numRequested);
      } else {
        console.warn('💩 Input is bad');
        alert('Gonna need a number from you!');
        return false;
      }
    });
  };

  /**
   * Request the diddly dipsum from the server.
   * @param  {integer} numDiddlies Number of paragraphs requested.
   * @return {string}              HTML formatted string of paragraphs.
   */
  let requestDiddlyDoodlies = function(numDiddlies) {
    httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {

        // Everything is good, the response is received
        let outputDiv = document.getElementsByClassName('js-output')[0];
        let selection = window.getSelection();
        let range = document.createRange();

        // Put the text in
        outputDiv.innerHTML = httpRequest.responseText;

        // Make the text wrapper visible
        document.getElementsByClassName('main')[0].classList += ' loaded';
        outputDiv.classList += ' is-visible';

        // Highlight the text
        range.selectNodeContents(outputDiv);
        selection.removeAllRanges();
        selection.addRange(range);
      }
    };

    // Make the AJAX request to get the text
    httpRequest.open('GET', 'http://127.0.0.1/diddlies/' + numDiddlies, true);
    httpRequest.send(null);
  };

  init();
})();
