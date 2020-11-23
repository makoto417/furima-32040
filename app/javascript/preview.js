if (document.URL.match( /new/ ) || document.URL.match( /edit/ ) || document.URL.match( /items/ ) )  {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    document.getElementById('item-image').addEventListener('change', function(e){     
      // 画像が表示されている場合、その画像を削除
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 選択した画像の表示
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'previewImg');

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
      
      // 画像サイズ変更
      const element = document.getElementById( "previewImg" ) ;
      element.onload = function () {
        const width = element.naturalWidth ;
        const height = element.naturalHeight ;
        
        element.width = 250;
        element.height = height * (element.width / width);
      };
    });
  });
}