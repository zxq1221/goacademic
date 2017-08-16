/*
Navicat MySQL Data Transfer

Source Server         : localDatabase
Source Server Version : 50715
Source Host           : 127.0.0.1:3306
Source Database       : lh_web_test

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-08-17 00:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '父id（根节点的parentId为0）',
  `name` varchar(20) DEFAULT NULL COMMENT '部门名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `permission_identity` varchar(100) DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `english_name` varchar(50) DEFAULT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色资源表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `staff_no` varchar(20) NOT NULL COMMENT '员工工号',
  `office_id` bigint(20) NOT NULL COMMENT '部门id',
  `name` varchar(20) DEFAULT NULL COMMENT '员工名字',
  `username` varchar(20) DEFAULT NULL COMMENT '员工登录系统名',
  `password` char(32) DEFAULT NULL COMMENT '员工登录系统密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公司员工表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '1', '10', 'zengxiaohui', '123456');
INSERT INTO `sys_user` VALUES ('4', '848', '848', '848', '848', '848');

-- ----------------------------
-- Table structure for sys_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_resource`;
CREATE TABLE `sys_user_resource` (
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户资源表';

-- ----------------------------
-- Records of sys_user_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `role_id` bigint(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_chapter
-- ----------------------------
DROP TABLE IF EXISTS `t_chapter`;
CREATE TABLE `t_chapter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '章节id',
  `course_id` bigint(20) NOT NULL COMMENT '课程表（t_course）的id',
  `name` varchar(50) NOT NULL COMMENT '章节名字',
  `url` varchar(200) DEFAULT NULL COMMENT '章节视频url地址',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程章节表';

-- ----------------------------
-- Records of t_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `name` varchar(50) NOT NULL COMMENT '课程名字',
  `description` varchar(1000) DEFAULT NULL COMMENT '课程详情',
  `cover` varchar(200) DEFAULT NULL COMMENT '课程封面',
  `price` decimal(12,2) DEFAULT NULL COMMENT '课程价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of t_course
-- ----------------------------

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '年级名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='年级表';

-- ----------------------------
-- Records of t_grade
-- ----------------------------

-- ----------------------------
-- Table structure for t_mac
-- ----------------------------
DROP TABLE IF EXISTS `t_mac`;
CREATE TABLE `t_mac` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mac` varchar(30) NOT NULL COMMENT 'mac地址',
  `student_id` bigint(20) NOT NULL COMMENT 't_student表的id（该mac地址所属的学生）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='学生mac地址表';

-- ----------------------------
-- Records of t_mac
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` char(12) NOT NULL COMMENT '订单编号',
  `student_info_id` bigint(20) NOT NULL COMMENT '学生信息id',
  `order_amount` decimal(12,2) NOT NULL COMMENT '订单金额',
  `paid_amount` decimal(12,2) DEFAULT NULL COMMENT '已付金额',
  `paid_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付类型',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` char(12) NOT NULL COMMENT '订单编号',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of t_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_cart`;
CREATE TABLE `t_shopping_cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车主键',
  `student_info_id` bigint(20) NOT NULL COMMENT '学生信息id',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of t_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_specialty
-- ----------------------------
DROP TABLE IF EXISTS `t_specialty`;
CREATE TABLE `t_specialty` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '专业名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='学生所属专业表';

-- ----------------------------
-- Records of t_specialty
-- ----------------------------

-- ----------------------------
-- Table structure for t_student_info
-- ----------------------------
DROP TABLE IF EXISTS `t_student_info`;
CREATE TABLE `t_student_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `mobile` varchar(30) NOT NULL COMMENT '手机号',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `specialty_id` bigint(20) DEFAULT NULL COMMENT 't_specialty表的id（学生所属专业）',
  `grade_id` bigint(20) DEFAULT NULL COMMENT 't_grade表的id（学生所属年级）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='学生信息表';

-- ----------------------------
-- Records of t_student_info
-- ----------------------------
