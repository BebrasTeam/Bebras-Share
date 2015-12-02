<?php

// Detabase
$config->db->use = 'mysql';
$config->db->testMode = false;
$config->db->dynamoSessions = false;
$config->db->dynamoDBPrefix = ''; // prefix for team and team_question

// MySQL
$config->db->mysql->host = 'localhost';
$config->db->mysql->database = 'BebrasDB';
$config->db->mysql->password = 'root';
$config->db->mysql->user = 'root';
$config->db->mysql->logged = false;

// Aws, if relevant
$config->aws->key = '';
$config->aws->secret = '';
$config->aws->region = '';
$config->aws->bucketName = '';

// Emails
$config->email->bSendMailForReal = true; //
$config->email->sEmailSender = '';
$config->email->sEmailInsriptionBCC = '';
$config->email->sGMailUsername = '';
$config->email->sGMailPassword = '';
$config->email->sInfoAddress = ''; //

// Localization
$config->timezone = 'Asia/Tokyo';
$config->defaultLanguage = 'ja';
$config->teacherInterface->countryCode = 'FR';

// Teacher interface settings
$config->teacherInterface->sCoordinatorFolder = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/teacherInterface';
$config->teacherInterface->sAssetsStaticPath = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/contestInterface';
$config->teacherInterface->sAbsoluteStaticPath = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/contestInterface';
$config->teacherInterface->sAbsoluteStaticPathOldIE = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/contestInterface';
$config->teacherInterface->genericPasswordMd5 = ''; //
$config->teacherInterface->generationMode = 'local';
$config->teacherInterface->sContestGenerationPath = '/../contestInterface/contests/';
$config->teacherInterface->forceOfficialEmailDomain = false;

// URLs
$config->teacherInterface->baseUrl = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/teacherInterface';
$config->contestInterface->baseUrl = 'http://da.tani.cs.chs.nihon-u.ac.jp/bebras-test/bebras-platform/contestInterface';
$config->certificates->webServiceUrl = 'http://castor-informatique.fr.localhost/certificates/';
$config->contestPresentationURL = 'http://castor-informatique.fr';
$config->contestOfficialURL = 'http://concours.castor-informatique.fr';
$config->contestBackupURL = '';
$config->useCustomStrings = true; // see README