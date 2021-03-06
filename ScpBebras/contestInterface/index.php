<?php
  include('./config.php');
  header('Content-type: text/html');
?><!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title data-i18n="general_page_title"></title>
<?php stylesheet_tag('/style.css'); ?>
</head><body>
<form autocomplete="off">
<div id="divHeader">
     <table style="width:100%"><tr>
         <td style="width:20%" data-i18n="[html]left_title"></td>
         <td><p id="headerH1" data-i18n="general_title"></p>
         <!-- <p id="headerH2" data-i18n="general_subtitle"></p></td> -->
         <td style="width:20%" data-i18n="[html]right_title"></td>
      </tr></table>

</div>

<div id="intro">

  <p id="headerH2">ビーバーコンテストについて</p>

  <p>
    <a href="https://www.ioi-jp.org">情報オリンピック日本委員会</a><a href="https://www.ioi-jp.org/junior/">ジュニア部会</a>では,
    数理情報科学教育の裾野を広げる目的から,
    中高生及び小学生を対象とした国情報科学コンテストを日本で開催しております.<br>
    このコンテストは,
    <a href="www.bebras.org">Bebras</a>
    — International Challenge on Informatics and Computational Thinking
    という名称で欧州を中心に普及が進んでいるコンピュータ科学と Computational Thinking
    に関する児童・生徒向けのコンテストです.
    2014年は，35カ国から92万人の児童・生徒が参加しました.
    Bebras は, リトアニア語で「ビーバー」のことで，ビーバーはリトアニアでは賢く勤勉な動物と思われているそうです.
  </p>
  <ul>
    <li> Bebras Challenge 公式サイト <a href="http://www.bebras.org/">http://www.bebras.org/</a>  (英語) </li>
    <li> ビーバーコンテスト情報ページ <a href="http://bebras.eplang.jp/">http://bebras.eplang.jp/</a></li>
  </ul>

  <p id="headerH2">このサイトについて</p>
  <p>
      本サイトは,
      終了したビーバコンテストにチャレンジできる環境提供の試みです（試行公開中です）.
    </P>
   <p> 本サイト, および, ビーバーコンテストに関するご質問やご相談は, 次のメールアドレスにご連絡ください:</br>
      bebras-jp@googlegroups.com
    </p>
    <p> <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png" /></a> <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bebras - International Challenge on Informatics and Computational Thinking</span> 作『<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">ビーバーコンテストの問題</span>』は<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">クリエイティブ・コモンズ 表示 - 非営利 - 継承 4.0 国際 ライセンス</a>で提供されています. </p>
    </br>


  <p id="headerH2">コンテストを受ける</p>

</div>

<div id="divCheckGroup" class="dialog">
   <!-- <p data-i18n="[html]general_instructions"> -->
   </p>
   <p>
   <b data-i18n="general_choice"></b>
   </p>
   <button type="button" id="button-school" class="tabButton selected" onclick="selectMainTab('school');return false;" data-i18n="[html]general_start_contest"></button>
   <button type="button" id="button-home" class="tabButton" onclick="selectMainTab('home');return false;" data-i18n="[html]general_public_contests"></button>
   <button type="button" id="button-continue" class="tabButton" onclick="selectMainTab('continue');return false;" data-i18n="[html]general_view_results"></button>
   <div id="tab-home" style="display:none">
      <!-- Display the first div during the contest week -->
      <div id="warningPublicGroups" style="display:none;background:#F33;width:650px;text-align:center;padding:5px;margin:10px">
         <p><b data-i18n="tab_home_warning_not_contest"></b></p>
         <button type="button" onclick="selectMainTab('school');return false;" data-i18n="[html]tab_home_button_wrong_choice"></button>
         <button type="button" onclick="confirmPublicGroup();return false;" data-i18n="[html]tab_home_button_confirm_choice"></button>
      </div>
      <div id="publicGroups" style="display:block">
         <span id="loadPublicGroups" style="color:red" data-i18n="tab_public_loading"></span>
         <div id="contentPublicGroups" style="display:none;width:800px">
            <p><b data-i18n="[html]tab_public_contests_info"></b></p>
            <p data-i18n="tab_public_contests_score_explanation"></p>
            <div id="listPublicGroups">
            </div>
            <p data-i18n="[html]tab_public_contests_organization"></p>
         </div>
      </div>
   </div>
   <div id="tab-school">
