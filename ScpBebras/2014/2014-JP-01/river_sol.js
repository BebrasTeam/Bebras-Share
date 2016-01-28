window.onload = function(){
  set();
};

function set(){

  //Snap空間
  var ans = Snap(630,500).remove();
  //初期体力
  var life = 15;

  //初期設定  
  var logNum=0;
  //現在位置
  var status = 0;
  var lastStatus = 0;
  //リセットボタン配置
  var reset = ans.rect(0,10,60,25,5,5).attr({fill:"#000000", stroke:"#000000" ,strokeWidth:1});
  var resetText  = ans.text(10,23,"リセット").attr({fill:"#ffffff", fontSize:"10px" ,textAnchor:"start", dominantBaseline:"middle"});
  var resetButtom = ans.g(reset,resetText).attr({style:"cursor: pointer;"});
  //初期画像読み込み
  ans.image("river.png", 0,80);
  ans.image("flag.png", 33,377);
  var bebras = ans.image("bebras.png", 20, 380);

  var river = [
                [0,1,1,0,0,0,0], //スタート
                [1,0,0,1,0,0,0], //A
                [1,0,0,1,0,0,0], //B
                [0,1,1,0,1,1,0], //C
                [0,0,0,1,0,1,1], //D
                [0,0,0,1,1,0,1], //E
                [0,0,0,0,1,1,0], //ゴール
                ];
  //通過したかどうかの判定(スタートは既にいる設定 1:到達、0:未到達)
  var check = [1,0,0,0,0,0,0];
  
  //メイン関数 
  function main(){
    buttomDelete();
    list();
    presentLife();
    flag();
  }
   logStart("スタート");
  main();

      //log生成
      function log(str){
        //矢印
        var tx = 677 + logNum*30;
        var directLog = ans.text(tx,60,"→").attr({fill:"#000000", fontSize:"18px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
        directLog.animate({transform:"translate(-600)"},1500);
        logNum++;
        //ログ
        var tx = 670 + logNum*30;
        var pointLog = ans.text(tx,60,str).attr({fill:"#000000", fontSize:"18px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
        pointLog.animate({transform:"translate(-600)"},1500);
        logNum++;
      }

      //log生成
      function logStart(str){
        //ログ
        var logText2 = ans.text(600,60,str).attr({fill:"#00000", fontSize:"16px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
        logText2.animate({transform:"translate(-600)"},1500);
      }

      //log生成
      function logGoal(str){
        //矢印
        var tx = 677 + logNum*30;
        var directLog = ans.text(tx,60,"→").attr({fill:"#000000", fontSize:"18px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
        directLog.animate({transform:"translate(-600)"},1500);
        logNum++;
        //ログ
        var TTT = 670 + logNum*30;
        var goalLog = ans.text(TTT,60,str).attr({fill:"#", fontSize:"18px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
        goalLog.animate({transform:"translate(-600,0)"},1500);
        logNum++;
      }

  //今いる場所から行ける場所を出す処理
  function list(){
    for(var j=0; j<7; j++){
      if(river[status][j] && !check[j]){
        switch(j) {
          case 1:
          if(status<3){
            var pointA = ans.rect(140,290,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
            var pointAText  = ans.text(145,305,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom");
            var pointAButtom = ans.g(pointA,pointAText).attr({style:"cursor: pointer;"}).addClass("buttom");
            //ボタンAの処理
            pointAButtom.click(function(){
              pointAButtom.clear();
              life -= 2;
              status = 1;
              check[status] = 1;
              bebras.animate({transform:"translate(120,-100)"},1500);
              log("A点");
              setTimeout(function(){main()},2000);
            });
          }
          break;
          case 2:
          if(status<3){
            var pointB = ans.rect(160,405,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
            var pointBText  = ans.text(165,420,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom");
            var pointBButtom = ans.g(pointB,pointBText).attr({style:"cursor: pointer;"}).addClass("buttom");
            //ボタンBの処理
            pointBButtom.click(function(){
              pointBButtom.clear();
              life -= 3;
              status = 2;
              check[status] = 1;
              bebras.animate({transform:"translate(140,15)"},1500);
              log("B点");
              setTimeout(function(){main()},2000);
            });
          }
          break;
          case 3:
          var pointC = ans.rect(275,300,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
          var pointCText  = ans.text(280,315,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom");
          var pointCButtom = ans.g(pointC,pointCText).attr({style:"cursor: pointer;"});
          //ボタンCの処理
          pointCButtom.click(function(){
            pointCButtom.clear();
            if(status == 1){
              life -= 5;
            }else{
              life -= 3;
            }
            bebras.animate({transform:"translate(255,-90)"},1500);
            status = 3;
            check[status] = 1;
            log("C点");
            setTimeout(function(){main()},2000);
          });
          break;
          case 4:
          if(status< 6){
            var pointD = ans.rect(370,190,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
            var pointDText  = ans.text(375,205,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom").addClass("buttom");
            var pointDButtom = ans.g(pointD,pointDText).attr({style:"cursor: pointer;"}).addClass("buttom").addClass("buttom");
            //ボタンDの処理
            pointDButtom.click(function(){
              pointDButtom.clear();
              life -= 2;
              status = 4;
              check[status] = 1;
              bebras.animate({transform:"translate(350,-200)"},1500);
              log("D点");
              setTimeout(function(){main()},2000);
            });
          }
          break;
          case 5:
          if(status < 6){
            var pointE = ans.rect(405,320,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
            var pointEText  = ans.text(410,335,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom");
            var pointEButtom = ans.g(pointE,pointEText).attr({style:"cursor: pointer;"}).addClass("buttom");
            //ボタンEの処理
            pointEButtom.click(function(){
              pointEButtom.clear();
              if(status == 3){
                life -= 5;
              }else{
                life -= 2;
              }
              status = 5;
              check[status] = 1;
              bebras.animate({transform:"translate(385,-70)"},1500);
              log("E点");
              setTimeout(function(){main()},2000);
            });
          }
          break;
          case 6:
          var goal = ans.rect(525,125,60,30,5,5).attr({fill:"#aaaaaa", stroke:"#aaaaaa" ,strokeWidth:1}).addClass("buttom");
          var goalText  = ans.text(530,140,"移動する").attr({fill:"white", fontSize:"12px" ,textAnchor:"start", dominantBaseline:"middle"}).addClass("buttom");
          var goalButtom = ans.g(goal,goalText).attr({style:"cursor: pointer;"}).addClass("buttom");
          //ゴールボタンの処理
          goalButtom.click(function(){
            goalButtom.clear();
            if(status == 4){
              life -= 8;
            }else{
              life -= 5;
            }
            status = 6;
            check[status] = 1;
            bebras.animate({transform:"translate(505,-265)"},1500);
            logGoal("ゴール");
            setTimeout(function(){main()},2000);
          });
          break;
        }
      }
    }
  }

   //到達地点に旗を出す
   function flag(){
    for(var i=0; i<7; i++){
      if(check[i]){
       switch(i) {
        case 1: ans.image("flag.png", 153,258);
        break;
        case 2: ans.image("flag.png", 174,374);
        break;
        case 3: ans.image("flag.png", 287,270);
        break;
        case 4: ans.image("flag.png", 383,155);
        break;
        case 5: ans.image("flag.png", 417,287);
        break;
        case 6: ans.image("flag.png", 540,90);
        break;
      }
    }
  }
}

  //ボタンリセット
  function buttomDelete(){
    $(".buttom").each(function(i){
      $(this).remove();
    });
  }
  
  //現在の葉っぱ出力処理
  function presentLife(){
    if(life >= 0){
      if(status == 6){
        $("#status").text("CLEAR");
      }else{
        $("#status").text("残り体力: 枝 " + life + " 本分");
      }      
    }else{
      $("#status").text("GAME OVER");
    }
  }

  //リセット処理
  resetButtom.click(function(){
    $('#container').empty();
    set();
  });

  //HTML書き出し
  var container = document.querySelector("#container");
  ans.prependTo(container);
}
