window.onload = function(){
  set();
};

function set(){
	//Snap空間
	var paper = Snap(420,420).remove().attr({style:"-ms-user-select: none; -moz-user-select: -moz-none; -khtml-user-select: none; -webkit-user-select: none; user-select: none;"});
    //枠
    for(var i = 1; i < 9; i++){
        var line = paper.line(i*40+80,120,i*40+80,400).attr({stroke:"#000000" ,strokeWidth:1});
    }

    for(var i = 1; i < 9; i++){
        var line = paper.line(120,i*40+80,400,i*40+80).attr({stroke:"#000000" ,strokeWidth:1});
    }

    //村

    var villages = [
            [0,1,1,0,0,0,0],
            [1,1,0,1,1,1,0],
            [0,1,0,0,0,1,1],
            [0,1,0,0,1,0,1],
            [1,0,0,1,0,1,0],
            [0,1,0,1,0,0,0],
            [0,1,1,0,0,0,0],
        ];

    //村配置
for(var i = 0; i < 7; i++){
    for(var j = 0; j < 7; j++){
        if(villages[i][j] == 1){
            village = paper.polygon(140 + 40*j ,132 + 40*i,128 + 40*j,152 + 40*i,152 + 40*j,152 + 40*i).attr({fill:"#000065", stroke:"#none"});
        }

    }
}
  //スピーカー

for(var i = 0; i < 8; i++){
    for(var j = 0; j < 8; j++){

        //星と範囲の座標設定

        var x = 40 * i;
        var y = 40 * j;

        var cx = 120 + x;
        var cy = 120 + 40 * j;

        var sx1 = 120 + x;
        var sx2 = 117 + x;
        var sx3 = 110 + x;
        var sx4 = 115 + x;
        var sx5 = 113 + x;
        var sx6 = 120 + x;
        var sx7 = 127 + x;
        var sx8 = 125 + x;
        var sx9 = 130 + x;
        var sx10 = 123 + x;

        var sy1 = 110 + y;
        var sy2 = 116 + y;
        var sy3 = 116.5 + y;
        var sy4 = 122 + y;
        var sy5 = 129 + y;
        var sy6 = 126 + y;
        var sy7 = 129 + y;
        var sy8 = 122 + y;
        var sy9 = 116.5 + y;
        var sy10 = 116 + y;

        var No = "";
        No += i;
        No += j;

        //描画
        eval("var speaker" + No + " = paper.polygon("+sx1+","+sy1+","+sx2+","+sy2+","+sx3+","+sy3+","+sx4+","+sy4+","+sx5+","+sy5+","+sx6+","+sy6+","+sx7+","+sy7+","+sx8+","+sy8+","+sx9+","+sy9+","+sx10+","+sy10+").attr({id:'speaker' ,fill:'#f62921', stroke:'#none', fillOpacity:'0'});var s"+No+" = false;");
        eval("var circle" + No + " = paper.circle("+cx+","+cy+",15).attr({id:'circle',fill:'#ffffff',fillOpacity:'0',cursor:'pointer'});");
        eval("cover"+No+" = paper.polygon("+ (cx-40) +","+ (cy-80) +" ,"+ (cx-40) +","+ (cy-40) +" ,"+ (cx-80) +","+ (cy-40) +" ,"+ (cx-80) +","+ (cy+40) +" ,"+ (cx-40) +","+ (cy+40) +" ,"+ (cx-40) +","+ (cy+80) +" ,"+ (cx+40) +","+ (cy+80) +" ,"+ (cx+40) +","+ (cy+40) +" ,"+ (cx+80) +","+ (cy+40) +","+ (cx+80) +","+ (cy-40) +" ,"+ (cx+40) +","+ (cy-40) +" ,"+ (cx+40) +","+ (cy-80) +").attr({id:'cover' ,fill:'#cdcdcd',stroke:'none',fillOpacity:'0'});");
        eval("coverLine"+No+" = paper.polygon("+ (cx-40) +","+ (cy-80) +" ,"+ (cx-40) +","+ (cy-40) +" ,"+ (cx-80) +","+ (cy-40) +" ,"+ (cx-80) +","+ (cy+40) +" ,"+ (cx-40) +","+ (cy+40) +" ,"+ (cx-40) +","+ (cy+80) +" ,"+ (cx+40) +","+ (cy+80) +" ,"+ (cx+40) +","+ (cy+40) +" ,"+ (cx+80) +","+ (cy+40) +","+ (cx+80) +","+ (cy-40) +" ,"+ (cx+40) +","+ (cy-40) +" ,"+ (cx+40) +","+ (cy-80) +").attr({id:'coverLine' ,fill:'#cdcdcd',stroke:'#000000' ,strokeWidth:2 ,strokeOpacity:'0' ,fillOpacity:'0'});");
        eval("circle"+No+".click(function(){if(!s"+No+"){cover"+No+".attr({fillOpacity:'1'});coverLine"+No+".attr({strokeOpacity:'1'});speaker"+No+".attr({fillOpacity:'1'});s"+No+" = true;}else{cover"+No+".attr({fillOpacity:'0'});coverLine"+No+".attr({strokeOpacity:'0'});speaker"+No+".attr({fillOpacity:'0'});s"+No+" = false;}});");

    }
}

 //背景

 var background = paper.rect(39,39,442,80.5).attr({id:"background",fill:"#ffffff"});
 var background = paper.rect(39,39,80.5,442).attr({id:"background",fill:"#ffffff"});
 var background = paper.rect(400.5,39,80.5,442).attr({id:"background",fill:"#ffffff"});
 var background = paper.rect(39,400.5,442,80.5).attr({id:"background",fill:"#ffffff"});


 var background = paper.rect(39,39,442,80).attr({id:"background2",fill:"#ffffff"});
 var background = paper.rect(39,39,80,442).attr({id:"background2",fill:"#ffffff"});
 var background = paper.rect(39,401,442,80.5).attr({id:"background2",fill:"#ffffff"});
 var background = paper.rect(401,39,81,442).attr({id:"background2",fill:"#ffffff"});

    //ボタン
    var buttom = paper.rect(100,60,40,20,5,5).attr({fill:"#000000", stroke:"#000000" ,strokeWidth:1});
    var text  = paper.text(101,70,"リセット").attr({fill:"#ffffff", fontSize:"10px" ,textAnchor:"start", dominantBaseline:"middle"});

    var ResetButtom = paper.g(buttom,text).attr({id:"button",style:"cursor: pointer;"});


    ResetButtom.click(function(){
        $('#container').empty();
        set();
        location.href = "#container";
    });

    var container = document.querySelector("#container");
    paper.prependTo(container);
//オブジェクト操作でレイヤー?操作的な
    $("[id=cover]").prependTo("svg");
    $("[id=background]").appendTo("svg");
    $("[id=coverLine]").appendTo("svg");
    $("[id=background2]").appendTo("svg");
    $("[id=speaker]").appendTo("svg");
    $("[id=button]").appendTo("svg");
    $("[id=circle]").appendTo("svg");
}