<!--      <p>Pour <b>voir votre score détaillé</b> si vous avez participé au concours 2012, cliquez sur "Continuer le concours" et saisissez votre code personnel fourni au début de l'épreuve. Vous aurez aussi accès aux réponses et à une <b>correction détaillée</b> en dessous de chaque question.</p>
      <h3>Vous démarrez un concours en classe, pour la première fois ?</h3>-->
      <p data-i18n="tab_start_contest_enter_code"><br />
         <div id="divInput">
            <input id="groupCode" type="text"/>
               &nbsp;&nbsp;&nbsp;<button type="button" id="buttonCheckGroup" onclick="checkGroup()" data-i18n="tab_start_contest_start_button"></button>
               <br /><span id="CheckGroupResult" style="color:red"></span>
         </div>
      </p>
      <div id="recoverGroup" style="display:none;">
         <p data-i18n="[html]group_session_expired_recover"></p>
         <input id="recoverGroupPass" type="password"/>
         &nbsp;&nbsp;&nbsp;<button type="button" id="buttonRecoverGroup" onclick="recoverGroup()" data-i18n="submitPass"></buton>
         <br><span id="recoverGroupResult" style="color:red"></span>
         <p data-i8n="[html]others_retry"></p>
      </div>
   </div>
   <div id="tab-continue" style="display:none">
      <p><span data-i18n="tab_view_results_access_code"></span>
         <div id="divInput">
            <input id="interruptedPassword" type="password">
            &nbsp;&nbsp;&nbsp;<button type="button" id="buttonInterrupted" onclick="checkPasswordInterrupted()" data-i18n="tab_view_results_view_results_button"></button>
            <br/><span id="InterruptedResult" style="color:red"></span>
          </div>
      </p>
      <p data-i18n="tab_view_results_info_1"></p>
      <p><b data-i18n="tab_view_results_info_2"></b></p>
      <!--<p>Si vous ne disposez pas de mot de passe mais que vous êtes en classe, alors entrez le code de groupe fourni par votre enseignant.</p>-->
      <p data-i18n="tab_view_results_info_3"></p>
      <p data-i18n="tab_view_results_info_4"></p>
      <div id="divRelogin" style="display:none">
         <p data-i18n="tab_view_select_team_in_list"></p>
         <p><select id="selectTeam"><option value='0' data-i18n="tab_view_select_team"></option></select></p>
         <p data-i18n="tab_view_ask_password_to_teacher"></p>
         <p>
            <div id="divInput">
                   <input id="groupPassword" type="password">
                   &nbsp;&nbsp;&nbsp;<button type="button" id="buttonRelogin" onclick="relogin()" data-i18n="tab_view_restart_contest"></button>
                   <br/><span id="ReloginResult" style="color:red"></span>
             </div>
         </p>
      </div>
   </div>
</div>
<div id="divCheckNbContestants" style="display:none" class="dialog">
   <p data-i18n="nb_contestants_question"></p>
      <div id="divInput">
         <button type="button" onclick="setNbContestants(1)" data-i18n="nb_contestants_one"></button>
         &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="setNbContestants(2)" data-i18n="nb_contestants_two"></button>
      </div>
   </p>
</div>
<div id="divLogin" style="display:none" class="dialog">
   <p> <span data-i18n="[html]login_input_firstname"></span> <input id="firstName1" type="text" autocomplete="off"></input></p>
   <p> <span data-i18n="[html]login_input_lastname"></span> <input id="lastName1" type="text" autocomplete="off"></input></p>
   <p> <span data-i18n="login_ask_gender"></span> <br/>
         <div id="divInput">
            <input type="radio" id="genre1_female" name="genre1" value="1" autocomplete="off"><label for="genre1_female" data-i18n="login_female"></label>
            <br><input type="radio" id="genre1_male" name="genre1" value="2" autocomplete="off"><label for="genre1_male" data-i18n="login_male"></label>
         </div>
   </p>
   <p> <span data-i18n="grade_question"></span> <select id="grade1">
       <option value="" data-i18n="grade_select" selected></option>
       <option value="-1" data-i18n="grade_-1"></option>
       <option value="4" data-i18n="grade_4"></option>
       <option value="5" data-i18n="grade_5"></option>
       <option value="6" data-i18n="grade_6"></option>
       <option value="7" data-i18n="grade_7"></option>
       <option value="8" data-i18n="grade_8"></option>
       <option value="9" data-i18n="grade_9"></option>
       <option value="10" data-i18n="grade_10"></option>
       <option value="11" data-i18n="grade_11"></option>
       <option value="12" data-i18n="grade_12"></option>
       <option value="-4" data-i18n="grade_-4">Autre</option>
   </select> </p>
   <div id="contestant2" style="display:none">
      <p><b data-i18n="login_teammate"></b></p>
      <p><span data-i18n="[html]login_input_firstname"></span> <input id="firstName2" type="text" autocomplete="off"></input></p>
      <p><span data-i18n="[html]login_input_lastname"></span> <input id="lastName2" type="text" autocomplete="off"></input></p>
      <p><span data-i18n="login_ask_gender"></span> <br/>
         <div id="divInput">
         <input type="radio" id="genre2_female" name="genre2" value="1" autocomplete="off"/><label for="genre2_female" data-i18n="login_female"></label><br>
         <input type="radio" id="genre2_male" name="genre2" value="2" autocomplete="off"/><label for="genre2_male" data-i18n="login_male"></label></input>
         </div>
      </p>
      <p> <span data-i18n="grade_question"></span> <select id="grade2">
       <option value="" data-i18n="grade_select" selected></option>
       <option value="-1" data-i18n="grade_-1"></option>
       <option value="4" data-i18n="grade_4"></option>
       <option value="5" data-i18n="grade_5"></option>
       <option value="6" data-i18n="grade_6"></option>
       <option value="7" data-i18n="grade_7"></option>
       <option value="8" data-i18n="grade_8"></option>
       <option value="9" data-i18n="grade_9"></option>
       <option value="10" data-i18n="grade_10"></option>
       <option value="11" data-i18n="grade_11"></option>
       <option value="12" data-i18n="grade_12"></option>
       <option value="-4" data-i18n="grade_-4">Autre</option>
      </select> </p>
   </div>
   <p><button type="button" id="buttonLogin" onclick="validateLoginForm()" data-i18n="login_start_contest"></button><span id="LoginResult" style="color:red"></span></p>
