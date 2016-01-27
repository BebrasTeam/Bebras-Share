window.onload = function(){
  set();
};

function set(){
  //Snap空間
  var paper = Snap(500,500).remove().attr({style:"-ms-user-select: none; -moz-user-select: -moz-none; -khtml-user-select: none; -webkit-user-select: none; user-select: none;"});

    ///////////////////////////////////////////////////////////////　　絵　　/////////////////////////////////////////////////////////////

    //蜂ロボ絵
    var needle = paper.path("m 333.81385,672.38259 39.06332,0 -20.12353,75.75917 -18.93979,-75.75917").attr({transform:"translate(6)",fill:"#000000",stroke:"#000000",strokeWidth:"4",strokeLinecap:"butt",strokeLinejoin:"miter",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var Leye = paper.path("m 331.42856,333.79074 a 30,24.285715 0 1 1 -60,0 30,24.285715 0 1 1 60,0 z").attr({transform:"matrix(1,0,0,-1,14.285714,664.72434)",fill:"#000000",stroke:"#646464",strokeWidth:"5",strokeLinecap:"square",strokeLinejoin:"round",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var Reye = paper.path("m 337.39096,334.14374 a 31.31473,25.253813 0 1 1 -62.62946,0 31.31473,25.253813 0 1 1 62.62946,0 z").attr({transform:"matrix(0.97614133,0,0,0.96183558,101.46342,9.7219431)",fill:"#000000",stroke:"#646464",strokeWidth:"5",strokeLinecap:"square",strokeLinejoin:"round",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var Lwing = paper.path("m 360.17774,486.90056 c 13.93254,-31.95539 43.61244,-56.58215 77.58979,-64.37974 24.70285,-5.66916 50.44127,-2.81609 75.70889,-0.83674 10.23484,0.80175 20.5072,1.45836 30.60472,3.31171 10.09751,1.85335 20.08071,4.94948 28.83531,10.31155 11.40392,6.98474 20.38983,17.73616 25.59495,30.05454 5.20512,12.31838 6.66019,26.13668 4.51642,39.33669 -2.14378,13.2 -7.83783,25.75832 -16.04901,36.31353 -8.21118,10.55521 -18.90127,19.11507 -30.82305,25.17371 -23.84355,12.11727 -52.15612,13.96548 -78.21717,7.95176 -26.06106,-6.01371 -49.98933,-19.48495 -70.76742,-36.3258 -18.00406,-14.59248 -33.88622,-31.79871 -46.99343,-50.91121").attr({fill:"#ffffff",fillOpacity:"0.35",stroke:"#646464",strokeWidth:"5",strokeLinecap:"butt",strokeLinejoin:"miter",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var Rwing = paper.path("m 349.82085,487.61092 c -13.62167,-32.3615 -43.38734,-57.44376 -77.58979,-65.3816 -24.69223,-5.73067 -50.44399,-2.90678 -75.70889,-0.84976 -20.47817,1.66729 -41.92596,3.09316 -59.44003,13.83526 -11.45379,7.02508 -20.49648,17.80442 -25.77186,30.16207 -5.27538,12.35764 -6.8129,26.22788 -4.74767,39.50478 2.06524,13.27689 7.68595,25.93685 15.84679,36.6112 8.16084,10.67435 18.82408,19.37004 30.74838,25.56294 23.84862,12.38578 52.29164,14.48658 78.51116,8.59581 26.21952,-5.89076 50.32272,-19.36564 71.15848,-36.33724 18.12476,-14.76338 34.02311,-32.25518 46.99343,-51.70346").attr({fill:"#ffffff",fillOpacity:"0.35",stroke:"#646464",strokeWidth:"5",strokeLinecap:"butt",strokeLinejoin:"miter",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var head = paper.path("m 420,408.07648 a 62.857143,61.42857 0 1 1 -125.71429,0 62.857143,61.42857 0 1 1 125.71429,0 z").attr({transform:"matrix(1,0,0,-1,0,816.15295)",fill:"#000000",stroke:"#646464",strokeWidth:"5",strokeLinecap:"square",strokeLinejoin:"round",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var body = paper.path("m 430.88028,552.23328 a 66.289276,140.27284 0 1 1 -132.57855,0 66.289276,140.27284 0 1 1 132.57855,0 z").attr({transform:"matrix(1.2904808,0,0,0.94567229,-109.85172,38.190481)",fill:"#fdfd00",stroke:"#000000",strokeWidth:"5",strokeLinecap:"square",strokeLinejoin:"round",strokeMiterlimit:"4",strokeOpacity:"1",strokeDasharray:"none"});

    var bodyline1 = paper.path("m 439.18845,537.91266 -56.64277,-13.77347 c -19.08501,-4.64078 -36.99867,-4.47751 -59.58937,1.23505 l -55.047,12.19552 8.57648,-34.79659 8.26819,-19.0412 c 56.87943,-14.38325 86.69089,-13.42618 139.45896,-1.86146 l 8.72302,19.47819 z").attr({transform:"translate(6)",fill:"#000000",stroke:"none"});

    var bodyline2 = paper.path("m 439.18845,576.56732 -56.64277,13.77347 c -19.08501,4.64078 -36.99867,4.47751 -59.58937,-1.23505 l -55.047,-12.19552 8.57648,34.79659 8.26819,19.0412 c 56.87943,14.38325 86.69089,13.42618 139.45896,1.86146 l 8.72302,-19.47819 z").attr({transform:"translate(6)",fill:"#000000",stroke:"none"});

    //座標軸
    var ordinate =  paper.line(148,0,148,500).attr({stroke:"#000000" ,strokeWidth:3 ,strokeOpacity:"0.3" ,strokeDasharray:"5 5"});
    var abscissa =  paper.line(0,268,500,268).attr({stroke:"#000000" ,strokeWidth:3 ,strokeOpacity:"0.3" ,strokeDasharray:"5 5"});

    var coordinates = paper.g(ordinate,abscissa).attr({id:"coordinates"});

    var rect = paper.rect(1,390,498,109).attr({id:"rect",fill:"#ffffff",stroke:"#000000",strokeWidth:"2"});

    //蜂の初期設定
    var beeX = 112;
    var beeY = 224;
    var beeR = 0;
    var beeActive = false;
    var beeTarget = "";
    var logNum = 0;

    //蜂の大きさ
    var scale = "scale(0.1,0.09) ";
    //蜂のグループの中心座標背定
    var center = ",36,44) ";

    var transformText = "translate(" + beeX + "," + beeY + ") rotate(" + beeR + center + scale;

    //蜂グルーピング
    var bee = paper.g(needle,Leye,Reye,Lwing,Rwing,head,body,bodyline1,bodyline2);
    bee.attr({id: "bee" ,transform: transformText});

    ///////////////////////////////////////////////////////////////　　蜂ロボ制御関数　　/////////////////////////////////////////////////////////////

    //蜂設定更新
    function setTransformText(){
        transformText = "translate(" + beeX + "," + beeY + ") rotate(" + beeR + center + scale;
    }

    //蜂ロボ回転
    function beeRotate(num , time){
       time = time || 400;
       beeR += num;
       setTransformText();
       bee.animate({transform: transformText },400);
    }

    //蜂ロボ前進&ライン引き
    function beeGo(draw){
       if(draw == 1){
        var drawon = false;
       }else{
        var drawon = true;
       }
       if(drawon){
            lineX = beeX + 36;
            lineY = beeY + 44;
            eval("var line = paper.line("+lineX+","+lineY+","+lineX+","+lineY+").attr({id:'line' ,stroke:'#1d985e' ,strokeWidth:3 , strokeLinecap: 'round'});");
            //lineが新たに書かれるのでオブジェクト操作でレイヤー?操作的な
            $("#outer").appendTo("svg");
            $("#rect").insertBefore("#log");
            $("#bee").insertBefore("#rect");
            $("[id=line]").insertBefore("#bee");
        }
       var Θ = ((beeR % 360)/180)* Math.PI;
       beeX += 100 * Math.sin(Θ);
       beeY -= 100 * Math.cos(Θ);

       setTransformText();
       bee.animate({transform: transformText },800);
       if(drawon){
            lineX += 100 * Math.sin(Θ);
            lineY -= 100 * Math.cos(Θ);
            eval("line.animate({x2: "+lineX+" ,y2:"+lineY+"},800);");
            //ラインの先端をポイントに
            beeTarget += Math.round(lineX);
            beeTarget += Math.round(lineY);
            beeTarget += ",";
       }
    }

    //進行方向チェック
    function beeCheck(){
        var Target = "";
        var Targets = beeTarget.split(",");
        lX = beeX + 36;
        lY = beeY + 44;
        var Θ = ((beeR % 360)/180)* Math.PI;
        lX += 100 * Math.sin(Θ);
        lY -= 100 * Math.cos(Θ);
        Target += Math.round(lX);
        Target += Math.round(lY);
        for(var i = 0 ; i<Targets.length ; i++ ){
            if(Targets[i] == Target){
                return true;
            }
        }
        return false;
    }

    //log生成
    function beeLog(str){
        //画面外まで行ったら生成しない
        if(logNum < 12){
            //一回目だけやじるし生成なし
            if(logNum != 0){
                //矢印
                var TextX = 527 + logNum*43;
                var logText = paper.text(TextX,480,"→").attr({fill:"#000000", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
                logText.animate({transform:"translate(-500)"},1000);
                logNum++;
            }
            //ログ
            var TextX = 520 + logNum*43;
            var logText2 = paper.text(TextX,480,str).attr({fill:"#000000", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle",id:"log"});
            logText2.animate({transform:"translate(-500)"},1000);
            logNum++;
        }
    }

    ///////////////////////////////////////////////////////////////　　ボタン　　/////////////////////////////////////////////////////////////

    //四角ボタン
    var Sbuttom = paper.rect(10,400,80,40,5,5).attr({fill:"#00BFFF", stroke:"#000000" ,strokeWidth:1});
    var Stext = paper.text(30,420,"四角").attr({fill:"#ffffff", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle"});

    var SquareButtom = paper.g(Sbuttom,Stext).attr({style:"cursor: pointer;"});

    SquareButtom.click(function(){
        if(!beeActive){
            beeActive = true;
            beeGo();
            setTimeout(function(){beeRotate(90);},1000);
            setTimeout(function(){beeGo();},1500);
            setTimeout(function(){beeRotate(90);},2500);
            setTimeout(function(){beeGo();},3000);
            setTimeout(function(){beeRotate(90);},4000);
            setTimeout(function(){beeGo();},4500);
            setTimeout(function(){beeRotate(90);},5500);
            setTimeout(function(){beeActive = false;},6000);
            beeLog("四角");
        }
    });

    //三角ボタン
    var Tbuttom = paper.rect(140,400,80,40,5,5).attr({fill:"#00BFFF", stroke:"#000000" ,strokeWidth:1});
    var Ttext = paper.text(160,420,"三角").attr({fill:"#ffffff", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle"});

    var TriangleButtom = paper.g(Tbuttom,Ttext).attr({style:"cursor: pointer;"});

    TriangleButtom.click(function(){
            if(!beeActive){
            beeActive = true;
            beeGo();
            setTimeout(function(){beeRotate(120);},1000);
            setTimeout(function(){beeGo();},1500);
            setTimeout(function(){beeRotate(120);},2500);
            setTimeout(function(){beeGo();},3000);
            setTimeout(function(){beeRotate(120);},4000);
            setTimeout(function(){beeActive = false;},4500);
            beeLog("三角");
        }
    });

    //進むボタン
    var Gbuttom = paper.rect(270,400,80,40,5,5).attr({fill:"#00BFFF", stroke:"#000000" ,strokeWidth:1});
    var Gtext = paper.text(290,420,"進む").attr({fill:"#ffffff", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle"});

    var GoButtom = paper.g(Gbuttom,Gtext).attr({style:"cursor: pointer;"});

    GoButtom.click(function(){
            if(!beeActive && beeCheck() ){
            beeActive = true;
            beeGo(1);
            setTimeout(function(){beeActive = false;},1000);
            beeLog("進む");
        }
    });

    //回るボタン
    var Trbuttom = paper.rect(400,400,80,40,5,5).attr({fill:"#00BFFF", stroke:"#000000" ,strokeWidth:1});
    var Trtext = paper.text(420,420,"回る").attr({fill:"#ffffff", fontSize:"20px" ,textAnchor:"start", dominantBaseline:"middle"});

    var TurnButtom = paper.g(Trbuttom,Trtext).attr({style:"cursor: pointer;"});

    TurnButtom.click(function(){
            if(!beeActive){
            beeActive = true;
            var stop = false;
            var t = true;
            beeRotate(30,50);
            if(beeCheck()){beeLog("回る");}else{
                for(var i = 1; i < 12; i++) {
                    (function(local){ // serTimeout をfor内で使うときはこんな感じ
                     setTimeout(function(){
                        if(beeCheck() || stop){
                            stop = true;
                            if(t){
                                    beeLog("回る");
                                    t = false;
                                }
                            }else{
                                beeRotate(30,50);
                            }
                        },50*local);
                    }(i));
                }
          }
        setTimeout(function(){beeActive = false;},600);
      }
    });

    //リセットボタン
    var buttom = paper.rect(10,10,50,20,5,5).attr({fill:"#000000", stroke:"#000000" ,strokeWidth:1});
    var text  = paper.text(15,20,"リセット").attr({fill:"#ffffff", fontSize:"10px" ,textAnchor:"start", dominantBaseline:"middle"});

    var ResetButtom = paper.g(buttom,text).attr({style:"cursor: pointer;"});

    ResetButtom.click(function(){
        $('#container').empty();
        set();
        location.href = "#container";
    });

    var outer = paper.g(ResetButtom,SquareButtom,TriangleButtom,GoButtom,TurnButtom).attr({id:"outer"});

//HTMLに挿入
    var container = document.querySelector("#container");
    paper.prependTo(container);
}
