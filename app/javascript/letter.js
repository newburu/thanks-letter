// Canvas準備
const canvasDom = document.getElementById("canvas_letter");
const context = canvasDom.getContext("2d");

// テキストボックス
const textBox = document.getElementById("letter_content");

// canvas情報
let canvasWidth = 820; //canvasの横幅
let canvasHeight = 620; //canvasの縦幅

// 入力エリア情報
let fontSize = 30; // フォントサイズ
let rowCharCnt = 24; //一行あたりの文字数
let rowCnt = 11; //行数
let rowGap = 10; // 行間隔
let startTop = 80; // 入力開始位置(縦)
let startLeft = 50; // 入力開始位置(横)

// 背景画像
const bgImg = new Image();

// 種類セレクト
const selectLetterImage = document.getElementById("letter_letter_image_id");
bgImg.src = selectLetterImage.options[selectLetterImage.selectedIndex].dataset.imagePath;

// 種類変更時に呼び出す
selectLetterImage.addEventListener("change", function() {
    changeLetterImage();
});

function changeLetterImage() {
    const opt = selectLetterImage.options[selectLetterImage.selectedIndex];
    canvasWidth = parseInt(opt.dataset.width);
    canvasHeight = parseInt(opt.dataset.height);
    fontSize = parseInt(opt.dataset.fontSize);
    rowCharCnt = parseInt(opt.dataset.rowCharCnt);
    rowCnt = parseInt(opt.dataset.rowCnt);
    rowGap = parseInt(opt.dataset.rowGap);
    startTop = parseInt(opt.dataset.startTop);
    startLeft = parseInt(opt.dataset.startLeft);
    bgImg.src = opt.dataset.imagePath;
    changeScale();
    drawText();
}

// Submitボタン
const submitButton = document.getElementById("letter_submit");

// 画面ロード完了
window.onload = () => {
    changeLetterImage();
}

// 背景画像読込後にCanvasに描画
bgImg.onload = () => {
    context.drawImage(bgImg, 0, 0);
    changeScale();
    drawText();
}

// 画面サイズ変更時に描画処理を呼び出す
window.addEventListener("resize", function() {
    changeScale();
    drawText();
});

// サイズ変更処理
function changeScale() {
    // サイズを画面に合わせる変更
    canvasDom.width = document.body.offsetWidth * 0.8;
    // 縮小
    const scale = canvasDom.width / canvasWidth;
    canvasDom.height = canvasHeight * scale;
    context.scale(scale, scale);
}

// 文字入力時に描画処理を呼び出す
textBox.addEventListener("input", function() {
    drawText();
});

// 描画処理
function drawText() {
    const text = textBox.value;
    // canvasリセット
    context.clearRect(0, 0, canvasWidth, canvasHeight);
    // 背景画像描画
    context.drawImage(bgImg, 0, 0);

    //canvasの文字データを設定
    context.textAlign = 'left';
    context.fillStyle = 'black';
    context.font = fontSize + 'px meiryo';
    context.textBaseline = 'hanging';

    // 入力文字を1文字毎に配列化
    const aryText = text.split('');

    // 出力用の配列を用意
    const aryRow = [];
    aryRow[0] = '';
    let rowIdx = 0;

    // 入力1文字毎にループ　改行コードもしくは折り返しで配列の添え字を足す
    aryText.forEach(text => {
        if (aryRow[rowIdx].length >= rowCharCnt) {
            rowIdx++;
            aryRow[rowIdx] = '';
        }
        if (text == "\n") {
            rowIdx++;
            aryRow[rowIdx] = '';
            text = '';
        }
        aryRow[rowIdx] += text;
    });

    //文字の表示　y軸とx軸をループする
    for (let i = 0; i < aryRow.length; i++) {
        aryStr = aryRow[i].split('');
        for (let j = 0; j < aryStr.length; j++) {
            context.fillText(aryStr[j], startLeft + (j * fontSize), startTop + (i * (fontSize + rowGap)));
        }
    }
}

// 保存処理
submitButton.addEventListener('click', async() => {
    // 画像変換
    let imageBlob = await new Promise(resolve => canvasDom.toBlob(resolve, 'image/png'));

    const form = document.getElementById('letter_form');
    const formData = new FormData(form);
    formData.append("letter[image]", imageBlob, "letter.png");
    // CSRF対策
    const token = document.getElementsByName("csrf-token")[0].content;
    // データを送信
    const response = await fetch(form.action, {
        method: 'POST',
        headers: {
            'X-CSRF-Token': token,
        },
        body: formData
    });
    if (response.ok) {
        // 送信後、編集画面に移動します。
        let location = window.location.replace(response.url)
    } else {
        form.submit();
    }

});