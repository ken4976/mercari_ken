$(function($){
  $('#input-price').keyup(function(){
    var numA = $('#input-price').val();
    // var numB = $('#input-price:eq(1)').val();
    //parseIntで文字列を数値に
    
    numA = parseInt(numA);
    // numB = parseInt(numB);
    //左側の入力値が数値では無い場合の処理
    if(!numA){
      //計算結果表示のinput内を削除
      $('#input-price').val('');
      return false;
    };
    $('#input-price1').val(numA*0.1);
    $('#input-price2').val(numA*0.9);
  });
});