</div>
<div id="divPassword" style="display:none" class="dialog">
   <p data-i18n="[html]password_warning">
   </p>
   <p>
   アクセスコード: <span id="teamPassword" class="selectable" style="font-size:2em"></span>
   </p>
         <div id="divInput">
            <button type="button" data-i18n="password_confirm" id="buttonConfirmTeamPassword" onclick="confirmTeamPassword()"></button>
         </div>
</div>
<div id="divImagesLoading" style="display:none" class="dialog">
  <span id="nbImagesLoaded">0</span> <span data-i18n="images_preloaded"></span>
</div>

<div id="divQuestions" style="display:none">
   <div class="oldInterface">
      <div class="questionListHeader">
         <table class="chrono" width="95%">
            <tr><td class="fullFeedback">残り時間&nbsp;: </td><td><span class='minutes'></span>:<span class='seconds'></span></td></tr>
            <tr><td class="fullFeedback">スコア&nbsp;:</td><td><span class='scoreTotalFullFeedback'></span></td></tr>
         </table>
         <p></p>
         <div class="scoreBonus" style="display:none"><b data-i18n="questions_bonus"></b><br/></div>
         <div class="rank" width="95%"></div>
      </div>
      <div class='questionList'>
         <span style="color:red" data-i18n="questions_loading"></span>
      </div>
      <p></p>
      <div style="text-align:center;width:180px;">
         <button type="button" id="buttonClose" class="buttonClose" style="display:none;" data-i18n="questions_finish_early" onclick='tryCloseContest()'></button>
      </div>

      <table class="questionsTable">
         <tr><td>
            <div id="divQuestionParams">
               <table style="width:100%"><tr>
                  <td style="width:10%" data-i18n="[html]top_image"></td>
                  <td><div class="questionTitle"></div></td>
                  <td style="width:25%"><div id="questionPoints"></div></td>
               </tr></table>
            </div>
         </td></tr>
      </table>

       </br>
       <FORM><INPUT type="button" value="TOPページへ" onClick="history.go(0)" style="border-style:solid; border-width:1px; border-color:#3366FF; background:#FFFFFF; font-size:12pt; color:#3366FF"></FORM>

   </div>
   <div class="newInterface" style="padding-bottom:1em">
      <div class="header">
         <table class="header_table">
            <tr>
               <td class="header_logo" data-i18n="[html]top_image_new"></td>
               <td class="header_score">Score&nbsp;:<br/><b><span class='scoreTotalFullFeedback'></span></b></td>
               <td class="header_time">Temps restant&nbsp;: <br/><b><span class='minutes'></span>:<span class='seconds'></span></b></td>
               <td class="header_rank" style="display:none">Classement&nbsp; <br/><b><span class="rank" width="95%"></span></b></td>
               <td class="header_button">
                 <input class="button_return_list" type="button" value="Retour à la liste des questions" onclick="backToList()"></input>
               </td>
            </tr>
         </table>
      </div>
      <div class="header_sep_top"></div>
      <div class="layout_table_wrapper">
         <div class="questionListIntro" style="text-align:left;line-height:170%">
            <ul data-i18n="[html]question_list_intro">
            </ul>
         </div>
         <div class="questionList task_icons">
            <span style="color:red" data-i18n="questions_loading"></span>
         </div>
      </div>
   </div>
   <span id="divQuestionsContent" style="display:none">
   </span>
   <span id="divSolutionsContent" style="display:none">
   </span>
   <span id="divGradersContent" style="display:none">
   </span>
