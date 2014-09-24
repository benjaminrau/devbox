-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 24. Sep 2014 um 18:35
-- Server Version: 1.0.13
-- PHP-Version: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `dev_typo3`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
CREATE TABLE IF NOT EXISTS `backend_layout` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(255) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`description` text NOT NULL,
	`config` text NOT NULL,
	`icon` text NOT NULL,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
CREATE TABLE IF NOT EXISTS `be_groups` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(50) NOT NULL DEFAULT '',
	`non_exclude_fields` text,
	`explicit_allowdeny` text,
	`allowed_languages` varchar(255) NOT NULL DEFAULT '',
	`custom_options` text,
	`db_mountpoints` text,
	`pagetypes_select` varchar(255) NOT NULL DEFAULT '',
	`tables_select` text,
	`tables_modify` text,
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`groupMods` text,
	`file_mountpoints` text,
	`file_permissions` text,
	`hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`description` text,
	`lockToDomain` varchar(50) NOT NULL DEFAULT '',
	`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`TSconfig` text,
	`subgroup` text,
	`hide_in_lists` tinyint(4) NOT NULL DEFAULT '0',
	`workspace_perms` tinyint(3) NOT NULL DEFAULT '1',
	`category_perms` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
CREATE TABLE IF NOT EXISTS `be_sessions` (
	`ses_id` varchar(32) NOT NULL DEFAULT '',
	`ses_name` varchar(32) NOT NULL DEFAULT '',
	`ses_iplock` varchar(39) NOT NULL DEFAULT '',
	`ses_hashlock` int(11) NOT NULL DEFAULT '0',
	`ses_userid` int(11) unsigned NOT NULL DEFAULT '0',
	`ses_tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`ses_data` longtext,
	`ses_backuserid` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ses_id`,`ses_name`),
	KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `be_users`
--

DROP TABLE IF EXISTS `be_users`;
CREATE TABLE IF NOT EXISTS `be_users` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`username` varchar(50) NOT NULL DEFAULT '',
	`password` varchar(100) NOT NULL DEFAULT '',
	`admin` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`usergroup` varchar(255) NOT NULL DEFAULT '',
	`disable` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`lang` char(2) NOT NULL DEFAULT '',
	`email` varchar(80) NOT NULL DEFAULT '',
	`db_mountpoints` text,
	`options` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`realName` varchar(80) NOT NULL DEFAULT '',
	`userMods` text,
	`allowed_languages` varchar(255) NOT NULL DEFAULT '',
	`uc` mediumtext,
	`file_mountpoints` text,
	`file_permissions` text,
	`workspace_perms` tinyint(3) NOT NULL DEFAULT '1',
	`lockToDomain` varchar(50) NOT NULL DEFAULT '',
	`disableIPlock` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`TSconfig` text,
	`lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
	`createdByAction` int(11) NOT NULL DEFAULT '0',
	`usergroup_cached_list` text,
	`workspace_id` int(11) NOT NULL DEFAULT '0',
	`workspace_preview` tinyint(3) NOT NULL DEFAULT '1',
	`category_perms` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `be_users`
--

INSERT INTO `be_users` (`uid`, `pid`, `tstamp`, `username`, `password`, `admin`, `usergroup`, `disable`, `starttime`, `endtime`, `lang`, `email`, `db_mountpoints`, `options`, `crdate`, `cruser_id`, `realName`, `userMods`, `allowed_languages`, `uc`, `file_mountpoints`, `file_permissions`, `workspace_perms`, `lockToDomain`, `disableIPlock`, `deleted`, `TSconfig`, `lastlogin`, `createdByAction`, `usergroup_cached_list`, `workspace_id`, `workspace_preview`, `category_perms`) VALUES
	(1, 0, 1411576343, 'admin', '$P$C4p3F96VMJr5PAZSgakuWYveINLx8P.', 1, '', 0, 0, 0, '', '', NULL, 0, 1411576343, 0, '', NULL, '', NULL, NULL, NULL, 1, '', 0, 0, NULL, 0, 0, NULL, 0, 1, ''),
	(2, 0, 1411576446, '_cli_lowlevel', '$P$CmCkiBIuur1yVP1frJrShRk.RHG9UI.', 1 '', 0, 0, 0, '', '', NULL, 0, 1411576446, 0, '', NULL, '', NULL, NULL, NULL, 1, '', 0, 0, NULL, 0, 0, NULL, 0, 1, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
CREATE TABLE IF NOT EXISTS `cache_imagesizes` (
	`md5hash` varchar(32) NOT NULL DEFAULT '',
	`md5filename` varchar(32) NOT NULL DEFAULT '',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`filename` varchar(255) NOT NULL DEFAULT '',
	`imagewidth` mediumint(11) unsigned NOT NULL DEFAULT '0',
	`imageheight` mediumint(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`md5filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache_md5params`
--

DROP TABLE IF EXISTS `cache_md5params`;
CREATE TABLE IF NOT EXISTS `cache_md5params` (
	`md5hash` varchar(20) NOT NULL DEFAULT '',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`type` tinyint(3) NOT NULL DEFAULT '0',
	`params` text,
	PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
CREATE TABLE IF NOT EXISTS `cache_treelist` (
	`md5hash` char(32) NOT NULL DEFAULT '',
	`pid` int(11) NOT NULL DEFAULT '0',
	`treelist` text,
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache_typo3temp_log`
--

