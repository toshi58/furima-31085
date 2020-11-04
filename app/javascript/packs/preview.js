document.addEventListener('DOMContentLoaded', function() {
  const clickUp = document.getElementById("click-up");

  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', 'image-element')
    let imageElementNum = document.querySelectorAll('.image-element').length

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);

    const imageBox = document.getElementById(`image_box_${imageElementNum}`)

    imageElement.appendChild(blobImage);
    imageBox.appendChild(imageElement);
  };

  const createWrapperHTML = () => {
    let imageElementNum = document.querySelectorAll('.image-element').length

    const uploadWrap = document.createElement('div');
    uploadWrap.setAttribute('class', 'upload-wrap')

    const box = document.createElement('div')

    const word = document.createElement('p')
    word.innerHTML = "クリックしてファイルをアップロード"

    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', `item_image_${imageElementNum - 1}`)
    inputHTML.setAttribute('name', 'item[images][]')
    inputHTML.setAttribute('type', 'file')

    const addImageBox = document.createElement('div');
    addImageBox.setAttribute('class', 'img-show')
    addImageBox.setAttribute('id', `image_box_${imageElementNum}`)

    // 次の画像を入れる場所を追加
    box.appendChild(word);
    box.appendChild(inputHTML);
    uploadWrap.appendChild(box);
    uploadWrap.appendChild(addImageBox);
    clickUp.appendChild(uploadWrap);
    // 次の画像を入れる場所を追加

    inputHTML.addEventListener('change', function(e) {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
      createWrapperHTML()
    });
  };

  document.getElementById('item-image').addEventListener('change', function(e) {
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob)
    createWrapperHTML()
  });
});