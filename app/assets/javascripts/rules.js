function addToRule(domId, item){
  $(domId).val(item);
}

function addValueToRule(domId, item, type){
  if(type === 'string'){
    var item = '\"' + item + '\"'
  }
  $(domId).val(item);
}
  
