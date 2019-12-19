/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 19/12/2019 11:45:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 'XX集团总公司', 0);
INSERT INTO `company` VALUES (2, '珠海电器', 1);
INSERT INTO `company` VALUES (3, '深圳信息', 1);
INSERT INTO `company` VALUES (4, '广州咨询', 1);
INSERT INTO `company` VALUES (5, '长沙分公司', 1);
INSERT INTO `company` VALUES (6, '珠海香洲分部', 2);
INSERT INTO `company` VALUES (7, '珠海金湾分部', 2);
INSERT INTO `company` VALUES (8, '深圳科技咨询', 3);
INSERT INTO `company` VALUES (9, '深圳XX科技', 3);
INSERT INTO `company` VALUES (10, '深圳XX研发中心', 3);
INSERT INTO `company` VALUES (11, '广州人力咨询', 4);
INSERT INTO `company` VALUES (12, '广州劳务咨询', 4);
INSERT INTO `company` VALUES (13, '长沙XX股份', 5);
INSERT INTO `company` VALUES (14, '长沙XX制造', 13);

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (8, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/ms-seckill?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis: 30000\r\n\r\n  redis:\r\n    host: redis\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '9b5ecef86bcc93d8cedc78b5bc14623f', '2019-12-09 10:08:46', '2019-12-09 10:54:33', NULL, '0:0:0:0:0:0:0:1', '', '', '用户中心的开发环境配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (14, 'seckill-gateway-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  port: 9898\r\n  \r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n#        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          # http://localhost:9898/alibaba-consumer/edit?origin=abc\r\n          # http://localhost:9898/alibaba-provider/users\r\n          # enabled为true，表示可以通过服务名的方式来进行访问\r\n          enabled: false\r\n      routes:\r\n        - id: seckill-usercenter\r\n          uri: lb://seckill-usercenter\r\n          predicates:\r\n            - Path=/seckill/login/**\r\n          filters:\r\n            - RewritePath=/seckill(?<segment>/?.*),$\\{segment}\r\n            # 限制用户每秒访问的次数，只能为1秒一次\r\n            - name: RequestRateLimiter\r\n              args:\r\n                # #{@XXXXX} 表示引用spring容器中的某个bean, XXXXX表是bean的名字\r\n                keyResolver: \'#{@hostAddrKeyResolver}\'\r\n                # 每秒往令牌桶中存放的数量\r\n                redis-rate-limiter.replenishRate: 1\r\n                # 令牌桶初始容量, 最多放几个\r\n                redis-rate-limiter.burstCapacity: 1\r\n\r\n  redis:\r\n    port: 6379\r\n    host: redis\r\n    password: admin\r\n\r\n\r\n\r\n# 针对网关的错误处理，直接返回html页面，要作的事就是 返回json\r\n', 'b7ded3194cc3b21f2f54d7e3f4b13016', '2019-12-09 10:56:15', '2019-12-09 15:11:05', NULL, '0:0:0:0:0:0:0:1', '', '', '网关开发环境配置', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'alibaba-consumer-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"alibaba-consumer\",\"clusterConfig\":{\"fallbackToLocalWhenFail\":true,\"sampleCount\":10,\"strategy\":0,\"thresholdType\":0,\"windowIntervalMs\":1000},\"clusterMode\":false,\"controlBehavior\":0,\"count\":2.0,\"gmtCreate\":1574905520131,\"gmtModified\":1574905520131,\"grade\":1,\"id\":1,\"ip\":\"172.18.96.177\",\"limitApp\":\"default\",\"port\":8720,\"resource\":\"/all\",\"strategy\":0}]', '4b49d32a846e1dbed6b065b4d498aad1', '2010-05-05 00:00:00', '2019-11-28 09:45:20', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'alibaba-consumer-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"alibaba-consumer\",\"clusterConfig\":{\"fallbackToLocalWhenFail\":true,\"sampleCount\":10,\"strategy\":0,\"thresholdType\":0,\"windowIntervalMs\":1000},\"clusterMode\":false,\"controlBehavior\":0,\"count\":2.0,\"gmtCreate\":1574905520131,\"gmtModified\":1574905520131,\"grade\":1,\"id\":1,\"ip\":\"172.18.96.177\",\"limitApp\":\"default\",\"port\":8720,\"resource\":\"/all\",\"strategy\":0}]', '4b49d32a846e1dbed6b065b4d498aad1', '2010-05-05 00:00:00', '2019-11-28 09:46:31', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 3, 'alibaba-consumer-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"alibaba-consumer\",\"clusterConfig\":{\"fallbackToLocalWhenFail\":true,\"sampleCount\":10,\"strategy\":0,\"thresholdType\":0,\"windowIntervalMs\":1000},\"clusterMode\":false,\"controlBehavior\":0,\"count\":1.0,\"gmtCreate\":1574905520131,\"gmtModified\":1574905591077,\"grade\":1,\"id\":1,\"ip\":\"172.18.96.177\",\"limitApp\":\"default\",\"port\":8720,\"resource\":\"/all\",\"strategy\":0}]', 'af4d1c174c0d2314f853e5920642c522', '2010-05-05 00:00:00', '2019-11-28 09:47:33', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 4, 'alibaba-consumer-flow-rules', 'SENTINEL_GROUP', '', '[]', 'd751713988987e9331980363e24189ce', '2010-05-05 00:00:00', '2019-11-28 09:47:46', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 5, 'alibaba-consumer-flow-rules', 'SENTINEL_GROUP', '', '[{\"app\":\"alibaba-consumer\",\"clusterConfig\":{\"fallbackToLocalWhenFail\":true,\"sampleCount\":10,\"strategy\":0,\"thresholdType\":0,\"windowIntervalMs\":1000},\"clusterMode\":false,\"controlBehavior\":0,\"count\":2.0,\"gmtCreate\":1574905665517,\"gmtModified\":1574905665517,\"grade\":1,\"id\":2,\"ip\":\"172.18.96.177\",\"limitApp\":\"default\",\"port\":8720,\"resource\":\"/all\",\"strategy\":0}]', 'd2944ffa26dea98912cca6730b74be06', '2010-05-05 00:00:00', '2019-11-29 11:30:19', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 6, 'alibaba-consumer-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\nmykey: abcdef\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', 'd2e9ad91e9eed170804ca41342e56b91', '2010-05-05 00:00:00', '2019-12-02 10:57:35', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'alibaba-consumer-test.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '0077036bacab7464a97fdc4dbf8fb721', '2010-05-05 00:00:00', '2019-12-02 10:58:09', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 8, 'alibaba-consumer-prod.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '0077036bacab7464a97fdc4dbf8fb721', '2010-05-05 00:00:00', '2019-12-02 10:58:31', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (6, 9, 'alibaba-consumer-test.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '0077036bacab7464a97fdc4dbf8fb721', '2010-05-05 00:00:00', '2019-12-02 10:59:14', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 10, 'alibaba-consumer-prod.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '0077036bacab7464a97fdc4dbf8fb721', '2010-05-05 00:00:00', '2019-12-02 10:59:32', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (6, 11, 'alibaba-consumer-test.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\nmykey: test-abcd\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '0d01f704505ba829a700628bfd3e3cf5', '2010-05-05 00:00:00', '2019-12-02 11:05:31', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 12, 'alibaba-consumer-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\nmykey: abcdef\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', 'd2e9ad91e9eed170804ca41342e56b91', '2010-05-05 00:00:00', '2019-12-09 10:07:34', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (7, 13, 'alibaba-consumer-prod.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\nmykey: prod-abdxyz\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', '877a34c9b6efee1a2e87d09273e7c208', '2010-05-05 00:00:00', '2019-12-09 10:07:37', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (6, 14, 'alibaba-consumer-test.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 8081\r\n\r\nspring:\r\n  application:\r\n    name: alibaba-consumer\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: localhost:8848\r\n\r\n    sentinel:\r\n      transport:\r\n        dashboard: localhost:8080\r\n      # 立即加载\r\n      eager: true\r\n\r\nmykey: test-abcdxyz-helfejia\r\n\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  httpclient:\r\n    connection-timeout: 800\r\n\r\norigin:\r\n  name: origin\r\n\r\nrule:\r\n  lock:\r\n    locks: alibaba-provider\r\n\r\n', 'd07f5eb0f545212e17508bef97c29403', '2010-05-05 00:00:00', '2019-12-09 10:07:40', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/exam?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis:\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'fde8a81ea2d59cd1a76ab5e3d3733543', '2010-05-05 00:00:00', '2019-12-09 10:08:46', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (8, 16, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/exam?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis:\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', 'fde8a81ea2d59cd1a76ab5e3d3733543', '2010-05-05 00:00:00', '2019-12-09 10:09:55', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 17, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/exam?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis:\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '10fcfb814519097c76fc3569bcb6b728', '2010-05-05 00:00:00', '2019-12-09 10:16:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 18, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/ms-seckill?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis:\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '3e60215566bb3437c97124a72bf9a7ff', '2010-05-05 00:00:00', '2019-12-09 10:17:52', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 19, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/ms-seckill?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis: 30000\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '4d048074a85ae5a4af965f0d439f6b4f', '2010-05-05 00:00:00', '2019-12-09 10:39:49', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (8, 20, 'seckill-usercenter-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  servlet:\r\n    # 正常前后端分离的项目，session是要禁用\r\n    session:\r\n      timeout: 1m\r\n  port: 7668\r\n\r\nspring:\r\n  datasource:\r\n    url: jdbc:mysql://mysql:3306/ms-seckill?useSSL=false&serverTimezone=UTC\r\n    username: root\r\n    password: 1256789\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    druid:\r\n      initial-size: 20\r\n      max-active: 50\r\n      min-idle: 15\r\n      validation-query: \'select 1\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      pool-prepared-statements: false\r\n      max-open-prepared-statements: 100\r\n      min-evictable-idle-time-millis: 30000\r\n      time-between-eviction-runs-millis: 30000\r\n\r\n  redis:\r\n    host: localhost\r\n    password: admin\r\n    lettuce:\r\n      pool:\r\n        min-idle: 5\r\n        max-active: 100\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n        #        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: true\r\n        server-addr: nacos1:8848\r\n\r\n\r\npagehelper:\r\n  # 分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页\r\n  reasonable: true\r\n  # 支持通过 Mapper 接口参数来传递分页参数\r\n  support-methods-arguments: true\r\n\r\n  helper-dialect: mysql\r\n\r\nmybatis:\r\n  mapper-locations: classpath:/mappers/**/*.xml\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl', '4d048074a85ae5a4af965f0d439f6b4f', '2010-05-05 00:00:00', '2019-12-09 10:54:33', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 21, 'seckill-gateway-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9898\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n#        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          # http://localhost:9898/alibaba-consumer/edit?origin=abc\r\n          # http://localhost:9898/alibaba-provider/users\r\n          # enabled为true，表示可以通过服务名的方式来进行访问\r\n          enabled: false\r\n      routes:\r\n        - id: seckill-usercenter\r\n          uri: lb://seckill-usercenter\r\n          predicates:\r\n            - Path=/seckill/login/**\r\n          filters:\r\n            - RewritePath=/seckill(?<segment>/?.*),$\\{segment}\r\n            # 限制用户每秒访问的次数，只能为1秒一次\r\n            - name: RequestRateLimiter\r\n              args:\r\n                # #{@XXXXX} 表示引用spring容器中的某个bean, XXXXX表是bean的名字\r\n                keyResolver: \'#{@hostAddrKeyResolver}\'\r\n                # 每秒往令牌桶中存放的数量\r\n                redis-rate-limiter.replenishRate: 1\r\n                # 令牌桶初始容量, 最多放几个\r\n                redis-rate-limiter.burstCapacity: 1\r\n\r\n  redis:\r\n    port: 6379\r\n    host: redis\r\n    password: admin\r\n\r\n\r\n\r\n# 针对网关的错误处理，直接返回html页面，要作的事就是 返回json\r\n', '850451db83b5ca5fe807454c1bc74fab', '2010-05-05 00:00:00', '2019-12-09 10:56:15', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (14, 22, 'seckill-gateway-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9898\r\n\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n#        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          # http://localhost:9898/alibaba-consumer/edit?origin=abc\r\n          # http://localhost:9898/alibaba-provider/users\r\n          # enabled为true，表示可以通过服务名的方式来进行访问\r\n          enabled: false\r\n      routes:\r\n        - id: seckill-usercenter\r\n          uri: lb://seckill-usercenter\r\n          predicates:\r\n            - Path=/seckill/login/**\r\n          filters:\r\n            - RewritePath=/seckill(?<segment>/?.*),$\\{segment}\r\n            # 限制用户每秒访问的次数，只能为1秒一次\r\n            - name: RequestRateLimiter\r\n              args:\r\n                # #{@XXXXX} 表示引用spring容器中的某个bean, XXXXX表是bean的名字\r\n                keyResolver: \'#{@hostAddrKeyResolver}\'\r\n                # 每秒往令牌桶中存放的数量\r\n                redis-rate-limiter.replenishRate: 1\r\n                # 令牌桶初始容量, 最多放几个\r\n                redis-rate-limiter.burstCapacity: 1\r\n\r\n  redis:\r\n    port: 6379\r\n    host: redis\r\n    password: admin\r\n\r\n\r\n\r\n# 针对网关的错误处理，直接返回html页面，要作的事就是 返回json\r\n', '850451db83b5ca5fe807454c1bc74fab', '2010-05-05 00:00:00', '2019-12-09 15:06:51', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 23, 'seckill-gateway-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9898\r\n  \r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n#        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          # http://localhost:9898/alibaba-consumer/edit?origin=abc\r\n          # http://localhost:9898/alibaba-provider/users\r\n          # enabled为true，表示可以通过服务名的方式来进行访问\r\n          enabled: false\r\n      routes:\r\n        - id: seckill-usercenter\r\n          uri: lb://seckill-usercenter\r\n          predicates:\r\n            - Path=/seckill/login/**\r\n          filters:\r\n            - RewritePath=/seckill(?<segment>/?.*),$\\{segment}\r\n            # 限制用户每秒访问的次数，只能为1秒一次\r\n            - name: RequestRateLimiter\r\n              args:\r\n                # #{@XXXXX} 表示引用spring容器中的某个bean, XXXXX表是bean的名字\r\n                keyResolver: \'#{@hostAddrKeyResolver}\'\r\n                # 每秒往令牌桶中存放的数量\r\n                redis-rate-limiter.replenishRate: 1\r\n                # 令牌桶初始容量, 最多放几个\r\n                redis-rate-limiter.burstCapacity: 1\r\n\r\n  redis:\r\n    port: 6379\r\n    host: redis\r\n    password: admin\r\n\r\n\r\n\r\n# 针对网关的错误处理，直接返回html页面，要作的事就是 返回json\r\n', '0faad070093c645448e456258a6e145d', '2010-05-05 00:00:00', '2019-12-09 15:09:17', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 24, 'seckill-gateway-dev.yml', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9898\r\n  \r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        #nacos的注册地址\r\n#        server-addr: 172.18.96.177:8848, 172.18.96.177:8849\r\n\r\n        # 是否将该服务注册到nacos\r\n        register-enabled: false\r\n        server-addr: nacos1:8848\r\n\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          # http://localhost:9898/alibaba-consumer/edit?origin=abc\r\n          # http://localhost:9898/alibaba-provider/users\r\n          # enabled为true，表示可以通过服务名的方式来进行访问\r\n          enabled: false\r\n      routes:\r\n        - id: seckill-usercenter\r\n          uri: lb://seckill-usercenter\r\n          predicates:\r\n            - Path=/seckill/login/**\r\n          filters:\r\n            - RewritePath=/seckill(?<segment>/?.*),$\\{segment}\r\n            # 限制用户每秒访问的次数，只能为1秒一次\r\n            - name: RequestRateLimiter\r\n              args:\r\n                # #{@XXXXX} 表示引用spring容器中的某个bean, XXXXX表是bean的名字\r\n                keyResolver: \'#{@hostAddrKeyResolver}\'\r\n                # 每秒往令牌桶中存放的数量\r\n                redis-rate-limiter.replenishRate: 1\r\n                # 令牌桶初始容量, 最多放几个\r\n                redis-rate-limiter.burstCapacity: 1\r\n\r\n  redis:\r\n    port: 6379\r\n    host: redis\r\n    password: admin\r\n\r\n\r\n\r\n# 针对网关的错误处理，直接返回html页面，要作的事就是 返回json\r\n', '0faad070093c645448e456258a6e145d', '2010-05-05 00:00:00', '2019-12-09 15:11:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_menus_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus_permission`;
CREATE TABLE `sys_menus_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'm表示菜单, b表示按钮',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `component` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus_permission
-- ----------------------------
INSERT INTO `sys_menus_permission` VALUES (1, '首页面板', 'el-icon-date', 'm', '/index', 0, 'Index');
INSERT INTO `sys_menus_permission` VALUES (2, '公司管理', 'el-icon-present', 'm', '/company', 10, 'Company');
INSERT INTO `sys_menus_permission` VALUES (3, '员工管理', 'el-icon-s-check', 'm', '', 10, NULL);
INSERT INTO `sys_menus_permission` VALUES (4, '邮箱管理', 'el-icon-date', 'm', '/user-mail', 3, 'UserMail');
INSERT INTO `sys_menus_permission` VALUES (5, '员工信息', 'el-icon-user', 'm', '/employee', 3, 'Employee');
INSERT INTO `sys_menus_permission` VALUES (6, '系统管理', 'el-icon-coin', 'm', NULL, 0, NULL);
INSERT INTO `sys_menus_permission` VALUES (7, '用户管理', 'el-icon-truck', 'm', '/user-info', 6, 'UserInfo');
INSERT INTO `sys_menus_permission` VALUES (8, '角色管理', 'el-icon-s-operation', 'm', '/roles', 6, 'Role');
INSERT INTO `sys_menus_permission` VALUES (10, '集团数据', 'el-icon-s-home', 'm', NULL, 0, NULL);
INSERT INTO `sys_menus_permission` VALUES (11, '腾讯邮箱', NULL, 'm', NULL, 4, NULL);

-- ----------------------------
-- Table structure for sys_operator_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_operator_permission`;
CREATE TABLE `sys_operator_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operator_permission
-- ----------------------------
INSERT INTO `sys_operator_permission` VALUES (1, '查看用户', 'userInfo:list', 7);
INSERT INTO `sys_operator_permission` VALUES (2, '编辑用户', 'userInfo:edit', 7);
INSERT INTO `sys_operator_permission` VALUES (3, '删除用户', 'userInfo:delete', 7);
INSERT INTO `sys_operator_permission` VALUES (4, '添加用户', 'userInfo:add', 7);
INSERT INTO `sys_operator_permission` VALUES (5, '导入用户', 'userInfo:import', 7);
INSERT INTO `sys_operator_permission` VALUES (6, '导出用户数据', 'userInfo:export', 7);
INSERT INTO `sys_operator_permission` VALUES (7, '查看公司数据', 'company:list', 2);
INSERT INTO `sys_operator_permission` VALUES (8, '添加公司数据', 'company:add', 2);
INSERT INTO `sys_operator_permission` VALUES (9, '删除公司记录', 'company:delete', 2);
INSERT INTO `sys_operator_permission` VALUES (10, '编辑公司记录', 'company:edit', 2);
INSERT INTO `sys_operator_permission` VALUES (11, '查看统计数据', 'index:list', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', NULL);
INSERT INTO `sys_role` VALUES (2, '普通用户', NULL);

-- ----------------------------
-- Table structure for sys_role_menu_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_permission`;
CREATE TABLE `sys_role_menu_permission`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu_permission
-- ----------------------------
INSERT INTO `sys_role_menu_permission` VALUES (1, 1);
INSERT INTO `sys_role_menu_permission` VALUES (1, 2);
INSERT INTO `sys_role_menu_permission` VALUES (1, 3);
INSERT INTO `sys_role_menu_permission` VALUES (1, 4);
INSERT INTO `sys_role_menu_permission` VALUES (1, 5);
INSERT INTO `sys_role_menu_permission` VALUES (1, 6);
INSERT INTO `sys_role_menu_permission` VALUES (1, 7);
INSERT INTO `sys_role_menu_permission` VALUES (1, 8);
INSERT INTO `sys_role_menu_permission` VALUES (1, 9);
INSERT INTO `sys_role_menu_permission` VALUES (1, 10);
INSERT INTO `sys_role_menu_permission` VALUES (1, 11);
INSERT INTO `sys_role_menu_permission` VALUES (2, 1);
INSERT INTO `sys_role_menu_permission` VALUES (2, 2);
INSERT INTO `sys_role_menu_permission` VALUES (2, 3);
INSERT INTO `sys_role_menu_permission` VALUES (2, 5);
INSERT INTO `sys_role_menu_permission` VALUES (2, 6);
INSERT INTO `sys_role_menu_permission` VALUES (2, 7);
INSERT INTO `sys_role_menu_permission` VALUES (2, 10);

-- ----------------------------
-- Table structure for sys_role_operator_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_operator_permission`;
CREATE TABLE `sys_role_operator_permission`  (
  `role_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `operator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_operator_permission
-- ----------------------------
INSERT INTO `sys_role_operator_permission` VALUES (1, 1);
INSERT INTO `sys_role_operator_permission` VALUES (1, 2);
INSERT INTO `sys_role_operator_permission` VALUES (1, 3);
INSERT INTO `sys_role_operator_permission` VALUES (1, 4);
INSERT INTO `sys_role_operator_permission` VALUES (1, 5);
INSERT INTO `sys_role_operator_permission` VALUES (1, 6);
INSERT INTO `sys_role_operator_permission` VALUES (1, 7);
INSERT INTO `sys_role_operator_permission` VALUES (1, 8);
INSERT INTO `sys_role_operator_permission` VALUES (1, 9);
INSERT INTO `sys_role_operator_permission` VALUES (1, 10);
INSERT INTO `sys_role_operator_permission` VALUES (1, 11);
INSERT INTO `sys_role_operator_permission` VALUES (2, 1);
INSERT INTO `sys_role_operator_permission` VALUES (2, 4);
INSERT INTO `sys_role_operator_permission` VALUES (2, 6);
INSERT INTO `sys_role_operator_permission` VALUES (2, 7);
INSERT INTO `sys_role_operator_permission` VALUES (2, 11);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'jack', '5bc985760d1c057fa76db5d580e2dc7c');
INSERT INTO `sys_user` VALUES (2, 'smith', '5bc985760d1c057fa76db5d580e2dc7c');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` bigint(20) NOT NULL COMMENT '主键Id',
  `imis_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imis_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telephone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, 'd9f0670e-9b6e-49df-afba-71646439585', '李（技工）', '15800158010', '河南区域');
INSERT INTO `test` VALUES (2, '9f5fa5c8-76e7-4eb0-930d-ff2053bbdae5', '夏至', '18800188000', '河南区域');
INSERT INTO `test` VALUES (3, '4bacfe58-5690-46ca-9802-675ee0037bcc', '工程管理员(测3)', '15800158011', '河南区域');
INSERT INTO `test` VALUES (4, 'd047929d-a131-4668-9293-762780c8fd04', '工程管理员(测2)', '13640794999', '贵州区域');
INSERT INTO `test` VALUES (5, 'bd885c97-ce9e-4436-8210-1809645318dc', '测试2', '18800188001', '广东区域');
INSERT INTO `test` VALUES (6, '68fa18f0-f818-4d20-b40d-51de7c3e9d45', '测试帐号02', '13800138044', '贵州区域');
INSERT INTO `test` VALUES (7, '1896', '朱（管家）', '15099996733', '河南区域');
INSERT INTO `test` VALUES (8, 'ef7e12f7-abc1-49a5-8325-d67bafe739f4', '维测2', '18800188002', '河南区域');
INSERT INTO `test` VALUES (9, '9f50b169-5c92-45c0-9471-8e8cfb5a7da3', '客测11', '18800188003', '贵州区域');
INSERT INTO `test` VALUES (10, '682', '陈技工（测3区）', '13800138004', '广东区域');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `createTime` timestamp(0) NULL DEFAULT NULL,
  `updateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `company_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_email_gender_index`(`name`, `email`, `gender`) USING BTREE,
  INDEX `email_index`(`email`(5)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (21, '风火轮', 'fjiej', 'F', 'meizi@126.com', '2016-06-05', '2016-06-23 16:47:17', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (23, '吉祥', 'fjiej', 'M', 'zdf@163.com', '2016-06-06', '2016-06-23 16:43:38', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (24, '如意', 'fjiej', 'F', 'meizi@126.com', '2016-06-05', '2016-06-23 16:47:17', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (25, '开门', 'fjiej', 'M', 'zhangfan@126.com', '2016-06-08', '2016-06-23 16:39:50', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (26, '成年人', 'fjiej', 'M', 'zdf@163.com', '2016-06-06', '2016-06-23 16:43:38', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (28, '书记', 'fjiej', 'M', 'zhangfan@126.com', '2016-06-08', '2016-06-23 16:39:50', '2019-09-04 11:05:52', 9);
INSERT INTO `user` VALUES (35, '团长', 'fjiej', 'M', 'zdf@163.com', '2016-06-06', '2016-06-23 16:43:38', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (36, '西门子', NULL, 'M', '521@163.cn', '2017-05-09', '2017-05-24 20:43:17', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (37, '种子u', NULL, 'F', '521@163.cn', '2017-05-02', '2017-05-24 20:44:16', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (38, '贾宝玉', NULL, 'M', '98yy@123.co', '2017-05-03', '2017-05-24 20:46:06', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (39, '张国荣67', NULL, 'F', '90@7.cn', '2017-05-09', '2017-05-24 20:47:48', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (40, '孙悟空', '1234', 'M', 'wrd@132.com', '2010-12-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (41, '刘德华', '0opl865', 'M', 'tgbnb@163.com', '1980-12-13', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (42, '古天乐', 'yhbv', 'M', 'tgbnb@126.com', '1981-06-28', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (43, '柳岩', 'mn67543', 'F', 'tgbnb@gmail.com', '1973-08-29', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (44, '李易峰', 'ty543', 'M', 'tgbnb@mx.com', '1978-04-12', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (45, '周迅', '5wvsww', 'F', 'tgbnb@vv.com', '1990-11-12', '2011-02-28 23:22:12', '2019-09-04 11:06:12', 4);
INSERT INTO `user` VALUES (46, '张柏芝', '56vbe', 'F', 'tgbnb@134.com', '1992-07-13', '2011-02-28 23:22:12', '2019-09-04 11:06:12', 4);
INSERT INTO `user` VALUES (47, '谢霆锋', '5gbnn', 'M', 'tgbnb@156.com', '1991-07-16', '2011-02-28 23:22:12', '2019-09-04 11:06:12', 4);
INSERT INTO `user` VALUES (48, '谢花花', '56vbbg', 'F', 'tgbnb@189.com', '1990-05-17', '2011-02-28 23:22:12', '2019-09-04 11:06:12', 4);
INSERT INTO `user` VALUES (50, '张惠妹', '5677', 'F', 'tgbnb@vvv.com', '1984-04-19', '2011-02-28 23:22:12', '2019-09-04 11:06:12', 4);
INSERT INTO `user` VALUES (51, '谢娜', '5vbn', 'F', 'tgbnb@nbv.com', '1983-04-21', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (52, '汪涵', '5bbn', 'M', 'tgbnb@bbn.com', '1982-03-21', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (53, '欧弟', '567ygv', 'M', 'tgbnb@99.com', '1981-02-21', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (54, '刘亦菲', '5vbbh', 'F', 'tgbnb@11.com', '1998-01-21', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (56, '陈好', '52345', 'F', 'tgbnb@162.com', '1989-10-22', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (57, '杨幂', '11111', 'F', 'tgbnb@134.com', '1980-03-23', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (58, '范冰冰', '0000', 'F', 'tgbnb@163.com', '1976-04-25', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (59, '周涛', '0987', 'F', 'tgbnb@125.com', '1979-12-27', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (60, '朱迅', 'ytrev', 'F', 'tgbnb@163.com', '1977-12-04', '2011-02-28 23:22:12', '2019-09-04 11:06:03', 14);
INSERT INTO `user` VALUES (61, '董卿', 'bvvvv', 'F', 'tgbnb@qq.com', '1995-12-09', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (62, '李思思', 'ytrrv', 'F', 'tgbnb@mv.com', '1996-11-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (63, '霍建华', 'mnju', 'M', 'tgbnb@tyu.com', '1997-11-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (64, '蜘蛛精', 'zvnbv', 'F', 'tgbnb@hbc.com', '1978-10-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (65, '李冰冰', '7864', 'F', 'tgbnb@bbn.com', '1984-09-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (66, '刘诗诗', '4455', 'F', 'tgbnb@bn87.com', '1989-05-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (67, '李湘', 'ubvcc', 'F', 'tgbnb@gmail.com', '1991-12-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (68, '赵丽颖', 'mbbb', 'F', 'tgbnb@ttt.com', '1992-12-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (69, '宋茜', 'vvv', 'F', 'tgbnb@oo.com', '1990-01-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (70, '景田', '8766', 'F', 'tgbnb@135.com', '1999-02-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (71, '陈龙', 'nbvv', 'M', 'tgbnb@987.com', '1990-03-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (72, '华晨宇', '8uyt', 'M', 'tgbnb@162.com', '1990-04-21', '2011-02-28 23:22:12', '2017-09-22 12:48:42', 2);
INSERT INTO `user` VALUES (73, 'afef', '123456', 'F', 'gefe', '2019-09-02', '2019-09-20 09:47:41', NULL, 7);
INSERT INTO `user` VALUES (74, 'yyyyy找那个', '123456', 'M', 'yyyy@134.co', '2019-09-02', '2019-09-20 09:49:58', NULL, 5);
INSERT INTO `user` VALUES (75, 'fefe', '123456', 'F', 'feafe', '2019-10-20', '2019-10-09 07:00:28', '2019-10-09 15:00:28', 4);
INSERT INTO `user` VALUES (124, '张三', '123456', 'F', '7877@163.com', '2019-10-06', '2019-10-09 07:05:36', '2019-10-09 15:05:36', 2);
INSERT INTO `user` VALUES (125, 'ZZZZZZ', '123456', 'F', 'anc@qq.com', '2019-10-07', '2019-10-09 07:07:05', '2019-10-24 15:37:25', 2);
INSERT INTO `user` VALUES (126, 'hfjaef', NULL, 'F', 'uyyyee@qq.com', '2019-11-19', '2019-11-25 03:42:31', NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$kva0OHZRAcisbb7hhfUQo.aQ.Zvb7EwfjWGSOT/97hMkLfLfUV/ei', 1);

SET FOREIGN_KEY_CHECKS = 1;