</div>

<div id="question-iframe-container">
   <div class="newInterface" style="width:770px;margin:auto;text-align:left;padding: 10px 0 10px">
      <span class="questionTitle" style="padding-right: 20px"></span><span id="questionStars"></span>
   </div>
   <iframe src="about:blank" id="question-iframe" scrolling="no"></iframe>
</div>
<div id="divFooter" style="display:none;text-align:center">
   <div class="header_sep_bottom"></div>
   <button type="button" id="buttonCloseNew" class="buttonClose" data-i18n="questions_finish_early" onclick='tryCloseContest()'></button>
</div>

<div id="divClosed" style="display:none" class="dialog">
   <h3 id="divClosedMessage">
   </h3>
   <div id="divClosedPleaseWait" style="display:none">
      <p style='margin:200px 0 200px 0' data-i18n="[html]closed_please_wait">
      </p>
   </div>
   <div id="divClosedEncodedAnswers" style="display:none">
      <p data-i18n="[html]closed_connexion_error">
      </p>
      <textarea cols=60 rows=20 id="encodedAnswers"></textarea>
   </div>
   <div id="divClosedRemindPassword" style="display:none">
      <p>
         <b data-i18n="closed_remind_password"></b>
      </p>
      <p>
         <span data-i18n="closed_your_password"></span> <span class='selectable' id="remindTeamPassword"></span>
      </p>
   </div>
</div>
<div id="divError">
   <b data-i18n="error_server"></b> <p style="float:right;"><a href="#" onclick="$('#divError').hide()">[<span data-i18n="error_close"></span>]</a></p><br/>
   <span id="contentError"></span>
</div>
</form>
<!--<iframe id="trackingFrame" src="http://eval02.france-ioi.org/castor_tracking/index.html" style="display:none"></iframe>-->
<?php
  // JSON3 shim for IE6-9 compatibility.
  script_tag('/bower_components/json3/lib/json3.min.js');
  // jquery 1.9 is required for IE6+ compatibility.
  script_tag('/bower_components/jquery/jquery.min.js');
  // Ajax CORS support for IE9 and lower.
  script_tag('/bower_components/jQuery-ajaxTransport-XDomainRequest/jquery.xdomainrequest.min.js');
  script_tag('/bower_components/jquery-ui/jquery-ui.min.js');
  script_tag('/bower_components/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');
  script_tag('/bower_components/i18next/i18next.min.js');
  script_tag('/bower_components/utf8/utf8.js');
  script_tag('/bower_components/base64/base64.min.js');
  script_tag('/bower_components/pem-platform/task-pr.js');
  script_tag('/raphael-min.js');
  script_tag('/common.js');
  global $config;
?>
<script>
  function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
    }
  }
  window.contestsRoot = <?= json_encode($config->teacherInterface->sAbsoluteStaticPath.'/contests') ?>;
  window.sAbsoluteStaticPath = <?= json_encode($config->teacherInterface->sAbsoluteStaticPath.'/') ?>;
  window.sAssetsStaticPath = <?= json_encode(static_asset('/')) ?>;
  try {
    i18n.init(<?= json_encode([
      'lng' => $config->defaultLanguage,
      'fallbackLng' => [$config->defaultLanguage],
      'fallbackNS' => 'translation',
      'ns' => [
        'namespaces' => $config->customStringsName ? [$config->customStringsName, 'translation'] : ['translation'],
        'defaultNs' => $config->customStringsName ? $config->customStringsName : 'translation',
      ],
      'getAsync' => true,
      'resGetPath' => static_asset('/i18n/__lng__/__ns__.json')
    ]); ?>, function () {
      window.i18nLoaded = true;
      $("title").i18n();
      $("body").i18n();
    });
  } catch(e) {
    // assuming s3 was blocked, so add ?p=1 to url, see contestInterface/config.php
    var newLocation = updateQueryStringParameter(window.location.toString(), 'p', '1');
    if (newLocation != window.location.toString()) {
      window.location = newLocation;
    }
  }
  window.ieMode = false;
</script>
<!--[if IE 6]>
<script>
window.ieMode = true;
window.sAbsoluteStaticPath = <?= json_encode($config->teacherInterface->sAbsoluteStaticPathOldIE.'/') ?>;
window.contestsRoot = <?= json_encode($config->teacherInterface->sAbsoluteStaticPathOldIE.'/contests') ?>;
</script>
<![endif]-->
<div style="height:400px">
</div>
</body></html>
