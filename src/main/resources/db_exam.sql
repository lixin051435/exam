/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_exam

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-05-25 19:14:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `account` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` varchar(64) NOT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('162186994305254', '长跑八百米第一名', '5', '-1', '162185639453497', '张三');
INSERT INTO `apply` VALUES ('162187056160482', '2121', '33', '1', '162185639453497', '张三');
INSERT INTO `apply` VALUES ('162187113228371', '长跑八百米第儿名', '1', '1', '162185639453497', '张三');
INSERT INTO `apply` VALUES ('162187230736215', '111', '12', '1', '162185643131651', '李四');
INSERT INTO `apply` VALUES ('162191882490467', '唱歌比赛第一名', '10', '1', '162185639453497', '张三');
INSERT INTO `apply` VALUES ('162191907782939', '辩论赛第一名', '4', '-1', '162185639453497', '张三');
INSERT INTO `apply` VALUES ('162191912642401', '唱歌比赛优秀奖', '10', '1', '162185643131651', '李四');
INSERT INTO `apply` VALUES ('162194087653202', '当志愿者', '1', '1', '162194079959018', '张三丰');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('162185721672805', 'C语言基础');
INSERT INTO `course` VALUES ('162185641548857', '大学英语');
INSERT INTO `course` VALUES ('162185637873762', '线性代数');
INSERT INTO `course` VALUES ('162185644582572', '计算机基础');
INSERT INTO `course` VALUES ('162185637209250', '高等数学');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` varchar(64) NOT NULL,
  `student_id` varchar(64) DEFAULT NULL,
  `student_name` varchar(64) DEFAULT NULL,
  `course_id` varchar(64) DEFAULT NULL,
  `course_name` varchar(64) DEFAULT NULL,
  `grade` varchar(64) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('162185639454479', '162185639453497', '张三', '162185637873762', '线性代数', '30', null);
INSERT INTO `grade` VALUES ('162185639455304', '162185639453497', '张三', '162185637209250', '高等数学', '50', null);
INSERT INTO `grade` VALUES ('162185641549998', '162185639453497', '张三', '162185641548857', '大学英语', '20', null);
INSERT INTO `grade` VALUES ('162185643132942', '162185643131651', '李四', '162185641548857', '大学英语', '65', null);
INSERT INTO `grade` VALUES ('162185643133490', '162185643131651', '李四', '162185637873762', '线性代数', '54', null);
INSERT INTO `grade` VALUES ('162185643133909', '162185643131651', '李四', '162185637209250', '高等数学', '99', null);
INSERT INTO `grade` VALUES ('162185644583580', '162185639453497', '张三', '162185644582572', '计算机基础', '40', null);
INSERT INTO `grade` VALUES ('162185644584004', '162185643131651', '李四', '162185644582572', '计算机基础', '67', null);
INSERT INTO `grade` VALUES ('162185721676790', '162185639453497', '张三', '162185721672805', 'C语言基础', '10', null);
INSERT INTO `grade` VALUES ('162185721677402', '162185643131651', '李四', '162185721672805', 'C语言基础', '100', null);
INSERT INTO `grade` VALUES ('162186492901686', '162186492890460', '王五', '162185721672805', 'C语言基础', '70', null);
INSERT INTO `grade` VALUES ('162186492903091', '162186492890460', '王五', '162185641548857', '大学英语', '99', null);
INSERT INTO `grade` VALUES ('162186492905277', '162186492890460', '王五', '162185637873762', '线性代数', '12', null);
INSERT INTO `grade` VALUES ('162186492906398', '162186492890460', '王五', '162185644582572', '计算机基础', '222', null);
INSERT INTO `grade` VALUES ('162186492907338', '162186492890460', '王五', '162185637209250', '高等数学', '', null);
INSERT INTO `grade` VALUES ('162194079962300', '162194079959018', '张三丰', '162185721672805', 'C语言基础', '21', null);
INSERT INTO `grade` VALUES ('162194079963868', '162194079959018', '张三丰', '162185641548857', '大学英语', '32', null);
INSERT INTO `grade` VALUES ('162194079964863', '162194079959018', '张三丰', '162185637873762', '线性代数', '32', null);
INSERT INTO `grade` VALUES ('162194079966022', '162194079959018', '张三丰', '162185644582572', '计算机基础', '22', null);
INSERT INTO `grade` VALUES ('162194079967103', '162194079959018', '张三丰', '162185637209250', '高等数学', '11', null);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` varchar(64) NOT NULL,
  `content` varchar(64) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('162192305286983', '而我却二无群212222222222', '2021-05-25 14:20:54');
INSERT INTO `notice` VALUES ('162192339105502', '快考试了', '2021-05-25 14:16:31');
INSERT INTO `notice` VALUES ('162194110231382', '下周二考试', '2021-05-25 19:11:42');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(64) NOT NULL,
  `account` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('162185639453497', '000001', '000001', '张三', '男', '123', '123');
INSERT INTO `student` VALUES ('162185643131651', '000002', '000002', '李四', '男', '112', '221');
INSERT INTO `student` VALUES ('162186492890460', '000003', '000003', '王五', '男', '1221', '21212');
INSERT INTO `student` VALUES ('162194079959018', '000004', '000004', '张三丰', '男', '254543', '5435454');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(64) NOT NULL,
  `account` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('162185131771584', '1234', '1234', '扎里夫的', '男', '15732136759', '第三方的是第三方', '0');
INSERT INTO `teacher` VALUES ('162191818104865', 'qwer', 'qwer', '王老师', '男', '123', '32321', '1');
INSERT INTO `teacher` VALUES ('162194075302611', 'teacher1', '123', '王老师2323232323', '女', '122121', '323232', '0');
