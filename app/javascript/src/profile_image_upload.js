$(document).on("change", "#profile_image_upload", function(e) { //#profile_image_uploadがchangeしたら
    if (e.target.files.length) {　 //ファイルの有無
        let reader = new FileReader; //非同期で読み込める
        reader.onload = function(e) { //renderが読み込まれたらremove class
            $('.hidden').removeClass();
            $('.profile-default-img').removeClass();
            $('#profile-img').remove();
            $('#profile-img-prev').attr('src', e.target.result); //imgのsrcにアップロードしたファイルを設定
        };
        return reader.readAsDataURL(e.target.files[0]);　 //読み込んで返す
    }
});