DROP TABLE IF EXISTS `cache_typo3temp_log`;
CREATE TABLE IF NOT EXISTS `cache_typo3temp_log` (
	`md5hash` varchar(32) NOT NULL DEFAULT '',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`filename` varchar(255) NOT NULL DEFAULT '',
	`orig_filename` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_hash`
--

DROP TABLE IF EXISTS `cf_cache_hash`;
CREATE TABLE IF NOT EXISTS `cf_cache_hash` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_hash_tags`
--

DROP TABLE IF EXISTS `cf_cache_hash_tags`;
CREATE TABLE IF NOT EXISTS `cf_cache_hash_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_pages`
--

DROP TABLE IF EXISTS `cf_cache_pages`;
CREATE TABLE IF NOT EXISTS `cf_cache_pages` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_pagesection`
--

DROP TABLE IF EXISTS `cf_cache_pagesection`;
CREATE TABLE IF NOT EXISTS `cf_cache_pagesection` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cf_cache_pagesection_tags`;
CREATE TABLE IF NOT EXISTS `cf_cache_pagesection_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_pages_tags`
--

DROP TABLE IF EXISTS `cf_cache_pages_tags`;
CREATE TABLE IF NOT EXISTS `cf_cache_pages_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_rootline`
--

DROP TABLE IF EXISTS `cf_cache_rootline`;
CREATE TABLE IF NOT EXISTS `cf_cache_rootline` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_cache_rootline_tags`
--

DROP TABLE IF EXISTS `cf_cache_rootline_tags`;
CREATE TABLE IF NOT EXISTS `cf_cache_rootline_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_datamapfactory_datamap`
--

DROP TABLE IF EXISTS `cf_extbase_datamapfactory_datamap`;
CREATE TABLE IF NOT EXISTS `cf_extbase_datamapfactory_datamap` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_datamapfactory_datamap_tags`
--

DROP TABLE IF EXISTS `cf_extbase_datamapfactory_datamap_tags`;
CREATE TABLE IF NOT EXISTS `cf_extbase_datamapfactory_datamap_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_object`
--

DROP TABLE IF EXISTS `cf_extbase_object`;
CREATE TABLE IF NOT EXISTS `cf_extbase_object` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_object_tags`
--

DROP TABLE IF EXISTS `cf_extbase_object_tags`;
CREATE TABLE IF NOT EXISTS `cf_extbase_object_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_reflection`
--

DROP TABLE IF EXISTS `cf_extbase_reflection`;
CREATE TABLE IF NOT EXISTS `cf_extbase_reflection` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_reflection_tags`
--

DROP TABLE IF EXISTS `cf_extbase_reflection_tags`;
CREATE TABLE IF NOT EXISTS `cf_extbase_reflection_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_typo3dbbackend_queries`
--

DROP TABLE IF EXISTS `cf_extbase_typo3dbbackend_queries`;
CREATE TABLE IF NOT EXISTS `cf_extbase_typo3dbbackend_queries` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_typo3dbbackend_queries_tags`
--

DROP TABLE IF EXISTS `cf_extbase_typo3dbbackend_queries_tags`;
CREATE TABLE IF NOT EXISTS `cf_extbase_typo3dbbackend_queries_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_typo3dbbackend_tablecolumns`
--

DROP TABLE IF EXISTS `cf_extbase_typo3dbbackend_tablecolumns`;
CREATE TABLE IF NOT EXISTS `cf_extbase_typo3dbbackend_tablecolumns` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`expires` int(11) unsigned NOT NULL DEFAULT '0',
	`content` mediumblob,
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cf_extbase_typo3dbbackend_tablecolumns_tags`
--

DROP TABLE IF EXISTS `cf_extbase_typo3dbbackend_tablecolumns_tags`;
CREATE TABLE IF NOT EXISTS `cf_extbase_typo3dbbackend_tablecolumns_tags` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`identifier` varchar(250) NOT NULL DEFAULT '',
	`tag` varchar(250) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `cache_id` (`identifier`),
	KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
CREATE TABLE IF NOT EXISTS `fe_groups` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(50) NOT NULL DEFAULT '',
	`hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`lockToDomain` varchar(50) NOT NULL DEFAULT '',
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`description` text NOT NULL,
	`subgroup` tinytext NOT NULL,
	`TSconfig` text NOT NULL,
	`tx_extbase_type` varchar(255) NOT NULL DEFAULT '0',
	`felogin_redirectPid` tinytext,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
CREATE TABLE IF NOT EXISTS `fe_sessions` (
	`ses_id` varchar(32) NOT NULL DEFAULT '',
	`ses_name` varchar(32) NOT NULL DEFAULT '',
	`ses_iplock` varchar(39) NOT NULL DEFAULT '',
	`ses_hashlock` int(11) NOT NULL DEFAULT '0',
	`ses_userid` int(11) unsigned NOT NULL DEFAULT '0',
	`ses_tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`ses_data` blob,
	`ses_permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`ses_id`,`ses_name`),
	KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fe_session_data`
--

DROP TABLE IF EXISTS `fe_session_data`;
CREATE TABLE IF NOT EXISTS `fe_session_data` (
	`hash` varchar(32) NOT NULL DEFAULT '',
	`content` mediumblob,
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`hash`),
	KEY `tstamp` (`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
CREATE TABLE IF NOT EXISTS `fe_users` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`username` varchar(50) NOT NULL DEFAULT '',
	`password` varchar(100) NOT NULL DEFAULT '',
	`usergroup` tinytext,
	`disable` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`name` varchar(80) NOT NULL DEFAULT '',
	`first_name` varchar(50) NOT NULL DEFAULT '',
	`middle_name` varchar(50) NOT NULL DEFAULT '',
	`last_name` varchar(50) NOT NULL DEFAULT '',
	`address` varchar(255) NOT NULL DEFAULT '',
	`telephone` varchar(20) NOT NULL DEFAULT '',
	`fax` varchar(20) NOT NULL DEFAULT '',
	`email` varchar(80) NOT NULL DEFAULT '',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`lockToDomain` varchar(50) NOT NULL DEFAULT '',
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`uc` blob,
	`title` varchar(40) NOT NULL DEFAULT '',
	`zip` varchar(10) NOT NULL DEFAULT '',
	`city` varchar(50) NOT NULL DEFAULT '',
	`country` varchar(40) NOT NULL DEFAULT '',
	`www` varchar(80) NOT NULL DEFAULT '',
	`company` varchar(80) NOT NULL DEFAULT '',
	`image` tinytext,
	`TSconfig` text,
	`fe_cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
	`lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
	`is_online` int(10) unsigned NOT NULL DEFAULT '0',
	`tx_extbase_type` varchar(255) NOT NULL DEFAULT '0',
	`felogin_redirectPid` tinytext,
	`felogin_forgotHash` varchar(80) DEFAULT '',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`username`),
	KEY `username` (`username`),
	KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_config`
--

DROP TABLE IF EXISTS `index_config`;
CREATE TABLE IF NOT EXISTS `index_config` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`starttime` int(11) NOT NULL DEFAULT '0',
	`set_id` int(11) NOT NULL DEFAULT '0',
	`session_data` mediumtext,
	`title` varchar(255) NOT NULL DEFAULT '',
	`description` text,
	`type` varchar(30) NOT NULL DEFAULT '',
	`depth` int(11) unsigned NOT NULL DEFAULT '0',
	`table2index` varchar(255) NOT NULL DEFAULT '',
	`alternative_source_pid` int(11) unsigned NOT NULL DEFAULT '0',
	`get_params` varchar(255) NOT NULL DEFAULT '',
	`fieldlist` varchar(255) NOT NULL DEFAULT '',
	`externalUrl` varchar(255) NOT NULL DEFAULT '',
	`indexcfgs` text,
	`chashcalc` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`filepath` varchar(255) NOT NULL DEFAULT '',
	`extensions` varchar(255) NOT NULL DEFAULT '',
	`timer_next_indexing` int(11) NOT NULL DEFAULT '0',
	`timer_frequency` int(11) NOT NULL DEFAULT '0',
	`timer_offset` int(11) NOT NULL DEFAULT '0',
	`url_deny` text,
	`recordsbatch` int(11) NOT NULL DEFAULT '0',
	`records_indexonchange` tinyint(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_debug`
--

DROP TABLE IF EXISTS `index_debug`;
CREATE TABLE IF NOT EXISTS `index_debug` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`debuginfo` mediumtext,
	PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_fulltext`
--

DROP TABLE IF EXISTS `index_fulltext`;
CREATE TABLE IF NOT EXISTS `index_fulltext` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`fulltextdata` mediumtext,
	`metaphonedata` mediumtext NOT NULL,
	PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_grlist`
--

DROP TABLE IF EXISTS `index_grlist`;
CREATE TABLE IF NOT EXISTS `index_grlist` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`phash_x` int(11) NOT NULL DEFAULT '0',
	`hash_gr_list` int(11) NOT NULL DEFAULT '0',
	`gr_list` varchar(255) NOT NULL DEFAULT '',
	`uniqid` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`uniqid`),
	KEY `joinkey` (`phash`,`hash_gr_list`),
	KEY `phash_grouping` (`phash_x`,`hash_gr_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_phash`
--

DROP TABLE IF EXISTS `index_phash`;
CREATE TABLE IF NOT EXISTS `index_phash` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`phash_grouping` int(11) NOT NULL DEFAULT '0',
	`cHashParams` blob,
	`data_filename` varchar(255) NOT NULL DEFAULT '',
	`data_page_id` int(11) unsigned NOT NULL DEFAULT '0',
	`data_page_reg1` int(11) unsigned NOT NULL DEFAULT '0',
	`data_page_type` int(11) unsigned NOT NULL DEFAULT '0',
	`data_page_mp` varchar(255) NOT NULL DEFAULT '',
	`gr_list` varchar(255) NOT NULL DEFAULT '',
	`item_type` varchar(5) NOT NULL DEFAULT '',
	`item_title` varchar(255) NOT NULL DEFAULT '',
	`item_description` varchar(255) NOT NULL DEFAULT '',
	`item_mtime` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`item_size` int(11) NOT NULL DEFAULT '0',
	`contentHash` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`parsetime` int(11) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`item_crdate` int(11) NOT NULL DEFAULT '0',
	`externalUrl` tinyint(3) NOT NULL DEFAULT '0',
	`recordUid` int(11) NOT NULL DEFAULT '0',
	`freeIndexUid` int(11) NOT NULL DEFAULT '0',
	`freeIndexSetId` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`phash`),
	KEY `phash_grouping` (`phash_grouping`),
	KEY `freeIndexUid` (`freeIndexUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_rel`
--

DROP TABLE IF EXISTS `index_rel`;
CREATE TABLE IF NOT EXISTS `index_rel` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`wid` int(11) NOT NULL DEFAULT '0',
	`count` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`first` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`freq` smallint(5) unsigned NOT NULL DEFAULT '0',
	`flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`phash`,`wid`),
	KEY `wid` (`wid`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_section`
--

DROP TABLE IF EXISTS `index_section`;
CREATE TABLE IF NOT EXISTS `index_section` (
	`phash` int(11) NOT NULL DEFAULT '0',
	`phash_t3` int(11) NOT NULL DEFAULT '0',
	`rl0` int(11) unsigned NOT NULL DEFAULT '0',
	`rl1` int(11) unsigned NOT NULL DEFAULT '0',
	`rl2` int(11) unsigned NOT NULL DEFAULT '0',
	`page_id` int(11) NOT NULL DEFAULT '0',
	`uniqid` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`uniqid`),
	KEY `joinkey` (`phash`,`rl0`),
	KEY `page_id` (`page_id`),
	KEY `rl0` (`rl0`,`rl1`,`phash`),
	KEY `rl0_2` (`rl0`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_stat_search`
--

DROP TABLE IF EXISTS `index_stat_search`;
CREATE TABLE IF NOT EXISTS `index_stat_search` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`searchstring` varchar(255) NOT NULL DEFAULT '',
	`searchoptions` blob,
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`feuser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`cookie` varchar(10) NOT NULL DEFAULT '',
	`IP` varchar(255) NOT NULL DEFAULT '',
	`hits` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_stat_word`
--

DROP TABLE IF EXISTS `index_stat_word`;
CREATE TABLE IF NOT EXISTS `index_stat_word` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`word` varchar(30) NOT NULL DEFAULT '',
	`index_stat_search_id` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`pageid` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `tstamp` (`tstamp`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `index_words`
--

DROP TABLE IF EXISTS `index_words`;
CREATE TABLE IF NOT EXISTS `index_words` (
	`wid` int(11) NOT NULL DEFAULT '0',
	`baseword` varchar(60) NOT NULL DEFAULT '',
	`metaphone` int(11) NOT NULL DEFAULT '0',
	`is_stopword` tinyint(3) NOT NULL DEFAULT '0',
	PRIMARY KEY (`wid`),
	KEY `baseword` (`baseword`,`wid`),
	KEY `metaphone` (`metaphone`,`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(255) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`perms_userid` int(11) unsigned NOT NULL DEFAULT '0',
	`perms_groupid` int(11) unsigned NOT NULL DEFAULT '0',
	`perms_user` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`perms_group` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`perms_everybody` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`editlock` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`doktype` int(11) unsigned NOT NULL DEFAULT '0',
	`TSconfig` text,
	`storage_pid` int(11) NOT NULL DEFAULT '0',
	`is_siteroot` tinyint(4) NOT NULL DEFAULT '0',
	`php_tree_stop` tinyint(4) NOT NULL DEFAULT '0',
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
	`url` varchar(255) NOT NULL DEFAULT '',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`urltype` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`shortcut` int(10) unsigned NOT NULL DEFAULT '0',
	`shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
	`no_cache` int(10) unsigned NOT NULL DEFAULT '0',
	`fe_group` varchar(100) NOT NULL DEFAULT '0',
	`subtitle` varchar(255) NOT NULL DEFAULT '',
	`layout` int(11) unsigned NOT NULL DEFAULT '0',
	`url_scheme` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`target` varchar(80) NOT NULL DEFAULT '',
	`media` text,
	`lastUpdated` int(10) unsigned NOT NULL DEFAULT '0',
	`keywords` text,
	`cache_timeout` int(10) unsigned NOT NULL DEFAULT '0',
	`cache_tags` varchar(255) NOT NULL DEFAULT '',
	`newUntil` int(10) unsigned NOT NULL DEFAULT '0',
	`description` text,
	`no_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT '0',
	`abstract` text,
	`module` varchar(10) NOT NULL DEFAULT '',
	`extendToSubpages` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`author` varchar(255) NOT NULL DEFAULT '',
	`author_email` varchar(80) NOT NULL DEFAULT '',
	`nav_title` varchar(255) NOT NULL DEFAULT '',
	`nav_hide` tinyint(4) NOT NULL DEFAULT '0',
	`content_from_pid` int(10) unsigned NOT NULL DEFAULT '0',
	`mount_pid` int(10) unsigned NOT NULL DEFAULT '0',
	`mount_pid_ol` tinyint(4) NOT NULL DEFAULT '0',
	`alias` varchar(32) NOT NULL DEFAULT '',
	`l18n_cfg` tinyint(4) NOT NULL DEFAULT '0',
	`fe_login_mode` tinyint(4) NOT NULL DEFAULT '0',
	`backend_layout` varchar(64) NOT NULL DEFAULT '',
	`backend_layout_next_level` varchar(64) NOT NULL DEFAULT '',
	`categories` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `parent` (`pid`,`deleted`,`sorting`),
	KEY `alias` (`alias`),
	KEY `determineSiteRoot` (`deleted`,`hidden`,`is_siteroot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pages_language_overlay`
--

DROP TABLE IF EXISTS `pages_language_overlay`;
CREATE TABLE IF NOT EXISTS `pages_language_overlay` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`doktype` int(11) unsigned NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(255) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`subtitle` varchar(255) NOT NULL DEFAULT '',
	`nav_title` varchar(255) NOT NULL DEFAULT '',
	`media` text,
	`keywords` text,
	`description` text,
	`abstract` text,
	`author` varchar(255) NOT NULL DEFAULT '',
	`author_email` varchar(80) NOT NULL DEFAULT '',
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
	`l18n_diffsource` mediumblob,
	`url` varchar(255) NOT NULL DEFAULT '',
	`urltype` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`shortcut` int(10) unsigned NOT NULL DEFAULT '0',
	`shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `parent` (`pid`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
CREATE TABLE IF NOT EXISTS `sys_be_shortcuts` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`userid` int(11) unsigned NOT NULL DEFAULT '0',
	`module_name` varchar(255) NOT NULL DEFAULT '',
	`url` text,
	`description` varchar(255) NOT NULL DEFAULT '',
	`sorting` int(11) NOT NULL DEFAULT '0',
	`sc_group` tinyint(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE IF NOT EXISTS `sys_category` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(30) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`l10n_parent` int(11) NOT NULL DEFAULT '0',
	`l10n_diffsource` mediumblob NOT NULL,
	`title` tinytext NOT NULL,
	`description` text NOT NULL,
	`parent` int(11) NOT NULL DEFAULT '0',
	`items` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `category_parent` (`parent`),
	KEY `category_list` (`pid`,`deleted`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
CREATE TABLE IF NOT EXISTS `sys_category_record_mm` (
	`uid_local` int(11) NOT NULL DEFAULT '0',
	`uid_foreign` int(11) NOT NULL DEFAULT '0',
	`tablenames` varchar(255) NOT NULL DEFAULT '',
	`fieldname` varchar(255) NOT NULL DEFAULT '',
	`sorting` int(11) NOT NULL DEFAULT '0',
	`sorting_foreign` int(11) NOT NULL DEFAULT '0',
	KEY `uid_local_foreign` (`uid_local`,`uid_foreign`),
	KEY `uid_foreign_tablenames` (`uid_foreign`,`tablenames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_collection`
--

DROP TABLE IF EXISTS `sys_collection`;
CREATE TABLE IF NOT EXISTS `sys_collection` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(30) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`l10n_parent` int(11) NOT NULL DEFAULT '0',
	`l10n_diffsource` mediumtext,
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`starttime` int(11) NOT NULL DEFAULT '0',
	`endtime` int(11) NOT NULL DEFAULT '0',
	`fe_group` int(11) NOT NULL DEFAULT '0',
	`title` tinytext,
	`description` text,
	`type` varchar(32) NOT NULL DEFAULT 'static',
	`table_name` tinytext,
	`items` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`deleted`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_collection_entries`
--

DROP TABLE IF EXISTS `sys_collection_entries`;
CREATE TABLE IF NOT EXISTS `sys_collection_entries` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`uid_local` int(11) NOT NULL DEFAULT '0',
	`uid_foreign` int(11) NOT NULL DEFAULT '0',
	`tablenames` varchar(64) NOT NULL DEFAULT '',
	`sorting` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `uid_local` (`uid_local`),
	KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_domain`
--

DROP TABLE IF EXISTS `sys_domain`;
CREATE TABLE IF NOT EXISTS `sys_domain` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`domainName` varchar(80) NOT NULL DEFAULT '',
	`redirectTo` varchar(255) NOT NULL DEFAULT '',
	`redirectHttpStatusCode` int(4) unsigned NOT NULL DEFAULT '301',
	`sorting` int(10) unsigned NOT NULL DEFAULT '0',
	`prepend_params` int(10) NOT NULL DEFAULT '0',
	`forced` tinyint(3) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `getSysDomain` (`redirectTo`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`last_indexed` int(11) NOT NULL DEFAULT '0',
	`missing` tinyint(4) NOT NULL DEFAULT '0',
	`storage` int(11) NOT NULL DEFAULT '0',
	`type` varchar(10) NOT NULL DEFAULT '',
	`metadata` int(11) NOT NULL DEFAULT '0',
	`identifier` text,
	`identifier_hash` varchar(40) NOT NULL DEFAULT '',
	`folder_hash` varchar(40) NOT NULL DEFAULT '',
	`extension` varchar(255) NOT NULL DEFAULT '',
	`mime_type` varchar(255) NOT NULL DEFAULT '',
	`name` tinytext,
	`sha1` tinytext,
	`size` bigint(20) unsigned NOT NULL DEFAULT '0',
	`creation_date` int(11) NOT NULL DEFAULT '0',
	`modification_date` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `sel01` (`storage`,`identifier_hash`),
	KEY `folder` (`storage`,`folder_hash`),
	KEY `tstamp` (`tstamp`),
	KEY `lastindex` (`last_indexed`),
	KEY `sha1` (`sha1`(40))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
CREATE TABLE IF NOT EXISTS `sys_filemounts` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(30) NOT NULL DEFAULT '',
	`path` varchar(120) NOT NULL DEFAULT '',
	`base` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
CREATE TABLE IF NOT EXISTS `sys_file_collection` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(30) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`l10n_parent` int(11) NOT NULL DEFAULT '0',
	`l10n_diffsource` mediumtext,
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`starttime` int(11) NOT NULL DEFAULT '0',
	`endtime` int(11) NOT NULL DEFAULT '0',
	`title` tinytext,
	`description` text,
	`type` varchar(30) NOT NULL DEFAULT 'static',
	`files` int(11) NOT NULL DEFAULT '0',
	`storage` int(11) NOT NULL DEFAULT '0',
	`folder` text NOT NULL,
	`category` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`deleted`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
CREATE TABLE IF NOT EXISTS `sys_file_metadata` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`l10n_parent` int(11) NOT NULL DEFAULT '0',
	`l10n_diffsource` mediumblob NOT NULL,
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(30) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`file` int(11) NOT NULL DEFAULT '0',
	`title` tinytext,
	`width` int(11) NOT NULL DEFAULT '0',
	`height` int(11) NOT NULL DEFAULT '0',
	`description` text,
	`alternative` text,
	`categories` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `file` (`file`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
CREATE TABLE IF NOT EXISTS `sys_file_processedfile` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`storage` int(11) NOT NULL DEFAULT '0',
	`original` int(11) NOT NULL DEFAULT '0',
	`identifier` varchar(512) NOT NULL DEFAULT '',
	`name` tinytext,
	`configuration` text,
	`configurationsha1` varchar(40) NOT NULL DEFAULT '',
	`originalfilesha1` varchar(40) NOT NULL DEFAULT '',
	`task_type` varchar(200) NOT NULL DEFAULT '',
	`checksum` varchar(255) NOT NULL DEFAULT '',
	`width` int(11) DEFAULT '0',
	`height` int(11) DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `combined_1` (`original`,`task_type`,`configurationsha1`),
	KEY `identifier` (`storage`,`identifier`(199))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
CREATE TABLE IF NOT EXISTS `sys_file_reference` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`sorting` int(10) NOT NULL DEFAULT '0',
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(30) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`l10n_parent` int(11) NOT NULL DEFAULT '0',
	`l10n_diffsource` mediumblob NOT NULL,
	`uid_local` int(11) NOT NULL DEFAULT '0',
	`uid_foreign` int(11) NOT NULL DEFAULT '0',
	`tablenames` varchar(64) NOT NULL DEFAULT '',
	`fieldname` varchar(64) NOT NULL DEFAULT '',
	`sorting_foreign` int(11) NOT NULL DEFAULT '0',
	`table_local` varchar(64) NOT NULL DEFAULT '',
	`title` tinytext,
	`description` text,
	`alternative` tinytext,
	`link` tinytext,
	`downloadname` tinytext,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`deleted`),
	KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
	KEY `deleted` (`deleted`),
	KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
CREATE TABLE IF NOT EXISTS `sys_file_storage` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`cruser_id` int(11) NOT NULL DEFAULT '0',
	`deleted` tinyint(4) NOT NULL DEFAULT '0',
	`hidden` tinyint(4) NOT NULL DEFAULT '0',
	`name` varchar(30) NOT NULL DEFAULT '',
	`description` text,
	`driver` tinytext,
	`configuration` text,
	`is_default` tinyint(4) NOT NULL DEFAULT '0',
	`is_browsable` tinyint(4) NOT NULL DEFAULT '0',
	`is_public` tinyint(4) NOT NULL DEFAULT '0',
	`is_writable` tinyint(4) NOT NULL DEFAULT '0',
	`is_online` tinyint(4) NOT NULL DEFAULT '1',
	`processingfolder` tinytext,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`,`deleted`),
	KEY `deleted_hidden` (`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
CREATE TABLE IF NOT EXISTS `sys_history` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`sys_log_uid` int(11) NOT NULL DEFAULT '0',
	`history_data` mediumtext,
	`fieldlist` text,
	`recuid` int(11) NOT NULL DEFAULT '0',
	`tablename` varchar(255) NOT NULL DEFAULT '',
	`tstamp` int(11) NOT NULL DEFAULT '0',
	`history_files` mediumtext,
	`snapshot` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `recordident_1` (`tablename`,`recuid`),
	KEY `recordident_2` (`tablename`,`tstamp`),
	KEY `sys_log_uid` (`sys_log_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
CREATE TABLE IF NOT EXISTS `sys_language` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`title` varchar(80) NOT NULL DEFAULT '',
	`flag` varchar(20) NOT NULL DEFAULT '',
	`static_lang_isocode` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
CREATE TABLE IF NOT EXISTS `sys_lockedrecords` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`userid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`record_table` varchar(255) NOT NULL DEFAULT '',
	`record_uid` int(11) NOT NULL DEFAULT '0',
	`record_pid` int(11) NOT NULL DEFAULT '0',
	`username` varchar(50) NOT NULL DEFAULT '',
	`feuserid` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE IF NOT EXISTS `sys_log` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`userid` int(11) unsigned NOT NULL DEFAULT '0',
	`action` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`recuid` int(11) unsigned NOT NULL DEFAULT '0',
	`tablename` varchar(255) NOT NULL DEFAULT '',
	`recpid` int(11) NOT NULL DEFAULT '0',
	`error` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`details` text NOT NULL,
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`type` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`details_nr` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`IP` varchar(39) NOT NULL DEFAULT '',
	`log_data` text,
	`event_pid` int(11) NOT NULL DEFAULT '-1',
	`workspace` int(11) NOT NULL DEFAULT '0',
	`NEWid` varchar(20) NOT NULL DEFAULT '',
	`request_id` varchar(13) NOT NULL DEFAULT '',
	`time_micro` float NOT NULL DEFAULT '0',
	`component` varchar(255) NOT NULL DEFAULT '',
	`level` tinyint(1) unsigned NOT NULL DEFAULT '0',
	`message` text,
	`data` text,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`),
	KEY `event` (`userid`,`event_pid`),
	KEY `recuidIdx` (`recuid`,`uid`),
	KEY `user_auth` (`type`,`action`,`tstamp`),
	KEY `request` (`request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `sys_log`
--

INSERT INTO `sys_log` (`uid`, `pid`, `userid`, `action`, `recuid`, `tablename`, `recpid`, `error`, `details`, `tstamp`, `type`, `details_nr`, `IP`, `log_data`, `event_pid`, `workspace`, `NEWid`, `request_id`, `time_micro`, `component`, `level`, `message`, `data`) VALUES
	(1, 0, 0, 0, 0, '', 0, 1, 'Core: Error handler (BE): PHP Warning: mysqli::real_connect(): Headers and client library minor version mismatch. Headers:50537 Library:100013 in /data/TYPO3.CMS/typo3/sysext/core/Classes/Database/DatabaseConnection.php line 1192', 1411576401, 5, 0, '192.168.56.1', NULL, -1, 0, '', '', 0, '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE IF NOT EXISTS `sys_news` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`content` mediumtext,
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
CREATE TABLE IF NOT EXISTS `sys_note` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser` int(11) unsigned NOT NULL DEFAULT '0',
	`subject` varchar(255) NOT NULL DEFAULT '',
	`message` text,
	`personal` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`category` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
CREATE TABLE IF NOT EXISTS `sys_refindex` (
	`hash` varchar(32) NOT NULL DEFAULT '',
	`tablename` varchar(255) NOT NULL DEFAULT '',
	`recuid` int(11) NOT NULL DEFAULT '0',
	`field` varchar(40) NOT NULL DEFAULT '',
	`flexpointer` varchar(255) NOT NULL DEFAULT '',
	`softref_key` varchar(30) NOT NULL DEFAULT '',
	`softref_id` varchar(40) NOT NULL DEFAULT '',
	`sorting` int(11) NOT NULL DEFAULT '0',
	`deleted` tinyint(1) NOT NULL DEFAULT '0',
	`workspace` int(11) NOT NULL DEFAULT '0',
	`ref_table` varchar(255) NOT NULL DEFAULT '',
	`ref_uid` int(11) NOT NULL DEFAULT '0',
	`ref_string` varchar(200) NOT NULL DEFAULT '',
	PRIMARY KEY (`hash`),
	KEY `lookup_rec` (`tablename`,`recuid`),
	KEY `lookup_uid` (`ref_table`,`ref_uid`),
	KEY `lookup_string` (`ref_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
CREATE TABLE IF NOT EXISTS `sys_registry` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`entry_namespace` varchar(128) NOT NULL DEFAULT '',
	`entry_key` varchar(128) NOT NULL DEFAULT '',
	`entry_value` blob,
	PRIMARY KEY (`uid`),
	UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE IF NOT EXISTS `sys_template` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(255) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`sitetitle` varchar(255) NOT NULL DEFAULT '',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`root` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`clear` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`include_static_file` text,
	`constants` text,
	`config` text,
	`nextLevel` varchar(5) NOT NULL DEFAULT '',
	`description` text,
	`basedOn` tinytext,
	`deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`includeStaticAfterBasedOn` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`static_file_mode` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `parent` (`pid`,`deleted`,`hidden`,`sorting`),
	KEY `roottemplate` (`deleted`,`hidden`,`root`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
CREATE TABLE IF NOT EXISTS `tt_content` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`t3ver_oid` int(11) NOT NULL DEFAULT '0',
	`t3ver_id` int(11) NOT NULL DEFAULT '0',
	`t3ver_wsid` int(11) NOT NULL DEFAULT '0',
	`t3ver_label` varchar(255) NOT NULL DEFAULT '',
	`t3ver_state` tinyint(4) NOT NULL DEFAULT '0',
	`t3ver_stage` int(11) NOT NULL DEFAULT '0',
	`t3ver_count` int(11) NOT NULL DEFAULT '0',
	`t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
	`t3ver_move_id` int(11) NOT NULL DEFAULT '0',
	`t3_origuid` int(11) NOT NULL DEFAULT '0',
	`tstamp` int(11) unsigned NOT NULL DEFAULT '0',
	`crdate` int(11) unsigned NOT NULL DEFAULT '0',
	`cruser_id` int(11) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`CType` varchar(255) NOT NULL DEFAULT '',
	`header` varchar(255) NOT NULL DEFAULT '',
	`header_position` varchar(6) NOT NULL DEFAULT '',
	`bodytext` mediumtext,
	`image` text,
	`imagewidth` mediumint(11) unsigned NOT NULL DEFAULT '0',
	`imageorient` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`imagecaption` text,
	`imagecols` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`imageborder` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`media` text,
	`layout` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`cols` int(11) unsigned NOT NULL DEFAULT '0',
	`records` text,
	`pages` tinytext,
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`colPos` int(11) unsigned NOT NULL DEFAULT '0',
	`subheader` varchar(255) NOT NULL DEFAULT '',
	`spaceBefore` smallint(5) unsigned NOT NULL DEFAULT '0',
	`spaceAfter` smallint(5) unsigned NOT NULL DEFAULT '0',
	`fe_group` varchar(100) NOT NULL DEFAULT '0',
	`header_link` varchar(255) NOT NULL DEFAULT '',
	`imagecaption_position` varchar(6) NOT NULL DEFAULT '',
	`image_link` text,
	`image_zoom` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`image_noRows` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`image_effects` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`image_compression` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`altText` text,
	`titleText` text,
	`longdescURL` text,
	`header_layout` varchar(30) NOT NULL DEFAULT '0',
	`menu_type` varchar(30) NOT NULL DEFAULT '0',
	`list_type` varchar(255) NOT NULL DEFAULT '0',
	`table_border` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`table_cellspacing` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`table_cellpadding` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`table_bgColor` int(11) unsigned NOT NULL DEFAULT '0',
	`select_key` varchar(80) NOT NULL DEFAULT '',
	`sectionIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`linkToTop` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`file_collections` text,
	`filelink_size` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`filelink_sorting` tinytext NOT NULL,
	`target` varchar(30) NOT NULL DEFAULT '',
	`section_frame` int(11) unsigned NOT NULL DEFAULT '0',
	`date` int(10) unsigned NOT NULL DEFAULT '0',
	`multimedia` tinytext,
	`image_frames` int(11) unsigned NOT NULL DEFAULT '0',
	`recursive` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`imageheight` mediumint(8) unsigned NOT NULL DEFAULT '0',
	`rte_enabled` tinyint(4) NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`tx_impexp_origuid` int(11) NOT NULL DEFAULT '0',
	`pi_flexform` mediumtext,
	`accessibility_title` varchar(30) NOT NULL DEFAULT '',
	`accessibility_bypass` tinyint(3) unsigned NOT NULL DEFAULT '0',
	`accessibility_bypass_text` varchar(30) NOT NULL DEFAULT '',
	`l18n_parent` int(11) NOT NULL DEFAULT '0',
	`l18n_diffsource` mediumblob,
	`selected_categories` text,
	`category_field` varchar(64) NOT NULL DEFAULT '',
	`categories` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
	KEY `parent` (`pid`,`sorting`),
	KEY `language` (`l18n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
CREATE TABLE IF NOT EXISTS `tx_extensionmanager_domain_model_extension` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`extension_key` varchar(60) NOT NULL DEFAULT '',
	`repository` int(11) unsigned NOT NULL DEFAULT '1',
	`version` varchar(10) NOT NULL DEFAULT '',
	`alldownloadcounter` int(11) unsigned NOT NULL DEFAULT '0',
	`downloadcounter` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(150) NOT NULL DEFAULT '',
	`description` mediumtext,
	`state` int(4) NOT NULL DEFAULT '0',
	`review_state` int(4) NOT NULL DEFAULT '0',
	`category` int(4) NOT NULL DEFAULT '0',
	`last_updated` int(11) unsigned NOT NULL DEFAULT '0',
	`serialized_dependencies` mediumtext,
	`author_name` varchar(100) NOT NULL DEFAULT '',
	`author_email` varchar(100) NOT NULL DEFAULT '',
	`ownerusername` varchar(50) NOT NULL DEFAULT '',
	`md5hash` varchar(35) NOT NULL DEFAULT '',
	`update_comment` mediumtext,
	`authorcompany` varchar(100) NOT NULL DEFAULT '',
	`integer_version` int(11) NOT NULL DEFAULT '0',
	`current_version` int(3) NOT NULL DEFAULT '0',
	`lastreviewedversion` int(3) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`repository`),
	KEY `index_extrepo` (`extension_key`,`repository`),
	KEY `index_versionrepo` (`integer_version`,`repository`),
	KEY `index_currentversions` (`current_version`,`review_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tx_extensionmanager_domain_model_repository`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_repository`;
CREATE TABLE IF NOT EXISTS `tx_extensionmanager_domain_model_repository` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`title` varchar(150) NOT NULL DEFAULT '',
	`description` mediumtext,
	`wsdl_url` varchar(100) NOT NULL DEFAULT '',
	`mirror_list_url` varchar(100) NOT NULL DEFAULT '',
	`last_update` int(11) unsigned NOT NULL DEFAULT '0',
	`extension_count` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `tx_extensionmanager_domain_model_repository`
--

INSERT INTO `tx_extensionmanager_domain_model_repository` (`uid`, `pid`, `title`, `description`, `wsdl_url`, `mirror_list_url`, `last_update`, `extension_count`) VALUES
	(1, 0, 'TYPO3.org Main Repository', 'Main repository on typo3.org. This repository has some mirrors configured which are available with the mirror url.', 'http://typo3.org/wsdl/tx_ter_wsdl.php', 'http://repositories.typo3.org/mirrors.xml.gz', 1346191200, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tx_impexp_presets`
--

DROP TABLE IF EXISTS `tx_impexp_presets`;
CREATE TABLE IF NOT EXISTS `tx_impexp_presets` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`user_uid` int(11) NOT NULL DEFAULT '0',
	`title` varchar(255) NOT NULL DEFAULT '',
	`public` tinyint(3) NOT NULL DEFAULT '0',
	`item_uid` int(11) NOT NULL DEFAULT '0',
	`preset_data` blob,
	PRIMARY KEY (`uid`),
	KEY `lookup` (`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tx_rsaauth_keys`
--

DROP TABLE IF EXISTS `tx_rsaauth_keys`;
CREATE TABLE IF NOT EXISTS `tx_rsaauth_keys` (
	`uid` int(11) NOT NULL AUTO_INCREMENT,
	`pid` int(11) NOT NULL DEFAULT '0',
	`crdate` int(11) NOT NULL DEFAULT '0',
	`key_value` text,
	PRIMARY KEY (`uid`),
	KEY `crdate` (`crdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tx_rtehtmlarea_acronym`
--

DROP TABLE IF EXISTS `tx_rtehtmlarea_acronym`;
CREATE TABLE IF NOT EXISTS `tx_rtehtmlarea_acronym` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`pid` int(11) unsigned NOT NULL DEFAULT '0',
	`deleted` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
	`starttime` int(11) unsigned NOT NULL DEFAULT '0',
	`endtime` int(11) unsigned NOT NULL DEFAULT '0',
	`sorting` int(11) unsigned NOT NULL DEFAULT '0',
	`sys_language_uid` int(11) NOT NULL DEFAULT '0',
	`type` tinyint(3) unsigned NOT NULL DEFAULT '1',
	`term` varchar(255) NOT NULL DEFAULT '',
	`acronym` varchar(255) NOT NULL DEFAULT '',
	`static_lang_isocode` int(11) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
