// 画像選択後のファイル名反映
$(document).ready(function(){
  $('#filename').on("change", function() {
  var file = this.files[0];
  if(file != null) {
  document.getElementById("dummy_file").value = file.name;
  }
  });
});