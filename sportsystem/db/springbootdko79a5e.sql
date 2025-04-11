/*
 Navicat Premium Data Transfer

 Source Server         : 123456
 Source Server Type    : MySQL
 Source Server Version : 50732 (5.7.32-log)
 Source Host           : localhost:3306
 Source Schema         : springbootdko79a5e

 Target Server Type    : MySQL
 Target Server Version : 50732 (5.7.32-log)
 File Encoding         : 65001

 Date: 11/04/2025 01:33:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `isdefault` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2025-03-24 22:22:30', 11, '宇宙银河系金星1号', '金某', '13823888881', '是');
INSERT INTO `address` VALUES (2, '2025-03-24 22:22:30', 12, '宇宙银河系木星1号', '木某', '13823888882', '是');
INSERT INTO `address` VALUES (3, '2025-03-24 22:22:30', 13, '宇宙银河系水星1号', '水某', '13823888883', '是');
INSERT INTO `address` VALUES (4, '2025-03-24 22:22:30', 14, '宇宙银河系火星1号', '火某', '13823888884', '是');
INSERT INTO `address` VALUES (5, '2025-03-24 22:22:30', 15, '宇宙银河系土星1号', '土某', '13823888885', '是');
INSERT INTO `address` VALUES (6, '2025-03-24 22:22:30', 16, '宇宙银河系月球1号', '月某', '13823888886', '是');
INSERT INTO `address` VALUES (7, '2025-03-24 22:22:30', 17, '宇宙银河系黑洞1号', '黑某', '13823888887', '是');
INSERT INTO `address` VALUES (8, '2025-03-24 22:22:30', 18, '宇宙银河系地球1号', '地某', '13823888888', '是');
INSERT INTO `address` VALUES (9, '2025-03-27 16:22:52', 1742975369339, '幸福家园', '111', '17314192870', '是');

-- ----------------------------
-- Table structure for bisaibaoming
-- ----------------------------
DROP TABLE IF EXISTS `bisaibaoming`;
CREATE TABLE `bisaibaoming`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛类型',
  `bisairiqi` date NULL DEFAULT NULL COMMENT '比赛日期',
  `zhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `crossuserid` bigint(20) NULL DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) NULL DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛报名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bisaibaoming
-- ----------------------------
INSERT INTO `bisaibaoming` VALUES (1, '2025-03-24 22:22:29', '比赛名称1', '比赛类型1', '2025-03-24', '账号1', '姓名1', 1, 1);
INSERT INTO `bisaibaoming` VALUES (2, '2025-03-24 22:22:29', '比赛名称2', '比赛类型2', '2025-03-24', '账号2', '姓名2', 2, 2);
INSERT INTO `bisaibaoming` VALUES (3, '2025-03-24 22:22:29', '比赛名称3', '比赛类型3', '2025-03-24', '账号3', '姓名3', 3, 3);
INSERT INTO `bisaibaoming` VALUES (4, '2025-03-24 22:22:29', '比赛名称4', '比赛类型4', '2025-03-24', '账号4', '姓名4', 4, 4);
INSERT INTO `bisaibaoming` VALUES (5, '2025-03-24 22:22:29', '比赛名称5', '比赛类型5', '2025-03-24', '账号5', '姓名5', 5, 5);
INSERT INTO `bisaibaoming` VALUES (6, '2025-03-24 22:22:29', '比赛名称6', '比赛类型6', '2025-03-24', '账号6', '姓名6', 6, 6);
INSERT INTO `bisaibaoming` VALUES (7, '2025-03-24 22:22:29', '比赛名称7', '比赛类型7', '2025-03-24', '账号7', '姓名7', 7, 7);
INSERT INTO `bisaibaoming` VALUES (8, '2025-03-24 22:22:29', '比赛名称8', '比赛类型8', '2025-03-24', '账号8', '姓名8', 8, 8);
INSERT INTO `bisaibaoming` VALUES (9, '2025-03-27 17:46:21', '比赛名称9', '乒乓球', '2025-03-27', '222', '孙莎莎', 1743068578993, 9);

-- ----------------------------
-- Table structure for bisaijilu
-- ----------------------------
DROP TABLE IF EXISTS `bisaijilu`;
CREATE TABLE `bisaijilu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛类型',
  `bisaitupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '比赛图片',
  `bisairiqi` date NULL DEFAULT NULL COMMENT '比赛日期',
  `zhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `bisaichengji` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '比赛成绩',
  `bisaijilu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '比赛记录',
  `crossuserid` bigint(20) NULL DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) NULL DEFAULT NULL COMMENT '跨表主键id',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `discussnum` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `totalscore` double NULL DEFAULT 0 COMMENT '评分',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bisaijilu
-- ----------------------------
INSERT INTO `bisaijilu` VALUES (1, '2025-03-24 22:22:29', '比赛名称1', '比赛类型1', 'upload/bisaijilu_bisaitupian1.jpg,upload/bisaijilu_bisaitupian2.jpg,upload/bisaijilu_bisaitupian3.jpg', '2025-03-24', '账号1', '姓名1', '比赛成绩1', '比赛记录1', 1, 1, 1, 1, '2025-03-24 22:22:29', 0, 0, 1);
INSERT INTO `bisaijilu` VALUES (2, '2025-03-24 22:22:29', '比赛名称2', '比赛类型2', 'upload/bisaijilu_bisaitupian2.jpg,upload/bisaijilu_bisaitupian3.jpg,upload/bisaijilu_bisaitupian4.jpg', '2025-03-24', '账号2', '姓名2', '比赛成绩2', '比赛记录2', 2, 2, 2, 2, '2025-03-24 22:22:29', 0, 0, 2);
INSERT INTO `bisaijilu` VALUES (3, '2025-03-24 22:22:29', '比赛名称3', '比赛类型3', 'upload/bisaijilu_bisaitupian3.jpg,upload/bisaijilu_bisaitupian4.jpg,upload/bisaijilu_bisaitupian5.jpg', '2025-03-24', '账号3', '姓名3', '比赛成绩3', '比赛记录3', 3, 3, 3, 3, '2025-03-24 22:22:29', 0, 0, 3);
INSERT INTO `bisaijilu` VALUES (4, '2025-03-24 22:22:29', '比赛名称4', '比赛类型4', 'upload/bisaijilu_bisaitupian4.jpg,upload/bisaijilu_bisaitupian5.jpg,upload/bisaijilu_bisaitupian6.jpg', '2025-03-24', '账号4', '姓名4', '比赛成绩4', '比赛记录4', 4, 4, 4, 4, '2025-03-24 22:22:29', 0, 0, 4);
INSERT INTO `bisaijilu` VALUES (5, '2025-03-24 22:22:29', '比赛名称5', '比赛类型5', 'upload/bisaijilu_bisaitupian5.jpg,upload/bisaijilu_bisaitupian6.jpg,upload/bisaijilu_bisaitupian7.jpg', '2025-03-24', '账号5', '姓名5', '比赛成绩5', '比赛记录5', 5, 5, 5, 5, '2025-03-24 22:22:29', 0, 0, 5);
INSERT INTO `bisaijilu` VALUES (6, '2025-03-24 22:22:29', '比赛名称6', '比赛类型6', 'upload/bisaijilu_bisaitupian6.jpg,upload/bisaijilu_bisaitupian7.jpg,upload/bisaijilu_bisaitupian8.jpg', '2025-03-24', '账号6', '姓名6', '比赛成绩6', '比赛记录6', 6, 6, 6, 6, '2025-03-24 22:22:29', 0, 0, 6);
INSERT INTO `bisaijilu` VALUES (7, '2025-03-24 22:22:29', '比赛名称7', '比赛类型7', 'upload/bisaijilu_bisaitupian7.jpg,upload/bisaijilu_bisaitupian8.jpg,upload/bisaijilu_bisaitupian1.jpg', '2025-03-24', '账号7', '姓名7', '比赛成绩7', '比赛记录7', 7, 7, 7, 7, '2025-03-24 22:22:29', 0, 0, 7);
INSERT INTO `bisaijilu` VALUES (8, '2025-03-24 22:22:29', '比赛名称8', '比赛类型8', 'upload/bisaijilu_bisaitupian8.jpg,upload/bisaijilu_bisaitupian1.jpg,upload/bisaijilu_bisaitupian2.jpg', '2025-03-24', '账号8', '姓名8', '比赛成绩8', '比赛记录8', 8, 8, 8, 8, '2025-03-24 22:22:29', 0, 0, 8);
INSERT INTO `bisaijilu` VALUES (9, '2025-03-28 15:49:37', '比赛名称9', '乒乓球', '', '2025-03-28', '222', '孙莎莎', '金牌', '', 1743068578993, 9, 0, 0, NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for bisaileixing
-- ----------------------------
DROP TABLE IF EXISTS `bisaileixing`;
CREATE TABLE `bisaileixing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '比赛类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bisaileixing
-- ----------------------------
INSERT INTO `bisaileixing` VALUES (1, '2025-03-24 22:22:29', '羽毛球');
INSERT INTO `bisaileixing` VALUES (2, '2025-03-24 22:22:29', '乒乓球');
INSERT INTO `bisaileixing` VALUES (3, '2025-03-24 22:22:29', '篮球');
INSERT INTO `bisaileixing` VALUES (4, '2025-03-24 22:22:29', '足球');
INSERT INTO `bisaileixing` VALUES (5, '2025-03-24 22:22:29', '游泳');
INSERT INTO `bisaileixing` VALUES (6, '2025-03-24 22:22:29', '网球');
INSERT INTO `bisaileixing` VALUES (7, '2025-03-24 22:22:29', '田径');
INSERT INTO `bisaileixing` VALUES (8, '2025-03-24 22:22:29', '拳击');

-- ----------------------------
-- Table structure for bisaixinxi
-- ----------------------------
DROP TABLE IF EXISTS `bisaixinxi`;
CREATE TABLE `bisaixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '比赛类型',
  `xuanchuantupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '宣传图片',
  `bisairiqi` date NULL DEFAULT NULL COMMENT '比赛日期',
  `bisaididian` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '比赛地点',
  `zhubandanwei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主办单位',
  `chengbandanwei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '承办单位',
  `xiangqingjieshao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '详情介绍',
  `shipin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '视频',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `discussnum` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bisaixinxi
-- ----------------------------
INSERT INTO `bisaixinxi` VALUES (1, '2025-03-24 22:22:29', '比赛名称1', '羽毛球', 'upload/1742981141031.jpg,upload/1742981145583.jpg,upload/1742981149667.jpg', '2025-03-24', '比赛地点1', '主办单位1', '承办单位1', '<p>详情介绍1</p>', '', 1, 1, '2025-03-24 22:22:29', 0, 1);
INSERT INTO `bisaixinxi` VALUES (2, '2025-03-24 22:22:29', '比赛名称2', '乒乓球', 'upload/1742990536579.jpg,upload/1742990544115.jpg,upload/1742990548765.jpg', '2025-03-24', '比赛地点2', '主办单位2', '承办单位2', '<p>详情介绍2</p>', '', 2, 2, '2025-03-24 22:22:29', 0, 2);
INSERT INTO `bisaixinxi` VALUES (3, '2025-03-24 22:22:29', '比赛名称3', '篮球', 'upload/bisaixinxi_xuanchuantupian3.jpg,upload/bisaixinxi_xuanchuantupian4.jpg,upload/bisaixinxi_xuanchuantupian5.jpg', '2025-03-24', '比赛地点3', '主办单位3', '承办单位3', '<p>详情介绍3</p>', '', 3, 3, '2025-03-24 22:22:29', 0, 3);
INSERT INTO `bisaixinxi` VALUES (4, '2025-03-24 22:22:29', '比赛名称4', '足球', 'upload/1742990695739.jpg,upload/1742990700465.jpg,upload/1742990704845.jpg', '2025-03-24', '比赛地点4', '主办单位4', '承办单位4', '<p>详情介绍4</p>', '', 4, 4, '2025-03-24 22:22:29', 0, 4);
INSERT INTO `bisaixinxi` VALUES (5, '2025-03-24 22:22:29', '比赛名称5', '游泳', 'upload/1742990894483.jpg,upload/1742990899823.jpg,upload/1742990908603.jpg', '2025-03-24', '比赛地点5', '主办单位5', '承办单位5', '<p>详情介绍5</p>', '', 5, 5, '2025-03-24 22:22:29', 0, 5);
INSERT INTO `bisaixinxi` VALUES (6, '2025-03-24 22:22:29', '比赛名称6', '网球', 'upload/1742991187527.jpg,upload/1742991192044.jpg,upload/1742991196244.jpg', '2025-03-24', '比赛地点6', '主办单位6', '承办单位6', '<p>详情介绍6</p>', '', 6, 6, '2025-03-24 22:22:29', 0, 6);
INSERT INTO `bisaixinxi` VALUES (7, '2025-03-24 22:22:29', '比赛名称7', '田径', 'upload/1742991437822.jpg,upload/1742991444681.jpg', '2025-03-24', '比赛地点7', '主办单位7', '承办单位7', '<p>详情介绍7</p>', '', 7, 7, '2025-03-24 22:22:29', 0, 7);
INSERT INTO `bisaixinxi` VALUES (8, '2025-03-24 22:22:29', '比赛名称8', '拳击', 'upload/1742991544847.jpg,upload/1742991549545.jpg,upload/1742991553175.jpg', '2025-03-24', '比赛地点8', '主办单位8', '承办单位8', '<p>详情介绍8</p>', '', 9, 8, '2025-03-24 22:22:29', 0, 8);
INSERT INTO `bisaixinxi` VALUES (9, '2025-03-26 20:22:47', '比赛名称9', '乒乓球', 'upload/1742991710057.jpg,upload/1742991765072.jpg', NULL, '', '', '', '<p><span style=\"background-color: rgb(255, 255, 255);\">本次比赛分为男子单打、女子单打和团体赛三个部分，采用单淘汰制，</span></p>', 'upload/1743147270462.mp4', 0, 0, NULL, 0, 2);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'yundongshangpin' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double NULL DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`price`) REFERENCES `yundongshangpin` (`price`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, '2025-03-27 16:09:06', 'yundongshangpin', 1742975369339, 14, '运动服', 'upload/1743060764434.jpg', 1, 77);
INSERT INTO `cart` VALUES (3, '2025-03-28 15:39:49', 'yundongshangpin', 1742975369339, 12, '网球挂件', 'upload/1743060557177.jpg', 1, 12);

-- ----------------------------
-- Table structure for chargerecord
-- ----------------------------
DROP TABLE IF EXISTS `chargerecord`;
CREATE TABLE `chargerecord`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `amount` double NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '充值记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chargerecord
-- ----------------------------
INSERT INTO `chargerecord` VALUES (1, '2025-03-24 22:22:30', 1, '用户名1', '角色1', 1);
INSERT INTO `chargerecord` VALUES (2, '2025-03-24 22:22:30', 2, '用户名2', '角色2', 2);
INSERT INTO `chargerecord` VALUES (3, '2025-03-24 22:22:30', 3, '用户名3', '角色3', 3);
INSERT INTO `chargerecord` VALUES (4, '2025-03-24 22:22:30', 4, '用户名4', '角色4', 4);
INSERT INTO `chargerecord` VALUES (5, '2025-03-24 22:22:30', 5, '用户名5', '角色5', 5);
INSERT INTO `chargerecord` VALUES (6, '2025-03-24 22:22:30', 6, '用户名6', '角色6', 6);
INSERT INTO `chargerecord` VALUES (7, '2025-03-24 22:22:30', 7, '用户名7', '角色7', 7);
INSERT INTO `chargerecord` VALUES (8, '2025-03-24 22:22:30', 8, '用户名8', '角色8', 8);
INSERT INTO `chargerecord` VALUES (9, '2025-03-27 16:08:30', 1742975369339, '111', '用户', 23);
INSERT INTO `chargerecord` VALUES (10, '2025-03-27 16:23:17', 1742975369339, '111', '用户', 40000);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/picture1.jpg', NULL);
INSERT INTO `config` VALUES (2, 'picture2', 'upload/1742981451668.jpg', NULL);
INSERT INTO `config` VALUES (3, 'picture3', 'upload/1742981427554.jpg', NULL);

-- ----------------------------
-- Table structure for discussbisaijilu
-- ----------------------------
DROP TABLE IF EXISTS `discussbisaijilu`;
CREATE TABLE `discussbisaijilu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `score` double NULL DEFAULT NULL COMMENT '评分',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `istop` int(11) NULL DEFAULT 0 COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '赞用户ids',
  `cuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '踩用户ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛记录评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussbisaijilu
-- ----------------------------

-- ----------------------------
-- Table structure for discussbisaixinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussbisaixinxi`;
CREATE TABLE `discussbisaixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `istop` int(11) NULL DEFAULT 0 COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '赞用户ids',
  `cuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '踩用户ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '比赛信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussbisaixinxi
-- ----------------------------

-- ----------------------------
-- Table structure for discussyundongshangpin
-- ----------------------------
DROP TABLE IF EXISTS `discussyundongshangpin`;
CREATE TABLE `discussyundongshangpin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `istop` int(11) NULL DEFAULT 0 COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '赞用户ids',
  `cuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '踩用户ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动商品评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussyundongshangpin
-- ----------------------------

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) NULL DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `isdone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `istop` int(11) NULL DEFAULT 0 COMMENT '是否置顶',
  `toptime` datetime NULL DEFAULT NULL COMMENT '置顶时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `cover` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '封面',
  `isanon` int(11) NULL DEFAULT 0 COMMENT '是否匿名(1:是,0:否)',
  `delflag` int(11) NULL DEFAULT 0 COMMENT '是否删除(1:是,0:否)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typename`(`typename`) USING BTREE,
  CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`typename`) REFERENCES `forumtype` (`typename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社区互动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (1, '2025-03-24 22:22:29', '帖子标题1', '帖子内容1', 0, 1, '用户名1', 'upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg', '开放', 1, '2025-03-29 00:49:41', '分类名称1', 'upload/forum_cover1.jpg,upload/forum_cover2.jpg,upload/forum_cover3.jpg', 1, 0);
INSERT INTO `forum` VALUES (2, '2025-03-24 22:22:30', '帖子标题2', '帖子内容2', 0, 2, '用户名2', 'upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称2', 'upload/forum_cover2.jpg,upload/forum_cover3.jpg,upload/forum_cover4.jpg', 2, 0);
INSERT INTO `forum` VALUES (3, '2025-03-24 22:22:30', '帖子标题3', '帖子内容3', 0, 3, '用户名3', 'upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称3', 'upload/forum_cover3.jpg,upload/forum_cover4.jpg,upload/forum_cover5.jpg', 3, 0);
INSERT INTO `forum` VALUES (4, '2025-03-24 22:22:30', '帖子标题4', '帖子内容4', 0, 4, '用户名4', 'upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称4', 'upload/forum_cover4.jpg,upload/forum_cover5.jpg,upload/forum_cover6.jpg', 4, 0);
INSERT INTO `forum` VALUES (5, '2025-03-24 22:22:30', '帖子标题5', '帖子内容5', 0, 5, '用户名5', 'upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称5', 'upload/forum_cover5.jpg,upload/forum_cover6.jpg,upload/forum_cover7.jpg', 5, 0);
INSERT INTO `forum` VALUES (6, '2025-03-24 22:22:30', '帖子标题6', '帖子内容6', 0, 6, '用户名6', 'upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称6', 'upload/forum_cover6.jpg,upload/forum_cover7.jpg,upload/forum_cover8.jpg', 6, 0);
INSERT INTO `forum` VALUES (7, '2025-03-24 22:22:30', '帖子标题7', '帖子内容7', 0, 7, '用户名7', 'upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称7', 'upload/forum_cover7.jpg,upload/forum_cover8.jpg,upload/forum_cover1.jpg', 7, 0);
INSERT INTO `forum` VALUES (8, '2025-03-24 22:22:30', '帖子标题8', '帖子内容8', 0, 8, '用户名8', 'upload/forum_avatarurl8.jpg,upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg', '开放', 0, '2025-03-24 22:22:30', '分类名称8', 'upload/forum_cover8.jpg,upload/forum_cover1.jpg,upload/forum_cover2.jpg', 8, 1);
INSERT INTO `forum` VALUES (10, '2025-03-29 00:39:09', '超越胜负的力量', '<p><strong>体育精神：超越胜负的力量</strong></p><p>体育精神是人类文明中熠熠生辉的瑰宝，它不仅是赛场上的竞技与对抗，更是一种超越胜负的生命态度。它教会我们如何面对挑战、尊重对手，并在逆境中坚守信念。</p><p>真正的体育精神，体现在公平竞争的规则之下——无论输赢，全力以赴才是对运动最大的敬意；体现在团队协作的无私奉献中——个人的光芒永远离不开集体的支撑；更体现在对失败者的掌声里，因为敢于站上赛场的人，已然是勇者。</p><p>从马拉松战役中奔跑至死的菲迪皮茨，到现代奥运会上携手鼓励的对手，体育精神始终在传递一个真理：比金牌更珍贵的，是坚韧的意志、包容的胸怀，和对人类极限永不停歇的探索。它不仅是运动员的信仰，更是每个人在平凡生活中向上攀登的力量。</p><p>正如顾拜旦所言：\"奥运会最重要的不是取胜，而是参与；人生最重要的不是征服，而是奋力拼搏。\"体育精神，终将引领我们走向更高、更快、更强——更团结的未来。</p>', 0, 1742975369339, '111', NULL, '开放', 0, '2025-03-29 00:39:09', '分类名称1', 'upload/1743179945217.jpg', 0, 0);
INSERT INTO `forum` VALUES (11, '2025-03-29 00:41:37', NULL, '<p>nice</p>', 7, 1742975369339, '111', 'upload/1742975309108.png', NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `forum` VALUES (12, '2025-03-29 00:44:20', NULL, '<p>确实</p>', 11, 1743180220122, '444', 'upload/1743180204397.jpeg', NULL, 0, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for forumreport
-- ----------------------------
DROP TABLE IF EXISTS `forumreport`;
CREATE TABLE `forumreport`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `forumid` bigint(20) NULL DEFAULT NULL COMMENT '论坛id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `userid` bigint(20) NOT NULL COMMENT '举报用户id',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '举报用户名',
  `reporteduserid` bigint(20) NOT NULL COMMENT '被举报用户id',
  `reportedusername` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '被举报用户名',
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报原因',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片补充',
  `handleadvise` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '处理建议',
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '处理中' COMMENT '状态',
  `reporttype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '主题帖举报' COMMENT '举报类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社区互动举报' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forumreport
-- ----------------------------
INSERT INTO `forumreport` VALUES (1, '2025-03-24 22:22:30', 1, '帖子标题1', 1, '举报用户名1', 1, '被举报用户名1', '举报原因1', 'upload/forumreport_picture1.jpg,upload/forumreport_picture2.jpg,upload/forumreport_picture3.jpg', '处理建议1', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (2, '2025-03-24 22:22:30', 2, '帖子标题2', 2, '举报用户名2', 2, '被举报用户名2', '举报原因2', 'upload/forumreport_picture2.jpg,upload/forumreport_picture3.jpg,upload/forumreport_picture4.jpg', '处理建议2', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (3, '2025-03-24 22:22:30', 3, '帖子标题3', 3, '举报用户名3', 3, '被举报用户名3', '举报原因3', 'upload/forumreport_picture3.jpg,upload/forumreport_picture4.jpg,upload/forumreport_picture5.jpg', '处理建议3', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (4, '2025-03-24 22:22:30', 4, '帖子标题4', 4, '举报用户名4', 4, '被举报用户名4', '举报原因4', 'upload/forumreport_picture4.jpg,upload/forumreport_picture5.jpg,upload/forumreport_picture6.jpg', '处理建议4', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (5, '2025-03-24 22:22:30', 5, '帖子标题5', 5, '举报用户名5', 5, '被举报用户名5', '举报原因5', 'upload/forumreport_picture5.jpg,upload/forumreport_picture6.jpg,upload/forumreport_picture7.jpg', '处理建议5', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (6, '2025-03-24 22:22:30', 6, '帖子标题6', 6, '举报用户名6', 6, '被举报用户名6', '举报原因6', 'upload/forumreport_picture6.jpg,upload/forumreport_picture7.jpg,upload/forumreport_picture8.jpg', '处理建议6', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (7, '2025-03-24 22:22:30', 7, '帖子标题7', 7, '举报用户名7', 7, '被举报用户名7', '举报原因7', 'upload/forumreport_picture7.jpg,upload/forumreport_picture8.jpg,upload/forumreport_picture1.jpg', '处理建议7', '处理中', '主题帖举报');
INSERT INTO `forumreport` VALUES (8, '2025-03-24 22:22:30', 8, '帖子标题8', 8, '举报用户名8', 8, '被举报用户名8', '举报原因8', 'upload/forumreport_picture8.jpg,upload/forumreport_picture1.jpg,upload/forumreport_picture2.jpg', '处理建议8', '已处理', '主题帖举报');

-- ----------------------------
-- Table structure for forumtype
-- ----------------------------
DROP TABLE IF EXISTS `forumtype`;
CREATE TABLE `forumtype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `forumtype_zx30`(`typename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社区互动类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forumtype
-- ----------------------------
INSERT INTO `forumtype` VALUES (1, '2025-03-24 22:22:30', '分类名称1');
INSERT INTO `forumtype` VALUES (2, '2025-03-24 22:22:30', '分类名称2');
INSERT INTO `forumtype` VALUES (3, '2025-03-24 22:22:30', '分类名称3');
INSERT INTO `forumtype` VALUES (4, '2025-03-24 22:22:30', '分类名称4');
INSERT INTO `forumtype` VALUES (5, '2025-03-24 22:22:30', '分类名称5');
INSERT INTO `forumtype` VALUES (6, '2025-03-24 22:22:30', '分类名称6');
INSERT INTO `forumtype` VALUES (7, '2025-03-24 22:22:30', '分类名称7');
INSERT INTO `forumtype` VALUES (8, '2025-03-24 22:22:30', '分类名称8');

-- ----------------------------
-- Table structure for jiaolianyuan
-- ----------------------------
DROP TABLE IF EXISTS `jiaolianyuan`;
CREATE TABLE `jiaolianyuan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoliangonghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教练工号',
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `jiaolianxingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教练姓名',
  `touxiang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `nianling` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `shoujihaoma` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `money` double NULL DEFAULT 0 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743069141926 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教练员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiaolianyuan
-- ----------------------------
INSERT INTO `jiaolianyuan` VALUES (31, '2025-03-24 22:22:29', '教练工号1', '123456', '教练姓名1', 'upload/jiaolianyuan_touxiang1.jpg', '男', 1, '13823888881', 200);
INSERT INTO `jiaolianyuan` VALUES (33, '2025-03-24 22:22:29', '教练工号3', '123456', '教练姓名3', 'upload/jiaolianyuan_touxiang3.jpg', '男', 3, '13823888883', 200);
INSERT INTO `jiaolianyuan` VALUES (34, '2025-03-24 22:22:29', '教练工号4', '123456', '教练姓名4', 'upload/jiaolianyuan_touxiang4.jpg', '男', 4, '13823888884', 200);
INSERT INTO `jiaolianyuan` VALUES (36, '2025-03-24 22:22:29', '教练工号6', '123456', '教练姓名6', 'upload/jiaolianyuan_touxiang6.jpg', '男', 6, '13823888886', 200);
INSERT INTO `jiaolianyuan` VALUES (37, '2025-03-24 22:22:29', '教练工号7', '123456', '教练姓名7', 'upload/jiaolianyuan_touxiang7.jpg', '男', 7, '13823888887', 200);
INSERT INTO `jiaolianyuan` VALUES (38, '2025-03-24 22:22:29', '教练工号8', '123456', '教练姓名8', 'upload/jiaolianyuan_touxiang8.jpg', '男', 8, '13823888888', 200);
INSERT INTO `jiaolianyuan` VALUES (1743069141925, '2025-03-27 17:52:21', '333', '333', '张教练', 'upload/1743069126820.jpg', '男', 45, '15637825467', 0);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `headportrait` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `clicknum` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '体育资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '2025-03-24 22:22:30', '趁着年轻，输得起，看得开，去经历', '我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤', '分类名称1', '发布人1', 'upload/news_headportrait1.jpg', 3, '2025-03-29 01:03:54', 1, 1, 1, 'upload/news_picture1.jpg', '<p>我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤。</p><p>  首先，我皈依了减肥。我可以整整一天滴水不进，然后第二天中午，一个小时之内连续去三个食堂吃午饭，每次都是两荤一素、一两米饭加一瓶大可乐，像是一个人孢子分裂出了三个暴食症患者。其次，因为要么饿得百爪挠心，要么撑得寝食难安，我变成了一个昼夜颠倒的人，再加上觉得自己邋遢难看，不愿见人，便逃掉了很多课。其三，逃课的空虚让我花了大量时间网购，击败了全国90%以上的电商消费者，和快递员结下了深厚的友谊。我买的大多数是衣服，衣服又穿不进，羞愤难当，继续皈依减肥。总之，那是我非常不快乐的几年。因为难以接受自己，所以蜷缩着，拒绝他人。</p><p>    我很久之后才知道，人用来自憎的大脑边缘系统，在童年时就已经形成。可是，用来开导自己、原谅自己、使自己变得强大的智慧，却往往在我们本该成熟的年纪依然不具备。每一世代的年轻人都是脆弱的、敏感的、容易受他人影响的。而对于正年轻的一代来说，这个挑战异乎寻常的艰难。</p><p> 电影《楚门的世界》中提出了一个假设以及相应的解答:当一个人活在所有人的窥探之下，他应该怎么办?答案是:他逃走，获得自由。然而，如果所有人活在所有人的窥探之下，那又该如何逃避?这不是假设，而是正在悄然发生的现实。我们无时无刻不在朋友圈、微博、贴吧、个人主页上展现自己的生活，同时，也在同样的平台上窥探他人的生活。我们无时无刻不在评估他人，同时，也在接受他人的评估。“个性张扬”只是狐假虎威的外衣，为的是掩饰自卑与自恋此起彼伏、相爱相杀的脆弱。我们羡慕嫉妒他人，也努力把自己的生活修饰得让他人羡慕嫉妒。我们对他人的意见过于敏感，无法忍受不被“点赞”的人生。</p><p>  社交网络的核心在于“社交”，社交的动力，是出于人们无法忍受孤独;人们之所以无法忍受孤独，是因为人们无法拷问自己。可是，总有一天，我们要站在镜子前，发现我们并不是自己创造出来的那个有趣、可爱、有吸引力、有能力的人。那么，你还喜欢镜子里的自己吗?或者，镜子里的你还喜欢自己吗?这个世界是否称赞你、羡慕你、爱你，在某种程度上是个不断膨胀的谎言。关键的问题在于，你是否对自己足够诚实，并且接受诚实之后的不完美。</p><p>   失去的痛苦、被拒绝的痛苦、被伤害的痛苦、分别的痛苦，它们如此显眼地横在前行的路上，让人想逃遁到那个充满着“赞”的虚幻世界里。然而，我们是人，走在一条从摇篮到坟墓的路上，年轻在途中，衰老在途中。必须和真实的世界发生联系，而不是兀自为尚未发生的事情恐惧;必须和真实的人发生各种关系，而不是如一座座只能遥远眺望的孤岛。</p><p>那些杀不死我们的，它们有时并不会让我们更加强大，而只是成为一段诗意或自嘲的记忆。趁着年轻，输得起，看得开，去经历。那些杀不死我们的，它们在混沌而无序的未来里，并不能成为我们手中的武器，却为我们的存活，增加了反抗脆弱与敏感的韧性。</p>');
INSERT INTO `news` VALUES (3, '2025-03-24 22:22:30', '留退路就没有出路', '公元前一世纪，凯撒大帝率领他的军队抵达了英格兰，他决心要赢得这场战争，不管遇到什么情况都不会退却。为了让士兵们明白自己必胜的决心和信心，也为了断绝士兵们逃跑退缩的念头，凯撒命令士兵将运载他们的所有船只都烧毁。这使得军队的士气受到了莫大的鼓舞。后来他们获胜了', '分类名称3', '发布人3', 'upload/news_headportrait3.jpg', 4, '2025-03-26 15:50:28', 3, 3, 3, 'upload/news_picture3.jpg', '<p>  公元前一世纪，凯撒大帝率领他的军队抵达了英格兰，他决心要赢得这场战争，不管遇到什么情况都不会退却。为了让士兵们明白自己必胜的决心和信心，也为了断绝士兵们逃跑退缩的念头，凯撒命令士兵将运载他们的所有船只都烧毁。这使得军队的士气受到了莫大的鼓舞。后来他们获胜了。</p><p>  很多人在处理重要问题的时候，总是喜欢把这些问题暂且搁置在一边，等以后再做。他们没有决定的勇气和魄力，总是在着手做事的时候想给自己留一条后路，以免没有出路。对于他们来说，退路就是出路。但是，事实证明，这样是不会有任何成就的。</p><p>背水一战、破釜沉舟的军队往往能获得胜利。同样，一个做事不留退路、一心向前的人，不管遇到什么困难和障碍，他都不会后退，因为他没有路可以退。而那些人在为自己准备退路的同时就是在后退，他们立志不坚，把精力和时间投入到退缩的准备上，这种人绝不会获得成功。</p><p>  一个人能否成功，关键在于他意志力的强弱。意志坚强的人不管遇到什么困难和障碍，都会百折不挠，想方设法地克服;意志薄弱的人一遇到麻烦，甚至在挫折还没有到来之前，他们就开始庸人自扰，彷徨失措，把精力都放在如何规避问题上，放在为自己铺设后路上。当困难一个接一个来时，他们就一步接一步后退，最后他们终将无路可退。</p><p>现实生活中，到处都充斥着这样的青年，他们富有上进心，希望有一番成就和作为，但是他们意志薄弱，没有必胜的决心，不敢破釜沉舟;他们始终左摇右摆，没有坚定的信念，一遇到挫折和困难，马上就缩回了进取的手和脚。这样的人，这样的心态，最后遭受失败也不足为奇。</p><p>   不给自己留后路，让自己没有回旋的余地，方能竭尽全力，锐意进取，就算遇到千万困难，也不会退缩，因为回头也没有路了，不如不顾一切地前进，还能找到一线希望。有了这样一种“拼命”和“豁出去”了的信念，才能彻彻底底地消除心中的恐惧、犹豫、胆怯。当一个人不给自己任何退路的时候，他就什么都不怕了，勇气、信心、热忱等从心底油然而生，到最后自然能“置之死地而后生”。</p><p>    面对严峻的问题和重要环节，周全而细致地考虑问题的各个方面也是应该的，但是过多地权衡，前怕狼后怕虎，一会儿这样一会儿那样，最终却还是原样，可以肯定地说，你不会有任何进展，甚至还会变得—塌糊涂。</p><p>出路和退路不是同义词，而是反义词，留退路就没有出路，因此，你应该只找出路，不留退路。大学生励志青春文章:培养积极的思维模式。</p>');
INSERT INTO `news` VALUES (4, '2025-03-24 22:22:30', '在大学给自己定个目标', '最近和几名大一的学生聊天，几名同学认为身边的人普遍都很迷茫，不知道该干什么，业余时间要么是对着电脑、要么是抱着手机刷微博。我问道:“为什么不找点事情做做，制定一个计划，哪怕是锻炼身体也好?4年也可以把身体锻炼得结实些。”当然，我也清楚，我的这些建议对他们来说，未必能有多大用。许多学生因为意志不坚定，没有老师的监督、逼迫，根本就无法做到', '分类名称4', '发布人4', 'upload/news_headportrait4.jpg', 4, '2025-03-24 22:22:30', 4, 4, 4, 'upload/news_picture4.jpg', '<p>  最近和几名大一的学生聊天，几名同学认为身边的人普遍都很迷茫，不知道该干什么，业余时间要么是对着电脑、要么是抱着手机刷微博。我问道:“为什么不找点事情做做，制定一个计划，哪怕是锻炼身体也好?4年也可以把身体锻炼得结实些。”当然，我也清楚，我的这些建议对他们来说，未必能有多大用。许多学生因为意志不坚定，没有老师的监督、逼迫，根本就无法做到。</p><p>   这让我想到前段时间蹿红网络的“悔过励志帖”——《同学，我大四了》，作者回首自己的大学4年，他感叹投入精力“充其量不过40%”︰每天上网时间少则4个小时，多则10个小时;考试永远是画画重点，在高呼“60分万岁”中与奖学金无缘。作者借自己求职受挫，写帖子以警醒后来人，不要等毕业时再后悔，就业难不仅仅是大学、社会的问题，也是自身的问题。</p><p>  也许，这样的大学生不是一个两个，而是一个群体。然而，我总是怀疑这样的励志帖，甚至教师在课堂上苦口婆心地劝说，能对现实中的大学和大学生起到多大的影响和作用，很多时候恐怕只有“三分钟热度”的效应。毕竟，现实的窘境不是一天积累起来的，从小学到高中，学生们的学习都是被动地接受应试，隐藏着功利性的目的，也许从没有为主动学习感到过快乐，而在高中时代，有的教师甚至打出这样的励志宣言:等你考上大学，你就可以想干什么干什么了..…..乎，高中时代的目标是很清晰的，就是为了考上大学，而在一些高中生的眼里，大学甚至就好比是天堂，进了大学的门就可以放轻松了。</p><p> 此前，有很多声音都认为大学越来越像培训机构，功利性学习正在整个大学蔓延，考证热、过早地职业化都是大学功利性学习最好的表现形式。在这种批判的声音中，“培训机构”总有被贬低的意味，难与大学之学术思想殿堂的高雅相媲美。但是，在这种批判的背后，还有一个现实问题被遮蔽，那就是很多大学生对自己的学习、对大学生活没有任何目标。</p><p>暨南大学舆情研究中心曾就“当代广州大学生生活与思想现状”作过详细的问卷调查，其中，接受调查的广州高校在读本科生共有191份有效样本，就“读大学的原因”、“大学第一印象”、“专业选择首要因素”等问题制作问卷调查并进行分析。结果显示，在未来规划方面，73.3%的同学表示只有粗略的想法，并无非常明确的目标。</p><p>  如果说功利化的学习毕竟还有一个前进的目标，至少能体现出一种为了目标而奋斗的精神和奔头，而没有任何目标，漫无目的地混日子则更可怕，它体现的是一种虚无、意义的缺失。说实话，没有引导学生树立明确的奋斗目标、进而指引学生为之努力的大学，学生很难找到努力的方向，也找不到努力的意义，这还不如“培训机构”来得实在、来得有效用，至少，培训机构的目标很清晰，它能够给学生们一个实实在在看得见的效果，而没有任何目标、浑浑噩噩的大学生活，也许只会给很多学生带来悔过。</p><p>无论如何，混日子的大学生活是不可取的。一方面，高校应该在新生入学的时候，作好目标和方向的引导，甚至贯穿大学4年的学习过程;另一方面，还在迷途的大学生，应尽早为自己找个前进的方向，作好自我规划，对自己的未来和前途负责。</p>');
INSERT INTO `news` VALUES (5, '2025-03-24 22:22:30', '做个真正的学生', '最坚强的人，是以宽容的态度面对自己缺点的人，而懦弱的人，则不敢面对自己的缺点，最终自暴自弃，葬送自己。只要有进取心，我们都能从失败的领域中，发现到达成功的途径;只要有自信心，我们身上的每一个缺陷，也都可以成为与众不同的优点', '分类名称5', '发布人5', 'upload/news_headportrait5.jpg', 7, '2025-03-29 01:05:36', 5, 5, 5, 'upload/news_picture5.jpg', '<p>  最坚强的人，是以宽容的态度面对自己缺点的人，而懦弱的人，则不敢面对自己的缺点，最终自暴自弃，葬送自己。只要有进取心，我们都能从失败的领域中，发现到达成功的途径;只要有自信心，我们身上的每一个缺陷，也都可以成为与众不同的优点。</p><p>曾经有人特地赶赴日本，向三宅一生服装设计大师请教如何设计出独具一格的服装款式。三宅一生大师提出两个很有意思的观点:一是，设计的衣服，其实都是没有全部完成的，其余的创作空间，则是留给穿衣服的人去完成的;二是，选择布料时，会请厂商提供纺织、印染失败的布料，从这些“残次”的作品中寻找泉涌般的创作灵感，设计出最具独创性的作品。</p><p>这样一来，顾客才能穿出自己的风格，并使得同一件衣服，在不同的人身上，能有不同的效果。而且，以这样的概念设计出来的衣服，也不容易失败。正是因为这两个观点，三宅一生所设计的服装总是独一无二地能够引领世界潮流。</p><p>  在艺术家的眼中，任何事物都是创作的最好材料，不管是枯木还是残破的布料，对他们而言，都是最具生命力的事物，在他们手中都能画腐朽为神奇。</p><p>朽木也能精雕，更何况我们自己。那些看起来弯曲、盘旋、似乎毫无用处的木料，往往最终能成为艺术品的原材料，因为这种不同，才特别珍贵。花点心思，身上的缺点也能变成独特的优点，就像艺术家们一般，顺着曲折的木头，创造出与众不同、完美无缺的惊世杰作。</p><p>励志文章3:一生学习，成就一生无知的人并不是没有学问的人，而是不明了自己的人。当一个有学问的人信赖书本、知识和权威，借着它们而了解自己，那么他便是愚蠢的。了解是由自我认识而来，而自我认识乃是一个人明白他自己的整个心理过程。因此，教育的真正意义是自我了解，因为整个生活是汇聚于我们每个人的身心的最高“机密”。</p><p>   目前我们所谓的教育，只是由书本聚集见闻、知识，这是任何懂得阅读的人都办得到的。这种教育提供了一条巧妙的逃避自我之途，如同其他所有的逃避方式一样，它无可避免地制造出有增无减的苦难。冲突和混乱是由于我们和他人、事物、概念之间差错的关系而产生，除非我们了解此项关系而改变它，否则，知识的学习和堆砌，各种技能的获取，都只会将我们导向更深的混乱和毁灭。</p><p> 我们将子女送入学校，学习一些技能，并希望借此来带动整个家庭的长久繁荣，至少在家长们年老的时候有养老保险，有稳定的照顾。我们对孩子最急切的渴望，就是将他塑造成一个能在一个领域中出类拔萃之人，希望给予他一个安全的经济地位。物质的获得有时候并不难，然而，技术的训练能使我们了解自己吗?</p><p>虽然，懂得念书写字、学习土木工程或其他某种职业，是必需的，然而技术能给予我们了解生活的能力吗?技术，无疑是次要的;如果技术是我们惟一奋力以求的东西，那么我们就摒弃了生活中最主要的东西了。</p><p>    生活，是痛苦、喜悦、美、丑、爱等多种感受的综合，一旦我们将它整体地加以了解，那么这项了解在各方面都会创出它应有的技术。不过，相反的说法就不是真的了∶技术永远无法产生创造性的了解。</p><p>如果过分强调技术，我们便毁灭了人。磨练技能和效率，然而对生活却不了解，对思想、欲望的行踪不能领悟，只会使我们变得日益残暴无情，以致于触发战争，危害了我们肉体上的安全。由于我们的教育过重于单单培养技术，已经制造出许多科学家、数学家、造桥工程师、征服太空的人，但这些人了解生活的整体过程吗?一个专家能把生活本身完整地体验感受表达出来吗?或者他真的体验到生活了吗?有时候，当他不是专家时，反而更能直指生活的本质。一颗能够给予人辉煌一生的企图心，首先应当是一颗敏感的善良的热情的心，让我们对周围的一切保持孩童一样旺盛的好奇心。我们应当渴望了解新奇的事物，渴望探索未知的领域。只有在这种理念的支配下，我们才能不断地、孜孜以求地、乐此不疲地提升自己的认知和理解能力，改善自我，从而更接近成功的巅峰。</p>');
INSERT INTO `news` VALUES (6, '2025-03-24 22:22:30', '远大的目标是成功的磁石', '上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标', '分类名称6', '发布人6', 'upload/news_headportrait6.jpg', 7, '2025-03-29 00:27:46', 6, 6, 6, 'upload/news_picture6.jpg', '<p>  上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标。</p><p>    有大目标的人，生活永远是积极的，他们会朝着自己的目标不断前进;没有大目标的老实人浑浑噩噩，不思进取，最后被生活淘汰。</p><p> 从前有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。爸爸就从兜里掏出五枚硬币，把一枚硬币埋在草地里，把其余四枚放在阿巴格的手上，说:“人生有五枚金币，童年、少年、青年、中年、老年各有一枚，你现在才用了一枚，就是埋在草地里的那一枚，你不能把五枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。”在父亲的鼓励下，阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名十分优秀的船长。</p><p>  目标是与一个人的愿望相联系的，是对未来的一种设想，它往往和目前的行动不直接联系。但目标又不能脱离现实的生活，现实生活中的某些现象如果符合了个人的需要，与个人的世界观一致，这些现实的因素就会以个人目标的形式表现出来。目标总是对现实生活的重新加工，舍弃其中某些成分，又对某些因素给予强调的过程，但它必须以对客观规律的认识为基础，符合客观规律。</p><p> 能实现自己目标的老实人，对他个人而言，他是一个成功者，也是个幸福者。目标是成功的必要条件，虽然仅仅拥有目标，你不一定能取得成功;但是如果没有目标，成功对你而言就无从谈起。</p><p>远大的美好目标能吸引人努力为实现它而奋斗不止。</p>');
INSERT INTO `news` VALUES (7, '2025-03-24 22:22:30', '做一个最好的自己', '自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费', '分类名称7', '发布人7', 'upload/news_headportrait7.jpg', 11, '2025-03-29 00:59:01', 8, 7, 7, 'upload/news_picture7.jpg', '<p>自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费。</p><p>我们大家都知道的人大脑拥有140亿个脑细胞，但我们思维意识只利用了脑细胞的很少部分，如能将更多的脑细胞从睡眠中激活出来，人的思维意识将更加强大。如果我们都能充满自信，就能创造人间奇迹，亦能创造一个最好的自己。</p><p> 一个人相信自己是什么，就会是什么。一个人心里怎样想，就会成为怎样的人。这从心里学上讲是有一定的道理的。我们每一个人心里都有一幅心里蓝图，或是一幅自画像，有人称它为运作结果。如果你想象的是做最好的你，那么你就会在你内心的荧光屏上看到一个踌躇满志、不断进取、勇于开拓创新的自我。同时还会经常收到我做的很好，我以后还会做的更好之类的信息，这样你注定会成为一个最好的你。美国哲学家爱默生说:“人的一生正如他一天中所想的那样，你怎么想，怎么期待，就有怎样的人生。”美国有名的钢铁大王安德鲁·卡耐基就是一个充分发挥自己创造机会的楷模。他12岁时由英格兰移居美国，先是在一家纺织厂做工人，当时他的目标是“做全厂最出色的工人。”因为他经常这样想，以这样做，最终他实现了他的目标。后来命运有安排他当邮递员，他想的是怎样成为“全美最杰出的邮递员。”结果他的这一目标也实现了。他的一生总是根据自己所处的环境和地位塑造最佳的自己，他的座右铭就是“相信自己是最棒的。“</p><p>做一个最好的自己，不一定非要当什么“家”，也不一定非要出什么“名”，更不要与别人比高低、比大小。就像人的手指，有大有小，有长有短，他们各有所长，各有所短，你能说拇指比食指好吗?决定最好的你，既不是你拥有的物质财富的多少，也不是你身份的贵贱，关键是看你是否拥有实现自己理想的强烈愿望的程度，看你身上的潜力能否充分发挥。人们熟知的一些英雄模范，就是在平凡的工作岗位上充分发挥人的创新能力，做好自己身边的每一件小事，创造了做好的自己。</p><p>“塑造一个最好的自己”，这个目标人人都可以实现。你只意识到自己是大自然的一分子，坚信自己拥有“无限的能力”与“无限的可能”，这种坚定的信心能帮助你创造和谐的心理、生理韵律，建立起自己理想的自我形象，体现自己人格行为应该具有的魅力。</p>');
INSERT INTO `news` VALUES (8, '2025-03-24 22:22:30', '有了梦想就不会感到疲惫', '一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃', '分类名称8', '发布人8', 'upload/news_headportrait8.jpg', 10, '2025-03-28 15:46:14', 8, 8, 8, 'upload/news_picture8.jpg', '<p>  一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃。</p><p>“峣峣者易折，皎皎者易污。”能够从内地高校到香港读书的学子，都是一些很优秀的年轻人。不知道曾经高居象牙塔的书生，怎样狠下心，咬牙面对那一个天渊般的落差，以及旁人的目光和议论。</p><p>  说到这里，很像一个《读者》式的励志故事。但是这种励志故事从来就不缺乏感动人的力量，因为虽然光明的尾巴不是人人都能够拥有，但是人人都有梦想，面对实现过程中的困难，其奋斗或者说挣扎，却常常和平凡如你我的人们相遇。</p><p>    《当幸福来敲门/The Pursuit of Happyness》就是这样偶然被看到，又感动了我的电影。黑人克里斯是一名普普通通的医疗器械推销员，妻子忍受不了经济上的压力离开了他，留下5岁的儿子克里斯托夫和他相依为命。克里斯银行账户里只剩下21块钱，因为没钱付房租，他和儿子被撵出了公寓。费尽周折，克里斯赢得了在一家着名股票投资公司实习的机会，但是实习期间没有薪水，而且最终只有一人可以成功进入公司。</p><p>    学妹曾经告诉我一个故事，让我每次想到都觉得莫名恐怖。她说，她硕士毕业去广东求职，一个中学要招几个老师，结果南来北往的硕士博士挤了快有一个礼堂。可想而知，竞争有多么残酷。看来，中外求职者都面临着同样的挑战。但是克里斯和许多“80后”的大学毕业生不同，他更加坚韧:为了节省时间，上班时候不喝水，以避免上厕所。以疯狂的速度给客户打电话，打完一个，直接按挂机键就拨下一个电话。白天，克里斯忍受着一次又一次被拒绝的失望，带着微笑在公司和客户之间穿梭。回家，则要带着儿子穿过污秽的街道，忍受房东的咆哮。</p><p>    终于，交不起房租的父子俩流落街头。克里斯和儿子在午夜地铁里相对无言，儿子不能理解为什么不能回家住，爸爸却开始玩游戏:“我们通过时光机，到达古代了!”儿子立刻兴奋地配合起来，环顾左右。父子俩在“恐龙”的追杀下，逃到了一个“山洞”里，“山洞”是什么呢，其实是一间男厕所。克里斯搂着熟睡的儿子，坐靠在厕所的墙面。午夜的灯光很惨白，这个消瘦的、营养不良的父亲，默默地流下了泪水。</p><p>    父子俩依旧为了幸福到来而努力。他们开始住收容所，面对有限的床位，这个奔跑起来像猎豹一样的人，有时候得把草原上的爆发力运用到打架上面来。儿子在简陋的收容所床上睡着了，父亲还在埋头修理推销的医疗器械，或者翻那本厚厚的笔试全书。</p><p>   钱包磨损得厉害，而且，太瘪了，每张钱都很熟悉。老板要借5块钱，犹豫再三，摩挚着纸币，最终还是把钱送了出去。卖血。鲜血在塑料袋里面渗开，那是一个男人所能奉献的最后。拿着卖血的钱，克里斯仍然去买电子元件。一点点的希望，都要去坚持。</p><p>对于父母，最心酸的事儿是什么呢?就是子女的一点可怜的愿望得不到满足。克里斯托夫的惟一的玩偶“美国英雄”，在一次挤车的过程中掉到了地上。5岁的男孩悲伤欲绝，克里斯坚硬的表情下，读出的是面对困难的凶狠和惨痛。但是，无论多么深切的无望，都没有摧毁父子间的亲情与他们的信念，他们相信幸福总会落到自己的身上。“你是个好爸爸”，克里斯托夫跟着爸爸四处流浪，可是孩子的心灵，衡量的砝码和天使是—样的。</p><p>  克里斯最终成为了投资公司的员工，看似冷漠的白人老板们，此时显出他们的些微温情。他忍住了泪水，颤抖着拿起自己的物品，走入了茫茫人海。在熙熙攘攘的人群中间，克里斯举起手，为自己鼓掌，那无声的，一下下重重的掌声，是在为自己喝彩。其实，克里斯托夫的“美国英雄”并没有失落。</p><p>  这是一个非常典型的“美国梦”:一个人通过自己的努力，可以实现自己的梦想，幸福，会来敲门。很多人往往会关注对于梦想的树立，而往往忽略过程的艰辛。特别是，当面对一个看似无望的现实的时候，有多少人会坚持，多少人会放弃呢?生活总是在不断地修正，并且提醒我们，顺应大潮的人总是较有可能抵达成功的彼岸。可是，确实是有些人，愿意逆流而上。我相信，这是导演对于逆行者的一点鼓励。</p><p>那个香港的匿名毕业生后来博士毕业，找到了一份不错的工作，有了漂亮的妻子和可爱的孩子。这个强人在帖子里说，有什么坚持不下来的呢?只要有梦想</p>');
INSERT INTO `news` VALUES (9, '2025-03-29 01:01:46', '中国游泳大项取得突破', '\n2月的多哈世锦赛上，中国游泳队夺得7枚金牌并打破一项世界纪录', '', '', '', 4, '2025-03-29 01:05:45', 0, 0, 0, 'upload/1743181237763.png', '<p><strong style=\"color: rgb(51, 51, 51);\">2月的多哈世锦赛上，中国游泳队夺得7枚金牌并打破一项世界纪录，开启突破之年。巴黎奥运会上，潘展乐打破自己保持的男子100米自由泳世界纪录并夺金，还与队友徐嘉余、覃海洋、孙佳俊（王长浩，预赛）一起夺得男子4x100米混合泳接力冠军，打破美国队在该项目奥运金牌上40年的垄断；中国花样游泳队实现队史奥运金牌“零突破”，夺得集体和双人项目两金；中国跳水队首次包揽全部金牌。</strong></p><p><strong style=\"color: rgb(51, 51, 51);\"><img src=\"https://pics5.baidu.com/feed/d439b6003af33a8723d017518dd536375243b550.jpeg@f_auto?token=545281e8d96a43948f0b149922c94d04\" width=\"1000\"></strong></p>');
INSERT INTO `news` VALUES (10, '2025-03-29 01:03:27', '第十四届全国冬季运动会在内蒙古自治区举行', '2月17日至27日，第十四届全国冬季运动会在内蒙古自治区举行，创下多项“首次”', '', '', '', 3, '2025-03-29 01:05:41', 0, 0, 0, 'upload/1743181397941.png', '<p>2月17日至27日，第十四届全国冬季运动会在内蒙古自治区举行，创下多项“首次”：北京冬奥会后我国首次举办全国冬季综合性体育赛事，首次设置群众比赛项目，首次以省区市为单位组团参赛，第一次全面对标冬奥会设项，内蒙古首次承办全国综合性赛事等。</p><p><img src=\"https://pics1.baidu.com/feed/622762d0f703918f297e3c531ab4009858eec410.jpeg@f_auto?token=1833f6584e3718119bdd1f4d2fd2912a\" width=\"1000\"></p><p>2月17日，第十四届全国冬季运动会主火炬在开幕式上被点燃。</p>');
INSERT INTO `news` VALUES (11, '2025-03-29 01:07:15', '中国羽毛球队时隔12年再度包揽汤姆斯杯、尤伯杯', '中国男、女羽毛球队时隔12年再度包揽汤尤杯。', '', '', '', 0, NULL, 0, 0, 0, 'upload/1743181634105.png', '<p><br></p><p>5月5日，中国男、女羽毛球队在成都举行的汤姆斯杯暨尤伯杯决赛中均战胜印度尼西亚队，夺得队史第11座汤姆斯杯和第16座尤伯杯，时隔12年再度包揽汤尤杯。</p><p><img src=\"https://pics1.baidu.com/feed/203fb80e7bec54e71da2cb60f2b1bd5f4ec26a9e.jpeg@f_auto?token=dc3d6b576b3fea1a677953c2be8ea9c3\" width=\"1000\"></p><p>5月5日，中国队成员在颁奖仪式上庆祝夺冠。新华社记者江宏景摄</p>');

-- ----------------------------
-- Table structure for newstype
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `typename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '体育资讯分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES (1, '2025-03-24 22:22:30', '分类名称1');
INSERT INTO `newstype` VALUES (2, '2025-03-24 22:22:30', '分类名称2');
INSERT INTO `newstype` VALUES (3, '2025-03-24 22:22:30', '分类名称3');
INSERT INTO `newstype` VALUES (4, '2025-03-24 22:22:30', '分类名称4');
INSERT INTO `newstype` VALUES (5, '2025-03-24 22:22:30', '分类名称5');
INSERT INTO `newstype` VALUES (6, '2025-03-24 22:22:30', '分类名称6');
INSERT INTO `newstype` VALUES (7, '2025-03-24 22:22:30', '分类名称7');
INSERT INTO `newstype` VALUES (8, '2025-03-24 22:22:30', '分类名称8');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'yundongshangpin' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double NOT NULL DEFAULT 0 COMMENT '价格',
  `total` double NOT NULL DEFAULT 0 COMMENT '总价格',
  `type` int(11) NULL DEFAULT 1 COMMENT '支付类型',
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `logistics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '物流',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `sfsh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核回复',
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户角色',
  `returnreason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退货原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2025-03-27 16:22:58', '202532716225891', 'yundongshangpin', 1742975369339, 12, '网球挂件', 'upload/1743060557177.jpg', 1, 12, 12, 1, '已支付', '幸福家园', '17314192870', '111', NULL, '', '', NULL, 'yonghu', NULL);
INSERT INTO `orders` VALUES (2, '2025-03-27 16:22:58', '202532716225893', 'yundongshangpin', 1742975369339, 15, '透卡', 'upload/1743060864622.jpg', 1, 12, 12, 1, '已发货', '幸福家园', '17314192870', '111', NULL, '', '', NULL, 'yonghu', NULL);

-- ----------------------------
-- Table structure for shangpinfenlei
-- ----------------------------
DROP TABLE IF EXISTS `shangpinfenlei`;
CREATE TABLE `shangpinfenlei`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinfenlei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shangpinfenlei
-- ----------------------------
INSERT INTO `shangpinfenlei` VALUES (1, '2025-03-24 22:22:29', '运动器材');
INSERT INTO `shangpinfenlei` VALUES (2, '2025-03-24 22:22:29', '运动服饰');
INSERT INTO `shangpinfenlei` VALUES (3, '2025-03-24 22:22:29', '运动周边');

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1, '2025-03-26 16:10:34', 1742975369339, 8, 'bisaixinxi', '比赛名称8', 'upload/bisaixinxi_xuanchuantupian8.jpg', '21', NULL, NULL);
INSERT INTO `storeup` VALUES (2, '2025-03-27 17:44:24', 1743068578993, 9, 'bisaixinxi', '比赛名称9', 'upload/1742991710057.jpg', '1', NULL, NULL);
INSERT INTO `storeup` VALUES (3, '2025-03-28 15:46:00', 1742975369339, 9, 'bisaixinxi', '比赛名称9', 'upload/1742991710057.jpg', '1', NULL, NULL);
INSERT INTO `storeup` VALUES (4, '2025-03-29 00:27:44', 1742975369339, 7, 'news', '做一个最好的自己', 'upload/news_picture7.jpg', '21', NULL, NULL);
INSERT INTO `storeup` VALUES (5, '2025-03-29 00:33:12', 18, 4, 'forum', '帖子标题4', 'upload/forum_cover4.jpg', '21', NULL, NULL);
INSERT INTO `storeup` VALUES (7, '2025-03-29 00:39:32', 1742975369339, 10, 'forum', '超越胜负的力量', 'upload/1743179945217.jpg', '21', NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 11, '用户账号1', 'yonghu', '用户', 'w069dd9qyygxq7f7xyliv4nkj8421h11', '2025-03-24 22:26:42', '2025-03-24 23:26:42');
INSERT INTO `token` VALUES (2, 1, 'admin', 'users', '管理员', 'wmil4hkzjka4hk4hmupk888ggjpyg85k', '2025-03-26 14:03:54', '2025-03-30 22:53:49');
INSERT INTO `token` VALUES (3, 1742975369339, '111', 'yonghu', '用户', 'vu6y51reurvptyh8k1p3vtgydci2bjlg', '2025-03-26 15:49:35', '2025-03-30 01:48:53');
INSERT INTO `token` VALUES (4, 1743068578993, '222', 'yundongyuan', '运动员', 'm8a97pgg0iqnmjqr7m9f7eih8rlz4myg', '2025-03-27 17:43:06', '2025-03-30 02:14:28');
INSERT INTO `token` VALUES (5, 1743069141925, '333', 'jiaolianyuan', '教练员', 'mg12uiw2g8lqlto0p8n03peh0j1gb3rk', '2025-03-27 17:52:27', '2025-03-30 02:25:18');
INSERT INTO `token` VALUES (6, 18, '用户账号8', 'yonghu', '用户', '1ztisd107rmdu54vrl26j9cge9ufl265', '2025-03-29 00:32:32', '2025-03-29 01:32:53');
INSERT INTO `token` VALUES (7, 1743180220122, '444', 'yonghu', '用户', 'p6zbgjecwnuvdcef1bc4colwu74f38n6', '2025-03-29 00:43:49', '2025-03-29 01:43:50');

-- ----------------------------
-- Table structure for toupiao
-- ----------------------------
DROP TABLE IF EXISTS `toupiao`;
CREATE TABLE `toupiao`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运动员姓名',
  `toupiaoshijian` datetime NULL DEFAULT NULL COMMENT '投票时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `toupiaoshu` int(11) NULL DEFAULT NULL COMMENT '投票数',
  `toupiaobeizhu` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投票备注',
  `crossuserid` bigint(20) NULL DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) NULL DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '投票' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toupiao
-- ----------------------------
INSERT INTO `toupiao` VALUES (1, '2025-03-24 22:22:29', '运动员姓名1', '2025-03-24 22:22:29', '用户账号1', '用户姓名1', 1, '投票备注1', 1, 1);
INSERT INTO `toupiao` VALUES (2, '2025-03-24 22:22:29', '运动员姓名2', '2025-03-24 22:22:29', '用户账号2', '用户姓名2', 1, '投票备注2', 2, 2);
INSERT INTO `toupiao` VALUES (3, '2025-03-24 22:22:29', '运动员姓名3', '2025-03-24 22:22:29', '用户账号3', '用户姓名3', 1, '投票备注3', 3, 3);
INSERT INTO `toupiao` VALUES (4, '2025-03-24 22:22:29', '运动员姓名4', '2025-03-24 22:22:29', '用户账号4', '用户姓名4', 1, '投票备注4', 4, 4);
INSERT INTO `toupiao` VALUES (5, '2025-03-24 22:22:29', '运动员姓名5', '2025-03-24 22:22:29', '用户账号5', '用户姓名5', 1, '投票备注5', 5, 5);
INSERT INTO `toupiao` VALUES (6, '2025-03-24 22:22:29', '运动员姓名6', '2025-03-24 22:22:29', '用户账号6', '用户姓名6', 1, '投票备注6', 6, 6);
INSERT INTO `toupiao` VALUES (7, '2025-03-24 22:22:29', '运动员姓名7', '2025-03-24 22:22:29', '用户账号7', '用户姓名7', 1, '投票备注7', 7, 7);
INSERT INTO `toupiao` VALUES (8, '2025-03-24 22:22:29', '运动员姓名8', '2025-03-24 22:22:29', '用户账号8', '用户姓名8', 1, '投票备注8', 8, 8);
INSERT INTO `toupiao` VALUES (9, '2025-03-24 22:26:47', '姓名8', '2025-03-24 22:25:03', '用户账号1', '用户姓名1', 1, '', 11, 28);
INSERT INTO `toupiao` VALUES (10, '2025-03-26 18:14:49', '姓名2', '2025-03-26 18:14:44', '111', '张三', 0, '', 1742975369339, 22);
INSERT INTO `toupiao` VALUES (11, '2025-03-27 17:47:33', '孙莎莎', '2025-03-27 17:47:32', '', '', 0, '', 1743068578993, 1743068578993);
INSERT INTO `toupiao` VALUES (12, '2025-03-28 15:20:49', '孙莎莎', '2025-03-28 15:20:08', '111', '张三', 0, '', 1742975369339, 1743068578993);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', 'upload/1742988987978.jpg', '管理员', '2025-03-24 22:22:30');

-- ----------------------------
-- Table structure for xunlianjihua
-- ----------------------------
DROP TABLE IF EXISTS `xunlianjihua`;
CREATE TABLE `xunlianjihua`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jihuamingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划名称',
  `leixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `xunlianrenwu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '训练任务',
  `tupian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `jiaoliangonghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教练工号',
  `shangchuanshijian` datetime NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '训练计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xunlianjihua
-- ----------------------------
INSERT INTO `xunlianjihua` VALUES (1, '2025-03-24 22:22:29', '计划名称1', '类型1', '训练任务1', 'upload/xunlianjihua_tupian1.jpg,upload/xunlianjihua_tupian2.jpg,upload/xunlianjihua_tupian3.jpg', '教练工号1', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (2, '2025-03-24 22:22:29', '计划名称2', '类型2', '训练任务2', 'upload/xunlianjihua_tupian2.jpg,upload/xunlianjihua_tupian3.jpg,upload/xunlianjihua_tupian4.jpg', '教练工号2', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (3, '2025-03-24 22:22:29', '计划名称3', '类型3', '训练任务3', 'upload/xunlianjihua_tupian3.jpg,upload/xunlianjihua_tupian4.jpg,upload/xunlianjihua_tupian5.jpg', '教练工号3', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (4, '2025-03-24 22:22:29', '计划名称4', '类型4', '训练任务4', 'upload/xunlianjihua_tupian4.jpg,upload/xunlianjihua_tupian5.jpg,upload/xunlianjihua_tupian6.jpg', '教练工号4', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (5, '2025-03-24 22:22:29', '计划名称5', '类型5', '训练任务5', 'upload/xunlianjihua_tupian5.jpg,upload/xunlianjihua_tupian6.jpg,upload/xunlianjihua_tupian7.jpg', '教练工号5', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (6, '2025-03-24 22:22:29', '计划名称6', '类型6', '训练任务6', 'upload/xunlianjihua_tupian6.jpg,upload/xunlianjihua_tupian7.jpg,upload/xunlianjihua_tupian8.jpg', '教练工号6', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (7, '2025-03-24 22:22:29', '计划名称7', '类型7', '训练任务7', 'upload/xunlianjihua_tupian7.jpg,upload/xunlianjihua_tupian8.jpg,upload/xunlianjihua_tupian1.jpg', '教练工号7', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (8, '2025-03-24 22:22:29', '计划名称8', '类型8', '训练任务8', 'upload/xunlianjihua_tupian8.jpg,upload/xunlianjihua_tupian1.jpg,upload/xunlianjihua_tupian2.jpg', '教练工号8', '2025-03-24 22:22:29');
INSERT INTO `xunlianjihua` VALUES (9, '2025-03-28 16:30:24', '体能训练', '', '. 动态热身（10-15分钟）\n激活肌肉、提高心率、预防受伤：\n\n高抬腿跑（30秒×2组）\n\n开合跳（30秒×2组）\n\n弓步转体（每侧10次）\n\n侧向跨步蹲（左右各8次）\n\n动态拉伸（肩部绕环、髋关节摆动等）\n\n2. 力量训练（30分钟）\n注：每组动作间休息30-60秒，循环2-3轮。\n\n动作	组数×次数	目标肌群\n深蹲	3×12-15	下肢（臀腿）\n俯卧撑	3×10-12	胸肌、三头肌\n硬拉（哑铃/杠铃）	3×10	后链肌群（臀、背）\n引体向上（辅助）	3×8	背部、肱二头肌\n平板支撑	3×30-60秒	核心肌群\n3. 心肺耐力训练（20分钟）\n选择1种有氧运动，强度控制在「说话稍费力」：\n\n跑步/爬坡（配速6-8分/公里）\n\n跳绳（间歇式：1分钟快跳+30秒休息，重复10组）\n\n战绳训练（20秒全力+40秒休息，共8组）\n\n游泳/骑行（中等强度持续20分钟）', 'upload/1743150622189.jpg', '333', '2025-03-28 16:26:57');
INSERT INTO `xunlianjihua` VALUES (10, '2025-03-29 18:24:23', '', '', '113232134', '', '333', '2025-03-29 18:22:31');

-- ----------------------------
-- Table structure for xunlianjilu
-- ----------------------------
DROP TABLE IF EXISTS `xunlianjilu`;
CREATE TABLE `xunlianjilu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jihuamingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划名称',
  `leixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `xunlianjilu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '训练记录',
  `fengmian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '封面',
  `shipin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '视频',
  `zhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `jiaoliangonghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教练工号',
  `shangchuanshijian` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `sfsh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '训练记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xunlianjilu
-- ----------------------------
INSERT INTO `xunlianjilu` VALUES (1, '2025-03-24 22:22:29', '计划名称1', '类型1', '训练记录1', 'upload/xunlianjilu_fengmian1.jpg,upload/xunlianjilu_fengmian2.jpg,upload/xunlianjilu_fengmian3.jpg', '', '账号1', '姓名1', '教练工号1', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (2, '2025-03-24 22:22:29', '计划名称2', '类型2', '训练记录2', 'upload/xunlianjilu_fengmian2.jpg,upload/xunlianjilu_fengmian3.jpg,upload/xunlianjilu_fengmian4.jpg', '', '账号2', '姓名2', '教练工号2', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (3, '2025-03-24 22:22:29', '计划名称3', '类型3', '训练记录3', 'upload/xunlianjilu_fengmian3.jpg,upload/xunlianjilu_fengmian4.jpg,upload/xunlianjilu_fengmian5.jpg', '', '账号3', '姓名3', '教练工号3', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (4, '2025-03-24 22:22:29', '计划名称4', '类型4', '训练记录4', 'upload/xunlianjilu_fengmian4.jpg,upload/xunlianjilu_fengmian5.jpg,upload/xunlianjilu_fengmian6.jpg', '', '账号4', '姓名4', '教练工号4', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (5, '2025-03-24 22:22:29', '计划名称5', '类型5', '训练记录5', 'upload/xunlianjilu_fengmian5.jpg,upload/xunlianjilu_fengmian6.jpg,upload/xunlianjilu_fengmian7.jpg', '', '账号5', '姓名5', '教练工号5', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (6, '2025-03-24 22:22:29', '计划名称6', '类型6', '训练记录6', 'upload/xunlianjilu_fengmian6.jpg,upload/xunlianjilu_fengmian7.jpg,upload/xunlianjilu_fengmian8.jpg', '', '账号6', '姓名6', '教练工号6', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (7, '2025-03-24 22:22:29', '计划名称7', '类型7', '训练记录7', 'upload/xunlianjilu_fengmian7.jpg,upload/xunlianjilu_fengmian8.jpg,upload/xunlianjilu_fengmian1.jpg', '', '账号7', '姓名7', '教练工号7', '2025-03-24 22:22:29', '是', '');
INSERT INTO `xunlianjilu` VALUES (8, '2025-03-24 22:22:29', '计划名称8', '类型8', '训练记录8', 'upload/xunlianjilu_fengmian8.jpg,upload/xunlianjilu_fengmian1.jpg,upload/xunlianjilu_fengmian2.jpg', '', '账号8', '姓名8', '教练工号8', '2025-03-24 22:22:29', '是', '');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `touxiang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `nianling` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `shouji` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `money` double NULL DEFAULT 0 COMMENT '余额',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`yonghuzhanghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743180220123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2025-03-24 22:22:29', '用户账号1', '123456', '用户姓名1', 'upload/yonghu_touxiang1.jpg', '男', 1, '13823888881', 200, 0);
INSERT INTO `yonghu` VALUES (12, '2025-03-24 22:22:29', '用户账号2', '123456', '用户姓名2', 'upload/yonghu_touxiang2.jpg', '男', 2, '13823888882', 200, 0);
INSERT INTO `yonghu` VALUES (13, '2025-03-24 22:22:29', '用户账号3', '123456', '用户姓名3', 'upload/yonghu_touxiang3.jpg', '男', 3, '13823888883', 200, 0);
INSERT INTO `yonghu` VALUES (14, '2025-03-24 22:22:29', '用户账号4', '123456', '用户姓名4', 'upload/yonghu_touxiang4.jpg', '男', 4, '13823888884', 200, 0);
INSERT INTO `yonghu` VALUES (15, '2025-03-24 22:22:29', '用户账号5', '123456', '用户姓名5', 'upload/yonghu_touxiang5.jpg', '男', 5, '13823888885', 200, 0);
INSERT INTO `yonghu` VALUES (16, '2025-03-24 22:22:29', '用户账号6', '123456', '用户姓名6', 'upload/yonghu_touxiang6.jpg', '男', 6, '13823888886', 200, 0);
INSERT INTO `yonghu` VALUES (17, '2025-03-24 22:22:29', '用户账号7', '123456', '用户姓名7', 'upload/yonghu_touxiang7.jpg', '男', 7, '13823888887', 200, 0);
INSERT INTO `yonghu` VALUES (18, '2025-03-24 22:22:29', '用户账号8', '123456', '用户姓名8', 'upload/yonghu_touxiang8.jpg', '男', 8, '13823888888', 200, 0);
INSERT INTO `yonghu` VALUES (1742975369339, '2025-03-26 15:49:29', '111', '123', '张三', 'upload/1742975309108.png', '', 22, '13547483236', 39999, 0);
INSERT INTO `yonghu` VALUES (1743180220122, '2025-03-29 00:43:40', '444', '444', '椰子', 'upload/1743180204397.jpeg', '男', 16, '15634254634', 0, 0);

-- ----------------------------
-- Table structure for yundongshangpin
-- ----------------------------
DROP TABLE IF EXISTS `yundongshangpin`;
CREATE TABLE `yundongshangpin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品分类',
  `pinpai` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌',
  `guige` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `fengmian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '封面',
  `shangjiariqi` date NULL DEFAULT NULL COMMENT '上架日期',
  `shangpinjieshao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品介绍',
  `onelimittimes` int(11) NULL DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) NULL DEFAULT NULL COMMENT '库存',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  `discussnum` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `price` double NOT NULL COMMENT '价格',
  `onshelves` int(11) NULL DEFAULT 1 COMMENT '是否上架(1:上架，0:下架)',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `yundongshangpin_price`(`price`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yundongshangpin
-- ----------------------------
INSERT INTO `yundongshangpin` VALUES (1, '2025-03-24 22:22:29', '篮球1', '运动器材', '品牌1', '规格1', 'upload/yundongshangpin_fengmian1.jpg,upload/yundongshangpin_fengmian2.jpg', '2025-03-24', '<p>商品介绍1</p>', 1, 99, '2025-03-26 20:31:32', 3, 0, 99.9, 1, 1);
INSERT INTO `yundongshangpin` VALUES (2, '2025-03-24 22:22:29', '篮球2', '运动器材', '品牌2', '规格2', 'upload/yundongshangpin_fengmian2.jpg', '2025-03-24', '<p>商品介绍2</p>', 2, 99, '2025-03-26 20:31:09', 3, 0, 99.9, 1, 2);
INSERT INTO `yundongshangpin` VALUES (3, '2025-03-24 22:22:29', '篮球鞋1', '运动服饰', '品牌3', '规格3', 'upload/yundongshangpin_fengmian3.jpg,upload/yundongshangpin_fengmian5.jpg', '2025-03-24', '<p>商品介绍3</p>', 3, 99, '2025-03-26 20:31:45', 4, 0, 99.9, 1, 3);
INSERT INTO `yundongshangpin` VALUES (4, '2025-03-24 22:22:29', '篮球2', '运动器材', '品牌4', '规格4', 'upload/yundongshangpin_fengmian6.jpg', '2025-03-24', '<p>商品介绍4</p>', 4, 99, '2025-03-26 20:33:29', 5, 0, 99.9, 1, 4);
INSERT INTO `yundongshangpin` VALUES (8, '2025-03-24 22:22:29', '篮球鞋', '运动服饰', '品牌8', '规格8', 'upload/yundongshangpin_fengmian8.jpg', '2025-03-24', '<p>商品介绍8</p>', 8, 99, '2025-03-26 20:37:19', 9, 0, 99.9, 1, 8);
INSERT INTO `yundongshangpin` VALUES (9, '2025-03-26 20:47:32', '乒乓球拍', '运动器材', '李宁', '', 'upload/1742993135459.jpg', '2025-03-26', '', 1, 778, '2025-03-26 20:47:55', 1, 0, 23, 1, 0);
INSERT INTO `yundongshangpin` VALUES (10, '2025-03-26 20:53:56', '羽毛球拍', '运动器材', '品牌4', '', 'upload/1742993576884.jpg', '2025-03-26', '', 1, 323, NULL, 0, 0, 678, 1, 0);
INSERT INTO `yundongshangpin` VALUES (11, '2025-03-27 13:27:39', '篮球钥匙扣', '运动周边', '品牌', '', 'upload/1743053247748.jpg', '2025-03-27', '', 1, 323, NULL, 0, 0, 21, 1, 0);
INSERT INTO `yundongshangpin` VALUES (12, '2025-03-27 15:29:54', '网球挂件', '运动周边', '品牌', '', 'upload/1743060557177.jpg,upload/1743060562628.jpg', '2025-03-27', '', 1, 233, '2025-03-28 15:39:22', 4, 0, 12, 1, 0);
INSERT INTO `yundongshangpin` VALUES (13, '2025-03-27 15:30:43', '网球挂件2', '运动周边', '品牌', '', 'upload/1743060603314.jpg', '2025-03-27', '', 1, 453, NULL, 0, 0, 23, 1, 0);
INSERT INTO `yundongshangpin` VALUES (14, '2025-03-27 15:33:07', '运动服', '运动服饰', '品牌', '', 'upload/1743060764434.jpg', '2025-03-27', '', 1, 453, '2025-03-27 16:09:06', 1, 0, 77, 1, 0);
INSERT INTO `yundongshangpin` VALUES (15, '2025-03-27 15:34:47', '透卡', '运动周边', '品牌', '', 'upload/1743060864622.jpg', '2025-03-27', '', 1, 455, '2025-03-27 16:23:23', 4, 0, 12, 1, 0);
INSERT INTO `yundongshangpin` VALUES (16, '2025-03-27 15:35:30', '拳击手套', '运动器材', '品牌', '', 'upload/1743060901711.jpg', '2025-03-27', '', 1, 34, '2025-03-27 17:52:31', 1, 0, 98, 1, 0);

-- ----------------------------
-- Table structure for yundongyuan
-- ----------------------------
DROP TABLE IF EXISTS `yundongyuan`;
CREATE TABLE `yundongyuan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `mima` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `touxiang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `xingbie` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `nianling` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `shoujihaoma` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `toupiaoshu` int(11) NULL DEFAULT NULL COMMENT '投票数',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  `money` double NULL DEFAULT 0 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhanghao`(`zhanghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743068578994 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yundongyuan
-- ----------------------------
INSERT INTO `yundongyuan` VALUES (21, '2025-03-24 22:22:29', '账号1', '123456', '姓名1', 'upload/1743074056014.jpg', '男', 1, '13823888881', 1, 1, 200);
INSERT INTO `yundongyuan` VALUES (22, '2025-03-24 22:22:29', '账号2', '123456', '姓名2', 'upload/1742984060366.jpg', '男', 2, '13823888882', 2, 2, 200);
INSERT INTO `yundongyuan` VALUES (23, '2025-03-24 22:22:29', '账号3', '123456', '姓名3', 'upload/yundongyuan_touxiang3.jpg', '男', 3, '13823888883', 3, 3, 200);
INSERT INTO `yundongyuan` VALUES (24, '2025-03-24 22:22:29', '账号4', '123456', '姓名4', 'upload/yundongyuan_touxiang4.jpg', '男', 4, '13823888884', 4, 4, 200);
INSERT INTO `yundongyuan` VALUES (25, '2025-03-24 22:22:29', '账号5', '123456', '姓名5', 'upload/yundongyuan_touxiang5.jpg', '男', 5, '13823888885', 5, 5, 200);
INSERT INTO `yundongyuan` VALUES (26, '2025-03-24 22:22:29', '账号6', '123456', '姓名6', 'upload/yundongyuan_touxiang6.jpg', '男', 6, '13823888886', 6, 6, 200);
INSERT INTO `yundongyuan` VALUES (27, '2025-03-24 22:22:29', '账号7', '123456', '姓名7', 'upload/yundongyuan_touxiang7.jpg', '男', 7, '13823888887', 7, 7, 200);
INSERT INTO `yundongyuan` VALUES (28, '2025-03-24 22:22:29', '账号8', '123456', '姓名8', 'upload/yundongyuan_touxiang8.jpg', '男', 8, '13823888888', 9, 8, 200);
INSERT INTO `yundongyuan` VALUES (1743068578993, '2025-03-27 17:42:58', '222', '222', '孙莎莎', 'upload/1743068563782.jpg', '女', 25, '15637652459', 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
