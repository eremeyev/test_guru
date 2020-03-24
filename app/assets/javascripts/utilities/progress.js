document.addEventListener('turbolinks:load', function(){
  var progressBar = document.querySelector('.my-progress');
  var currentState = document.querySelector('.current-state');
  if(progressBar !== null && currentState !== null){
    var step = parseInt(progressBar.dataset.step);
    var steps = parseInt(progressBar.dataset.steps);
    var progressBarWidth = 100; //%
    currentStateWidth = (progressBarWidth / steps) * step; //%
    progressBar.style = "height: 10px; border: 1px solid gray; width: " + progressBarWidth + "%; background-color: lightgray; border-radius: 0.25rem;";
    currentState.style = "height: 8px; width: " + currentStateWidth + "%; background-color: gray;";
  }
});


