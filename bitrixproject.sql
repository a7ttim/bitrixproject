/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : bitrixproject

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-17 18:57:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_admin_notify
-- ----------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_admin_notify
-- ----------------------------
INSERT INTO `b_admin_notify` VALUES ('1', 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- ----------------------------
-- Table structure for b_admin_notify_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_admin_notify_lang
-- ----------------------------

-- ----------------------------
-- Table structure for b_agent
-- ----------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_agent
-- ----------------------------
INSERT INTO `b_agent` VALUES ('1', 'main', '100', 'CEvent::CleanUpAgent();', 'Y', '2017-12-14 03:21:14', '2017-12-15 00:00:00', null, '86400', 'Y', null, 'N');
INSERT INTO `b_agent` VALUES ('2', 'main', '100', 'CUser::CleanUpHitAuthAgent();', 'Y', '2017-12-14 03:21:15', '2017-12-15 00:00:00', null, '86400', 'Y', null, 'N');
INSERT INTO `b_agent` VALUES ('3', 'main', '100', 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2017-12-14 03:21:15', '2017-12-14 04:21:15', null, '3600', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('4', 'main', '100', 'CUndo::CleanUpOld();', 'Y', '2017-12-14 03:21:16', '2017-12-15 00:00:00', null, '86400', 'Y', null, 'N');
INSERT INTO `b_agent` VALUES ('5', 'main', '100', 'CSiteCheckerTest::CommonTest();', 'Y', '2017-12-13 12:16:42', '2017-12-14 12:16:42', null, '86400', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('6', 'main', '100', '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2017-12-14 03:22:18', '2017-12-14 03:23:18', null, '60', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('7', 'search', '10', 'CSearchSuggest::CleanUpAgent();', 'Y', '2017-12-14 03:21:18', '2017-12-15 03:21:18', null, '86400', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('8', 'search', '10', 'CSearchStatistic::CleanUpAgent();', 'Y', '2017-12-14 03:21:18', '2017-12-15 03:21:18', null, '86400', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('9', 'seo', '100', 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2017-12-14 03:21:16', '2017-12-14 04:21:16', null, '3600', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('10', 'seo', '100', 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2017-12-14 03:21:17', '2017-12-15 03:21:17', null, '86400', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('11', 'seo', '100', 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2017-12-14 03:21:17', '2017-12-14 04:21:17', null, '3600', 'N', null, 'N');
INSERT INTO `b_agent` VALUES ('20', 'main', '100', '\\Bitrix\\Main\\Data\\CacheEngineFiles::delayedDelete(24);', 'Y', '2017-12-14 03:22:19', '2017-12-14 00:00:01', null, '1', 'Y', null, 'N');

-- ----------------------------
-- Table structure for b_app_password
-- ----------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_app_password
-- ----------------------------

-- ----------------------------
-- Table structure for b_b24connector_buttons
-- ----------------------------
DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_b24connector_buttons
-- ----------------------------

-- ----------------------------
-- Table structure for b_bitrixcloud_option
-- ----------------------------
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_bitrixcloud_option
-- ----------------------------
INSERT INTO `b_bitrixcloud_option` VALUES ('1', 'backup_quota', '0', '0', '0');
INSERT INTO `b_bitrixcloud_option` VALUES ('2', 'backup_total_size', '0', '0', '0');
INSERT INTO `b_bitrixcloud_option` VALUES ('3', 'backup_last_backup_time', '0', '0', '1513075718');
INSERT INTO `b_bitrixcloud_option` VALUES ('4', 'monitoring_expire_time', '0', '0', '1513161417');

-- ----------------------------
-- Table structure for b_cache_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_cache_tag
-- ----------------------------
INSERT INTO `b_cache_tag` VALUES (null, null, '2:1513196539', '**');
INSERT INTO `b_cache_tag` VALUES ('s1', '/fc1', '/s1/bitrix/catalog.section.list/fc1', 'iblock_id_1');
INSERT INTO `b_cache_tag` VALUES ('s1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1');
INSERT INTO `b_cache_tag` VALUES ('s1', '/fc1', 'iblock_find', 'iblock_id_1');
INSERT INTO `b_cache_tag` VALUES ('s1', '/fc1', '/s1/bitrix/news.detail/fc1', 'iblock_id_1');
INSERT INTO `b_cache_tag` VALUES ('*', '*', '/bitrix/managed_cache/MYSQL/b_undo.~519011', '*');
INSERT INTO `b_cache_tag` VALUES ('*', '*', '/bitrix/managed_cache/MYSQL/agents.~615961', '*');

-- ----------------------------
-- Table structure for b_captcha
-- ----------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_captcha
-- ----------------------------

-- ----------------------------
-- Table structure for b_checklist
-- ----------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_checklist
-- ----------------------------

-- ----------------------------
-- Table structure for b_clouds_file_bucket
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_clouds_file_bucket
-- ----------------------------

-- ----------------------------
-- Table structure for b_clouds_file_resize
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_clouds_file_resize
-- ----------------------------

-- ----------------------------
-- Table structure for b_clouds_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_clouds_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for b_component_params
-- ----------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_component_params
-- ----------------------------
INSERT INTO `b_component_params` VALUES ('1', 's1', 'bitrix:menu', 'topnav', '/bitrix/templates/bitrixproject/header.php', 'N', null, '1621', '2339', 'a:10:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:19:\"MENU_CACHE_GET_VARS\";a:1:{i:0;s:0:\"\";}s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:7:\"USE_EXT\";s:1:\"N\";}');
INSERT INTO `b_component_params` VALUES ('27', 's1', 'bitrix:catalog.section.list', '.default', '/news/index.php', 'N', null, '214', '815', 'a:16:{s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:14:\"COUNT_ELEMENTS\";s:1:\"Y\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:11:\"IBLOCK_TYPE\";s:11:\"Information\";s:12:\"SECTION_CODE\";s:0:\"\";s:14:\"SECTION_FIELDS\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:10:\"SECTION_ID\";s:26:\"={$_REQUEST[\"SECTION_ID\"]}\";s:11:\"SECTION_URL\";s:25:\"/news/#SECTION_CODE_PATH#\";s:19:\"SECTION_USER_FIELDS\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:16:\"SHOW_PARENT_NAME\";s:1:\"Y\";s:9:\"TOP_DEPTH\";s:1:\"2\";s:9:\"VIEW_MODE\";s:4:\"LINE\";}');
INSERT INTO `b_component_params` VALUES ('28', 's1', 'bitrix:news', '.default', '/news/index.php', 'Y', '/news/', '820', '3034', 'a:67:{s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"Y\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"Y\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:11:\"IBLOCK_TYPE\";s:11:\"Information\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:10:\"NEWS_COUNT\";s:1:\"3\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:6:\"modern\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:10:\"SEF_FOLDER\";s:6:\"/news/\";s:8:\"SEF_MODE\";s:1:\"Y\";s:17:\"SEF_URL_TEMPLATES\";a:3:{s:4:\"news\";s:0:\"\";s:7:\"section\";s:20:\"#SECTION_CODE_PATH#/\";s:6:\"detail\";s:34:\"#SECTION_CODE_PATH#/#ELEMENT_CODE#\";}s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_SEARCH\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";}');
INSERT INTO `b_component_params` VALUES ('29', 's1', 'bitrix:main.include', '', '/news/index.php', 'N', null, '6985', '7144', 'a:3:{s:14:\"AREA_FILE_SHOW\";s:4:\"page\";s:16:\"AREA_FILE_SUFFIX\";s:3:\"inc\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";}');

-- ----------------------------
-- Table structure for b_consent_agreement
-- ----------------------------
DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_consent_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for b_consent_field
-- ----------------------------
DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_consent_field
-- ----------------------------

-- ----------------------------
-- Table structure for b_consent_user_consent
-- ----------------------------
DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_consent_user_consent
-- ----------------------------

-- ----------------------------
-- Table structure for b_counter_data
-- ----------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_counter_data
-- ----------------------------

-- ----------------------------
-- Table structure for b_culture
-- ----------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_culture
-- ----------------------------
INSERT INTO `b_culture` VALUES ('1', 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', '1', 'UTF-8', 'Y');
INSERT INTO `b_culture` VALUES ('2', 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', '0', 'UTF-8', 'Y');

-- ----------------------------
-- Table structure for b_event
-- ----------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event
-- ----------------------------
INSERT INTO `b_event` VALUES ('1', 'FEEDBACK_FORM', null, 's1', 'a:4:{s:6:\"AUTHOR\";s:31:\"Антон Тимофеенко\";s:12:\"AUTHOR_EMAIL\";s:17:\"attim38@gmail.com\";s:8:\"EMAIL_TO\";s:17:\"attim38@gmail.com\";s:4:\"TEXT\";s:6:\"asdasd\";}', '2017-12-13 10:52:00', '2017-12-13 10:52:02', 'Y', 'Y', 'ru');
INSERT INTO `b_event` VALUES ('2', 'FEEDBACK_FORM', null, 's1', 'a:4:{s:6:\"AUTHOR\";s:31:\"Антон Тимофеенко\";s:12:\"AUTHOR_EMAIL\";s:17:\"attim38@gmail.com\";s:8:\"EMAIL_TO\";s:17:\"attim38@gmail.com\";s:4:\"TEXT\";s:6:\"eqqweq\";}', '2017-12-13 11:09:37', '2017-12-13 11:09:37', '0', 'Y', 'ru');
INSERT INTO `b_event` VALUES ('3', 'FEEDBACK_FORM', null, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Антон Тимофеенко 2\";s:12:\"AUTHOR_EMAIL\";s:17:\"attim38@gmail.com\";s:8:\"EMAIL_TO\";s:17:\"attim38@gmail.com\";s:4:\"TEXT\";s:6:\"qweqwe\";}', '2017-12-13 11:10:12', '2017-12-13 11:10:12', '0', 'Y', 'ru');

-- ----------------------------
-- Table structure for b_event_attachment
-- ----------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for b_event_log
-- ----------------------------
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_log
-- ----------------------------
INSERT INTO `b_event_log` VALUES ('1', null, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}');
INSERT INTO `b_event_log` VALUES ('2', null, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:4:\"news\";}');
INSERT INTO `b_event_log` VALUES ('3', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}');
INSERT INTO `b_event_log` VALUES ('4', null, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('5', null, 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:8:\"feedback\";}');
INSERT INTO `b_event_log` VALUES ('6', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";N;}');
INSERT INTO `b_event_log` VALUES ('7', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('8', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Ffeedback%2F&path=%2F&name=top&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:9:\"menu_name\";N;s:4:\"path\";b:0;}');
INSERT INTO `b_event_log` VALUES ('9', null, 'UNKNOWN', 'MENU_EDIT', 'fileman', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.105 Safari/537.36 Vivaldi/1.92.917.43', '/bitrix/admin/fileman_menu_edit.php', null, '1', null, 'a:2:{s:9:\"menu_name\";N;s:4:\"path\";b:0;}');
INSERT INTO `b_event_log` VALUES ('10', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}');
INSERT INTO `b_event_log` VALUES ('11', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('12', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('13', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('14', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('15', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"feedback/index.php\";}');
INSERT INTO `b_event_log` VALUES ('16', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}');
INSERT INTO `b_event_log` VALUES ('17', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}');
INSERT INTO `b_event_log` VALUES ('18', null, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:14:\"news/o-nas.php\";}');
INSERT INTO `b_event_log` VALUES ('19', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:4:\"path\";s:4:\"news\";s:9:\"menu_name\";N;}');
INSERT INTO `b_event_log` VALUES ('20', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:14:\"news/o-nas.php\";}');
INSERT INTO `b_event_log` VALUES ('21', null, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2Fo-nas.php%3Fclear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:18:\"news/ob-avtore.php\";}');
INSERT INTO `b_event_log` VALUES ('22', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2Fo-nas.php%3Fclear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:4:\"path\";s:4:\"news\";s:9:\"menu_name\";N;}');
INSERT INTO `b_event_log` VALUES ('23', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"news/ob-avtore.php\";}');
INSERT INTO `b_event_log` VALUES ('24', null, 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2Fob-avtore.php%3Fclear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:1:{s:4:\"path\";s:13:\"news/test.php\";}');
INSERT INTO `b_event_log` VALUES ('25', null, 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=bitrixproject&path=%2Fnews%2F&back_url=%2Fnews%2Fob-avtore.php%3Fclear_cache%3DY&siteTemplateId=bitrixproject', null, '1', null, 'a:2:{s:4:\"path\";s:4:\"news\";s:9:\"menu_name\";N;}');
INSERT INTO `b_event_log` VALUES ('26', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:13:\"news/test.php\";}');
INSERT INTO `b_event_log` VALUES ('27', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:4:\"news\";}');
INSERT INTO `b_event_log` VALUES ('28', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"news/index_inc.php\";}');
INSERT INTO `b_event_log` VALUES ('29', null, 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.102 Safari/537.36 Vivaldi/1.93.955.42', '/bitrix/admin/public_file_edit.php', 's1', '1', null, 'a:1:{s:4:\"path\";s:18:\"news/index_inc.php\";}');

-- ----------------------------
-- Table structure for b_event_message
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_message
-- ----------------------------
INSERT INTO `b_event_message` VALUES ('1', '2017-12-12 13:42:54', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('2', '2017-12-12 13:42:54', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('3', '2017-12-12 13:42:54', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('4', '2017-12-12 13:42:54', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('5', '2017-12-12 13:42:54', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('6', '2017-12-12 13:42:54', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');
INSERT INTO `b_event_message` VALUES ('7', '2017-12-12 13:42:54', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null, 'ru');

-- ----------------------------
-- Table structure for b_event_message_attachment
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_message_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for b_event_message_site
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_message_site
-- ----------------------------
INSERT INTO `b_event_message_site` VALUES ('1', 's1');
INSERT INTO `b_event_message_site` VALUES ('2', 's1');
INSERT INTO `b_event_message_site` VALUES ('3', 's1');
INSERT INTO `b_event_message_site` VALUES ('4', 's1');
INSERT INTO `b_event_message_site` VALUES ('5', 's1');
INSERT INTO `b_event_message_site` VALUES ('6', 's1');
INSERT INTO `b_event_message_site` VALUES ('7', 's1');

-- ----------------------------
-- Table structure for b_event_type
-- ----------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_event_type
-- ----------------------------
INSERT INTO `b_event_type` VALUES ('1', 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', '1');
INSERT INTO `b_event_type` VALUES ('2', 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '2');
INSERT INTO `b_event_type` VALUES ('3', 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', '3');
INSERT INTO `b_event_type` VALUES ('4', 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '4');
INSERT INTO `b_event_type` VALUES ('5', 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '5');
INSERT INTO `b_event_type` VALUES ('6', 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', '6');
INSERT INTO `b_event_type` VALUES ('7', 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '7');
INSERT INTO `b_event_type` VALUES ('8', 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', '1');
INSERT INTO `b_event_type` VALUES ('9', 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '2');
INSERT INTO `b_event_type` VALUES ('10', 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', '3');
INSERT INTO `b_event_type` VALUES ('11', 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '4');
INSERT INTO `b_event_type` VALUES ('12', 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '5');
INSERT INTO `b_event_type` VALUES ('13', 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', '6');
INSERT INTO `b_event_type` VALUES ('14', 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', '7');

-- ----------------------------
-- Table structure for b_favorite
-- ----------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for b_file
-- ----------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_file
-- ----------------------------
INSERT INTO `b_file` VALUES ('2', null, 'iblock', '600', '1066', '161601', 'image/jpeg', 'iblock/22d', '22dca00115e4f0369bb7081e88b4df74.jpg', 'field_dawn_sky_beautiful_scenery_87654_1920x1080.jpg', '', null, '977b7eedee0f0734254501f85eb09226');

-- ----------------------------
-- Table structure for b_file_search
-- ----------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_file_search
-- ----------------------------

-- ----------------------------
-- Table structure for b_filters
-- ----------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_filters
-- ----------------------------

-- ----------------------------
-- Table structure for b_finder_dest
-- ----------------------------
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_finder_dest
-- ----------------------------

-- ----------------------------
-- Table structure for b_geoip_handlers
-- ----------------------------
DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_geoip_handlers
-- ----------------------------
INSERT INTO `b_geoip_handlers` VALUES ('1', '100', 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', null);
INSERT INTO `b_geoip_handlers` VALUES ('2', '110', 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', null);

-- ----------------------------
-- Table structure for b_group
-- ----------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_group
-- ----------------------------
INSERT INTO `b_group` VALUES ('1', null, 'Y', '1', 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', null, null);
INSERT INTO `b_group` VALUES ('2', null, 'Y', '2', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', null, null);
INSERT INTO `b_group` VALUES ('3', null, 'Y', '3', 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', null, 'RATING_VOTE');
INSERT INTO `b_group` VALUES ('4', null, 'Y', '4', 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', null, 'RATING_VOTE_AUTHORITY');

-- ----------------------------
-- Table structure for b_group_collection_task
-- ----------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_group_collection_task
-- ----------------------------

-- ----------------------------
-- Table structure for b_group_subordinate
-- ----------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_group_subordinate
-- ----------------------------

-- ----------------------------
-- Table structure for b_group_task
-- ----------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_group_task
-- ----------------------------

-- ----------------------------
-- Table structure for b_hlblock_entity
-- ----------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_hlblock_entity
-- ----------------------------

-- ----------------------------
-- Table structure for b_hlblock_entity_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_hlblock_entity_lang
-- ----------------------------

-- ----------------------------
-- Table structure for b_hlblock_entity_rights
-- ----------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_hlblock_entity_rights
-- ----------------------------

-- ----------------------------
-- Table structure for b_hot_keys
-- ----------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_hot_keys
-- ----------------------------
INSERT INTO `b_hot_keys` VALUES ('1', 'Ctrl+Alt+85', '139', '0');
INSERT INTO `b_hot_keys` VALUES ('2', 'Ctrl+Alt+80', '17', '0');
INSERT INTO `b_hot_keys` VALUES ('3', 'Ctrl+Alt+70', '120', '0');
INSERT INTO `b_hot_keys` VALUES ('4', 'Ctrl+Alt+68', '117', '0');
INSERT INTO `b_hot_keys` VALUES ('5', 'Ctrl+Alt+81', '3', '0');
INSERT INTO `b_hot_keys` VALUES ('6', 'Ctrl+Alt+75', '106', '0');
INSERT INTO `b_hot_keys` VALUES ('7', 'Ctrl+Alt+79', '133', '0');
INSERT INTO `b_hot_keys` VALUES ('8', 'Ctrl+Alt+70', '121', '0');
INSERT INTO `b_hot_keys` VALUES ('9', 'Ctrl+Alt+69', '118', '0');
INSERT INTO `b_hot_keys` VALUES ('10', 'Ctrl+Shift+83', '87', '0');
INSERT INTO `b_hot_keys` VALUES ('11', 'Ctrl+Shift+88', '88', '0');
INSERT INTO `b_hot_keys` VALUES ('12', 'Ctrl+Shift+76', '89', '0');
INSERT INTO `b_hot_keys` VALUES ('13', 'Ctrl+Alt+85', '139', '1');
INSERT INTO `b_hot_keys` VALUES ('14', 'Ctrl+Alt+80', '17', '1');
INSERT INTO `b_hot_keys` VALUES ('15', 'Ctrl+Alt+70', '120', '1');
INSERT INTO `b_hot_keys` VALUES ('16', 'Ctrl+Alt+68', '117', '1');
INSERT INTO `b_hot_keys` VALUES ('17', 'Ctrl+Alt+81', '3', '1');
INSERT INTO `b_hot_keys` VALUES ('18', 'Ctrl+Alt+75', '106', '1');
INSERT INTO `b_hot_keys` VALUES ('19', 'Ctrl+Alt+79', '133', '1');
INSERT INTO `b_hot_keys` VALUES ('20', 'Ctrl+Alt+70', '121', '1');
INSERT INTO `b_hot_keys` VALUES ('21', 'Ctrl+Alt+69', '118', '1');
INSERT INTO `b_hot_keys` VALUES ('22', 'Ctrl+Shift+83', '87', '1');
INSERT INTO `b_hot_keys` VALUES ('23', 'Ctrl+Shift+88', '88', '1');
INSERT INTO `b_hot_keys` VALUES ('24', 'Ctrl+Shift+76', '89', '1');

-- ----------------------------
-- Table structure for b_hot_keys_code
-- ----------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_hot_keys_code
-- ----------------------------
INSERT INTO `b_hot_keys_code` VALUES ('3', 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('5', 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('6', 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('7', 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('8', 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('9', 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('10', 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('12', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('13', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('14', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('15', 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('17', 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('19', 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('20', 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('54', 'top_panel_org_fav', '', '-=AUTONAME=-', null, 'top_panel_org_fav', null, '0');
INSERT INTO `b_hot_keys_code` VALUES ('55', 'top_panel_module_settings', '', '-=AUTONAME=-', null, 'top_panel_module_settings', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('56', 'top_panel_interface_settings', '', '-=AUTONAME=-', null, 'top_panel_interface_settings', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('57', 'top_panel_help', '', '-=AUTONAME=-', null, 'top_panel_help', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('58', 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', null, 'top_panel_bizproc_tasks', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('59', 'top_panel_add_fav', '', '-=AUTONAME=-', null, 'top_panel_add_fav', null, '0');
INSERT INTO `b_hot_keys_code` VALUES ('60', 'top_panel_create_page', '', '-=AUTONAME=-', null, 'top_panel_create_page', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('62', 'top_panel_create_folder', '', '-=AUTONAME=-', null, 'top_panel_create_folder', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('63', 'top_panel_edit_page', '', '-=AUTONAME=-', null, 'top_panel_edit_page', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('64', 'top_panel_page_prop', '', '-=AUTONAME=-', null, 'top_panel_page_prop', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('65', 'top_panel_edit_page_html', '', '-=AUTONAME=-', null, 'top_panel_edit_page_html', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('67', 'top_panel_edit_page_php', '', '-=AUTONAME=-', null, 'top_panel_edit_page_php', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('68', 'top_panel_del_page', '', '-=AUTONAME=-', null, 'top_panel_del_page', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('69', 'top_panel_folder_prop', '', '-=AUTONAME=-', null, 'top_panel_folder_prop', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('70', 'top_panel_access_folder_new', '', '-=AUTONAME=-', null, 'top_panel_access_folder_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('71', 'main_top_panel_struct_panel', '', '-=AUTONAME=-', null, 'main_top_panel_struct_panel', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('72', 'top_panel_cache_page', '', '-=AUTONAME=-', null, 'top_panel_cache_page', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('73', 'top_panel_cache_comp', '', '-=AUTONAME=-', null, 'top_panel_cache_comp', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('74', 'top_panel_cache_not', '', '-=AUTONAME=-', null, 'top_panel_cache_not', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('75', 'top_panel_edit_mode', '', '-=AUTONAME=-', null, 'top_panel_edit_mode', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('76', 'top_panel_templ_site_css', '', '-=AUTONAME=-', null, 'top_panel_templ_site_css', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('77', 'top_panel_templ_templ_css', '', '-=AUTONAME=-', null, 'top_panel_templ_templ_css', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('78', 'top_panel_templ_site', '', '-=AUTONAME=-', null, 'top_panel_templ_site', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('81', 'top_panel_debug_time', '', '-=AUTONAME=-', null, 'top_panel_debug_time', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('82', 'top_panel_debug_incl', '', '-=AUTONAME=-', null, 'top_panel_debug_incl', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('83', 'top_panel_debug_sql', '', '-=AUTONAME=-', null, 'top_panel_debug_sql', null, '0');
INSERT INTO `b_hot_keys_code` VALUES ('84', 'top_panel_debug_compr', '', '-=AUTONAME=-', null, 'top_panel_debug_compr', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('85', 'MTP_SHORT_URI1', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI1', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('86', 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI_LIST', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('87', 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKER_ADD', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('88', 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKERS_SHOW', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('89', 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', null, 'FMST_PANEL_CUR_STICKER_LIST', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('90', 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', null, 'FMST_PANEL_ALL_STICKER_LIST', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('91', 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', null, 'bx-panel-menu', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('92', 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-admin-tab', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('93', 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-view-tab', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('94', 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-admin-tab', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('96', 'top_panel_folder_prop_new', '', '-=AUTONAME=-', null, 'top_panel_folder_prop_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('97', 'main_top_panel_structure', '', '-=AUTONAME=-', null, 'main_top_panel_structure', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('98', 'top_panel_clear_cache', '', '-=AUTONAME=-', null, 'top_panel_clear_cache', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('99', 'top_panel_templ', '', '-=AUTONAME=-', null, 'top_panel_templ', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('100', 'top_panel_debug', '', '-=AUTONAME=-', null, 'top_panel_debug', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('101', 'MTP_SHORT_URI', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('102', 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKERS', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('103', 'top_panel_settings', '', '-=AUTONAME=-', null, 'top_panel_settings', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('104', 'top_panel_fav', '', '-=AUTONAME=-', null, 'top_panel_fav', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('106', 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('107', 'top_panel_edit_new', '', '-=AUTONAME=-', null, 'top_panel_edit_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('108', 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', null, 'FLOW_PANEL_CREATE_WITH_WF', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('109', 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', null, 'FLOW_PANEL_EDIT_WITH_WF', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('110', 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', null, 'FLOW_PANEL_HISTORY', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('111', 'top_panel_create_new', '', '-=AUTONAME=-', null, 'top_panel_create_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('112', 'top_panel_create_folder_new', '', '-=AUTONAME=-', null, 'top_panel_create_folder_new', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('116', 'bx-panel-toggle', '', '-=AUTONAME=-', null, 'bx-panel-toggle', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('117', 'bx-panel-small-toggle', '', '-=AUTONAME=-', null, 'bx-panel-small-toggle', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('118', 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', null, 'bx-panel-expander', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('119', 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', null, 'bx-panel-hider', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('120', 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('121', 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('133', 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('135', 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('136', 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('137', 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('138', 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', '0');
INSERT INTO `b_hot_keys_code` VALUES ('139', 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', '0');

-- ----------------------------
-- Table structure for b_iblock
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock
-- ----------------------------
INSERT INTO `b_iblock` VALUES ('1', '2017-12-13 14:33:27', 'Information', 's1', 'news', 'Новости', 'Y', '500', '#SITE_DIR#/Information/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/Information/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/Information/list.php?SECTION_ID=#SECTION_ID#', '', null, '', 'text', '24', 'Y', 'N', null, null, 'N', null, '3146748dfa5f34239ce726e9be3c1899', 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', '1', '0', null, '', '', 'Разделы новостей', 'Раздел новостей', 'Новости', 'Новость');
INSERT INTO `b_iblock` VALUES ('2', '2017-12-13 14:54:50', 'Information', 's1', 'feedback', 'Запросы', 'Y', '500', '#SITE_DIR#/Information/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/Information/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/Information/list.php?SECTION_ID=#SECTION_ID#', '', null, '', 'text', '24', 'Y', 'N', null, null, 'N', null, null, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', '1', '0', null, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');

-- ----------------------------
-- Table structure for b_iblock_cache
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_cache
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_element
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_element
-- ----------------------------
INSERT INTO `b_iblock_element` VALUES ('1', '2017-12-13 14:33:38', '1', '2017-12-13 14:07:04', '1', '1', '2', 'Y', '2017-12-13 10:06:18', null, '500', 'Разбираюсь, как работает Bitrix', null, '', 'text', null, '', 'text', 'РАЗБИРАЮСЬ, КАК РАБОТАЕТ BITRIX\r\n\r\n', '1', null, null, null, null, null, 'Y', '1', 'razbirayus-kak-rabotaet-bitrix', '', '0', null, '1', '2017-12-13 14:07:38');
INSERT INTO `b_iblock_element` VALUES ('2', '2017-12-13 15:12:46', '1', '2017-12-13 14:10:16', '1', '1', '2', 'Y', '2017-12-13 10:09:12', null, '500', 'Учусь заполнять инфоблок', null, '', 'text', '2', 'Здесь должен быть текст', 'text', 'УЧУСЬ ЗАПОЛНЯТЬ ИНФОБЛОК\r\n\r\nЗДЕСЬ ДОЛЖЕН БЫТЬ ТЕКСТ', '1', null, null, null, null, null, 'Y', '2', 'uchus-zapolnyat-infoblok', '', '0', null, '1', '2017-12-13 14:11:56');
INSERT INTO `b_iblock_element` VALUES ('3', '2017-12-13 15:09:37', '1', '2017-12-13 15:09:37', '1', '2', null, 'Y', null, null, '500', 'Антон Тимофеенко', null, null, 'text', null, 'eqqweq', 'text', 'АНТОН ТИМОФЕЕНКО\r\nEQQWEQ', '1', null, null, null, null, null, 'N', '3', null, null, null, null, null, null);
INSERT INTO `b_iblock_element` VALUES ('4', '2017-12-13 15:10:12', '1', '2017-12-13 15:10:12', '1', '2', null, 'Y', null, null, '500', 'Антон Тимофеенко 2', null, null, 'text', null, 'qweqwe', 'text', 'АНТОН ТИМОФЕЕНКО 2\r\nQWEQWE', '1', null, null, null, null, null, 'N', '4', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for b_iblock_element_iprop
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_element_iprop
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_element_lock
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_element_lock
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_element_property
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_element_property
-- ----------------------------
INSERT INTO `b_iblock_element_property` VALUES ('1', '1', '2', 'Тимофеенко', 'text', null, '0.0000', '');

-- ----------------------------
-- Table structure for b_iblock_element_right
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_element_right
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_fields
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_fields
-- ----------------------------
INSERT INTO `b_iblock_fields` VALUES ('1', 'ACTIVE', 'Y', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('1', 'ACTIVE_FROM', 'N', '=now');
INSERT INTO `b_iblock_fields` VALUES ('1', 'ACTIVE_TO', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:1200;s:6:\"HEIGHT\";i:600;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'DETAIL_TEXT', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'DETAIL_TEXT_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('1', 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('1', 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_ELEMENT_ADD', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_ELEMENT_DELETE', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_ELEMENT_EDIT', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_SECTION_ADD', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_SECTION_DELETE', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'LOG_SECTION_EDIT', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('1', 'NAME', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"Y\";s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:600;s:6:\"HEIGHT\";i:365;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"Y\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"Y\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'PREVIEW_TEXT', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'PREVIEW_TEXT_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('1', 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_DESCRIPTION', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_DESCRIPTION_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_NAME', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SECTION_XML_ID', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'SORT', 'N', '0');
INSERT INTO `b_iblock_fields` VALUES ('1', 'TAGS', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'XML_ID', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('1', 'XML_IMPORT_START_TIME', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'ACTIVE', 'Y', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('2', 'ACTIVE_FROM', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'ACTIVE_TO', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'DETAIL_TEXT', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'DETAIL_TEXT_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('2', 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('2', 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_ELEMENT_ADD', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_ELEMENT_DELETE', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_ELEMENT_EDIT', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_SECTION_ADD', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_SECTION_DELETE', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'LOG_SECTION_EDIT', 'N', null);
INSERT INTO `b_iblock_fields` VALUES ('2', 'NAME', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'PREVIEW_TEXT', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'PREVIEW_TEXT_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('2', 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_DESCRIPTION', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_DESCRIPTION_TYPE', 'Y', 'text');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_NAME', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SECTION_XML_ID', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'SORT', 'N', '0');
INSERT INTO `b_iblock_fields` VALUES ('2', 'TAGS', 'N', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'XML_ID', 'Y', '');
INSERT INTO `b_iblock_fields` VALUES ('2', 'XML_IMPORT_START_TIME', 'N', null);

-- ----------------------------
-- Table structure for b_iblock_group
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_group
-- ----------------------------
INSERT INTO `b_iblock_group` VALUES ('1', '1', 'X');
INSERT INTO `b_iblock_group` VALUES ('1', '2', 'R');
INSERT INTO `b_iblock_group` VALUES ('2', '1', 'X');
INSERT INTO `b_iblock_group` VALUES ('2', '2', 'T');

-- ----------------------------
-- Table structure for b_iblock_iblock_iprop
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_iblock_iprop
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_iproperty
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_iproperty
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_messages
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_messages
-- ----------------------------
INSERT INTO `b_iblock_messages` VALUES ('1', 'ELEMENT_ADD', 'Добавить новость');
INSERT INTO `b_iblock_messages` VALUES ('1', 'ELEMENT_DELETE', 'Удалить новость');
INSERT INTO `b_iblock_messages` VALUES ('1', 'ELEMENT_EDIT', 'Изменить новость');
INSERT INTO `b_iblock_messages` VALUES ('1', 'ELEMENT_NAME', 'Новость');
INSERT INTO `b_iblock_messages` VALUES ('1', 'ELEMENTS_NAME', 'Новости');
INSERT INTO `b_iblock_messages` VALUES ('1', 'SECTION_ADD', 'Добавить раздел новостей');
INSERT INTO `b_iblock_messages` VALUES ('1', 'SECTION_DELETE', 'Удалить раздел новостей');
INSERT INTO `b_iblock_messages` VALUES ('1', 'SECTION_EDIT', 'Изменить раздел новостей');
INSERT INTO `b_iblock_messages` VALUES ('1', 'SECTION_NAME', 'Раздел новостей');
INSERT INTO `b_iblock_messages` VALUES ('1', 'SECTIONS_NAME', 'Разделы новостей');
INSERT INTO `b_iblock_messages` VALUES ('2', 'ELEMENT_ADD', 'Добавить элемент');
INSERT INTO `b_iblock_messages` VALUES ('2', 'ELEMENT_DELETE', 'Удалить элемент');
INSERT INTO `b_iblock_messages` VALUES ('2', 'ELEMENT_EDIT', 'Изменить элемент');
INSERT INTO `b_iblock_messages` VALUES ('2', 'ELEMENT_NAME', 'Элемент');
INSERT INTO `b_iblock_messages` VALUES ('2', 'ELEMENTS_NAME', 'Элементы');
INSERT INTO `b_iblock_messages` VALUES ('2', 'SECTION_ADD', 'Добавить раздел');
INSERT INTO `b_iblock_messages` VALUES ('2', 'SECTION_DELETE', 'Удалить раздел');
INSERT INTO `b_iblock_messages` VALUES ('2', 'SECTION_EDIT', 'Изменить раздел');
INSERT INTO `b_iblock_messages` VALUES ('2', 'SECTION_NAME', 'Раздел');
INSERT INTO `b_iblock_messages` VALUES ('2', 'SECTIONS_NAME', 'Разделы');

-- ----------------------------
-- Table structure for b_iblock_offers_tmp
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_offers_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_property
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_property
-- ----------------------------
INSERT INTO `b_iblock_property` VALUES ('1', '2017-12-13 15:12:11', '1', 'Автор', 'Y', '500', '', '', 'S', '1', '30', 'L', 'N', null, '', '5', null, '0', 'N', 'N', 'N', 'N', '1', null, null, '');

-- ----------------------------
-- Table structure for b_iblock_property_enum
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_property_enum
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_right
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_right
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_rss
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_rss
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_section
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_section
-- ----------------------------
INSERT INTO `b_iblock_section` VALUES ('2', '2017-12-13 14:33:27', '1', '2017-12-13 14:33:27', '1', '1', null, 'Y', 'Y', '500', 'PHP', null, '1', '2', '1', '', 'text', 'PHP\r\n', 'php', null, null, null, null);

-- ----------------------------
-- Table structure for b_iblock_section_element
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_section_element
-- ----------------------------
INSERT INTO `b_iblock_section_element` VALUES ('2', '1', null);
INSERT INTO `b_iblock_section_element` VALUES ('2', '2', null);

-- ----------------------------
-- Table structure for b_iblock_section_iprop
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_section_iprop
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_section_property
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_section_property
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_section_right
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_section_right
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_sequence
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for b_iblock_site
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_site
-- ----------------------------
INSERT INTO `b_iblock_site` VALUES ('1', 's1');
INSERT INTO `b_iblock_site` VALUES ('2', 's1');

-- ----------------------------
-- Table structure for b_iblock_type
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_type
-- ----------------------------
INSERT INTO `b_iblock_type` VALUES ('Feedback', 'Y', '', '', 'N', '500');
INSERT INTO `b_iblock_type` VALUES ('Information', 'Y', '', '', 'N', '500');

-- ----------------------------
-- Table structure for b_iblock_type_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_iblock_type_lang
-- ----------------------------
INSERT INTO `b_iblock_type_lang` VALUES ('Information', 'ru', 'Информация', '', '');
INSERT INTO `b_iblock_type_lang` VALUES ('Information', 'en', 'Information', '', '');
INSERT INTO `b_iblock_type_lang` VALUES ('Feedback', 'ru', 'Запрос', '', '');
INSERT INTO `b_iblock_type_lang` VALUES ('Feedback', 'en', 'Feedback', '', '');

-- ----------------------------
-- Table structure for b_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_lang
-- ----------------------------
INSERT INTO `b_lang` VALUES ('s1', '1', 'Y', 'Y', 'Bitrixproject', '/', null, null, null, null, null, 'ru', null, 'N', null, null, null, '1');
INSERT INTO `b_lang` VALUES ('tn', '100', 'N', 'Y', 'tn', '/site_tn/', null, null, null, null, null, 'ru', '', 'N', 'bitrix', 'tn', 'attim38@gmail.com', '1');
INSERT INTO `b_lang` VALUES ('zm', '100', 'N', 'Y', 'zm', '/site_zm/', null, null, null, null, null, 'ru', '', 'N', 'bitrix', 'zm', 'attim38@gmail.com', '1');

-- ----------------------------
-- Table structure for b_language
-- ----------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_language
-- ----------------------------
INSERT INTO `b_language` VALUES ('en', '2', 'N', 'Y', 'English', null, null, null, null, null, null, '2');
INSERT INTO `b_language` VALUES ('ru', '1', 'Y', 'Y', 'Russian', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for b_lang_domain
-- ----------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_lang_domain
-- ----------------------------

-- ----------------------------
-- Table structure for b_medialib_collection
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_medialib_collection
-- ----------------------------

-- ----------------------------
-- Table structure for b_medialib_collection_item
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_medialib_collection_item
-- ----------------------------

-- ----------------------------
-- Table structure for b_medialib_item
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_medialib_item
-- ----------------------------

-- ----------------------------
-- Table structure for b_medialib_type
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_medialib_type
-- ----------------------------
INSERT INTO `b_medialib_type` VALUES ('1', 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc');
INSERT INTO `b_medialib_type` VALUES ('2', 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc');
INSERT INTO `b_medialib_type` VALUES ('3', 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- ----------------------------
-- Table structure for b_module
-- ----------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_module
-- ----------------------------
INSERT INTO `b_module` VALUES ('bitrix.sitecorporate', null);
INSERT INTO `b_module` VALUES ('bitrixcloud', null);
INSERT INTO `b_module` VALUES ('clouds', null);
INSERT INTO `b_module` VALUES ('compression', null);
INSERT INTO `b_module` VALUES ('fileman', null);
INSERT INTO `b_module` VALUES ('highloadblock', null);
INSERT INTO `b_module` VALUES ('iblock', null);
INSERT INTO `b_module` VALUES ('main', null);
INSERT INTO `b_module` VALUES ('perfmon', null);
INSERT INTO `b_module` VALUES ('search', null);
INSERT INTO `b_module` VALUES ('seo', null);
INSERT INTO `b_module` VALUES ('socialservices', null);
INSERT INTO `b_module` VALUES ('translate', null);

-- ----------------------------
-- Table structure for b_module_group
-- ----------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_module_group
-- ----------------------------

-- ----------------------------
-- Table structure for b_module_to_module
-- ----------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_module_to_module
-- ----------------------------
INSERT INTO `b_module_to_module` VALUES ('1', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('2', null, '100', 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('3', null, '100', 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('4', null, '100', 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('5', null, '100', 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', '1');
INSERT INTO `b_module_to_module` VALUES ('6', null, '100', 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', '1');
INSERT INTO `b_module_to_module` VALUES ('7', null, '100', 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', '1');
INSERT INTO `b_module_to_module` VALUES ('8', null, '100', 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', '1');
INSERT INTO `b_module_to_module` VALUES ('9', null, '100', 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', '1');
INSERT INTO `b_module_to_module` VALUES ('10', null, '100', 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', '1');
INSERT INTO `b_module_to_module` VALUES ('11', null, '100', 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', '1');
INSERT INTO `b_module_to_module` VALUES ('12', null, '100', 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', '1');
INSERT INTO `b_module_to_module` VALUES ('13', null, '100', 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', '1');
INSERT INTO `b_module_to_module` VALUES ('14', null, '100', 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', '1');
INSERT INTO `b_module_to_module` VALUES ('15', null, '100', 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', '1');
INSERT INTO `b_module_to_module` VALUES ('16', null, '100', 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', '1');
INSERT INTO `b_module_to_module` VALUES ('17', null, '100', 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', '1');
INSERT INTO `b_module_to_module` VALUES ('18', null, '100', 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', '1');
INSERT INTO `b_module_to_module` VALUES ('19', null, '100', 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', '1');
INSERT INTO `b_module_to_module` VALUES ('20', null, '100', 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', '1');
INSERT INTO `b_module_to_module` VALUES ('21', null, '100', 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', '1');
INSERT INTO `b_module_to_module` VALUES ('22', null, '100', 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('23', null, '100', 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('24', null, '100', 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', '1');
INSERT INTO `b_module_to_module` VALUES ('25', null, '100', 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', '1');
INSERT INTO `b_module_to_module` VALUES ('26', null, '100', 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('27', null, '100', 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', '1');
INSERT INTO `b_module_to_module` VALUES ('28', null, '100', 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', '1');
INSERT INTO `b_module_to_module` VALUES ('29', null, '100', 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', '1');
INSERT INTO `b_module_to_module` VALUES ('30', null, '100', 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', '1');
INSERT INTO `b_module_to_module` VALUES ('31', null, '100', 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', '1');
INSERT INTO `b_module_to_module` VALUES ('32', null, '100', 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', '1');
INSERT INTO `b_module_to_module` VALUES ('33', null, '110', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('34', null, '120', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('35', null, '130', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('36', null, '140', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('37', null, '145', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('38', null, '150', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('39', null, '160', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('40', null, '170', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('41', null, '180', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('42', null, '190', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('43', null, '200', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('44', null, '210', 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('45', null, '100', 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', '1');
INSERT INTO `b_module_to_module` VALUES ('46', null, '100', 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', '1');
INSERT INTO `b_module_to_module` VALUES ('47', null, '100', 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1');
INSERT INTO `b_module_to_module` VALUES ('48', null, '100', 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1');
INSERT INTO `b_module_to_module` VALUES ('49', null, '100', 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1');
INSERT INTO `b_module_to_module` VALUES ('50', null, '100', 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('51', null, '100', 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('52', null, '100', 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', '2');
INSERT INTO `b_module_to_module` VALUES ('53', null, '100', 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('54', null, '100', 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', '2');
INSERT INTO `b_module_to_module` VALUES ('55', null, '100', 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', '1');
INSERT INTO `b_module_to_module` VALUES ('56', null, '100', 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', '1');
INSERT INTO `b_module_to_module` VALUES ('57', null, '100', 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', '1');
INSERT INTO `b_module_to_module` VALUES ('58', null, '100', 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', '1');
INSERT INTO `b_module_to_module` VALUES ('59', null, '100', 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', '1');
INSERT INTO `b_module_to_module` VALUES ('60', null, '100', 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', '1');
INSERT INTO `b_module_to_module` VALUES ('61', null, '100', 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', '1');
INSERT INTO `b_module_to_module` VALUES ('62', null, '100', 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', '1');
INSERT INTO `b_module_to_module` VALUES ('63', null, '100', 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', '1');
INSERT INTO `b_module_to_module` VALUES ('64', null, '100', 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', '1');
INSERT INTO `b_module_to_module` VALUES ('65', null, '100', 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', '1');
INSERT INTO `b_module_to_module` VALUES ('66', null, '100', 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', '1');
INSERT INTO `b_module_to_module` VALUES ('67', null, '100', 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', '1');
INSERT INTO `b_module_to_module` VALUES ('68', null, '100', 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('69', null, '100', 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', '1');
INSERT INTO `b_module_to_module` VALUES ('70', null, '100', 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', '1');
INSERT INTO `b_module_to_module` VALUES ('71', null, '100', 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', '1');
INSERT INTO `b_module_to_module` VALUES ('72', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('73', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('74', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('75', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('76', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('77', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('78', null, '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', '1');
INSERT INTO `b_module_to_module` VALUES ('79', null, '1', 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', '1');
INSERT INTO `b_module_to_module` VALUES ('80', null, '10000', 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', '1');
INSERT INTO `b_module_to_module` VALUES ('81', null, '100', 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('82', null, '100', 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', '1');
INSERT INTO `b_module_to_module` VALUES ('83', null, '100', 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', '1');
INSERT INTO `b_module_to_module` VALUES ('84', null, '100', 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', '1');
INSERT INTO `b_module_to_module` VALUES ('85', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('86', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('87', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('88', null, '100', 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('89', null, '100', 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', '1');
INSERT INTO `b_module_to_module` VALUES ('90', null, '100', 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', '1');
INSERT INTO `b_module_to_module` VALUES ('91', null, '100', 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', '1');
INSERT INTO `b_module_to_module` VALUES ('92', null, '100', 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', '1');
INSERT INTO `b_module_to_module` VALUES ('93', null, '100', 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('94', null, '100', 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('95', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('96', null, '100', 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('97', null, '100', 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('98', null, '100', 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('99', null, '100', 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', '1');
INSERT INTO `b_module_to_module` VALUES ('100', null, '100', 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', '1');
INSERT INTO `b_module_to_module` VALUES ('101', null, '100', 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', '1');
INSERT INTO `b_module_to_module` VALUES ('102', null, '100', 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', '1');
INSERT INTO `b_module_to_module` VALUES ('103', null, '100', 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', '1');
INSERT INTO `b_module_to_module` VALUES ('104', null, '200', 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', '1');
INSERT INTO `b_module_to_module` VALUES ('105', null, '100', 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', '1');
INSERT INTO `b_module_to_module` VALUES ('106', null, '100', 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('107', null, '100', 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('108', null, '100', 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', '1');
INSERT INTO `b_module_to_module` VALUES ('109', null, '100', 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', '1');
INSERT INTO `b_module_to_module` VALUES ('110', null, '10', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('111', null, '20', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('112', null, '30', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('113', null, '40', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('114', null, '50', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('115', null, '60', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('116', null, '70', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('117', null, '80', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('118', null, '90', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('119', null, '100', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', '1');
INSERT INTO `b_module_to_module` VALUES ('120', null, '100', 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', '1');
INSERT INTO `b_module_to_module` VALUES ('121', null, '100', 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', '1');
INSERT INTO `b_module_to_module` VALUES ('122', null, '100', 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', '1');
INSERT INTO `b_module_to_module` VALUES ('123', null, '100', 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('124', null, '100', 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('125', null, '100', 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', '1');
INSERT INTO `b_module_to_module` VALUES ('126', null, '100', 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', '1');
INSERT INTO `b_module_to_module` VALUES ('127', null, '100', 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', '1');
INSERT INTO `b_module_to_module` VALUES ('128', null, '100', 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', '1');
INSERT INTO `b_module_to_module` VALUES ('129', null, '90', 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', '1');
INSERT INTO `b_module_to_module` VALUES ('130', null, '100', 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', '2');
INSERT INTO `b_module_to_module` VALUES ('131', null, '100', 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', '2');
INSERT INTO `b_module_to_module` VALUES ('132', null, '100', 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', '2');
INSERT INTO `b_module_to_module` VALUES ('133', null, '100', 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', '2');
INSERT INTO `b_module_to_module` VALUES ('134', null, '100', 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', '2');
INSERT INTO `b_module_to_module` VALUES ('135', null, '100', 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', '2');
INSERT INTO `b_module_to_module` VALUES ('136', null, '100', 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', '2');
INSERT INTO `b_module_to_module` VALUES ('137', null, '100', 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', '2');
INSERT INTO `b_module_to_module` VALUES ('138', null, '100', 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', '2');
INSERT INTO `b_module_to_module` VALUES ('139', null, '100', 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', '2');
INSERT INTO `b_module_to_module` VALUES ('140', null, '100', 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', '2');
INSERT INTO `b_module_to_module` VALUES ('141', null, '100', 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', '2');
INSERT INTO `b_module_to_module` VALUES ('142', null, '100', 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', '2');
INSERT INTO `b_module_to_module` VALUES ('143', null, '100', 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', '2');
INSERT INTO `b_module_to_module` VALUES ('144', null, '100', 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', '2');
INSERT INTO `b_module_to_module` VALUES ('145', null, '100', 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', '2');
INSERT INTO `b_module_to_module` VALUES ('146', null, '100', 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', '2');
INSERT INTO `b_module_to_module` VALUES ('147', null, '100', 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', '2');
INSERT INTO `b_module_to_module` VALUES ('148', null, '100', 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', '2');
INSERT INTO `b_module_to_module` VALUES ('149', null, '100', 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('150', null, '100', 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('151', null, '100', 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('152', null, '100', 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('153', null, '100', 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', '2');
INSERT INTO `b_module_to_module` VALUES ('154', null, '100', 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', '2');
INSERT INTO `b_module_to_module` VALUES ('155', null, '100', 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', '2');
INSERT INTO `b_module_to_module` VALUES ('156', null, '100', 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', '2');
INSERT INTO `b_module_to_module` VALUES ('157', null, '100', 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', '2');
INSERT INTO `b_module_to_module` VALUES ('158', null, '100', 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', '1');
INSERT INTO `b_module_to_module` VALUES ('159', null, '100', 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', '1');
INSERT INTO `b_module_to_module` VALUES ('160', null, '100', 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', '1');
INSERT INTO `b_module_to_module` VALUES ('161', null, '100', 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', '1');
INSERT INTO `b_module_to_module` VALUES ('162', null, '100', 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', '1');
INSERT INTO `b_module_to_module` VALUES ('163', null, '100', 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', '1');
INSERT INTO `b_module_to_module` VALUES ('164', null, '100', 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', '1');
INSERT INTO `b_module_to_module` VALUES ('165', null, '100', 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', '1');
INSERT INTO `b_module_to_module` VALUES ('166', null, '100', 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', '1');

-- ----------------------------
-- Table structure for b_operation
-- ----------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_operation
-- ----------------------------
INSERT INTO `b_operation` VALUES ('1', 'edit_php', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('2', 'view_own_profile', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('3', 'edit_own_profile', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('4', 'view_all_users', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('5', 'view_groups', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('6', 'view_tasks', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('7', 'view_other_settings', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('8', 'view_subordinate_users', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('9', 'edit_subordinate_users', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('10', 'edit_all_users', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('11', 'edit_groups', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('12', 'edit_tasks', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('13', 'edit_other_settings', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('14', 'cache_control', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('15', 'lpa_template_edit', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('16', 'view_event_log', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('17', 'edit_ratings', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('18', 'manage_short_uri', 'main', null, 'module');
INSERT INTO `b_operation` VALUES ('19', 'fm_view_permission', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('20', 'fm_view_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('21', 'fm_view_listing', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('22', 'fm_edit_existent_folder', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('23', 'fm_create_new_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('24', 'fm_edit_existent_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('25', 'fm_create_new_folder', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('26', 'fm_delete_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('27', 'fm_delete_folder', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('28', 'fm_edit_in_workflow', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('29', 'fm_rename_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('30', 'fm_rename_folder', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('31', 'fm_upload_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('32', 'fm_add_to_menu', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('33', 'fm_download_file', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('34', 'fm_lpa', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('35', 'fm_edit_permission', 'main', null, 'file');
INSERT INTO `b_operation` VALUES ('36', 'bitrixcloud_monitoring', 'bitrixcloud', null, 'module');
INSERT INTO `b_operation` VALUES ('37', 'bitrixcloud_backup', 'bitrixcloud', null, 'module');
INSERT INTO `b_operation` VALUES ('38', 'bitrixcloud_cdn', 'bitrixcloud', null, 'module');
INSERT INTO `b_operation` VALUES ('39', 'clouds_browse', 'clouds', null, 'module');
INSERT INTO `b_operation` VALUES ('40', 'clouds_upload', 'clouds', null, 'module');
INSERT INTO `b_operation` VALUES ('41', 'clouds_config', 'clouds', null, 'module');
INSERT INTO `b_operation` VALUES ('42', 'fileman_view_all_settings', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('43', 'fileman_edit_menu_types', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('44', 'fileman_add_element_to_menu', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('45', 'fileman_edit_menu_elements', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('46', 'fileman_edit_existent_files', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('47', 'fileman_edit_existent_folders', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('48', 'fileman_admin_files', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('49', 'fileman_admin_folders', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('50', 'fileman_view_permissions', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('51', 'fileman_edit_all_settings', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('52', 'fileman_upload_files', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('53', 'fileman_view_file_structure', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('54', 'fileman_install_control', 'fileman', '', 'module');
INSERT INTO `b_operation` VALUES ('55', 'medialib_view_collection', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('56', 'medialib_new_collection', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('57', 'medialib_edit_collection', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('58', 'medialib_del_collection', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('59', 'medialib_access', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('60', 'medialib_new_item', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('61', 'medialib_edit_item', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('62', 'medialib_del_item', 'fileman', '', 'medialib');
INSERT INTO `b_operation` VALUES ('63', 'sticker_view', 'fileman', '', 'stickers');
INSERT INTO `b_operation` VALUES ('64', 'sticker_edit', 'fileman', '', 'stickers');
INSERT INTO `b_operation` VALUES ('65', 'sticker_new', 'fileman', '', 'stickers');
INSERT INTO `b_operation` VALUES ('66', 'sticker_del', 'fileman', '', 'stickers');
INSERT INTO `b_operation` VALUES ('67', 'hl_element_read', 'highloadblock', null, 'module');
INSERT INTO `b_operation` VALUES ('68', 'hl_element_write', 'highloadblock', null, 'module');
INSERT INTO `b_operation` VALUES ('69', 'hl_element_delete', 'highloadblock', null, 'module');
INSERT INTO `b_operation` VALUES ('70', 'section_read', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('71', 'element_read', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('72', 'section_element_bind', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('73', 'iblock_admin_display', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('74', 'element_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('75', 'element_edit_price', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('76', 'element_delete', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('77', 'element_bizproc_start', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('78', 'section_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('79', 'section_delete', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('80', 'section_section_bind', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('81', 'element_edit_any_wf_status', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('82', 'iblock_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('83', 'iblock_delete', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('84', 'iblock_rights_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('85', 'iblock_export', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('86', 'section_rights_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('87', 'element_rights_edit', 'iblock', null, 'iblock');
INSERT INTO `b_operation` VALUES ('88', 'seo_settings', 'seo', '', 'module');
INSERT INTO `b_operation` VALUES ('89', 'seo_tools', 'seo', '', 'module');

-- ----------------------------
-- Table structure for b_option
-- ----------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_option
-- ----------------------------
INSERT INTO `b_option` VALUES ('main', 'rating_authority_rating', '2', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_rating_group_add', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_rating_group_delete', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_rating_group', '3', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_authority_group_add', '2', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_authority_group_delete', '2', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_authority_group', '4', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_community_size', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_community_authority', '30', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_vote_weight', '10', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_normalization_type', 'auto', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_normalization', '10', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_count_vote', '10', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_authority_weight_formula', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_community_last_visit', '90', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_text_like_y', 'Нравится', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_text_like_n', 'Не нравится', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_text_like_d', 'Это нравится', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_assign_type', 'auto', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_vote_type', 'like', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_self_vote', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_vote_show', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_vote_template', 'like', null, null);
INSERT INTO `b_option` VALUES ('main', 'rating_start_authority', '3', null, null);
INSERT INTO `b_option` VALUES ('main', 'PARAM_MAX_SITES', '2', null, null);
INSERT INTO `b_option` VALUES ('main', 'PARAM_MAX_USERS', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'distributive6', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', '~new_license11_sign', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'GROUP_DEFAULT_TASK', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'vendor', '1c_bitrix', null, null);
INSERT INTO `b_option` VALUES ('main', 'admin_lid', 'ru', null, null);
INSERT INTO `b_option` VALUES ('main', 'update_site', 'www.bitrixsoft.com', null, null);
INSERT INTO `b_option` VALUES ('main', 'update_site_ns', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'optimize_css_files', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'optimize_js_files', 'Y', null, null);
INSERT INTO `b_option` VALUES ('main', 'admin_passwordh', 'FVkQeWYUBgYtCUVcDxcGCgsTAQ==', null, null);
INSERT INTO `b_option` VALUES ('main', 'server_uniq_id', 'f1f33212e5f49484e3fcee8c0bb3e314', null, null);
INSERT INTO `b_option` VALUES ('fileman', 'use_editor_3', 'Y', null, null);
INSERT INTO `b_option` VALUES ('search', 'version', 'v2.0', null, null);
INSERT INTO `b_option` VALUES ('search', 'dbnode_id', 'N', null, null);
INSERT INTO `b_option` VALUES ('search', 'dbnode_status', 'ok', null, null);
INSERT INTO `b_option` VALUES ('socialservices', 'bitrix24net_domain', 'http://bitrix', null, null);
INSERT INTO `b_option` VALUES ('socialservices', 'bitrix24net_id', 'ext.5a2fb35f25caa5.96314420', null, null);
INSERT INTO `b_option` VALUES ('socialservices', 'bitrix24net_secret', 'W5h42I0Yh5ly1UbVu3EbHHaSRoV8fIg6LDrQ60kIkyyuFTha21', null, null);
INSERT INTO `b_option` VALUES ('main', 'email_from', 'attim38@gmail.com', null, null);
INSERT INTO `b_option` VALUES ('main', '~update_autocheck_result', 'a:4:{s:10:\"check_date\";i:1513075614;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}', null, null);
INSERT INTO `b_option` VALUES ('fileman', 'stickers_use_hotkeys', 'N', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_bucket_id', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_encrypt', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_use_compression', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_max_exec_time', '20', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_max_exec_time_sleep', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_archive_size_limit', '104857600', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_integrity_check', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_max_file_size', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_file_public', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_file_kernel', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_base', '1', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_base_skip_stat', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_base_skip_search', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_base_skip_log', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'skip_symlinks', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'skip_mask', '0', null, null);
INSERT INTO `b_option` VALUES ('main', 'dump_site_id', 'a:0:{}', null, null);
INSERT INTO `b_option` VALUES ('main', 'last_files_count', '23272', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'bitrix_optimal', 'N', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'total_mark_value', 'N/A', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'total_mark_duration', '60', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_page_rate', '8.61', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_page_time', '0.1161', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_mail_value', '0.1709', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_cpu_value', '21.3', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_files_value', '131.5', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_session_time_value', '0.0002', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_is_good', 'N', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_db_insert_value', '2 063', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_db_read_value', '9 777', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_db_update_value', '4 301', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'mark_php_page_date', '12.12.2017 17:57:25', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'end_time', '1513090708', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'total_mark_hits', '0', null, null);
INSERT INTO `b_option` VALUES ('perfmon', 'total_mark_time', '12.12.2017 17:58:29', null, null);
INSERT INTO `b_option` VALUES ('main', 'signer_default_key', '204a16100cc8e040827556ba452658192fd6ba0fc8a64c88199618eddcf4c696ce6db45f93de5a841d46ef7b596543e6c1fd4646aabfd990fb3f8e04080a9bd6', null, null);

-- ----------------------------
-- Table structure for b_perf_cache
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_cache
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_cluster
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_component
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_component
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_error
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_error
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_history
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_history
-- ----------------------------
INSERT INTO `b_perf_history` VALUES ('1', '2017-12-12 21:57:25', '8.61', 'N');

-- ----------------------------
-- Table structure for b_perf_hit
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_hit
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_index_ban
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_index_ban
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_index_complete
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_index_complete
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_index_suggest
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_index_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_index_suggest_sql
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_index_suggest_sql
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_sql
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_sql
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_sql_backtrace
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_sql_backtrace
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_tab_column_stat
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_tab_column_stat
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_tab_stat
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_tab_stat
-- ----------------------------

-- ----------------------------
-- Table structure for b_perf_test
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_perf_test
-- ----------------------------
INSERT INTO `b_perf_test` VALUES ('1', '2', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('2', '3', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('3', '4', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('4', '5', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('5', '6', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('6', '7', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('7', '8', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('8', '9', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('9', '10', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('10', '11', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('11', '12', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('12', '13', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('13', '14', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('14', '15', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('15', '16', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('16', '17', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('17', '18', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('18', '19', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('19', '20', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('20', '21', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('21', '22', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('22', '23', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('23', '24', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('24', '25', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('25', '26', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('26', '27', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('27', '28', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('28', '29', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('29', '30', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('30', '31', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('31', '32', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('32', '33', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('33', '34', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('34', '35', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('35', '36', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('36', '37', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('37', '38', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('38', '39', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('39', '40', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('40', '41', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('41', '42', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('42', '43', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('43', '44', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('44', '45', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('45', '46', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('46', '47', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('47', '48', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('48', '49', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('49', '50', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('50', '51', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('51', '52', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('52', '53', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('53', '54', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('54', '55', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('55', '56', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('56', '57', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('57', '58', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('58', '59', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('59', '60', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('60', '61', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('61', '62', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('62', '63', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('63', '64', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('64', '65', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('65', '66', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('66', '67', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('67', '68', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('68', '69', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('69', '70', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('70', '71', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('71', '72', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('72', '73', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('73', '74', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('74', '75', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('75', '76', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('76', '77', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('77', '78', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('78', '79', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('79', '80', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('80', '81', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('81', '82', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('82', '83', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('83', '84', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('84', '85', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('85', '86', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('86', '87', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('87', '88', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('88', '89', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('89', '90', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('90', '91', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('91', '92', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('92', '93', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('93', '94', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('94', '95', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('95', '96', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('96', '97', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('97', '98', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('98', '99', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('99', '100', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES ('100', '98', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('101', '-1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('102', '0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('103', '1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('104', '2', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('105', '3', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('106', '4', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('107', '5', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('108', '6', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('109', '7', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('110', '8', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('111', '9', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('112', '10', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('113', '11', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('114', '12', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('115', '13', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('116', '14', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('117', '15', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('118', '16', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('119', '17', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('120', '18', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('121', '19', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('122', '20', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('123', '21', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('124', '22', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('125', '23', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('126', '24', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('127', '25', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('128', '26', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('129', '27', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('130', '28', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('131', '29', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('132', '30', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('133', '31', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('134', '32', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('135', '33', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('136', '34', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('137', '35', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('138', '36', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('139', '37', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('140', '38', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('141', '39', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('142', '40', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('143', '41', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('144', '42', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('145', '43', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('146', '44', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('147', '45', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('148', '46', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('149', '47', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('150', '48', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('151', '49', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('152', '50', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('153', '51', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('154', '52', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('155', '53', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('156', '54', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('157', '55', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('158', '56', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('159', '57', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('160', '58', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('161', '59', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('162', '60', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('163', '61', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('164', '62', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('165', '63', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('166', '64', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('167', '65', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('168', '66', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('169', '67', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('170', '68', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('171', '69', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('172', '70', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('173', '71', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('174', '72', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('175', '73', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('176', '74', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('177', '75', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('178', '76', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('179', '77', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('180', '78', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('181', '79', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('182', '80', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('183', '81', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('184', '82', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('185', '83', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('186', '84', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('187', '85', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('188', '86', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('189', '87', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('190', '88', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('191', '89', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('192', '90', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('193', '91', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('194', '92', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('195', '93', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('196', '94', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('197', '95', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('198', '96', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('199', '97', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('200', '98', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('201', '-1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('202', '0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('203', '1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('204', '2', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('205', '3', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('206', '4', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('207', '5', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('208', '6', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('209', '7', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('210', '8', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('211', '9', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('212', '10', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('213', '11', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('214', '12', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('215', '13', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('216', '14', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('217', '15', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('218', '16', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('219', '17', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('220', '18', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('221', '19', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('222', '20', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('223', '21', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('224', '22', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('225', '23', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('226', '24', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('227', '25', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('228', '26', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('229', '27', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('230', '28', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('231', '29', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('232', '30', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('233', '31', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('234', '32', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('235', '33', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('236', '34', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('237', '35', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('238', '36', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('239', '37', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('240', '38', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('241', '39', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('242', '40', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('243', '41', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('244', '42', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('245', '43', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('246', '44', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('247', '45', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('248', '46', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('249', '47', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('250', '48', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('251', '49', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('252', '50', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('253', '51', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('254', '52', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('255', '53', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('256', '54', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('257', '55', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('258', '56', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('259', '57', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('260', '58', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('261', '59', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('262', '60', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('263', '61', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('264', '62', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('265', '63', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('266', '64', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('267', '65', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('268', '66', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('269', '67', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('270', '68', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('271', '69', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('272', '70', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('273', '71', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('274', '72', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('275', '73', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('276', '74', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('277', '75', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('278', '76', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('279', '77', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('280', '78', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('281', '79', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('282', '80', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('283', '81', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('284', '82', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('285', '83', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('286', '84', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('287', '85', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('288', '86', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('289', '87', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('290', '88', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('291', '89', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('292', '90', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('293', '91', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('294', '92', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('295', '93', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('296', '94', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('297', '95', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('298', '96', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('299', '97', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('300', '98', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('301', '-1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('302', '0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('303', '1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('304', '2', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('305', '3', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('306', '4', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('307', '5', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('308', '6', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('309', '7', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('310', '8', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('311', '9', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('312', '10', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('313', '11', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('314', '12', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('315', '13', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('316', '14', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('317', '15', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('318', '16', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('319', '17', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('320', '18', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('321', '19', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('322', '20', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('323', '21', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('324', '22', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('325', '23', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('326', '24', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('327', '25', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('328', '26', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('329', '27', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('330', '28', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('331', '29', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('332', '30', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('333', '31', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('334', '32', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('335', '33', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('336', '34', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('337', '35', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('338', '36', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('339', '37', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('340', '38', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('341', '39', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('342', '40', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('343', '41', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('344', '42', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('345', '43', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('346', '44', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('347', '45', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('348', '46', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('349', '47', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('350', '48', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('351', '49', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('352', '50', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('353', '51', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('354', '52', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('355', '53', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('356', '54', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('357', '55', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('358', '56', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('359', '57', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('360', '58', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('361', '59', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('362', '60', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('363', '61', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('364', '62', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('365', '63', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('366', '64', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('367', '65', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('368', '66', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('369', '67', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('370', '68', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('371', '69', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('372', '70', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('373', '71', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('374', '72', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('375', '73', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('376', '74', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('377', '75', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('378', '76', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('379', '77', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('380', '78', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('381', '79', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('382', '80', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('383', '81', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('384', '82', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('385', '83', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('386', '84', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('387', '85', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('388', '86', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('389', '87', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('390', '88', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('391', '89', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('392', '90', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('393', '91', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('394', '92', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('395', '93', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('396', '94', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('397', '95', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('398', '96', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('399', '97', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES ('400', '98', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

-- ----------------------------
-- Table structure for b_rating
-- ----------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating
-- ----------------------------
INSERT INTO `b_rating` VALUES ('1', 'N', 'Рейтинг', 'USER', 'SUM', '2017-12-12 17:42:53', null, null, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
INSERT INTO `b_rating` VALUES ('2', 'N', 'Авторитет', 'USER', 'SUM', '2017-12-12 17:42:53', null, null, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- ----------------------------
-- Table structure for b_rating_component
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_component
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_component_results
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_component_results
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_prepare
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_prepare
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_results
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_results
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_rule
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_rule
-- ----------------------------
INSERT INTO `b_rating_rule` VALUES ('1', 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-12-12 17:42:53', '2017-12-12 17:42:53', null);
INSERT INTO `b_rating_rule` VALUES ('2', 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-12-12 17:42:53', '2017-12-12 17:42:53', null);
INSERT INTO `b_rating_rule` VALUES ('3', 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-12-12 17:42:53', '2017-12-12 17:42:53', null);
INSERT INTO `b_rating_rule` VALUES ('4', 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-12-12 17:42:53', '2017-12-12 17:42:53', null);
INSERT INTO `b_rating_rule` VALUES ('5', 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', null, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.10000000000000001;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.10000000000000001;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2017-12-12 17:42:53', '2017-12-12 17:42:53', null);

-- ----------------------------
-- Table structure for b_rating_rule_vetting
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_rule_vetting
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_user
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_user
-- ----------------------------
INSERT INTO `b_rating_user` VALUES ('1', '2', '1', '3.0000', '30.0000', '13');

-- ----------------------------
-- Table structure for b_rating_vote
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_vote
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_vote_group
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_vote_group
-- ----------------------------
INSERT INTO `b_rating_vote_group` VALUES ('5', '1', 'A');
INSERT INTO `b_rating_vote_group` VALUES ('1', '1', 'R');
INSERT INTO `b_rating_vote_group` VALUES ('3', '1', 'R');
INSERT INTO `b_rating_vote_group` VALUES ('2', '3', 'R');
INSERT INTO `b_rating_vote_group` VALUES ('4', '3', 'R');
INSERT INTO `b_rating_vote_group` VALUES ('6', '4', 'A');

-- ----------------------------
-- Table structure for b_rating_voting
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_voting
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_voting_prepare
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_voting_prepare
-- ----------------------------

-- ----------------------------
-- Table structure for b_rating_weight
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_rating_weight
-- ----------------------------
INSERT INTO `b_rating_weight` VALUES ('1', '-1000000.0000', '1000000.0000', '1.0000', '10');

-- ----------------------------
-- Table structure for b_search_content
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content
-- ----------------------------
INSERT INTO `b_search_content` VALUES ('1', '2017-12-13 11:26:30', 'main', 's1|/news/index.php', '0', null, null, null, '/news/index.php', 'Новости', 'April 25, 2017\rAnd this is a\rmassive headline\rAenean ornare velit lacus varius enim ullamcorper proin aliquam\rfacilisis ante sed etiam magna interdum congue. Lorem ipsum dolor\ramet nullam sed etiam veroeros.\nFull Story\rApril 24, 2017\rSed magna\ripsum faucibus\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\rApril 22, 2017\rPrimis eget\rimperdiet lorem\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\rApril 18, 2017\rAnte mattis\rinterdum dolor\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\rApril 14, 2017\rTempus sed\rnulla imperdiet\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\rApril 11, 2017\rOdio magna\rsed consectetur\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\rApril 7, 2017\rAugue lorem\rprimis vestibulum\rDonec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\nFull Story\r1\r2\r3\r…\r8\r9\r10\rNext', '', '', '', null, null, null);
INSERT INTO `b_search_content` VALUES ('2', '2017-12-13 11:07:58', 'main', 's1|/feedback/index.php', '0', null, null, null, '/feedback/index.php', 'Обратная связь', 'Name\rEmail\rMessage\rAddress\r1234 Somewhere Road #87257\rNashville, TN 00000-0000\nPhone\r(000) 000-0000\rEmail\rinfo@untitled.tld\rSocial\rTwitter\rFacebook\rInstagram\rGitHub', '', '', '', null, null, null);
INSERT INTO `b_search_content` VALUES ('4', '2017-12-13 10:06:18', 'iblock', '1', '0', null, null, null, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=Information&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=&CODE=razbirayus-kak-rabotaet-bitrix', 'Разбираюсь, как работает Bitrix', '', '', 'Information', '1', null, '2017-12-13 10:06:18', null);
INSERT INTO `b_search_content` VALUES ('5', '2017-12-13 10:09:12', 'iblock', '2', '0', null, null, null, '=ID=2&EXTERNAL_ID=2&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=Information&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=&CODE=uchus-zapolnyat-infoblok', 'Учусь заполнять инфоблок', 'Здесь должен быть текст', '', 'Information', '1', null, '2017-12-13 10:09:12', null);
INSERT INTO `b_search_content` VALUES ('6', '2017-12-13 14:33:27', 'iblock', 'S2', '0', null, null, null, '=ID=2&EXTERNAL_ID=&IBLOCK_TYPE_ID=Information&IBLOCK_ID=1&IBLOCK_CODE=news&IBLOCK_EXTERNAL_ID=&CODE=php', 'PHP', '', null, 'Information', '1', null, null, null);
INSERT INTO `b_search_content` VALUES ('7', '2017-12-13 11:45:24', 'main', 's1|/news/o-nas.php', '0', null, null, null, '/news/o-nas.php', 'О нас', 'Text here....', '', '', '', null, null, null);
INSERT INTO `b_search_content` VALUES ('8', '2017-12-13 11:46:44', 'main', 's1|/news/ob-avtore.php', '0', null, null, null, '/news/ob-avtore.php', 'Об авторе', 'Text here....', '', '', '', null, null, null);
INSERT INTO `b_search_content` VALUES ('9', '2017-12-13 11:47:36', 'main', 's1|/news/test.php', '0', null, null, null, '/news/test.php', 'Тест', 'Text here....', '', '', '', null, null, null);

-- ----------------------------
-- Table structure for b_search_content_freq
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content_freq
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_content_param
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content_param
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_content_right
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content_right
-- ----------------------------
INSERT INTO `b_search_content_right` VALUES ('1', 'G2');
INSERT INTO `b_search_content_right` VALUES ('2', 'G2');
INSERT INTO `b_search_content_right` VALUES ('4', 'G1');
INSERT INTO `b_search_content_right` VALUES ('4', 'G2');
INSERT INTO `b_search_content_right` VALUES ('5', 'G1');
INSERT INTO `b_search_content_right` VALUES ('5', 'G2');
INSERT INTO `b_search_content_right` VALUES ('6', 'G1');
INSERT INTO `b_search_content_right` VALUES ('6', 'G2');
INSERT INTO `b_search_content_right` VALUES ('7', 'G2');
INSERT INTO `b_search_content_right` VALUES ('8', 'G2');
INSERT INTO `b_search_content_right` VALUES ('9', 'G2');

-- ----------------------------
-- Table structure for b_search_content_site
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content_site
-- ----------------------------
INSERT INTO `b_search_content_site` VALUES ('1', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('2', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('4', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('5', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('6', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('7', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('8', 's1', '');
INSERT INTO `b_search_content_site` VALUES ('9', 's1', '');

-- ----------------------------
-- Table structure for b_search_content_stem
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
-- Records of b_search_content_stem
-- ----------------------------
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '1', '0.1277', '1');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '16', '0.383', '141.286');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '17', '0.1277', '3');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '18', '0.383', '143.286');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '19', '0.1277', '5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '20', '0.1277', '6');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '21', '0.1277', '7');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '22', '0.1277', '9');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '23', '0.1277', '10');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '24', '0.1277', '11');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '25', '0.1277', '12');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '26', '0.1277', '13');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '27', '0.1277', '14');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '28', '0.1277', '15');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '29', '0.1277', '16');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '30', '0.1277', '17');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '31', '0.1277', '18');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '32', '0.1277', '19');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '33', '0.1277', '20');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '34', '0.4047', '159.75');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '35', '0.33', '108.2');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '36', '0.4047', '160.25');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '37', '0.5107', '171.733');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '38', '0.4047', '156.75');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '39', '0.1277', '26');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '40', '0.2553', '139.333');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '41', '0.4047', '150.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '42', '0.4988', '183.071');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '43', '0.1277', '35');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '44', '0.1277', '36');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '45', '0.1277', '39');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '46', '0.383', '186');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '47', '0.383', '187');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '48', '0.1277', '48');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '49', '0.383', '170');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '50', '0.3584', '171.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '51', '0.383', '161.857');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '52', '0.3584', '173.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '53', '0.3584', '181.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '54', '0.3584', '182.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '55', '0.3584', '183.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '56', '0.3584', '184.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '57', '0.4047', '188.625');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '58', '0.3584', '188.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '59', '0.3584', '195.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '60', '0.3584', '196.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '61', '0.4047', '185.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '62', '0.383', '192.571');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '63', '0.3584', '201.5');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '64', '0.1277', '95');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '65', '0.1277', '142');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '66', '0.1277', '189');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '67', '0.1277', '191');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '68', '0.1277', '193');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '69', '0.1277', '236');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '70', '0.1277', '238');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '71', '0.1277', '241');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '72', '0.1277', '285');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '73', '0.1277', '288');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '74', '0.1277', '334');
INSERT INTO `b_search_content_stem` VALUES ('1', 'ru', '75', '0.1277', '335');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '4', '0.2153', '1');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '5', '0.2153', '2');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '76', '0.2153', '3');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '77', '0.3413', '10.5');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '78', '0.2153', '5');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '79', '0.2153', '6');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '80', '0.2153', '7');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '81', '0.2153', '8');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '82', '0.2153', '9');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '83', '0.2153', '10');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '84', '0.2153', '11');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '85', '0.2153', '12');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '86', '0.2153', '13');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '87', '0.2153', '14');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '88', '0.2153', '15');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '89', '0.2153', '16');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '90', '0.2153', '18');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '91', '0.2153', '19');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '92', '0.2153', '25');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '93', '0.2153', '26');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '94', '0.2153', '27');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '95', '0.2153', '28');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '96', '0.2153', '29');
INSERT INTO `b_search_content_stem` VALUES ('2', 'ru', '97', '0.2153', '30');
INSERT INTO `b_search_content_stem` VALUES ('4', 'ru', '7', '0.2314', '1');
INSERT INTO `b_search_content_stem` VALUES ('4', 'ru', '8', '0.2314', '3');
INSERT INTO `b_search_content_stem` VALUES ('4', 'ru', '9', '0.2314', '4');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '10', '0.2314', '1');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '11', '0.2314', '2');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '12', '0.2314', '3');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '13', '0.2314', '4');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '14', '0.2314', '5');
INSERT INTO `b_search_content_stem` VALUES ('5', 'ru', '15', '0.2314', '7');
INSERT INTO `b_search_content_stem` VALUES ('6', 'ru', '6', '0.2314', '1');
INSERT INTO `b_search_content_stem` VALUES ('7', 'ru', '2', '0.2314', '3');
INSERT INTO `b_search_content_stem` VALUES ('7', 'ru', '3', '0.2314', '4');
INSERT INTO `b_search_content_stem` VALUES ('7', 'ru', '98', '0.2314', '2');
INSERT INTO `b_search_content_stem` VALUES ('8', 'ru', '2', '0.2314', '3');
INSERT INTO `b_search_content_stem` VALUES ('8', 'ru', '3', '0.2314', '4');
INSERT INTO `b_search_content_stem` VALUES ('8', 'ru', '99', '0.2314', '2');
INSERT INTO `b_search_content_stem` VALUES ('9', 'ru', '2', '0.2314', '2');
INSERT INTO `b_search_content_stem` VALUES ('9', 'ru', '3', '0.2314', '3');
INSERT INTO `b_search_content_stem` VALUES ('9', 'ru', '100', '0.2314', '1');

-- ----------------------------
-- Table structure for b_search_content_text
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_content_text
-- ----------------------------
INSERT INTO `b_search_content_text` VALUES ('1', 'ee718166f21ca1177b86d8c9ba6b85b8', 'НОВОСТИ\r\nAPRIL 25, 2017\rAND THIS IS A\rMASSIVE HEADLINE\rAENEAN ORNARE VELIT LACUS VARIUS ENIM ULLAMCORPER PROIN ALIQUAM\rFACILISIS ANTE SED ETIAM MAGNA INTERDUM CONGUE. LOREM IPSUM DOLOR\rAMET NULLAM SED ETIAM VEROEROS.\nFULL STORY\rAPRIL 24, 2017\rSED MAGNA\rIPSUM FAUCIBUS\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\rAPRIL 22, 2017\rPRIMIS EGET\rIMPERDIET LOREM\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\rAPRIL 18, 2017\rANTE MATTIS\rINTERDUM DOLOR\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\rAPRIL 14, 2017\rTEMPUS SED\rNULLA IMPERDIET\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\rAPRIL 11, 2017\rODIO MAGNA\rSED CONSECTETUR\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\rAPRIL 7, 2017\rAUGUE LOREM\rPRIMIS VESTIBULUM\rDONEC EGET EX MAGNA. INTERDUM ET MALESUADA FAMES AC ANTE IPSUM PRIMIS IN FAUCIBUS. PELLENTESQUE VENENATIS DOLOR IMPERDIET DOLOR MATTIS SAGITTIS MAGNA ETIAM.\nFULL STORY\r1\r2\r3\r…\r8\r9\r10\rNEXT\r\n');
INSERT INTO `b_search_content_text` VALUES ('2', 'b548a74c769d34fb681e31ff647af068', 'ОБРАТНАЯ СВЯЗЬ\r\nNAME\rEMAIL\rMESSAGE\rADDRESS\r1234 SOMEWHERE ROAD #87257\rNASHVILLE, TN 00000-0000\nPHONE\r(000) 000-0000\rEMAIL\rINFO@UNTITLED.TLD\rSOCIAL\rTWITTER\rFACEBOOK\rINSTAGRAM\rGITHUB\r\n');
INSERT INTO `b_search_content_text` VALUES ('4', 'a42a87593f822a8f7b1c8c03c573e5f6', 'РАЗБИРАЮСЬ, КАК РАБОТАЕТ BITRIX\r\n\r\n');
INSERT INTO `b_search_content_text` VALUES ('5', '7a047352cd02756401647d2fe6f622a6', 'УЧУСЬ ЗАПОЛНЯТЬ ИНФОБЛОК\r\nЗДЕСЬ ДОЛЖЕН БЫТЬ ТЕКСТ\r\n');
INSERT INTO `b_search_content_text` VALUES ('6', 'c1c598d4ef2b151937f9dd71fec49a6f', 'PHP\r\n\r\n');
INSERT INTO `b_search_content_text` VALUES ('7', '5b298cfa8d1f94b89a9570f1e34ee076', 'О НАС\r\nTEXT HERE....\r\n');
INSERT INTO `b_search_content_text` VALUES ('8', 'f1cf641b8fe6b1f2cd30ec3be91d14a3', 'ОБ АВТОРЕ\r\nTEXT HERE....\r\n');
INSERT INTO `b_search_content_text` VALUES ('9', '1204154bc94b7db477b90e7a05147f90', 'ТЕСТ\r\nTEXT HERE....\r\n');

-- ----------------------------
-- Table structure for b_search_content_title
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
-- Records of b_search_content_title
-- ----------------------------
INSERT INTO `b_search_content_title` VALUES ('1', 's1', '0', 'НОВОСТИ');
INSERT INTO `b_search_content_title` VALUES ('2', 's1', '0', 'ОБРАТНАЯ');
INSERT INTO `b_search_content_title` VALUES ('2', 's1', '9', 'СВЯЗЬ');
INSERT INTO `b_search_content_title` VALUES ('4', 's1', '25', 'BITRIX');
INSERT INTO `b_search_content_title` VALUES ('4', 's1', '12', 'КАК');
INSERT INTO `b_search_content_title` VALUES ('4', 's1', '16', 'РАБОТАЕТ');
INSERT INTO `b_search_content_title` VALUES ('4', 's1', '0', 'РАЗБИРАЮСЬ');
INSERT INTO `b_search_content_title` VALUES ('5', 's1', '6', 'ЗАПОЛНЯТЬ');
INSERT INTO `b_search_content_title` VALUES ('5', 's1', '16', 'ИНФОБЛОК');
INSERT INTO `b_search_content_title` VALUES ('5', 's1', '0', 'УЧУСЬ');
INSERT INTO `b_search_content_title` VALUES ('6', 's1', '0', 'PHP');
INSERT INTO `b_search_content_title` VALUES ('7', 's1', '2', 'НАС');
INSERT INTO `b_search_content_title` VALUES ('7', 's1', '0', 'О');
INSERT INTO `b_search_content_title` VALUES ('8', 's1', '3', 'АВТОРЕ');
INSERT INTO `b_search_content_title` VALUES ('8', 's1', '0', 'ОБ');
INSERT INTO `b_search_content_title` VALUES ('9', 's1', '0', 'ТЕСТ');

-- ----------------------------
-- Table structure for b_search_custom_rank
-- ----------------------------
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_custom_rank
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_phrase
-- ----------------------------
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_phrase
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_stem
-- ----------------------------
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_stem
-- ----------------------------
INSERT INTO `b_search_stem` VALUES ('88', '000');
INSERT INTO `b_search_stem` VALUES ('89', '000-0000');
INSERT INTO `b_search_stem` VALUES ('86', '00000-0000');
INSERT INTO `b_search_stem` VALUES ('74', '10');
INSERT INTO `b_search_stem` VALUES ('69', '11');
INSERT INTO `b_search_stem` VALUES ('80', '1234');
INSERT INTO `b_search_stem` VALUES ('66', '14');
INSERT INTO `b_search_stem` VALUES ('65', '18');
INSERT INTO `b_search_stem` VALUES ('18', '2017');
INSERT INTO `b_search_stem` VALUES ('64', '22');
INSERT INTO `b_search_stem` VALUES ('48', '24');
INSERT INTO `b_search_stem` VALUES ('17', '25');
INSERT INTO `b_search_stem` VALUES ('83', '87257');
INSERT INTO `b_search_stem` VALUES ('56', 'AC');
INSERT INTO `b_search_stem` VALUES ('79', 'ADDRESS');
INSERT INTO `b_search_stem` VALUES ('24', 'AENEAN');
INSERT INTO `b_search_stem` VALUES ('32', 'ALIQUAM');
INSERT INTO `b_search_stem` VALUES ('43', 'AMET');
INSERT INTO `b_search_stem` VALUES ('19', 'AND');
INSERT INTO `b_search_stem` VALUES ('34', 'ANTE');
INSERT INTO `b_search_stem` VALUES ('16', 'APRIL');
INSERT INTO `b_search_stem` VALUES ('72', 'AUGUE');
INSERT INTO `b_search_stem` VALUES ('9', 'BITRIX');
INSERT INTO `b_search_stem` VALUES ('39', 'CONGUE');
INSERT INTO `b_search_stem` VALUES ('71', 'CONSECTETUR');
INSERT INTO `b_search_stem` VALUES ('42', 'DOLOR');
INSERT INTO `b_search_stem` VALUES ('50', 'DONEC');
INSERT INTO `b_search_stem` VALUES ('51', 'EGET');
INSERT INTO `b_search_stem` VALUES ('77', 'EMAIL');
INSERT INTO `b_search_stem` VALUES ('29', 'ENIM');
INSERT INTO `b_search_stem` VALUES ('53', 'ET');
INSERT INTO `b_search_stem` VALUES ('36', 'ETIAM');
INSERT INTO `b_search_stem` VALUES ('52', 'EX');
INSERT INTO `b_search_stem` VALUES ('95', 'FACEBOOK');
INSERT INTO `b_search_stem` VALUES ('33', 'FACILISIS');
INSERT INTO `b_search_stem` VALUES ('55', 'FAMES');
INSERT INTO `b_search_stem` VALUES ('49', 'FAUCIBUS');
INSERT INTO `b_search_stem` VALUES ('46', 'FULL');
INSERT INTO `b_search_stem` VALUES ('97', 'GITHUB');
INSERT INTO `b_search_stem` VALUES ('23', 'HEADLINE');
INSERT INTO `b_search_stem` VALUES ('3', 'HERE');
INSERT INTO `b_search_stem` VALUES ('61', 'IMPERDIET');
INSERT INTO `b_search_stem` VALUES ('58', 'IN');
INSERT INTO `b_search_stem` VALUES ('90', 'INFO');
INSERT INTO `b_search_stem` VALUES ('96', 'INSTAGRAM');
INSERT INTO `b_search_stem` VALUES ('38', 'INTERDUM');
INSERT INTO `b_search_stem` VALUES ('41', 'IPSUM');
INSERT INTO `b_search_stem` VALUES ('21', 'IS');
INSERT INTO `b_search_stem` VALUES ('27', 'LACUS');
INSERT INTO `b_search_stem` VALUES ('40', 'LOREM');
INSERT INTO `b_search_stem` VALUES ('37', 'MAGNA');
INSERT INTO `b_search_stem` VALUES ('54', 'MALESUADA');
INSERT INTO `b_search_stem` VALUES ('22', 'MASSIVE');
INSERT INTO `b_search_stem` VALUES ('62', 'MATTIS');
INSERT INTO `b_search_stem` VALUES ('78', 'MESSAGE');
INSERT INTO `b_search_stem` VALUES ('76', 'NAME');
INSERT INTO `b_search_stem` VALUES ('84', 'NASHVILLE');
INSERT INTO `b_search_stem` VALUES ('75', 'NEXT');
INSERT INTO `b_search_stem` VALUES ('68', 'NULLA');
INSERT INTO `b_search_stem` VALUES ('44', 'NULLAM');
INSERT INTO `b_search_stem` VALUES ('70', 'ODIO');
INSERT INTO `b_search_stem` VALUES ('25', 'ORNARE');
INSERT INTO `b_search_stem` VALUES ('59', 'PELLENTESQUE');
INSERT INTO `b_search_stem` VALUES ('87', 'PHONE');
INSERT INTO `b_search_stem` VALUES ('6', 'PHP');
INSERT INTO `b_search_stem` VALUES ('57', 'PRIMIS');
INSERT INTO `b_search_stem` VALUES ('31', 'PROIN');
INSERT INTO `b_search_stem` VALUES ('82', 'ROAD');
INSERT INTO `b_search_stem` VALUES ('63', 'SAGITTIS');
INSERT INTO `b_search_stem` VALUES ('35', 'SED');
INSERT INTO `b_search_stem` VALUES ('93', 'SOCIAL');
INSERT INTO `b_search_stem` VALUES ('81', 'SOMEWHERE');
INSERT INTO `b_search_stem` VALUES ('47', 'STORY');
INSERT INTO `b_search_stem` VALUES ('67', 'TEMPUS');
INSERT INTO `b_search_stem` VALUES ('2', 'TEXT');
INSERT INTO `b_search_stem` VALUES ('20', 'THIS');
INSERT INTO `b_search_stem` VALUES ('92', 'TLD');
INSERT INTO `b_search_stem` VALUES ('85', 'TN');
INSERT INTO `b_search_stem` VALUES ('94', 'TWITTER');
INSERT INTO `b_search_stem` VALUES ('30', 'ULLAMCORPER');
INSERT INTO `b_search_stem` VALUES ('91', 'UNTITLED');
INSERT INTO `b_search_stem` VALUES ('28', 'VARIUS');
INSERT INTO `b_search_stem` VALUES ('26', 'VELIT');
INSERT INTO `b_search_stem` VALUES ('60', 'VENENATIS');
INSERT INTO `b_search_stem` VALUES ('45', 'VEROEROS');
INSERT INTO `b_search_stem` VALUES ('73', 'VESTIBULUM');
INSERT INTO `b_search_stem` VALUES ('99', 'АВТОР');
INSERT INTO `b_search_stem` VALUES ('14', 'ДОЛЖ');
INSERT INTO `b_search_stem` VALUES ('11', 'ЗАПОЛНЯ');
INSERT INTO `b_search_stem` VALUES ('13', 'ЗДЕ');
INSERT INTO `b_search_stem` VALUES ('12', 'ИНФОБЛОК');
INSERT INTO `b_search_stem` VALUES ('98', 'НАС');
INSERT INTO `b_search_stem` VALUES ('1', 'НОВОСТ');
INSERT INTO `b_search_stem` VALUES ('4', 'ОБРАТН');
INSERT INTO `b_search_stem` VALUES ('8', 'РАБОТА');
INSERT INTO `b_search_stem` VALUES ('7', 'РАЗБИРА');
INSERT INTO `b_search_stem` VALUES ('5', 'СВЯЗ');
INSERT INTO `b_search_stem` VALUES ('15', 'ТЕКСТ');
INSERT INTO `b_search_stem` VALUES ('100', 'ТЕСТ');
INSERT INTO `b_search_stem` VALUES ('10', 'УЧ');

-- ----------------------------
-- Table structure for b_search_suggest
-- ----------------------------
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_tags
-- ----------------------------
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
-- Records of b_search_tags
-- ----------------------------

-- ----------------------------
-- Table structure for b_search_user_right
-- ----------------------------
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_search_user_right
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_autolog
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_autolog
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_banner
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_banner
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_campaign
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_campaign
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_group
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_group
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_link
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_link
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_log
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_log
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_order
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_order
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_adv_region
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_adv_region
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_keywords
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_search_engine
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_search_engine
-- ----------------------------
INSERT INTO `b_seo_search_engine` VALUES ('1', 'google', 'Y', '200', 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', null);
INSERT INTO `b_seo_search_engine` VALUES ('2', 'yandex', 'Y', '300', 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', null);
INSERT INTO `b_seo_search_engine` VALUES ('3', 'yandex_direct', 'Y', '400', 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', null);

-- ----------------------------
-- Table structure for b_seo_service_log
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_service_log`;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_service_log
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_service_rtg_queue
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_service_rtg_queue
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_sitemap
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_sitemap
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_sitemap_entity
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_sitemap_entity
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_sitemap_iblock
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_sitemap_iblock
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_sitemap_runtime
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_sitemap_runtime
-- ----------------------------

-- ----------------------------
-- Table structure for b_seo_yandex_direct_stat
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_seo_yandex_direct_stat
-- ----------------------------

-- ----------------------------
-- Table structure for b_short_uri
-- ----------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_short_uri
-- ----------------------------

-- ----------------------------
-- Table structure for b_site_template
-- ----------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_site_template
-- ----------------------------
INSERT INTO `b_site_template` VALUES ('1', 's1', '', '1', 'bitrixproject');

-- ----------------------------
-- Table structure for b_smile
-- ----------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_smile
-- ----------------------------
INSERT INTO `b_smile` VALUES ('1', 'S', '2', '100', ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('2', 'S', '2', '105', ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('3', 'S', '2', '110', ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('4', 'S', '2', '115', '8) 8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('5', 'S', '2', '120', ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('6', 'S', '2', '125', ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('7', 'S', '2', '130', ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('8', 'S', '2', '135', ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('9', 'S', '2', '140', ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('10', 'S', '2', '145', ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('11', 'S', '2', '150', ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('12', 'S', '2', '155', ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('13', 'S', '2', '160', ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('14', 'S', '2', '165', ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('15', 'S', '2', '170', ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('16', 'S', '2', '175', ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('17', 'S', '2', '180', ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', '20', '20');
INSERT INTO `b_smile` VALUES ('18', 'I', '2', '175', 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('19', 'I', '2', '180', 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('20', 'I', '2', '185', 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('21', 'I', '2', '190', 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('22', 'I', '2', '195', 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('23', 'I', '2', '200', 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', '15', '15');
INSERT INTO `b_smile` VALUES ('24', 'I', '2', '205', 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', '15', '15');

-- ----------------------------
-- Table structure for b_smile_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_smile_lang
-- ----------------------------
INSERT INTO `b_smile_lang` VALUES ('1', 'P', '1', 'ru', 'Стандартная галерея');
INSERT INTO `b_smile_lang` VALUES ('2', 'P', '1', 'en', 'Standard gallery');
INSERT INTO `b_smile_lang` VALUES ('3', 'G', '2', 'ru', 'Основной набор');
INSERT INTO `b_smile_lang` VALUES ('4', 'G', '2', 'en', 'Default pack');
INSERT INTO `b_smile_lang` VALUES ('5', 'S', '1', 'ru', 'С улыбкой');
INSERT INTO `b_smile_lang` VALUES ('6', 'S', '1', 'en', 'Smile');
INSERT INTO `b_smile_lang` VALUES ('7', 'S', '2', 'ru', 'Шутливо');
INSERT INTO `b_smile_lang` VALUES ('8', 'S', '2', 'en', 'Wink');
INSERT INTO `b_smile_lang` VALUES ('9', 'S', '3', 'ru', 'Широкая улыбка');
INSERT INTO `b_smile_lang` VALUES ('10', 'S', '3', 'en', 'Big grin');
INSERT INTO `b_smile_lang` VALUES ('11', 'S', '4', 'ru', 'Здорово');
INSERT INTO `b_smile_lang` VALUES ('12', 'S', '4', 'en', 'Cool');
INSERT INTO `b_smile_lang` VALUES ('13', 'S', '5', 'ru', 'Разочарование');
INSERT INTO `b_smile_lang` VALUES ('14', 'S', '5', 'en', 'Facepalm');
INSERT INTO `b_smile_lang` VALUES ('15', 'S', '6', 'ru', 'Поцелуй');
INSERT INTO `b_smile_lang` VALUES ('16', 'S', '6', 'en', 'Kiss');
INSERT INTO `b_smile_lang` VALUES ('17', 'S', '7', 'ru', 'Печально');
INSERT INTO `b_smile_lang` VALUES ('18', 'S', '7', 'en', 'Sad');
INSERT INTO `b_smile_lang` VALUES ('19', 'S', '8', 'ru', 'Скептически');
INSERT INTO `b_smile_lang` VALUES ('20', 'S', '8', 'en', 'Skeptic');
INSERT INTO `b_smile_lang` VALUES ('21', 'S', '9', 'ru', 'Смущенный');
INSERT INTO `b_smile_lang` VALUES ('22', 'S', '9', 'en', 'Embarrassed');
INSERT INTO `b_smile_lang` VALUES ('23', 'S', '10', 'ru', 'Очень грустно');
INSERT INTO `b_smile_lang` VALUES ('24', 'S', '10', 'en', 'Crying');
INSERT INTO `b_smile_lang` VALUES ('25', 'S', '11', 'ru', 'Со злостью');
INSERT INTO `b_smile_lang` VALUES ('26', 'S', '11', 'en', 'Angry');
INSERT INTO `b_smile_lang` VALUES ('27', 'S', '12', 'ru', 'Удивленно');
INSERT INTO `b_smile_lang` VALUES ('28', 'S', '12', 'en', 'Surprised');
INSERT INTO `b_smile_lang` VALUES ('29', 'S', '13', 'ru', 'Смущенно');
INSERT INTO `b_smile_lang` VALUES ('30', 'S', '13', 'en', 'Confused');
INSERT INTO `b_smile_lang` VALUES ('31', 'S', '14', 'ru', 'Идея');
INSERT INTO `b_smile_lang` VALUES ('32', 'S', '14', 'en', 'Idea');
INSERT INTO `b_smile_lang` VALUES ('33', 'S', '15', 'ru', 'Вопрос');
INSERT INTO `b_smile_lang` VALUES ('34', 'S', '15', 'en', 'Question');
INSERT INTO `b_smile_lang` VALUES ('35', 'S', '16', 'ru', 'Восклицание');
INSERT INTO `b_smile_lang` VALUES ('36', 'S', '16', 'en', 'Exclamation');
INSERT INTO `b_smile_lang` VALUES ('37', 'S', '17', 'ru', 'Нравится');
INSERT INTO `b_smile_lang` VALUES ('38', 'S', '17', 'en', 'Like');

-- ----------------------------
-- Table structure for b_smile_set
-- ----------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_smile_set
-- ----------------------------
INSERT INTO `b_smile_set` VALUES ('1', 'P', '0', 'bitrix', '150');
INSERT INTO `b_smile_set` VALUES ('2', 'G', '1', 'bitrix_main', '150');

-- ----------------------------
-- Table structure for b_socialservices_ap
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_ap`;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_ap
-- ----------------------------

-- ----------------------------
-- Table structure for b_socialservices_contact
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_contact
-- ----------------------------

-- ----------------------------
-- Table structure for b_socialservices_contact_connect
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_contact_connect
-- ----------------------------

-- ----------------------------
-- Table structure for b_socialservices_message
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_message
-- ----------------------------

-- ----------------------------
-- Table structure for b_socialservices_user
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_user
-- ----------------------------

-- ----------------------------
-- Table structure for b_socialservices_user_link
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_socialservices_user_link
-- ----------------------------

-- ----------------------------
-- Table structure for b_sticker
-- ----------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_sticker
-- ----------------------------

-- ----------------------------
-- Table structure for b_sticker_group_task
-- ----------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_sticker_group_task
-- ----------------------------

-- ----------------------------
-- Table structure for b_task
-- ----------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_task
-- ----------------------------
INSERT INTO `b_task` VALUES ('1', 'main_denied', 'D', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('2', 'main_change_profile', 'P', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('3', 'main_view_all_settings', 'R', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('4', 'main_view_all_settings_change_profile', 'T', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('5', 'main_edit_subordinate_users', 'V', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('6', 'main_full_access', 'W', 'main', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('7', 'fm_folder_access_denied', 'D', 'main', 'Y', null, 'file');
INSERT INTO `b_task` VALUES ('8', 'fm_folder_access_read', 'R', 'main', 'Y', null, 'file');
INSERT INTO `b_task` VALUES ('9', 'fm_folder_access_write', 'W', 'main', 'Y', null, 'file');
INSERT INTO `b_task` VALUES ('10', 'fm_folder_access_full', 'X', 'main', 'Y', null, 'file');
INSERT INTO `b_task` VALUES ('11', 'fm_folder_access_workflow', 'U', 'main', 'Y', null, 'file');
INSERT INTO `b_task` VALUES ('12', 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('13', 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('14', 'clouds_denied', 'D', 'clouds', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('15', 'clouds_browse', 'F', 'clouds', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('16', 'clouds_upload', 'U', 'clouds', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('17', 'clouds_full_access', 'W', 'clouds', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('18', 'fileman_denied', 'D', 'fileman', 'Y', '', 'module');
INSERT INTO `b_task` VALUES ('19', 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module');
INSERT INTO `b_task` VALUES ('20', 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module');
INSERT INTO `b_task` VALUES ('21', 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('22', 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('23', 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('24', 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('25', 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('26', 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib');
INSERT INTO `b_task` VALUES ('27', 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers');
INSERT INTO `b_task` VALUES ('28', 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers');
INSERT INTO `b_task` VALUES ('29', 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers');
INSERT INTO `b_task` VALUES ('30', 'hblock_denied', 'D', 'highloadblock', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('31', 'hblock_read', 'R', 'highloadblock', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('32', 'hblock_write', 'W', 'highloadblock', 'Y', null, 'module');
INSERT INTO `b_task` VALUES ('33', 'iblock_deny', 'D', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('34', 'iblock_read', 'R', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('35', 'iblock_element_add', 'E', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('36', 'iblock_admin_read', 'S', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('37', 'iblock_admin_add', 'T', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('38', 'iblock_limited_edit', 'U', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('39', 'iblock_full_edit', 'W', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('40', 'iblock_full', 'X', 'iblock', 'Y', null, 'iblock');
INSERT INTO `b_task` VALUES ('41', 'seo_denied', 'D', 'seo', 'Y', '', 'module');
INSERT INTO `b_task` VALUES ('42', 'seo_edit', 'F', 'seo', 'Y', '', 'module');
INSERT INTO `b_task` VALUES ('43', 'seo_full_access', 'W', 'seo', 'Y', '', 'module');

-- ----------------------------
-- Table structure for b_task_operation
-- ----------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_task_operation
-- ----------------------------
INSERT INTO `b_task_operation` VALUES ('2', '2');
INSERT INTO `b_task_operation` VALUES ('2', '3');
INSERT INTO `b_task_operation` VALUES ('3', '2');
INSERT INTO `b_task_operation` VALUES ('3', '4');
INSERT INTO `b_task_operation` VALUES ('3', '5');
INSERT INTO `b_task_operation` VALUES ('3', '6');
INSERT INTO `b_task_operation` VALUES ('3', '7');
INSERT INTO `b_task_operation` VALUES ('4', '2');
INSERT INTO `b_task_operation` VALUES ('4', '3');
INSERT INTO `b_task_operation` VALUES ('4', '4');
INSERT INTO `b_task_operation` VALUES ('4', '5');
INSERT INTO `b_task_operation` VALUES ('4', '6');
INSERT INTO `b_task_operation` VALUES ('4', '7');
INSERT INTO `b_task_operation` VALUES ('5', '2');
INSERT INTO `b_task_operation` VALUES ('5', '3');
INSERT INTO `b_task_operation` VALUES ('5', '5');
INSERT INTO `b_task_operation` VALUES ('5', '6');
INSERT INTO `b_task_operation` VALUES ('5', '7');
INSERT INTO `b_task_operation` VALUES ('5', '8');
INSERT INTO `b_task_operation` VALUES ('5', '9');
INSERT INTO `b_task_operation` VALUES ('6', '2');
INSERT INTO `b_task_operation` VALUES ('6', '3');
INSERT INTO `b_task_operation` VALUES ('6', '4');
INSERT INTO `b_task_operation` VALUES ('6', '5');
INSERT INTO `b_task_operation` VALUES ('6', '6');
INSERT INTO `b_task_operation` VALUES ('6', '7');
INSERT INTO `b_task_operation` VALUES ('6', '10');
INSERT INTO `b_task_operation` VALUES ('6', '11');
INSERT INTO `b_task_operation` VALUES ('6', '12');
INSERT INTO `b_task_operation` VALUES ('6', '13');
INSERT INTO `b_task_operation` VALUES ('6', '14');
INSERT INTO `b_task_operation` VALUES ('6', '15');
INSERT INTO `b_task_operation` VALUES ('6', '16');
INSERT INTO `b_task_operation` VALUES ('6', '17');
INSERT INTO `b_task_operation` VALUES ('6', '18');
INSERT INTO `b_task_operation` VALUES ('8', '19');
INSERT INTO `b_task_operation` VALUES ('8', '20');
INSERT INTO `b_task_operation` VALUES ('8', '21');
INSERT INTO `b_task_operation` VALUES ('9', '19');
INSERT INTO `b_task_operation` VALUES ('9', '20');
INSERT INTO `b_task_operation` VALUES ('9', '21');
INSERT INTO `b_task_operation` VALUES ('9', '22');
INSERT INTO `b_task_operation` VALUES ('9', '23');
INSERT INTO `b_task_operation` VALUES ('9', '24');
INSERT INTO `b_task_operation` VALUES ('9', '25');
INSERT INTO `b_task_operation` VALUES ('9', '26');
INSERT INTO `b_task_operation` VALUES ('9', '27');
INSERT INTO `b_task_operation` VALUES ('9', '28');
INSERT INTO `b_task_operation` VALUES ('9', '29');
INSERT INTO `b_task_operation` VALUES ('9', '30');
INSERT INTO `b_task_operation` VALUES ('9', '31');
INSERT INTO `b_task_operation` VALUES ('9', '32');
INSERT INTO `b_task_operation` VALUES ('9', '33');
INSERT INTO `b_task_operation` VALUES ('9', '34');
INSERT INTO `b_task_operation` VALUES ('10', '19');
INSERT INTO `b_task_operation` VALUES ('10', '20');
INSERT INTO `b_task_operation` VALUES ('10', '21');
INSERT INTO `b_task_operation` VALUES ('10', '22');
INSERT INTO `b_task_operation` VALUES ('10', '23');
INSERT INTO `b_task_operation` VALUES ('10', '24');
INSERT INTO `b_task_operation` VALUES ('10', '25');
INSERT INTO `b_task_operation` VALUES ('10', '26');
INSERT INTO `b_task_operation` VALUES ('10', '27');
INSERT INTO `b_task_operation` VALUES ('10', '28');
INSERT INTO `b_task_operation` VALUES ('10', '29');
INSERT INTO `b_task_operation` VALUES ('10', '30');
INSERT INTO `b_task_operation` VALUES ('10', '31');
INSERT INTO `b_task_operation` VALUES ('10', '32');
INSERT INTO `b_task_operation` VALUES ('10', '33');
INSERT INTO `b_task_operation` VALUES ('10', '34');
INSERT INTO `b_task_operation` VALUES ('10', '35');
INSERT INTO `b_task_operation` VALUES ('11', '19');
INSERT INTO `b_task_operation` VALUES ('11', '20');
INSERT INTO `b_task_operation` VALUES ('11', '21');
INSERT INTO `b_task_operation` VALUES ('11', '24');
INSERT INTO `b_task_operation` VALUES ('11', '28');
INSERT INTO `b_task_operation` VALUES ('13', '36');
INSERT INTO `b_task_operation` VALUES ('13', '37');
INSERT INTO `b_task_operation` VALUES ('13', '38');
INSERT INTO `b_task_operation` VALUES ('15', '39');
INSERT INTO `b_task_operation` VALUES ('16', '39');
INSERT INTO `b_task_operation` VALUES ('16', '40');
INSERT INTO `b_task_operation` VALUES ('17', '39');
INSERT INTO `b_task_operation` VALUES ('17', '40');
INSERT INTO `b_task_operation` VALUES ('17', '41');
INSERT INTO `b_task_operation` VALUES ('19', '44');
INSERT INTO `b_task_operation` VALUES ('19', '45');
INSERT INTO `b_task_operation` VALUES ('19', '46');
INSERT INTO `b_task_operation` VALUES ('19', '47');
INSERT INTO `b_task_operation` VALUES ('19', '48');
INSERT INTO `b_task_operation` VALUES ('19', '49');
INSERT INTO `b_task_operation` VALUES ('19', '50');
INSERT INTO `b_task_operation` VALUES ('19', '52');
INSERT INTO `b_task_operation` VALUES ('19', '53');
INSERT INTO `b_task_operation` VALUES ('20', '42');
INSERT INTO `b_task_operation` VALUES ('20', '43');
INSERT INTO `b_task_operation` VALUES ('20', '44');
INSERT INTO `b_task_operation` VALUES ('20', '45');
INSERT INTO `b_task_operation` VALUES ('20', '46');
INSERT INTO `b_task_operation` VALUES ('20', '47');
INSERT INTO `b_task_operation` VALUES ('20', '48');
INSERT INTO `b_task_operation` VALUES ('20', '49');
INSERT INTO `b_task_operation` VALUES ('20', '50');
INSERT INTO `b_task_operation` VALUES ('20', '51');
INSERT INTO `b_task_operation` VALUES ('20', '52');
INSERT INTO `b_task_operation` VALUES ('20', '53');
INSERT INTO `b_task_operation` VALUES ('20', '54');
INSERT INTO `b_task_operation` VALUES ('22', '55');
INSERT INTO `b_task_operation` VALUES ('23', '55');
INSERT INTO `b_task_operation` VALUES ('23', '56');
INSERT INTO `b_task_operation` VALUES ('23', '60');
INSERT INTO `b_task_operation` VALUES ('24', '55');
INSERT INTO `b_task_operation` VALUES ('24', '60');
INSERT INTO `b_task_operation` VALUES ('24', '61');
INSERT INTO `b_task_operation` VALUES ('24', '62');
INSERT INTO `b_task_operation` VALUES ('25', '55');
INSERT INTO `b_task_operation` VALUES ('25', '56');
INSERT INTO `b_task_operation` VALUES ('25', '57');
INSERT INTO `b_task_operation` VALUES ('25', '58');
INSERT INTO `b_task_operation` VALUES ('25', '60');
INSERT INTO `b_task_operation` VALUES ('25', '61');
INSERT INTO `b_task_operation` VALUES ('25', '62');
INSERT INTO `b_task_operation` VALUES ('26', '55');
INSERT INTO `b_task_operation` VALUES ('26', '56');
INSERT INTO `b_task_operation` VALUES ('26', '57');
INSERT INTO `b_task_operation` VALUES ('26', '58');
INSERT INTO `b_task_operation` VALUES ('26', '59');
INSERT INTO `b_task_operation` VALUES ('26', '60');
INSERT INTO `b_task_operation` VALUES ('26', '61');
INSERT INTO `b_task_operation` VALUES ('26', '62');
INSERT INTO `b_task_operation` VALUES ('28', '63');
INSERT INTO `b_task_operation` VALUES ('29', '63');
INSERT INTO `b_task_operation` VALUES ('29', '64');
INSERT INTO `b_task_operation` VALUES ('29', '65');
INSERT INTO `b_task_operation` VALUES ('29', '66');
INSERT INTO `b_task_operation` VALUES ('31', '67');
INSERT INTO `b_task_operation` VALUES ('32', '68');
INSERT INTO `b_task_operation` VALUES ('32', '69');
INSERT INTO `b_task_operation` VALUES ('34', '70');
INSERT INTO `b_task_operation` VALUES ('34', '71');
INSERT INTO `b_task_operation` VALUES ('35', '72');
INSERT INTO `b_task_operation` VALUES ('36', '70');
INSERT INTO `b_task_operation` VALUES ('36', '71');
INSERT INTO `b_task_operation` VALUES ('36', '73');
INSERT INTO `b_task_operation` VALUES ('37', '70');
INSERT INTO `b_task_operation` VALUES ('37', '71');
INSERT INTO `b_task_operation` VALUES ('37', '72');
INSERT INTO `b_task_operation` VALUES ('37', '73');
INSERT INTO `b_task_operation` VALUES ('38', '70');
INSERT INTO `b_task_operation` VALUES ('38', '71');
INSERT INTO `b_task_operation` VALUES ('38', '72');
INSERT INTO `b_task_operation` VALUES ('38', '73');
INSERT INTO `b_task_operation` VALUES ('38', '74');
INSERT INTO `b_task_operation` VALUES ('38', '75');
INSERT INTO `b_task_operation` VALUES ('38', '76');
INSERT INTO `b_task_operation` VALUES ('38', '77');
INSERT INTO `b_task_operation` VALUES ('39', '70');
INSERT INTO `b_task_operation` VALUES ('39', '71');
INSERT INTO `b_task_operation` VALUES ('39', '72');
INSERT INTO `b_task_operation` VALUES ('39', '73');
INSERT INTO `b_task_operation` VALUES ('39', '74');
INSERT INTO `b_task_operation` VALUES ('39', '75');
INSERT INTO `b_task_operation` VALUES ('39', '76');
INSERT INTO `b_task_operation` VALUES ('39', '77');
INSERT INTO `b_task_operation` VALUES ('39', '78');
INSERT INTO `b_task_operation` VALUES ('39', '79');
INSERT INTO `b_task_operation` VALUES ('39', '80');
INSERT INTO `b_task_operation` VALUES ('39', '81');
INSERT INTO `b_task_operation` VALUES ('40', '70');
INSERT INTO `b_task_operation` VALUES ('40', '71');
INSERT INTO `b_task_operation` VALUES ('40', '72');
INSERT INTO `b_task_operation` VALUES ('40', '73');
INSERT INTO `b_task_operation` VALUES ('40', '74');
INSERT INTO `b_task_operation` VALUES ('40', '75');
INSERT INTO `b_task_operation` VALUES ('40', '76');
INSERT INTO `b_task_operation` VALUES ('40', '77');
INSERT INTO `b_task_operation` VALUES ('40', '78');
INSERT INTO `b_task_operation` VALUES ('40', '79');
INSERT INTO `b_task_operation` VALUES ('40', '80');
INSERT INTO `b_task_operation` VALUES ('40', '81');
INSERT INTO `b_task_operation` VALUES ('40', '82');
INSERT INTO `b_task_operation` VALUES ('40', '83');
INSERT INTO `b_task_operation` VALUES ('40', '84');
INSERT INTO `b_task_operation` VALUES ('40', '85');
INSERT INTO `b_task_operation` VALUES ('40', '86');
INSERT INTO `b_task_operation` VALUES ('40', '87');
INSERT INTO `b_task_operation` VALUES ('42', '89');
INSERT INTO `b_task_operation` VALUES ('43', '88');
INSERT INTO `b_task_operation` VALUES ('43', '89');

-- ----------------------------
-- Table structure for b_undo
-- ----------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_undo
-- ----------------------------
INSERT INTO `b_undo` VALUES ('10129708e740c5f67cb46a61f4ed92e96', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index_inc.php\";s:7:\"content\";s:79:\"<?$APPLICATION->IncludeComponent(\n	\"bitrix:main.colorpicker\",\n	\"\",\nArray()\n);?>\";}', '1', '1513154947');
INSERT INTO `b_undo` VALUES ('10a0c4cb32fb79b2d60417a39f9d49fd6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7607:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150123');
INSERT INTO `b_undo` VALUES ('10d65bda8b8c9753d511192431c1c3fed', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7115:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><!-- Main --><br>\n<!-- Featured Post -->\n<div id=\"main\">\n    <article class=\"post featured\">\n	<div class=\"major\">\n        <?$APPLICATION->IncludeComponent(\n	\"bitrix:catalog.section.list\", \n	\".default\", \n	array(\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COUNT_ELEMENTS\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"SECTION_CODE\" => \"\",\n		\"SECTION_FIELDS\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SECTION_ID\" => $_REQUEST[\"SECTION_ID\"],\n		\"SECTION_URL\" => \"/news/#SECTION_CODE_PATH#\",\n		\"SECTION_USER_FIELDS\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SHOW_PARENT_NAME\" => \"Y\",\n		\"TOP_DEPTH\" => \"2\",\n		\"VIEW_MODE\" => \"LINE\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?>\n		 <?$APPLICATION->IncludeComponent(\n	\"bitrix:news\",\n	\".default\",\n	Array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"LIST_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => array(\"news\"=>\"\",\"section\"=>\"#SECTION_CODE_PATH#/\",\"detail\"=>\"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",),\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\"\n	)\n);?> <a href=\"#\"> <span class=\"date\">April 25, 2017</span> </a>\n		<h2><a href=\"#\"></a><a href=\"#\">And this is a<br>\n		 massive headline</a></h2>\n		<p>\n			 Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br>\n			 facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br>\n			 amet nullam sed etiam veroeros.\n		</p>\n	</div>\n <a href=\"#\" class=\"image main\"><img src=\"/bitrix/templates/bitrixproject/images/pic01.jpg\" alt=\"\"></a>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button big\">Full Story</a></li>\n	</ul>\n </article>\n	<!-- Posts --> <section class=\"posts\"> <article>\n	<div>\n <span class=\"date\">April 24, 2017</span>\n		<h2><a href=\"#\">Sed magna<br>\n		 ipsum faucibus</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic02.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 22, 2017</span>\n		<h2><a href=\"#\">Primis eget<br>\n		 imperdiet lorem</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic03.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 18, 2017</span>\n		<h2><a href=\"#\">Ante mattis<br>\n		 interdum dolor</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic04.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 14, 2017</span>\n		<h2><a href=\"#\">Tempus sed<br>\n		 nulla imperdiet</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic05.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 11, 2017</span>\n		<h2><a href=\"#\">Odio magna<br>\n		 sed consectetur</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic06.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 7, 2017</span>\n		<h2><a href=\"#\">Augue lorem<br>\n		 primis vestibulum</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic07.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> </section> <footer>\n	<div class=\"pagination\">\n		 <!--<a href=\"#\" class=\"previous\">Prev</a>--> <a href=\"#\" class=\"page active\">1</a> <a href=\"#\" class=\"page\">2</a> <a href=\"#\" class=\"page\">3</a> <span class=\"extra\">…</span> <a href=\"#\" class=\"page\">8</a> <a href=\"#\" class=\"page\">9</a> <a href=\"#\" class=\"page\">10</a> <a href=\"#\" class=\"next\">Next</a>\n	</div>\n </footer>\n</div>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513152907');
INSERT INTO `b_undo` VALUES ('1172a88cbcfb292a7ea5522c9671ac38b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7627:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150252');
INSERT INTO `b_undo` VALUES ('1188a59951a8b0f65318b2cd6c3e85307', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:5:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/ob-avtore.php\";s:4:\"path\";s:19:\"/news/ob-avtore.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:19:\"/news/.top.menu.php\";s:8:\"menuName\";s:9:\"О нас\";s:8:\"menuPath\";s:19:\"/news/ob-avtore.php\";}}', '1', '1513154801');
INSERT INTO `b_undo` VALUES ('11a5b7eda5da4dd7ec0445a4fc820b5ea', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7607:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150274');
INSERT INTO `b_undo` VALUES ('123dc1bfeafa86044d1fda7ea18c5cb91', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/feedback/index.php\";s:7:\"content\";s:2667:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Обратная связь\");\n?><br>\n <!-- Footer --><?$APPLICATION->IncludeComponent(\n	\"bitrix:iblock.element.add\",\n	\"\",\n	Array(\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"ALLOW_DELETE\" => \"Y\",\n		\"ALLOW_EDIT\" => \"Y\",\n		\"CUSTOM_TITLE_DATE_ACTIVE_FROM\" => \"\",\n		\"CUSTOM_TITLE_DATE_ACTIVE_TO\" => \"\",\n		\"CUSTOM_TITLE_DETAIL_PICTURE\" => \"\",\n		\"CUSTOM_TITLE_DETAIL_TEXT\" => \"\",\n		\"CUSTOM_TITLE_IBLOCK_SECTION\" => \"\",\n		\"CUSTOM_TITLE_NAME\" => \"\",\n		\"CUSTOM_TITLE_PREVIEW_PICTURE\" => \"\",\n		\"CUSTOM_TITLE_PREVIEW_TEXT\" => \"\",\n		\"CUSTOM_TITLE_TAGS\" => \"\",\n		\"DEFAULT_INPUT_SIZE\" => \"30\",\n		\"DETAIL_TEXT_USE_HTML_EDITOR\" => \"N\",\n		\"ELEMENT_ASSOC\" => \"CREATED_BY\",\n		\"GROUPS\" => array(),\n		\"IBLOCK_ID\" => \"\",\n		\"IBLOCK_TYPE\" => \"Feedback\",\n		\"LEVEL_LAST\" => \"Y\",\n		\"MAX_FILE_SIZE\" => \"0\",\n		\"MAX_LEVELS\" => \"100000\",\n		\"MAX_USER_ENTRIES\" => \"100000\",\n		\"NAV_ON_PAGE\" => \"10\",\n		\"PREVIEW_TEXT_USE_HTML_EDITOR\" => \"N\",\n		\"PROPERTY_CODES\" => array(),\n		\"PROPERTY_CODES_REQUIRED\" => array(),\n		\"RESIZE_IMAGES\" => \"N\",\n		\"SEF_MODE\" => \"N\",\n		\"STATUS\" => \"ANY\",\n		\"STATUS_NEW\" => \"N\",\n		\"USER_MESSAGE_ADD\" => \"\",\n		\"USER_MESSAGE_EDIT\" => \"\",\n		\"USE_CAPTCHA\" => \"N\"\n	)\n);?><footer id=\"footer\"> <section>\n<form method=\"post\" action=\"#\">\n	<div class=\"field\">\n <label for=\"name\">Name</label> <input type=\"text\" name=\"name\" id=\"name\">\n	</div>\n	<div class=\"field\">\n <label for=\"email\">Email</label> <input type=\"text\" name=\"email\" id=\"email\">\n	</div>\n	<div class=\"field\">\n <label for=\"message\">Message</label> <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\n	</div>\n	<ul class=\"actions\">\n		<li><input type=\"submit\" value=\"Send Message\"></li>\n	</ul>\n</form>\n </section> <section class=\"split contact\"> <section class=\"alt\">\n<h3>Address</h3>\n<p>\n	 1234 Somewhere Road #87257<br>\n	 Nashville, TN 00000-0000\n</p>\n </section> <section>\n<h3>Phone</h3>\n<p>\n <a href=\"#\">(000) 000-0000</a>\n</p>\n </section> <section>\n<h3>Email</h3>\n<p>\n <a href=\"#\">info@untitled.tld</a>\n</p>\n </section> <section>\n<h3>Social</h3>\n<ul class=\"icons alt\">\n	<li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\n</ul>\n </section> </section> </footer><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513152390');
INSERT INTO `b_undo` VALUES ('129471e55a117b9104f2c1fae497d320c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7278:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><!-- Main --><br>\n<!-- Featured Post -->\n<div id=\"main\">\n    <article class=\"post featured\">\n	<div class=\"major\">\n        <?$APPLICATION->IncludeComponent(\n            \"bitrix:catalog.section.list\",\n            \"\",\n            Array(\n                \"ADD_SECTIONS_CHAIN\" => \"Y\",\n                \"CACHE_GROUPS\" => \"Y\",\n                \"CACHE_TIME\" => \"36000000\",\n                \"CACHE_TYPE\" => \"A\",\n                \"COUNT_ELEMENTS\" => \"Y\",\n                \"IBLOCK_ID\" => \"1\",\n                \"IBLOCK_TYPE\" => \"Information\",\n                \"SECTION_CODE\" => \"\",\n                \"SECTION_FIELDS\" => array(\"\",\"\"),\n                \"SECTION_ID\" => $_REQUEST[\"SECTION_ID\"],\n                \"SECTION_URL\" => \"/news/#SECTION_CODE_PATH#/\",\n                \"SECTION_USER_FIELDS\" => array(\"\",\"\"),\n                \"SHOW_PARENT_NAME\" => \"Y\",\n                \"TOP_DEPTH\" => \"2\",\n                \"VIEW_MODE\" => \"LINE\"\n            )\n        );?>\n		 <?$APPLICATION->IncludeComponent(\n	\"bitrix:news\",\n	\".default\",\n	Array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"LIST_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => array(\"news\"=>\"\",\"section\"=>\"#SECTION_CODE_PATH#/\",\"detail\"=>\"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",),\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\"\n	)\n);?> <a href=\"#\"> <span class=\"date\">April 25, 2017</span> </a>\n		<h2><a href=\"#\"></a><a href=\"#\">And this is a<br>\n		 massive headline</a></h2>\n		<p>\n			 Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br>\n			 facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br>\n			 amet nullam sed etiam veroeros.\n		</p>\n	</div>\n <a href=\"#\" class=\"image main\"><img src=\"/bitrix/templates/bitrixproject/images/pic01.jpg\" alt=\"\"></a>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button big\">Full Story</a></li>\n	</ul>\n </article>\n	<!-- Posts --> <section class=\"posts\"> <article>\n	<div>\n <span class=\"date\">April 24, 2017</span>\n		<h2><a href=\"#\">Sed magna<br>\n		 ipsum faucibus</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic02.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 22, 2017</span>\n		<h2><a href=\"#\">Primis eget<br>\n		 imperdiet lorem</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic03.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 18, 2017</span>\n		<h2><a href=\"#\">Ante mattis<br>\n		 interdum dolor</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic04.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 14, 2017</span>\n		<h2><a href=\"#\">Tempus sed<br>\n		 nulla imperdiet</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic05.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 11, 2017</span>\n		<h2><a href=\"#\">Odio magna<br>\n		 sed consectetur</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic06.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 7, 2017</span>\n		<h2><a href=\"#\">Augue lorem<br>\n		 primis vestibulum</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic07.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> </section> <footer>\n	<div class=\"pagination\">\n		 <!--<a href=\"#\" class=\"previous\">Prev</a>--> <a href=\"#\" class=\"page active\">1</a> <a href=\"#\" class=\"page\">2</a> <a href=\"#\" class=\"page\">3</a> <span class=\"extra\">…</span> <a href=\"#\" class=\"page\">8</a> <a href=\"#\" class=\"page\">9</a> <a href=\"#\" class=\"page\">10</a> <a href=\"#\" class=\"next\">Next</a>\n	</div>\n </footer>\n</div>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150846');
INSERT INTO `b_undo` VALUES ('129e883377d91a348f340b4608aa97512', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150142');
INSERT INTO `b_undo` VALUES ('1310a20f03168c37792692991d8b67286', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index_inc.php\";s:7:\"content\";s:79:\"<?$APPLICATION->IncludeComponent(\n	\"bitrix:main.colorpicker\",\n	\"\",\nArray()\n);?>\";}', '1', '1513154931');
INSERT INTO `b_undo` VALUES ('151149c5daefaec03c9bf28e16031f28a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7606:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150040');
INSERT INTO `b_undo` VALUES ('1561ba24b6e40d31ed1de64f067ce2a1d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150364');
INSERT INTO `b_undo` VALUES ('167e9ca928677c61327d4687149452306', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7646:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH##ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150337');
INSERT INTO `b_undo` VALUES ('16bee36a446013eca0ca501f6d0f65276', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7577:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513149724');
INSERT INTO `b_undo` VALUES ('1723215e416baf13e3fe5ae187db1b70f', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index_inc.php\";s:7:\"content\";N;}', '1', '1513154919');
INSERT INTO `b_undo` VALUES ('1776a5d39bc9fe2bf2a22de731598f9f6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150453');
INSERT INTO `b_undo` VALUES ('18793ee44ac8aef65af9af4756be40464', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150099');
INSERT INTO `b_undo` VALUES ('1999ac5850d777aba8926fc2a5c546289', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:5:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/o-nas.php\";s:4:\"path\";s:15:\"/news/o-nas.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:20:\"/news/.left.menu.php\";s:8:\"menuName\";s:9:\"О нас\";s:8:\"menuPath\";s:15:\"/news/o-nas.php\";}}', '1', '1513154721');
INSERT INTO `b_undo` VALUES ('1ae5159244e1c602daad9b7791bf60dfe', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:5:{s:7:\"absPath\";s:63:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/test.php\";s:4:\"path\";s:14:\"/news/test.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:19:\"/news/.top.menu.php\";s:8:\"menuName\";s:8:\"Тест\";s:8:\"menuPath\";s:14:\"/news/test.php\";}}', '1', '1513154853');
INSERT INTO `b_undo` VALUES ('1b562faea40212fe8c397c36903ac36e1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7628:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"/#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150322');
INSERT INTO `b_undo` VALUES ('1b653bab168d08b2982365a1b6f5a2b4a', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/feedback/index.php\";s:7:\"content\";s:2159:\"<?\r\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\r\n$APPLICATION->SetTitle(\"Обратная связь\");\r\n?>\r\n\r\n    <!-- Footer -->\r\n    <footer id=\"footer\">\r\n        <section>\r\n            <form method=\"post\" action=\"#\">\r\n                <div class=\"field\">\r\n                    <label for=\"name\">Name</label>\r\n                    <input type=\"text\" name=\"name\" id=\"name\" />\r\n                </div>\r\n                <div class=\"field\">\r\n                    <label for=\"email\">Email</label>\r\n                    <input type=\"text\" name=\"email\" id=\"email\" />\r\n                </div>\r\n                <div class=\"field\">\r\n                    <label for=\"message\">Message</label>\r\n                    <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\r\n                </div>\r\n                <ul class=\"actions\">\r\n                    <li><input type=\"submit\" value=\"Send Message\" /></li>\r\n                </ul>\r\n            </form>\r\n        </section>\r\n        <section class=\"split contact\">\r\n            <section class=\"alt\">\r\n                <h3>Address</h3>\r\n                <p>1234 Somewhere Road #87257<br />\r\n                    Nashville, TN 00000-0000</p>\r\n            </section>\r\n            <section>\r\n                <h3>Phone</h3>\r\n                <p><a href=\"#\">(000) 000-0000</a></p>\r\n            </section>\r\n            <section>\r\n                <h3>Email</h3>\r\n                <p><a href=\"#\">info@untitled.tld</a></p>\r\n            </section>\r\n            <section>\r\n                <h3>Social</h3>\r\n                <ul class=\"icons alt\">\r\n                    <li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\r\n                    <li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\r\n                    <li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\r\n                    <li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\r\n                </ul>\r\n            </section>\r\n        </section>\r\n    </footer>\r\n\r\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513151145');
INSERT INTO `b_undo` VALUES ('1bb7699bb11c609898528dd6ce0243605', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150227');
INSERT INTO `b_undo` VALUES ('1bd20d6d6b63c61639560f03de57982c9', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/feedback/index.php\";s:7:\"content\";s:2670:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Обратная связь\");\n?><br>\n <!-- Footer --><?$APPLICATION->IncludeComponent(\n	\"bitrix:iblock.element.add\",\n	\"\",\n	Array(\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"ALLOW_DELETE\" => \"Y\",\n		\"ALLOW_EDIT\" => \"Y\",\n		\"CUSTOM_TITLE_DATE_ACTIVE_FROM\" => \"\",\n		\"CUSTOM_TITLE_DATE_ACTIVE_TO\" => \"\",\n		\"CUSTOM_TITLE_DETAIL_PICTURE\" => \"\",\n		\"CUSTOM_TITLE_DETAIL_TEXT\" => \"\",\n		\"CUSTOM_TITLE_IBLOCK_SECTION\" => \"\",\n		\"CUSTOM_TITLE_NAME\" => \"\",\n		\"CUSTOM_TITLE_PREVIEW_PICTURE\" => \"\",\n		\"CUSTOM_TITLE_PREVIEW_TEXT\" => \"\",\n		\"CUSTOM_TITLE_TAGS\" => \"\",\n		\"DEFAULT_INPUT_SIZE\" => \"30\",\n		\"DETAIL_TEXT_USE_HTML_EDITOR\" => \"N\",\n		\"ELEMENT_ASSOC\" => \"CREATED_BY\",\n		\"GROUPS\" => array(\"2\"),\n		\"IBLOCK_ID\" => \"\",\n		\"IBLOCK_TYPE\" => \"Feedback\",\n		\"LEVEL_LAST\" => \"Y\",\n		\"MAX_FILE_SIZE\" => \"0\",\n		\"MAX_LEVELS\" => \"100000\",\n		\"MAX_USER_ENTRIES\" => \"100000\",\n		\"NAV_ON_PAGE\" => \"10\",\n		\"PREVIEW_TEXT_USE_HTML_EDITOR\" => \"N\",\n		\"PROPERTY_CODES\" => array(),\n		\"PROPERTY_CODES_REQUIRED\" => array(),\n		\"RESIZE_IMAGES\" => \"N\",\n		\"SEF_MODE\" => \"N\",\n		\"STATUS\" => \"ANY\",\n		\"STATUS_NEW\" => \"N\",\n		\"USER_MESSAGE_ADD\" => \"\",\n		\"USER_MESSAGE_EDIT\" => \"\",\n		\"USE_CAPTCHA\" => \"N\"\n	)\n);?><footer id=\"footer\"> <section>\n<form method=\"post\" action=\"#\">\n	<div class=\"field\">\n <label for=\"name\">Name</label> <input type=\"text\" name=\"name\" id=\"name\">\n	</div>\n	<div class=\"field\">\n <label for=\"email\">Email</label> <input type=\"text\" name=\"email\" id=\"email\">\n	</div>\n	<div class=\"field\">\n <label for=\"message\">Message</label> <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\n	</div>\n	<ul class=\"actions\">\n		<li><input type=\"submit\" value=\"Send Message\"></li>\n	</ul>\n</form>\n </section> <section class=\"split contact\"> <section class=\"alt\">\n<h3>Address</h3>\n<p>\n	 1234 Somewhere Road #87257<br>\n	 Nashville, TN 00000-0000\n</p>\n </section> <section>\n<h3>Phone</h3>\n<p>\n <a href=\"#\">(000) 000-0000</a>\n</p>\n </section> <section>\n<h3>Email</h3>\n<p>\n <a href=\"#\">info@untitled.tld</a>\n</p>\n </section> <section>\n<h3>Social</h3>\n<ul class=\"icons alt\">\n	<li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\n</ul>\n </section> </section> </footer><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513152477');
INSERT INTO `b_undo` VALUES ('1bf10427477f92dfcc485713d9d889cce', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7627:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150391');
INSERT INTO `b_undo` VALUES ('1dace0c2622982ac408b84331f4861923', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7626:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#\",\n			\"detail\" => \"#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150298');
INSERT INTO `b_undo` VALUES ('1ddb1ec7bd0cccc0b1375865e3e6f3fff', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7065:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><!-- Main --><br>\n <!-- Featured Post -->\n<div id=\"main\">\n <article class=\"post featured\">\n	<div class=\"major\">\n		 <?$APPLICATION->IncludeComponent(\n	\"bitrix:catalog.section.list\",\n	\".default\",\n	Array(\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"COUNT_ELEMENTS\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"SECTION_CODE\" => \"\",\n		\"SECTION_FIELDS\" => array(0=>\"\",1=>\"\",),\n		\"SECTION_ID\" => $_REQUEST[\"SECTION_ID\"],\n		\"SECTION_URL\" => \"/news/#SECTION_CODE_PATH#\",\n		\"SECTION_USER_FIELDS\" => array(0=>\"\",1=>\"\",),\n		\"SHOW_PARENT_NAME\" => \"Y\",\n		\"TOP_DEPTH\" => \"2\",\n		\"VIEW_MODE\" => \"LINE\"\n	)\n);?> <?$APPLICATION->IncludeComponent(\n	\"bitrix:news\",\n	\".default\",\n	Array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"LIST_PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => array(\"news\"=>\"\",\"section\"=>\"#SECTION_CODE_PATH#/\",\"detail\"=>\"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",),\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\"\n	)\n);?>\n<a href=\"#\"> <span class=\"date\">April 25, 2017</span> </a>\n		<h2><a href=\"#\"></a><a href=\"#\">And this is a<br>\n		 massive headline</a></h2>\n		<p>\n			 Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br>\n			 facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br>\n			 amet nullam sed etiam veroeros.\n		</p>\n	</div>\n <a href=\"#\" class=\"image main\"><img src=\"/bitrix/templates/bitrixproject/images/pic01.jpg\" alt=\"\"></a>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button big\">Full Story</a></li>\n	</ul>\n </article>\n	<!-- Posts --> <section class=\"posts\"> <article>\n	<div>\n <span class=\"date\">April 24, 2017</span>\n		<h2><a href=\"#\">Sed magna<br>\n		 ipsum faucibus</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic02.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 22, 2017</span>\n		<h2><a href=\"#\">Primis eget<br>\n		 imperdiet lorem</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic03.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 18, 2017</span>\n		<h2><a href=\"#\">Ante mattis<br>\n		 interdum dolor</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic04.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 14, 2017</span>\n		<h2><a href=\"#\">Tempus sed<br>\n		 nulla imperdiet</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic05.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 11, 2017</span>\n		<h2><a href=\"#\">Odio magna<br>\n		 sed consectetur</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic06.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> <article>\n	<div>\n <span class=\"date\">April 7, 2017</span>\n		<h2><a href=\"#\">Augue lorem<br>\n		 primis vestibulum</a></h2>\n	</div>\n <a href=\"#\" class=\"image fit\"><img src=\"/bitrix/templates/bitrixproject/images/pic07.jpg\" alt=\"\"></a>\n	<p>\n		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.\n	</p>\n	<ul class=\"actions\">\n		<li><a href=\"#\" class=\"button\">Full Story</a></li>\n	</ul>\n </article> </section> <footer>\n	<div class=\"pagination\">\n		 <!--<a href=\"#\" class=\"previous\">Prev</a>--> <a href=\"#\" class=\"page active\">1</a> <a href=\"#\" class=\"page\">2</a> <a href=\"#\" class=\"page\">3</a> <span class=\"extra\">…</span> <a href=\"#\" class=\"page\">8</a> <a href=\"#\" class=\"page\">9</a> <a href=\"#\" class=\"page\">10</a> <a href=\"#\" class=\"next\">Next</a>\n	</div>\n </footer>\n</div>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513153589');
INSERT INTO `b_undo` VALUES ('1e7016a157260e2a922eca83d80f19f03', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:8843:\"<?\r\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\r\n$APPLICATION->SetTitle(\"Новости\");\r\n?>\r\n\r\n    <!-- Main -->\r\n    <div id=\"main\">\r\n\r\n    <!-- Featured Post -->\r\n    <article class=\"post featured\">\r\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\r\n                \"bitrix:news\",\r\n                \"\",\r\n                Array(\r\n                    \"ADD_ELEMENT_CHAIN\" => \"N\",\r\n                    \"ADD_SECTIONS_CHAIN\" => \"Y\",\r\n                    \"AJAX_MODE\" => \"Y\",\r\n                    \"AJAX_OPTION_ADDITIONAL\" => \"\",\r\n                    \"AJAX_OPTION_HISTORY\" => \"N\",\r\n                    \"AJAX_OPTION_JUMP\" => \"N\",\r\n                    \"AJAX_OPTION_STYLE\" => \"Y\",\r\n                    \"BROWSER_TITLE\" => \"-\",\r\n                    \"CACHE_FILTER\" => \"N\",\r\n                    \"CACHE_GROUPS\" => \"Y\",\r\n                    \"CACHE_TIME\" => \"36000000\",\r\n                    \"CACHE_TYPE\" => \"A\",\r\n                    \"CHECK_DATES\" => \"Y\",\r\n                    \"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\r\n                    \"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\r\n                    \"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\r\n                    \"DETAIL_FIELD_CODE\" => array(\"\",\"\"),\r\n                    \"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\r\n                    \"DETAIL_PAGER_TEMPLATE\" => \"\",\r\n                    \"DETAIL_PAGER_TITLE\" => \"Страница\",\r\n                    \"DETAIL_PROPERTY_CODE\" => array(\"\",\"\"),\r\n                    \"DETAIL_SET_CANONICAL_URL\" => \"N\",\r\n                    \"DISPLAY_BOTTOM_PAGER\" => \"Y\",\r\n                    \"DISPLAY_DATE\" => \"Y\",\r\n                    \"DISPLAY_NAME\" => \"Y\",\r\n                    \"DISPLAY_PICTURE\" => \"Y\",\r\n                    \"DISPLAY_PREVIEW_TEXT\" => \"Y\",\r\n                    \"DISPLAY_TOP_PAGER\" => \"N\",\r\n                    \"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\r\n                    \"IBLOCK_ID\" => \"1\",\r\n                    \"IBLOCK_TYPE\" => \"Information\",\r\n                    \"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\r\n                    \"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\r\n                    \"LIST_FIELD_CODE\" => array(\"\",\"\"),\r\n                    \"LIST_PROPERTY_CODE\" => array(\"\",\"\"),\r\n                    \"MESSAGE_404\" => \"\",\r\n                    \"META_DESCRIPTION\" => \"-\",\r\n                    \"META_KEYWORDS\" => \"-\",\r\n                    \"NEWS_COUNT\" => \"20\",\r\n                    \"PAGER_BASE_LINK_ENABLE\" => \"N\",\r\n                    \"PAGER_DESC_NUMBERING\" => \"N\",\r\n                    \"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\r\n                    \"PAGER_SHOW_ALL\" => \"N\",\r\n                    \"PAGER_SHOW_ALWAYS\" => \"N\",\r\n                    \"PAGER_TEMPLATE\" => \".default\",\r\n                    \"PAGER_TITLE\" => \"Новости\",\r\n                    \"PREVIEW_TRUNCATE_LEN\" => \"\",\r\n                    \"SEF_MODE\" => \"N\",\r\n                    \"SET_LAST_MODIFIED\" => \"N\",\r\n                    \"SET_STATUS_404\" => \"N\",\r\n                    \"SET_TITLE\" => \"Y\",\r\n                    \"SHOW_404\" => \"N\",\r\n                    \"SORT_BY1\" => \"ACTIVE_FROM\",\r\n                    \"SORT_BY2\" => \"SORT\",\r\n                    \"SORT_ORDER1\" => \"DESC\",\r\n                    \"SORT_ORDER2\" => \"ASC\",\r\n                    \"STRICT_SECTION_CHECK\" => \"N\",\r\n                    \"USE_CATEGORIES\" => \"N\",\r\n                    \"USE_FILTER\" => \"N\",\r\n                    \"USE_PERMISSIONS\" => \"N\",\r\n                    \"USE_RATING\" => \"N\",\r\n                    \"USE_RSS\" => \"N\",\r\n                    \"USE_SEARCH\" => \"N\",\r\n                    \"USE_SHARE\" => \"N\",\r\n                    \"VARIABLE_ALIASES\" => Array(\"ELEMENT_ID\"=>\"ELEMENT_ID\",\"SECTION_ID\"=>\"SECTION_ID\")\r\n                )\r\n            );?>\r\n            <a href=\"#\">\r\n            <span class=\"date\">April 25, 2017</span>\r\n            <h2><a href=\"#\">And this is a<br />\r\n                    massive headline</a></h2>\r\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\r\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\r\n                amet nullam sed etiam veroeros.</p>\r\n        </header>\r\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\r\n        <ul class=\"actions\">\r\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\r\n        </ul>\r\n    </article>\r\n\r\n    <!-- Posts -->\r\n    <section class=\"posts\">\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 24, 2017</span>\r\n                <h2><a href=\"#\">Sed magna<br />\r\n                        ipsum faucibus</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 22, 2017</span>\r\n                <h2><a href=\"#\">Primis eget<br />\r\n                        imperdiet lorem</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 18, 2017</span>\r\n                <h2><a href=\"#\">Ante mattis<br />\r\n                        interdum dolor</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 14, 2017</span>\r\n                <h2><a href=\"#\">Tempus sed<br />\r\n                        nulla imperdiet</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 11, 2017</span>\r\n                <h2><a href=\"#\">Odio magna<br />\r\n                        sed consectetur</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n        <article>\r\n            <header>\r\n                <span class=\"date\">April 7, 2017</span>\r\n                <h2><a href=\"#\">Augue lorem<br />\r\n                        primis vestibulum</a></h2>\r\n            </header>\r\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\r\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\r\n            <ul class=\"actions\">\r\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\r\n            </ul>\r\n        </article>\r\n    </section>\r\n\r\n    <footer>\r\n        <div class=\"pagination\">\r\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\r\n            <a href=\"#\" class=\"page active\">1</a>\r\n            <a href=\"#\" class=\"page\">2</a>\r\n            <a href=\"#\" class=\"page\">3</a>\r\n            <span class=\"extra\">&hellip;</span>\r\n            <a href=\"#\" class=\"page\">8</a>\r\n            <a href=\"#\" class=\"page\">9</a>\r\n            <a href=\"#\" class=\"page\">10</a>\r\n            <a href=\"#\" class=\"next\">Next</a>\r\n        </div>\r\n    </footer>\r\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513149402');
INSERT INTO `b_undo` VALUES ('1e9127fc2c76be4f23dbad537d1721024', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"C:/server/OSPanel/domains/localhost/bitrixproject/news/index.php\";s:7:\"content\";s:7647:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?>\n\n    <!-- Main -->\n    <div id=\"main\">\n\n    <!-- Featured Post -->\n    <article class=\"post featured\">\n        <header class=\"major\"><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"ADD_ELEMENT_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"Y\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PAGER_SHOW_ALL\" => \"Y\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"IBLOCK_ID\" => \"1\",\n		\"IBLOCK_TYPE\" => \"Information\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"N\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"MESSAGE_404\" => \"\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"NEWS_COUNT\" => \"3\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"modern\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_RSS\" => \"N\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_SHARE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"#SECTION_CODE_PATH#/\",\n			\"detail\" => \"#SECTION_CODE_PATH#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n);?>\n            <a href=\"#\">\n            <span class=\"date\">April 25, 2017</span>\n            <h2><a href=\"#\">And this is a<br />\n                    massive headline</a></h2>\n            <p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />\n                facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />\n                amet nullam sed etiam veroeros.</p>\n        </header>\n        <a href=\"#\" class=\"image main\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic01.jpg\" alt=\"\" /></a>\n        <ul class=\"actions\">\n            <li><a href=\"#\" class=\"button big\">Full Story</a></li>\n        </ul>\n    </article>\n\n    <!-- Posts -->\n    <section class=\"posts\">\n        <article>\n            <header>\n                <span class=\"date\">April 24, 2017</span>\n                <h2><a href=\"#\">Sed magna<br />\n                        ipsum faucibus</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic02.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 22, 2017</span>\n                <h2><a href=\"#\">Primis eget<br />\n                        imperdiet lorem</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic03.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 18, 2017</span>\n                <h2><a href=\"#\">Ante mattis<br />\n                        interdum dolor</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic04.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 14, 2017</span>\n                <h2><a href=\"#\">Tempus sed<br />\n                        nulla imperdiet</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic05.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 11, 2017</span>\n                <h2><a href=\"#\">Odio magna<br />\n                        sed consectetur</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic06.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n        <article>\n            <header>\n                <span class=\"date\">April 7, 2017</span>\n                <h2><a href=\"#\">Augue lorem<br />\n                        primis vestibulum</a></h2>\n            </header>\n            <a href=\"#\" class=\"image fit\"><img src=\"<?=SITE_TEMPLATE_PATH?>/images/pic07.jpg\" alt=\"\" /></a>\n            <p>Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.</p>\n            <ul class=\"actions\">\n                <li><a href=\"#\" class=\"button\">Full Story</a></li>\n            </ul>\n        </article>\n    </section>\n\n    <footer>\n        <div class=\"pagination\">\n            <!--<a href=\"#\" class=\"previous\">Prev</a>-->\n            <a href=\"#\" class=\"page active\">1</a>\n            <a href=\"#\" class=\"page\">2</a>\n            <a href=\"#\" class=\"page\">3</a>\n            <span class=\"extra\">&hellip;</span>\n            <a href=\"#\" class=\"page\">8</a>\n            <a href=\"#\" class=\"page\">9</a>\n            <a href=\"#\" class=\"page\">10</a>\n            <a href=\"#\" class=\"next\">Next</a>\n        </div>\n    </footer>\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513150744');
INSERT INTO `b_undo` VALUES ('1eea71f02629ca3e15fef2e8d651bda5a', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/feedback/index.php\";s:7:\"content\";s:1739:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Обратная связь\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"\",\n	Array(\n		\"EMAIL_TO\" => \"attim38@gmail.com\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n<!-- Footer --><footer id=\"footer\"> <section>\n<form method=\"post\" action=\"#\">\n	<div class=\"field\">\n <label for=\"name\">Name</label> <input type=\"text\" name=\"name\" id=\"name\">\n	</div>\n	<div class=\"field\">\n <label for=\"email\">Email</label> <input type=\"text\" name=\"email\" id=\"email\">\n	</div>\n	<div class=\"field\">\n <label for=\"message\">Message</label> <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\n	</div>\n	<ul class=\"actions\">\n		<li><input type=\"submit\" value=\"Send Message\"></li>\n	</ul>\n</form>\n </section> <section class=\"split contact\"> <section class=\"alt\">\n<h3>Address</h3>\n<p>\n	 1234 Somewhere Road #87257<br>\n	 Nashville, TN 00000-0000\n</p>\n </section> <section>\n<h3>Phone</h3>\n<p>\n <a href=\"#\">(000) 000-0000</a>\n</p>\n </section> <section>\n<h3>Email</h3>\n<p>\n <a href=\"#\">info@untitled.tld</a>\n</p>\n </section> <section>\n<h3>Social</h3>\n<ul class=\"icons alt\">\n	<li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\n</ul>\n </section> </section> </footer><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513151186');
INSERT INTO `b_undo` VALUES ('1fd156eb36ae429835b4aaf1ffa24162f', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:68:\"C:/server/OSPanel/domains/localhost/bitrixproject/feedback/index.php\";s:7:\"content\";s:1746:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Обратная связь\");\n?><br>\n <!-- Footer --><br>\n<footer id=\"footer\"> <section>\n<?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"\",\n	Array(\n		\"EMAIL_TO\" => \"attim38@gmail.com\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?>\n<form method=\"post\" action=\"#\">\n	<div class=\"field\">\n <label for=\"name\">Name</label> <input type=\"text\" name=\"name\" id=\"name\">\n	</div>\n	<div class=\"field\">\n <label for=\"email\">Email</label> <input type=\"text\" name=\"email\" id=\"email\">\n	</div>\n	<div class=\"field\">\n <label for=\"message\">Message</label> <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\n	</div>\n	<ul class=\"actions\">\n		<li><input type=\"submit\" value=\"Send Message\"></li>\n	</ul>\n</form>\n </section> <section class=\"split contact\"> <section class=\"alt\">\n<h3>Address</h3>\n<p>\n	 1234 Somewhere Road #87257<br>\n	 Nashville, TN 00000-0000\n</p>\n </section> <section>\n<h3>Phone</h3>\n<p>\n <a href=\"#\">(000) 000-0000</a>\n</p>\n </section> <section>\n<h3>Email</h3>\n<p>\n <a href=\"#\">info@untitled.tld</a>\n</p>\n </section> <section>\n<h3>Social</h3>\n<ul class=\"icons alt\">\n	<li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\n</ul>\n </section> </section> </footer><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', '1', '1513152339');
INSERT INTO `b_undo` VALUES ('256594bf3f505b1e1b7ffd886f523d7ce', 'main', 'autosave', 'CAutoSave::_Restore', 'a:11:{s:9:\"submitbtn\";s:0:\"\";s:4:\"mode\";s:6:\"public\";s:4:\"save\";s:1:\"Y\";s:4:\"site\";s:2:\"s1\";s:8:\"template\";s:0:\"\";s:10:\"templateID\";s:13:\"bitrixproject\";s:9:\"subdialog\";s:0:\"\";s:8:\"back_url\";s:24:\"/feedback/?clear_cache=Y\";s:5:\"title\";s:27:\"Обратная связь\";s:4:\"path\";s:19:\"/feedback/index.php\";s:11:\"filesrc_pub\";s:2537:\"<br>\n <!-- Footer --><?AddEventHandler(\'main\', \'OnBeforeEventSend\', array(\"FbackForm\", \"BeforeSend\"));\nclass FbackForm\n{\n   function BeforeSend($arFields, $arTemplate)\n   {\n      if ($arTemplate[\"ID\"]==7) //Если нужный шаблон\n      {\n         //подключаем модуль ИБ\n            if(CModule::IncludeModule(\"iblock\"))\n         {\n               $arElFields=array(\n                  \"IBLOCK_ID\" => 2, //Нужный ИБ\n                  \"IBLOCK_SECTION_ID\" => 28, //Нужный раздел\n                  \"NAME\" => $arFields[\"AUTHOR\"], //Название элемента\n                  \"DETAIL_TEXT\" => $arFields[\"TEXT\"], //Текст отзыва или любое бла-бла\n                  \"PROPERTY_VALUES\" => array( //Пользовательские поля, обязательно перечислять все, даже те, что просто будут пустые\n                     \"FB_EMAIL\" => $arFields[\"AUTHOR_EMAIL\"],\n                     \"FB_MARK\" => \"\",\n                     \"FB_THEME\" => \"\",\n                  ),\n               );\n               $oElement = new CIBlockElement();\n               $idElement = $oElement->Add($arElFields, false, false, false);\n         }\n      }\n      return false;\n   }\n} ?><footer id=\"footer\"> <section>\n<form method=\"post\" action=\"#\">\n	<div class=\"field\">\n <label for=\"name\">Name</label> <input type=\"text\" name=\"name\" id=\"name\">\n	</div>\n	<div class=\"field\">\n <label for=\"email\">Email</label> <input type=\"text\" name=\"email\" id=\"email\">\n	</div>\n	<div class=\"field\">\n <label for=\"message\">Message</label> <textarea name=\"message\" id=\"message\" rows=\"3\"></textarea>\n	</div>\n	<ul class=\"actions\">\n		<li><input type=\"submit\" value=\"Send Message\"></li>\n	</ul>\n</form>\n </section> <section class=\"split contact\"> <section class=\"alt\">\n<h3>Address</h3>\n<p>\n	 1234 Somewhere Road #87257<br>\n	 Nashville, TN 00000-0000\n</p>\n </section> <section>\n<h3>Phone</h3>\n<p>\n <a href=\"#\">(000) 000-0000</a>\n</p>\n </section> <section>\n<h3>Email</h3>\n<p>\n <a href=\"#\">info@untitled.tld</a>\n</p>\n </section> <section>\n<h3>Social</h3>\n<ul class=\"icons alt\">\n	<li><a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n	<li><a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a></li>\n</ul>\n </section> </section> </footer>\";}', '1', '1513152536');

-- ----------------------------
-- Table structure for b_urlpreview_metadata
-- ----------------------------
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_urlpreview_metadata
-- ----------------------------

-- ----------------------------
-- Table structure for b_urlpreview_route
-- ----------------------------
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_urlpreview_route
-- ----------------------------

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES ('1', null, 'acid7beast', 'YC2JRPOk136aae4333b39ac50c48bb18e45f9080', 'qfAYmKrQ381fd5d5f86b4527bdbe48bb51271134', 'Y', 'Антон', 'Тимофеенко', 'attim38@gmail.com', '2017-12-14 03:21:18', '2017-12-12 17:46:35', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-12 17:46:35', null, null, '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for b_user_access
-- ----------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_access
-- ----------------------------
INSERT INTO `b_user_access` VALUES ('0', 'group', 'G2');
INSERT INTO `b_user_access` VALUES ('1', 'group', 'G1');
INSERT INTO `b_user_access` VALUES ('1', 'group', 'G3');
INSERT INTO `b_user_access` VALUES ('1', 'group', 'G4');
INSERT INTO `b_user_access` VALUES ('1', 'group', 'G2');
INSERT INTO `b_user_access` VALUES ('1', 'user', 'U1');

-- ----------------------------
-- Table structure for b_user_access_check
-- ----------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_access_check
-- ----------------------------
INSERT INTO `b_user_access_check` VALUES ('1', 'group');
INSERT INTO `b_user_access_check` VALUES ('1', 'user');

-- ----------------------------
-- Table structure for b_user_counter
-- ----------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_counter
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_digest
-- ----------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_digest
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_field
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_field
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_field_confirm
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_field_confirm
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_field_enum
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_field_enum
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_field_lang
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_field_lang
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_group
-- ----------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_group
-- ----------------------------
INSERT INTO `b_user_group` VALUES ('1', '1', null, null);
INSERT INTO `b_user_group` VALUES ('1', '3', null, null);
INSERT INTO `b_user_group` VALUES ('1', '4', null, null);

-- ----------------------------
-- Table structure for b_user_hit_auth
-- ----------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_hit_auth
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_option
-- ----------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_option
-- ----------------------------
INSERT INTO `b_user_option` VALUES ('1', '0', 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y');
INSERT INTO `b_user_option` VALUES ('2', '1', 'admin_panel', 'settings', 'a:1:{s:4:\"edit\";s:2:\"on\";}', 'N');
INSERT INTO `b_user_option` VALUES ('3', '1', 'hot_keys', 'user_defined', 'b:1;', 'N');
INSERT INTO `b_user_option` VALUES ('4', '1', 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N');
INSERT INTO `b_user_option` VALUES ('5', '1', 'main', 'helper_hero_admin', 'a:1:{s:4:\"time\";s:10:\"1513153478\";}', 'N');
INSERT INTO `b_user_option` VALUES ('7', '1', 'socialservices', 'networkPopup', 'a:1:{s:9:\"showcount\";s:1:\"4\";}', 'N');
INSERT INTO `b_user_option` VALUES ('9', '1', 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:176:\"menu_util,backup,menu_iblock_%2FInformation%2F1,iblock_redirect,menu_iblock,menu_highloadblock,menu_iblock_/Information,menu_fileman,menu_fileman_site_s1_,menu_system,menu_site\";}', 'N');
INSERT INTO `b_user_option` VALUES ('17', '1', 'fileman', 'last_pathes', 's:56:\"a:3:{i:0;s:5:\"/auth\";i:1;s:5:\"/news\";i:2;s:7:\"/bitrix\";}\";', 'N');
INSERT INTO `b_user_option` VALUES ('27', '1', 'html_editor', 'user_settings_', 'a:10:{s:14:\"split_vertical\";s:1:\"0\";s:4:\"view\";s:5:\"split\";s:17:\"clean_empty_spans\";s:1:\"Y\";s:18:\"paste_clear_colors\";s:1:\"Y\";s:19:\"paste_clear_borders\";s:1:\"Y\";s:17:\"paste_clear_decor\";s:1:\"Y\";s:23:\"paste_clear_table_dimen\";s:1:\"Y\";s:13:\"show_snippets\";s:1:\"Y\";s:13:\"taskbar_shown\";s:1:\"1\";s:13:\"taskbar_width\";s:3:\"248\";}', 'N');
INSERT INTO `b_user_option` VALUES ('28', '1', 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N');
INSERT INTO `b_user_option` VALUES ('43', '1', 'main', 'fileinput', 'a:1:{s:4:\"mode\";s:9:\"mode-pict\";}', 'N');
INSERT INTO `b_user_option` VALUES ('46', '1', 'bx.windowmanager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:\"width\";s:4:\"1141\";s:6:\"height\";s:3:\"532\";}', 'N');

-- ----------------------------
-- Table structure for b_user_stored_auth
-- ----------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of b_user_stored_auth
-- ----------------------------
INSERT INTO `b_user_stored_auth` VALUES ('1', '1', '2017-12-12 17:46:35', '2017-12-13 00:31:34', '331e414654ae4104c0a06d7345397a52', 'N', '2130706433');
INSERT INTO `b_user_stored_auth` VALUES ('2', '1', '2017-12-13 13:20:34', '2017-12-14 03:21:18', '8699b91d7a0d18cd4f52c10b8a70a2cb', 'N', '2130706433');
SET FOREIGN_KEY_CHECKS=1;
