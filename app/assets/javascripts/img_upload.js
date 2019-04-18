
// 画像アプロード後に即プレビュー　ーーーーーーーーーーーーーーーーーーーーーーーーーー

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

$(function(){
  $fileField = $('#file_1')
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field_1");

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


$(function(){
  $fileField = $('#file_2')
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field_2");

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


$(function(){
  $fileField = $('#file_3')
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field_3");

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

// ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


// サイドバーアイコン　画像アップロード　即プレビューーーーーーーーーーーーーーーー

$(function(){
  $fileField = $('#avater')
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#side_avater");

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


// 画像アップロード前にトリミング　ーーーーーーーーーーーーーーー

$(function(){
  // cropper（トリミング部）のコーディング（詳しくはGitHub参照）
  var cropper;
  var croppable = false;
  function initIconCrop(){
    cropper = new Cropper(crop_img, {
      dragMode: 'move',
      aspectRatio: 1,
      restore: false,
      guides: true,
      center: false,
      highlight: false,
      cropBoxMovable: false,
      cropBoxResizable: false,
      // minCropBoxWidth: 300,
      // minCropBoxHeight: 200,
      ready: function(){
        croppable = true;
      }
    });
  }

  // croppedCanvas（トリミング後の画像をプレビューとして表示するための部分）のコーディング
  var croppedCanvas;
  function iconCropping(){

    croppedCanvas = cropper.getCroppedCanvas({
      width: 300,
      height: 200,
    });
    var croppedImage = document.createElement('img');
    croppedImage.src = croppedCanvas.toDataURL();
    img_field.innerHTML = '';
    img_field.appendChild(croppedImage);
  };

 // blobへ変換するためのコーディング（blobという形式で画像データを保存するため）
  var blob;
  function blobing(){
    if (croppedCanvas && croppedCanvas.toBlob){
      croppedCanvas.toBlob(function(b){
        blob = b;
        sending();
      });
    }else if(croppedCanvas && croppedCanvas.msToBlob){
      blob = croppedCanvas.msToBlob();
      sending();
    }else{
      blob = null;
      sending();
    };
  };

  // 画像選択時
  $('#upicon').on('change', function(e){
    file = e.target.files[0];
    reader = new FileReader();

    if(file.type.indexOf('image') < 0){
      return false;
    };

    // トリミング画面をフェードインさせる
    reader.onload = (function(e){
      $('.overlay').fadeIn();
      $('.crop_modal').append($('<img>').attr({
        src: e.target.result,
        height: "100%",
        class: "preview",
        id: "crop_img",
        title: file.name
      }));
      initIconCrop();
    });
    reader.readAsDataURL(file);
  });

  // トリミング決定時
  $('.select_icon_btn').on('click', function(){
    iconCropping();
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // トリミング画面を閉じる時
  $('.close_btn').on('click', function(){
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // コントローラーへ送信
  $('.post-btn').on('click', function(){
    blobing();
  });
});

// -------------------------------------------------------------
// 画像アップロード前にトリミング　ーーーーーーーーーーーーーーー

$(function(){
  // cropper（トリミング部）のコーディング（詳しくはGitHub参照）
  var cropper;
  var croppable = false;
  function initIconCrop(){
    cropper = new Cropper(crop_img, {
      dragMode: 'move',
      aspectRatio: 1,
      restore: false,
      guides: false,
      center: false,
      highlight: false,
      cropBoxMovable: false,
      cropBoxResizable: false,
      // minCropBoxWidth: 300,
      // minCropBoxHeight: 200,
      ready: function(){
        croppable = true;
      }
    });
  }

  // croppedCanvas（トリミング後の画像をプレビューとして表示するための部分）のコーディング
  var croppedCanvas;
  function iconCropping(){

    croppedCanvas = cropper.getCroppedCanvas({
      width: 300,
      height: 200,
    });
    var croppedImage = document.createElement('img');
    croppedImage.src = croppedCanvas.toDataURL();
    img_field_2.innerHTML = '';
    img_field_2.appendChild(croppedImage);
  };

 // blobへ変換するためのコーディング（blobという形式で画像データを保存するため）
  var blob;
  function blobing(){
    if (croppedCanvas && croppedCanvas.toBlob){
      croppedCanvas.toBlob(function(b){
        blob = b;
        sending();
      });
    }else if(croppedCanvas && croppedCanvas.msToBlob){
      blob = croppedCanvas.msToBlob();
      sending();
    }else{
      blob = null;
      sending();
    };
  };

  // 画像選択時
  $('#upicon_2').on('change', function(e){
    file = e.target.files[0];
    reader = new FileReader();

    if(file.type.indexOf('image') < 0){
      return false;
    };

    // トリミング画面をフェードインさせる
    reader.onload = (function(e){
      $('.overlay').fadeIn();
      $('.crop_modal').append($('<img>').attr({
        src: e.target.result,
        height: "100%",
        class: "preview",
        id: "crop_img",
        title: file.name
      }));
      initIconCrop();
    });
    reader.readAsDataURL(file);
  });

  // トリミング決定時
  $('.select_icon_btn').on('click', function(){
    iconCropping();
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // トリミング画面を閉じる時
  $('.close_btn').on('click', function(){
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // コントローラーへ送信
  $('.post-btn').on('click', function(){
    blobing();
  });
});

// -------------------------------------------------------------

$(function(){
  // cropper（トリミング部）のコーディング（詳しくはGitHub参照）
  var cropper;
  var croppable = false;
  function initIconCrop(){
    cropper = new Cropper(crop_img, {
      dragMode: 'move',
      aspectRatio: 1,
      restore: false,
      guides: false,
      center: false,
      highlight: false,
      cropBoxMovable: false,
      cropBoxResizable: false,
      // minCropBoxWidth: 300,
      // minCropBoxHeight: 200,
      ready: function(){
        croppable = true;
      }
    });
  }

  // croppedCanvas（トリミング後の画像をプレビューとして表示するための部分）のコーディング
  var croppedCanvas;
  function iconCropping(){

    croppedCanvas = cropper.getCroppedCanvas({
      width: 300,
      height: 200,
    });
    var croppedImage = document.createElement('img');
    croppedImage.src = croppedCanvas.toDataURL();
    img_field_3.innerHTML = '';
    img_field_3.appendChild(croppedImage);
  };

 // blobへ変換するためのコーディング（blobという形式で画像データを保存するため）
  var blob;
  function blobing(){
    if (croppedCanvas && croppedCanvas.toBlob){
      croppedCanvas.toBlob(function(b){
        blob = b;
        sending();
      });
    }else if(croppedCanvas && croppedCanvas.msToBlob){
      blob = croppedCanvas.msToBlob();
      sending();
    }else{
      blob = null;
      sending();
    };
  };

  // 画像選択時
  $('#upicon_3').on('change', function(e){
    file = e.target.files[0];
    reader = new FileReader();

    if(file.type.indexOf('image') < 0){
      return false;
    };

    // トリミング画面をフェードインさせる
    reader.onload = (function(e){
      $('.overlay').fadeIn();
      $('.crop_modal').append($('<img>').attr({
        src: e.target.result,
        height: "100%",
        class: "preview",
        id: "crop_img",
        title: file.name
      }));
      initIconCrop();
    });
    reader.readAsDataURL(file);
  });

  // トリミング決定時
  $('.select_icon_btn').on('click', function(){
    iconCropping();
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // トリミング画面を閉じる時
  $('.close_btn').on('click', function(){
    $('.overlay').fadeOut();
    $('#crop_img').remove();
    $('.cropper-container').remove();
  });

  // コントローラーへ送信
  $('.post-btn').on('click', function(){
    blobing();
  });
});
