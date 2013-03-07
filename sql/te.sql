-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.12-beta-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema te
--

CREATE DATABASE IF NOT EXISTS te;
USE te;

--
-- Definition of table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) DEFAULT NULL COMMENT '应用名称',
  `status` int(10) unsigned DEFAULT NULL COMMENT '状态(0停用，1，启用)',
  `url` varchar(30) DEFAULT NULL COMMENT 'URL',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `description` varchar(100) DEFAULT NULL COMMENT '描述 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用表';

--
-- Dumping data for table `application`
--

/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;


--
-- Definition of table `bizcalendar`
--

DROP TABLE IF EXISTS `bizcalendar`;
CREATE TABLE `bizcalendar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `process` int(10) unsigned DEFAULT NULL COMMENT '流程名字',
  `node` int(10) unsigned DEFAULT NULL COMMENT '流程节点',
  `startDate` datetime DEFAULT NULL COMMENT '开始时间',
  `endDate` datetime DEFAULT NULL COMMENT '结束时间',
  `DateType` int(10) unsigned DEFAULT NULL COMMENT '1. 天\r\n2.	周3.	日\r\n1.天2.日3,周',
  `day` float DEFAULT NULL COMMENT '天',
  `month` float DEFAULT NULL COMMENT '月',
  `week` float DEFAULT NULL COMMENT '周',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批周期表';

--
-- Dumping data for table `bizcalendar`
--

/*!40000 ALTER TABLE `bizcalendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `bizcalendar` ENABLE KEYS */;


--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(15) DEFAULT NULL COMMENT '公司编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `remark` varchar(1000) DEFAULT NULL COMMENT '公司描述',
  `status` int(10) unsigned DEFAULT NULL COMMENT '状态\r\n0.	停用1.	启用\r\n状态\r\n0.	停用1.	启用\r\n状态\r\n0.	停用1.	启用\r\n状态(0停用，1启用)',
  `toSap` int(10) unsigned DEFAULT NULL COMMENT '是否导入SAP(0否 1 是)',
  `groupId` int(10) unsigned DEFAULT NULL COMMENT '集团ID',
  `icon` varchar(30) DEFAULT NULL COMMENT '公司图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `type` int(10) unsigned DEFAULT NULL COMMENT '类型(0.	合作伙伴1.	直接客户2.	Internal)',
  `code` varchar(20) DEFAULT NULL COMMENT '编号',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(15) DEFAULT NULL COMMENT '部门编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `employeeur`
--

DROP TABLE IF EXISTS `employeeur`;
CREATE TABLE `employeeur` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(10) unsigned DEFAULT NULL COMMENT '员工编号',
  `year` int(10) unsigned DEFAULT NULL COMMENT '年',
  `month` int(10) unsigned DEFAULT NULL COMMENT '月',
  `period` int(10) unsigned DEFAULT NULL COMMENT '周期',
  `ur` float DEFAULT NULL COMMENT '利用率',
  `availableHours` float DEFAULT NULL COMMENT '有效时间',
  `planHours` float DEFAULT NULL COMMENT '计划时间',
  `extUr` float DEFAULT NULL COMMENT '外部UR',
  `extAvailableHours` float DEFAULT NULL COMMENT '外部时间工时',
  `extPlanHours` float DEFAULT NULL COMMENT '外部计划工时',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工利用率表';

--
-- Dumping data for table `employeeur`
--

/*!40000 ALTER TABLE `employeeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeur` ENABLE KEYS */;


--
-- Definition of table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(15) DEFAULT NULL COMMENT '集团编号',
  `name` varchar(50) DEFAULT NULL COMMENT '集团名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团表';

--
-- Dumping data for table `group`
--

/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;


--
-- Definition of table `jbpm4_deployment`
--

DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_deployment`
--

/*!40000 ALTER TABLE `jbpm4_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_deployment` ENABLE KEYS */;


--
-- Definition of table `jbpm4_deployprop`
--

DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_deployprop`
--

/*!40000 ALTER TABLE `jbpm4_deployprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_deployprop` ENABLE KEYS */;


--
-- Definition of table `jbpm4_execution`
--

DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_execution`
--

/*!40000 ALTER TABLE `jbpm4_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_execution` ENABLE KEYS */;


--
-- Definition of table `jbpm4_hist_actinst`
--

DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_hist_actinst`
--

/*!40000 ALTER TABLE `jbpm4_hist_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_hist_actinst` ENABLE KEYS */;


--
-- Definition of table `jbpm4_hist_detail`
--

DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_hist_detail`
--

/*!40000 ALTER TABLE `jbpm4_hist_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_hist_detail` ENABLE KEYS */;


--
-- Definition of table `jbpm4_hist_procinst`
--

DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_hist_procinst`
--

/*!40000 ALTER TABLE `jbpm4_hist_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_hist_procinst` ENABLE KEYS */;


--
-- Definition of table `jbpm4_hist_task`
--

DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_hist_task`
--

/*!40000 ALTER TABLE `jbpm4_hist_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_hist_task` ENABLE KEYS */;


--
-- Definition of table `jbpm4_hist_var`
--

DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_hist_var`
--

/*!40000 ALTER TABLE `jbpm4_hist_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_hist_var` ENABLE KEYS */;


--
-- Definition of table `jbpm4_id_group`
--

DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_id_group`
--

/*!40000 ALTER TABLE `jbpm4_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_id_group` ENABLE KEYS */;


--
-- Definition of table `jbpm4_id_membership`
--

DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_USER` (`USER_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_id_membership`
--

/*!40000 ALTER TABLE `jbpm4_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_id_membership` ENABLE KEYS */;


--
-- Definition of table `jbpm4_id_user`
--

DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_id_user`
--

/*!40000 ALTER TABLE `jbpm4_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_id_user` ENABLE KEYS */;


--
-- Definition of table `jbpm4_job`
--

DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_job`
--

/*!40000 ALTER TABLE `jbpm4_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_job` ENABLE KEYS */;


--
-- Definition of table `jbpm4_lob`
--

DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_lob`
--

/*!40000 ALTER TABLE `jbpm4_lob` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_lob` ENABLE KEYS */;


--
-- Definition of table `jbpm4_participation`
--

DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_participation`
--

/*!40000 ALTER TABLE `jbpm4_participation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_participation` ENABLE KEYS */;


--
-- Definition of table `jbpm4_property`
--

DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_property`
--

/*!40000 ALTER TABLE `jbpm4_property` DISABLE KEYS */;
INSERT INTO `jbpm4_property` (`KEY_`,`VERSION_`,`VALUE_`) VALUES 
 ('next.dbid',0,'1');
/*!40000 ALTER TABLE `jbpm4_property` ENABLE KEYS */;


--
-- Definition of table `jbpm4_swimlane`
--

DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_swimlane`
--

/*!40000 ALTER TABLE `jbpm4_swimlane` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_swimlane` ENABLE KEYS */;


--
-- Definition of table `jbpm4_task`
--

DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_task`
--

/*!40000 ALTER TABLE `jbpm4_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_task` ENABLE KEYS */;


--
-- Definition of table `jbpm4_variable`
--

DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jbpm4_variable`
--

/*!40000 ALTER TABLE `jbpm4_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm4_variable` ENABLE KEYS */;


--
-- Definition of table `loginfo`
--

DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) DEFAULT NULL COMMENT '日志标题',
  `code` bigint(20) unsigned DEFAULT NULL COMMENT '异常代码',
  `content` varchar(500) DEFAULT NULL COMMENT '异常信息',
  `OperateId` int(10) unsigned DEFAULT NULL COMMENT '操作者',
  `OperateTime` datetime DEFAULT NULL COMMENT '操作时间',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志处理表';

--
-- Dumping data for table `loginfo`
--

/*!40000 ALTER TABLE `loginfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginfo` ENABLE KEYS */;


--
-- Definition of table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(20) DEFAULT NULL COMMENT ' 菜单编号',
  `name` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `applicationId` int(10) unsigned DEFAULT NULL COMMENT '  应用ID',
  `url` varchar(20) DEFAULT NULL COMMENT 'URL',
  `type` int(10) unsigned DEFAULT NULL COMMENT '类 型(0,菜单1.页面)',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` int(10) unsigned DEFAULT NULL COMMENT '状态(0.启用1.停用)',
  `icon` varchar(20) DEFAULT NULL COMMENT '图片icon',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表; ';

--
-- Dumping data for table `menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


--
-- Definition of table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `companyId` int(10) unsigned NOT NULL COMMENT '公司编号',
  `customerId` int(10) unsigned NOT NULL COMMENT '客户编号',
  `managerId` int(10) unsigned NOT NULL COMMENT '项目经理编号',
  `salesId` int(10) unsigned NOT NULL COMMENT '销售编号',
  `status` int(10) unsigned NOT NULL COMMENT '启用状态(0启用1停用)',
  `sapCode` varchar(30) NOT NULL COMMENT 'SAP编号',
  `TECode` varchar(30) NOT NULL COMMENT 'TE编号',
  `type` int(10) unsigned NOT NULL COMMENT '类型(1.内部项目2.外部项目3.法定节假日4.公司年假5. 其他休假)',
  `chargeType` int(10) unsigned NOT NULL COMMENT 'Charge类型\r\n0.	non-chargeable\r\n1.	chargeable\r\nCharge类型\r\n0.	non-chargeable\r\n1.	chargeable\r\nCharge类型(00.	non-chargeable11.	chargeable)',
  `transToSAP` int(10) unsigned NOT NULL COMMENT '导入到SAP\r\n0.	否1.	是\r\n导入到SAP(0否,1是)',
  `startDate` datetime NOT NULL COMMENT '开始时间',
  `endDate` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

--
-- Dumping data for table `project`
--

