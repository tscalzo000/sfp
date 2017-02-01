function showcomment(){
  document.getElementById('div1').style.display="block";
  document.getElementById('writecomment').style.display='none';
}

function showfield(value){
  if(value=='Other')document.getElementById('div1').style.display="block";
  else document.getElementById('div1').style.display="none";
}

function hidefield() {
  document.getElementById('div1').style.display='none';
  if (document.getElementById('writecomment') !== null) {
    document.getElementById('writecomment').style.display='block';
  }
}
