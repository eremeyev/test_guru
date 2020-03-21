document.addEventListener('turbolinks:load', function(){
  var progressBar = document.querySelector('.my-progress');
  var currentState = document.querySelector('.current-state');
  var step = parseInt(progressBar.dataset.step);
  var steps = parseInt(progressBar.dataset.steps);

  var progressBarWidth = 100; //%
  currentStateWidth = (progressBarWidth / steps) * step; //%
  progressBar.style = "height: 10px; border: 1px solid gray; width: " + progressBarWidth + "%; background-color: lightgray; border-radius: 0.25rem;";
  currentState.style = "height: 8px; width: " + currentStateWidth + "%; background-color: gray;";
//  progressBar.class
//  if(controls.length) {
//    for(var i = 0; i < controls.length; i++) {
//      controls[i].addEventListener('click', formInlineLinkHandler)
//    };
//  
//    var errors = document.querySelector('.resource-errors')
//
//    if (errors) {
//      var resourceId = errors.dataset.resourceId;
//      formInlineHandler(resourceId)
//    }
//  }
});


