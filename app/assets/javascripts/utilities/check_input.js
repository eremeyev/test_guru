document.addEventListener('turbolinks:load', function(){
  var input2 = document.querySelector('#user_password_confirmation');
  if (input2) { input2.addEventListener('keyup', checkInput) };
})

function checkInput(){
  var password = document.querySelector('#user_password');
  var password_confirmation = document.querySelector('#user_password_confirmation');
  
  if (password_confirmation.value == '') {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-x').classList.add('hide');
    return;
  }

  if (password_confirmation.value == password.value) {
    document.querySelector('.octicon-check').classList.remove('hide');
    document.querySelector('.octicon-x').classList.add('hide');
  } else {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-x').classList.remove('hide');
  }
}

