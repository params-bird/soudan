// 画像選択後のファイル名反映
$(document).ready(function(){
  $('#filename').on("change", function() {
  var file = this.files[0];
  if(file != null) {
  document.getElementById("dummy_file").value = file.name;
  }
  });
});

$(function(){
  $fileField = $('#file')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});