-- MySQL dump 10.13  Distrib 8.0.18, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: booking
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Current Database: `booking`
--

/*!40000 DROP DATABASE IF EXISTS `booking`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS */ `booking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `booking`;

--
-- Table structure for table `t_ballroom`
--

DROP TABLE IF EXISTS `t_ballroom`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ballroom`
(
    `id`          int                                     NOT NULL AUTO_INCREMENT,
    `name_`       varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '宴会厅名称',
    `img_src`     varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '宴会厅图片地址',
    `descript`    text COLLATE utf8mb4_general_ci COMMENT '描述',
    `use_`        varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的用途列表',
    `meal`        varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的用餐标准列表',
    `device`      varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的设备标准列表',
    `remark`      text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='宴会厅信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ballroom`
--

LOCK TABLES `t_ballroom` WRITE;
/*!40000 ALTER TABLE `t_ballroom`
    DISABLE KEYS */;
INSERT INTO `t_ballroom`
VALUES (1, '高山流水厅', 'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/63/w1000h663/20200302/7298-iqfqmat4356985.jpg',
        NULL, '', '', '', NULL, '2020-02-27 10:08:20', '2020-03-08 11:16:36'),
       (2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', NULL, '', '',
        '', NULL, '2020-02-27 10:10:34', '2020-03-08 11:16:36'),
       (3, '汉宫秋月厅', 'http://n.sinaimg.cn/default/1_img/upload/3933d981/700/w900h600/20190604/e7d5-hxyuaph1376688.jpg',
        NULL, '', '', '', NULL, '2020-02-27 10:11:46', '2020-03-08 11:16:36'),
       (4, '广陵散', 'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/63/w1000h663/20200302/7298-iqfqmat4356985.jpg',
        '广陵散descript', '', '', '', '广陵散remark', '2020-03-08 11:17:53', '2020-03-08 11:22:27'),
       (5, '平沙落雁', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '平沙落雁descript',
        '', '', '', '平沙落雁remark', '2020-03-08 11:18:37', '2020-03-08 11:22:27'),
       (6, '十面埋伏', 'http://n.sinaimg.cn/default/1_img/upload/3933d981/700/w900h600/20190604/e7d5-hxyuaph1376688.jpg',
        '十面埋伏descript', '', '', '', '十面埋伏remark', '2020-03-08 11:21:54', '2020-03-08 11:22:27'),
       (7, '渔樵问答', 'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/63/w1000h663/20200302/7298-iqfqmat4356985.jpg',
        '渔樵问答descript', '', '', '', '渔樵问答remark', '2020-03-08 11:21:54', '2020-03-08 11:22:27'),
       (8, '胡笳十八拍', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg',
        '胡笳十八拍descript', '', '', '', '胡笳十八拍remark', '2020-03-08 11:21:54', '2020-03-08 11:22:27'),
       (9, '夕阳箫鼓', 'http://n.sinaimg.cn/default/1_img/upload/3933d981/700/w900h600/20190604/e7d5-hxyuaph1376688.jpg',
        '夕阳箫鼓descript', '', '', '', '夕阳箫鼓remark', '2020-03-08 11:21:54', '2020-03-08 11:22:27'),
       (10, '阳春白雪', 'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/63/w1000h663/20200302/7298-iqfqmat4356985.jpg',
        '阳春白雪descript', '', '', '', '阳春白雪remark', '2020-03-08 11:21:54', '2020-03-08 11:22:27');
/*!40000 ALTER TABLE `t_ballroom`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ballroom_use`
--

DROP TABLE IF EXISTS `t_ballroom_use`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ballroom_use`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT,
    `name_`       varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用途名称',
    `descript`    text COLLATE utf8mb4_general_ci COMMENT '描述',
    `create_time` timestamp                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='宴会厅用途表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ballroom_use`
--

LOCK TABLES `t_ballroom_use` WRITE;
/*!40000 ALTER TABLE `t_ballroom_use`
    DISABLE KEYS */;
INSERT INTO `t_ballroom_use`
VALUES (1, '婚宴', NULL, '2020-02-27 10:00:18', '2020-02-27 10:00:18'),
       (2, '会议', NULL, '2020-02-27 10:00:18', '2020-02-27 10:00:18'),
       (3, '团餐', NULL, '2020-02-27 10:00:18', '2020-02-27 10:00:18');
/*!40000 ALTER TABLE `t_ballroom_use`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer`
--

DROP TABLE IF EXISTS `t_customer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer`
(
    `id`            int                                                      NOT NULL AUTO_INCREMENT,
    `name_`         varchar(16) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '姓名',
    `sex`           enum ('MALE','FEMALE') COLLATE utf8mb4_general_ci        NOT NULL DEFAULT 'MALE' COMMENT '性别',
    `phone_no`      varchar(16) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '手机号',
    `wechat_id`     varchar(64) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '微信号',
    `customer_type` enum ('COMPANY','INDIVIDUAL') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'COMPANY' COMMENT '客户类型',
    `company`       varchar(256) COLLATE utf8mb4_general_ci                  NOT NULL DEFAULT '' COMMENT '公司名称',
    `address`       varchar(512) COLLATE utf8mb4_general_ci                  NOT NULL DEFAULT '' COMMENT '通讯地址',
    `remark`        text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time`   timestamp                                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   timestamp                                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='客户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer`
--

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer`
    DISABLE KEYS */;
INSERT INTO `t_customer`
VALUES (1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', NULL, '2020-03-05 11:36:12',
        '2020-03-05 11:37:17'),
       (2, '李四', 'FEMALE', '12333334444', '', 'INDIVIDUAL', '', '', NULL, '2020-03-05 11:37:17', '2020-03-05 11:37:17'),
       (3, '王五', 'MALE', '12355556666', '345', 'INDIVIDUAL', '', '另一个地址', 'remark', '2020-03-05 11:40:13',
        '2020-03-05 11:40:13'),
       (10, '赵胤胤', 'MALE', '13011111111', '1111', 'COMPANY', '赵一公司', '地址一', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (11, '钱钟书', 'MALE', '13022222222', '2222', 'COMPANY', '钱二公司', '', '备注一', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (12, '孙俪', 'FEMALE', '13033333333', '3333', 'COMPANY', '孙三公司', '地址二', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (13, '李清照', 'FEMALE', '13044444444', '4444', 'INDIVIDUAL', '', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (14, '周扒皮', 'FEMALE', '13055555555', '5555', 'INDIVIDUAL', '', '地址三', '备注二', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (15, '吴三桂', 'MALE', '13066666666', '6666', 'COMPANY', '吴四公司', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (16, '郑成功', 'MALE', '13077777777', '7777', 'COMPANY', '郑五公司', '地址四', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (17, '王羲之', 'MALE', '13088888888', '8888', 'INDIVIDUAL', '', '', '备注三', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (18, '冯诺依曼', 'MALE', '13099999999', '9999', 'COMPANY', '冯六公司', '地址五', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (19, '陈皮', 'FEMALE', '13000000000', '0000', 'INDIVIDUAL', '', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (20, '褚遂良', 'MALE', '14011111111', '1234', 'COMPANY', '褚七公司', '地址六', '备注四', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (21, '卫斯理', 'MALE', '14022222222', '2345', 'COMPANY', '卫八公司', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (22, '蒋经国', 'MALE', '14033333333', '3456', 'COMPANY', '蒋九公司', '地址七', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (23, '沈万三', 'MALE', '14044444444', '4567', 'COMPANY', '沈十公司', '', '备注五', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (24, '韩信', 'MALE', '14055555555', '5678', 'COMPANY', '韩十一公司', '地址八', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (25, '杨白劳', 'FEMALE', '14066666666', '6789', 'INDIVIDUAL', '', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (26, '朱德', 'MALE', '14077777777', '7890', 'COMPANY', '朱十二公司', '地址九', '备注六', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (27, '秦桧', 'MALE', '14088888888', '8901', 'COMPANY', '秦十三公司', '', '', '2020-03-09 15:28:38',
        '2020-03-09 15:28:38'),
       (28, '尤三姐', 'FEMALE', '14099999999', '9012', 'INDIVIDUAL', '', '地址十', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (29, '许君聪', 'MALE', '14000000000', '0123', 'INDIVIDUAL', '', '', '备注七', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (30, '何太急', 'MALE', '18811111111', '0987', 'INDIVIDUAL', '', '地址十一', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (31, '吕小妹', 'FEMALE', '18822222222', '9876', 'COMPANY', '吕十四公司', '', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (32, '施琅', 'MALE', '18833333333', '8765', 'COMPANY', '施十五公司', '地址十二', '备注八', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (33, '张骞', 'MALE', '18844444444', '7654', 'COMPANY', '张十六公司', '', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (34, '孔令辉', 'MALE', '18855555555', '6543', 'INDIVIDUAL', '', '地址十三', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (35, '曹操', 'MALE', '18866666666', '5432', 'COMPANY', '曹十七公司', '', '备注九', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (36, '严嵩', 'MALE', '18877777777', '4321', 'COMPANY', '严十八公司', '地址十四', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (37, '华佗', 'MALE', '18888888888', '3210', 'INDIVIDUAL', '', '', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (38, '金庸', 'MALE', '18899999999', '2109', 'INDIVIDUAL', '', '地址十五', '备注十', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (39, '魏积安', 'MALE', '18800000000', '1098', 'INDIVIDUAL', '', '', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (40, '陶碧华', 'FEMALE', '16612345678', '1357', 'COMPANY', '陶十九公司', '地址十六', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39'),
       (41, '姜子牙', 'MALE', '16687654321', '2468', 'COMPANY', '姜二十公司', '', '', '2020-03-09 15:28:39',
        '2020-03-09 15:28:39');
/*!40000 ALTER TABLE `t_customer`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order`
(
    `id`                int                                                                                                                                        NOT NULL AUTO_INCREMENT,
    `order_no`          varchar(32) COLLATE utf8mb4_general_ci                                                                                                     NOT NULL DEFAULT '' COMMENT '订单编号',
    `order_time`        datetime                                                                                                                                   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
    `ballroom_id`       int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '宴会厅ID',
    `order_ballroom_id` int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '订单-宴会厅ID',
    `customer_id`       int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '客户ID',
    `order_customer_id` int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '订单-客户ID',
    `use_date`          varchar(16) COLLATE utf8mb4_general_ci                                                                                                     NOT NULL DEFAULT '' COMMENT '使用日期',
    `use_time`          varchar(64) COLLATE utf8mb4_general_ci                                                                                                     NOT NULL DEFAULT '' COMMENT '使用时间',
    `use_type`          enum ('WEDDING','MEETING','MEAL') COLLATE utf8mb4_general_ci                                                                               NOT NULL DEFAULT 'WEDDING' COMMENT '用途',
    `need_meal`         tinyint(1)                                                                                                                                 NOT NULL DEFAULT '0' COMMENT '是否需要用餐',
    `meal_num`          int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '用餐桌数',
    `meal_unit_price`   decimal(8, 2)                                                                                                                              NOT NULL DEFAULT '0.00' COMMENT '餐标、单价',
    `need_device`       tinyint(1)                                                                                                                                 NOT NULL DEFAULT '0' COMMENT '是否使用设备',
    `device_price`      decimal(8, 2)                                                                                                                              NOT NULL DEFAULT '0.00' COMMENT '设备费用',
    `meeting_num`       int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '会议人数',
    `meeting_remark`    text COLLATE utf8mb4_general_ci COMMENT '会议摆台形式',
    `user_id`           int                                                                                                                                        NOT NULL DEFAULT '0' COMMENT '销售经理ID',
    `order_type`        enum ('TENTATIVE','DEFINITE') COLLATE utf8mb4_general_ci                                                                                   NOT NULL DEFAULT 'DEFINITE' COMMENT '订单类型',
    `order_status`      enum ('SAVE','SUBMIT','BOOK_APPROVAL','REVOKE','BOOK_SUCC','BOOK_FAIL','BACK_APPROVAL','BACK_SUCC','BACK_FAIL') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'SAVE' COMMENT '订单状态',
    `deposit_price`     decimal(8, 2)                                                                                                                              NOT NULL DEFAULT '0.00' COMMENT '定金',
    `price`             decimal(8, 2)                                                                                                                              NOT NULL DEFAULT '0.00' COMMENT '预计总价',
    `remark`            text COLLATE utf8mb4_general_ci COMMENT '备注',
    `approval_id`       varchar(64) COLLATE utf8mb4_general_ci                                                                                                     NOT NULL DEFAULT '' COMMENT '审批管理员ID',
    `approval_time`     datetime                                                                                                                                   NOT NULL COMMENT '最后审批时间',
    `modify_record`     text COLLATE utf8mb4_general_ci COMMENT '修改记录',
    `create_time`       timestamp                                                                                                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       timestamp                                                                                                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order`
    DISABLE KEYS */;
INSERT INTO `t_order`
VALUES (6, '2003091149393379', '2020-03-09 11:49:39', 2, 12, 1, 6, '20200309', 'YYYY', 'WEDDING', 0, 0, 0.00, 0, 0.00,
        0, '', 9999, 'TENTATIVE', 'SAVE', 0.00, 0.00, '', '', '2020-03-09 11:49:39', '', '2020-03-09 03:49:39',
        '2020-03-10 03:41:06'),
       (7, '2003091151303226', '2020-03-09 11:51:30', 2, 13, 1, 7, '20200309', 'YYYY', 'WEDDING', 0, 0, 0.00, 0, 0.00,
        0, '', 9999, 'TENTATIVE', 'SUBMIT', 100.00, 2000.30, '', '', '2020-03-09 11:51:30', '', '2020-03-09 03:51:30',
        '2020-03-09 03:51:30'),
       (9, '2003091201225557', '2020-03-09 12:01:23', 2, 15, 1, 9, '20200309', 'ALLDAY', 'WEDDING', 0, 0, 0.00, 0, 0.00,
        0, '', 9999, 'DEFINITE', 'BOOK_APPROVAL', 100.00, 2000.30, '', '', '2020-03-09 12:01:23', '',
        '2020-03-09 04:01:22', '2020-03-09 04:01:22');
/*!40000 ALTER TABLE `t_order`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_ballroom`
--

DROP TABLE IF EXISTS `t_order_ballroom`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order_ballroom`
(
    `id`          int                                     NOT NULL AUTO_INCREMENT,
    `origin_id`   int                                     NOT NULL DEFAULT '0' COMMENT '原始ID',
    `name_`       varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '宴会厅名称',
    `img_src`     varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '宴会厅图片地址',
    `descript`    text COLLATE utf8mb4_general_ci COMMENT '描述',
    `use_`        varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的用途列表',
    `meal`        varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的用餐标准列表',
    `device`      varchar(64) COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '支持的设备标准列表',
    `remark`      text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='订单-宴会厅信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_ballroom`
--

LOCK TABLES `t_order_ballroom` WRITE;
/*!40000 ALTER TABLE `t_order_ballroom`
    DISABLE KEYS */;
INSERT INTO `t_order_ballroom`
VALUES (5, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '', '',
        '', '', '2020-03-09 02:38:13', '2020-03-09 02:38:13'),
       (8, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '', '',
        '', '', '2020-03-09 02:58:38', '2020-03-09 02:58:38'),
       (9, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '', '',
        '', '', '2020-03-09 03:46:55', '2020-03-09 03:46:55'),
       (10, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 03:49:23', '2020-03-09 03:49:23'),
       (11, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 03:49:34', '2020-03-09 03:49:34'),
       (12, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 03:49:39', '2020-03-09 03:49:39'),
       (13, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 03:51:30', '2020-03-09 03:51:30'),
       (14, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 03:53:26', '2020-03-09 03:53:26'),
       (15, 2, '梅花三弄厅', 'http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg', '', '',
        '', '', '', '2020-03-09 04:01:22', '2020-03-09 04:01:22');
/*!40000 ALTER TABLE `t_order_ballroom`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_customer`
--

DROP TABLE IF EXISTS `t_order_customer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order_customer`
(
    `id`            int                                                      NOT NULL AUTO_INCREMENT,
    `origin_id`     int                                                      NOT NULL DEFAULT '0' COMMENT '原始ID',
    `name_`         varchar(16) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '姓名',
    `sex`           enum ('MALE','FEMALE') COLLATE utf8mb4_general_ci        NOT NULL DEFAULT 'MALE' COMMENT '性别',
    `phone_no`      varchar(16) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '手机号',
    `wechat_id`     varchar(64) COLLATE utf8mb4_general_ci                   NOT NULL DEFAULT '' COMMENT '微信号',
    `customer_type` enum ('COMPANY','INDIVIDUAL') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'COMPANY' COMMENT '客户类型',
    `company`       varchar(256) COLLATE utf8mb4_general_ci                  NOT NULL DEFAULT '' COMMENT '公司名称',
    `address`       varchar(512) COLLATE utf8mb4_general_ci                  NOT NULL DEFAULT '' COMMENT '通讯地址',
    `remark`        text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time`   timestamp                                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   timestamp                                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='客户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_customer`
--

LOCK TABLES `t_order_customer` WRITE;
/*!40000 ALTER TABLE `t_order_customer`
    DISABLE KEYS */;
INSERT INTO `t_order_customer`
VALUES (1, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '', '', '', '2020-03-09 02:38:13', '2020-03-09 02:38:13'),
       (2, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 02:58:38',
        '2020-03-09 02:58:38'),
       (3, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:46:55',
        '2020-03-09 03:46:55'),
       (4, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:49:23',
        '2020-03-09 03:49:23'),
       (5, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:49:34',
        '2020-03-09 03:49:34'),
       (6, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:49:39',
        '2020-03-09 03:49:39'),
       (7, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:51:30',
        '2020-03-09 03:51:30'),
       (8, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 03:53:26',
        '2020-03-09 03:53:26'),
       (9, 1, '张三', 'MALE', '12311112222', '123', 'COMPANY', '一个公司', '一个地址', '', '2020-03-09 04:01:22',
        '2020-03-09 04:01:22');
/*!40000 ALTER TABLE `t_order_customer`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role`
(
    `id`          int                                                         NOT NULL AUTO_INCREMENT,
    `role_name`   varchar(64) COLLATE utf8mb4_general_ci                               DEFAULT '' COMMENT '角色名称',
    `role_type`   enum ('SYSADMIN','ADMIN','USER') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USER' COMMENT '角色类型',
    `modules`     text COLLATE utf8mb4_general_ci                             NOT NULL COMMENT '角色权限模块',
    `description` text COLLATE utf8mb4_general_ci                             NOT NULL COMMENT '描述',
    `remark`      text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time` timestamp                                                   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_role_name` (`role_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role`
    DISABLE KEYS */;
INSERT INTO `t_role`
VALUES (1, 'sysadmin', 'SYSADMIN', '*', '系统管理员', NULL, '2020-03-03 07:50:04', '2020-03-03 07:50:04'),
       (2, 'admin', 'ADMIN', '*', '管理员', NULL, '2020-03-05 06:37:02', '2020-03-05 06:37:02'),
       (3, 'user', 'USER', '*', '客户经理', NULL, '2020-03-05 06:37:02', '2020-03-05 06:37:02');
/*!40000 ALTER TABLE `t_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_standard`
--

DROP TABLE IF EXISTS `t_standard`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_standard`
(
    `id`          int                                               NOT NULL AUTO_INCREMENT,
    `name_`       varchar(64) COLLATE utf8mb4_general_ci            NOT NULL DEFAULT '' COMMENT '标准名称',
    `type_`       enum ('meal','device') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'meal' COMMENT '资源类型',
    `description` text COLLATE utf8mb4_general_ci COMMENT '描述',
    `num`         int unsigned                                      NOT NULL DEFAULT '0' COMMENT '该标准资源的数量',
    `price`       decimal(8, 2)                                     NOT NULL DEFAULT '0.00' COMMENT '价格',
    `remark`      text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time` timestamp                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                         NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='资源标准表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_standard`
--

LOCK TABLES `t_standard` WRITE;
/*!40000 ALTER TABLE `t_standard`
    DISABLE KEYS */;
INSERT INTO `t_standard`
VALUES (1, '用餐标准-低', 'meal', NULL, 99999999, 699.00, NULL, '2020-02-27 09:56:37', '2020-02-27 09:56:37'),
       (2, '用餐标准-中', 'meal', NULL, 99999999, 799.00, NULL, '2020-02-27 09:56:37', '2020-02-27 09:56:37'),
       (3, '用餐标准-高', 'meal', NULL, 99999999, 899.00, NULL, '2020-02-27 09:56:37', '2020-02-27 09:56:37'),
       (4, '设备标准-低', 'device', NULL, 3, 100.00, NULL, '2020-02-27 09:59:27', '2020-02-27 09:59:27'),
       (5, '设备标准-中', 'device', NULL, 3, 200.00, NULL, '2020-02-27 09:59:27', '2020-02-27 09:59:27'),
       (6, '设备标准-高', 'device', NULL, 3, 300.00, NULL, '2020-02-27 09:59:27', '2020-02-27 09:59:27');
/*!40000 ALTER TABLE `t_standard`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user`
(
    `id`          int                                    NOT NULL AUTO_INCREMENT,
    `user_id`     varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
    `passwd`      varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加盐密码md5',
    `name_`       varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
    `phone_no`    varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
    `role_id`     int                                    NOT NULL DEFAULT '0' COMMENT '角色id',
    `remark`      text COLLATE utf8mb4_general_ci COMMENT '备注',
    `create_time` timestamp                              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                              NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10000
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user`
    DISABLE KEYS */;
INSERT INTO `t_user`
VALUES (1, 'WangYang', '', '王阳', '15210124381', 1, NULL, '2020-03-03 07:48:25', '2020-03-03 08:28:10'),
       (2, 'DaMeng', '', '孟伟', '15212345678', 1, NULL, '2020-03-03 07:48:53', '2020-03-03 07:48:53'),
       (9999, 'FakeUser', '', 'FakeUser', '12345678910', 1, 'FakeUser', '2020-03-08 08:16:37', '2020-03-08 08:26:49');
/*!40000 ALTER TABLE `t_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orders` AS
SELECT 1 AS `id`,
       1 AS `order_no`,
       1 AS `order_time`,
       1 AS `origin_ballroom_id`,
       1 AS `origin_ballroom_name`,
       1 AS `origin_ballroom_img_src`,
       1 AS `origin_ballroom_descript`,
       1 AS `origin_ballroom_remark`,
       1 AS `origin_ballroom_create_time`,
       1 AS `origin_ballroom_update_time`,
       1 AS `order_ballroom_id`,
       1 AS `order_ballroom_name`,
       1 AS `order_ballroom_img_src`,
       1 AS `order_ballroom_descript`,
       1 AS `order_ballroom_remark`,
       1 AS `order_ballroom_create_time`,
       1 AS `order_ballroom_update_time`,
       1 AS `origin_customer_id`,
       1 AS `origin_customer_name`,
       1 AS `origin_customer_sex`,
       1 AS `origin_customer_phone_no`,
       1 AS `origin_customer_wechat_id`,
       1 AS `origin_customer_customer_type`,
       1 AS `origin_customer_company`,
       1 AS `origin_customer_address`,
       1 AS `origin_customer_remark`,
       1 AS `origin_customer_create_time`,
       1 AS `origin_customer_update_time`,
       1 AS `order_customer_id`,
       1 AS `order_customer_name`,
       1 AS `order_customer_sex`,
       1 AS `order_customer_phone_no`,
       1 AS `order_customer_wechat_id`,
       1 AS `order_customer_customer_type`,
       1 AS `order_customer_company`,
       1 AS `order_customer_address`,
       1 AS `order_customer_remark`,
       1 AS `order_customer_create_time`,
       1 AS `order_customer_update_time`,
       1 AS `use_date`,
       1 AS `use_time`,
       1 AS `use_type`,
       1 AS `need_meal`,
       1 AS `meal_num`,
       1 AS `meal_unit_price`,
       1 AS `need_device`,
       1 AS `device_price`,
       1 AS `meeting_num`,
       1 AS `meeting_remark`,
       1 AS `user_id`,
       1 AS `order_type`,
       1 AS `order_status`,
       1 AS `deposit_price`,
       1 AS `price`,
       1 AS `remark`,
       1 AS `approval_id`,
       1 AS `approval_time`,
       1 AS `modify_record`,
       1 AS `create_time`,
       1 AS `update_time`
*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `booking`
--

USE `booking`;

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM = UNDEFINED */ /*!50013 DEFINER =`root`@`localhost` SQL SECURITY DEFINER */ /*!50001 VIEW `v_orders` AS
select `t_order`.`id`                     AS `id`,
       `t_order`.`order_no`               AS `order_no`,
       `t_order`.`order_time`             AS `order_time`,
       `t_order`.`ballroom_id`            AS `origin_ballroom_id`,
       `t_ballroom`.`name_`               AS `origin_ballroom_name`,
       `t_ballroom`.`img_src`             AS `origin_ballroom_img_src`,
       `t_ballroom`.`descript`            AS `origin_ballroom_descript`,
       `t_ballroom`.`remark`              AS `origin_ballroom_remark`,
       `t_ballroom`.`create_time`         AS `origin_ballroom_create_time`,
       `t_ballroom`.`update_time`         AS `origin_ballroom_update_time`,
       `t_order`.`order_ballroom_id`      AS `order_ballroom_id`,
       `t_order_ballroom`.`name_`         AS `order_ballroom_name`,
       `t_order_ballroom`.`img_src`       AS `order_ballroom_img_src`,
       `t_order_ballroom`.`descript`      AS `order_ballroom_descript`,
       `t_order_ballroom`.`remark`        AS `order_ballroom_remark`,
       `t_order_ballroom`.`create_time`   AS `order_ballroom_create_time`,
       `t_order_ballroom`.`update_time`   AS `order_ballroom_update_time`,
       `t_order`.`customer_id`            AS `origin_customer_id`,
       `t_customer`.`name_`               AS `origin_customer_name`,
       `t_customer`.`sex`                 AS `origin_customer_sex`,
       `t_customer`.`phone_no`            AS `origin_customer_phone_no`,
       `t_customer`.`wechat_id`           AS `origin_customer_wechat_id`,
       `t_customer`.`customer_type`       AS `origin_customer_customer_type`,
       `t_customer`.`company`             AS `origin_customer_company`,
       `t_customer`.`address`             AS `origin_customer_address`,
       `t_customer`.`remark`              AS `origin_customer_remark`,
       `t_customer`.`create_time`         AS `origin_customer_create_time`,
       `t_customer`.`update_time`         AS `origin_customer_update_time`,
       `t_order`.`order_customer_id`      AS `order_customer_id`,
       `t_order_customer`.`name_`         AS `order_customer_name`,
       `t_order_customer`.`sex`           AS `order_customer_sex`,
       `t_order_customer`.`phone_no`      AS `order_customer_phone_no`,
       `t_order_customer`.`wechat_id`     AS `order_customer_wechat_id`,
       `t_order_customer`.`customer_type` AS `order_customer_customer_type`,
       `t_order_customer`.`company`       AS `order_customer_company`,
       `t_order_customer`.`address`       AS `order_customer_address`,
       `t_order_customer`.`remark`        AS `order_customer_remark`,
       `t_order_customer`.`create_time`   AS `order_customer_create_time`,
       `t_order_customer`.`update_time`   AS `order_customer_update_time`,
       `t_order`.`use_date`               AS `use_date`,
       `t_order`.`use_time`               AS `use_time`,
       `t_order`.`use_type`               AS `use_type`,
       `t_order`.`need_meal`              AS `need_meal`,
       `t_order`.`meal_num`               AS `meal_num`,
       `t_order`.`meal_unit_price`        AS `meal_unit_price`,
       `t_order`.`need_device`            AS `need_device`,
       `t_order`.`device_price`           AS `device_price`,
       `t_order`.`meeting_num`            AS `meeting_num`,
       `t_order`.`meeting_remark`         AS `meeting_remark`,
       `t_order`.`user_id`                AS `user_id`,
       `t_order`.`order_type`             AS `order_type`,
       `t_order`.`order_status`           AS `order_status`,
       `t_order`.`deposit_price`          AS `deposit_price`,
       `t_order`.`price`                  AS `price`,
       `t_order`.`remark`                 AS `remark`,
       `t_order`.`approval_id`            AS `approval_id`,
       `t_order`.`approval_time`          AS `approval_time`,
       `t_order`.`modify_record`          AS `modify_record`,
       `t_order`.`create_time`            AS `create_time`,
       `t_order`.`update_time`            AS `update_time`
from ((((`t_order` join `t_order_ballroom`) join `t_order_customer`) join `t_ballroom`)
         join `t_customer`)
where ((`t_order`.`ballroom_id` = `t_ballroom`.`id`) and (`t_order`.`order_ballroom_id` = `t_order_ballroom`.`id`) and
       (`t_order`.`customer_id` = `t_customer`.`id`) and (`t_order`.`order_customer_id` = `t_order_customer`.`id`))
order by `t_order`.`id`
*/;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2020-03-11 19:47:20