/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(45) DEFAULT NULL COMMENT '角色名称',
  `applicationId` varchar(45) DEFAULT NULL COMMENT '应用编号',
  `status` varchar(45) DEFAULT NULL COMMENT '状态\r\n0．	停用1．	启用\r\n状态(0停用，1启用)',
  `description` varchar(45) DEFAULT NULL COMMENT '描述 ',
  `companyId` varchar(45) DEFAULT NULL COMMENT '公司Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `rolemenu`
--

DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `roleId` int(10) unsigned NOT NULL COMMENT '角色编号',
  `menuId` int(10) unsigned NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单角色关系表';

--
-- Dumping data for table `rolemenu`
--

/*!40000 ALTER TABLE `rolemenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolemenu` ENABLE KEYS */;


--
-- Definition of table `time`
--

DROP TABLE IF EXISTS `time`;
CREATE TABLE `time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `year` int(10) unsigned DEFAULT NULL COMMENT '年',
  `month` int(10) unsigned DEFAULT NULL COMMENT ' 月',
  `period` int(10) unsigned DEFAULT NULL COMMENT '周期',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司编号',
  `customerId` int(10) unsigned DEFAULT NULL COMMENT '客户编号',
  `projectId` int(10) unsigned DEFAULT NULL COMMENT '项目编号',
  `total` float DEFAULT NULL COMMENT '总工时',
  `statusId` int(10) unsigned DEFAULT NULL COMMENT '工时状态',
  `employeeId` int(10) unsigned DEFAULT NULL COMMENT '员工编号',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `wFinstanceId` bigint(20) unsigned DEFAULT NULL COMMENT '工作流实例编号',
  `comments` varchar(200) DEFAULT NULL COMMENT '内容',
  `conclusion` varchar(30) DEFAULT NULL COMMENT '审批节点',
  `type` int(10) unsigned DEFAULT NULL COMMENT '项目类型',
  `attribute` int(10) unsigned DEFAULT NULL COMMENT '工时类型(1.收费工时2.不收费工时3.项目休假4.其他)',
  `operatorId` int(10) unsigned DEFAULT NULL COMMENT '操作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工时表';

--
-- Dumping data for table `time`
--

/*!40000 ALTER TABLE `time` DISABLE KEYS */;
/*!40000 ALTER TABLE `time` ENABLE KEYS */;


--
-- Definition of table `timedetail`
--

DROP TABLE IF EXISTS `timedetail`;
CREATE TABLE `timedetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `timeid` int(10) unsigned DEFAULT NULL COMMENT '工时编号',
  `workDate` datetime DEFAULT NULL COMMENT '日期',
  `Hours` float DEFAULT NULL COMMENT '工作时间',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工时明细表';

--
-- Dumping data for table `timedetail`
--

/*!40000 ALTER TABLE `timedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `timedetail` ENABLE KEYS */;


--
-- Definition of table `tmestatus`
--

DROP TABLE IF EXISTS `tmestatus`;
CREATE TABLE `tmestatus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工时状态表';

--
-- Dumping data for table `tmestatus`
--

/*!40000 ALTER TABLE `tmestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmestatus` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `account` varchar(20) DEFAULT NULL COMMENT '员工账号',
  `password` varchar(20) DEFAULT NULL COMMENT '密   码(存储MD5码)',
  `email` varchar(20) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `type` varchar(12) DEFAULT NULL COMMENT '员工类型',
  `groupId` int(10) unsigned DEFAULT NULL COMMENT '集团编号',
  `companyId` int(10) unsigned DEFAULT NULL COMMENT '公司编号',
  `departmentId` int(10) unsigned DEFAULT NULL COMMENT '部门编号',
  `leader` int(10) unsigned DEFAULT NULL COMMENT '直属领导',
  ` Level` int(10) unsigned DEFAULT NULL COMMENT '职    位(1.1.	普通员工2,组长3,3.	经理4,4.	数据管理员,5,5.	系统管理员)',
  `chargeType` int(10) unsigned DEFAULT NULL COMMENT 'Charge类型(01.	chargeable 12.	non-chargeable)',
  `idleCode` varchar(15) DEFAULT NULL COMMENT 'Idle Code',
  `costCenter` varchar(15) DEFAULT NULL COMMENT '成本中心',
  `profitCenter` varchar(15) DEFAULT NULL COMMENT '利润中心',
  `enabledStatus` int(10) unsigned DEFAULT NULL COMMENT '启用状态(0停用，1启用)',
  ` status` int(10) unsigned DEFAULT NULL COMMENT '状    态(0离职，1,入职)',
  `onboardDate` datetime DEFAULT NULL COMMENT '入职时间',
  `leaveDate` datetime DEFAULT NULL COMMENT '离职时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userId` int(10) unsigned NOT NULL COMMENT '用户编号',
  `roleId` int(10) unsigned NOT NULL COMMENT ' 角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

--
-- Dumping data for table `userrole`
--

/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
