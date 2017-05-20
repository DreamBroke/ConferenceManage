/* 创建数据库 */
CREATE DATABASE IF NOT EXISTS `conferencemanage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `conferencemanage`;

/* 会议基础信息表 */
DROP TABLE IF EXISTS `conference`;
CREATE TABLE `conference` (
  `con_no` int(11) NOT NULL AUTO_INCREMENT,
  `con_name` varchar(32) NOT NULL,
  `con_host` varchar(32) DEFAULT NULL,
  `con_organizer` varchar(32) DEFAULT NULL,
  `con_co-organizer` varchar(32) DEFAULT NULL,
  `con_startdate` datetime NOT NULL,
  `con_enddate` datetime NOT NULL,
  `con_upstartdate` datetime NOT NULL,
  `con_upenddate` datetime NOT NULL,
  `con_address` text,
  `con_contents` text,
  `con_affair-linkman` int(11) DEFAULT NULL,
  `con_finance-linkman` int(11) DEFAULT NULL,
  `con_capital` text,
  `con_repast` text,
  `con_scopen` text,
  PRIMARY KEY (`con_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 日程表 */
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `sche_no` int(11) NOT NULL AUTO_INCREMENT,
  `sche_date` date NOT NULL,
  `sche_starttime` datetime NOT NULL,
  `sche_endtime` datetime NOT NULL,
  `sche_speaker` int(11) DEFAULT '0',
  `sche_content` text,
  `sche_address` text,
  `sche_category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sche_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 参会代表表 */
DROP TABLE IF EXISTS `representor`;
CREATE TABLE `representor` (
  `rep_no` int(11) NOT NULL AUTO_INCREMENT,
  `rep_username` varchar(20) NOT NULL,
  `rep_password` varchar(20) NOT NULL,
  `rep_name` varchar(20) NOT NULL,
  `rep_sex` varchar(2) NOT NULL,
  `rep_position` varchar(10) DEFAULT NULL,
  `rep_professional` int(11) DEFAULT NULL,
  `rep_taxpay` varchar(20) DEFAULT NULL,
  `rep_company` varchar(50) DEFAULT NULL,
  `rep_email` varchar(20) NOT NULL,
  `rep_tel` varchar(15) NOT NULL,
  `rep_country` varchar(20) DEFAULT NULL,
  `rep_province` varchar(20) DEFAULT NULL,
  `rep_city` varchar(20) DEFAULT NULL,
  `rep_postcode` varchar(10) DEFAULT NULL,
  `rep_qq` varchar(12) DEFAULT NULL,
  `rep_field` text,
  `rep_payment` decimal(10,2) DEFAULT '0.00',
  `rep_IDnumber` varchar(18) DEFAULT NULL,
  `rep_attend` tinyint(1) DEFAULT '0',
  `rep_isexpert` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rep_no`),
  UNIQUE KEY `rep_username_UNIQUE` (`rep_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/* 论文表 */
DROP TABLE IF EXISTS `dissertation`;
CREATE TABLE `dissertation` (
  `dis_no` int(11) NOT NULL AUTO_INCREMENT,
  `dis_title` varchar(30) NOT NULL,
  `dis_keyword` varchar(30) NOT NULL,
  `dis_abstract` text,
  `dis_realm` int(11) NOT NULL,
  `dis_author` int(11) NOT NULL,
  `dis_file` varchar(150) NOT NULL,
  `dis_condition` int(11) NOT NULL DEFAULT '1',
  `dis_approver` int(11) DEFAULT '0',
  `dis_uptime` datetime DEFAULT NULL,
  `dis_apptime` datetime DEFAULT NULL,
  PRIMARY KEY (`dis_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 论文状态表 */
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition` (
  `cond_no` int(11) NOT NULL AUTO_INCREMENT,
  `cond_name` varchar(10) NOT NULL,
  `cond_createtime` datetime DEFAULT NULL,
  `cond_modifytime` datetime DEFAULT NULL,
  `cond_createman` int(11) DEFAULT NULL,
  `cond_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`cond_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 论文领域表 */
DROP TABLE IF EXISTS `realm`;
CREATE TABLE `realm` (
  `rea_no` int(11) NOT NULL AUTO_INCREMENT,
  `rea_name` varchar(20) NOT NULL,
  `rea_father` int(11) DEFAULT '0',
  `rea_createtime` datetime DEFAULT NULL,
  `rea_modifytime` datetime DEFAULT NULL,
  `rea_createman` int(11) DEFAULT NULL,
  `rea_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`rea_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 工作人员（教师）表 */
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_no` int(11) NOT NULL AUTO_INCREMENT,
  `tea_username` varchar(15) NOT NULL,
  `tea_password` varchar(20) NOT NULL,
  `tea_name` varchar(20) NOT NULL,
  `tea_sex` varchar(2) NOT NULL,
  `tea_position` varchar(10) DEFAULT NULL,
  `tea_professional` int(11) DEFAULT NULL,
  `tea_email` varchar(20) DEFAULT NULL,
  `tea_tel` varchar(15) DEFAULT NULL,
  `tea_qq` varchar(12) DEFAULT NULL,
  `tea_scope` int(11) NOT NULL,
  `tea_realm` int(11) DEFAULT NULL,
  `tea_jurisdiction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tea_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 工作种类表 */
DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `sco_no` int(11) NOT NULL AUTO_INCREMENT,
  `sco_name` varchar(20) NOT NULL,
  `sco_brief` text,
  `sco_createtime` datetime DEFAULT NULL,
  `sco_modifytime` datetime DEFAULT NULL,
  `sco_createman` int(11) DEFAULT NULL,
  `sco_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`sco_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 职称表 */
DROP TABLE IF EXISTS `professional`;
CREATE TABLE `professional` (
  `pro_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(20) NOT NULL,
  `pro_createtime` datetime DEFAULT NULL,
  `pro_modifytime` datetime DEFAULT NULL,
  `pro_createman` int(11) DEFAULT NULL,
  `pro_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 员工权限表 */
DROP TABLE IF EXISTS `jurisdiction`;
CREATE TABLE `jurisdiction` (
  `jur_no` int(11) NOT NULL AUTO_INCREMENT,
  `jur_range` int(11) NOT NULL,
  `jur_instruction` text,
  `jur_createtime` datetime DEFAULT NULL,
  `jur_modifytime` datetime DEFAULT NULL,
  `jur_createman` int(11) DEFAULT NULL,
  `jur_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`jur_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 酒店表 */
CREATE TABLE `hotel` (
  `hot_no` int(11) NOT NULL AUTO_INCREMENT,
  `hot_name` varchar(30) NOT NULL,
  `hot_tel` varchar(15) NOT NULL,
  `hot_address` varchar(60) NOT NULL,
  `hot_capital` text,
  `hot_remarks` text,
  `hot_room` varchar(10) DEFAULT NULL,
  `hot_linkman` text,
  `hot_arrangement` text,
  `hot_lnglat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`hot_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/* 酒店预约表 */
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check` (
  `che_no` int(11) NOT NULL AUTO_INCREMENT,
  `che_method` int(11) NOT NULL,
  `che_account` varchar(30) NOT NULL,
  `che_money` decimal(10,2) NOT NULL,
  `che_time` datetime NOT NULL,
  `che_representor` int(11) NOT NULL,
  `che_teacher` int(11) NOT NULL,
  `che_room` int(11) NOT NULL,
  PRIMARY KEY (`che_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 支付手段表 */
DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `met_no` int(11) NOT NULL AUTO_INCREMENT,
  `met_name` varchar(20) NOT NULL,
  `met_brief` text NOT NULL,
  `met_createtime` datetime DEFAULT NULL,
  `met_modifytime` datetime DEFAULT NULL,
  `met_createman` int(11) DEFAULT NULL,
  `met_modifyman` int(11) DEFAULT NULL,
  PRIMARY KEY (`met_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 周边信息表 */
DROP TABLE IF EXISTS `related`;
CREATE TABLE `related` (
  `rel_no` int(11) NOT NULL AUTO_INCREMENT,
  `rel_name` varchar(30) NOT NULL,
  `rel_brief` text,
  `rel_photo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rel_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/* 论文作者表 */
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `aut_no` int(11) NOT NULL AUTO_INCREMENT,
  `aut_category` varchar(10) NOT NULL,
  `aut_name` varchar(30) NOT NULL,
  `aut_tel` varchar(11) DEFAULT NULL,
  `aut_email` varchar(30) DEFAULT NULL,
  `aut_company` varchar(30) DEFAULT NULL,
  `aut_dissertation` int(11) NOT NULL,
  PRIMARY KEY (`aut_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 论文审核表 */
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `rev_no` int(11) NOT NULL AUTO_INCREMENT,
  `rev_dissertation` int(11) NOT NULL,
  `rev_teacher` int(11) NOT NULL,
  `rev_condition` int(11) DEFAULT NULL,
  `rev_proposal` text,
  `rev_assigntime` datetime DEFAULT NULL,
  `rev_reviewtime` datetime DEFAULT NULL,
  PRIMARY KEY (`rev_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/* 房间类型表 */
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `roo_no` int(11) NOT NULL AUTO_INCREMENT,
  `roo_name` varchar(20) NOT NULL,
  `roo_description` text,
  `roo_available` int(11) DEFAULT '0',
  `roo_hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`roo_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_no` int(11) NOT NULL AUTO_INCREMENT,
  `bill_money` decimal(10,2) NOT NULL,
  `bill_detail` text NOT NULL,
  `bill_date` date NOT NULL,
  `bill_personnel` int(11) NOT NULL,
  PRIMARY KEY (`bill_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

