-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- ホスト: localhost
-- 生成日時: 2015 年 12 月 02 日 19:44
-- サーバのバージョン: 5.5.44-0ubuntu0.14.04.1
-- PHP のバージョン: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `BebrasDB`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `algorea_registration`
--

CREATE TABLE IF NOT EXISTS `algorea_registration` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `mailValidationHash` varchar(50) NOT NULL,
  `mailValidated` tinyint(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `algoreaAccount` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `mailValidationHash` (`mailValidationHash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `certi_queue`
--

CREATE TABLE IF NOT EXISTS `certi_queue` (
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `nbStudents` int(11) NOT NULL,
  `requestDate` datetime NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `state` enum('WAITING','RUNNING','CANCELED','STOPPED','FINISHED') NOT NULL DEFAULT 'WAITING',
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contest`
--

CREATE TABLE IF NOT EXISTS `contest` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `status` enum('FutureContest','RunningContest','PastContest','Other','Hidden','Closed','PreRanking') NOT NULL DEFAULT 'Hidden',
  `nbMinutes` int(11) NOT NULL,
  `bonusScore` int(11) NOT NULL DEFAULT '0',
  `allowTeamsOfTwo` int(11) NOT NULL DEFAULT '0',
  `fullFeedback` tinyint(1) NOT NULL DEFAULT '0',
  `nextQuestionAuto` tinyint(1) NOT NULL DEFAULT '1',
  `newInterface` tinyint(4) NOT NULL,
  `folder` varchar(50) NOT NULL,
  `minAward1Rank` int(11) DEFAULT NULL,
  `minAward2Rank` int(11) DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `status` (`status`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `contest`
--

INSERT INTO `contest` (`ID`, `name`, `level`, `year`, `status`, `nbMinutes`, `bonusScore`, `allowTeamsOfTwo`, `fullFeedback`, `nextQuestionAuto`, `newInterface`, `folder`, `minAward1Rank`, `minAward2Rank`, `iVersion`) VALUES
(1, 'Castor 2011, niveau 6e/5e', 1, 2011, 'RunningContest', 45, 0, 0, 0, 1, 0, '2011_6_5_axafas', NULL, NULL, 0),
(2, 'Castor 2011, niveau 4e/3e', 2, 2011, 'RunningContest', 45, 0, 0, 0, 1, 0, '2011_4_3_bswxt', NULL, NULL, 0),
(3, 'Castor 2011, niveau 2de', 3, 2011, 'RunningContest', 45, 0, 0, 0, 1, 0, '2011_2_sptbkxr', NULL, NULL, 0),
(4, 'Castor 2011, niveau 1re/Tle', 4, 2011, 'RunningContest', 45, 0, 0, 0, 1, 0, '2011_1_0_psxtybcr', NULL, NULL, 0),
(6, 'Castor 2012, niveau 6e/5e', 1, 2012, '', 45, 0, 0, 0, 1, 0, '2012_6_5_faskfjb', NULL, NULL, 0),
(7, 'Castor 2012, niveau 4e/3e', 2, 2012, '', 45, 0, 0, 0, 1, 0, '2012_4_3_aftnasktj', NULL, NULL, 0),
(8, 'Castor 2012, niveau 2de', 3, 2012, '', 45, 0, 0, 0, 1, 0, '2012_2_saffstbb', NULL, NULL, 0),
(9, 'Castor 2012, niveau 1re/Tle', 4, 2012, '', 45, 0, 0, 0, 1, 0, '2012_1_0_asftan', NULL, NULL, 0),
(16, 'Entraînement 2012, niveau 6e/5e', 1, 102012, 'RunningContest', 45, 0, 0, 0, 1, 0, '2012_6_5_atrpstwk', NULL, NULL, 0),
(17, 'Entraînement 2012, niveau 4e/3e', 2, 102012, 'RunningContest', 45, 0, 0, 0, 1, 0, '2012_4_3_qwastask', NULL, NULL, 0),
(18, 'Entraînement 2012, niveau 2de', 3, 102012, 'RunningContest', 45, 0, 0, 0, 1, 0, '2012_2_sastak', NULL, NULL, 0),
(19, 'Entraînement 2012, niveau 1re/Tle', 4, 102012, 'RunningContest', 45, 0, 0, 0, 1, 0, '2012_1_0_srijair', NULL, NULL, 0),
(20, 'Entraînement 2012, tous les sujets', 0, 102012, 'RunningContest', 60, 0, 0, 0, 1, 0, '2012_all_saftrqthj', NULL, NULL, 0),
(21, 'Entraînement 2011, tous les sujets', 0, 102011, 'RunningContest', 60, 0, 0, 0, 1, 0, '2011_all_atskjaktb', NULL, NULL, 0),
(164396217452270499, '2015 Junior', 3, 2015, 'PastContest', 0, 0, 0, 1, 1, 0, '2015_Junior', 0, 0, 0),
(468517013885763775, '2015 Benjamin', 1, 2015, 'PastContest', 0, 0, 0, 1, 1, 0, '2015_Benjamin', 0, 0, 0),
(893267660401852769, '2015 Cadet', 2, 2015, 'PastContest', 45, 0, 0, 1, 1, 0, '2015_Cadet', 0, 0, 0),
(978031384826399275, '2015 Senior', 4, 2015, 'PastContest', 0, 0, 0, 0, 1, 0, '2015_Senior', 0, 0, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `contestant`
--

CREATE TABLE IF NOT EXISTS `contestant` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `genre` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `teamID` bigint(20) NOT NULL,
  `cached_schoolID` bigint(20) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `schoolRank` int(11) DEFAULT NULL,
  `algoreaCode` varchar(10) DEFAULT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `orig_firstName` varchar(50) DEFAULT NULL,
  `orig_lastName` varchar(50) DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `algoreaCode` (`algoreaCode`),
  KEY `teamID` (`teamID`),
  KEY `cached_schoolID` (`cached_schoolID`),
  KEY `rank` (`rank`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

--
-- テーブルのデータのダンプ `contestant`
--

INSERT INTO `contestant` (`ID`, `lastName`, `firstName`, `genre`, `grade`, `teamID`, `cached_schoolID`, `rank`, `schoolRank`, `algoreaCode`, `saniValid`, `orig_firstName`, `orig_lastName`, `iVersion`) VALUES
(1, 'Anonymous', 'Anonymous', 2, -2, 126383874547818175, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(2, 'Anonymous', 'Anonymous', 2, -2, 178071925448910026, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(3, 'Anonymous', 'Anonymous', 2, -2, 156971923479189270, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(4, 'Anonymous', 'Anonymous', 2, -2, 430407927410671246, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(5, 'Anonymous', 'Anonymous', 2, -2, 88344882766899764, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6, 'Anonymous', 'Anonymous', 2, -2, 939440735134254951, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(7, 'Anonymous', 'Anonymous', 2, -2, 47976483608609754, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(8, 'Anonymous', 'Anonymous', 2, -2, 952031959823772929, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(9, 'Anonymous', 'Anonymous', 2, -2, 29124095756717164, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(10, 'Anonymous', 'Anonymous', 2, -2, 907172717767092501, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(11, 'Anonymous', 'Anonymous', 2, -2, 97280043935778949, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(12, 'Anonymous', 'Anonymous', 2, -2, 82663560771244493, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(13, 'Anonymous', 'Anonymous', 2, -2, 614198532574868359, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(14, 'Anonymous', 'Anonymous', 2, -2, 138071566748090075, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(15, 'Anonymous', 'Anonymous', 2, -2, 973702296126598025, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(16, 'Anonymous', 'Anonymous', 2, -2, 590564669970202141, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(17, 'Anonymous', 'Anonymous', 2, -2, 82667673516313629, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(18, 'Anonymous', 'Anonymous', 2, -2, 131019942803547710, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(19, 'Anonymous', 'Anonymous', 2, -2, 558384619654873151, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(20, '23:17', '1119', 2, 5, 574165627640531544, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(21, '23:21', '1119', 2, 8, 32769915849298700, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(22, '23:26', '1119', 2, 7, 234659469922472946, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(23, '23:32', '1119', 2, 7, 960852632272615228, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(24, '23:34', '1119', 2, 7, 137267684177093299, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(25, '23:35', '1119', 1, 10, 614408513480616720, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(26, '23:37', '1119', 2, 5, 824305349440225526, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(27, 'Anonymous', 'Anonymous', 2, -2, 424911693750877820, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(28, 'Past', 'Past', 1, 8, 305479488236079294, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(29, 'past1', 'Past', 1, 8, 85919970169164090, 458111176947192449, NULL, NULL, NULL, 0, NULL, NULL, 0),
(30, 'Anonymous', 'Anonymous', 2, -2, 389189128630030828, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(31, 'Anonymous', 'Anonymous', 2, -2, 643946600278111052, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(32, 'Anonymous', 'Anonymous', 2, -2, 250113023549903934, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(33, 'Anonymous', 'Anonymous', 2, -2, 928632351849411870, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(34, 'Anonymous', 'Anonymous', 2, -2, 723703307212196247, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(35, 'Anonymous', 'Anonymous', 2, -2, 216977746621567980, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(36, 'Anonymous', 'Anonymous', 2, -2, 514263289820938122, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(37, 'Anonymous', 'Anonymous', 2, -2, 75081288253422736, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(38, 'Anonymous', 'Anonymous', 2, -2, 756242904253775301, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(39, 'Anonymous', 'Anonymous', 2, -2, 88892905761030118, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(40, 'Anonymous', 'Anonymous', 2, -2, 739984697700773146, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(41, 'Anonymous', 'Anonymous', 2, -2, 795882119467341472, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(42, 'Anonymous', 'Anonymous', 2, -2, 92562562460906657, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(43, 'Anonymous', 'Anonymous', 2, -2, 87060270107277048, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(44, 'Anonymous', 'Anonymous', 2, -2, 669293861252688747, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(45, 'Anonymous', 'Anonymous', 2, -2, 12952303415879279, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(46, 'Anonymous', 'Anonymous', 2, -2, 127321723434842957, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(47, 'Anonymous', 'Anonymous', 2, -2, 847861914413595498, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(48, 'Anonymous', 'Anonymous', 2, -2, 514174391319252002, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(49, 'Anonymous', 'Anonymous', 2, -2, 25414793456158758, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(50, 'Anonymous', 'Anonymous', 2, -2, 796558771114538875, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(51, 'Anonymous', 'Anonymous', 2, -2, 715476834846901659, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(52, 'Anonymous', 'Anonymous', 2, -2, 223265160905243423, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(53, 'Anonymous', 'Anonymous', 2, -2, 645754018752723903, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(54, 'Anonymous', 'Anonymous', 2, -2, 566861861791066832, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(55, 'Anonymous', 'Anonymous', 2, -2, 571520412185284075, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(56, 'Anonymous', 'Anonymous', 2, -2, 691919480618683867, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(57, 'Anonymous', 'Anonymous', 2, -2, 724137014423668048, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(58, 'Anonymous', 'Anonymous', 2, -2, 564578170956549959, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(59, 'Anonymous', 'Anonymous', 2, -2, 641248838690165406, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(60, 'Anonymous', 'Anonymous', 2, -2, 246829785639194324, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(61, 'Anonymous', 'Anonymous', 2, -2, 148285902774565636, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(62, 'Anonymous', 'Anonymous', 2, -2, 57181655662808196, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(63, 'Anonymous', 'Anonymous', 2, -2, 983837320810428681, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(64, 'Anonymous', 'Anonymous', 2, -2, 75787559586508201, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(65, 'Anonymous', 'Anonymous', 2, -2, 284633817342389146, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(66, 'Anonymous', 'Anonymous', 2, -2, 58736360819088913, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(67, 'Anonymous', 'Anonymous', 2, -2, 104485268724178051, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(68, 'Random', 'Apple', 1, 8, 725970541624647680, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(69, 'Anonymous', 'Anonymous', 2, -2, 820605708376917076, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(70, 'Anonymous', 'Anonymous', 2, -2, 765706186257366320, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(71, 'Anonymous', 'Anonymous', 2, -2, 351437246288937236, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(72, 'Anonymous', 'Anonymous', 2, -2, 898483227966628126, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(73, 'Anonymous', 'Anonymous', 2, -2, 7315437246910723, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(74, 'Anonymous', 'Anonymous', 2, -2, 566006153662411570, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(75, 'Anonymous', 'Anonymous', 2, -2, 905088136217924089, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(76, 'Anonymous', 'Anonymous', 2, -2, 467518645704986238, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(77, 'Anonymous', 'Anonymous', 2, -2, 72255052835645398, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(78, 'Anonymous', 'Anonymous', 2, -2, 551473565384549611, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(79, 'Anonymous', 'Anonymous', 2, -2, 412145035587149587, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(80, 'Anonymous', 'Anonymous', 2, -2, 174552131325841755, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(81, 'Anonymous', 'Anonymous', 2, -2, 782403085392325585, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(82, 'Anonymous', 'Anonymous', 2, -2, 933491390622220773, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(83, 'Anonymous', 'Anonymous', 2, -2, 172537402142770850, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(84, 'Anonymous', 'Anonymous', 2, -2, 279103029575541931, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(85, 'Anonymous', 'Anonymous', 2, -2, 985756647493419319, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(86, 'Anonymous', 'Anonymous', 2, -2, 575676430797203293, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(87, 'Anonymous', 'Anonymous', 2, -2, 458658060854715654, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(88, 'Anonymous', 'Anonymous', 2, -2, 23844591497093056, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(89, 'Anonymous', 'Anonymous', 2, -2, 108996288490435971, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(90, 'Anonymous', 'Anonymous', 2, -2, 802693053414573678, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(91, 'Anonymous', 'Anonymous', 2, -2, 965063473195633916, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(92, 'Anonymous', 'Anonymous', 2, -2, 75947326801092838, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(93, 'Anonymous', 'Anonymous', 2, -2, 968812443945039070, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(94, 'Anonymous', 'Anonymous', 2, -2, 408008070743212423, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(95, 'Anonymous', 'Anonymous', 2, -2, 403190480464498889, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(96, 'Anonymous', 'Anonymous', 2, -2, 683396448425910373, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(97, 'Anonymous', 'Anonymous', 2, -2, 996804371403792184, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(98, 'Anonymous', 'Anonymous', 2, -2, 641969053247620529, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(99, 'Anonymous', 'Anonymous', 2, -2, 101042409549635024, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(100, 'Anonymous', 'Anonymous', 2, -2, 827186137957143171, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(101, 'Anonymous', 'Anonymous', 2, -2, 546922589714126140, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(102, 'Anonymous', 'Anonymous', 2, -2, 365196723236323257, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(103, 'Anonymous', 'Anonymous', 2, -2, 267000786385815346, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(104, 'Anonymous', 'Anonymous', 2, -2, 322446849147447394, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(105, 'Anonymous', 'Anonymous', 2, -2, 768204613345398458, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(106, 'Anonymous', 'Anonymous', 2, -2, 204962790233542189, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(107, 'Anonymous', 'Anonymous', 2, -2, 742549352937370665, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(108, 'Anonymous', 'Anonymous', 2, -2, 94909983443289995, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(109, 'Anonymous', 'Anonymous', 2, -2, 4677474517632100, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(110, 'Anonymous', 'Anonymous', 2, -2, 540083756708069410, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(111, 'Anonymous', 'Anonymous', 2, -2, 991236262504200665, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(112, 'Anonymous', 'Anonymous', 2, -2, 872189215872142942, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(113, 'Anonymous', 'Anonymous', 2, -2, 796584825509236057, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(114, 'Anonymous', 'Anonymous', 2, -2, 998760257622324642, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(115, 'Anonymous', 'Anonymous', 2, -2, 321107079858536544, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(116, 'Anonymous', 'Anonymous', 2, -2, 269506137968236686, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(117, 'Anonymous', 'Anonymous', 2, -2, 240198523182780639, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(118, 'Anonymous', 'Anonymous', 2, -2, 30109827843290277, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(119, 'Anonymous', 'Anonymous', 2, -2, 389624325120703748, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(120, 'Anonymous', 'Anonymous', 2, -2, 134968316243559005, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(121, 'Anonymous', 'Anonymous', 2, -2, 12231166085200373, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(122, 'Anonymous', 'Anonymous', 2, -2, 540433498694399926, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(123, 'Anonymous', 'Anonymous', 2, -2, 944965220985448941, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(124, 'Anonymous', 'Anonymous', 2, -2, 581546721646445109, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(125, 'Anonymous', 'Anonymous', 2, -2, 505016585385075890, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(126, 'Anonymous', 'Anonymous', 2, -2, 397871409392543013, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(127, 'Anonymous', 'Anonymous', 2, -2, 629252471292058464, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(128, 'Anonymous', 'Anonymous', 2, -2, 202705149566500883, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(129, 'Anonymous', 'Anonymous', 2, -2, 270582423713226078, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(130, 'Anonymous', 'Anonymous', 2, -2, 711310660888523604, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(131, 'Anonymous', 'Anonymous', 2, -2, 473533725689007906, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(132, 'Anonymous', 'Anonymous', 2, -2, 16619238218710515, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(133, 'Anonymous', 'Anonymous', 2, -2, 80877774859919675, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(134, 'Anonymous', 'Anonymous', 2, -2, 215460025414286632, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(135, 'Anonymous', 'Anonymous', 2, -2, 344325073404516834, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(136, 'Anonymous', 'Anonymous', 2, -2, 312909647179177825, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(137, 'Anonymous', 'Anonymous', 2, -2, 517946496606692405, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(138, 'Anonymous', 'Anonymous', 2, -2, 586757934228256471, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(139, 'Anonymous', 'Anonymous', 2, -2, 269537381860410433, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(140, 'Anonymous', 'Anonymous', 2, -2, 733020933934823299, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(141, 'Anonymous', 'Anonymous', 2, -2, 595550398189183877, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(142, 'Anonymous', 'Anonymous', 2, -2, 20120599911617373, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(143, 'Anonymous', 'Anonymous', 2, -2, 772109423714930275, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(144, 'Anonymous', 'Anonymous', 2, -2, 15382315774629000, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(145, 'Anonymous', 'Anonymous', 2, -2, 123144622893100845, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(146, 'Anonymous', 'Anonymous', 2, -2, 563023393408427769, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(147, 'Anonymous', 'Anonymous', 2, -2, 88062563770860735, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(148, 'Anonymous', 'Anonymous', 2, -2, 477216532902214106, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(149, 'Anonymous', 'Anonymous', 2, -2, 594329796465389066, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(150, 'Anonymous', 'Anonymous', 2, -2, 13731300519486454, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(151, 'Anonymous', 'Anonymous', 2, -2, 618835091921710305, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(152, 'Anonymous', 'Anonymous', 2, -2, 77946303357276208, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(153, 'Anonymous', 'Anonymous', 2, -2, 375705726958905896, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(154, 'Anonymous', 'Anonymous', 2, -2, 397681595895695643, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(155, 'Anonymous', 'Anonymous', 2, -2, 37613631254132268, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(156, 'Anonymous', 'Anonymous', 2, -2, 870888166400824420, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(157, 'Anonymous', 'Anonymous', 2, -2, 330944643912777851, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(158, 'Anonymous', 'Anonymous', 2, -2, 537906329957551030, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(159, 'Anonymous', 'Anonymous', 2, -2, 847869333985206716, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(160, 'Anonymous', 'Anonymous', 2, -2, 956081974894351336, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(161, 'Anonymous', 'Anonymous', 2, -2, 556393354855295039, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(162, 'Anonymous', 'Anonymous', 2, -2, 329223118122264849, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(163, 'Anonymous', 'Anonymous', 2, -2, 60234490232326423, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(164, 'Anonymous', 'Anonymous', 2, -2, 855457297143559183, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(165, 'Anonymous', 'Anonymous', 2, -2, 627247562895866016, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(166, 'Anonymous', 'Anonymous', 2, -2, 95906382556997166, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(167, 'Anonymous', 'Anonymous', 2, -2, 294087028464661423, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(168, 'Anonymous', 'Anonymous', 2, -2, 250033746844393174, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(169, 'Anonymous', 'Anonymous', 2, -2, 460320976362041067, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(170, 'Anonymous', 'Anonymous', 2, -2, 14807590212337296, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(171, 'Anonymous', 'Anonymous', 2, -2, 79673501498395792, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(172, 'Anonymous', 'Anonymous', 2, -2, 577557948533603806, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(173, 'Anonymous', 'Anonymous', 2, -2, 713851485789892972, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(174, 'Anonymous', 'Anonymous', 2, -2, 496300130755984626, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(175, 'Anonymous', 'Anonymous', 2, -2, 878128689904230951, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(176, 'Anonymous', 'Anonymous', 2, -2, 689405645964885759, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(177, 'Anonymous', 'Anonymous', 2, -2, 7080778747183221, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(178, 'A', 'A', 2, 6, 273976541279493927, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(179, 'A', 'A', 1, 8, 892235700408726406, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0),
(180, 'Anonymous', 'Anonymous', 2, -2, 76231858752714301, 458111176947192449, NULL, NULL, NULL, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `contest_question`
--

CREATE TABLE IF NOT EXISTS `contest_question` (
  `ID` bigint(20) NOT NULL,
  `contestID` bigint(20) NOT NULL,
  `questionID` bigint(20) NOT NULL,
  `minScore` int(11) DEFAULT NULL,
  `noAnswerScore` int(11) NOT NULL DEFAULT '0',
  `maxScore` int(11) DEFAULT NULL,
  `options` varchar(200) NOT NULL DEFAULT '{}',
  `order` int(11) NOT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `contestID` (`contestID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `contest_question`
--

INSERT INTO `contest_question` (`ID`, `contestID`, `questionID`, `minScore`, `noAnswerScore`, `maxScore`, `options`, `order`, `iVersion`) VALUES
(3, 1, 24, -2, 0, 6, '{}', 0, 0),
(6, 1, 30, -3, 0, 9, '{}', 1, 0),
(10, 1, 22, -2, 0, 6, '{}', 0, 0),
(11, 1, 19, -3, 0, 9, '{}', 1, 0),
(12, 1, 3, -2, 0, 6, '{}', 0, 0),
(13, 1, 16, -3, 0, 9, '{}', 1, 0),
(14, 1, 17, -3, 0, 9, '{}', 1, 0),
(17, 1, 27, -2, 0, 6, '{}', 0, 0),
(18, 1, 4, -4, 0, 12, '{}', 2, 0),
(19, 1, 26, -2, 0, 6, '{}', 0, 0),
(21, 10, 113, -1, 0, 3, '{}', 1, 0),
(22, 1, 1, -3, 0, 9, '{}', 1, 0),
(23, 1, 18, -2, 0, 6, '{}', 0, 0),
(24, 1, 29, -4, 0, 12, '{}', 2, 0),
(25, 1, 13, 0, 0, 9, '{}', 1, 0),
(26, 1, 28, -4, 0, 12, '{}', 2, 0),
(27, 2, 1, -2, 0, 6, '{}', 0, 0),
(28, 2, 26, -2, 0, 6, '{}', 0, 0),
(29, 2, 13, 0, 0, 6, '{}', 0, 0),
(30, 2, 27, -2, 0, 6, '{}', 0, 0),
(31, 2, 14, -3, 0, 9, '{}', 1, 0),
(32, 2, 29, -3, 0, 9, '{}', 1, 0),
(33, 2, 4, -3, 0, 9, '{}', 1, 0),
(34, 2, 16, -3, 0, 9, '{}', 1, 0),
(35, 2, 6, -3, 0, 9, '{}', 1, 0),
(36, 2, 7, -3, 0, 9, '{}', 1, 0),
(37, 2, 12, -3, 0, 9, '{}', 1, 0),
(38, 2, 2, -4, 0, 12, '{}', 2, 0),
(39, 2, 8, -4, 0, 12, '{}', 2, 0),
(40, 2, 23, -4, 0, 12, '{}', 2, 0),
(41, 3, 16, -2, 0, 6, '{}', 0, 0),
(42, 3, 26, -2, 0, 6, '{}', 0, 0),
(43, 3, 27, -2, 0, 6, '{}', 0, 0),
(44, 3, 7, -2, 0, 6, '{}', 0, 0),
(45, 3, 6, -3, 0, 9, '{}', 1, 0),
(46, 3, 12, -3, 0, 9, '{}', 1, 0),
(47, 3, 10, -3, 0, 9, '{}', 1, 0),
(48, 3, 2, -3, 0, 9, '{}', 1, 0),
(49, 3, 14, -3, 0, 9, '{}', 1, 0),
(50, 3, 33, -3, 0, 9, '{}', 1, 0),
(51, 3, 8, -3, 0, 9, '{}', 1, 0),
(52, 3, 5, -4, 0, 12, '{}', 2, 0),
(53, 3, 15, -4, 0, 12, '{}', 2, 0),
(54, 3, 9, -4, 0, 12, '{}', 2, 0),
(55, 4, 16, -2, 0, 6, '{}', 0, 0),
(56, 4, 27, -2, 0, 6, '{}', 0, 0),
(57, 4, 26, -2, 0, 6, '{}', 0, 0),
(58, 4, 21, -2, 0, 6, '{}', 0, 0),
(59, 4, 7, -2, 0, 6, '{}', 0, 0),
(60, 4, 5, -3, 0, 9, '{}', 1, 0),
(61, 4, 15, -3, 0, 9, '{}', 1, 0),
(62, 4, 6, -3, 0, 9, '{}', 1, 0),
(63, 4, 8, -3, 0, 9, '{}', 1, 0),
(64, 4, 10, -3, 0, 9, '{}', 1, 0),
(65, 4, 9, -3, 0, 9, '{}', 1, 0),
(66, 4, 29, -3, 0, 9, '{}', 1, 0),
(67, 4, 33, -4, 0, 12, '{}', 2, 0),
(68, 2, 121, -2, 0, 6, '{}', 0, 0),
(69, 3, 122, -2, 0, 6, '{}', 0, 0),
(70, 4, 122, -2, 0, 6, '{}', 0, 0),
(71, 1, 121, -2, 0, 6, '{}', 0, 0),
(72, 3, 123, -3, 0, 9, '{}', 1, 0),
(73, 4, 123, -3, 0, 9, '{}', 1, 0),
(74, 1, 124, -4, 0, 12, '{}', 2, 0),
(75, 4, 125, 0, 0, 12, '{}', 2, 0),
(76, 2, 126, -4, 0, 12, '{}', 2, 0),
(77, 3, 126, -4, 0, 12, '{}', 2, 0),
(78, 4, 126, -4, 0, 12, '{}', 2, 0),
(79, 1, 127, 0, 0, 9, '{}', 1, 0),
(80, 2, 127, 0, 0, 9, '{}', 1, 0),
(81, 3, 128, 0, 0, 14, '{}', 2, 0),
(82, 4, 128, 0, 0, 14, '{}', 2, 0),
(83, 6, 107, -3, 0, 9, '{}', 4, 0),
(84, 10, 129, 0, 0, 3, '{}', 2, 0),
(85, 10, 130, -1, 0, 3, '{}', 3, 0),
(86, 10, 101, -1, 0, 3, '{}', 4, 0),
(87, 10, 112, -1, 0, 3, '{}', 5, 0),
(88, 10, 117, -1, 0, 3, '{}', 6, 0),
(89, 10, 131, -1, 0, 3, '{}', 7, 0),
(90, 10, 132, -1, 0, 3, '{}', 8, 0),
(91, 10, 118, -1, 0, 3, '{}', 10, 0),
(92, 10, 41, -4, 0, 12, '{}', 32, 0),
(93, 10, 115, -1, 0, 3, '{}', 14, 0),
(94, 10, 105, -1, 0, 3, '{}', 11, 0),
(95, 10, 114, -1, 0, 3, '{}', 12, 0),
(96, 10, 100, -1, 0, 3, '{}', 13, 0),
(97, 10, 36, 0, 0, 12, '{}', 15, 0),
(98, 10, 133, -1, 0, 3, '{}', 16, 0),
(100, 10, 39, -1, 0, 3, '{}', 18, 0),
(101, 10, 37, -1, 0, 3, '{}', 19, 0),
(102, 10, 134, -1, 0, 3, '{}', 20, 0),
(103, 10, 111, -1, 0, 3, '{}', 21, 0),
(104, 10, 135, -1, 0, 3, '{}', 22, 0),
(105, 10, 136, -1, 0, 3, '{}', 23, 0),
(106, 10, 108, -1, 0, 3, '{}', 24, 0),
(107, 10, 103, -1, 0, 3, '{}', 25, 0),
(108, 10, 119, 0, 0, 3, '{}', 26, 0),
(109, 10, 104, -1, 0, 3, '{}', 27, 0),
(110, 10, 38, 0, 0, 9, '{}', 28, 0),
(111, 10, 34, -1, 0, 3, '{}', 29, 0),
(112, 10, 137, -1, 0, 3, '{}', 30, 0),
(113, 10, 40, -1, 0, 3, '{}', 31, 0),
(114, 10, 138, -1, 0, 3, '{}', 33, 0),
(115, 10, 116, -4, 0, 12, '{}', 34, 0),
(116, 10, 107, -1, 0, 3, '{}', 9, 0),
(117, 10, 139, -1, 0, 3, '{}', 17, 0),
(118, 6, 113, -3, 0, 9, '{}', 4, 0),
(119, 6, 129, 0, 0, 12, '{}', 6, 0),
(120, 6, 130, -2, 0, 6, '{}', 2, 0),
(121, 6, 101, -1, 0, 3, '{}', 1, 0),
(122, 6, 112, -1, 0, 3, '{}', 1, 0),
(123, 6, 117, -3, 0, 9, '{}', 4, 0),
(124, 6, 131, -1, 0, 3, '{}', 1, 0),
(125, 6, 132, -1, 0, 3, '{}', 1, 0),
(126, 6, 118, -3, 0, 9, '{}', 4, 0),
(127, 6, 100, -2, 0, 6, '{}', 2, 0),
(128, 6, 36, 0, 0, 12, '{}', 8, 0),
(129, 6, 133, -1, 0, 3, '{}', 1, 0),
(130, 6, 139, -3, 0, 9, '{}', 4, 0),
(131, 6, 37, -2, 0, 6, '{}', 3, 0),
(132, 6, 136, -2, 0, 6, '{}', 2, 0),
(133, 7, 101, -1, 0, 3, '{}', 1, 0),
(134, 7, 112, -1, 0, 3, '{}', 1, 0),
(135, 7, 117, -3, 0, 9, '{}', 5, 0),
(138, 7, 107, -2, 0, 6, '{}', 4, 0),
(139, 7, 118, -2, 0, 6, '{}', 4, 0),
(140, 7, 105, -3, 0, 9, '{}', 5, 0),
(141, 7, 114, -4, 0, 12, '{}', 7, 0),
(142, 7, 100, -1, 0, 3, '{}', 1, 0),
(143, 7, 115, -1, 0, 3, '{}', 1, 0),
(144, 7, 36, 0, 0, 12, '{}', 9, 0),
(145, 7, 133, -1, 0, 3, '{}', 1, 0),
(146, 7, 139, -2, 0, 6, '{}', 3, 0),
(147, 7, 39, -3, 0, 9, '{}', 5, 0),
(148, 7, 37, -1, 0, 3, '{}', 2, 0),
(149, 7, 111, -3, 0, 9, '{}', 5, 0),
(150, 7, 135, -4, 0, 12, '{}', 8, 0),
(151, 7, 108, -2, 0, 6, '{}', 4, 0),
(152, 8, 107, -2, 0, 6, '{}', 3, 0),
(153, 8, 118, -1, 0, 3, '{}', 1, 0),
(154, 8, 105, -2, 0, 6, '{}', 3, 0),
(155, 8, 114, -4, 0, 12, '{}', 8, 0),
(156, 8, 115, -1, 0, 3, '{}', 1, 0),
(157, 8, 36, 0, 0, 12, '{}', 10, 0),
(158, 8, 37, -1, 0, 3, '{}', 2, 0),
(159, 8, 111, -3, 0, 9, '{}', 4, 0),
(160, 8, 135, -4, 0, 12, '{}', 9, 0),
(161, 8, 108, -2, 0, 6, '{}', 3, 0),
(162, 8, 103, -3, 0, 9, '{}', 5, 0),
(163, 8, 119, 0, 0, 9, '{}', 5, 0),
(164, 8, 38, 0, 0, 9, '{}', 6, 0),
(165, 8, 34, -3, 0, 9, '{}', 4, 0),
(166, 8, 137, -1, 0, 3, '{}', 1, 0),
(167, 8, 40, -2, 0, 6, '{}', 3, 0),
(168, 8, 41, -4, 0, 12, '{}', 7, 0),
(169, 9, 118, -1, 0, 3, '{}', 1, 0),
(170, 9, 105, -2, 0, 6, '{}', 2, 0),
(171, 9, 114, -4, 0, 12, '{}', 7, 0),
(172, 9, 115, -1, 0, 3, '{}', 1, 0),
(173, 9, 36, 0, 0, 12, '{}', 10, 0),
(174, 9, 134, -2, 0, 6, '{}', 2, 0),
(175, 9, 111, -3, 0, 9, '{}', 3, 0),
(176, 9, 135, -4, 0, 12, '{}', 8, 0),
(177, 9, 108, -1, 0, 3, '{}', 1, 0),
(178, 9, 119, 0, 0, 9, '{}', 4, 0),
(179, 9, 104, -4, 0, 12, '{}', 9, 0),
(180, 9, 38, 0, 0, 9, '{}', 5, 0),
(181, 9, 34, -3, 0, 9, '{}', 3, 0),
(182, 9, 137, -1, 0, 3, '{}', 1, 0),
(183, 9, 40, -2, 0, 6, '{}', 2, 0),
(184, 9, 41, -3, 0, 9, '{}', 6, 0),
(185, 9, 138, -2, 0, 6, '{}', 2, 0),
(186, 9, 116, -4, 0, 12, '{}', 11, 0),
(187, 6, 105, -4, 0, 12, '{}', 5, 0),
(188, 6, 38, 0, 0, 12, '{}', 7, 0),
(189, 7, 38, 0, 0, 12, '{}', 6, 0),
(190, 16, 107, -3, 0, 9, '{}', 4, 0),
(191, 16, 113, -3, 0, 9, '{}', 4, 0),
(192, 16, 129, 0, 0, 12, '{}', 6, 0),
(193, 16, 130, -2, 0, 6, '{}', 2, 0),
(194, 16, 101, -1, 0, 3, '{}', 1, 0),
(195, 16, 112, -1, 0, 3, '{}', 1, 0),
(196, 16, 117, -3, 0, 9, '{}', 4, 0),
(197, 16, 131, -1, 0, 3, '{}', 1, 0),
(198, 16, 132, -1, 0, 3, '{}', 1, 0),
(199, 16, 118, -3, 0, 9, '{}', 4, 0),
(200, 16, 100, -2, 0, 6, '{}', 2, 0),
(201, 16, 36, 0, 0, 12, '{}', 8, 0),
(202, 16, 133, -1, 0, 3, '{}', 1, 0),
(203, 16, 139, -3, 0, 9, '{}', 4, 0),
(204, 16, 37, -2, 0, 6, '{}', 3, 0),
(205, 16, 136, -2, 0, 6, '{}', 2, 0),
(206, 16, 105, -4, 0, 12, '{}', 5, 0),
(207, 16, 38, 0, 0, 12, '{}', 7, 0),
(208, 17, 101, -1, 0, 3, '{}', 1, 0),
(209, 17, 112, -1, 0, 3, '{}', 1, 0),
(210, 17, 117, -3, 0, 9, '{}', 5, 0),
(211, 17, 107, -2, 0, 6, '{}', 4, 0),
(212, 17, 118, -2, 0, 6, '{}', 4, 0),
(213, 17, 105, -3, 0, 9, '{}', 5, 0),
(214, 17, 114, -4, 0, 12, '{}', 7, 0),
(215, 17, 100, -1, 0, 3, '{}', 1, 0),
(216, 17, 115, -1, 0, 3, '{}', 1, 0),
(217, 17, 36, 0, 0, 12, '{}', 9, 0),
(218, 17, 133, -1, 0, 3, '{}', 1, 0),
(219, 17, 139, -2, 0, 6, '{}', 3, 0),
(220, 17, 39, -3, 0, 9, '{}', 5, 0),
(221, 17, 37, -1, 0, 3, '{}', 2, 0),
(222, 17, 111, -3, 0, 9, '{}', 5, 0),
(223, 17, 135, -4, 0, 12, '{}', 8, 0),
(224, 17, 108, -2, 0, 6, '{}', 4, 0),
(225, 17, 38, 0, 0, 12, '{}', 6, 0),
(226, 18, 107, -2, 0, 6, '{}', 3, 0),
(227, 18, 118, -1, 0, 3, '{}', 1, 0),
(228, 18, 105, -2, 0, 6, '{}', 3, 0),
(229, 18, 114, -4, 0, 12, '{}', 8, 0),
(230, 18, 115, -1, 0, 3, '{}', 1, 0),
(231, 18, 36, 0, 0, 12, '{}', 10, 0),
(232, 18, 37, -1, 0, 3, '{}', 2, 0),
(233, 18, 111, -3, 0, 9, '{}', 4, 0),
(234, 18, 135, -4, 0, 12, '{}', 9, 0),
(235, 18, 108, -2, 0, 6, '{}', 3, 0),
(236, 18, 103, -3, 0, 9, '{}', 5, 0),
(237, 18, 119, 0, 0, 9, '{}', 5, 0),
(238, 18, 38, 0, 0, 9, '{}', 6, 0),
(239, 18, 34, -3, 0, 9, '{}', 4, 0),
(240, 18, 137, -1, 0, 3, '{}', 1, 0),
(241, 18, 40, -2, 0, 6, '{}', 3, 0),
(242, 18, 41, -4, 0, 12, '{}', 7, 0),
(243, 19, 118, -1, 0, 3, '{}', 1, 0),
(244, 19, 105, -2, 0, 6, '{}', 2, 0),
(245, 19, 114, -4, 0, 12, '{}', 7, 0),
(246, 19, 115, -1, 0, 3, '{}', 1, 0),
(247, 19, 36, 0, 0, 12, '{}', 10, 0),
(248, 19, 134, -2, 0, 6, '{}', 2, 0),
(249, 19, 111, -3, 0, 9, '{}', 3, 0),
(250, 19, 135, -4, 0, 12, '{}', 8, 0),
(251, 19, 108, -1, 0, 3, '{}', 1, 0),
(252, 19, 119, 0, 0, 9, '{}', 4, 0),
(253, 19, 104, -4, 0, 12, '{}', 9, 0),
(254, 19, 38, 0, 0, 9, '{}', 5, 0),
(255, 19, 34, -3, 0, 9, '{}', 3, 0),
(256, 19, 137, -1, 0, 3, '{}', 1, 0),
(257, 19, 40, -2, 0, 6, '{}', 2, 0),
(258, 19, 41, -3, 0, 9, '{}', 6, 0),
(259, 19, 138, -2, 0, 6, '{}', 2, 0),
(260, 19, 116, -4, 0, 12, '{}', 11, 0),
(261, 20, 112, -1, 0, 3, '{}', 1, 0),
(262, 20, 133, -1, 0, 3, '{}', 1, 0),
(263, 20, 132, -1, 0, 3, '{}', 1, 0),
(264, 20, 131, -1, 0, 3, '{}', 1, 0),
(265, 20, 101, -1, 0, 3, '{}', 1, 0),
(266, 20, 100, -1, 0, 3, '{}', 2, 0),
(267, 20, 130, -1, 0, 3, '{}', 2, 0),
(268, 20, 136, -1, 0, 3, '{}', 2, 0),
(269, 20, 37, -1, 0, 3, '{}', 2, 0),
(270, 20, 139, -2, 0, 6, '{}', 4, 0),
(271, 20, 107, -2, 0, 6, '{}', 4, 0),
(272, 20, 118, -2, 0, 6, '{}', 4, 0),
(273, 20, 117, -2, 0, 6, '{}', 4, 0),
(274, 20, 113, -2, 0, 6, '{}', 4, 0),
(275, 20, 105, -3, 0, 9, '{}', 5, 0),
(276, 20, 129, -2, 0, 6, '{}', 3, 0),
(277, 20, 38, 0, 0, 9, '{}', 5, 0),
(278, 20, 36, 0, 0, 12, '{}', 8, 0),
(279, 20, 115, -2, 0, 6, '{}', 3, 0),
(280, 20, 108, -3, 0, 9, '{}', 5, 0),
(281, 20, 39, -3, 0, 9, '{}', 5, 0),
(282, 20, 111, -4, 0, 12, '{}', 6, 0),
(283, 20, 114, -4, 0, 12, '{}', 6, 0),
(284, 20, 135, -4, 0, 12, '{}', 6, 0),
(285, 20, 137, -2, 0, 6, '{}', 3, 0),
(286, 20, 40, -3, 0, 9, '{}', 5, 0),
(287, 20, 34, -2, 0, 6, '{}', 3, 0),
(288, 20, 103, -4, 0, 12, '{}', 6, 0),
(289, 20, 119, 0, 0, 6, '{}', 3, 0),
(290, 20, 41, -3, 0, 9, '{}', 5, 0),
(291, 20, 134, -3, 0, 9, '{}', 5, 0),
(292, 20, 138, -4, 0, 12, '{}', 6, 0),
(293, 20, 104, -4, 0, 12, '{}', 6, 0),
(294, 20, 116, -4, 0, 12, '{}', 7, 0),
(295, 21, 24, -1, 0, 3, '{}', 1, 0),
(296, 21, 121, -1, 0, 3, '{}', 1, 0),
(297, 21, 18, -1, 0, 3, '{}', 1, 0),
(298, 21, 26, -1, 0, 3, '{}', 1, 0),
(299, 21, 27, -2, 0, 6, '{}', 2, 0),
(300, 21, 22, -1, 0, 3, '{}', 1, 0),
(301, 21, 3, -1, 0, 3, '{}', 1, 0),
(302, 21, 30, -1, 0, 3, '{}', 1, 0),
(303, 21, 13, 0, 0, 9, '{}', 3, 0),
(304, 21, 16, -2, 0, 6, '{}', 2, 0),
(305, 21, 1, -1, 0, 3, '{}', 1, 0),
(306, 21, 19, -1, 0, 3, '{}', 1, 0),
(307, 21, 17, -1, 0, 3, '{}', 1, 0),
(308, 21, 127, 0, 0, 6, '{}', 2, 0),
(309, 21, 29, -4, 0, 12, '{}', 6, 0),
(310, 21, 4, -2, 0, 6, '{}', 2, 0),
(311, 21, 28, -2, 0, 6, '{}', 2, 0),
(312, 21, 124, -2, 0, 6, '{}', 2, 0),
(313, 21, 12, -3, 0, 9, '{}', 4, 0),
(314, 21, 7, -3, 0, 9, '{}', 5, 0),
(315, 21, 6, -4, 0, 12, '{}', 6, 0),
(316, 21, 14, -2, 0, 6, '{}', 2, 0),
(317, 21, 2, -2, 0, 6, '{}', 2, 0),
(318, 21, 8, -3, 0, 9, '{}', 5, 0),
(319, 21, 23, -3, 0, 9, '{}', 4, 0),
(320, 21, 126, -4, 0, 12, '{}', 6, 0),
(321, 21, 123, -3, 0, 9, '{}', 3, 0),
(322, 21, 33, -4, 0, 12, '{}', 6, 0),
(323, 21, 10, -4, 0, 12, '{}', 6, 0),
(324, 21, 5, -4, 0, 12, '{}', 6, 0),
(325, 21, 15, -3, 0, 9, '{}', 3, 0),
(326, 21, 9, -4, 0, 12, '{}', 6, 0),
(327, 21, 128, 0, 0, 12, '{}', 6, 0),
(328, 21, 21, -2, 0, 6, '{}', 2, 0),
(329, 21, 122, -3, 0, 9, '{}', 4, 0),
(330, 21, 125, 0, 0, 12, '{}', 6, 0),
(6982955553860947, 893267660401852769, 8167090132170212, 0, 0, 4, '{}', 2, 0),
(20783036590086547, 978031384826399275, 287191977551982414, 0, 0, 4, '{}', 2, 0),
(26531654266084901, 164396217452270499, 526449240817128216, 0, 0, 3, '{}', 1, 0),
(28765080902861764, 164396217452270499, 381560173417786639, 0, 0, 5, '{}', 3, 0),
(30809282590820164, 978031384826399275, 641005581663818746, 0, 0, 5, '{}', 3, 0),
(30955643268373833, 978031384826399275, 106292023749273809, 0, 0, 4, '{}', 2, 0),
(38951762944880966, 164396217452270499, 780239268110297426, 0, 0, 4, '{}', 2, 0),
(57749496712619751, 468517013885763775, 947888499401776245, 0, 0, 4, '{}', 2, 0),
(58439102178902923, 468517013885763775, 422774180929056345, 0, 0, 5, '{}', 3, 0),
(66889564746970004, 468517013885763775, 289370282561781891, 0, 0, 3, '{}', 1, 0),
(73700026433110095, 893267660401852769, 372372503378465419, 0, 0, 5, '{}', 3, 0),
(93280092771897559, 468517013885763775, 759246725226411733, 0, 0, 4, '{}', 2, 0),
(119173394190257432, 468517013885763775, 8167090132170212, 0, 0, 5, '{}', 3, 0),
(141214826634099395, 138226878474361245, 442118378614416332, 0, 0, 3, '{}', 0, 0),
(183886865402471338, 978031384826399275, 320145386418950751, 0, 0, 5, '{}', 3, 0),
(185797340226663635, 978031384826399275, 383099212367797661, 0, 0, 5, '{}', 3, 0),
(188187463471318605, 468517013885763775, 128131918432072102, 0, 0, 4, '{}', 2, 0),
(191533100567626805, 893267660401852769, 780239268110297426, 0, 0, 5, '{}', 3, 0),
(229846963844305141, 893267660401852769, 759246725226411733, 0, 0, 4, '{}', 2, 0),
(258148989833824034, 138226878474361245, 830363671445759356, 0, 0, 3, '{}', 0, 0),
(296663237701515089, 893267660401852769, 947888499401776245, 0, 0, 3, '{}', 1, 0),
(302775285759598152, 978031384826399275, 780239268110297426, 0, 0, 3, '{}', 1, 0),
(324194366924131626, 893267660401852769, 106292023749273809, 0, 0, 5, '{}', 3, 0),
(340749757625623163, 138226878474361245, 975320289599249997, 0, 0, 3, '{}', 0, 0),
(365765860127360851, 893267660401852769, 422774180929056345, 0, 0, 4, '{}', 2, 0),
(418671114778469842, 138226878474361245, 23, 0, 0, 3, '{}', 1, 0),
(450032193569291165, 164396217452270499, 320145386418950751, 0, 0, 5, '{}', 3, 0),
(462429916669624399, 164396217452270499, 383099212367797661, 0, 0, 5, '{}', 3, 0),
(477573348620198110, 893267660401852769, 349113967624760138, 0, 0, 5, '{}', 3, 0),
(480046437757863915, 164396217452270499, 106292023749273809, 0, 0, 4, '{}', 2, 0),
(501650945776002793, 893267660401852769, 526449240817128216, 0, 0, 4, '{}', 2, 0),
(512129696239549445, 978031384826399275, 349113967624760138, 0, 0, 4, '{}', 2, 0),
(548767808458178566, 164396217452270499, 624801013596243694, 0, 0, 4, '{}', 2, 0),
(554734439564681084, 138226878474361245, 402679938816729598, 0, 0, 3, '{}', 0, 0),
(567044835101427559, 372977977540301585, 975320289599249997, -2, 0, 3, '{}', 0, 0),
(584160865832850725, 468517013885763775, 40757270952468258, 0, 0, 4, '{}', 2, 0),
(608416265497433137, 164396217452270499, 8167090132170212, 0, 0, 4, '{}', 2, 0),
(622564843734788880, 164396217452270499, 699407983372123774, 0, 0, 5, '{}', 3, 0),
(631453600547730265, 978031384826399275, 8167090132170212, 0, 0, 3, '{}', 1, 0),
(649261744190141128, 372977977540301585, 442118378614416332, -2, 0, 3, '{}', 0, 0),
(682945813706476444, 468517013885763775, 349113967624760138, 0, 0, 5, '{}', 3, 0),
(692481456867349858, 978031384826399275, 566616550762297560, 0, 0, 3, '{}', 1, 0),
(726872495389763822, 978031384826399275, 381560173417786639, 0, 0, 4, '{}', 2, 0),
(777474637828242230, 138226878474361245, 154189429827819124, 0, 0, 3, '{}', 0, 0),
(800090544679834130, 164396217452270499, 422774180929056345, 0, 0, 3, '{}', 1, 0),
(846434945173785127, 138226878474361245, 967257522334282110, 0, 0, 3, '{}', 0, 0),
(875636376946675743, 164396217452270499, 84891370394422462, 0, 0, 3, '{}', 1, 0),
(879344771364527998, 372977977540301585, 830363671445759356, -2, 0, 3, '{}', 0, 0),
(882542196104849345, 468517013885763775, 80366709932627490, 0, 0, 3, '{}', 1, 0),
(897064005459083150, 978031384826399275, 699407983372123774, 0, 0, 5, '{}', 3, 0),
(900803874140264445, 164396217452270499, 40757270952468258, 0, 0, 3, '{}', 1, 0),
(919213604575883225, 978031384826399275, 40757270952468258, 0, 0, 3, '{}', 1, 0),
(923107354265561060, 893267660401852769, 40757270952468258, 0, 0, 3, '{}', 1, 0),
(925259288775928727, 893267660401852769, 84891370394422462, 0, 0, 3, '{}', 1, 0),
(931439996283682250, 893267660401852769, 128131918432072102, 0, 0, 3, '{}', 1, 0),
(933327751564263838, 138226878474361245, 123, 0, 0, 3, '{}', 1, 0),
(955507691477919841, 468517013885763775, 84891370394422462, 0, 0, 3, '{}', 1, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teamID` bigint(20) DEFAULT NULL,
  `questionKey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `teamID` (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `grade` int(11) NOT NULL,
  `gradeDetail` varchar(50) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nbStudents` int(11) NOT NULL,
  `nbTeamsEffective` int(11) NOT NULL DEFAULT '0',
  `nbStudentsEffective` int(11) NOT NULL DEFAULT '0',
  `contestID` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `expectedStartTime` datetime DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `noticePrinted` tinyint(4) NOT NULL,
  `isPublic` tinyint(4) NOT NULL,
  `bRecovered` tinyint(1) NOT NULL DEFAULT '0',
  `participationType` enum('Official','Unofficial') DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `password` (`password`),
  KEY `userID` (`userID`),
  KEY `schoolID` (`schoolID`),
  KEY `contestID` (`contestID`),
  KEY `name` (`name`),
  KEY `participationType` (`participationType`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `group`
--

INSERT INTO `group` (`ID`, `schoolID`, `grade`, `gradeDetail`, `userID`, `name`, `nbStudents`, `nbTeamsEffective`, `nbStudentsEffective`, `contestID`, `code`, `password`, `expectedStartTime`, `startTime`, `noticePrinted`, `isPublic`, `bRecovered`, `participationType`, `iVersion`) VALUES
(3, 32, 0, '', 0, 'Castor 2011, niveau 6ème/5ème', 0, 21518, 25826, 1, '2tyzepcv', 'sjqr6f4m', '0000-00-00 00:00:00', '2012-09-09 00:26:05', 0, 0, 0, 'Official', 0),
(9, 0, 0, '', 4, 'Castor 2011, niveau 4ème/3ème', 0, 10259, 12969, 2, '5ayk8q4n', 'cazez8wq', '0000-00-00 00:00:00', '2012-09-09 21:22:05', 0, 0, 0, 'Official', 0),
(10, 0, 0, '', 4, 'Castor 2011, niveau 2nde', 0, 2805, 3500, 3, 'dayeh4d9', 'kigdv7ky', '0000-00-00 00:00:00', '2012-09-09 21:22:37', 0, 0, 0, 'Official', 0),
(11, 0, 0, '', 4, 'Castor 2011, niveau 1ère/terminale', 0, 3144, 3781, 4, 'jbnxqzwy', 'kmbbrd3a', '0000-00-00 00:00:00', '2012-09-09 21:23:07', 0, 0, 0, 'Official', 0),
(12, 0, 0, '0', 0, 'Castor 2011, toutes les questions', 0, 8, 9, 21, 'fsaunlfaj', 'vxmzunp', NULL, '2012-12-08 21:44:01', 0, 0, 0, 'Unofficial', 0),
(8477, 0, 0, '', 0, 'Castor 2012, niveau 6ème/5ème', 0, 1203, 1434, 16, 'ascsataw', '', NULL, '2012-11-26 00:54:06', 0, 0, 0, NULL, 0),
(8478, 0, 0, '0', 0, 'Castor 2012, niveau 4ème/3ème', 0, 860, 1005, 17, 'afrsotan', 'atsaoio', NULL, '2012-11-26 05:55:06', 0, 0, 0, NULL, 0),
(8479, 0, 0, '0', 0, 'Castor 2012, niveau 2nde', 0, 313, 363, 18, 'atastosai', 'jhfauhljl', NULL, '2012-11-26 07:14:01', 0, 0, 0, NULL, 0),
(8480, 0, 0, '0', 0, 'Castor 2012, niveau 1ère/terminale', 0, 365, 414, 19, 'oasfiojji', 'rwrijji;', NULL, '2012-11-26 00:56:27', 0, 0, 0, NULL, 0),
(8487, 0, 0, '0', 0, 'Castor 2012, toutes les questions', 0, 43, 44, 20, 'arzfatisx', 'aptscmnu', NULL, '2012-12-08 21:05:16', 0, 0, 0, 'Unofficial', 0),
(661264754899514079, 458111176947192449, 12, '', 758180684719844715, 'Senior_2015', 10000, 1, 1, 978031384826399275, 'w352zz87', 'mg2rjsw7', '0000-00-00 00:00:00', '2015-12-02 19:06:18', 0, 1, 0, 'Unofficial', 0),
(765752644596188675, 458111176947192449, 10, '', 758180684719844715, 'Junior_2015', 10000, 2, 2, 164396217452270499, 'utmdcm2d', '5f8bww9m', '0000-00-00 00:00:00', '2015-12-02 19:05:21', 0, 1, 0, 'Unofficial', 0),
(931149096809778668, 458111176947192449, 6, '', 758180684719844715, 'benjamin_2015', 10000, 73, 73, 468517013885763775, 'ppdsiji3', 'tim866be', '0000-00-00 00:00:00', '2015-11-29 17:30:18', 0, 1, 0, 'Unofficial', 0),
(986124289568638022, 458111176947192449, 8, '', 758180684719844715, 'Cadet_2015', 10000, 24, 24, 893267660401852769, 'qwidxyje', 'dtmzurri', '0000-00-00 00:00:00', '2015-11-29 20:13:17', 0, 1, 0, 'Unofficial', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `history_contest`
--

CREATE TABLE IF NOT EXISTS `history_contest` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `status` enum('FutureContest','RunningContest','PastContest','Other','Hidden','Closed') NOT NULL DEFAULT 'Hidden',
  `nbMinutes` int(11) NOT NULL,
  `bonusScore` int(11) NOT NULL DEFAULT '0',
  `allowTeamsOfTwo` int(11) NOT NULL DEFAULT '0',
  `fullFeedback` tinyint(1) NOT NULL DEFAULT '0',
  `nextQuestionAuto` tinyint(1) NOT NULL DEFAULT '1',
  `newInterface` tinyint(4) NOT NULL,
  `folder` varchar(50) NOT NULL,
  `minAward1Rank` int(11) DEFAULT NULL,
  `minAward2Rank` int(11) DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_contestant`
--

CREATE TABLE IF NOT EXISTS `history_contestant` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `genre` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `teamID` bigint(20) NOT NULL,
  `cached_schoolID` bigint(20) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `schoolRank` int(11) DEFAULT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `orig_firstName` varchar(50) DEFAULT NULL,
  `orig_lastName` varchar(50) DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `teamID` (`teamID`),
  KEY `cached_schoolID` (`cached_schoolID`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_contest_question`
--

CREATE TABLE IF NOT EXISTS `history_contest_question` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `contestID` bigint(20) NOT NULL,
  `questionID` bigint(20) NOT NULL,
  `minScore` int(11) DEFAULT NULL,
  `noAnswerScore` int(11) NOT NULL DEFAULT '0',
  `maxScore` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `options` varchar(200) NOT NULL DEFAULT '{}',
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `contestID` (`contestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_group`
--

CREATE TABLE IF NOT EXISTS `history_group` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `grade` int(11) NOT NULL,
  `gradeDetail` varchar(50) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nbStudents` int(11) NOT NULL,
  `nbTeamsEffective` int(11) NOT NULL DEFAULT '0',
  `nbStudentsEffective` int(11) NOT NULL DEFAULT '0',
  `contestID` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `expectedStartTime` datetime DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `noticePrinted` tinyint(4) NOT NULL,
  `isPublic` tinyint(4) NOT NULL,
  `participationType` enum('Official','Unofficial') DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `code` (`code`),
  KEY `password` (`password`),
  KEY `userID` (`userID`),
  KEY `schoolID` (`schoolID`),
  KEY `contestID` (`contestID`),
  KEY `name` (`name`),
  KEY `participationType` (`participationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_languages`
--

CREATE TABLE IF NOT EXISTS `history_languages` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `name` (`name`),
  KEY `suffix` (`suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_question`
--

CREATE TABLE IF NOT EXISTS `history_question` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `key` varchar(30) NOT NULL,
  `folder` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `answerType` tinyint(4) NOT NULL,
  `expectedAnswer` text,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_school`
--

CREATE TABLE IF NOT EXISTS `history_school` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `region` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `coords` varchar(100) NOT NULL DEFAULT '0,0,0',
  `nbStudents` int(11) NOT NULL,
  `validated` tinyint(4) NOT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `saniMsg` text NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL,
  `orig_city` varchar(50) DEFAULT NULL,
  `orig_country` varchar(50) DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_school_user`
--

CREATE TABLE IF NOT EXISTS `history_school_user` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `ownGroupsContestants` int(11) NOT NULL DEFAULT '0',
  `awardsReceivedYear` int(11) DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `schoolID` (`schoolID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_school_year`
--

CREATE TABLE IF NOT EXISTS `history_school_year` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `nbOfficialContestants` int(11) NOT NULL,
  `awarded` tinyint(4) NOT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  UNIQUE KEY `schoolID_2` (`schoolID`,`year`),
  KEY `schoolID` (`schoolID`,`year`),
  KEY `nbOfficialContestants` (`nbOfficialContestants`),
  KEY `awarded` (`awarded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_team`
--

CREATE TABLE IF NOT EXISTS `history_team` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `groupID` bigint(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cached_contestants` varchar(300) NOT NULL,
  `participationType` enum('Official','Unofficial') DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `password` (`password`),
  KEY `score` (`score`),
  KEY `groupID` (`groupID`),
  KEY `participationType` (`participationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_team_connection`
--

CREATE TABLE IF NOT EXISTS `history_team_connection` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `teamID` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_user`
--

CREATE TABLE IF NOT EXISTS `history_user` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `isOwnOfficialEmail` tinyint(1) DEFAULT NULL,
  `officialEmail` varchar(50) DEFAULT NULL COMMENT 'validates that the user is a teacher',
  `officialEmailValidated` tinyint(4) NOT NULL,
  `alternativeEmail` varchar(50) DEFAULT NULL,
  `alternativeEmailValidated` tinyint(4) NOT NULL,
  `salt` varchar(40) NOT NULL,
  `passwordMd5` varchar(40) NOT NULL,
  `recoverCode` varchar(50) NOT NULL,
  `validated` tinyint(11) NOT NULL COMMENT 'account validated as an admin for the given school',
  `awardPrintingDate` date DEFAULT NULL,
  `allowMultipleSchools` tinyint(4) NOT NULL,
  `isAdmin` tinyint(4) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `lastLoginDate` datetime NOT NULL,
  `comment` text NOT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `orig_firstName` varchar(50) DEFAULT NULL,
  `orig_lastName` varchar(50) DEFAULT NULL,
  `iVersion` int(11) DEFAULT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `officialEmail` (`officialEmail`),
  KEY `alternativeEmail` (`alternativeEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `history_user_user`
--

CREATE TABLE IF NOT EXISTS `history_user_user` (
  `historyID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `targetUserID` bigint(20) NOT NULL,
  `accessType` enum('none','read','write') NOT NULL DEFAULT 'none',
  `iVersion` int(11) NOT NULL,
  `iNextVersion` int(11) DEFAULT NULL,
  `bDeleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`historyID`),
  KEY `ID` (`ID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `suffix` varchar(50) CHARACTER SET utf8 NOT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `suffix` (`suffix`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- テーブルのデータのダンプ `languages`
--

INSERT INTO `languages` (`ID`, `name`, `suffix`, `iVersion`) VALUES
(1, 'French', 'fr', 0),
(2, 'English', 'en', 0),
(3, '', '', 588);

-- --------------------------------------------------------

--
-- テーブルの構造 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `ID` bigint(20) NOT NULL,
  `key` varchar(30) NOT NULL,
  `folder` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `answerType` tinyint(4) NOT NULL,
  `expectedAnswer` text,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `question`
--

INSERT INTO `question` (`ID`, `key`, `folder`, `name`, `answerType`, `expectedAnswer`, `iVersion`) VALUES
(1, '2011-AT-12', '2011', 'Couleur des chaussures', 0, '4', 0),
(2, '2011-CH-03', '2011', 'Planter des poteaux', 0, '1', 0),
(3, '2011-AT-08', '2011', 'Sauts de grenouille', 0, '2', 0),
(4, '2011-AT-11', '2011', 'Transport fluvial', 1, '010001001001', 0),
(5, '2011-AT-14', '2011', 'Mot de passe', 0, '4', 0),
(6, '2011-CH-05', '2011', 'Le langage aibi', 0, '3', 0),
(7, '2011-CH-10', '2011', 'La pièce manquante', 0, '2', 0),
(8, '2011-CZ-02', '2011', 'Plié et découpé', 0, '3', 0),
(9, '2011-DE-01', '2011', 'Une vie de plante', 0, '1', 0),
(10, '2011-DE-02', '2011', 'CuSphère et QuatreCyl', 0, '1', 0),
(11, '2011-DE-03', '2011', 'Cache cache', 1, '7', 0),
(12, '2011-DE-19', '2011', 'Boîtes de billes', 0, '3', 0),
(13, '2011-CH-02', '2011', 'Mosaïque', 1, '0100010111101101', 0),
(14, '2011-DE-20', '2011', 'Lancers de dé', 0, '4', 0),
(15, '2011-FI-04', '2011', 'Trésor caché', 1, '7', 0),
(16, '2011-FR-01', '2011', 'Fenêtre d''impression', 0, '3', 0),
(17, '2011-FR-03', '2011', 'Le prénom du héron', 0, '2', 0),
(18, '2011-FR-05', '2011', 'Castor bûcheron', 1, 'B', 0),
(19, '2011-IL-01', '2011', 'Balance', 0, '1', 0),
(20, '2011-IL-04', '2011', 'Rangée de billes rouges et bleues', 0, '3', 0),
(21, '2011-IT-09', '2011', 'Retour à la maison', 0, '2', 0),
(22, '2011-IT-14', '2011', 'Canettes et bouteilles', 0, '3', 0),
(23, '2011-JP-06', '2011', 'Prévenir les élèves', 0, '2', 0),
(24, '2011-LT-01', '2011', 'Capteur RVB', 0, '4', 0),
(25, '2011-LT-12', '2011', 'Graphe d''un dé', 0, '4', 0),
(26, '2011-LT-14', '2011', 'Voyage en Lituanie', 0, '4', 0),
(27, '2011-NL-08', '2011', 'Alphabet noir et blanc', 1, 'H', 0),
(28, '2011-NL-12', '2011', 'Mauvais chapeau', 0, '4', 0),
(29, '2011-SK-02', '2011', 'Piles d''assiettes', 0, '1', 0),
(30, '2011-SK-06', '2011', 'Robot tortue', 0, '1', 0),
(33, '2011-JP-01', '2011', 'Transport ferroviaire', 1, '12', 0),
(34, '2012-FR-06', '2012', 'Trombone rouge', 1, 'i2i7i10i14', 0),
(36, '2012-FR-08', '2012', 'Dessine un castor', 1, '1101010110100001010111110111111000000110010110011', 0),
(37, '2012-AT-04', '2012', 'Image pixellisée', 1, '111111000011110001110111100000011101110001110111111111000011', 0),
(38, '2012-FR-01', '2012', 'Course de grenouilles', 2, '', 0),
(39, '2012-HU-01a', '2012', 'Puzzle rotatif', 1, '0,1', 0),
(40, '2012-SK-10', '2012', 'Convocations', 1, 'BCDA', 0),
(41, '2012-FR-07', '2012', 'Territoire de Castor', 2, '', 0),
(100, '2012-AT-01', '2012', 'Paysage', 0, '2', 0),
(101, '2012-AT-10', '2012', 'Vélos branchés', 0, '2', 0),
(102, '2012-AT-12', '2012', 'Robot bâtisseur', 0, '3', 0),
(103, '2012-CA-01', '2012', 'Changer les flèches', 0, '4', 0),
(104, '2012-CH-09', '2012', 'La scierie', 1, '7', 0),
(105, '2012-CZ-04', '2012', 'Bébrocarina', 0, '4', 0),
(107, '2012-DE-07', '2012', 'Sélection de robots', 1, '5', 0),
(108, '2012-DE-10', '2012', 'Groupe de travail', 0, '4', 0),
(109, '2012-FI-03', '2012', 'Code Castor', 0, '3', 0),
(111, '2012-FR-09', '2012', 'Découpe', 0, '4', 0),
(112, '2012-FR-10', '2012', 'La chute', 0, '4', 0),
(113, '2012-IT-04', '2012', 'Navigation', 0, '4', 0),
(114, '2012-IT-13', '2012', '¼ufs de pâques', 1, '0101', 0),
(115, '2012-RU-03', '2012', 'Affichage digital', 0, '3', 0),
(116, '2012-RU-05', '2012', 'Tas de pierres', 0, '4', 0),
(117, '2012-SI-06', '2012', 'La boîte magique', 0, '2', 0),
(118, '2012-SK-02', '2012', 'Machine à textes', 0, '3', 0),
(119, '2012-UA-07', '2012', 'Verres', 1, '3', 0),
(121, '2011-SK-08', '2011', 'Les amis de Lucie', 1, '010110011110', 0),
(122, '2011-SK-11', '2011', 'Les photos de Lucie', 1, '10100000001', 0),
(123, '2011-NL-11', '2011', 'Castor facteur', 0, '3', 0),
(124, '2011-UA-07', '2011', 'Championnat d''échecs', 0, '3', 0),
(125, '2011-CH-01', '2011', 'Mosaïque cassée', 1, '01101100', 0),
(126, '2011-IL-11', '2011', 'Atteindre 51', 1, '9', 0),
(127, '2011-FR-06', '2011', 'Exploration souterraine', 2, '', 0),
(128, '2011-FR-07', '2011', 'Ranger sa chambre', 2, '', 0),
(129, '2012-CZ-12', '2012', 'Labyrinthe', 1, '0312210010', 0),
(131, '2012-SK-03', '2012', 'Animation', 0, '4', 0),
(132, '2012-ES-04', '2012', 'Tuyauterie', 1, '00011', 0),
(133, '2012-FR-02b', '2012', 'Ranger ses photos', 0, '3', 0),
(134, '2012-AT-20', '2012', 'Trier des bâtons', 0, '2', 0),
(135, '2012-FR-04', '2012', 'Anonymisation', 0, '7', 0),
(136, '2012-FR-04b', '2012', 'Chez le dentiste', 1, '3', 0),
(137, '2012-HU-06', '2012', 'Généalogie', 0, '1', 0),
(138, '2012-LV-02', '2012', 'Transport de troncs', 0, '2', 0),
(139, '2012-DE-05', '2012', 'Plantons des fleurs', 0, '1', 0),
(8167090132170212, '2015-LT-04-JP', '2015', '色鉛筆ならべ', 0, '1', 0),
(40757270952468258, '2015-ZA-03-JP', '2015', 'マラソン', 0, '2', 0),
(80366709932627490, '2015-UA-04-JP-NI', '2015', 'マッシュルーム', 0, '3', 0),
(84891370394422462, '2015-CZ-01-JP', '2015', '木の実で作った動物', 0, '1', 0),
(106292023749273809, '2015-SK-01-JP', '2015', '2台のロボット', 0, '4', 0),
(128131918432072102, '2015-JP-02-JP-NI', '2015', 'アニメーション', 0, '4', 0),
(154189429827819124, 'berver_tunnel', 'Benjamin', 'ビーバートンネル', 0, '3', 0),
(287191977551982414, '2015-CA-02-JP', '2015', '花火', 0, '5', 0),
(289370282561781891, '2015-HU-02-JP', '2015', '朝食の準備', 0, '3', 0),
(320145386418950751, '2015-SI-06-JP', '2015', 'スパイ', 1, '4', 0),
(349113967624760138, '2015-RU-02-JP', '2015', 'チャホリビ', 0, '4', 0),
(372372503378465419, '2015-JP-01-JP', '2015', '工作', 0, '2', 0),
(381560173417786639, '2015-IL-02-JP', '2015', '最短経路', 0, '1', 0),
(383099212367797661, '2015-SI-07-JP', '2015', '海賊', 0, '4', 0),
(402679938816729598, 'bike', 'Benjamin', '自転車', 0, '2', 0),
(422774180929056345, '2015-CZ-09-JP', '2015', '動物競争', 0, '4', 0),
(442118378614416332, 'rotation', 'Benjamin', '回転命令', 0, '4', 0),
(475839761396548194, 'free_input_tmp', 'Benjamin', 'free_input_tmp', 1, '', 0),
(526449240817128216, '2015-AT-01-JP', '2015', '能力の継承', 0, '4', 0),
(566616550762297560, '2015-JP-05-JP', '2015', '海外旅行', 0, '3', 0),
(596239775373414667, 'task1', 'testContest', '暗号化', 1, '', 0),
(624801013596243694, '2015-SK-04-JP', '2015', 'スポットライト', 0, '4', 0),
(641005581663818746, '2015-TW-04-JP', '2015', '石取りゲーム', 0, '3', 0),
(699407983372123774, '2015-DE-05-JP', '2015', 'モビール', 0, '1', 0),
(759246725226411733, '2015-JP-03-JP', '2015', 'ビーバー会議', 0, '3', 0),
(780239268110297426, '2015-RU-04-JP', '2015', '必ず曲がること', 0, '2', 0),
(819618429312060016, 'choice_tmp', 'Benjamin', 'タイトル', 0, '3', 0),
(830363671445759356, 'apple_broad', 'Benjamin', 'りんごひろい', 0, '1', 0),
(877536664406548207, 'test', 'Benjamin', 'test', 0, '', 0),
(947888499401776245, '2015-FR-02-JP', '2015', '秘密を伝えよう', 1, '8', 0),
(967257522334282110, 'spin_door', 'Benjamin', '回転とびら', 0, '2', 0),
(975320289599249997, 'three_primary_colors', 'Benjamin', '三原色', 0, '4', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_academy`
--

CREATE TABLE IF NOT EXISTS `recommend_academy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domain` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_academy_department`
--

CREATE TABLE IF NOT EXISTS `recommend_academy_department` (
  `academyID` int(11) NOT NULL AUTO_INCREMENT,
  `departement` int(11) NOT NULL,
  PRIMARY KEY (`departement`),
  KEY `academieID` (`academyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_listedschool`
--

CREATE TABLE IF NOT EXISTS `recommend_listedschool` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `academyID` int(3) unsigned NOT NULL,
  `numero_uai` varchar(8) DEFAULT NULL,
  `appellation_officielle_uai` varchar(155) DEFAULT NULL,
  `denomination_principale_uai` varchar(32) DEFAULT NULL,
  `patronyme_uai` varchar(33) DEFAULT NULL,
  `secteur_public_prive` varchar(2) DEFAULT NULL,
  `adresse_uai` varchar(36) DEFAULT NULL,
  `lieu_dit_uai` varchar(26) DEFAULT NULL,
  `boite_postale_uai` varchar(7) DEFAULT NULL,
  `code_postal_uai` varchar(5) DEFAULT NULL,
  `localite_acheminement_uai` varchar(26) DEFAULT NULL,
  `X` varchar(8) DEFAULT NULL,
  `Y` varchar(8) DEFAULT NULL,
  `app` varchar(9) DEFAULT NULL,
  `loc` varchar(23) DEFAULT NULL,
  `etat_etablissement` int(1) DEFAULT NULL,
  `nature_uai` int(3) DEFAULT NULL,
  `lib_nature` varchar(40) DEFAULT NULL,
  `sous_fic` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `academieID` (`academyID`),
  KEY `nature_uai` (`nature_uai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_listedschool_normalized`
--

CREATE TABLE IF NOT EXISTS `recommend_listedschool_normalized` (
  `listedschoolID` int(11) NOT NULL,
  `codePostal` varchar(5) NOT NULL,
  `lastWord` varchar(200) NOT NULL,
  `normalizedName` varchar(200) NOT NULL,
  PRIMARY KEY (`listedschoolID`),
  KEY `normalizedName` (`normalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_school_listedschool`
--

CREATE TABLE IF NOT EXISTS `recommend_school_listedschool` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolID` bigint(20) NOT NULL,
  `listedschoolID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `schoolID` (`schoolID`),
  KEY `etablissementID` (`listedschoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `recommend_user`
--

CREATE TABLE IF NOT EXISTS `recommend_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `ID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `region` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `coords` varchar(100) NOT NULL DEFAULT '0,0,0',
  `nbStudents` int(11) NOT NULL,
  `validated` tinyint(4) NOT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `orig_name` varchar(100) DEFAULT NULL,
  `orig_city` varchar(50) DEFAULT NULL,
  `orig_country` varchar(50) DEFAULT NULL,
  `saniMsg` text NOT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `school`
--

INSERT INTO `school` (`ID`, `userID`, `name`, `region`, `address`, `zipcode`, `city`, `country`, `coords`, `nbStudents`, `validated`, `saniValid`, `orig_name`, `orig_city`, `orig_country`, `saniMsg`, `iVersion`) VALUES
(458111176947192449, 825721883128986850, 'Nihon University', '0', '3-25-40, Sakurajosui, Setagaya-ku, Tokyo', '156-8550', 'Tokyo', 'Japan', '0,0,0', 10000, 1, 1, NULL, NULL, NULL, 'Invalid school category for ''Nihon University'';Too Many Map Results : Nihon University,3-25-40, Sakurajosui, Setagaya-ku, Tokyo,156-8550,Tokyo,JapanToo Many Map Results : Nihon University,3-25-40, Sakurajosui, Setagaya-ku, Tokyo,156-8550,Tokyo,JapanToo Many Map Results : Nihon University,3-25-40, Sakurajosui, Setagaya-ku, Tokyo,156-8550,Tokyo,Japan', 0),
(838181507701675843, 758180684719844715, 'Nihon University', '1', '3-25-40, Sakurajosui, Setagaya-ku, Tokyo', '156-8550', 'Tokyo', 'Japan', '0,0,0', 10000, 0, 0, NULL, NULL, NULL, 'Invalid school category for ''Nihon University'';Too Many Map Results : Nihon University,3-25-40, Sakurajosui, Setagaya-ku, Tokyo,156-8550,Tokyo,JapanToo Many Map Results : Nihon University,3-25-40, Sakurajosui, Setagaya-ku, Tokyo,156-8550,Tokyo,Japan', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `school_user`
--

CREATE TABLE IF NOT EXISTS `school_user` (
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `ownGroupsContestants` int(11) NOT NULL DEFAULT '0',
  `awardsReceivedYear` int(11) DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `schoolID` (`schoolID`,`userID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `school_user`
--

INSERT INTO `school_user` (`ID`, `schoolID`, `userID`, `confirmed`, `ownGroupsContestants`, `awardsReceivedYear`, `iVersion`) VALUES
(599054958822167207, 458111176947192449, 758180684719844715, 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `school_year`
--

CREATE TABLE IF NOT EXISTS `school_year` (
  `ID` bigint(20) NOT NULL,
  `schoolID` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `nbOfficialContestants` int(11) NOT NULL,
  `awarded` tinyint(4) NOT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `schoolID_2` (`schoolID`,`year`),
  KEY `schoolID` (`schoolID`,`year`),
  KEY `nbOfficialContestants` (`nbOfficialContestants`),
  KEY `awarded` (`awarded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `synchro_version`
--

CREATE TABLE IF NOT EXISTS `synchro_version` (
  `iVersion` int(11) NOT NULL,
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `synchro_version`
--

INSERT INTO `synchro_version` (`iVersion`) VALUES
(1);

-- --------------------------------------------------------

--
-- テーブルの構造 `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `ID` bigint(20) NOT NULL,
  `groupID` bigint(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cached_contestants` varchar(300) NOT NULL,
  `participationType` enum('Official','Unofficial','Undefined') DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `password` (`password`),
  KEY `score` (`score`),
  KEY `groupID` (`groupID`),
  KEY `participationType` (`participationType`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `team`
--

INSERT INTO `team` (`ID`, `groupID`, `password`, `startTime`, `endTime`, `score`, `cached_contestants`, `participationType`, `iVersion`) VALUES
(4677474517632100, 986124289568638022, 'ibc22tbx', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(7080778747183221, 931149096809778668, 'b4r7e3yq', '2015-12-02 19:01:41', '2015-12-02 19:01:47', 0, '', NULL, 0),
(7315437246910723, 79933949510357990, 'bhe75sj8', '2015-11-26 00:31:54', NULL, NULL, '', NULL, 0),
(12231166085200373, 931149096809778668, '4bw4ar2e', '2015-12-02 13:49:06', '2015-12-02 13:49:12', 0, '', NULL, 0),
(12952303415879279, 79933949510357990, 'ccufi6ub', '2015-11-21 21:33:19', NULL, NULL, '', NULL, 0),
(13731300519486454, 986124289568638022, 'hzmr4rjf', '2015-12-02 15:56:48', '2015-12-02 15:57:20', 0, '', NULL, 0),
(14807590212337296, 986124289568638022, '4t3ck27c', '2015-12-02 18:29:36', '2015-12-02 18:29:41', 0, '', NULL, 0),
(15382315774629000, 931149096809778668, 'mtjn85un', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(16619238218710515, 931149096809778668, 'j24a95tz', '2015-12-02 14:59:09', '2015-12-02 14:59:15', 0, '', NULL, 0),
(20120599911617373, 931149096809778668, 'pvdvswr3', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(23844591497093056, 931149096809778668, 'php8dwn5', '2015-11-30 14:52:39', '2015-11-30 14:53:00', 0, '', NULL, 0),
(25414793456158758, 79933949510357990, 'kab93kyg', '2015-11-21 21:36:09', NULL, NULL, '', NULL, 0),
(29124095756717164, 79933949510357990, 'qegz7m8c', '2015-11-17 23:26:03', '2015-11-20 00:05:22', NULL, '', NULL, 0),
(30109827843290277, 931149096809778668, '4xy7vtbp', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(32769915849298700, 21715298017062108, 'q596kezq', '2015-11-19 15:21:52', '2015-11-20 01:09:24', NULL, '', NULL, 0),
(34779321849353680, 191599963807034521, 'x87d3kw7', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(37613631254132268, 931149096809778668, 'r9bb9xgd', '2015-12-02 16:54:37', '2015-12-02 16:55:25', 0, '', NULL, 0),
(47976483608609754, 79933949510357990, '4d5zaph7', '2015-11-17 23:23:58', '2015-11-19 15:13:26', NULL, '', NULL, 0),
(57181655662808196, 79933949510357990, 'gep3qj7y', '2015-11-26 00:16:20', NULL, NULL, '', NULL, 0),
(58736360819088913, 79933949510357990, 'p84n64g2', '2015-11-26 00:28:17', NULL, NULL, '', NULL, 0),
(60234490232326423, 931149096809778668, 'wqf93zvi', '2015-12-02 17:12:38', NULL, NULL, '', NULL, 0),
(65902444667138274, 191599963807034521, 'audq4cy6', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(72255052835645398, 79933949510357990, 'ytfx7y4t', '2015-11-26 14:16:17', NULL, NULL, '', NULL, 0),
(75081288253422736, 79933949510357990, 'i6xx3wq7', '2015-11-20 14:25:03', '2015-11-20 14:31:45', 6, '', NULL, 0),
(75787559586508201, 79933949510357990, 't6u5gf6x', '2015-11-26 00:18:33', NULL, NULL, '', NULL, 0),
(75947326801092838, 931149096809778668, '7czg4m6z', '2015-11-30 14:56:37', NULL, NULL, '', NULL, 0),
(76231858752714301, 765752644596188675, 'cjxp4syf', '2015-12-02 19:09:27', '2015-12-02 19:09:38', 0, '', NULL, 0),
(77946303357276208, 986124289568638022, 'pnky7kmt', '2015-12-02 16:49:56', '2015-12-02 16:50:12', 0, '', NULL, 0),
(79673501498395792, 931149096809778668, 'q9akpumj', '2015-12-02 18:32:08', NULL, NULL, '', NULL, 0),
(80877774859919675, 931149096809778668, '3aq63kdz', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(82663560771244493, 79933949510357990, '7nvaavfb', '2015-11-17 23:34:27', NULL, NULL, '', NULL, 0),
(82667673516313629, 79933949510357990, '84w6agk4', '2015-11-18 07:00:45', '2015-11-18 07:01:19', NULL, '', NULL, 0),
(85919970169164090, 224029385455320204, 'ei23ewdc', '2015-11-20 12:26:33', '2015-11-20 12:26:42', 23, '', NULL, 0),
(87060270107277048, 79933949510357990, 'daxfyx7g', '2015-11-21 21:31:45', '2015-11-21 21:32:17', 6, '', NULL, 0),
(88062563770860735, 931149096809778668, '3m4nvwwg', '2015-12-02 15:52:40', '2015-12-02 15:55:05', 0, '', NULL, 0),
(88344882766899764, 79933949510357990, 'nmxmw37x', '2015-11-20 00:39:16', '2015-11-20 00:39:24', NULL, '', NULL, 0),
(88892905761030118, 79933949510357990, 'i5kvymjb', '2015-11-21 21:12:02', NULL, NULL, '', NULL, 0),
(92562562460906657, 79933949510357990, '9gpxxuze', '2015-11-21 21:30:57', NULL, NULL, '', NULL, 0),
(94909983443289995, 931149096809778668, '5uqrkq5g', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(95906382556997166, 931149096809778668, 'zx2xrbdg', '2015-12-02 17:21:13', '2015-12-02 17:21:25', 0, '', NULL, 0),
(97280043935778949, 79933949510357990, '4shd4cmv', '2015-11-17 23:33:52', '2015-11-19 15:30:42', NULL, '', NULL, 0),
(101042409549635024, 986124289568638022, 'c2wan98a', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(104485268724178051, 79933949510357990, 'qawv8pzy', '2015-11-26 00:28:33', NULL, NULL, '', NULL, 0),
(108996288490435971, 931149096809778668, 'pf22mksk', '2015-11-30 14:53:09', NULL, NULL, '', NULL, 0),
(123144622893100845, 931149096809778668, 'bpefjtat', '2015-12-02 15:48:00', '2015-12-02 15:50:13', 0, '', NULL, 0),
(126383874547818175, 191599963807034521, 'hppxj7ry', '2015-11-17 22:49:28', NULL, NULL, '', NULL, 0),
(127321723434842957, 79933949510357990, 'u4nbx9ds', '2015-11-21 21:34:00', NULL, NULL, '', NULL, 0),
(131019942803547710, 79933949510357990, 'z4y6bvtx', '2015-11-20 01:05:02', '2015-11-20 01:05:15', NULL, '', NULL, 0),
(134968316243559005, 931149096809778668, 'dt8pgbhp', '2015-12-02 13:46:34', NULL, NULL, '', NULL, 0),
(137267684177093299, 520908369516549732, 'b4svgfjm', '2015-11-19 15:34:28', '2015-11-20 00:03:11', NULL, '', NULL, 0),
(138071566748090075, 79933949510357990, 'eh5pxjqp', '2015-11-18 06:15:23', '2015-11-18 06:25:08', NULL, '', NULL, 0),
(148285902774565636, 79933949510357990, 'q7hvnb35', '2015-11-26 00:15:50', NULL, NULL, '', NULL, 0),
(156971923479189270, 79933949510357990, '4hkra7wu', '2015-11-20 01:05:46', '2015-11-20 01:05:52', NULL, '', NULL, 0),
(172537402142770850, 931149096809778668, 'xxxdhj68', '2015-11-29 19:51:49', '2015-11-29 19:54:05', 17, '', NULL, 0),
(174552131325841755, 79933949510357990, 'v4cqvc88', '2015-11-27 16:06:03', NULL, NULL, '', NULL, 0),
(178071925448910026, 191599963807034521, 'pcvt3bpf', '2015-11-17 22:52:41', NULL, NULL, '', NULL, 0),
(202705149566500883, 931149096809778668, 'yve8wejq', '2015-12-02 13:59:28', '2015-12-02 14:00:26', 0, '', NULL, 0),
(204962790233542189, 986124289568638022, '72692dii', '2015-12-01 17:42:32', '2015-12-01 17:42:47', 0, '', NULL, 0),
(215460025414286632, 931149096809778668, 'pqm78zab', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(216977746621567980, 79933949510357990, '94bnrjmq', '2015-11-20 13:39:06', '2015-11-20 13:39:19', 0, '', NULL, 0),
(223265160905243423, 79933949510357990, 'np5uyqi8', '2015-11-21 21:40:18', NULL, NULL, '', NULL, 0),
(234659469922472946, 348872312224434383, 'y92jsq3y', '2015-11-19 15:27:03', '2015-11-20 01:14:11', NULL, '', NULL, 0),
(240198523182780639, 931149096809778668, 'wbb7aseg', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(246829785639194324, 79933949510357990, 'yj2wpnpu', '2015-11-25 15:56:22', '2015-11-25 15:59:15', 3, '', NULL, 0),
(250033746844393174, 986124289568638022, '3df42ny9', '2015-12-02 18:17:06', '2015-12-02 18:18:04', 9, '', NULL, 0),
(250113023549903934, 79933949510357990, '4sbu2tkd', '2015-11-20 13:31:23', NULL, NULL, '', NULL, 0),
(267000786385815346, 931149096809778668, 'q5jgsb8m', '2015-12-01 17:37:30', '2015-12-01 17:37:44', 0, '', NULL, 0),
(269506137968236686, 986124289568638022, '3iwekbv7', '2015-12-02 13:35:21', '2015-12-02 13:35:29', 0, '', NULL, 0),
(269537381860410433, 931149096809778668, 'x9y8xa5g', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(270582423713226078, 931149096809778668, '4zpqdg3v', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(273976541279493927, 765752644596188675, 'xrfyee9i', '2015-12-02 19:05:22', '2015-12-02 19:05:29', 0, '', NULL, 0),
(279103029575541931, 986124289568638022, '7zpkmx34', '2015-11-29 20:13:19', '2015-11-29 20:14:09', 0, '', NULL, 0),
(284633817342389146, 79933949510357990, 'g75n5q8s', '2015-11-26 00:23:33', NULL, NULL, '', NULL, 0),
(294087028464661423, 931149096809778668, '7mftxng8', '2015-12-02 17:37:37', '2015-12-02 18:16:56', 3, '', NULL, 0),
(305479488236079294, 224029385455320204, 'ra89wj3z', '2015-11-20 12:24:15', '2015-11-20 12:24:27', 14, '', NULL, 0),
(312909647179177825, 931149096809778668, 'z6k29k6p', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(321107079858536544, 931149096809778668, 'bty9sff9', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(322446849147447394, 986124289568638022, 'fs3e9hnr', '2015-12-01 17:40:19', NULL, NULL, '', NULL, 0),
(329223118122264849, 931149096809778668, 'jnxf997w', '2015-12-02 17:08:35', '2015-12-02 17:12:31', 0, '', NULL, 0),
(330944643912777851, 986124289568638022, 'kt65kkf2', '2015-12-02 16:56:33', '2015-12-02 16:59:45', 0, '', NULL, 0),
(344325073404516834, 931149096809778668, 'yzhphs4c', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(351437246288937236, 79933949510357990, 'sweqkj58', '2015-11-26 00:31:12', '2015-11-26 00:31:25', 0, '', NULL, 0),
(365196723236323257, 931149096809778668, 'vx8d8nag', '2015-12-01 13:45:10', '2015-12-01 13:46:36', 0, '', NULL, 0),
(375705726958905896, 931149096809778668, 'hzvrhumx', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(389189128630030828, 79933949510357990, 'v9xi4w82', '2015-11-20 13:23:11', NULL, NULL, '', NULL, 0),
(389624325120703748, 931149096809778668, '3z366pab', '2015-12-02 13:43:16', '2015-12-02 13:43:25', 0, '', NULL, 0),
(397681595895695643, 986124289568638022, 'ytetrh4v', '2015-12-02 16:50:27', '2015-12-02 16:53:03', 0, '', NULL, 0),
(397871409392543013, 931149096809778668, 'mi9hdmfn', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(403190480464498889, 986124289568638022, '5vvvx3qg', '2015-11-30 15:04:22', '2015-11-30 15:05:00', 9, '', NULL, 0),
(408008070743212423, 931149096809778668, 'ep8egaua', '2015-11-30 14:58:52', '2015-11-30 15:02:18', 0, '', NULL, 0),
(412145035587149587, 79933949510357990, 'kjqxvuwu', '2015-11-26 14:31:50', '2015-11-26 14:38:14', 3, '', NULL, 0),
(424911693750877820, 79933949510357990, 'fc7qus9x', '2015-11-20 01:15:42', '2015-11-20 01:16:57', NULL, '', NULL, 0),
(430407927410671246, 79933949510357990, '5f4j7m6t', '2015-11-20 01:06:11', '2015-11-20 01:06:26', NULL, '', NULL, 0),
(458658060854715654, 986124289568638022, '4en9fevf', '2015-11-30 14:44:09', '2015-11-30 14:52:30', 0, '', NULL, 0),
(460320976362041067, 931149096809778668, 'nx2fu3k3', '2015-12-02 18:22:01', '2015-12-02 18:22:17', 0, '', NULL, 0),
(467518645704986238, 79933949510357990, 'me4ewipw', '2015-11-26 14:14:20', '2015-11-26 14:14:44', 3, '', NULL, 0),
(473533725689007906, 931149096809778668, 'apvj85bg', '2015-12-02 14:58:39', NULL, NULL, '', NULL, 0),
(477216532902214106, 931149096809778668, 'ysmtudy2', '2015-12-02 15:55:13', '2015-12-02 15:56:09', 0, '', NULL, 0),
(496300130755984626, 931149096809778668, 'vqcjb7pn', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(505016585385075890, 931149096809778668, 'tucnvr28', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(514174391319252002, 79933949510357990, '7aymc5ig', '2015-11-21 21:35:29', NULL, NULL, '', NULL, 0),
(514263289820938122, 79933949510357990, 'f5ktsjgs', '2015-11-20 14:14:01', '2015-11-20 14:16:23', 6, '', NULL, 0),
(517946496606692405, 931149096809778668, 'ryw9rngk', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(530153320124112411, 191599963807034521, 'j242e2pc', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(537906329957551030, 931149096809778668, 'cc58sepk', '2015-12-02 17:00:02', '2015-12-02 17:01:44', 0, '', NULL, 0),
(540083756708069410, 931149096809778668, 'zzfgp5qf', '2015-12-02 13:23:29', NULL, NULL, '', NULL, 0),
(540433498694399926, 931149096809778668, 'ndjqg86e', '2015-12-02 13:49:58', '2015-12-02 13:50:06', 0, '', NULL, 0),
(546922589714126140, 986124289568638022, 't7hk7ap2', '2015-12-01 13:43:20', '2015-12-01 13:43:26', 0, '', NULL, 0),
(551473565384549611, 79933949510357990, 'x3yyg2ad', '2015-11-26 14:29:01', '2015-11-26 14:29:14', 0, '', NULL, 0),
(556393354855295039, 931149096809778668, 'y57puu8j', '2015-12-02 17:08:10', '2015-12-02 17:08:19', 0, '', NULL, 0),
(558384619654873151, 79933949510357990, 'jqf2nmzg', '2015-11-18 07:08:45', '2015-11-20 13:24:02', NULL, '', NULL, 0),
(563023393408427769, 986124289568638022, 'ggsnzxev', '2015-12-02 15:50:24', '2015-12-02 15:52:07', 0, '', NULL, 0),
(564578170956549959, 79933949510357990, 'w9z7dbxn', '2015-11-21 21:47:13', '2015-11-21 21:47:24', 0, '', NULL, 0),
(566006153662411570, 79933949510357990, 'mbpf8ikp', '2015-11-26 13:53:00', '2015-11-26 14:03:01', 0, '', NULL, 0),
(566861861791066832, 79933949510357990, 'baw5yv96', '2015-11-21 21:42:13', NULL, NULL, '', NULL, 0),
(571520412185284075, 79933949510357990, '97u8fzu9', '2015-11-21 21:43:16', '2015-11-21 21:44:15', 0, '', NULL, 0),
(574165627640531544, 486144555293741398, '664jg3iw', '2015-11-19 15:17:13', '2015-11-20 01:38:00', NULL, '', NULL, 0),
(575676430797203293, 986124289568638022, 'v5a58kf9', '2015-11-29 20:25:52', '2015-11-29 20:31:14', 3, '', NULL, 0),
(577557948533603806, 931149096809778668, 'r9pcgnup', '2015-12-02 18:32:31', '2015-12-02 18:32:41', 0, '', NULL, 0),
(581546721646445109, 931149096809778668, '7ux4wi57', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(586757934228256471, 931149096809778668, '7cutyvie', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(590564669970202141, 79933949510357990, '6xmcexbt', '2015-11-18 06:58:13', '2015-11-18 07:00:36', NULL, '', NULL, 0),
(594329796465389066, 931149096809778668, 'jf2q8feb', '2015-12-02 15:56:19', '2015-12-02 15:56:39', 0, '', NULL, 0),
(595550398189183877, 986124289568638022, '2zkjazgd', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(614198532574868359, 79933949510357990, 'es2wcmqr', '2015-11-18 06:01:56', NULL, NULL, '', NULL, 0),
(614408513480616720, 520908369516549732, 'wfnh4s2t', '2015-11-19 15:36:05', '2015-11-20 01:47:33', 19, '', NULL, 0),
(618835091921710305, 931149096809778668, 'hp4maaui', '2015-12-02 16:48:56', '2015-12-02 16:49:48', 0, '', NULL, 0),
(627247562895866016, 986124289568638022, '83psi6vt', '2015-12-02 17:19:43', NULL, NULL, '', NULL, 0),
(629252471292058464, 931149096809778668, 'huizfbid', '2015-12-02 13:59:09', NULL, NULL, '', NULL, 0),
(641248838690165406, 79933949510357990, 'f9uamt3r', '2015-11-21 21:47:39', NULL, NULL, '', NULL, 0),
(641969053247620529, 931149096809778668, '2pe5aprg', '2015-12-01 13:41:17', NULL, NULL, '', NULL, 0),
(643946600278111052, 79933949510357990, 'de96ktnu', '2015-11-20 13:28:07', '2015-11-20 13:31:11', NULL, '', NULL, 0),
(645754018752723903, 79933949510357990, 'crfadmc7', '2015-11-21 21:41:13', '2015-11-21 21:42:06', 0, '', NULL, 0),
(669293861252688747, 79933949510357990, 'aa4wqdyd', '2015-11-21 21:32:49', NULL, NULL, '', NULL, 0),
(683396448425910373, 931149096809778668, '53z72iyr', '2015-11-30 15:05:12', '2015-11-30 15:05:28', 0, '', NULL, 0),
(689405645964885759, 931149096809778668, 'w5dpt8zs', '2015-12-02 19:01:21', NULL, NULL, '', NULL, 0),
(691919480618683867, 79933949510357990, 'qa6kvw7i', '2015-11-21 21:46:16', NULL, NULL, '', NULL, 0),
(700598278338898341, 191599963807034521, 'xhb6zztq', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(711310660888523604, 931149096809778668, 'u7zdfmkx', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(713851485789892972, 931149096809778668, 'ph8sbgqw', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(715476834846901659, 79933949510357990, 'aiqqwzgn', '2015-11-21 21:38:09', NULL, NULL, '', NULL, 0),
(723703307212196247, 79933949510357990, 'ntv6y4pb', '2015-11-20 13:37:57', '2015-11-20 13:38:57', 3, '', NULL, 0),
(724137014423668048, 79933949510357990, 'htewiv3h', '2015-11-21 21:46:46', '2015-11-21 21:47:05', 0, '', NULL, 0),
(725970541624647680, 312073376271085986, 'r7rh9i8j', '2015-11-26 00:30:03', NULL, NULL, '', NULL, 0),
(733020933934823299, 931149096809778668, 'y9iprv4b', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(739984697700773146, 79933949510357990, 'sux62acb', '2015-11-21 21:29:37', '2015-11-21 21:30:05', 0, '', NULL, 0),
(742549352937370665, 986124289568638022, 'as328fp8', '2015-12-01 17:43:10', '2015-12-01 17:43:22', 0, '', NULL, 0),
(756242904253775301, 79933949510357990, 'p9eiesii', '2015-11-20 14:32:58', '2015-11-20 14:33:49', 0, '', NULL, 0),
(765706186257366320, 79933949510357990, 'vt8pxs57', '2015-11-26 00:30:46', NULL, NULL, '', NULL, 0),
(768204613345398458, 986124289568638022, '89hpk9mn', '2015-12-01 17:41:54', '2015-12-01 17:42:05', 0, '', NULL, 0),
(772109423714930275, 931149096809778668, '2bxahasg', '2015-12-02 15:26:57', '2015-12-02 15:27:01', 0, '', NULL, 0),
(782403085392325585, 931149096809778668, 'md95irv2', '2015-11-29 17:30:55', '2015-11-29 17:36:23', 0, '', NULL, 0),
(795882119467341472, 79933949510357990, 'jm9h5ba6', '2015-11-21 21:30:15', NULL, NULL, '', NULL, 0),
(796558771114538875, 79933949510357990, 'mc6n36ru', '2015-11-21 21:36:32', '2015-11-21 21:46:32', 0, '', NULL, 0),
(796584825509236057, 931149096809778668, 'tkeunbsz', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(802693053414573678, 986124289568638022, '9mak2zkg', '2015-11-30 14:54:36', NULL, NULL, '', NULL, 0),
(820605708376917076, 79933949510357990, 'cj2r5a2d', '2015-11-26 00:30:23', NULL, NULL, '', NULL, 0),
(824305349440225526, 520908369516549732, 'fidyuzha', '2015-11-19 15:38:00', '2015-11-20 01:40:48', NULL, '', NULL, 0),
(827186137957143171, 931149096809778668, '5eed8ssw', '2015-12-01 13:41:53', '2015-12-01 13:42:09', 0, '', NULL, 0),
(847861914413595498, 79933949510357990, '72c3v6i9', '2015-11-21 21:34:42', NULL, NULL, '', NULL, 0),
(847869333985206716, 931149096809778668, 'qknm4yg5', '2015-12-02 17:07:07', '2015-12-02 17:07:29', 0, '', NULL, 0),
(855457297143559183, 931149096809778668, 'j6zdaffx', '2015-12-02 17:14:44', '2015-12-02 17:14:48', 0, '', NULL, 0),
(870888166400824420, 986124289568638022, 'm5jy56mp', '2015-12-02 16:55:34', '2015-12-02 16:56:13', 0, '', NULL, 0),
(872189215872142942, 931149096809778668, '5rqpqxtv', '2015-12-02 13:28:40', '2015-12-02 13:28:50', 0, '', NULL, 0),
(878128689904230951, 931149096809778668, 'qbwma94h', '2015-12-02 18:58:47', NULL, NULL, '', NULL, 0),
(892235700408726406, 661264754899514079, 'virdv7tb', '2015-12-02 19:06:19', '2015-12-02 19:06:28', 0, '', NULL, 0),
(898483227966628126, 79933949510357990, 'r7rvxsr2', '2015-11-26 00:31:33', '2015-11-26 00:31:47', 0, '', NULL, 0),
(905088136217924089, 79933949510357990, 'h8sxb7py', '2015-11-26 14:08:58', '2015-11-26 14:11:01', 0, '', NULL, 0),
(907172717767092501, 79933949510357990, 'aqsjqy84', '2015-11-17 23:26:33', '2015-11-19 15:14:30', NULL, '', NULL, 0),
(928632351849411870, 79933949510357990, 'kbyue5s2', '2015-11-20 13:32:05', '2015-11-20 13:33:03', 0, '', NULL, 0),
(933491390622220773, 931149096809778668, 'de8zaezp', '2015-11-29 19:44:18', '2015-11-29 19:51:23', 0, '', NULL, 0),
(939440735134254951, 79933949510357990, '2cchacdw', '2015-11-17 23:18:36', '2015-11-20 00:39:48', NULL, '', NULL, 0),
(944965220985448941, 931149096809778668, 'ya58b8xe', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0),
(952031959823772929, 79933949510357990, 'mszu8mdm', '2015-11-17 23:24:41', '2015-11-19 15:13:37', NULL, '', NULL, 0),
(956081974894351336, 931149096809778668, 'yhzx4ki5', '2015-12-02 17:07:42', '2015-12-02 17:07:46', 0, '', NULL, 0),
(960852632272615228, 520908369516549732, 'y8ipf58p', '2015-11-19 15:32:39', '2015-11-19 23:44:39', NULL, '', NULL, 0),
(965063473195633916, 931149096809778668, 'vff66dm5', '2015-11-30 14:55:51', NULL, NULL, '', NULL, 0),
(968812443945039070, 931149096809778668, 'vwykgi4g', '2015-11-30 14:57:03', '2015-11-30 14:58:35', 0, '', NULL, 0),
(973702296126598025, 79933949510357990, '6teqvbhz', '2015-11-18 06:30:49', '2015-11-20 00:08:00', NULL, '', NULL, 0),
(983837320810428681, 79933949510357990, '3n7au3kt', '2015-11-26 00:18:04', NULL, NULL, '', NULL, 0),
(985756647493419319, 931149096809778668, '62mfwii4', '2015-11-29 20:19:27', '2015-11-29 20:21:50', 10, '', NULL, 0),
(991236262504200665, 931149096809778668, 'pxhgsku4', '2015-12-02 13:26:24', '2015-12-02 13:26:36', 0, '', NULL, 0),
(996804371403792184, 986124289568638022, 'ht38cs5i', '2015-11-30 15:05:36', '2015-11-30 15:05:52', 0, '', NULL, 0),
(998760257622324642, 931149096809778668, 'bm468bv6', '0000-00-00 00:00:00', NULL, NULL, '', NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `team_connection`
--

CREATE TABLE IF NOT EXISTS `team_connection` (
  `ID` bigint(20) NOT NULL,
  `teamID` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `team_question`
--

CREATE TABLE IF NOT EXISTS `team_question` (
  `teamID` bigint(20) NOT NULL,
  `questionID` bigint(20) NOT NULL,
  `answer` text NOT NULL,
  `score` int(11) DEFAULT NULL,
  `ffScore` int(11) DEFAULT NULL COMMENT 'saved score in fullFeedback contests',
  `date` datetime NOT NULL,
  UNIQUE KEY `teamID` (`teamID`,`questionID`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `team_question`
--

INSERT INTO `team_question` (`teamID`, `questionID`, `answer`, `score`, `ffScore`, `date`) VALUES
(75081288253422736, 154189429827819124, '1', NULL, 0, '2015-11-20 14:30:15'),
(75081288253422736, 830363671445759356, '1', NULL, 0, '2015-11-20 14:28:33'),
(75081288253422736, 967257522334282110, '1', NULL, 0, '2015-11-20 14:31:41'),
(75081288253422736, 975320289599249997, '4', NULL, 0, '2015-11-20 14:30:25'),
(82663560771244493, 830363671445759356, '1', NULL, 3, '2015-11-17 23:35:38'),
(82667673516313629, 442118378614416332, '1', NULL, 0, '2015-11-18 07:01:15'),
(82667673516313629, 830363671445759356, '1', NULL, 3, '2015-11-18 07:01:07'),
(82667673516313629, 975320289599249997, '3', NULL, 0, '2015-11-18 07:01:02'),
(85919970169164090, 442118378614416332, '4', NULL, 3, '2015-11-20 12:26:39'),
(87060270107277048, 154189429827819124, '1', NULL, 0, '2015-11-21 21:31:52'),
(87060270107277048, 442118378614416332, '4', NULL, 0, '2015-11-21 21:32:00'),
(87060270107277048, 830363671445759356, '1', NULL, 0, '2015-11-21 21:31:56'),
(92562562460906657, 154189429827819124, '3', NULL, 3, '2015-11-21 21:31:16'),
(92562562460906657, 442118378614416332, '4', NULL, 3, '2015-11-21 21:31:06'),
(92562562460906657, 975320289599249997, '3', NULL, 0, '2015-11-21 21:31:11'),
(126383874547818175, 442118378614416332, '1', NULL, 0, '2015-11-17 22:49:43'),
(137267684177093299, 442118378614416332, '3', NULL, 0, '2015-11-19 15:34:32'),
(137267684177093299, 830363671445759356, '4', NULL, 0, '2015-11-19 15:34:34'),
(137267684177093299, 975320289599249997, '1', NULL, 0, '2015-11-19 15:34:37'),
(172537402142770850, 8167090132170212, '1', NULL, 5, '2015-11-29 19:52:54'),
(172537402142770850, 128131918432072102, '2', NULL, 4, '2015-11-29 19:52:46'),
(172537402142770850, 759246725226411733, '3', NULL, 4, '2015-11-29 19:52:42'),
(172537402142770850, 947888499401776245, '8', NULL, 4, '2015-11-29 19:52:37'),
(178071925448910026, 442118378614416332, '4', NULL, 3, '2015-11-17 22:52:53'),
(178071925448910026, 830363671445759356, '1', NULL, 3, '2015-11-17 22:53:09'),
(178071925448910026, 975320289599249997, '3', NULL, 0, '2015-11-17 22:53:30'),
(204962790233542189, 106292023749273809, '1', NULL, 0, '2015-12-01 17:42:43'),
(234659469922472946, 442118378614416332, '4', NULL, 0, '2015-11-19 15:27:22'),
(234659469922472946, 830363671445759356, '4', NULL, 0, '2015-11-19 15:27:15'),
(234659469922472946, 975320289599249997, '1', NULL, 0, '2015-11-19 15:27:18'),
(246829785639194324, 830363671445759356, '1', NULL, 3, '2015-11-25 15:59:06'),
(250033746844393174, 40757270952468258, '2', NULL, 3, '2015-12-02 18:17:48'),
(250033746844393174, 84891370394422462, '1', NULL, 3, '2015-12-02 18:17:30'),
(250033746844393174, 128131918432072102, '4', NULL, 3, '2015-12-02 18:17:16'),
(294087028464661423, 289370282561781891, '3', NULL, 3, '2015-12-02 17:37:41'),
(305479488236079294, 442118378614416332, '1', NULL, 0, '2015-11-20 12:24:20'),
(305479488236079294, 830363671445759356, '4', NULL, 0, '2015-11-20 12:24:22'),
(305479488236079294, 975320289599249997, '3', NULL, 0, '2015-11-20 12:24:25'),
(403190480464498889, 40757270952468258, '4', NULL, 0, '2015-11-30 15:04:51'),
(403190480464498889, 349113967624760138, '1', NULL, 0, '2015-11-30 15:04:41'),
(403190480464498889, 422774180929056345, '4', NULL, 4, '2015-11-30 15:04:55'),
(403190480464498889, 780239268110297426, '2', NULL, 5, '2015-11-30 15:04:44'),
(403190480464498889, 947888499401776245, '1', NULL, 0, '2015-11-30 15:04:48'),
(412145035587149587, 830363671445759356, '1', NULL, 3, '2015-11-26 14:37:50'),
(424911693750877820, 442118378614416332, '2', NULL, 0, '2015-11-20 01:16:07'),
(424911693750877820, 830363671445759356, '1', NULL, 3, '2015-11-20 01:16:02'),
(424911693750877820, 975320289599249997, '2', NULL, 0, '2015-11-20 01:15:55'),
(430407927410671246, 442118378614416332, '4', NULL, 3, '2015-11-20 01:06:23'),
(430407927410671246, 830363671445759356, '1', NULL, 3, '2015-11-20 01:06:17'),
(430407927410671246, 975320289599249997, '3', NULL, 0, '2015-11-20 01:06:19'),
(467518645704986238, 154189429827819124, '3', NULL, 3, '2015-11-26 14:14:34'),
(514263289820938122, 830363671445759356, '1', NULL, 0, '2015-11-20 14:15:36'),
(514263289820938122, 975320289599249997, '4', NULL, 0, '2015-11-20 14:16:13'),
(574165627640531544, 442118378614416332, '1', NULL, 0, '2015-11-19 15:17:23'),
(574165627640531544, 830363671445759356, '1', NULL, 3, '2015-11-19 15:17:20'),
(574165627640531544, 975320289599249997, '3', NULL, 0, '2015-11-19 15:17:27'),
(575676430797203293, 128131918432072102, '2', NULL, 3, '2015-11-29 20:26:01'),
(590564669970202141, 442118378614416332, '4', NULL, 3, '2015-11-18 07:00:25'),
(590564669970202141, 830363671445759356, '1', NULL, 3, '2015-11-18 07:00:11'),
(590564669970202141, 975320289599249997, '4', NULL, 3, '2015-11-18 06:58:52'),
(614408513480616720, 442118378614416332, '4', NULL, 0, '2015-11-19 15:36:10'),
(614408513480616720, 830363671445759356, '3', NULL, 0, '2015-11-19 15:36:08'),
(614408513480616720, 975320289599249997, '1', NULL, 0, '2015-11-19 15:36:13'),
(643946600278111052, 830363671445759356, '1', NULL, 3, '2015-11-20 13:28:15'),
(723703307212196247, 442118378614416332, '4', NULL, 0, '2015-11-20 13:38:22'),
(739984697700773146, 154189429827819124, '4', NULL, 0, '2015-11-21 21:29:56'),
(739984697700773146, 402679938816729598, '3', NULL, 0, '2015-11-21 21:30:00'),
(739984697700773146, 442118378614416332, '3', NULL, 0, '2015-11-21 21:29:50'),
(739984697700773146, 830363671445759356, '4', NULL, 0, '2015-11-21 21:29:45'),
(739984697700773146, 967257522334282110, '1', NULL, 0, '2015-11-21 21:29:41'),
(782403085392325585, 80366709932627490, '2', NULL, 0, '2015-11-29 17:36:13'),
(782403085392325585, 422774180929056345, '3', NULL, 0, '2015-11-29 17:36:06'),
(782403085392325585, 759246725226411733, '1', NULL, 0, '2015-11-29 17:36:02'),
(824305349440225526, 442118378614416332, '3', NULL, 0, '2015-11-19 15:38:08'),
(824305349440225526, 830363671445759356, '2', NULL, 0, '2015-11-19 15:38:05'),
(824305349440225526, 975320289599249997, '2', NULL, 0, '2015-11-19 15:38:12'),
(928632351849411870, 154189429827819124, '1', NULL, 0, '2015-11-20 13:32:48'),
(928632351849411870, 402679938816729598, '1', NULL, 0, '2015-11-20 13:32:56'),
(928632351849411870, 442118378614416332, '2', NULL, 0, '2015-11-20 13:32:54'),
(928632351849411870, 830363671445759356, '4', NULL, 0, '2015-11-20 13:32:21'),
(928632351849411870, 967257522334282110, '4', NULL, 0, '2015-11-20 13:32:39'),
(928632351849411870, 975320289599249997, '2', NULL, 0, '2015-11-20 13:32:58'),
(956081974894351336, 422774180929056345, '2', NULL, 0, '2015-12-02 17:07:45'),
(960852632272615228, 442118378614416332, '4', NULL, 0, '2015-11-19 15:32:50'),
(960852632272615228, 830363671445759356, '3', NULL, 0, '2015-11-19 15:32:47'),
(960852632272615228, 975320289599249997, '1', NULL, 0, '2015-11-19 15:32:44'),
(985756647493419319, 80366709932627490, '3', NULL, 3, '2015-11-29 20:20:15'),
(985756647493419319, 84891370394422462, '1', NULL, 3, '2015-11-29 20:20:25'),
(985756647493419319, 128131918432072102, '2', NULL, 4, '2015-11-29 20:21:09');

-- --------------------------------------------------------

--
-- テーブルの構造 `tm_platforms`
--

CREATE TABLE IF NOT EXISTS `tm_platforms` (
  `ID` bigint(20) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `pc_key` varchar(5000) NOT NULL,
  `pv_key` varchar(5000) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_tm_platform_uri` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` bigint(20) NOT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `isOwnOfficialEmail` tinyint(1) DEFAULT NULL,
  `officialEmail` varchar(50) DEFAULT NULL COMMENT 'validates that the user is a teacher',
  `officialEmailValidated` tinyint(4) NOT NULL,
  `alternativeEmail` varchar(50) DEFAULT NULL,
  `alternativeEmailValidated` tinyint(4) NOT NULL,
  `salt` varchar(40) NOT NULL,
  `passwordMd5` varchar(40) NOT NULL,
  `recoverCode` varchar(50) NOT NULL,
  `validated` tinyint(11) NOT NULL COMMENT 'account validated as an admin for the given school',
  `allowMultipleSchools` tinyint(4) NOT NULL,
  `isAdmin` tinyint(4) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `lastLoginDate` datetime NOT NULL,
  `awardPrintingDate` date DEFAULT NULL,
  `comment` text NOT NULL,
  `saniValid` tinyint(4) NOT NULL DEFAULT '0',
  `orig_firstName` varchar(50) DEFAULT NULL,
  `orig_lastName` varchar(50) DEFAULT NULL,
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `officialEmail` (`officialEmail`),
  KEY `alternativeEmail` (`alternativeEmail`),
  KEY `iVersion` (`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`ID`, `gender`, `firstName`, `lastName`, `isOwnOfficialEmail`, `officialEmail`, `officialEmailValidated`, `alternativeEmail`, `alternativeEmailValidated`, `salt`, `passwordMd5`, `recoverCode`, `validated`, `allowMultipleSchools`, `isAdmin`, `registrationDate`, `lastLoginDate`, `awardPrintingDate`, `comment`, `saniValid`, `orig_firstName`, `orig_lastName`, `iVersion`) VALUES
(758180684719844715, 'M', 'Test', 'Teacher', NULL, 'teach', 0, '', 0, '2d93f91a3232dff69e670076f22c956c', 'c2b9b2ff018bed427cf30ca55130cc61', '', 1, 0, 0, '2015-11-13 05:27:35', '2015-12-02 18:53:48', NULL, '', 1, NULL, NULL, 0),
(825721883128986850, 'M', 'Test', 'Test', NULL, 'admin', 0, '', 0, '8cec2b964dc8665330aaa6fe36e939cf', '2a1b23184b2446c65e1860fef50a0a2c', '', 1, 0, 1, '2015-11-09 07:30:21', '2015-12-02 19:06:50', NULL, '', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `user_user`
--

CREATE TABLE IF NOT EXISTS `user_user` (
  `ID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `targetUserID` bigint(20) NOT NULL,
  `accessType` enum('none','read','write') NOT NULL DEFAULT 'none',
  `iVersion` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userID_2` (`userID`,`targetUserID`),
  KEY `userID` (`userID`,`targetUserID`,`iVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
