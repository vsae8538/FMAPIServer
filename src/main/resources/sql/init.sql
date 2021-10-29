/*
 v1.0
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eb_article
-- ----------------------------
DROP TABLE IF EXISTS `eb_article`;
CREATE TABLE `eb_article`  (
                               `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
                               `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分類id',
                               `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章標題',
                               `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章作者',
                               `image_input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章圖片',
                               `synopsis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章簡介',
                               `share_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章分享標題',
                               `share_synopsis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章分享簡介',
                               `visit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '瀏覽次數',
                               `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
                               `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原文鏈接',
                               `media_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信素材id',
                               `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '狀態',
                               `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隱藏',
                               `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理員id',
                               `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商戶id',
                               `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品關聯id',
                               `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否熱門(小程序)',
                               `is_banner` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否輪播圖(小程序)',
                               `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章內容',
                               `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                               `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_category`;
CREATE TABLE `eb_category`  (
                                `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父級ID',
                                `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/0/' COMMENT '路徑',
                                `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分類名稱',
                                `type` smallint(2) NULL DEFAULT 1 COMMENT '類型，1 產品分類，2 附件分類，3 文章分類， 4 設置分類， 5 菜單分類',
                                `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址',
                                `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擴展字段 Jsos格式',
                                `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態, 1正常，0失效',
                                `sort` int(5) NOT NULL DEFAULT 99999 COMMENT '排序',
                                `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `status+pid`(`pid`, `status`) USING BTREE,
                                INDEX `id+status+url`(`path`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分類表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_category
-- ----------------------------
INSERT INTO `eb_category` VALUES (42, 0, '/0/', '商品', 5, '/store', 's-goods', 1, 1, '2020-04-28 17:03:34', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (43, 42, '/0/42/', '商品管理', 5, '/store/index', NULL, 1, 1, '2020-04-28 17:04:20', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (44, 42, '/0/42/', '商品分類', 5, '/store/sort', NULL, 1, 1, '2020-04-28 17:04:40', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (45, 0, '/0/', '訂單', 5, '/order', 's-order', 1, 1, '2020-04-28 17:04:56', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (46, 45, '/0/45/', '訂單', 5, '/order/index', 's-order', 1, 1, '2020-04-28 17:05:17', '2021-02-04 10:12:41');
INSERT INTO `eb_category` VALUES (47, 0, '/0/', '用戶', 5, '/user', 'user-solid', 1, 1, '2020-04-28 17:05:53', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (48, 47, '/0/47/', '用戶管理', 5, '/user/index', NULL, 1, 1, '2020-04-28 17:07:13', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (49, 47, '/0/47/', '用戶標籤', 5, '/user/label', NULL, 1, 1, '2020-04-28 17:42:21', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (51, 0, '/0/', '設置', 5, '/operation', 's-tools', 1, -9, '2020-05-06 09:40:14', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (52, 51, '/0/51/', '管理權限', 5, '/operation/roleManager', NULL, 1, 1, '2020-05-06 09:40:35', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (53, 52, '/0/51/52/', '身份管理', 5, '/operation//roleManager/identityManager', NULL, 1, 1, '2020-05-06 09:40:51', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (54, 52, '/0/51/52/', '管理員列表', 5, '/operation//roleManager/adminList', NULL, 1, 1, '2020-05-06 09:41:11', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (55, 52, '/0/51/52/', '權限規則', 5, '/operation//roleManager/promiseRules', NULL, 1, 1, '2020-05-06 09:41:46', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (56, 0, '/0/', '內容', 5, '/content', 's-management', 1, 1, '2020-05-07 12:00:33', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (57, 56, '/0/56/', '文章管理', 5, '/content/articleManager', NULL, 1, 1, '2020-05-07 12:02:39', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (58, 56, '/0/56/', '文章分類', 5, '/content/classifManager', NULL, 1, 1, '2020-05-07 12:02:46', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (66, 0, '/0/', '維護', 5, '/maintain', 's-open', 1, -10, '2020-05-09 16:02:05', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (67, 66, '/0/66/', '開發配置', 5, '/maintain//devconfiguration', NULL, 1, 0, '2020-05-09 16:06:46', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (68, 67, '/0/66/67/', '配置分類', 5, '/maintain/devconfiguration/configCategory', NULL, 1, 0, '2020-05-09 16:07:09', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (69, 67, '/0/66/67/', '組合數據', 5, '/maintain/devconfiguration/combineddata', NULL, 1, 0, '2020-05-09 16:08:00', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (80, 51, '/0/51/', '系統設置', 5, '/operation/setting', NULL, 1, 9, '2020-05-20 09:44:47', '2020-12-10 11:30:07');
INSERT INTO `eb_category` VALUES (81, 0, '/0/', '基礎配置', 6, '基礎配置', '64', 1, 1, '2020-05-20 10:02:57', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (93, 81, '/0/81/', '站點配置', 6, '站點配置', '64', 1, 1, '2020-05-21 11:04:20', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (94, 100, '/0/100/', '客服配置', 6, '雲智服', '76', 1, 1, '2020-05-21 11:04:37', '2020-09-09 17:09:47');
INSERT INTO `eb_category` VALUES (95, 0, '/0/', '商城配置', 6, '商城配置', '77', 1, 2, '2020-05-21 11:10:20', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (96, 95, '/0/95/', '商城基礎配置', 6, '商城基礎配置', '77', 1, 1, '2020-05-21 11:10:40', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (98, 95, '/0/95/', '小票打印配置', 6, '小票打印配置', '75', 0, 1, '2020-05-21 11:11:11', '2020-08-13 14:07:02');
INSERT INTO `eb_category` VALUES (99, 95, '/0/95/', '充值配置', 6, '充值配置', '78', 1, 1, '2020-05-21 11:11:28', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (100, 0, '/0/', '應用配置', 6, '應用配置', NULL, 1, 1, '2020-05-21 12:31:49', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (101, 100, '/0/100/', '公眾號配置', 6, '公眾號配置', '65', 1, 1, '2020-05-21 12:32:07', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (102, 100, '/0/100/', '小程序配置', 6, '小程序配置', '66', 1, 1, '2020-05-21 12:32:18', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (103, 0, '/0/', '支付配置', 6, '支付配置', NULL, 1, 1, '2020-05-21 12:33:36', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (104, 103, '/0/103/', '公眾號支付配置', 6, '公眾號支付配置', '67', 1, 1, '2020-05-21 12:33:54', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (105, 103, '/0/103/', '小程序支付配置', 6, '小程序支付配置', '68', 1, 1, '2020-05-21 12:34:36', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (107, 103, '/0/103/', '余額支付', 6, '余額支付', '80', 1, 1, '2020-05-21 12:35:01', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (108, 0, '/0/', '文件上傳配置', 6, '文件上傳配置', NULL, 1, 1, '2020-05-21 12:35:16', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (109, 108, '/0/108/', '基礎配置', 6, '基礎配置', '108', 1, 1, '2020-05-21 12:35:28', '2020-09-14 10:33:54');
INSERT INTO `eb_category` VALUES (110, 108, '/0/108/', '阿里雲配置', 6, '阿里雲配置', '81', 1, 1, '2020-05-21 12:36:01', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (111, 108, '/0/108/', '七牛雲配置', 6, '七牛雲配置', '82', 1, 1, '2020-05-21 12:36:12', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (112, 108, '/0/108/', '騰訊雲配置', 6, '騰訊雲配置', '83', 1, 1, '2020-05-21 12:36:22', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (113, 0, '/0/', '應用', 5, '/appSetting', 's-promotion', 1, 1, '2020-05-21 16:12:53', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (114, 113, '/0/113/', '公眾號', 5, '/appSetting/publicAccount', NULL, 1, 1, '2020-05-21 16:13:18', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (115, 114, '/0/113/114/', '微信菜單', 5, '/appSetting//publicAccount/wxMenus', NULL, 1, 1, '2020-05-21 16:13:36', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (118, 0, '/0/', '營銷', 5, '/marketing', 's-marketing', 1, 1, '2020-05-25 14:39:52', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (119, 118, '/0/118/', '優惠券', 5, '/marketing/coupon', NULL, 1, 1, '2020-05-25 14:40:13', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (123, 118, '/0/118/', '積分', 5, '/marketing/integral', NULL, 1, 1, '2020-05-25 14:41:33', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (127, 42, '/0/42/', '商品規格', 5, '/store/attr', NULL, 1, 1, '2020-05-25 18:12:11', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (128, 42, '/0/42/', '商品評論', 5, '/store/comment', NULL, 1, 1, '2020-05-27 10:16:30', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (129, 51, '/0/51/', '提貨點', 5, '/operation/systemStore', NULL, 1, 1, '2020-05-27 11:42:51', '2020-08-27 10:57:46');
INSERT INTO `eb_category` VALUES (130, 129, '/0/51/129/', '提貨點', 5, '/operation/systemStore/point', NULL, 1, 1, '2020-05-27 11:46:10', '2020-08-27 10:56:49');
INSERT INTO `eb_category` VALUES (131, 129, '/0/51/129/', '核銷員', 5, '/operation/systemStore/clerkList', NULL, 1, 1, '2020-05-27 11:51:16', '2020-08-27 10:56:39');
INSERT INTO `eb_category` VALUES (132, 129, '/0/51/129/', '核銷訂單', 5, '/operation/systemStore/order', NULL, 1, 1, '2020-05-27 11:54:00', '2020-08-27 10:56:43');
INSERT INTO `eb_category` VALUES (134, 95, '/0/95/', '首頁配置', 6, 'index_config', '69', 0, 5, '2020-06-02 17:35:58', '2021-03-12 18:20:21');
INSERT INTO `eb_category` VALUES (135, 0, '/0/', '小樹樹2', 2, 'url', NULL, 1, 1, '2020-06-03 15:50:15', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (136, 135, '/0/135/', '小樹娃', 2, 'url', NULL, 1, 1, '2020-06-03 16:59:50', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (137, 135, '/0/135/', '小紅', 2, 'url', NULL, 1, 1, '2020-06-03 17:15:50', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (138, 136, '/0/135/136/', '小鼠', 2, 'url', NULL, 1, 1, '2020-06-03 17:25:39', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (139, 113, '/0/113/', '小程序', 5, '/appSetting/publicRoutine', NULL, 1, 1, '2020-06-05 09:56:17', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (140, 139, '/0/113/139/', '我的模板', 5, '/appSetting/publicRoutine/routineTemplate', NULL, 0, 1, '2020-06-05 09:56:58', '2021-03-05 16:07:42');
INSERT INTO `eb_category` VALUES (141, 114, '/0/113/114/', '自動回覆', 5, '/appSetting/publicAccount/wxReply', NULL, 1, 1, '2020-06-15 16:15:32', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (146, 0, '/0/', '分銷', 5, '/distribution', 's-check', 1, 1, '2020-07-18 16:31:09', '2020-12-07 09:35:02');
INSERT INTO `eb_category` VALUES (147, 146, '/0/146/', '分銷員管理', 5, '/distribution/index', NULL, 1, 1, '2020-07-18 16:31:49', '2020-12-18 10:22:25');
INSERT INTO `eb_category` VALUES (148, 146, '/0/146/', '分銷配置', 5, '/distribution/distributionconfig', NULL, 1, 1, '2020-07-18 16:32:06', '2020-12-18 10:22:19');
INSERT INTO `eb_category` VALUES (158, 119, '/0/118/119/', '優惠券', 5, '/marketing/coupon/list', NULL, 1, 1, '2020-07-24 16:13:10', '2020-08-29 10:15:34');
INSERT INTO `eb_category` VALUES (159, 119, '/0/118/119/', '領取記錄', 5, '/marketing/coupon/record', NULL, 1, 1, '2020-07-24 16:13:37', '2021-03-12 16:40:29');
INSERT INTO `eb_category` VALUES (160, 123, '/0/118/123/', '積分配置', 5, '/marketing/integral/integralconfig', NULL, 1, 1, '2020-07-24 16:14:48', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (161, 123, '/0/118/123/', '積分日誌', 5, '/marketing/integral/integrallog', NULL, 1, 1, '2020-07-24 16:15:11', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (162, 47, '/0/47/', '用戶等級', 5, '/user/grade', NULL, 1, 1, '2020-07-24 16:21:48', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (164, 47, '/0/47/', '用戶分組', 5, '/user/group', NULL, 1, 1, '2020-07-24 16:22:46', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (165, 51, '/0/51/', '物流', 5, '/operation/logistics', NULL, 1, 1, '2020-07-24 16:37:56', '2020-08-27 10:57:55');
INSERT INTO `eb_category` VALUES (166, 165, '/0/51/165/', '城市數據', 5, '/operation/logistics/cityList', NULL, 1, 1, '2020-07-24 16:38:22', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (167, 165, '/0/51/165/', '物流公司', 5, '/operation/logistics/companyList', NULL, 1, 1, '2020-07-24 16:38:46', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (168, 165, '/0/51/165/', '運費模板', 5, '/operation/logistics/shippingTemplates', NULL, 1, 1, '2020-07-24 16:39:03', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (169, 165, '/0/51/165/', '物流配置', 5, '/operation/logistics/logisticsConfig', NULL, 1, 1, '2020-07-24 16:39:27', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (171, 141, '/0/113/114/141/', '微信關注回覆', 5, '/appSetting/publicAccount/wxReply/follow', NULL, 1, 1, '2020-07-24 16:42:52', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (172, 141, '/0/113/114/141/', '關鍵字回覆', 5, '/appSetting/publicAccount/wxReply/keyword', NULL, 1, 1, '2020-07-24 16:43:09', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (173, 141, '/0/113/114/141/', '無效關鍵詞回覆', 5, '/appSetting/publicAccount/wxReply/replyIndex', NULL, 1, 1, '2020-07-24 16:43:23', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (174, 114, '/0/113/114/', '微信模板', 5, '/appSetting//publicAccount/template/1', NULL, 1, 1, '2020-07-24 16:43:52', '2021-03-05 16:17:57');
INSERT INTO `eb_category` VALUES (175, 43, '/0/42/43/', '商品添加', 5, 'api/admin/store/product/save', NULL, 0, 1, '2020-07-24 16:46:04', '2021-03-11 09:20:26');
INSERT INTO `eb_category` VALUES (176, 43, '/0/42/43/', '商品修改', 5, 'api/admin/store/product/update', NULL, 0, 1, '2020-07-24 16:46:19', '2020-08-31 10:07:24');
INSERT INTO `eb_category` VALUES (181, 182, '/0/182/', '測試分類01', 2, 'url', NULL, 1, 1, '2020-08-10 10:18:52', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (182, 0, '/0/', '測試分類02', 2, 'url', NULL, 1, 1, '2020-08-10 10:20:14', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (183, 0, '/0/', '測試分類03', 2, 'url', NULL, 1, 1, '2020-08-10 10:31:17', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (184, 181, '/0/181/', '測試二級分類01', 2, 'url', NULL, 1, 1, '2020-08-10 10:34:50', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (185, 0, '/0/', 'ADIDAS 春季新品運動鞋圖片1', 2, 'url', NULL, 1, 1, '2020-08-10 10:40:52', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (188, 184, '/0/181/184/', '測試四級分類01', 2, 'url', NULL, 1, 1, '2020-08-10 11:08:32', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (240, 10000, '/0/', '2323', 2, 'url', NULL, 1, 1, '2020-08-11 15:20:28', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (245, 0, '/0/272/', '熱門推薦', 1, '', 'crmebimage/content/2020/08/10/814d9f0beba040d2904079d7b99fc586el2l3odbj3.png', 1, 0, '2020-08-12 11:42:27', '2021-02-02 18:44:28');
INSERT INTO `eb_category` VALUES (246, 245, '/0/272/245/', '新品上市', 1, 'www', 'crmebimage/store/2020/08/13/95e065018ba24172b2e2dd2e2833360coobdzkt671.png', 1, 0, '2020-08-12 11:42:58', '2021-01-25 10:04:18');
INSERT INTO `eb_category` VALUES (248, 245, '/0/272/245/', '熱賣商品', 1, 'www', 'crmebimage/store/2020/08/13/29b418bf2543477d8417a85e779e6d79clby7stw86.png', 1, 0, '2020-08-12 11:50:40', '2021-01-25 10:04:16');
INSERT INTO `eb_category` VALUES (250, 67, '/0/66/67/', '表單配置', 5, '/maintain/devconfiguration/formConfig', NULL, 1, 0, '2020-08-12 12:09:56', '2020-08-12 12:29:13');
INSERT INTO `eb_category` VALUES (258, 245, '/0/272/245/', '折扣專區', 1, 'www', 'crmebimage/store/2020/08/13/1826c7f20771444e888501d91332f129wik43qfgmw.png', 1, 0, '2020-08-12 13:59:31', '2021-01-25 10:04:12');
INSERT INTO `eb_category` VALUES (267, 0, '/0/', '控制台', 5, '/dashboard', 'menu', 1, 10, '2020-08-13 10:31:07', '2021-02-04 11:04:27');
INSERT INTO `eb_category` VALUES (268, 0, '/0/', '圖標素材', 2, 'url', NULL, 0, 1, '2020-08-13 10:36:08', '2020-08-13 10:36:08');
INSERT INTO `eb_category` VALUES (270, 0, '/0/', 'banner', 2, 'url', NULL, 0, 1, '2020-08-13 11:35:39', '2020-08-13 11:35:39');
INSERT INTO `eb_category` VALUES (271, 0, '/0/', '分類素材', 2, 'url', NULL, 0, 1, '2020-08-13 11:46:28', '2020-08-13 11:46:28');
INSERT INTO `eb_category` VALUES (272, 0, '/0/', '家用電器', 1, '', 'crmebimage/store/2020/08/13/88dfb08327f7470d8285613aa1bd9ab3xk2qzolbad.png', 1, 0, '2020-08-13 12:03:40', '2021-02-02 18:44:56');
INSERT INTO `eb_category` VALUES (273, 272, '/0/272/', '電視', 1, '', 'crmebimage/store/2020/08/13/15e36da884e44f91939a92468d0c848fxftnm6thvc.png', 1, 0, '2020-08-13 12:05:23', '2021-01-25 10:02:40');
INSERT INTO `eb_category` VALUES (274, 272, '/0/272/', '冰箱', 1, 'www', 'crmebimage/store/2020/08/13/0c1fb92238ce4f67b9c2cb03c9c932c8a28451t0g7.png', 1, 0, '2020-08-13 12:06:47', '2021-01-25 10:02:42');
INSERT INTO `eb_category` VALUES (275, 272, '/0/272/', '洗衣機', 1, 'www', 'crmebimage/store/2020/08/13/6f722314cefa418fada5eab9e09bf86aqutumxihsx.png', 1, 0, '2020-08-13 12:07:57', '2021-01-25 10:02:45');
INSERT INTO `eb_category` VALUES (276, 272, '/0/272/', '生活電器', 1, '', 'crmebimage/store/2020/08/13/df0f8dfb34c1424abde8737039c5f58b1acdgq3h7w.png', 1, 0, '2020-08-13 12:11:36', '2021-01-25 10:02:47');
INSERT INTO `eb_category` VALUES (277, 272, '/0/272/', '廚衛電器', 1, '', 'crmebimage/store/2020/08/13/cb007f931afb4386bfff7f80b8971203c5qc2k1j1n.png', 1, 0, '2020-08-13 12:12:38', '2021-01-25 10:02:50');
INSERT INTO `eb_category` VALUES (279, 272, '/0/272/', '清涼一夏', 1, '', 'crmebimage/store/2020/08/13/306ee4383bbf460494e8b3368782a076ugnezzb362.png', 1, 0, '2020-08-13 12:15:11', '2021-01-25 10:02:53');
INSERT INTO `eb_category` VALUES (280, 0, '/0/', '家裝傢具', 1, '', 'crmebimage/store/2020/08/14/547bfd86471b412eb4f163e07cfc2027uzzul0xoyl.jpg', 1, 0, '2020-08-13 12:17:25', '2021-03-16 16:09:20');
INSERT INTO `eb_category` VALUES (281, 0, '/0/', '戶外出行', 1, '', 'crmebimage/content/2020/08/14/d992711f08ae45369ec1bd56a30c462880pnyxs5xg.jpg', 1, 0, '2020-08-13 12:17:54', '2021-03-16 16:09:20');
INSERT INTO `eb_category` VALUES (282, 0, '/0/', '美妝個護', 1, '', 'crmebimage/setting/2020/08/14/26b3e7b4591e47f8b49e805082925dd8l36r29lmqo.jpg', 1, 0, '2020-08-13 12:18:04', '2021-03-16 16:09:21');
INSERT INTO `eb_category` VALUES (283, 0, '/0/', '3C數碼', 1, '', 'crmebimage/content/2020/08/13/312234fff7f24c37bcedd117f1572b3e5z7eydhpyr.png', 1, 0, '2020-08-13 12:18:14', '2021-03-16 16:09:22');
INSERT INTO `eb_category` VALUES (284, 0, '/0/283/', '日用文創', 1, '', 'image/content/2020/12/29/80e11163e1e74593b8b9ad6fbdfb853aejncx024gv.png', 1, 0, '2020-08-13 12:18:30', '2021-02-03 10:58:22');
INSERT INTO `eb_category` VALUES (285, 280, '/0/280/', '智能門鎖', 1, '', 'crmebimage/store/2020/08/13/f4f47201c43e42ac82b83ed711199774ggihs7g6yb.png', 1, 0, '2020-08-13 13:31:48', '2021-01-25 10:03:09');
INSERT INTO `eb_category` VALUES (286, 280, '/0/280/', '居家照明', 1, '', 'crmebimage/store/2020/08/13/f0771d0db94847bbb2cb60ebe5201aa0tzzjzor6d5.png', 1, 0, '2020-08-13 13:33:06', '2021-01-25 10:03:12');
INSERT INTO `eb_category` VALUES (287, 280, '/0/280/', '家裝建材', 1, '', 'crmebimage/store/2020/08/13/4209c46356f4478ea3ed2b8adfc8dd4d4udgw8nsig.png', 1, 0, '2020-08-13 13:34:22', '2021-01-25 10:03:15');
INSERT INTO `eb_category` VALUES (288, 281, '/0/281/', '健身運動', 1, '', 'crmebimage/store/2020/08/13/183bae2de334412f8593325805bb45e07xvwxc6nbn.png', 1, 0, '2020-08-13 13:35:37', '2021-01-25 10:03:20');
INSERT INTO `eb_category` VALUES (289, 281, '/0/281/', '戶外裝備', 1, '', 'crmebimage/store/2020/08/13/767c7e25f56543f398e11896d356b46a1t4l6k8qk0.png', 1, 0, '2020-08-13 13:36:34', '2021-01-25 10:03:22');
INSERT INTO `eb_category` VALUES (290, 281, '/0/281/', '騎行配件', 1, '', 'crmebimage/store/2020/08/13/8525ef6066a04537aa5ee92234dc2edcf1iyqm9gq9.png', 1, 0, '2020-08-13 13:37:23', '2021-01-25 10:03:25');
INSERT INTO `eb_category` VALUES (291, 282, '/0/282/', '美妝工具', 1, '', 'crmebimage/store/2020/08/13/57f108bff43744c88323c666d77cac72g4p0a23tpo.png', 1, 0, '2020-08-13 13:38:32', '2021-01-25 10:03:29');
INSERT INTO `eb_category` VALUES (292, 282, '/0/282/', '口腔清潔', 1, '', 'crmebimage/store/2020/08/13/72f39322b33249e0b3441908e3b657b2rzf7g4x37c.png', 1, 0, '2020-08-13 13:39:33', '2021-01-25 10:03:32');
INSERT INTO `eb_category` VALUES (293, 282, '/0/282/', '彩妝香氛', 1, '', 'crmebimage/store/2020/08/13/bf981c370d9d44f998803310fedb8af3yr9suwbwp1.png', 1, 0, '2020-08-13 13:40:34', '2021-01-25 10:03:34');
INSERT INTO `eb_category` VALUES (294, 282, '/0/282/', '面部護膚', 1, '', 'crmebimage/store/2020/08/13/59a066f8bb5145cbada4b7a08965cf15b26idurig9.png', 1, 0, '2020-08-13 13:42:19', '2021-01-25 10:03:38');
INSERT INTO `eb_category` VALUES (295, 282, '/0/282/', '身體護理', 1, '', 'crmebimage/store/2020/08/13/769f2ba251114a75bc3da94166770482zv3tb4ogjy.png', 1, 0, '2020-08-13 13:43:21', '2021-01-25 10:03:41');
INSERT INTO `eb_category` VALUES (296, 282, '/0/282/', '其他工具', 1, '', 'crmebimage/store/2020/08/13/5c9d8b4b4a2e4fc782558787fc941e24o6u5iv52dl.png', 1, 0, '2020-08-13 13:44:15', '2021-01-25 10:03:43');
INSERT INTO `eb_category` VALUES (297, 283, '/0/283/', '手機', 1, '', 'crmebimage/store/2020/08/13/3a985dc276b941c093a12332500d9784ce3bed9l0c.png', 1, 0, '2020-08-13 13:45:52', '2021-01-25 10:03:45');
INSERT INTO `eb_category` VALUES (298, 283, '/0/283/', '平板電腦', 1, '', 'crmebimage/store/2020/08/13/5771a123b9a24666b5cdcf531f7744d6grduvuarjw.png', 1, 0, '2020-08-13 13:46:22', '2021-01-25 10:03:47');
INSERT INTO `eb_category` VALUES (299, 283, '/0/283/', '數碼配件', 1, '', 'crmebimage/store/2020/08/13/760282c126c74ff7a335c3efd6bb2e27vduh9zraqs.png', 1, 0, '2020-08-13 13:47:16', '2021-01-25 10:03:50');
INSERT INTO `eb_category` VALUES (300, 284, '/0/284/', '日用雜貨', 1, '', 'crmebimage/store/2020/08/13/ba82799518704655ab2fdc254336de08wtb2ofda96.png', 1, 0, '2020-08-13 13:48:30', '2021-01-25 10:03:53');
INSERT INTO `eb_category` VALUES (301, 284, '/0/284/', '紙品濕巾', 1, '', 'crmebimage/store/2020/08/13/eb7a947539d94cd495ea6493e37a3e35lkqmcnnl9q.png', 1, 0, '2020-08-13 13:49:30', '2021-01-25 10:03:56');
INSERT INTO `eb_category` VALUES (302, 284, '/0/284/', '辦公文具', 1, '', 'crmebimage/store/2020/08/13/a84efcfa299c4269af95d671e122d4770vrq87ttfz.png', 1, 0, '2020-08-13 13:50:39', '2021-01-25 10:03:58');
INSERT INTO `eb_category` VALUES (303, 0, '/0/', '產品', 2, 'url', NULL, 0, 1, '2020-08-13 13:53:11', '2020-08-13 13:53:11');
INSERT INTO `eb_category` VALUES (306, 283, '/0/283/', '小米筆記本', 1, '', 'crmebimage/store/2020/08/14/547bfd86471b412eb4f163e07cfc2027uzzul0xoyl.jpg', 1, 0, '2020-08-14 14:19:04', '2021-01-25 10:04:03');
INSERT INTO `eb_category` VALUES (308, 188, '/0/181/184/188/', 'asd ', 2, 'url', NULL, 0, 1, '2020-08-15 09:30:29', '2020-08-15 09:30:29');
INSERT INTO `eb_category` VALUES (316, 139, '/0/113/139/', '公共模板', 5, '/appSetting/publicRoutine/publicRoutineTemplate', NULL, 0, 1, '2020-08-27 14:15:41', '2021-03-05 16:07:41');
INSERT INTO `eb_category` VALUES (317, 452, '/0/452/', '訂單核銷', 5, '/javaMobile/orderCancellation', NULL, 1, 0, '2020-08-27 14:51:47', '2020-09-12 15:19:51');
INSERT INTO `eb_category` VALUES (318, 43, '/0/42/43/', '商品刪除', 5, 'api/admin/store/product/delete', NULL, 0, 0, '2020-08-28 16:12:53', '2020-08-31 10:07:24');
INSERT INTO `eb_category` VALUES (319, 43, '/0/42/43/', '商品上架', 5, 'api/admin/store/product/putOnShell', NULL, 0, 0, '2020-08-28 16:14:14', '2020-08-31 10:07:22');
INSERT INTO `eb_category` VALUES (320, 43, '/0/42/43/', '商品下架', 5, 'api/admin/store/product/offShell', NULL, 0, 0, '2020-08-28 16:14:33', '2020-08-31 10:07:23');
INSERT INTO `eb_category` VALUES (321, 43, '/0/42/43/', '庫存變動', 5, 'api/admin/store/product/stock', NULL, 0, 0, '2020-08-28 16:15:07', '2020-08-31 10:07:21');
INSERT INTO `eb_category` VALUES (322, 43, '/0/42/43/', '虛擬銷量', 5, 'api/admin/store/product/ficti', NULL, 0, 0, '2020-08-28 16:15:59', '2020-08-31 10:07:21');
INSERT INTO `eb_category` VALUES (323, 127, '/0/42/127/', '規格添加', 5, 'api/admin/store/product/rule/save', NULL, 0, 0, '2020-08-28 16:25:25', '2020-08-28 16:26:44');
INSERT INTO `eb_category` VALUES (324, 127, '/0/42/127/', '規格修改', 5, 'api/admin/store/product/rule/update', NULL, 0, 0, '2020-08-28 16:25:40', '2021-02-04 12:16:35');
INSERT INTO `eb_category` VALUES (325, 127, '/0/42/127/', '規格刪除', 5, 'api/admin/store/product/rule/delete', NULL, 0, 0, '2020-08-28 16:26:01', '2021-02-04 15:19:41');
INSERT INTO `eb_category` VALUES (328, 128, '/0/42/128/', '商品評論添加', 5, 'api/admin/store/product/reply/save', NULL, 0, 0, '2020-08-28 16:27:53', '2020-08-28 16:27:53');
INSERT INTO `eb_category` VALUES (329, 128, '/0/42/128/', '商品評論修改', 5, 'api/admin/store/product/reply/update', NULL, 0, 0, '2020-08-28 16:28:18', '2020-08-28 16:28:18');
INSERT INTO `eb_category` VALUES (331, 128, '/0/42/128/', '商品評論刪除', 5, 'api/admin/store/product/reply/delete', NULL, 0, 0, '2020-08-28 16:29:57', '2020-08-28 16:30:02');
INSERT INTO `eb_category` VALUES (333, 128, '/0/42/128/', '商品評論回覆', 5, 'api/admin/store/product/reply/comment', NULL, 0, 0, '2020-08-28 16:30:38', '2020-08-28 16:30:38');
INSERT INTO `eb_category` VALUES (335, 46, '/0/45/46/', '訂單刪除', 5, 'api/admin/store/order/delete', NULL, 0, 0, '2020-08-29 09:33:49', '2021-03-11 09:33:59');
INSERT INTO `eb_category` VALUES (337, 46, '/0/45/46/', '訂單標記', 5, 'api/admin/store/order/mark', NULL, 0, 0, '2020-08-29 09:34:25', '2020-08-29 09:34:25');
INSERT INTO `eb_category` VALUES (338, 46, '/0/45/46/', '訂單退款', 5, 'api/admin/store/order/refund', NULL, 0, 0, '2020-08-29 09:34:38', '2020-08-29 09:34:38');
INSERT INTO `eb_category` VALUES (339, 46, '/0/45/46/', '訂單拒絕退款', 5, 'api/admin/store/order/refund/refuse', NULL, 0, 0, '2020-08-29 09:35:08', '2020-08-29 09:35:08');
INSERT INTO `eb_category` VALUES (340, 46, '/0/45/46/', '訂單發貨', 5, 'api/admin/store/order/send', NULL, 0, 0, '2020-08-29 09:35:33', '2021-03-11 09:34:07');
INSERT INTO `eb_category` VALUES (341, 46, '/0/45/46/', '訂單更新', 5, 'api/admin/store/order/update', NULL, 0, 0, '2020-08-29 09:35:44', '2020-08-29 09:35:44');
INSERT INTO `eb_category` VALUES (345, 48, '/0/47/48/', '用戶修改', 5, 'api/admin/user/update', NULL, 0, 0, '2020-08-29 09:39:12', '2020-08-29 09:39:12');
INSERT INTO `eb_category` VALUES (346, 48, '/0/47/48/', '用戶詳情', 5, 'api/admin/user/infobycondition', NULL, 0, 0, '2020-08-29 09:39:22', '2020-08-29 09:41:16');
INSERT INTO `eb_category` VALUES (347, 48, '/0/47/48/', '用戶分組', 5, 'api/admin/user/group', NULL, 0, 0, '2020-08-29 09:39:31', '2020-08-29 09:39:31');
INSERT INTO `eb_category` VALUES (348, 48, '/0/47/48/', '用戶刪除', 5, 'api/admin/user/delete', NULL, 0, 0, '2020-08-29 09:39:49', '2020-08-29 09:39:49');
INSERT INTO `eb_category` VALUES (349, 48, '/0/47/48/', '用戶打標籤', 5, 'api/admin/user/tag', NULL, 0, 0, '2020-08-29 09:40:02', '2020-08-29 09:40:02');
INSERT INTO `eb_category` VALUES (350, 48, '/0/47/48/', '修改積分余額', 5, 'api/admin/user/operate/founds', NULL, 0, 0, '2020-08-29 09:41:50', '2020-08-29 09:41:50');
INSERT INTO `eb_category` VALUES (351, 162, '/0/47/162/', '用戶等級添加', 5, 'api/admin/system/user/level/save', NULL, 0, 0, '2020-08-29 09:43:32', '2020-08-29 09:44:47');
INSERT INTO `eb_category` VALUES (352, 162, '/0/47/162/', '用戶等級修改', 5, 'api/admin/system/user/level/update', NULL, 0, 0, '2020-08-29 09:46:00', '2020-08-29 09:46:00');
INSERT INTO `eb_category` VALUES (353, 162, '/0/47/162/', '用戶等級刪除', 5, 'api/admin/system/user/level/delete', NULL, 0, 0, '2020-08-29 09:46:13', '2020-08-29 09:46:13');
INSERT INTO `eb_category` VALUES (356, 162, '/0/47/162/', '用戶等級是否顯示', 5, 'api/admin/system/user/level/use', NULL, 0, 0, '2020-08-29 09:47:41', '2020-08-29 09:47:41');
INSERT INTO `eb_category` VALUES (357, 49, '/0/47/49/', '用戶標籤添加', 5, 'api/admin/user/tag/save', NULL, 0, 0, '2020-08-29 09:48:13', '2020-08-29 09:49:20');
INSERT INTO `eb_category` VALUES (358, 49, '/0/47/49/', '用戶標籤修改', 5, 'api/admin/user/tag/update', NULL, 0, 0, '2020-08-29 09:48:26', '2020-08-29 09:49:27');
INSERT INTO `eb_category` VALUES (363, 164, '/0/47/164/', '用戶分組修改', 5, 'api/admin/user/group/update', NULL, 0, 0, '2020-08-29 09:52:23', '2020-08-29 09:52:23');
INSERT INTO `eb_category` VALUES (364, 164, '/0/47/164/', '用戶分組刪除', 5, 'api/admin/user/group/delete', NULL, 0, 0, '2020-08-29 09:52:35', '2020-08-29 09:52:35');
INSERT INTO `eb_category` VALUES (366, 164, '/0/47/164/', '用戶分組列表', 5, 'api/admin/user/group/list', NULL, 0, 0, '2020-08-29 09:53:09', '2020-08-29 09:53:09');
INSERT INTO `eb_category` VALUES (367, 57, '/0/56/57/', '文章添加', 5, 'api/admin/article/save', NULL, 0, 0, '2020-08-29 09:54:14', '2020-08-29 09:54:14');
INSERT INTO `eb_category` VALUES (368, 57, '/0/56/57/', '文章刪除', 5, 'api/admin/article/delete', NULL, 0, 0, '2020-08-29 09:55:05', '2020-08-29 09:55:05');
INSERT INTO `eb_category` VALUES (369, 57, '/0/56/57/', '文章修改', 5, 'api/admin/article/update', NULL, 0, 0, '2020-08-29 09:55:15', '2020-08-29 09:55:15');
INSERT INTO `eb_category` VALUES (372, 57, '/0/56/57/', '文章綁定產品', 5, 'api/admin/article/bind/product', NULL, 0, 0, '2020-08-29 09:56:40', '2020-08-29 09:56:40');
INSERT INTO `eb_category` VALUES (373, 115, '/0/113/114/115/', '微信菜單保存', 5, 'api/admin/wechat/menu/public/create', NULL, 0, 0, '2020-08-29 09:59:41', '2020-08-29 09:59:41');
INSERT INTO `eb_category` VALUES (374, 115, '/0/113/114/115/', '微信菜單刪除', 5, 'api/admin/wechat/menu/public/delete', NULL, 0, 0, '2020-08-29 10:00:02', '2020-08-29 10:00:02');
INSERT INTO `eb_category` VALUES (375, 172, '/0/113/114/141/172/', '關鍵字添加', 5, 'api/admin/wechat/keywords/reply/save', NULL, 0, 0, '2020-08-29 10:02:20', '2020-08-29 10:02:20');
INSERT INTO `eb_category` VALUES (376, 172, '/0/113/114/141/172/', '關鍵字刪除', 5, 'api/admin/wechat/keywords/reply/delete', NULL, 0, 0, '2020-08-29 10:02:48', '2020-08-29 10:02:48');
INSERT INTO `eb_category` VALUES (377, 172, '/0/113/114/141/172/', '關鍵字修改', 5, 'api/admin/wechat/keywords/reply/update', NULL, 0, 0, '2020-08-29 10:03:00', '2020-08-29 10:03:00');
INSERT INTO `eb_category` VALUES (381, 174, '/0/113/114/174/', '微信模板添加', 5, 'api/admin/wechat/template/save', NULL, 0, 0, '2020-08-29 10:05:03', '2020-08-29 10:06:14');
INSERT INTO `eb_category` VALUES (382, 174, '/0/113/114/174/', '微信模板修改', 5, 'api/admin/wechat/template/update', NULL, 0, 0, '2020-08-29 10:05:35', '2020-08-29 10:06:19');
INSERT INTO `eb_category` VALUES (383, 174, '/0/113/114/174/', '微信模板刪除', 5, 'api/admin/wechat/template/delete', NULL, 0, 0, '2020-08-29 10:05:44', '2020-08-29 10:06:24');
INSERT INTO `eb_category` VALUES (385, 174, '/0/113/114/174/', '微信模板狀態更新', 5, 'api/admin/wechat/template/status', NULL, 0, 0, '2020-08-29 10:06:55', '2020-08-29 10:06:55');
INSERT INTO `eb_category` VALUES (387, 174, '/0/113/114/174/', '微信模板行業信息', 5, 'api/admin/wechat/template/industry', NULL, 0, 0, '2020-08-29 10:07:32', '2020-08-29 10:07:32');
INSERT INTO `eb_category` VALUES (389, 140, '/0/113/139/140/', '我的模板添加', 5, 'api/admin/wechat/program/my/temp/save', NULL, 0, 0, '2020-08-29 10:08:31', '2020-08-29 10:08:31');
INSERT INTO `eb_category` VALUES (390, 140, '/0/113/139/140/', '我的模板修改', 5, 'api/admin/wechat/program/my/temp/update', NULL, 0, 0, '2020-08-29 10:08:41', '2020-08-29 10:08:41');
INSERT INTO `eb_category` VALUES (392, 140, '/0/113/139/140/', '我的模板狀態更新', 5, 'api/admin/wechat/program/my/temp/status', NULL, 0, 0, '2020-08-29 10:09:44', '2020-08-29 10:09:44');
INSERT INTO `eb_category` VALUES (393, 316, '/0/113/139/316/', '公共模板行業信息', 5, 'api/admin/wechat/program/category', NULL, 0, 0, '2020-08-29 10:10:28', '2020-08-29 10:10:28');
INSERT INTO `eb_category` VALUES (396, 140, '/0/113/139/140/', '根據公共模板獲取關鍵詞列表', 5, 'api/admin/wechat/program/getWeChatKeywordsByTid', NULL, 0, 0, '2020-08-29 10:11:56', '2020-08-29 10:11:56');
INSERT INTO `eb_category` VALUES (397, 158, '/0/118/119/158/', '優惠券添加', 5, 'api/admin/marketing/coupon/save', NULL, 0, 0, '2020-08-29 10:12:37', '2020-08-29 10:16:13');
INSERT INTO `eb_category` VALUES (398, 158, '/0/118/119/158/', '優惠券狀態更新', 5, 'api/admin/marketing/coupon/update/status', NULL, 0, 0, '2020-08-29 10:13:10', '2020-08-29 10:16:20');
INSERT INTO `eb_category` VALUES (402, 159, '/0/118/119/159/', '領取優惠券', 5, 'api/admin/marketing/coupon/user/receive', NULL, 0, 0, '2020-08-29 10:18:21', '2020-08-29 10:18:48');
INSERT INTO `eb_category` VALUES (403, 54, '/0/51/52/54/', '管理員添加', 5, 'api/admin/system/admin/save', NULL, 0, 0, '2020-08-29 10:22:43', '2020-08-29 10:26:11');
INSERT INTO `eb_category` VALUES (404, 54, '/0/51/52/54/', '管理員修改', 5, 'api/admin/system/admin/update', NULL, 0, 0, '2020-08-29 10:23:00', '2020-08-29 10:26:09');
INSERT INTO `eb_category` VALUES (405, 54, '/0/51/52/54/', '管理員刪除', 5, 'api/admin/system/admin/delete', NULL, 0, 0, '2020-08-29 10:23:11', '2020-08-29 10:26:06');
INSERT INTO `eb_category` VALUES (408, 53, '/0/51/52/53/', '身份添加', 5, 'api/admin/system/role/save', NULL, 0, 0, '2020-08-29 10:26:52', '2020-08-29 10:26:52');
INSERT INTO `eb_category` VALUES (409, 53, '/0/51/52/53/', '身份刪除', 5, 'api/admin/system/role/delete', NULL, 0, 0, '2020-08-29 10:27:07', '2020-08-29 10:27:07');
INSERT INTO `eb_category` VALUES (410, 53, '/0/51/52/53/', '身份修改', 5, 'api/admin/system/role/update', NULL, 0, 0, '2020-08-29 10:27:27', '2020-08-29 10:27:27');
INSERT INTO `eb_category` VALUES (417, 166, '/0/51/165/166/', '城市詳情', 5, 'api/admin/system/city/info', NULL, 0, 0, '2020-08-29 10:34:24', '2020-08-29 10:34:24');
INSERT INTO `eb_category` VALUES (418, 166, '/0/51/165/166/', '城市修改', 5, 'api/admin/system/city/update', NULL, 0, 0, '2020-08-29 10:34:33', '2020-08-29 10:34:33');
INSERT INTO `eb_category` VALUES (419, 166, '/0/51/165/166/', '城市狀態更新', 5, 'api/admin/system/city/update/status', NULL, 0, 0, '2020-08-29 10:34:56', '2020-08-29 10:34:56');
INSERT INTO `eb_category` VALUES (420, 167, '/0/51/165/167/', '物流公司添加', 5, 'api/admin/express/save', NULL, 0, 0, '2020-08-29 10:35:36', '2020-08-29 10:35:36');
INSERT INTO `eb_category` VALUES (421, 167, '/0/51/165/167/', '物流公司修改', 5, 'api/admin/express/update', NULL, 0, 0, '2020-08-29 10:35:52', '2020-08-29 10:35:52');
INSERT INTO `eb_category` VALUES (422, 167, '/0/51/165/167/', '物流公司刪除', 5, 'api/admin/express/delete', NULL, 0, 0, '2020-08-29 10:36:03', '2020-08-29 10:36:03');
INSERT INTO `eb_category` VALUES (425, 168, '/0/51/165/168/', '物流模板添加', 5, 'api/admin/express/shipping/templates/save', NULL, 0, 0, '2020-08-29 10:37:49', '2020-08-29 10:37:49');
INSERT INTO `eb_category` VALUES (426, 168, '/0/51/165/168/', '物流模板修改', 5, 'api/admin/express/shipping/templates/update', NULL, 0, 0, '2020-08-29 10:38:01', '2020-08-29 10:38:01');
INSERT INTO `eb_category` VALUES (427, 168, '/0/51/165/168/', '物流模板刪除', 5, 'api/admin/express/shipping/templates/delete', NULL, 0, 0, '2020-08-29 10:38:11', '2020-08-29 10:38:11');
INSERT INTO `eb_category` VALUES (432, 69, '/0/66/67/69/', '數據組添加', 5, 'api/admin/system/group/save', NULL, 0, 0, '2020-08-29 10:41:33', '2020-08-29 10:41:33');
INSERT INTO `eb_category` VALUES (433, 69, '/0/66/67/69/', '數據組修改', 5, 'api/admin/system/group/update', NULL, 0, 0, '2020-08-29 10:41:49', '2020-08-29 10:41:49');
INSERT INTO `eb_category` VALUES (434, 69, '/0/66/67/69/', '數據組刪除', 5, 'api/admin/system/group/delete', NULL, 0, 0, '2020-08-29 10:41:59', '2020-08-29 10:41:59');
INSERT INTO `eb_category` VALUES (437, 69, '/0/66/67/69/', '組合數據添加', 5, 'api/admin/system/group/data/save', NULL, 0, 0, '2020-08-29 10:43:00', '2020-08-29 10:43:00');
INSERT INTO `eb_category` VALUES (438, 69, '/0/66/67/69/', '組合數據修改', 5, 'api/admin/system/group/data/update', NULL, 0, 0, '2020-08-29 10:43:16', '2020-08-29 10:43:16');
INSERT INTO `eb_category` VALUES (439, 69, '/0/66/67/69/', '組合數據刪除', 5, 'api/admin/system/group/data/delete', NULL, 0, 0, '2020-08-29 10:43:41', '2020-08-29 10:43:41');
INSERT INTO `eb_category` VALUES (442, 250, '/0/66/67/250/', '表單添加', 5, 'api/admin/system/form/temp/save', NULL, 0, 0, '2020-08-29 10:45:23', '2020-08-29 10:45:23');
INSERT INTO `eb_category` VALUES (443, 250, '/0/66/67/250/', '表單刪除', 5, 'api/admin/system/form/temp/delete', NULL, 0, 0, '2020-08-29 10:45:40', '2020-08-29 10:45:40');
INSERT INTO `eb_category` VALUES (444, 250, '/0/66/67/250/', '表單修改', 5, 'api/admin/system/form/temp/update', NULL, 0, 0, '2020-08-29 10:46:06', '2020-08-29 10:46:06');
INSERT INTO `eb_category` VALUES (450, 452, '/0/452/', '訂單統計', 5, '/javaMobile/orderStatistics', NULL, 1, 0, '2020-09-03 10:27:31', '2020-09-12 15:20:13');
INSERT INTO `eb_category` VALUES (452, 0, '/0/', '移動端管理', 5, '/javaMobile', 'mobile-phone', 1, 0, '2020-09-07 11:21:03', '2020-09-12 15:18:48');
INSERT INTO `eb_category` VALUES (454, 100, '/0/100/', '99Api', 6, '99Api', '122', 1, 4, '2020-09-08 12:17:36', '2020-09-08 12:18:44');
INSERT INTO `eb_category` VALUES (459, 118, '/0/118/', '秒殺管理', 5, '/marketing/seckill', NULL, 1, 0, '2020-09-17 10:02:39', '2020-09-17 10:02:39');
INSERT INTO `eb_category` VALUES (460, 459, '/0/118/459/', '秒殺配置', 5, '/marketing/seckill/config', NULL, 1, 0, '2020-09-17 10:37:42', '2020-09-17 10:41:30');
INSERT INTO `eb_category` VALUES (461, 459, '/0/118/459/', '秒殺商品', 5, '/marketing/seckill/list', NULL, 1, 0, '2020-09-17 10:38:27', '2020-09-17 10:41:40');
INSERT INTO `eb_category` VALUES (464, 0, '/0/', '財務', 5, '/financial', 's-finance', 1, 1, '2020-09-17 14:34:44', '2020-09-17 14:34:44');
INSERT INTO `eb_category` VALUES (465, 464, '/0/464/', '財務操作', 5, '/financial/commission', NULL, 1, 0, '2020-09-17 14:35:37', '2020-09-17 14:35:37');
INSERT INTO `eb_category` VALUES (466, 465, '/0/464/465/', '申請提現', 5, '/financial/commission/template', NULL, 1, 0, '2020-09-17 14:36:04', '2020-09-17 14:36:04');
INSERT INTO `eb_category` VALUES (467, 464, '/0/464/', '財務記錄', 5, '/financial/record', NULL, 1, 0, '2020-09-17 14:36:40', '2020-09-17 14:36:40');
INSERT INTO `eb_category` VALUES (468, 467, '/0/464/467/', '充值記錄', 5, '/financial/record/charge', NULL, 1, 0, '2020-09-17 14:36:55', '2020-09-17 14:37:22');
INSERT INTO `eb_category` VALUES (469, 467, '/0/464/467/', '資金監控', 5, '/financial/record/monitor', NULL, 1, 0, '2020-09-17 14:37:35', '2020-09-17 14:37:35');
INSERT INTO `eb_category` VALUES (470, 464, '/0/464/', '佣金記錄', 5, '/financial/brokerage', NULL, 1, 0, '2020-09-17 14:38:16', '2020-09-17 14:38:16');
INSERT INTO `eb_category` VALUES (477, 477, '/0/477/', '22222', 1, '', 'crmebimage/content/2020/10/19/6c8ba5e093384f589d212ff77e898d39kpfzjv8h3c.png', 1, 999999999, '2020-10-20 14:44:07', '2021-01-25 10:02:25');
INSERT INTO `eb_category` VALUES (488, 245, '/0/272/245/', '精品首發', 1, '', NULL, 1, 0, '2020-10-21 10:19:17', '2020-10-21 17:25:31');
INSERT INTO `eb_category` VALUES (492, 118, '/0/118/', '砍價管理', 5, '/marketing/bargain', NULL, 1, 0, '2020-11-16 12:29:25', '2020-11-16 12:29:25');
INSERT INTO `eb_category` VALUES (493, 492, '/0/118/492/', '砍價商品', 5, '/marketing/bargain/bargainGoods', NULL, 1, 0, '2020-11-16 14:19:46', '2020-11-16 14:19:46');
INSERT INTO `eb_category` VALUES (494, 492, '/0/118/492/', '砍價列表', 5, '/marketing/bargain/bargainList', NULL, 1, 0, '2020-11-16 14:38:57', '2020-11-16 14:38:57');
INSERT INTO `eb_category` VALUES (495, 118, '/0/118/', '拼團管理', 5, '/marketing/groupBuy', NULL, 1, 0, '2020-11-19 14:06:51', '2020-11-19 14:06:51');
INSERT INTO `eb_category` VALUES (496, 495, '/0/118/495/', '拼團商品', 5, '/marketing/groupBuy/groupGoods', NULL, 1, 0, '2020-11-19 14:07:32', '2020-11-19 14:07:32');
INSERT INTO `eb_category` VALUES (497, 495, '/0/118/495/', '拼團列表', 5, '/marketing/groupBuy/groupList', NULL, 1, 0, '2020-11-19 14:07:57', '2020-11-19 14:07:57');
INSERT INTO `eb_category` VALUES (500, 0, '/0/', '第三方接口設置', 6, 'short_letter_switch', NULL, 1, 1, '2020-12-10 10:58:25', '2020-12-10 10:59:39');
INSERT INTO `eb_category` VALUES (501, 500, '/0/500/', '短信配置', 6, 'short_letter_switch', '111', 1, 1, '2020-12-10 10:59:08', '2020-12-10 12:05:54');
INSERT INTO `eb_category` VALUES (502, 500, '/0/500/', '採集商品配置', 6, 'copy_product', '127', 1, 1, '2020-12-10 11:00:32', '2020-12-10 12:18:38');
INSERT INTO `eb_category` VALUES (503, 500, '/0/500/', '物流查詢', 6, 'logistics_select', '128', 1, 1, '2020-12-10 11:00:51', '2020-12-10 12:18:57');
INSERT INTO `eb_category` VALUES (504, 500, '/0/500/', '電子面單', 6, 'electronic_sheet', '129', 1, 1, '2020-12-10 11:01:03', '2020-12-10 12:19:02');
INSERT INTO `eb_category` VALUES (505, 51, '/0/51/', '一號通', 5, '/operation/onePass', NULL, 1, 8, '2020-12-10 11:06:44', '2020-12-10 11:07:46');
INSERT INTO `eb_category` VALUES (515, 0, '/0/', '每日新品', 1, '', 'crmebimage/content/2021/01/27/bc4b2735f15c4db588859fca9c0100d1gv880lnjxj.png', 1, 10, '2020-12-22 09:16:27', '2021-03-24 10:58:05');
INSERT INTO `eb_category` VALUES (517, 515, '/0/515/', '12.21日商品', 1, '', 'crmebimage/user/2020/12/15/22f159f3c4f94173b1461dedcb993696i8wlul1mqj.jpg', 1, 10, '2020-12-22 09:34:15', '2021-01-25 10:02:01');
INSERT INTO `eb_category` VALUES (521, 308, '/0/181/184/188/308/', '666', 2, 'url', NULL, 0, 1, '2020-12-26 13:17:41', '2020-12-26 13:17:41');
INSERT INTO `eb_category` VALUES (528, 66, '/0/66/', '素材管理', 5, '/maintain/picture', NULL, 1, 1, '2021-01-23 11:28:28', '2021-01-23 11:29:19');
INSERT INTO `eb_category` VALUES (529, 281, '/0/281/', '書籍', 1, '', 'image/content/2021/01/28/1b98484295084c8086ba2fc622cecd9dzhc0og1owo.jpg', 1, 1, '2021-01-28 16:59:45', '2021-01-28 16:59:45');
INSERT INTO `eb_category` VALUES (534, 515, '/0/515/', '玩偶', 1, '', 'crmebimage/content/2021/03/11/aec3fa817873484dbe9179afa51f9855kzma9srjlq.png', 1, 4, '2021-01-30 18:40:49', '2021-03-31 14:05:06');
INSERT INTO `eb_category` VALUES (540, 54, '/0/51/52/54/', '管理員狀態更新', 5, 'api/admin/system/admin/updateStatus', NULL, 0, 0, '2021-02-04 10:59:10', '2021-02-04 10:59:17');
INSERT INTO `eb_category` VALUES (541, 55, '/0/51/52/55/', '權限列表', 5, 'api/admin/category/list', NULL, 0, 0, '2021-02-04 11:06:43', '2021-02-04 11:06:43');
INSERT INTO `eb_category` VALUES (542, 55, '/0/51/52/55/', '權限新增', 5, 'api/admin/category/save', NULL, 0, 0, '2021-02-04 11:08:11', '2021-02-04 11:08:11');
INSERT INTO `eb_category` VALUES (543, 55, '/0/51/52/55/', '權限刪除', 5, 'api/admin/category/delete', NULL, 0, 0, '2021-02-04 11:11:16', '2021-02-04 11:11:16');
INSERT INTO `eb_category` VALUES (544, 55, '/0/51/52/55/', '權限更新', 5, 'api/admin/category/update', NULL, 0, 0, '2021-02-04 11:11:49', '2021-02-04 11:11:49');
INSERT INTO `eb_category` VALUES (546, 55, '/0/51/52/55/', '更新權限狀態', 5, 'api/admin/category/updateStatus', NULL, 0, 0, '2021-02-04 11:14:19', '2021-02-04 11:14:19');
INSERT INTO `eb_category` VALUES (547, 505, '/0/51/505/', '一號通登錄', 5, 'api/admin/pass/login', NULL, 0, 0, '2021-02-04 11:27:13', '2021-02-04 11:27:13');
INSERT INTO `eb_category` VALUES (548, 505, '/0/51/505/', '一號通註銷', 5, 'api/admin/pass/logout', NULL, 0, 0, '2021-02-04 11:28:06', '2021-02-04 11:28:06');
INSERT INTO `eb_category` VALUES (549, 505, '/0/51/505/', '一號通修改密碼', 5, 'api/admin/pass/update/password', NULL, 0, 0, '2021-02-04 11:28:33', '2021-02-04 11:28:33');
INSERT INTO `eb_category` VALUES (550, 505, '/0/51/505/', '一號通修改手機號碼', 5, 'api/admin/pass/update/phone', NULL, 0, 0, '2021-02-04 11:29:02', '2021-02-04 11:29:02');
INSERT INTO `eb_category` VALUES (551, 505, '/0/51/505/', '一號通獲取驗證碼', 5, 'api/admin/pass/sendUserCode', NULL, 0, 0, '2021-02-04 11:30:38', '2021-02-04 11:30:38');
INSERT INTO `eb_category` VALUES (552, 80, '/0/51/80/', '系統設置保存', 5, 'api/admin/system/config/save/form', NULL, 0, 0, '2021-02-04 11:37:51', '2021-02-04 11:37:51');
INSERT INTO `eb_category` VALUES (553, 505, '/0/51/505/', '修改短信簽名', 5, 'api/admin/sms/modify/sign', NULL, 0, 0, '2021-02-04 11:43:36', '2021-02-04 11:43:36');
INSERT INTO `eb_category` VALUES (554, 505, '/0/51/505/', '短信模板', 5, 'api/admin/sms/temps', NULL, 0, 0, '2021-02-04 11:47:24', '2021-02-04 11:47:24');
INSERT INTO `eb_category` VALUES (555, 505, '/0/51/505/', '申請短信模板', 5, 'api/admin/sms/temp/apply', NULL, 0, 0, '2021-02-04 11:47:52', '2021-02-04 11:47:52');
INSERT INTO `eb_category` VALUES (556, 505, '/0/51/505/', '模板申請記錄', 5, 'api/admin/sms/applys', NULL, 0, 0, '2021-02-04 11:48:41', '2021-02-04 11:48:41');
INSERT INTO `eb_category` VALUES (558, 44, '/0/42/44/', '和權限共用api', 5, '', NULL, 0, 0, '2021-02-04 12:10:01', '2021-02-04 12:10:01');
INSERT INTO `eb_category` VALUES (559, 49, '/0/47/49/', '用戶標籤刪除', 5, 'api/admin/user/tag/delete', NULL, 0, 0, '2021-02-04 15:37:48', '2021-02-04 15:37:48');
INSERT INTO `eb_category` VALUES (561, 164, '/0/47/164/', '用戶分組新增', 5, 'api/admin/user/group/save', NULL, 0, 0, '2021-02-04 16:16:35', '2021-02-04 16:16:35');
INSERT INTO `eb_category` VALUES (562, 57, '/0/56/57/', '文章列表', 5, 'api/admin/article/list', NULL, 0, 0, '2021-02-04 16:27:49', '2021-02-04 16:27:49');
INSERT INTO `eb_category` VALUES (563, 468, '/0/464/467/468/', '充值記錄列表', 5, 'api/admin/user/topUpLog/list', NULL, 0, 0, '2021-02-04 17:02:14', '2021-02-04 17:02:14');
INSERT INTO `eb_category` VALUES (564, 468, '/0/464/467/468/', '充值記錄刪除', 5, 'api/admin/user/topUpLog/delete', NULL, 0, 0, '2021-02-04 17:03:39', '2021-02-04 17:03:39');
INSERT INTO `eb_category` VALUES (565, 130, '/0/51/129/130/', '提貨點列表', 5, 'api/admin/system/store/list', NULL, 0, 0, '2021-02-04 17:08:34', '2021-02-04 17:08:34');
INSERT INTO `eb_category` VALUES (566, 130, '/0/51/129/130/', '新增提貨點', 5, 'api/admin/system/store/save', NULL, 0, 0, '2021-02-04 17:09:13', '2021-02-04 17:09:13');
INSERT INTO `eb_category` VALUES (567, 130, '/0/51/129/130/', '刪除提貨點1', 5, 'api/admin/system/store/delete', NULL, 0, 0, '2021-02-04 17:09:47', '2021-02-04 17:17:15');
INSERT INTO `eb_category` VALUES (568, 130, '/0/51/129/130/', '修改提貨點', 5, 'api/admin/system/store/update', NULL, 0, 0, '2021-02-04 17:10:56', '2021-02-04 17:10:56');
INSERT INTO `eb_category` VALUES (569, 130, '/0/51/129/130/', '提貨點狀態更新', 5, 'api/admin/system/store/update/status', NULL, 0, 0, '2021-02-04 17:11:28', '2021-02-04 17:11:28');
INSERT INTO `eb_category` VALUES (570, 130, '/0/51/129/130/', '刪除提貨點', 5, 'api/admin/system/store/completely/delete', NULL, 0, 0, '2021-02-04 17:17:19', '2021-02-04 17:17:19');
INSERT INTO `eb_category` VALUES (571, 130, '/0/51/129/130/', '恢復提貨點', 5, 'api/admin/system/store/recovery', NULL, 0, 0, '2021-02-04 17:18:07', '2021-02-04 17:18:07');
INSERT INTO `eb_category` VALUES (572, 131, '/0/51/129/131/', '核銷員列表', 5, 'api/admin/system/store/staff/list', NULL, 0, 0, '2021-02-04 17:23:07', '2021-02-04 17:23:07');
INSERT INTO `eb_category` VALUES (573, 131, '/0/51/129/131/', '核銷員新增', 5, 'api/admin/system/store/staff/save', NULL, 0, 0, '2021-02-04 17:23:30', '2021-02-04 17:23:30');
INSERT INTO `eb_category` VALUES (574, 131, '/0/51/129/131/', '核銷員刪除', 5, 'api/admin/system/store/staff/delete', NULL, 0, 0, '2021-02-04 17:23:50', '2021-02-04 17:23:50');
INSERT INTO `eb_category` VALUES (575, 131, '/0/51/129/131/', '核銷員編輯', 5, 'api/admin/system/store/staff/update', NULL, 0, 0, '2021-02-04 17:24:15', '2021-02-04 17:24:15');
INSERT INTO `eb_category` VALUES (576, 131, '/0/51/129/131/', '核銷狀態更新', 5, 'api/admin/system/store/staff/update/status', NULL, 0, 0, '2021-02-04 17:24:46', '2021-02-04 17:24:46');
INSERT INTO `eb_category` VALUES (577, 131, '/0/51/129/131/', '核銷員詳情', 5, 'api/admin/system/store/staff/info', NULL, 0, 0, '2021-02-04 17:25:18', '2021-02-04 17:25:18');
INSERT INTO `eb_category` VALUES (578, 167, '/0/51/165/167/', '物流公司列表', 5, 'api/admin/express/list', NULL, 0, 0, '2021-02-04 17:29:46', '2021-02-04 17:29:46');
INSERT INTO `eb_category` VALUES (579, 167, '/0/51/165/167/', '修改狀態', 5, 'api/admin/express/update/show', NULL, 0, 0, '2021-02-04 17:30:31', '2021-02-04 17:30:31');
INSERT INTO `eb_category` VALUES (580, 167, '/0/51/165/167/', '同步物流公司', 5, 'api/admin/express/sync/express', NULL, 0, 0, '2021-02-04 17:31:00', '2021-02-04 17:31:00');
INSERT INTO `eb_category` VALUES (581, 528, '/0/66/528/', '刪除素材', 5, 'api/admin/system/attachment/delete', NULL, 0, 0, '2021-02-04 17:34:29', '2021-02-04 17:35:23');
INSERT INTO `eb_category` VALUES (582, 66, '/0/66/', '申請授權', 5, '/maintain/authCRMEB', NULL, 1, 0, '2021-02-25 19:04:23', '2021-02-25 19:11:20');
INSERT INTO `eb_category` VALUES (583, 139, '/0/113/139/', '小程序訂閱消息', 5, '/appSetting/publicRoutine/template/0', NULL, 1, 0, '2021-03-05 16:12:51', '2021-03-05 16:18:08');
INSERT INTO `eb_category` VALUES (584, 0, '/0/', '耐克男鞋', 3, 'http://bbs.crmeb.net/', 'crmebimage/store/2021/03/11/5c10e486679d4d6d9fb7f20db15883223zl8pwc117.png', 1, 0, '2021-03-11 12:26:36', '2021-03-11 12:27:00');
INSERT INTO `eb_category` VALUES (594, 0, '/0/', '清明時節', 3, '', 'crmebimage/operation/2021/03/18/3fa25d6e6dac4d5d85c4abf3af168185n1ozehifuw.png', 1, 1, '2021-04-01 15:45:55', '2021-04-01 15:45:55');
INSERT INTO `eb_category` VALUES (595, 0, '/0/', '數碼家電', 1, '', NULL, 1, 999, '2021-05-12 14:56:43', '2021-05-12 14:57:27');
INSERT INTO `eb_category` VALUES (596, 595, '/0/595/', '風扇', 1, '', 'crmebimage/content/2021/05/12/15894cc0b56d45a2badfd95b7227be58a2o2mqnucu.png', 1, 0, '2021-05-12 14:57:08', '2021-05-12 14:58:47');
INSERT INTO `eb_category` VALUES (597, 595, '/0/595/', '空調', 1, '', NULL, 1, 0, '2021-05-12 14:58:19', '2021-05-12 14:58:19');

-- ----------------------------
-- Table structure for eb_express
-- ----------------------------
DROP TABLE IF EXISTS `eb_express`;
CREATE TABLE `eb_express`  (
                               `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快遞公司id',
                               `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快遞公司簡稱',
                               `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快遞公司全稱',
                               `partner_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要月結賬號',
                               `partner_key` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要月結密碼',
                               `net` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要取件網店',
                               `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '賬號',
                               `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密碼',
                               `net_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '網點名稱',
                               `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
                               `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否顯示',
                               `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用',
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE INDEX `code`(`code`) USING BTREE,
                               INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快遞公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_express
-- ----------------------------
INSERT INTO `eb_express` VALUES (572, 'yunda', '韻達快遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (573, 'yuantong', '圓通速遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (574, 'zhongtong', '中通快遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (575, 'shentong', '申通快遞', 1, 1, 1, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (576, 'huitongkuaidi', '百世快遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (577, 'jd', '京東物流', 1, 0, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (578, 'jtexpress', '極兔速遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (579, 'tiantian', '天天快遞', 1, 1, 1, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (580, 'debangwuliu', '德邦', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (581, 'debangkuaidi', '德邦快遞', 1, 0, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (582, 'zhongyouex', '眾郵快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (583, 'youshuwuliu', '優速快遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (584, 'zhongtongkuaiyun', '中通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (585, 'zhaijisong', '宅急送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (586, 'suning', '蘇寧物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (587, 'baishiwuliu', '百世快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (588, 'zhimakaimen', '芝麻開門', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (589, 'yundakuaiyun', '韻達快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (590, 'annengwuliu', '安能快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (591, 'lianhaowuliu', '聯昊通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (592, 'ubonex', '優邦速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (593, 'kuayue', '跨越速運', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (594, 'yuantongkuaiyun', '圓通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (595, 'zhongyouwuliu', '中郵物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (596, 'annto', '安得物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (597, 'danniao', '丹鳥', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (598, 'suer', '速爾快遞', 1, 0, 1, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (599, 'chinaicip', '卓志速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (600, 'zhonghuan', '中環快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (601, 'yimidida', '壹米滴答', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (602, 'shpost', '同城快寄', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (603, 'kuaijiesudi', '快捷速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (604, 'disifang', '遞四方', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (605, 'lntjs', '特急送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (606, 'rrs', '日日順物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (607, 'sxjdfreight', '順心捷達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (608, 'idamalu', '大馬鹿', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (609, 'xinfengwuliu', '信豐物流', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (610, 'ztky', '中鐵快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (611, 'btexpress', '邦泰快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (612, 'tiandihuayu', '天地華宇', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (613, 'lianbangkuaidi', '聯邦快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (614, 'banma', '斑馬物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (615, 'longbanwuliu', '龍邦速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (616, 'flyway', '程光快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (617, 'subida', '速必達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (618, 'jinguangsudikuaijian', '京廣速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (619, 'weitepai', '微特派', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (620, 'yuxinwuliu', '宇鑫物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (621, 'sdto', '速達通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (622, 'huisenky', '匯森速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (623, 'guotongkuaidi', '國通快遞', 1, 1, 1, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (624, 'bsht', '百事亨通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (625, 'jiuyescm', '九曳供應鏈', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (626, 'sunjex', '新傑物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (627, 'zhongtiewuliu', '中鐵物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (628, 'adapost', '安達速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (629, 'wanjiawuliu', '萬家物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (630, 'shenghuiwuliu', '盛輝物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (631, 'zhengyikuaidi', '鑫正一快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (632, 'savor', '海信物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (633, 'qexpress', '易達通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (634, 'sanhuwuliu', '參虎物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (635, 'polarexpress', '極地快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (636, 'rufengda', '如風達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (637, 'wanxiangwuliu', '萬象物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (638, 'zhongtongphone', '中通（帶電話）', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (639, 'lbex', '龍邦物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (640, 'jinan', '金岸物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (641, 'sxexpress', '三象速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (642, 'jiayunmeiwuliu', '加運美', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (643, 'hac56', '瀚朝物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (644, 'la911', '鼎潤物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (645, 'mosuda', '魔速達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (646, 'suteng', '廣東速騰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (647, 'feiyuanvipshop', '飛遠配送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (648, 'pingandatengfei', '平安達騰飛', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (649, 'guexp', '全聯速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (650, 'hengluwuliu', '恆路物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (651, 'wjkwl', '萬家康物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (652, 'xdexpress', '迅達速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (653, 'yw56', '燕文物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (654, 'bflg', '上海繽紛物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (655, 'nebuex', '星雲速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (656, 'unitedex', '聯合速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (657, 'jiajiwuliu', '佳吉快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (658, 'beebird', '鋒鳥物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (659, 'tzky', '鐵中快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (660, 'httx56', '匯通天下物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (661, 'jumstc', '聚盟共建', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (662, 'crazyexpress', '瘋狂快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (663, 'sut56', '速通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (664, 'zengyisudi', '增益速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (665, 'valueway', '美通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (666, 'jssdt56', '時達通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (667, 'yuanfeihangwuliu', '原飛航', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (668, 'zhongsukuaidi', '中速快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (669, 'ane66', '安能快遞', 1, 0, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (670, 'anxl', '安迅物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (671, 'fujisuyun', '富吉速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (672, 'jiajikuaidi', '佳吉快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (673, 'ndwl', '南方傳媒物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (674, 'huangmajia', '黃馬甲', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (675, 'hnht56', '鴻泰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (676, 'shangda', '上大物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (677, 'ytkd', '運通中港快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (678, 'dekuncn', '德坤物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (679, 'quansutong', '全速通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (680, 'cccc58', '中集冷雲', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (681, 'dfwl', '達發物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (682, 'quanfengkuaidi', '全峰快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (683, 'fastgoexpress', '速派快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (684, 'yujtong', '宇捷通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (685, 'chuangyi', '創一快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (686, 'ganzhongnengda', '能達速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (687, 'yidatong', '易達通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (688, 'oneexpress', '一速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (689, 'datianwuliu', '大田物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (690, 'quanyikuaidi', '全一快遞', 1, 0, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (691, 'pjbest', '品駿快遞', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (692, 'shangqiao56', '商橋物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (693, 'tianma', '天馬迅達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (694, 'yousutongda', '優速通達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (695, 'yuananda', '源安達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (696, 'astexpress', '安世通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (697, 'exfresh', '安鮮達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (698, 'jialidatong', '嘉裡大通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (699, 'nanjingshengbang', '晟邦物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (700, 'pfcexpress', '皇家物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (701, 'qinyuan', '秦遠物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (702, 'runhengfeng', '全時速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (703, 'dayangwuliu', '大洋物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (704, 'heimao56', '黑貓速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (705, 'huaxiahuoyun', '華夏貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (706, 'longfx', 'LUCFLOW EXPRESS', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (707, 'zjstky', '蘇通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (708, 'zlink', '三真驛道', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (709, 'hd', '宏遞快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (710, 'hrex', '錦程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (711, 'sfwl', '盛豐物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (712, 'yuanchengwuliu', '遠成物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (713, 'eshunda', '俄順達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (714, 'est365', '東方匯', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (715, 'lijisong', '成都立即送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (716, 'morelink56', 'MoreLink', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (717, 'topspeedex', '中運全速', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (718, 'yunfeng56', '韻豐物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (719, 'express7th', '7號速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (720, 'wherexpess', '威盛快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (721, 'yizhengdasuyun', '一正達速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (722, 'youyou', '優優速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (723, 'ztong', '智通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (724, 'chinapostcb', '中郵電商', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (725, 'hlyex', '好來運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (726, 'jgwl', '景光物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (727, 'jiujiuwl', '久久物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (728, 'minghangkuaidi', '民航快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (729, 'quansu', '全速物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (730, 'tywl99', '天翼物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (731, 'wondersyd', '中郵速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (732, 'yafengsudi', '亞風速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (733, 'ytchengnuoda', '承諾達', 1, 1, 0, '', '', '', 0, 1, 0);
INSERT INTO `eb_express` VALUES (734, 'anxindakuaixi', '安信達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (735, 'chengtong', '城通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (736, 'eupackage', '易優包裹', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (737, 'ftky365', '豐通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (738, 'gslhkd', '聯合快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (739, 'jiayiwuliu', '佳怡物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (740, 'jieborne', '捷邦物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (741, 'jxfex', '集先鋒快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (742, 'luben', '陸本速遞 LUBEN EXPRESS', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (743, 'tykd', '天翼快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (744, 'baitengwuliu', '百騰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (745, 'biaojikuaidi', '彪記快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (746, 'boyol', '貝業物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (747, 'exsuda', 'E速達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (748, 'feikangda', '飛康達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (749, 'jiacheng', '佳成快遞 ', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (750, 'jingshun', '景順物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (751, 'mingliangwuliu', '明亮物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (752, 'shunjiefengda', '順捷豐達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (753, 'sundarexpress', '順達快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (754, 'yaofeikuaidi', '耀飛同城快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (755, '1ziton', '一智通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (756, 'alog', '心怡物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (757, 'bdatong', '八達通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (758, 'bosind', '堡昕德速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (759, 'buytong', '百通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (760, 'changyuwuliu', '長宇物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (761, 'chuanxiwuliu', '傳喜物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (762, 'chunghwa56', '中驊物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (763, 'cnspeedster', '速舟物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (764, 'didasuyun', '遞達速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (765, 'emswuliu', 'EMS物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (766, 'feibaokuaidi', '飛豹快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (767, 'gda', '安的快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (768, 'gdkjk56', '快捷快物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (769, 'guoeryue', '天天快物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (770, 'hotwms', '皇家雲倉', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (771, 'ht22', '海淘物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (772, 'huaqikuaiyun', '華企快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (773, 'jcsuda', '嘉誠速達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (774, 'longcps', '加拿大龍行速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (775, 'newsway', '家家通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (776, 'qbexpress', '秦邦快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (777, 'quanritongkuaidi', '全日通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (778, 'sanshengco', '三盛快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (779, 'shangcheng', '尚橙物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (780, 'shunfenghk', '順豐-繁體', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (781, 'spring56', '春風物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (782, 'sxhongmajia', '紅馬甲物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (783, 'szshihuatong56', '世華通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (784, 'wto56kj', '臣邦同城', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (785, 'xiangteng', '翔騰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (786, 'xunsuexpress', '迅速快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (787, 'yongchangwuliu', '永昌物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (788, 'yuanzhijiecheng', '元智捷誠', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (789, 'yuefengwuliu', '越豐物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (790, 'zhongjiwuliu', '中技物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (791, 'zlxdjwl', '中糧鮮到家物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (792, 'adaexpress', '明大快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (793, 'advancing', '安達信', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (794, 'agopost', '全程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (795, 'ahdf', '德方物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (796, 'ahkbps', '卡邦配送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (797, 'aliexpress', '無憂物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (798, 'anjiatongcheng', '安家同城快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (799, 'anjie88', '安捷物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (800, 'anjiekuaidi', '青島安捷快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (801, 'anlexpress', '新幹線快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (802, 'apgecommerce', 'apgecommerce', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (803, 'ariesfar', '艾瑞斯遠', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (804, 'ausbondexpress', '澳邦國際物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (805, 'auvanda', '中聯速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (806, 'baishiyp', '百世雲配', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (807, 'bangsongwuliu', '邦送物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (808, 'baotongkd', '寶通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (809, 'baoxianda', '報通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (810, 'bazirim', '皮牙子快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (811, 'beckygo', '佰麒快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (812, 'bee001', '蜜蜂速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (813, 'benteng', '奔騰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (814, 'bjqywl', '青雲物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (815, 'bjxsrd', '鑫銳達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (816, 'bljt56', '佰樂捷通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (817, 'bmlchina', '標桿物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (818, 'bqcwl', '百千誠物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (819, 'byht', '展勤快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (820, 'canhold', '能裝能送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (821, 'cbo56', '釧博物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (822, 'ccd', '河南次晨達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (823, 'cdjx56', '捷祥物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (824, 'cdxinchen56', '鑫宸物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (825, 'cex', '城鐵速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (826, 'cfss', '銀雁專送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (827, 'chengji', '城際快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (828, 'chengpei', '河北橙配', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (829, 'chinastarlogistics', '華欣物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (830, 'chinatzx', '同舟行物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (831, 'chllog', '嘉榮物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (832, 'cht361', '誠和通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (833, 'city56', '城市映急', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (834, 'cjkoreaexpress', '大韓通運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (835, 'cneulogistics', '中歐物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (836, 'cpsair', '華中快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (837, 'cqxingcheng', '重慶星程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (838, 'crossbox', '環旅快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (839, 'csxss', '新時速物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (840, 'czwlyn', '雲南誠中物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (841, 'dadaoex', '大道物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (842, 'dande56', '丹遞56', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (843, 'dasu', '達速物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (844, 'dechuangwuliu', '深圳德創物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (845, 'decnlh', '德中快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (846, 'dfkuaidi', '東風快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (847, 'dfpost', '達方物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (848, 'di5pll', '遞五方雲倉', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (849, 'diantongkuaidi', '店通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (850, 'dianyi', '雲南滇驛物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (851, 'dingdong', '叮咚快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (852, 'djy56', '天翔東捷運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (853, 'donghanwl', '東瀚物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (854, 'donghong', '東紅物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (855, 'dongjun', '成都東駿物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (856, 'duodao56', 'duodao56', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (857, 'edaeuexpress', '易達快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (858, 'efspost', 'EFSPOST', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (859, 'el56', '易聯通達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (860, 'eusacn', '優莎速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (861, 'excocotree', '可可樹美中速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (862, 'fanyukuaidi', '凡宇快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (863, 'fastzt', '正途供應鏈', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (864, 'fbkd', '飛邦快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (865, 'feihukuaidi', '飛狐快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (866, 'feikuaida', '飛快達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (867, 'fenghuangkuaidi', '鳳凰快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (868, 'fengyee', '豐羿', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (869, 'flysman', '飛力士物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (870, 'fsexp', '全速快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (871, 'ftlexpress', '法翔速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (872, 'fyex', '飛雲快遞系統', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (873, 'gaotieex', '高鐵快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (874, 'gdct56', '廣東誠通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (875, 'gdqwwl', '全網物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (876, 'gdrz58', '容智快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (877, 'gdxp', '新鵬快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (878, 'ghl', '環創物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (879, 'gjwl', '冠捷物流 ', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (880, 'gml', '英脈物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (881, 'goldjet', '高捷快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (882, 'gongsuda', '共速達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (883, 'gooday365', '日日順智慧物聯', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (884, 'gscq365', '哥士傳奇速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (885, 'gswtkd', '萬通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (886, 'gtongsudi', '廣通速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (887, 'gttexpress', 'GTT EXPRESS快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (888, 'guangdongtonglu', '廣東通路', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (889, 'guosong', '國送快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (890, 'gxwl', '光線速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (891, 'gzxingcheng', '貴州星程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (892, 'haihongwangsong', '海紅網送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (893, 'haimengsudi', '海盟速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (894, 'haixingqiao', '海星橋快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (895, 'haizhongzhuanyun', '海中轉運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (896, 'hanfengjl', '翰豐快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (897, 'hangrui', '上海航瑞貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (898, 'hangyu', '航宇快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (899, 'haoyoukuai', '好又快物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (900, 'happylink', '開心快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (901, 'hdcexpress', '匯達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (902, 'hengrui56', '恆瑞物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (903, 'hexinexpress', '合心速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (904, 'hgy56', '環國運物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (905, 'hhair56', '華瀚快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (906, 'hjs', '猴急送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (907, 'hlkytj', '互聯快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (908, 'hlpgyl', '共聯配', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (909, 'hltop', '海聯快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (910, 'hmus', '華美快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (911, 'hnfy', '飛鷹物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (912, 'hnqst', '河南全速通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (913, 'hnssd56', '順時達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (914, 'hnzqwl', '中強物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (915, 'homexpress', '居家通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (916, 'hongbeixin', '紅背心', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (917, 'hongpinwuliu', '宏品物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (918, 'hongywl', '紅遠物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (919, 'hrbzykd', '卓燁快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (920, 'hre', '高鐵速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (921, 'hsgtsd', '海碩高鐵速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (922, 'htongexpress', '華通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (923, 'htwd', '華通務達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (924, 'huada', '華達快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (925, 'huandonglg', '環東物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (926, 'huiqiangkuaidi', '匯強快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (927, 'huoban', '蘭州夥伴物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (928, 'hutongwuliu', '戶通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (929, 'hyeship', '鴻遠物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (930, 'hyytes', '恆宇運通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (931, 'hzpl', '華航快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (932, 'idada', '大達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (933, 'jdexpressusa', '駿達快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (934, 'jdpplus', '急遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (935, 'jiajiatong56', '佳家通貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (936, 'jiajiawl', '加佳物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (937, 'jiazhoumao', '加州貓速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (938, 'jieanda', '捷安達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (939, 'jinchengwuliu', '錦程物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (940, 'jindawuliu', '金大物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (941, 'jintongkd', '勁通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (942, 'jinyuekuaidi', '晉越快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (943, 'jisu', '冀速物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (944, 'jiugong', '九宮物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (945, 'jiuyicn', '久易快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (946, 'jixianda', '急先達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (947, 'jjx888', '佳捷翔物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (948, 'jsexpress', '駿紳物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (949, 'juding', '聚鼎物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (950, 'juwu', '聚物物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (951, 'juzhongda', '聚中大', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (952, 'kejie', '科捷物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (953, 'kerrytj', '嘉裡大榮物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (954, 'kfwnet', '快服務', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (955, 'khzto', '柬埔寨中通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (956, 'koalaexp', '考拉速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (957, 'ksudi', '快速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (958, 'kuai8', '快8速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (959, 'kuaidawuliu', '快達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (960, 'kuaitao', '快淘快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (961, 'kuaiyouda', '四川快優達速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (962, 'kxda', '凱信達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (963, 'lanbiaokuaidi', '藍鏢快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (964, 'lanhukuaidi', '藍弧快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (965, 'lasy56', '林安物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (966, 'lbbk', '立白寶凱物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (967, 'ledaowuliu', '樂道物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (968, 'ledii', '樂遞供應鏈', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (969, 'letseml', '美聯快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (970, 'lianbangkuaidien', '聯邦快遞-英文', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (971, 'lianyun', '聯運快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (972, 'lishi', '麗獅物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (973, 'littlebearbear', '小熊物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (974, 'longlangkuaidi', '隆浪快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (975, 'longvast', '長風物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (976, 'lqht', '恆通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (977, 'ltexp', '樂天速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (978, 'lutong', '魯通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (979, 'mailikuaidi', '麥力快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (980, 'mailongdy', '邁隆遞運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (981, 'mangguo', '芒果速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (982, 'mchy', '木春貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (983, 'meidaexpress', '美達快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (984, 'meitai', '美泰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (985, 'milkyway', '銀河物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (986, 'minbangsudi', '民邦速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (987, 'mjexp', '美龍快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (988, 'mxe56', '中俄速通（淼信）', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (989, 'nalexpress', '新亞物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (990, 'nedahm', '紅馬速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (991, 'nell', '尼爾快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (992, 'niuzaiexpress', '牛仔速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (993, 'njhaobo', '浩博物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (994, 'nmhuahe', '華赫物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (995, 'nntengda', '騰達速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (996, 'onway', '昂威物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (997, 'overseaex', '波音速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (998, 'peex', '派爾快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (999, 'peisihuoyunkuaidi', '配思貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1000, 'peixingwuliu', '陪行物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1001, 'pengcheng', '鵬程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1002, 'pinsuxinda', '品速心達快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1003, 'pinxinkuaidi', '品信快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1004, 'pmt0704be', '龍行天下', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1005, 'polarisexpress', '北極星快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1006, 'pzhjst', '急順通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1007, 'qhxykd', '雪域快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1008, 'qhxyyg', '雪域易購', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1009, 'qianli', '千里速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1010, 'qskdyxgs', '千順快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1011, 'quanchuan56', '全川物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1012, 'quanjitong', '全際通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1013, 'quantwl', '全通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1014, 'quanxintong', '全信通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1015, 'qzx56', '全之鑫物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1016, 'rhtexpress', '睿和泰速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1017, 'riyuwuliu', '日昱物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1018, 'rokin', '榮慶物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1019, 'rrskx', '日日順快線', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1020, 'santaisudi', '三態速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1021, 'sccod', '豐程物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1022, 'scsujiada', '速佳達快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1023, 'scxingcheng', '四川星程快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1024, 'sczpds', '速呈', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1025, 'sdsy888', '首達速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1026, 'sfift', '十方通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1027, 'sfjhd', '聖飛捷快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1028, 'shanda56', '衫達快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1029, 'shanghaikuaitong', '上海快通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1030, 'shangtuguoji', '尚途國際貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1031, 'shaoke', '捎客物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1032, 'shd56', '商海德物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1033, 'shenganwuliu', '聖安物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1034, 'shengtongscm', '盛通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1035, 'shenjun', '神駿物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1036, 'shenma', '神馬快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1037, 'shiningexpress', '陽光快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1038, 'shipbyace', '王牌快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1039, 'shipsoho', '蘇豪快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1040, 'shiyunkuaidi', '世運快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1041, 'shunfengtongcheng', '順豐同城', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1042, 'shunjieda', '順捷達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1043, 'shunshid', '順士達速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1044, 'signedexpress', '簽收快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1045, 'sihaiet', '四海快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1046, 'sihiexpress', '四海捷運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1047, 'sixroad', '易普遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1048, 'sofast56', '嗖一下同城快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1049, 'speeda', '行必達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1050, 'speedoex', '申必達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1051, 'staky', '首通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1052, 'starex', '星速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1053, 'staryvr', '星運快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1054, 'stkd', '順通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1055, 'subaoex', '速豹', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1056, 'sucheng', '速呈宅配', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1057, 'sucmj', '特急便物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1058, 'sufengkuaidi', '速風快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1059, 'suijiawuliu', '穗佳物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1060, 'sujievip', '鄭州速捷', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1061, 'sunspeedy', '新速航', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1062, 'supinexpress', '速品快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1063, 'szuem', '聯運通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1064, 'taijin', '泰進物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1065, 'taimek', '天美快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1066, 'tianxiang', '天翔快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1067, 'tianzong', '天縱物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1068, 'timedg', '萬家通快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1069, 'tlky', '天聯快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1070, 'tmg', '株式會社T.M.G', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1071, 'tongdaxing', '通達興物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1072, 'tonghetianxia', '通和天下', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1073, 'ugoexpress', '郵鴿速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1074, 'uluckex', '優聯吉運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1075, 'vps', '維普恩物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1076, 'wanboex', '萬博快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1077, 'wandougongzhu', '豌豆物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1078, 'wanjiatong', '寧夏萬家通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1079, 'wdm', '萬達美', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1080, 'westwing', '西翼物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1081, 'wexpress', '威速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1082, 'winit', '萬邑通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1083, 'wlfast', '凡仕特物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1084, 'wowvip', '沃埃家', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1085, 'wtdchina', '威時沛運貨運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1086, 'wuliuky', '五六快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1087, 'wuyuansudi', '伍圓速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1088, 'xdshipping', '國晶物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1089, 'xflt56', '藍天物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1090, 'xianchengliansudi', '西安城聯速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1091, 'xiangdawuliu', '湘達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1092, 'xianglongyuntong', '祥龍運通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1093, 'xilaikd', '西安喜來快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1094, 'xingyuankuaidi', '新元快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1095, 'xinning', '新寧物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1096, 'xsrd', '鑫世銳達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1097, 'xtb', '鑫通寶物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1098, 'xyd666', '鑫遠東速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1099, 'yatfai', '一輝物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1100, 'ycgky', '遠成快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1101, 'ydglobe', '雲達通', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1102, 'ydhex', 'YDH', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1103, 'yhtlogistics', '宇航通物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1104, 'yibangwuliu', '一邦速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1105, 'yidihui', '驛遞匯速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1106, 'yiex', '宜送物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1107, 'yifankd', '藝凡快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1108, 'yihangmall', '易航物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1109, 'yilingsuyun', '億領速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1110, 'yinjiesudi', '銀捷速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1111, 'yiqisong', '一起送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1112, 'yisong', '宜送', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1113, 'yitongda', '易通達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1114, 'yiyou', '易郵速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1115, 'yjhgo', '武漢優進匯', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1116, 'ynztsy', '縱通速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1117, 'youjia', '友家速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1118, 'youlai', '郵來速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1119, 'ypsd', '壹品速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1120, 'ytky168', '運通快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1121, 'yuandun', '遠盾物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1122, 'yue777', '玥瑪速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1123, 'yufeng', '御風速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1124, 'yujiawl', '宇佳物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1125, 'yuntong', '運通速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1126, 'yuntongkuaidi', '運通中港', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1127, 'ywexpress', '遠為快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1128, 'yyexp', '西安運逸快遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1129, 'yyqc56', '一運全成物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1130, 'zf365', '珠峰速運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1131, 'zhdwl', '眾輝達物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1132, 'zhitengwuliu', '志騰物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1133, 'zhongtianwanyun', '中天萬運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1134, 'zhongxinda', '忠信達', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1135, 'zhpex', '眾派速遞', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1136, 'zhuoshikuaiyun', '卓實快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1137, 'zjcy56', '創運物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1138, 'zsda56', '轉瞬達集運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1139, 'zsky123', '準實快運', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1140, 'zsmhwl', '明輝物流', 0, 0, 0, '', '', '', 0, 1, 1);
INSERT INTO `eb_express` VALUES (1141, 'zy100', '中遠快運', 0, 0, 0, '', '', '', 0, 1, 1);

-- ----------------------------
-- Table structure for eb_shipping_templates
-- ----------------------------
DROP TABLE IF EXISTS `eb_shipping_templates`;
CREATE TABLE `eb_shipping_templates`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '編號',
                                          `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名稱',
                                          `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '計費方式',
                                          `appoint` tinyint(1) NOT NULL DEFAULT 0 COMMENT '指定包郵',
                                          `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
                                          `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                          `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '運費模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_shipping_templates
-- ----------------------------
INSERT INTO `eb_shipping_templates` VALUES (1, '全國包郵', 1, 0, 99, '2021-03-08 11:06:55', '2021-03-08 11:06:55');

-- ----------------------------
-- Table structure for eb_shipping_templates_free
-- ----------------------------
DROP TABLE IF EXISTS `eb_shipping_templates_free`;
CREATE TABLE `eb_shipping_templates_free`  (
                                               `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '編號',
                                               `temp_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板ID',
                                               `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市ID',
                                               `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
                                               `number` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '包郵件數',
                                               `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '包郵金額',
                                               `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '計費方式',
                                               `uniqid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分組唯一值',
                                               `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否無效',
                                               `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                               `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '運費模板包郵' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_shipping_templates_region
-- ----------------------------
DROP TABLE IF EXISTS `eb_shipping_templates_region`;
CREATE TABLE `eb_shipping_templates_region`  (
                                                 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '編號',
                                                 `temp_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板ID',
                                                 `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市ID',
                                                 `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
                                                 `first` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '首件',
                                                 `first_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '首件運費',
                                                 `renewal` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '續件',
                                                 `renewal_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '續件運費',
                                                 `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '計費方式 1按件數 2按重量 3按體積',
                                                 `uniqid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分組唯一值',
                                                 `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否無效',
                                                 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                                 `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1851 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '運費模板指定區域費用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_shipping_templates_region
-- ----------------------------
INSERT INTO `eb_shipping_templates_region` VALUES (1482, 1, 2, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1483, 1, 7363, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1484, 1, 13268, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1485, 1, 18128, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1486, 1, 24371, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1487, 1, 26779, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1488, 1, 32688, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1489, 1, 38160, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1490, 1, 44570, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1491, 1, 49190, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1492, 1, 52018, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1493, 1, 58247, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1494, 1, 61804, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1495, 1, 66813, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1496, 1, 67748, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1497, 1, 69390, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1498, 1, 71850, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1499, 1, 72975, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1500, 1, 76726, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1501, 1, 79163, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1502, 1, 81000, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1503, 1, 84092, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1504, 1, 87613, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1505, 1, 92738, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1506, 1, 96064, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1507, 1, 99538, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1508, 1, 100904, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1509, 1, 101772, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1510, 1, 101884, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1511, 1, 104457, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1512, 1, 107065, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1513, 1, 108166, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1514, 1, 109847, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1515, 1, 110889, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1516, 1, 112552, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1517, 1, 113777, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1518, 1, 114940, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1519, 1, 115225, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1520, 1, 117932, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1521, 1, 119789, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1522, 1, 121081, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1523, 1, 122142, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1524, 1, 122730, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1525, 1, 123698, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1526, 1, 125249, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1527, 1, 126156, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1528, 1, 127070, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1529, 1, 127834, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1530, 1, 128421, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1531, 1, 129977, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1532, 1, 131738, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1533, 1, 133209, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1534, 1, 135392, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1535, 1, 137206, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1536, 1, 138721, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1537, 1, 139340, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1538, 1, 140601, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1539, 1, 141361, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1540, 1, 142786, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1541, 1, 143990, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1542, 1, 145666, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1543, 1, 149079, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1544, 1, 150915, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1545, 1, 151830, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1546, 1, 152413, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1547, 1, 153313, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1548, 1, 154201, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1549, 1, 155076, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1550, 1, 156713, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1551, 1, 157130, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1552, 1, 158623, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1553, 1, 159769, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1554, 1, 161651, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1555, 1, 161793, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1556, 1, 167905, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1557, 1, 169375, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1558, 1, 170724, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1559, 1, 173635, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1560, 1, 174764, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1561, 1, 176920, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1562, 1, 178999, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1563, 1, 180743, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1564, 1, 182538, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1565, 1, 185201, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1566, 1, 186657, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1567, 1, 187441, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1568, 1, 189402, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1569, 1, 191020, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1570, 1, 194395, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1571, 1, 197850, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1572, 1, 203852, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1573, 1, 205101, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1574, 1, 206438, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1575, 1, 209250, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1576, 1, 214260, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1577, 1, 215955, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1578, 1, 216449, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1579, 1, 221610, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1580, 1, 224650, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1581, 1, 226469, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1582, 1, 227482, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1583, 1, 228630, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1584, 1, 229844, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1585, 1, 230476, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1586, 1, 230981, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1587, 1, 231499, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1588, 1, 233236, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1589, 1, 234109, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1590, 1, 235483, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1591, 1, 237607, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1592, 1, 239084, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1593, 1, 241180, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1594, 1, 242634, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1595, 1, 243399, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1596, 1, 244378, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1597, 1, 247478, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1598, 1, 248059, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1599, 1, 249098, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1600, 1, 251197, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1601, 1, 253905, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1602, 1, 256112, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1603, 1, 258160, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1604, 1, 260230, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:25', '2021-03-19 16:30:25');
INSERT INTO `eb_shipping_templates_region` VALUES (1605, 1, 262699, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1606, 1, 264862, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1607, 1, 265677, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1608, 1, 266521, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1609, 1, 269107, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1610, 1, 269654, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1611, 1, 270222, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1612, 1, 274444, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1613, 1, 277615, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1614, 1, 280562, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1615, 1, 282841, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1616, 1, 285861, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1617, 1, 291235, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1618, 1, 298025, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1619, 1, 301711, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1620, 1, 304309, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1621, 1, 306339, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1622, 1, 313063, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1623, 1, 320179, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1624, 1, 326706, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1625, 1, 330547, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1626, 1, 333140, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1627, 1, 336050, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1628, 1, 337144, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1629, 1, 344133, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1630, 1, 349382, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1631, 1, 355972, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1632, 1, 361375, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1633, 1, 367396, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1634, 1, 370304, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1635, 1, 372971, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1636, 1, 376365, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1637, 1, 379245, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1638, 1, 382878, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1639, 1, 383890, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1640, 1, 387707, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1641, 1, 389719, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1642, 1, 392737, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1643, 1, 395254, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1644, 1, 396611, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1645, 1, 398169, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1646, 1, 403311, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1647, 1, 408287, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1648, 1, 411925, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1649, 1, 417174, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1650, 1, 420258, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1651, 1, 420825, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1652, 1, 424449, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1653, 1, 425508, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1654, 1, 427710, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1655, 1, 429501, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1656, 1, 432415, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1657, 1, 432829, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1658, 1, 434548, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1659, 1, 437779, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1660, 1, 440639, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1661, 1, 445040, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1662, 1, 446212, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1663, 1, 447268, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1664, 1, 449865, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1665, 1, 452124, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1666, 1, 453799, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1667, 1, 455283, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1668, 1, 456303, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1669, 1, 459251, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1670, 1, 463141, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1671, 1, 465105, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1672, 1, 467562, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1673, 1, 468660, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1674, 1, 470123, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1675, 1, 472709, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1676, 1, 476148, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1677, 1, 479103, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1678, 1, 481319, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1679, 1, 483251, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1680, 1, 486129, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1681, 1, 487721, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1682, 1, 488589, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1683, 1, 488954, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1684, 1, 490106, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1685, 1, 490919, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1686, 1, 492341, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1687, 1, 494394, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1688, 1, 496438, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1689, 1, 498104, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1690, 1, 499489, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1691, 1, 501867, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1692, 1, 502828, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1693, 1, 504366, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1694, 1, 505298, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1695, 1, 506616, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1696, 1, 507255, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1697, 1, 507557, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1698, 1, 508648, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1699, 1, 510408, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1700, 1, 511463, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1701, 1, 513434, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1702, 1, 514790, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1703, 1, 516858, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1704, 1, 517933, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1705, 1, 518407, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1706, 1, 518808, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1707, 1, 519929, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1708, 1, 521166, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1709, 1, 522786, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1710, 1, 524814, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1711, 1, 525638, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1712, 1, 527443, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1713, 1, 528339, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1714, 1, 529345, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1715, 1, 529878, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1716, 1, 530060, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1717, 1, 530070, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1718, 1, 530468, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1719, 1, 533329, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1720, 1, 540700, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1721, 1, 545533, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1722, 1, 550275, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1723, 1, 551809, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1724, 1, 552358, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1725, 1, 554142, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1726, 1, 556077, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1727, 1, 560191, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1728, 1, 563242, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1729, 1, 565735, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1730, 1, 568202, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1731, 1, 570733, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1732, 1, 576992, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1733, 1, 578485, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1734, 1, 581870, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1735, 1, 585049, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1736, 1, 588538, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1737, 1, 589779, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1738, 1, 592598, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1739, 1, 594864, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1740, 1, 596525, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1741, 1, 599659, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1742, 1, 604132, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1743, 1, 605834, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1744, 1, 607029, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1745, 1, 609309, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1746, 1, 610607, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1747, 1, 614530, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1748, 1, 617670, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1749, 1, 619017, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1750, 1, 622734, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1751, 1, 624373, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1752, 1, 626181, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1753, 1, 627981, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1754, 1, 628776, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1755, 1, 629781, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1756, 1, 631276, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1757, 1, 631811, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1758, 1, 632971, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1759, 1, 634006, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1760, 1, 635219, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1761, 1, 636688, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1762, 1, 637778, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1763, 1, 638092, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1764, 1, 639368, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1765, 1, 639802, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1766, 1, 640107, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1767, 1, 640333, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1768, 1, 640675, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1769, 1, 642571, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1770, 1, 643863, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1771, 1, 644423, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1772, 1, 645076, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1773, 1, 646392, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1774, 1, 646579, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1775, 1, 649979, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1776, 1, 650575, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1777, 1, 652581, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1778, 1, 655295, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1779, 1, 657848, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1780, 1, 660643, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1781, 1, 663046, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1782, 1, 667681, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1783, 1, 669707, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1784, 1, 671120, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1785, 1, 672330, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1786, 1, 672385, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1787, 1, 672577, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1788, 1, 673463, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1789, 1, 676215, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1790, 1, 677568, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1791, 1, 678560, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1792, 1, 680191, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1793, 1, 680815, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1794, 1, 682322, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1795, 1, 684415, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1796, 1, 687916, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1797, 1, 689265, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1798, 1, 690095, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1799, 1, 691278, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1800, 1, 693040, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1801, 1, 693342, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1802, 1, 693672, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1803, 1, 694220, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1804, 1, 694478, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1805, 1, 694846, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1806, 1, 695260, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1807, 1, 695883, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1808, 1, 696252, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1809, 1, 696928, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1810, 1, 697887, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1811, 1, 698441, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1812, 1, 699583, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1813, 1, 699773, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1814, 1, 700070, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1815, 1, 700489, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1816, 1, 701559, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1817, 1, 702104, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1818, 1, 703119, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1819, 1, 704779, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1820, 1, 705145, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1821, 1, 708117, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1822, 1, 709792, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1823, 1, 711218, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1824, 1, 712893, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1825, 1, 713697, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1826, 1, 714402, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1827, 1, 717531, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1828, 1, 719868, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1829, 1, 720118, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1830, 1, 722024, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1831, 1, 725488, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1832, 1, 727730, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1833, 1, 729928, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1834, 1, 730843, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:26', '2021-03-19 16:30:26');
INSERT INTO `eb_shipping_templates_region` VALUES (1835, 1, 734179, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1836, 1, 736051, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1837, 1, 737856, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1838, 1, 737861, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1839, 1, 739957, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1840, 1, 740510, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1841, 1, 742126, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1842, 1, 742636, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1843, 1, 743938, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1844, 1, 745674, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1845, 1, 748553, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1846, 1, 749571, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1847, 1, 749930, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1848, 1, 749957, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1849, 1, 752150, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');
INSERT INTO `eb_shipping_templates_region` VALUES (1850, 1, 752169, '[[0,0]]', 1.00, 10.00, 1.00, 10.00, 1, 'ee27f12849a0ef1ba9cfa345214b61a0', 1, '2021-03-19 16:30:27', '2021-03-19 16:30:27');

-- ----------------------------
-- Table structure for eb_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `eb_sms_record`;
CREATE TABLE `eb_sms_record`  (
                                  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '短信發送記錄編號',
                                  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短信平台賬號',
                                  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接受短信的手機號',
                                  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信內容',
                                  `add_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '添加記錄ip',
                                  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '短信模板ID',
                                  `resultcode` int(6) UNSIGNED NULL DEFAULT NULL COMMENT '狀態碼 100=成功,130=失敗,131=空號,132=停機,133=關機,134=無狀態',
                                  `record_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '發送記錄id',
                                  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信平台返回信息',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信發送記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain`;
CREATE TABLE `eb_store_bargain`  (
                                     `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍價商品ID',
                                     `product_id` int(11) UNSIGNED NOT NULL COMMENT '關聯商品ID',
                                     `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '砍價活動名稱',
                                     `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '砍價活動圖片',
                                     `unit_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '單位名稱',
                                     `stock` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '庫存',
                                     `sales` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '銷量',
                                     `images` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '砍價商品輪播圖',
                                     `start_time` bigint(14) UNSIGNED NOT NULL COMMENT '砍價開啟時間',
                                     `stop_time` bigint(14) UNSIGNED NOT NULL COMMENT '砍價結束時間',
                                     `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '砍價商品名稱',
                                     `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍價金額',
                                     `min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍價商品最低價',
                                     `num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '購買數量限制——單個活動每個用戶發起砍價次數限制',
                                     `bargain_max_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用戶每次砍價的最大金額',
                                     `bargain_min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用戶每次砍價的最小金額',
                                     `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '幫砍次數——單個商品用戶可以幫砍的次數',
                                     `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '砍價狀態 0(到砍價時間不自動開啟)  1(到砍價時間自動開啟時間)',
                                     `give_integral` int(11) NULL DEFAULT 0 COMMENT '反多少積分',
                                     `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '砍價活動簡介',
                                     `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本價',
                                     `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
                                     `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推薦0不推薦1推薦',
                                     `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除 0未刪除 1刪除',
                                     `add_time` bigint(14) UNSIGNED NULL DEFAULT NULL COMMENT '添加時間',
                                     `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包郵 0不包郵 1包郵',
                                     `postage` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '郵費',
                                     `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '砍價規則',
                                     `look` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍價商品瀏覽量',
                                     `share` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍價商品分享量',
                                     `temp_id` int(11) NULL DEFAULT NULL COMMENT '運費模板ID',
                                     `weight` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '重量',
                                     `volume` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '體積',
                                     `quota` int(10) NOT NULL DEFAULT 0 COMMENT '限購總數',
                                     `quota_show` int(10) NOT NULL DEFAULT 0 COMMENT '限量總數顯示',
                                     `people_num` int(11) NULL DEFAULT NULL COMMENT '砍價人數——需要多少人砍價成功',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍價表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user`;
CREATE TABLE `eb_store_bargain_user`  (
                                          `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用戶參與砍價表ID',
                                          `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用戶ID',
                                          `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍價商品id',
                                          `bargain_price_min` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍價的最低價',
                                          `bargain_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '砍價金額',
                                          `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍掉的價格',
                                          `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '狀態 1參與中 2 活動結束參與失敗 3活動結束參與成功',
                                          `add_time` bigint(14) UNSIGNED NULL DEFAULT NULL COMMENT '參與時間',
                                          `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否取消',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶參與砍價表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user_help`;
CREATE TABLE `eb_store_bargain_user_help`  (
                                               `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍價用戶幫助表ID',
                                               `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '幫助的用戶id',
                                               `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍價商品ID',
                                               `bargain_user_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用戶參與砍價表id',
                                               `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '幫助砍價多少金額',
                                               `add_time` bigint(14) UNSIGNED NULL DEFAULT NULL COMMENT '添加時間',
                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍價用戶幫助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_cart`;
CREATE TABLE `eb_store_cart`  (
                                  `id` bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '購物車表ID',
                                  `uid` int(10) UNSIGNED NOT NULL COMMENT '用戶ID',
                                  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '類型',
                                  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
                                  `product_attr_unique` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品屬性',
                                  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品數量',
                                  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否為立即購買',
                                  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼團id',
                                  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒殺商品ID',
                                  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '砍價id',
                                  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT 'g',
                                  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '購物車狀態',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `user_id`(`uid`) USING BTREE,
                                  INDEX `goods_id`(`product_id`) USING BTREE,
                                  INDEX `uid`(`uid`) USING BTREE,
                                  INDEX `uid_2`(`uid`) USING BTREE,
                                  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
                                  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '購物車表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination`;
CREATE TABLE `eb_store_combination`  (
                                         `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼團商品ID',
                                         `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
                                         `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商戶id',
                                         `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推薦圖',
                                         `images` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '輪播圖',
                                         `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活動標題',
                                         `attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活動屬性',
                                         `people` int(2) UNSIGNED NOT NULL COMMENT '參團人數',
                                         `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '簡介',
                                         `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '價格',
                                         `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
                                         `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '銷量',
                                         `stock` int(10) UNSIGNED NOT NULL COMMENT '庫存',
                                         `add_time` bigint(14) NOT NULL COMMENT '添加時間',
                                         `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推薦',
                                         `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '商品狀態',
                                         `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
                                         `combination` tinyint(1) UNSIGNED NULL DEFAULT 1,
                                         `mer_use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '商戶是否可用1可用0不可用',
                                         `is_postage` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否包郵1是0否',
                                         `postage` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '郵費',
                                         `start_time` bigint(14) UNSIGNED NOT NULL COMMENT '拼團開始時間',
                                         `stop_time` bigint(14) UNSIGNED NOT NULL COMMENT '拼團結束時間',
                                         `effective_time` int(11) NOT NULL DEFAULT 0 COMMENT '拼團訂單有效時間(小時)',
                                         `cost` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '拼圖商品成本',
                                         `browse` int(11) NULL DEFAULT 0 COMMENT '瀏覽量',
                                         `unit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '單位名',
                                         `temp_id` int(11) NOT NULL COMMENT '運費模板ID',
                                         `weight` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '重量',
                                         `volume` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '體積',
                                         `num` int(11) NULL DEFAULT NULL COMMENT '單次購買數量',
                                         `quota` int(10) NOT NULL DEFAULT 0 COMMENT '限購總數',
                                         `quota_show` int(10) NOT NULL DEFAULT 0 COMMENT '限量總數顯示',
                                         `ot_price` decimal(10, 2) NOT NULL COMMENT '原價',
                                         `once_num` int(11) NOT NULL DEFAULT 0 COMMENT '每個訂單可購買數量',
                                         `virtual_ration` int(11) NOT NULL DEFAULT 100 COMMENT '虛擬成團百分比',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼團商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon`;
CREATE TABLE `eb_store_coupon`  (
                                    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '優惠券表ID',
                                    `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '優惠券名稱',
                                    `money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兌換的優惠券面值',
                                    `is_limited` tinyint(1) NULL DEFAULT 0 COMMENT '是否限量, 默認0 不限量， 1限量',
                                    `total` int(11) NOT NULL DEFAULT 0 COMMENT '發放總數',
                                    `last_total` int(11) NULL DEFAULT 0 COMMENT '剩餘數量',
                                    `use_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '使用類型 1 全場通用, 2 商品券, 3 品類券',
                                    `primary_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所屬商品id / 分類id',
                                    `min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消費，0代表不限制',
                                    `receive_start_time` timestamp(0) NOT NULL COMMENT '可領取開始時間',
                                    `receive_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '可領取結束時間',
                                    `is_fixed_time` tinyint(1) NULL DEFAULT 0 COMMENT '是否固定使用時間, 默認0 否， 1是',
                                    `use_start_time` timestamp(0) NULL DEFAULT NULL COMMENT '可使用時間範圍 開始時間',
                                    `use_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '可使用時間範圍 結束時間',
                                    `day` int(4) NULL DEFAULT 0 COMMENT '天數',
                                    `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '優惠券類型 1 手動領取, 2 新人券, 3 贈送券',
                                    `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
                                    `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態（0：關閉，1：開啟）',
                                    `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除 狀態（0：否，1：是）',
                                    `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                    `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `state`(`status`) USING BTREE,
                                    INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '優惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_user`;
CREATE TABLE `eb_store_coupon_user`  (
                                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                         `coupon_id` int(10) NOT NULL COMMENT '優惠券發布id',
                                         `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兌換的項目id',
                                         `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '領取人id',
                                         `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '優惠券名稱',
                                         `money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '優惠券的面值',
                                         `min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消費多少金額可用優惠券',
                                         `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'send' COMMENT '獲取方式，send後台發放, 用戶領取 get',
                                         `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '狀態（0：未使用，1：已使用, 2:已失效）',
                                         `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                         `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                         `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '開始使用時間',
                                         `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '過期時間',
                                         `use_time` timestamp(0) NULL DEFAULT NULL COMMENT '使用時間',
                                         `use_type` tinyint(1) NULL DEFAULT 1 COMMENT '使用類型 1 全場通用, 2 商品券, 3 品類券',
                                         `primary_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所屬商品id / 分類id',
                                         PRIMARY KEY (`id`) USING BTREE,
                                         INDEX `cid`(`cid`) USING BTREE,
                                         INDEX `uid`(`uid`) USING BTREE,
                                         INDEX `end_time`(`end_time`) USING BTREE,
                                         INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '優惠券記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order`;
CREATE TABLE `eb_store_order`  (
                                   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '訂單ID',
                                   `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '訂單號',
                                   `uid` int(11) UNSIGNED NOT NULL COMMENT '用戶id',
                                   `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶姓名',
                                   `user_phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶電話',
                                   `user_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '詳細地址',
                                   `freight_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '運費金額',
                                   `total_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '訂單商品總數',
                                   `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '訂單總價',
                                   `total_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '郵費',
                                   `pay_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '實際支付金額',
                                   `pay_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付郵費',
                                   `deduction_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '抵扣金額',
                                   `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '優惠券id',
                                   `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '優惠券金額',
                                   `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付狀態',
                                   `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付時間',
                                   `pay_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式',
                                   `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                   `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '訂單狀態（0：待發貨；1：待收貨；2：已收貨，待評價；3：已完成；）',
                                   `refund_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未退款 1 申請中 2 已退款 3 退款中',
                                   `refund_reason_wap_img` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款圖片',
                                   `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款用戶說明',
                                   `refund_reason_wap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前台退款原因',
                                   `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不退款的理由',
                                   `refund_reason_time` timestamp(0) NULL DEFAULT NULL COMMENT '退款時間',
                                   `refund_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '退款金額',
                                   `delivery_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快遞名稱/送貨人姓名',
                                   `delivery_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '發貨類型',
                                   `delivery_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快遞單號/手機號',
                                   `gain_integral` int(11) NULL DEFAULT 0 COMMENT '消費賺取積分',
                                   `use_integral` int(11) NULL DEFAULT 0 COMMENT '使用積分',
                                   `back_integral` int(11) NULL DEFAULT 0 COMMENT '給用戶退了多少積分',
                                   `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '備註',
                                   `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除',
                                   `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理員備註',
                                   `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商戶ID',
                                   `is_mer_check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
                                   `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼團商品id0一般商品',
                                   `pink_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼團id 0沒有拼團',
                                   `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本價',
                                   `seckill_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒殺商品ID',
                                   `bargain_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍價id',
                                   `verify_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '核銷碼',
                                   `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '門店id',
                                   `shipping_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送方式 1=快遞 ，2=門店自提',
                                   `clerk_id` int(11) NOT NULL DEFAULT 0 COMMENT '店員id/核銷員id',
                                   `is_channel` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '支付渠道(0微信公眾號1微信小程序2余額)',
                                   `is_remind` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '消息提醒',
                                   `is_system_del` tinyint(1) NULL DEFAULT 0 COMMENT '後台是否刪除',
                                   `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                   `delivery_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快遞公司簡稱',
                                   `bargain_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用戶拼團活動id 0沒有',
                                   `type` int(3) NOT NULL DEFAULT 0 COMMENT '訂單類型:0-普通訂單，1-視頻號訂單',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
                                   INDEX `uid`(`uid`) USING BTREE,
                                   INDEX `add_time`(`create_time`) USING BTREE,
                                   INDEX `pay_price`(`pay_price`) USING BTREE,
                                   INDEX `paid`(`paid`) USING BTREE,
                                   INDEX `pay_time`(`pay_time`) USING BTREE,
                                   INDEX `pay_type`(`pay_type`) USING BTREE,
                                   INDEX `status`(`status`) USING BTREE,
                                   INDEX `is_del`(`is_del`) USING BTREE,
                                   INDEX `coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '訂單表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order_info
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_info`;
CREATE TABLE `eb_store_order_info`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
                                        `order_id` int(11) UNSIGNED NOT NULL COMMENT '訂單id',
                                        `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
                                        `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '購買東西的詳細信息',
                                        `unique` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一id',
                                        `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                        `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        UNIQUE INDEX `oid`(`order_id`, `unique`) USING BTREE,
                                        INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '訂單購物詳情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_status`;
CREATE TABLE `eb_store_order_status`  (
                                          `oid` int(10) UNSIGNED NOT NULL COMMENT '訂單id',
                                          `change_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作類型',
                                          `change_message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作備註',
                                          `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作時間',
                                          INDEX `oid`(`oid`) USING BTREE,
                                          INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '訂單操作記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_pink`;
CREATE TABLE `eb_store_pink`  (
                                  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼團ID',
                                  `uid` int(10) UNSIGNED NOT NULL COMMENT '用戶id',
                                  `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '訂單id 生成',
                                  `order_id_key` int(10) UNSIGNED NOT NULL COMMENT '訂單id  數據庫',
                                  `total_num` int(10) UNSIGNED NOT NULL COMMENT '購買商品個數',
                                  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '購買總金額',
                                  `cid` int(10) UNSIGNED NOT NULL COMMENT '拼團商品id',
                                  `pid` int(10) UNSIGNED NOT NULL COMMENT '商品id',
                                  `people` int(10) UNSIGNED NOT NULL COMMENT '拼圖總人數',
                                  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '拼團商品單價',
                                  `add_time` bigint(14) NOT NULL COMMENT '開始時間',
                                  `stop_time` bigint(14) NOT NULL COMMENT '結束時間',
                                  `k_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '團長id 0為團長',
                                  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否發送模板消息0未發送1已發送',
                                  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
                                  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態1進行中2已完成3未完成',
                                  `is_virtual` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否虛擬拼團',
                                  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用戶昵稱',
                                  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用戶頭像',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼團表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product`;
CREATE TABLE `eb_store_product`  (
                                     `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
                                     `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商戶Id(0為總後台管理員創建,不為0的時候是商戶後台創建)',
                                     `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品圖片',
                                     `slider_image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '輪播圖',
                                     `store_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名稱',
                                     `store_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品簡介',
                                     `keyword` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '關鍵字',
                                     `bar_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品條碼（一維碼）',
                                     `cate_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分類id',
                                     `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品價格',
                                     `vip_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '會員價格',
                                     `ot_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市場價',
                                     `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '郵費',
                                     `unit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '單位名',
                                     `sort` smallint(11) NOT NULL DEFAULT 0 COMMENT '排序',
                                     `sales` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '銷量',
                                     `stock` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '庫存',
                                     `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態（0：未上架，1：上架）',
                                     `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否熱賣',
                                     `is_benefit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否優惠',
                                     `is_best` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否精品',
                                     `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否新品',
                                     `add_time` int(11) UNSIGNED NOT NULL COMMENT '添加時間',
                                     `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包郵',
                                     `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除',
                                     `mer_use` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商戶是否代理 0不可代理1可代理',
                                     `give_integral` int(11) NULL DEFAULT 0 COMMENT '獲得積分',
                                     `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本價',
                                     `is_seckill` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒殺狀態 0 未開啟 1已開啟',
                                     `is_bargain` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '砍價狀態 0未開啟 1開啟',
                                     `is_good` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否優品推薦',
                                     `is_sub` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否單獨分佣',
                                     `ficti` mediumint(11) NULL DEFAULT 100 COMMENT '虛擬銷量',
                                     `browse` int(11) NULL DEFAULT 0 COMMENT '瀏覽量',
                                     `code_path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品二維碼地址(用戶小程序海報)',
                                     `soure_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '淘寶京東1688類型',
                                     `video_link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主圖視頻鏈接',
                                     `temp_id` int(11) NOT NULL DEFAULT 1 COMMENT '運費模板ID',
                                     `spec_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '規格 0單 1多',
                                     `activity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活動顯示排序0=默認, 1=秒殺，2=砍價，3=拼團',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `cate_id`(`cate_id`) USING BTREE,
                                     INDEX `is_hot`(`is_hot`) USING BTREE,
                                     INDEX `is_benefit`(`is_benefit`) USING BTREE,
                                     INDEX `is_best`(`is_best`) USING BTREE,
                                     INDEX `is_new`(`is_new`) USING BTREE,
                                     INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
                                     INDEX `price`(`price`) USING BTREE,
                                     INDEX `is_show`(`is_show`) USING BTREE,
                                     INDEX `sort`(`sort`) USING BTREE,
                                     INDEX `sales`(`sales`) USING BTREE,
                                     INDEX `add_time`(`add_time`) USING BTREE,
                                     INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr`;
CREATE TABLE `eb_store_product_attr`  (
                                          `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
                                          `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
                                          `attr_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '屬性名',
                                          `attr_values` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '屬性值',
                                          `type` tinyint(1) NULL DEFAULT 0 COMMENT '活動類型 0=商品，1=秒殺，2=砍價，3=拼團',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品屬性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_result`;
CREATE TABLE `eb_store_product_attr_result`  (
                                                 `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
                                                 `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
                                                 `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品屬性參數',
                                                 `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改時間',
                                                 `type` tinyint(1) NULL DEFAULT 0 COMMENT '活動類型 0=商品，1=秒殺，2=砍價，3=拼團',
                                                 PRIMARY KEY (`id`) USING BTREE,
                                                 INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品屬性詳情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_value`;
CREATE TABLE `eb_store_product_attr_value`  (
                                                `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
                                                `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
                                                `suk` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品屬性索引值 (attr_value|attr_value[|....])',
                                                `stock` int(10) UNSIGNED NOT NULL COMMENT '屬性對應的庫存',
                                                `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '銷量',
                                                `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '屬性金額',
                                                `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '圖片',
                                                `unique` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
                                                `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本價',
                                                `bar_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品條碼',
                                                `ot_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '原價',
                                                `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
                                                `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '體積',
                                                `brokerage` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '一級返佣',
                                                `brokerage_two` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '二級返佣',
                                                `type` tinyint(1) NULL DEFAULT 0 COMMENT '活動類型 0=商品，1=秒殺，2=砍價，3=拼團',
                                                `quota` int(11) NULL DEFAULT NULL COMMENT '活動限購數量',
                                                `quota_show` int(11) NULL DEFAULT NULL COMMENT '活動限購數量顯示',
                                                `attr_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'attr_values 創建更新時的屬性對應',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `unique`(`unique`, `suk`) USING BTREE,
                                                INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品屬性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product_cate
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_cate`;
CREATE TABLE `eb_store_product_cate`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT,
                                          `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
                                          `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '分類id',
                                          `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加時間',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分類輔助表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_coupon
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_coupon`;
CREATE TABLE `eb_store_product_coupon`  (
                                            `id` int(10) NOT NULL AUTO_INCREMENT,
                                            `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品id',
                                            `issue_coupon_id` int(10) NOT NULL DEFAULT 0 COMMENT '優惠■id',
                                            `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加時間',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_description
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_description`;
CREATE TABLE `eb_store_product_description`  (
                                                 `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
                                                 `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品詳情',
                                                 `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品類型',
                                                 `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                 PRIMARY KEY (`id`) USING BTREE,
                                                 INDEX `product_id`(`product_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_log`;
CREATE TABLE `eb_store_product_log`  (
                                         `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '統計ID',
                                         `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '類型visit,cart,order,pay,collect,refund',
                                         `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
                                         `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用戶ID',
                                         `visit_num` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否瀏覽',
                                         `cart_num` int(11) NOT NULL DEFAULT 0 COMMENT '加入購物車數量',
                                         `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '下單數量',
                                         `pay_num` int(11) NOT NULL DEFAULT 0 COMMENT '支付數量',
                                         `pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '支付金額',
                                         `cost_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品成本價',
                                         `pay_uid` int(11) NOT NULL DEFAULT 0 COMMENT '支付用戶ID',
                                         `refund_num` int(11) NOT NULL DEFAULT 0 COMMENT '退款數量',
                                         `refund_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金額',
                                         `collect_num` tinyint(1) NOT NULL DEFAULT 0 COMMENT '收藏',
                                         `add_time` bigint(14) NOT NULL DEFAULT 0 COMMENT '添加時間',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品統計' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_relation`;
CREATE TABLE `eb_store_product_relation`  (
                                              `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                              `uid` int(10) UNSIGNED NOT NULL COMMENT '用戶ID',
                                              `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
                                              `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '類型(收藏(collect）、點贊(like))',
                                              `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '某種類型的商品(普通商品、秒殺商品)',
                                              `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                              `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              UNIQUE INDEX `uid`(`uid`, `product_id`, `type`, `category`) USING BTREE,
                                              INDEX `type`(`type`) USING BTREE,
                                              INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品點贊和收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply`  (
                                           `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '評論ID',
                                           `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用戶ID',
                                           `oid` int(11) NOT NULL DEFAULT 0 COMMENT '訂單ID',
                                           `unique` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品唯一id',
                                           `product_id` int(11) NOT NULL COMMENT '商品id',
                                           `reply_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'product' COMMENT '某種商品類型(普通商品、秒殺商品）',
                                           `product_score` tinyint(1) NOT NULL COMMENT '商品分數',
                                           `service_score` tinyint(1) NOT NULL COMMENT '服務分數',
                                           `comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '評論內容',
                                           `pics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '評論圖片',
                                           `merchant_reply_content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理員回覆內容',
                                           `merchant_reply_time` int(11) NULL DEFAULT NULL COMMENT '管理員回覆時間',
                                           `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未刪除1已刪除',
                                           `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回覆1已回覆',
                                           `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶名稱',
                                           `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶頭像',
                                           `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                           `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                           `sku` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品規格屬性值,多個,號隔開',
                                           PRIMARY KEY (`id`) USING BTREE,
                                           INDEX `parent_id`(`reply_type`) USING BTREE,
                                           INDEX `is_del`(`is_del`) USING BTREE,
                                           INDEX `product_score`(`product_score`) USING BTREE,
                                           INDEX `service_score`(`service_score`) USING BTREE,
                                           INDEX `uid+oid`(`uid`, `oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '評論表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_product_rule
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_rule`;
CREATE TABLE `eb_store_product_rule`  (
                                          `id` int(10) NOT NULL AUTO_INCREMENT,
                                          `rule_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '規格名稱',
                                          `rule_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '規格值',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品規則值(規格)表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eb_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill`  (
                                     `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒殺產品表id',
                                     `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
                                     `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推薦圖',
                                     `images` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '輪播圖',
                                     `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活動標題',
                                     `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '簡介',
                                     `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '價格',
                                     `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本',
                                     `ot_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原價',
                                     `give_integral` int(11) NULL DEFAULT 0 COMMENT '反多少積分',
                                     `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
                                     `stock` int(10) UNSIGNED NOT NULL COMMENT '庫存',
                                     `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '銷量',
                                     `unit_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '單位名',
                                     `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '郵費',
                                     `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '內容',
                                     `start_time` datetime(0) NOT NULL COMMENT '開始時間',
                                     `stop_time` datetime(0) NOT NULL COMMENT '結束時間',
                                     `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                     `status` tinyint(3) UNSIGNED NOT NULL COMMENT '秒殺狀態 0=關閉 1=開啟',
                                     `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包郵',
                                     `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '刪除 0未刪除1已刪除',
                                     `num` int(11) UNSIGNED NOT NULL COMMENT '當天參與活動次數',
                                     `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '顯示',
                                     `time_id` int(11) NULL DEFAULT NULL COMMENT '時間段ID',
                                     `temp_id` int(11) NOT NULL DEFAULT 0 COMMENT '運費模板ID',
                                     `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
                                     `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '體積',
                                     `quota` int(10) NOT NULL DEFAULT 0 COMMENT '限購總數,隨減',
                                     `quota_show` int(10) NOT NULL DEFAULT 0 COMMENT '限購總數顯示.不變',
                                     `spec_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '規格 0=單 1=多',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `product_id`(`product_id`) USING BTREE,
                                     INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
                                     INDEX `is_del`(`is_del`) USING BTREE,
                                     INDEX `is_show`(`status`) USING BTREE,
                                     INDEX `add_time`(`create_time`) USING BTREE,
                                     INDEX `sort`(`sort`) USING BTREE,
                                     INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品秒殺產品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill_manger
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_manger`;
CREATE TABLE `eb_store_seckill_manger`  (
                                            `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '秒殺名稱',
                                            `start_time` int(11) NULL DEFAULT NULL COMMENT '秒殺開始時間段',
                                            `end_time` int(11) NULL DEFAULT NULL COMMENT '秒殺結束時間段',
                                            `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主圖',
                                            `silder_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '輪播圖',
                                            `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                            `status` int(11) NULL DEFAULT NULL COMMENT '狀態 0=關閉 1=開啟',
                                            `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                            `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                            `is_del` int(11) NOT NULL DEFAULT 0 COMMENT '刪除標記 0=為刪除 1=刪除',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_admin`;
CREATE TABLE `eb_system_admin`  (
                                    `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '後台管理員表ID',
                                    `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '後台管理員賬號',
                                    `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '後台管理員密碼',
                                    `real_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '後台管理員姓名',
                                    `roles` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '後台管理員權限(menus_id)',
                                    `last_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '後台管理員最後一次登錄ip',
                                    `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '後台管理員最後一次登錄時間',
                                    `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '後台管理員添加時間',
                                    `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登錄次數',
                                    `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '後台管理員級別',
                                    `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '後台管理員狀態 1有效0無效',
                                    `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
                                    `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手機號碼',
                                    `is_sms` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否接收短信',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `account`(`account`) USING BTREE,
                                    INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '後台管理員表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_admin
-- ----------------------------
INSERT INTO `eb_system_admin` VALUES (1, 'admin', 'L8qdg72wbeQ=', 'admin', '1', '113.132.66.147', '2021-04-20 16:43:13', '2020-08-17 17:48:58', 1583, 0, 1, 0, '18292417675', 0);

-- ----------------------------
-- Table structure for eb_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment`;
CREATE TABLE `eb_system_attachment`  (
                                         `att_id` int(10) NOT NULL AUTO_INCREMENT,
                                         `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件名稱',
                                         `att_dir` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件路徑',
                                         `satt_dir` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '壓縮圖片路徑',
                                         `att_size` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件大小',
                                         `att_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附件類型',
                                         `pid` int(10) NOT NULL DEFAULT 0 COMMENT '分類ID0編輯器,1商品圖片,2拼團圖片,3砍價圖片,4秒殺圖片,5文章圖片,6組合數據圖， 7前台用戶',
                                         `image_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '圖片上傳類型 1本地 2七牛雲 3OSS 4COS ',
                                         `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                         `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                         PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 476 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_attachment
-- ----------------------------
INSERT INTO `eb_system_attachment` VALUES (1, '398c165115c247ba8ae79fc5cade8226tpf3ap2and.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/07/9c2a3160cbe04f36aa3340cc8f97dc67a9ai2hbt9f.png', 'crmebimage/content/2020/12/07/9c2a3160cbe04f36aa3340cc8f97dc67a9ai2hbt9f.png', '24056', 'png', 541, 1, '2020-12-07 17:27:48', '2021-02-03 18:29:08');
INSERT INTO `eb_system_attachment` VALUES (2, '1607498682(1).jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/09/54a1bf16b68c4bf89d1c73ad52dd9442i2rjuut93f.jpg', 'crmebimage/content/2020/12/09/54a1bf16b68c4bf89d1c73ad52dd9442i2rjuut93f.jpg', '18860', 'jpeg', 0, 1, '2020-12-09 15:25:10', '2020-12-09 15:25:10');
INSERT INTO `eb_system_attachment` VALUES (3, 'O1CN01zvY0rj1FCbFvNl262_!!2209243540451.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/15/7e7b4599f6074a72a79dc27950b504e84z1qjcadfx.jpg', 'crmebimage/content/2020/12/15/7e7b4599f6074a72a79dc27950b504e84z1qjcadfx.jpg', '105279', 'jpeg', 0, 1, '2020-12-15 09:26:01', '2020-12-15 09:26:01');
INSERT INTO `eb_system_attachment` VALUES (4, '微信圖片_20201128100245.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/15/1cf475d3fc0647d59f17ea724e2c8fe2wf6ohlvtzz.png', 'crmebimage/content/2020/12/15/1cf475d3fc0647d59f17ea724e2c8fe2wf6ohlvtzz.png', '12099', 'png', 0, 1, '2020-12-15 12:14:18', '2020-12-15 12:14:18');
INSERT INTO `eb_system_attachment` VALUES (5, '4e1e4577536d992c7362c8b67510b87f.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/15/72b701aad808457695a49b472f7548ec54rrx6rl74.png', 'crmebimage/user/2020/12/15/72b701aad808457695a49b472f7548ec54rrx6rl74.png', '3428', 'png', 0, 1, '2020-12-15 15:04:54', '2020-12-15 15:04:54');
INSERT INTO `eb_system_attachment` VALUES (6, '62e5fb6b784e7a68a0ee17177d6b095a.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/15/22f159f3c4f94173b1461dedcb993696i8wlul1mqj.jpg', 'crmebimage/user/2020/12/15/22f159f3c4f94173b1461dedcb993696i8wlul1mqj.jpg', '4750', 'jpeg', 0, 1, '2020-12-15 15:05:01', '2020-12-15 15:05:01');
INSERT INTO `eb_system_attachment` VALUES (7, 'O1CN017d8O9R28vInDiixx3_!!0-item_pic.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/16/6f9dba23a7964b209377746b776fc313od5aep3dat.jpg', 'crmebimage/content/2020/12/16/6f9dba23a7964b209377746b776fc313od5aep3dat.jpg', '347478', 'jpeg', 0, 1, '2020-12-16 11:45:53', '2020-12-16 11:45:53');
INSERT INTO `eb_system_attachment` VALUES (8, '0f3254794840c47e.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/17/785aeb1dea144c0b9e87ae021f14d0d0djsnp7uksy.png', 'crmebimage/store/2020/12/17/785aeb1dea144c0b9e87ae021f14d0d0djsnp7uksy.png', '193887', 'png', 0, 1, '2020-12-17 15:04:31', '2020-12-17 15:04:31');
INSERT INTO `eb_system_attachment` VALUES (9, 'O1CN01b8EoG226jH4ZQkw3B_!!2177037697.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/18/317cb71eb4164130a97b3a3f2f8e518dcqfb5od83r.jpg', 'crmebimage/content/2020/12/18/317cb71eb4164130a97b3a3f2f8e518dcqfb5od83r.jpg', '560981', 'jpeg', 0, 1, '2020-12-18 09:19:56', '2020-12-18 09:19:56');
INSERT INTO `eb_system_attachment` VALUES (10, 'O1CN01s95zsz26jH4ejagqK_!!2177037697.jpg_430x430q90.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/18/ca8b64ee2bf243fb8c202f0d366e99777cfbox0dos.jpg', 'crmebimage/content/2020/12/18/ca8b64ee2bf243fb8c202f0d366e99777cfbox0dos.jpg', '48202', 'jpeg', 0, 1, '2020-12-18 09:20:16', '2020-12-18 09:20:16');
INSERT INTO `eb_system_attachment` VALUES (11, 'O1CN01RTgZBV26jH4fAZc3r_!!2177037697.jpg_430x430q90.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/18/f6400b07464d4e4b8db7d0b0ebe624c5rtrk8wpwii.jpg', 'crmebimage/content/2020/12/18/f6400b07464d4e4b8db7d0b0ebe624c5rtrk8wpwii.jpg', '51669', 'jpeg', 0, 1, '2020-12-18 09:20:16', '2020-12-18 09:20:16');
INSERT INTO `eb_system_attachment` VALUES (12, 'O1CN01zRQt0v26jH4d1xzL9_!!2177037697.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/setting/2020/12/18/547178de76cb496ba096d5862cf53192bzfpogmfrb.jpg', 'crmebimage/setting/2020/12/18/547178de76cb496ba096d5862cf53192bzfpogmfrb.jpg', '301760', 'jpeg', 0, 1, '2020-12-18 09:20:57', '2020-12-18 09:20:57');
INSERT INTO `eb_system_attachment` VALUES (13, 'O1CN01KyhfpM26jH4fAbIAH_!!2177037697.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/setting/2020/12/18/97021d068894495da701424adcc397c5pphfml3shz.jpg', 'crmebimage/setting/2020/12/18/97021d068894495da701424adcc397c5pphfml3shz.jpg', '250154', 'jpeg', 0, 1, '2020-12-18 09:20:57', '2020-12-18 09:20:57');
INSERT INTO `eb_system_attachment` VALUES (14, 'O1CN01kYqBbI26jH4auWFl5_!!2177037697.png_430x430q90.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/setting/2020/12/18/da34574a910642ee9136d0907b4d94badtw99z7odu.jpg', 'crmebimage/setting/2020/12/18/da34574a910642ee9136d0907b4d94badtw99z7odu.jpg', '113991', 'jpeg', 0, 1, '2020-12-18 09:20:57', '2020-12-18 09:20:57');
INSERT INTO `eb_system_attachment` VALUES (15, '1f5162ddd72fadd7.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/21/9d3d059effbc4e09981a22977b8b162agk0y0isk2v.jpg', 'crmebimage/store/2020/12/21/9d3d059effbc4e09981a22977b8b162agk0y0isk2v.jpg', '269204', 'jpeg', 0, 1, '2020-12-21 11:56:54', '2020-12-21 11:56:54');
INSERT INTO `eb_system_attachment` VALUES (16, 'QQ截圖20201222100716.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/22/a4ae34bbc6f3418c81b12f9fa7e5a5d48rgur851s7.png', 'crmebimage/store/2020/12/22/a4ae34bbc6f3418c81b12f9fa7e5a5d48rgur851s7.png', '203773', 'png', 0, 1, '2020-12-22 10:07:31', '2020-12-22 10:07:31');
INSERT INTO `eb_system_attachment` VALUES (17, 'QQ截圖20201222100706.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/22/5699accd40724da7a33d717d12be688430b8y2zgp8.png', 'crmebimage/store/2020/12/22/5699accd40724da7a33d717d12be688430b8y2zgp8.png', '256754', 'png', 0, 1, '2020-12-22 10:07:31', '2020-12-22 10:07:31');
INSERT INTO `eb_system_attachment` VALUES (19, 'QQ截圖20201222101338.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/22/a790d28b452e4c55a8033766aeb22503o5lks5poya.png', 'crmebimage/content/2020/12/22/a790d28b452e4c55a8033766aeb22503o5lks5poya.png', '284864', 'png', 0, 1, '2020-12-22 10:13:44', '2020-12-22 10:13:44');
INSERT INTO `eb_system_attachment` VALUES (20, 'QQ截圖20201222101356.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/22/2549fa79a9df4b4790ed3c3e896223e2g4v5ezm22w.png', 'crmebimage/content/2020/12/22/2549fa79a9df4b4790ed3c3e896223e2g4v5ezm22w.png', '184764', 'png', 0, 1, '2020-12-22 10:14:32', '2020-12-22 10:14:32');
INSERT INTO `eb_system_attachment` VALUES (21, 'QQ截圖20201222101406.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/22/9ecc938f82a147a98b4c27bfd5ba85f1sgt9duneus.png', 'crmebimage/content/2020/12/22/9ecc938f82a147a98b4c27bfd5ba85f1sgt9duneus.png', '147442', 'png', 0, 1, '2020-12-22 10:14:32', '2020-12-22 10:14:32');
INSERT INTO `eb_system_attachment` VALUES (22, 'QQ截圖20201222101413.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/22/b882a1f490de4abbb4528a834ab77016a5m7pvum0t.png', 'crmebimage/content/2020/12/22/b882a1f490de4abbb4528a834ab77016a5m7pvum0t.png', '318557', 'png', 0, 1, '2020-12-22 10:14:32', '2020-12-22 10:14:32');
INSERT INTO `eb_system_attachment` VALUES (23, 'QQ截圖20201222101421.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2020/12/22/7bb3780abce24917b4af15337a8e8c7ds0wepy9ccf.png', 'crmebimage/content/2020/12/22/7bb3780abce24917b4af15337a8e8c7ds0wepy9ccf.png', '358746', 'png', 0, 1, '2020-12-22 10:14:32', '2020-12-22 10:14:32');
INSERT INTO `eb_system_attachment` VALUES (24, 'QQ截圖20201222104115.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/22/2e3f392d46d44b9a9203631106ec077f6kfezlfq3y.png', 'crmebimage/store/2020/12/22/2e3f392d46d44b9a9203631106ec077f6kfezlfq3y.png', '264180', 'png', 0, 1, '2020-12-22 10:41:23', '2020-12-22 10:41:23');
INSERT INTO `eb_system_attachment` VALUES (25, 'QQ截圖20201222104152.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/22/3fe00af0f91e4346a5e1912109c7620c1irlmbmq8i.png', 'crmebimage/store/2020/12/22/3fe00af0f91e4346a5e1912109c7620c1irlmbmq8i.png', '215220', 'png', 0, 1, '2020-12-22 10:42:01', '2020-12-22 10:42:01');
INSERT INTO `eb_system_attachment` VALUES (26, 'TB2slw1XRTkJKJjSspkXXaGQXXa_!!693060164.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2020/12/22/813e675000584eb694f3defff1975fb4n8owt2wvsq.jpg', 'crmebimage/store/2020/12/22/813e675000584eb694f3defff1975fb4n8owt2wvsq.jpg', '9730', 'jpeg', 541, 1, '2020-12-22 11:03:24', '2021-02-03 18:28:14');
INSERT INTO `eb_system_attachment` VALUES (27, 'O1CN01aOhcjW2FEtQmxW8IV_!!0-rate.jpg_400x400.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/22/7e586aea017843499af71bbf4cbd8d8b05y6x7dxcs.jpg', 'crmebimage/product/2020/12/22/7e586aea017843499af71bbf4cbd8d8b05y6x7dxcs.jpg', '16717', 'jpeg', 1, 1, '2020-12-22 12:04:47', '2020-12-22 12:04:47');
INSERT INTO `eb_system_attachment` VALUES (28, 'O1CN013fFT4C2FEtQlgr9H2_!!0-rate.jpg_400x400.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/22/c3682a0aa1c541598b28a94df60b0e639tybw2f04x.jpg', 'crmebimage/product/2020/12/22/c3682a0aa1c541598b28a94df60b0e639tybw2f04x.jpg', '17335', 'jpeg', 1, 1, '2020-12-22 12:04:50', '2020-12-22 12:04:50');
INSERT INTO `eb_system_attachment` VALUES (29, 'QQ截圖20201204150959.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/22/3f64655b0e964fb381436ec03c7fb1474kngpqs3m9.png', 'crmebimage/user/2020/12/22/3f64655b0e964fb381436ec03c7fb1474kngpqs3m9.png', '604837', 'png', 7, 1, '2020-12-22 12:09:48', '2020-12-22 12:09:48');
INSERT INTO `eb_system_attachment` VALUES (30, 'O1CN01higHjb1RuotrLo4rf_!!0-rate.jpg_400x400.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/22/a3b2381a020547b7a28fb151fa8319482tihtolj2f.jpg', 'crmebimage/product/2020/12/22/a3b2381a020547b7a28fb151fa8319482tihtolj2f.jpg', '17095', 'jpeg', 1, 1, '2020-12-22 12:13:20', '2020-12-22 12:13:20');
INSERT INTO `eb_system_attachment` VALUES (31, 'D07D0DC6-5477-484B-90B9-C97D78EEE62C.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/22/3d73a6d261cc4908aa14cb1cd91654c65dm77nsbij.png', 'crmebimage/user/2020/12/22/3d73a6d261cc4908aa14cb1cd91654c65dm77nsbij.png', '360764', 'png', 1, 1, '2020-12-22 14:54:37', '2020-12-22 14:54:37');
INSERT INTO `eb_system_attachment` VALUES (32, '42D4408B-DF76-4295-9E86-A381BA0F06DF.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/22/f497304eea9c4abcb78682fb038713c6cagwfhdb36.png', 'crmebimage/user/2020/12/22/f497304eea9c4abcb78682fb038713c6cagwfhdb36.png', '579352', 'png', 1, 1, '2020-12-22 14:55:34', '2020-12-22 14:55:34');
INSERT INTO `eb_system_attachment` VALUES (33, 'tmp_273ca38fafb1ae333f107eb65ac60d89.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/5e6d782806404df4b320cbafe482dc2fukoeynvgji.jpg', 'crmebimage/product/2020/12/23/5e6d782806404df4b320cbafe482dc2fukoeynvgji.jpg', '218835', 'jpg', 1, 1, '2020-12-23 09:59:11', '2020-12-23 09:59:11');
INSERT INTO `eb_system_attachment` VALUES (34, 'tmp_507241ae3cfd792d1dbcffd8d9d6255c.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/54aae5047bd84046bdf28d15d996d6edhu3cttrpgh.jpg', 'crmebimage/product/2020/12/23/54aae5047bd84046bdf28d15d996d6edhu3cttrpgh.jpg', '145584', 'jpg', 1, 1, '2020-12-23 09:59:16', '2020-12-23 09:59:16');
INSERT INTO `eb_system_attachment` VALUES (35, 'tmp_8840b121826a6bab2296578a705ec529.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/7beef5e3fd3d4585841330fef41f1ccbk8kl048xrs.jpg', 'crmebimage/product/2020/12/23/7beef5e3fd3d4585841330fef41f1ccbk8kl048xrs.jpg', '156403', 'jpg', 1, 1, '2020-12-23 09:59:20', '2020-12-23 09:59:20');
INSERT INTO `eb_system_attachment` VALUES (36, 'tmp_582f8610346f348e1b7546fac32ed342.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/b40e03b8dfe94e1fa2844db0d969cd8dvx6gofuzh8.jpg', 'crmebimage/product/2020/12/23/b40e03b8dfe94e1fa2844db0d969cd8dvx6gofuzh8.jpg', '218835', 'jpg', 1, 1, '2020-12-23 09:59:25', '2020-12-23 09:59:25');
INSERT INTO `eb_system_attachment` VALUES (37, '錘子.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/b3fd967365e6412db0712021f378b35d8n3cuwkkt7.jpg', 'crmebimage/product/2020/12/23/b3fd967365e6412db0712021f378b35d8n3cuwkkt7.jpg', '6766', 'jpeg', 1, 1, '2020-12-23 10:08:41', '2020-12-23 10:08:41');
INSERT INTO `eb_system_attachment` VALUES (38, '酷派.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/aa3101ec5d654fa39d614e4b0322f6f84h3vc18hbj.jpg', 'crmebimage/product/2020/12/23/aa3101ec5d654fa39d614e4b0322f6f84h3vc18hbj.jpg', '7236', 'jpeg', 1, 1, '2020-12-23 10:08:44', '2020-12-23 10:08:44');
INSERT INTO `eb_system_attachment` VALUES (39, '聯想.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/7d4b8f702d7c4916b1263dbb42ee0c5502n5oqemay.jpg', 'crmebimage/product/2020/12/23/7d4b8f702d7c4916b1263dbb42ee0c5502n5oqemay.jpg', '17420', 'jpeg', 1, 1, '2020-12-23 10:08:47', '2020-12-23 10:08:47');
INSERT INTO `eb_system_attachment` VALUES (40, '摩托羅拉.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/fe5833daaf1646b3b3ed6998383e7388ytduqmzk6g.jpg', 'crmebimage/product/2020/12/23/fe5833daaf1646b3b3ed6998383e7388ytduqmzk6g.jpg', '13608', 'jpeg', 1, 1, '2020-12-23 10:08:51', '2020-12-23 10:08:51');
INSERT INTO `eb_system_attachment` VALUES (41, 'VIVO.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/0a390f95ef2646cf9f8208f81bc1bb33qypgnmn2m5.jpg', 'crmebimage/product/2020/12/23/0a390f95ef2646cf9f8208f81bc1bb33qypgnmn2m5.jpg', '6528', 'jpeg', 1, 1, '2020-12-23 10:09:23', '2020-12-23 10:09:23');
INSERT INTO `eb_system_attachment` VALUES (42, '錘子.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/f64d9b24b8984b3eaaea882a02c0452a1uo8vb5kpp.jpg', 'crmebimage/product/2020/12/23/f64d9b24b8984b3eaaea882a02c0452a1uo8vb5kpp.jpg', '6766', 'jpeg', 1, 1, '2020-12-23 10:09:25', '2020-12-23 10:09:25');
INSERT INTO `eb_system_attachment` VALUES (43, '酷派.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/a14ee8ae833b42b2b95eff36722e025eheqgj9anyi.jpg', 'crmebimage/product/2020/12/23/a14ee8ae833b42b2b95eff36722e025eheqgj9anyi.jpg', '7236', 'jpeg', 1, 1, '2020-12-23 10:09:28', '2020-12-23 10:09:28');
INSERT INTO `eb_system_attachment` VALUES (44, '魅族.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/995a1106ae604f468ff7100cd74930099dtaveltme.jpg', 'crmebimage/product/2020/12/23/995a1106ae604f468ff7100cd74930099dtaveltme.jpg', '70009', 'jpeg', 1, 1, '2020-12-23 10:09:33', '2020-12-23 10:09:33');
INSERT INTO `eb_system_attachment` VALUES (45, 'QQ截圖20201204151029.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/3fc898a1dbdc4baa935f905dfc238bb5eubvon632g.png', 'crmebimage/product/2020/12/23/3fc898a1dbdc4baa935f905dfc238bb5eubvon632g.png', '284177', 'png', 1, 1, '2020-12-23 10:17:05', '2020-12-23 10:17:05');
INSERT INTO `eb_system_attachment` VALUES (46, 'QQ截圖20201204151022.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/49601be69e534901b636b73c532104b458pu93jdjb.png', 'crmebimage/product/2020/12/23/49601be69e534901b636b73c532104b458pu93jdjb.png', '231212', 'png', 1, 1, '2020-12-23 10:17:07', '2020-12-23 10:17:07');
INSERT INTO `eb_system_attachment` VALUES (47, 'QQ截圖20201204151022.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/488d99bb46bf458d93440b7d9d38abb9ptx1mu11h2.png', 'crmebimage/product/2020/12/23/488d99bb46bf458d93440b7d9d38abb9ptx1mu11h2.png', '231212', 'png', 1, 1, '2020-12-23 10:17:10', '2020-12-23 10:17:10');
INSERT INTO `eb_system_attachment` VALUES (48, 'QQ截圖20201204151009.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/a2b3221c55394c28bc284e611d462abaydw0abbvy4.png', 'crmebimage/product/2020/12/23/a2b3221c55394c28bc284e611d462abaydw0abbvy4.png', '221914', 'png', 1, 1, '2020-12-23 10:17:14', '2020-12-23 10:17:14');
INSERT INTO `eb_system_attachment` VALUES (49, 'QQ截圖20201204112133.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/985aaa3f9c7d41078e37d3e441116781qdyffn3m4j.png', 'crmebimage/product/2020/12/23/985aaa3f9c7d41078e37d3e441116781qdyffn3m4j.png', '202125', 'png', 1, 1, '2020-12-23 10:17:19', '2020-12-23 10:17:19');
INSERT INTO `eb_system_attachment` VALUES (50, 'img.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/5ca31ee50e6345d0bb2a9dd361bb8c3ajghjcf8fdt.jpg', 'crmebimage/product/2020/12/23/5ca31ee50e6345d0bb2a9dd361bb8c3ajghjcf8fdt.jpg', '56665', 'jpeg', 1, 1, '2020-12-23 10:46:05', '2020-12-23 10:46:05');
INSERT INTO `eb_system_attachment` VALUES (51, 'img.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/9c0251cd515d4802b0ed0427d45876d1h3v2ddj5aa.jpg', 'crmebimage/product/2020/12/23/9c0251cd515d4802b0ed0427d45876d1h3v2ddj5aa.jpg', '56665', 'jpeg', 1, 1, '2020-12-23 10:50:21', '2020-12-23 10:50:21');
INSERT INTO `eb_system_attachment` VALUES (52, '1607498682(1).jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/29bf87ca1a8c4ee380eea0afe1fb63de1a3mzpeo5z.jpg', 'crmebimage/product/2020/12/23/29bf87ca1a8c4ee380eea0afe1fb63de1a3mzpeo5z.jpg', '18860', 'jpeg', 1, 1, '2020-12-23 10:50:24', '2020-12-23 10:50:24');
INSERT INTO `eb_system_attachment` VALUES (53, 'weixin.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/35cdccf8915d4a96a3d90969677924b02v851c42n8.png', 'crmebimage/product/2020/12/23/35cdccf8915d4a96a3d90969677924b02v851c42n8.png', '9260', 'png', 1, 1, '2020-12-23 10:51:12', '2020-12-23 10:51:12');
INSERT INTO `eb_system_attachment` VALUES (54, 'img.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/6f07498b4d5541f585705c99d59a8c12m1vepk33gw.jpg', 'crmebimage/product/2020/12/23/6f07498b4d5541f585705c99d59a8c12m1vepk33gw.jpg', '56665', 'jpeg', 1, 1, '2020-12-23 10:51:14', '2020-12-23 10:51:14');
INSERT INTO `eb_system_attachment` VALUES (55, 'img.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/753b5cf2019242c7a7b441d21eafa36acl5fdducvk.jpg', 'crmebimage/product/2020/12/23/753b5cf2019242c7a7b441d21eafa36acl5fdducvk.jpg', '56665', 'jpeg', 1, 1, '2020-12-23 10:51:36', '2020-12-23 10:51:36');
INSERT INTO `eb_system_attachment` VALUES (56, '1607498682(1).jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/05e70694069146fda58c91b97c080d03lu0n600a31.jpg', 'crmebimage/product/2020/12/23/05e70694069146fda58c91b97c080d03lu0n600a31.jpg', '18860', 'jpeg', 1, 1, '2020-12-23 10:51:39', '2020-12-23 10:51:39');
INSERT INTO `eb_system_attachment` VALUES (57, 'img.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/d5ff26e218ba4b6b97ebbd742d01cc95ws38f02quh.jpg', 'crmebimage/product/2020/12/23/d5ff26e218ba4b6b97ebbd742d01cc95ws38f02quh.jpg', '56665', 'jpeg', 1, 1, '2020-12-23 10:52:32', '2020-12-23 10:52:32');
INSERT INTO `eb_system_attachment` VALUES (58, '1607498682(1).jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/23/ea76596ce6d5412f8273928e0cca8fd264nuwmcfe6.jpg', 'crmebimage/product/2020/12/23/ea76596ce6d5412f8273928e0cca8fd264nuwmcfe6.jpg', '18860', 'jpeg', 1, 1, '2020-12-23 10:52:35', '2020-12-23 10:52:35');
INSERT INTO `eb_system_attachment` VALUES (59, '1D87AC5D-A195-47E3-ABE5-AB0042F435B3.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/24/a3850d57c1094a8781eb0dbc2b589074nq1t749d93.png', 'crmebimage/product/2020/12/24/a3850d57c1094a8781eb0dbc2b589074nq1t749d93.png', '1671170', 'png', 1, 1, '2020-12-24 16:02:30', '2020-12-24 16:02:30');
INSERT INTO `eb_system_attachment` VALUES (60, '142A457D-C5D8-42FD-81BD-FD08842DDBC6.jpeg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/24/aa1117af755b4377a01056dd4d31ecd8s0erg16i3r.jpeg', 'crmebimage/product/2020/12/24/aa1117af755b4377a01056dd4d31ecd8s0erg16i3r.jpeg', '419781', 'jpeg', 1, 1, '2020-12-24 16:02:50', '2020-12-24 16:02:50');
INSERT INTO `eb_system_attachment` VALUES (61, '08BD84FD-B857-405B-9ACB-826B07FD6968.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2020/12/24/ce0872c532ef4321a4ed5502f383b16cre8yu1m944.png', 'crmebimage/product/2020/12/24/ce0872c532ef4321a4ed5502f383b16cre8yu1m944.png', '1671170', 'png', 1, 1, '2020-12-24 16:03:03', '2020-12-24 16:03:03');
INSERT INTO `eb_system_attachment` VALUES (62, '1.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/26/048f5cd88cd5438cb886262019603c96vy1de805i2.jpg', 'crmebimage/user/2020/12/26/048f5cd88cd5438cb886262019603c96vy1de805i2.jpg', '94542', 'jpeg', 7, 1, '2020-12-26 19:20:27', '2020-12-26 19:20:27');
INSERT INTO `eb_system_attachment` VALUES (63, '1.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2020/12/26/8077a9f51bc1407fa18a6de5ca7fcafa7n6lz8ct4r.jpg', 'crmebimage/user/2020/12/26/8077a9f51bc1407fa18a6de5ca7fcafa7n6lz8ct4r.jpg', '94542', 'jpeg', 7, 1, '2020-12-26 19:20:35', '2020-12-26 19:20:35');
INSERT INTO `eb_system_attachment` VALUES (64, '頭像.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2021/01/05/5422a3837bef46e78fe48111cb8c01aaf6c69v1r90.png', 'crmebimage/user/2021/01/05/5422a3837bef46e78fe48111cb8c01aaf6c69v1r90.png', '5170', 'png', 7, 1, '2021-01-05 10:41:06', '2021-01-05 10:41:06');
INSERT INTO `eb_system_attachment` VALUES (65, 'qrcode_for_gh_6ec49e23e2c9_1280.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/operation/2021/01/08/96fdcc024439474f964895155c14ded9yjswt5ki0s.jpg', 'crmebimage/operation/2021/01/08/96fdcc024439474f964895155c14ded9yjswt5ki0s.jpg', '152503', 'jpeg', 541, 1, '2021-01-08 15:26:30', '2021-02-03 14:57:23');
INSERT INTO `eb_system_attachment` VALUES (66, '1f5162ddd72fadd7.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2021/01/14/1fc43e2f3fbe4cb7858993b2b7af2cc8gz29mhdmon.jpg', 'crmebimage/content/2021/01/14/1fc43e2f3fbe4cb7858993b2b7af2cc8gz29mhdmon.jpg', '269204', 'jpeg', 0, 1, '2021-01-14 10:23:08', '2021-01-14 10:23:08');
INSERT INTO `eb_system_attachment` VALUES (67, 'timg.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2021/01/14/f3b8bb3f26b1422fadd3a0d6eda5c9aevvmplrh2tc.jpg', 'crmebimage/user/2021/01/14/f3b8bb3f26b1422fadd3a0d6eda5c9aevvmplrh2tc.jpg', '26852', 'jpeg', 7, 1, '2021-01-14 11:06:23', '2021-01-14 11:06:23');
INSERT INTO `eb_system_attachment` VALUES (68, 'LG.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/14/fcdfed90060e415396918a9a4ec620af683kod0uxv.jpg', 'crmebimage/product/2021/01/14/fcdfed90060e415396918a9a4ec620af683kod0uxv.jpg', '85835', 'jpeg', 1, 1, '2021-01-14 15:07:49', '2021-01-14 15:07:49');
INSERT INTO `eb_system_attachment` VALUES (69, 'IPhone.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/14/b6f888f9a49b43d89141e25ece7b4b7flg5nntr8o1.jpg', 'crmebimage/product/2021/01/14/b6f888f9a49b43d89141e25ece7b4b7flg5nntr8o1.jpg', '9920', 'jpeg', 1, 1, '2021-01-14 15:07:52', '2021-01-14 15:07:52');
INSERT INTO `eb_system_attachment` VALUES (70, 'QQ截圖20201204151029.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/14/cdaf1895d23e406799c994321d16ec8eayafy7pcmr.png', 'crmebimage/product/2021/01/14/cdaf1895d23e406799c994321d16ec8eayafy7pcmr.png', '284177', 'png', 1, 1, '2021-01-14 15:07:55', '2021-01-14 15:07:55');
INSERT INTO `eb_system_attachment` VALUES (71, 'QQ截圖20210115094504.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/content/2021/01/15/c8bb13307db9431ea04c26ef2b5586e33zbgdu0mu1.png', 'crmebimage/content/2021/01/15/c8bb13307db9431ea04c26ef2b5586e33zbgdu0mu1.png', '233443', 'png', 0, 1, '2021-01-15 09:46:44', '2021-01-15 09:46:44');
INSERT INTO `eb_system_attachment` VALUES (72, 'QQ截圖20210115094504.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/15/1971333b44cd45598fd445c1496ba10a4uvt5fr3dg.png', 'crmebimage/product/2021/01/15/1971333b44cd45598fd445c1496ba10a4uvt5fr3dg.png', '233443', 'png', 1, 1, '2021-01-15 10:20:56', '2021-01-15 10:20:56');
INSERT INTO `eb_system_attachment` VALUES (73, 'QQ截圖20210115094504.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/15/b092c4978dae4ebfbdca263ca038ac086j1ucll12d.png', 'crmebimage/product/2021/01/15/b092c4978dae4ebfbdca263ca038ac086j1ucll12d.png', '233443', 'png', 1, 1, '2021-01-15 10:21:05', '2021-01-15 10:21:05');
INSERT INTO `eb_system_attachment` VALUES (74, 'QQ截圖20210115094517.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/15/5862229da3c94f4b94d60f351bbd01a2alr79h8f4u.png', 'crmebimage/product/2021/01/15/5862229da3c94f4b94d60f351bbd01a2alr79h8f4u.png', '133002', 'png', 1, 1, '2021-01-15 10:21:09', '2021-01-15 10:21:09');
INSERT INTO `eb_system_attachment` VALUES (75, 'QQ截圖20210115094525.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/15/05077a377b8049c8bcedf62e67c37720un1megqv31.png', 'crmebimage/product/2021/01/15/05077a377b8049c8bcedf62e67c37720un1megqv31.png', '281593', 'png', 1, 1, '2021-01-15 10:21:11', '2021-01-15 10:21:11');
INSERT INTO `eb_system_attachment` VALUES (76, 'QQ截圖20210116092059.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/store/2021/01/16/fa418fd0a5d34c9cbd96c3ed48e90cb3r0sbrl7pn5.png', 'crmebimage/store/2021/01/16/fa418fd0a5d34c9cbd96c3ed48e90cb3r0sbrl7pn5.png', '86946', 'png', 0, 1, '2021-01-16 09:21:10', '2021-01-16 09:21:10');
INSERT INTO `eb_system_attachment` VALUES (84, 'QQ截圖20210116094519.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/2ef02385a7b34683806c72aa026dbe01wfwnrewo3l.png', 'crmebimage/product/2021/01/16/2ef02385a7b34683806c72aa026dbe01wfwnrewo3l.png', '100013', 'png', 1, 1, '2021-01-16 10:31:46', '2021-01-16 10:31:46');
INSERT INTO `eb_system_attachment` VALUES (85, 'QQ截圖20210116094527.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/3a879f770773451e80559c054d3011b0larwretvzm.png', 'crmebimage/product/2021/01/16/3a879f770773451e80559c054d3011b0larwretvzm.png', '230985', 'png', 1, 1, '2021-01-16 10:31:48', '2021-01-16 10:31:48');
INSERT INTO `eb_system_attachment` VALUES (86, 'QQ截圖20210116094533.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/c230779fbd72401d9d4a58369779fec369tfbyya6r.png', 'crmebimage/product/2021/01/16/c230779fbd72401d9d4a58369779fec369tfbyya6r.png', '132451', 'png', 1, 1, '2021-01-16 10:31:51', '2021-01-16 10:31:51');
INSERT INTO `eb_system_attachment` VALUES (87, 'QQ截圖20210116094540.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/4db9208710ed4860bd12bc50fe6cc424kllbxdg91h.png', 'crmebimage/product/2021/01/16/4db9208710ed4860bd12bc50fe6cc424kllbxdg91h.png', '144826', 'png', 1, 1, '2021-01-16 10:31:54', '2021-01-16 10:31:54');
INSERT INTO `eb_system_attachment` VALUES (88, 'QQ截圖20210116092134.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/f0993496c0a24b5994262025101b78487xzzahsz5a.png', 'crmebimage/product/2021/01/16/f0993496c0a24b5994262025101b78487xzzahsz5a.png', '231340', 'png', 1, 1, '2021-01-16 11:06:19', '2021-01-16 11:06:19');
INSERT INTO `eb_system_attachment` VALUES (89, 'QQ截圖20210116094519.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/29ac38bedc4c4f8792199e27270580e3gxw04ro4c3.png', 'crmebimage/product/2021/01/16/29ac38bedc4c4f8792199e27270580e3gxw04ro4c3.png', '100013', 'png', 1, 1, '2021-01-16 11:06:21', '2021-01-16 11:06:21');
INSERT INTO `eb_system_attachment` VALUES (90, 'QQ截圖20210116094527.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/e539db7ec64d4ff69bb65dc876a52e04mh215ntvv1.png', 'crmebimage/product/2021/01/16/e539db7ec64d4ff69bb65dc876a52e04mh215ntvv1.png', '230985', 'png', 1, 1, '2021-01-16 11:06:23', '2021-01-16 11:06:23');
INSERT INTO `eb_system_attachment` VALUES (91, 'QQ截圖20210116094519.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/388be41ee5e540378edcc83b1b9abf36rpi9e3s4vr.png', 'crmebimage/product/2021/01/16/388be41ee5e540378edcc83b1b9abf36rpi9e3s4vr.png', '100013', 'png', 1, 1, '2021-01-16 11:08:06', '2021-01-16 11:08:06');
INSERT INTO `eb_system_attachment` VALUES (92, 'QQ截圖20210116094527.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/86a7db3eab354a2ca1bc6c3476ac0a8cajkwhw50cw.png', 'crmebimage/product/2021/01/16/86a7db3eab354a2ca1bc6c3476ac0a8cajkwhw50cw.png', '230985', 'png', 1, 1, '2021-01-16 11:08:08', '2021-01-16 11:08:08');
INSERT INTO `eb_system_attachment` VALUES (93, 'QQ截圖20210116094533.png', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/16/4983461a69294c088fcf887965ee8e607x949h0z8t.png', 'crmebimage/product/2021/01/16/4983461a69294c088fcf887965ee8e607x949h0z8t.png', '132451', 'png', 1, 1, '2021-01-16 11:08:10', '2021-01-16 11:08:10');
INSERT INTO `eb_system_attachment` VALUES (97, 'LG.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/user/2021/01/18/834bdc8ab1284161a1c8d0bc0fdaef8731wtytf9d4.jpg', 'crmebimage/user/2021/01/18/834bdc8ab1284161a1c8d0bc0fdaef8731wtytf9d4.jpg', '85835', 'jpeg', 7, 1, '2021-01-18 12:21:07', '2021-01-18 12:21:07');
INSERT INTO `eb_system_attachment` VALUES (98, 'IPhone.jpg', '/www/wwwroot/api.java.crmeb.net/crmebimage/product/2021/01/18/955b8ebb5db94613a634a0bfd67bdf58ro2l2xfoic.jpg', 'crmebimage/product/2021/01/18/955b8ebb5db94613a634a0bfd67bdf58ro2l2xfoic.jpg', '9920', 'jpeg', 1, 1, '2021-01-18 14:51:52', '2021-01-18 14:51:52');
INSERT INTO `eb_system_attachment` VALUES (99, '微信圖片_20210105114151.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/01/21/f71ae26b45c64c0e95647384861919ebv40seyee4r.jpg', 'crmebimage/user/2021/01/21/f71ae26b45c64c0e95647384861919ebv40seyee4r.jpg', '75514', 'jpeg', 7, 1, '2021-01-21 10:01:04', '2021-01-21 10:01:04');
INSERT INTO `eb_system_attachment` VALUES (100, '微信圖片_20200422092317.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/01/21/39b3568850674614af7b7a73cb366d626xs8egiztn.jpg', 'crmebimage/user/2021/01/21/39b3568850674614af7b7a73cb366d626xs8egiztn.jpg', '259636', 'jpeg', 7, 1, '2021-01-21 11:05:06', '2021-01-21 11:05:06');
INSERT INTO `eb_system_attachment` VALUES (101, 'd1.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/01/22/ffab03f5126d47a7979b6e498d0a86a4casxazb5oo.png', 'crmebimage/user/2021/01/22/ffab03f5126d47a7979b6e498d0a86a4casxazb5oo.png', '345759', 'png', 7, 1, '2021-01-22 14:52:15', '2021-01-22 14:52:15');
INSERT INTO `eb_system_attachment` VALUES (102, 'timg.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/01/83ab63dc0fa2415cbdba577a886e05a04ge6axdo7f.jpg', 'crmebimage/product/2021/02/01/83ab63dc0fa2415cbdba577a886e05a04ge6axdo7f.jpg', '26852', 'jpeg', 1, 1, '2021-02-01 14:53:44', '2021-02-01 14:53:44');
INSERT INTO `eb_system_attachment` VALUES (105, 'tmp_gFqz2KSpPPRyxgQVyvViiaaKkBOjKjO0.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/02/8b1b31e06fe548278fc965cde41d74ddq5adivdjpp.jpg', 'crmebimage/user/2021/02/02/8b1b31e06fe548278fc965cde41d74ddq5adivdjpp.jpg', '132050', 'text/plain', 7, 1, '2021-02-02 14:31:37', '2021-02-02 14:31:37');
INSERT INTO `eb_system_attachment` VALUES (115, 'TB2slw1XRTkJKJjSspkXXaGQXXa_!!693060164.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/ee1afb45d3ca45749db3b49a8a83845ce7sg4u2131.jpg', 'crmebimage/store/2021/02/03/ee1afb45d3ca45749db3b49a8a83845ce7sg4u2131.jpg', '9730', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (116, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/8d2d52443a12467ba49c8ad478728bfbx5s0bl5l26.jpg', 'crmebimage/store/2021/02/03/8d2d52443a12467ba49c8ad478728bfbx5s0bl5l26.jpg', '6766', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (117, 'VIVO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/94acccd966b14ee08493f823fa9d1d9b7r401nmtbb.jpg', 'crmebimage/store/2021/02/03/94acccd966b14ee08493f823fa9d1d9b7r401nmtbb.jpg', '6528', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (118, '酷派.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/97212946982546dc9c7d054fd097b41caoxybdk7v5.jpg', 'crmebimage/store/2021/02/03/97212946982546dc9c7d054fd097b41caoxybdk7v5.jpg', '7236', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (119, '摩托羅拉.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/9b1ae8434b15403e975bce5dadfe68begqtckc5l6g.jpg', 'crmebimage/store/2021/02/03/9b1ae8434b15403e975bce5dadfe68begqtckc5l6g.jpg', '13608', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (120, '聯想.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/4c8d886563194f138bdbdc94a395f111zn54bfbcse.jpg', 'crmebimage/store/2021/02/03/4c8d886563194f138bdbdc94a395f111zn54bfbcse.jpg', '17420', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (121, '魅族.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/bd6416c39fd643868f85b143dcd160a8t6ykoo6c0i.jpg', 'crmebimage/store/2021/02/03/bd6416c39fd643868f85b143dcd160a8t6ykoo6c0i.jpg', '70009', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (122, '三星.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/88f3a9a67a144a30850f136a456b84583yqdos9nqw.jpg', 'crmebimage/store/2021/02/03/88f3a9a67a144a30850f136a456b84583yqdos9nqw.jpg', '3807', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (123, '華為.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/5396a7d7689a40679576ed8e5775e2d56jckfqxa7p.jpg', 'crmebimage/store/2021/02/03/5396a7d7689a40679576ed8e5775e2d56jckfqxa7p.jpg', '16905', 'jpeg', 541, 1, '2021-02-03 14:35:44', '2021-02-03 14:35:44');
INSERT INTO `eb_system_attachment` VALUES (124, 'OPPO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/0f752b7125d348a980ddcc7c449e86721d9yewdvod.jpg', 'crmebimage/store/2021/02/03/0f752b7125d348a980ddcc7c449e86721d9yewdvod.jpg', '3659', 'jpeg', 541, 1, '2021-02-03 14:35:54', '2021-02-03 14:35:54');
INSERT INTO `eb_system_attachment` VALUES (125, '中興.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/32f4816a0bbe4ce897f031807de04cc0wr9wb1os0q.jpg', 'crmebimage/store/2021/02/03/32f4816a0bbe4ce897f031807de04cc0wr9wb1os0q.jpg', '4012', 'jpeg', 541, 1, '2021-02-03 14:35:59', '2021-02-03 14:35:59');
INSERT INTO `eb_system_attachment` VALUES (126, '一加.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/04ee06cab5514c5c83d471efa163c3e41kbzikvc7o.jpg', 'crmebimage/store/2021/02/03/04ee06cab5514c5c83d471efa163c3e41kbzikvc7o.jpg', '9728', 'jpeg', 541, 1, '2021-02-03 14:35:59', '2021-02-03 14:35:59');
INSERT INTO `eb_system_attachment` VALUES (127, 'tmp_FW2iHISkcJ6B8OSxWjBEdVhYAgEb9QnM.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/03/5a85e76e2b4548968657fd2ff4445752pa3jxis768.jpg', 'crmebimage/user/2021/02/03/5a85e76e2b4548968657fd2ff4445752pa3jxis768.jpg', '132050', 'text/plain', 7, 1, '2021-02-03 14:48:09', '2021-02-03 14:48:09');
INSERT INTO `eb_system_attachment` VALUES (128, 'src=http___img.alicdn.com_imgextra_3a_43_TB1loA9RXXXXXXpXFXXSutbFXXX.jpg&refer=http___img.alicdn.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/a24c1976f46247eab9c2c343d4080d1cnkzikqct3h.jpg', 'crmebimage/store/2021/02/03/a24c1976f46247eab9c2c343d4080d1cnkzikqct3h.jpg', '17215', 'jpeg', 541, 1, '2021-02-03 15:12:14', '2021-02-03 15:12:14');
INSERT INTO `eb_system_attachment` VALUES (130, 'src=http___5b0988e595225.cdn.sohucs.com.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/8cf658e724594b73abe18b732a585888n82kadb1mp.jpg', 'crmebimage/store/2021/02/03/8cf658e724594b73abe18b732a585888n82kadb1mp.jpg', '19159', 'jpeg', 541, 1, '2021-02-03 15:43:00', '2021-02-03 18:28:11');
INSERT INTO `eb_system_attachment` VALUES (131, '4c9ed202101291039049048.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/03/c4cb884d2f3b44b1b5b771453e52dcc130ozbmrkpy.png', 'crmebimage/operation/2021/02/03/c4cb884d2f3b44b1b5b771453e52dcc130ozbmrkpy.png', '2932', 'png', 541, 1, '2021-02-03 15:46:13', '2021-02-03 18:28:06');
INSERT INTO `eb_system_attachment` VALUES (135, 'QQ截圖20210203160048.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/ae696f14e2764c8fa37488ca505614ffk2ba9ap92x.png', 'crmebimage/content/2021/02/03/ae696f14e2764c8fa37488ca505614ffk2ba9ap92x.png', '203344', 'png', 567, 1, '2021-02-03 16:02:04', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (139, 'QQ截圖20210203160343.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/502fa8494e304677aade79f603cd27a3kuw7d1mupt.png', 'crmebimage/content/2021/02/03/502fa8494e304677aade79f603cd27a3kuw7d1mupt.png', '221707', 'png', 567, 1, '2021-02-03 16:04:08', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (150, 'QQ截圖20210203160334.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/03/2d6ed4d140fd49a3833c6db5d777f07896y84eepjz.png', 'crmebimage/store/2021/02/03/2d6ed4d140fd49a3833c6db5d777f07896y84eepjz.png', '199348', 'png', 567, 1, '2021-02-03 16:11:04', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (154, 'QQ截圖20210203162430.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/95ba1605b3f04bf990305dcbb1bab6114e62nbndjc.png', 'crmebimage/content/2021/02/03/95ba1605b3f04bf990305dcbb1bab6114e62nbndjc.png', '268355', 'png', 567, 1, '2021-02-03 16:32:32', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (155, 'QQ截圖20210203160352.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/c470941b162244f583580daaf5c793d34yt99k6uox.png', 'crmebimage/product/2021/02/03/c470941b162244f583580daaf5c793d34yt99k6uox.png', '244556', 'png', 1, 1, '2021-02-03 16:49:41', '2021-02-03 16:49:41');
INSERT INTO `eb_system_attachment` VALUES (156, 'QQ截圖20210203160359.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/27142bdc19ff41ba8956c11279c32fc2cod6pbdhzs.png', 'crmebimage/product/2021/02/03/27142bdc19ff41ba8956c11279c32fc2cod6pbdhzs.png', '224252', 'png', 1, 1, '2021-02-03 16:49:43', '2021-02-03 16:49:43');
INSERT INTO `eb_system_attachment` VALUES (157, 'QQ截圖20210203160334.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/88e68e5d77a341f997ca90e074e44a81nsfxaasj0l.png', 'crmebimage/product/2021/02/03/88e68e5d77a341f997ca90e074e44a81nsfxaasj0l.png', '199348', 'png', 1, 1, '2021-02-03 16:49:46', '2021-02-03 16:49:46');
INSERT INTO `eb_system_attachment` VALUES (158, 'QQ截圖20210203160048.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/c7e6ae41105f43aaa04d3847b02a11d2g60drdclh6.png', 'crmebimage/product/2021/02/03/c7e6ae41105f43aaa04d3847b02a11d2g60drdclh6.png', '203344', 'png', 1, 1, '2021-02-03 16:49:50', '2021-02-03 16:49:50');
INSERT INTO `eb_system_attachment` VALUES (159, 'AD59F88B-5F4F-4930-A1B0-F511679B7B28.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/08a0c0d830964f4380f31ab20c84f28bv2zvk45sur.jpeg', 'crmebimage/product/2021/02/03/08a0c0d830964f4380f31ab20c84f28bv2zvk45sur.jpeg', '438833', 'jpeg', 1, 1, '2021-02-03 17:02:23', '2021-02-03 17:02:23');
INSERT INTO `eb_system_attachment` VALUES (160, '4E9B3209-7B3B-43A6-9E00-A80DF9D603E7.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/2fd4823366954e22a02ef9f6ee04f53fxo1jwfm9ea.jpeg', 'crmebimage/product/2021/02/03/2fd4823366954e22a02ef9f6ee04f53fxo1jwfm9ea.jpeg', '438833', 'jpeg', 1, 1, '2021-02-03 17:02:29', '2021-02-03 17:02:29');
INSERT INTO `eb_system_attachment` VALUES (161, '7CC03582-1C7F-4716-9D77-CC5A3C0A242E.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/42eade20488b4ca4aac28fbccea3b4e17qgo8onrz6.jpeg', 'crmebimage/product/2021/02/03/42eade20488b4ca4aac28fbccea3b4e17qgo8onrz6.jpeg', '438833', 'jpeg', 1, 1, '2021-02-03 17:02:34', '2021-02-03 17:02:34');
INSERT INTO `eb_system_attachment` VALUES (162, 'QQ截圖20210203160334.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/f0c18caa9e9c4e6ea25bfd9d190b7180j0kovuoewd.png', 'crmebimage/product/2021/02/03/f0c18caa9e9c4e6ea25bfd9d190b7180j0kovuoewd.png', '199348', 'png', 1, 1, '2021-02-03 17:07:14', '2021-02-03 17:07:14');
INSERT INTO `eb_system_attachment` VALUES (163, 'QQ截圖20210203160048.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/beec9ca21411462ba615bd22b2cff3eezg4ry39vkb.png', 'crmebimage/product/2021/02/03/beec9ca21411462ba615bd22b2cff3eezg4ry39vkb.png', '203344', 'png', 1, 1, '2021-02-03 17:07:17', '2021-02-03 17:07:17');
INSERT INTO `eb_system_attachment` VALUES (164, 'QQ截圖20210203160343.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/03/c7313e15408747febc1eba1de70ad237dsagogqpew.png', 'crmebimage/product/2021/02/03/c7313e15408747febc1eba1de70ad237dsagogqpew.png', '221707', 'png', 1, 1, '2021-02-03 17:07:19', '2021-02-03 17:07:19');
INSERT INTO `eb_system_attachment` VALUES (165, 'QQ截圖20210203172202.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/6c362779a6b842e9b7557d1236da6079cizld6hgvn.png', 'crmebimage/content/2021/02/03/6c362779a6b842e9b7557d1236da6079cizld6hgvn.png', '361614', 'png', 567, 1, '2021-02-03 17:22:32', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (166, 'QQ截圖20210203172212.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/b1a876797eb944e7842248e3aa57b8e4ytxt0uv60g.png', 'crmebimage/content/2021/02/03/b1a876797eb944e7842248e3aa57b8e4ytxt0uv60g.png', '305842', 'png', 567, 1, '2021-02-03 17:22:36', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (167, 'QQ截圖20210203172219.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/a96f19b279d346a39fee75747c3d3517jfb2ap17tf.png', 'crmebimage/content/2021/02/03/a96f19b279d346a39fee75747c3d3517jfb2ap17tf.png', '210797', 'png', 567, 1, '2021-02-03 17:22:39', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (168, 'QQ截圖20210203172226.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/03/eb45c1358c554d3d95db9ad570f78702942prvia8x.png', 'crmebimage/content/2021/02/03/eb45c1358c554d3d95db9ad570f78702942prvia8x.png', '254191', 'png', 567, 1, '2021-02-03 17:22:41', '2021-02-03 18:28:59');
INSERT INTO `eb_system_attachment` VALUES (171, '1607498682(1).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/maintain/2021/02/03/20eecd2797bc4b5db0edf874f225711fqk4lb7xw43.jpg', 'crmebimage/maintain/2021/02/03/20eecd2797bc4b5db0edf874f225711fqk4lb7xw43.jpg', '18860', 'jpeg', 0, 1, '2021-02-03 18:35:05', '2021-02-03 18:35:05');
INSERT INTO `eb_system_attachment` VALUES (172, '9c2a3160cbe04f36aa3340cc8f97dc67a9ai2hbt9f.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/04/238e4b09b34c4c528f45e39cdb899341u438rcxsth.png', 'crmebimage/operation/2021/02/04/238e4b09b34c4c528f45e39cdb899341u438rcxsth.png', '24056', 'png', 0, 1, '2021-02-04 09:28:06', '2021-02-04 09:28:06');
INSERT INTO `eb_system_attachment` VALUES (173, 'QQ截圖20210204093900.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/0c1b2137332d4ef6a81c5fbbf7b8d914vqijbjppm9.png', 'crmebimage/content/2021/02/04/0c1b2137332d4ef6a81c5fbbf7b8d914vqijbjppm9.png', '107012', 'png', 0, 1, '2021-02-04 09:39:15', '2021-02-04 09:39:15');
INSERT INTO `eb_system_attachment` VALUES (174, 'QQ截圖20210204093854.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/9a132dafab50418c87a7c497ec4d7fb6rn2h3rub9z.png', 'crmebimage/content/2021/02/04/9a132dafab50418c87a7c497ec4d7fb6rn2h3rub9z.png', '176943', 'png', 0, 1, '2021-02-04 09:39:15', '2021-02-04 09:39:15');
INSERT INTO `eb_system_attachment` VALUES (175, 'QQ截圖20210204093844.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/e5bd2aa9415943c0992222b367437774scnxhw0yk2.png', 'crmebimage/content/2021/02/04/e5bd2aa9415943c0992222b367437774scnxhw0yk2.png', '194996', 'png', 0, 1, '2021-02-04 09:39:15', '2021-02-04 09:39:15');
INSERT INTO `eb_system_attachment` VALUES (176, 'QQ截圖20210204093907.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/010539d15176440989dcb872301728a6xlwqsrviwz.png', 'crmebimage/content/2021/02/04/010539d15176440989dcb872301728a6xlwqsrviwz.png', '178113', 'png', 0, 1, '2021-02-04 09:39:15', '2021-02-04 09:39:15');
INSERT INTO `eb_system_attachment` VALUES (177, '微信截圖_20210204093832.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/86e3c868a19849f6ae1f54d9688a8e41fdzvthjxkq.png', 'crmebimage/content/2021/02/04/86e3c868a19849f6ae1f54d9688a8e41fdzvthjxkq.png', '397423', 'png', 0, 1, '2021-02-04 09:39:22', '2021-02-04 09:39:22');
INSERT INTO `eb_system_attachment` VALUES (179, 'src=http___imgo.yqdown.com_img2020_12_8_15_20201208555310819392.jpg&refer=http___imgo.yqdown.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/04/080e3fe9dd9645dca740ca8e74d423e246dbybhnu7.jpg', 'crmebimage/operation/2021/02/04/080e3fe9dd9645dca740ca8e74d423e246dbybhnu7.jpg', '29413', 'jpeg', 0, 1, '2021-02-04 09:48:42', '2021-02-04 09:48:42');
INSERT INTO `eb_system_attachment` VALUES (180, 'QQ截圖20210204094940.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/82fb20800e8b42fcafeb5114478d13565zuzmqhyiw.png', 'crmebimage/content/2021/02/04/82fb20800e8b42fcafeb5114478d13565zuzmqhyiw.png', '257707', 'png', 0, 1, '2021-02-04 09:50:20', '2021-02-04 09:50:20');
INSERT INTO `eb_system_attachment` VALUES (181, 'QQ截圖20210204095011.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/191bd27a74454876b4c749e28814622dyo7h9v5ik1.png', 'crmebimage/content/2021/02/04/191bd27a74454876b4c749e28814622dyo7h9v5ik1.png', '280031', 'png', 0, 1, '2021-02-04 09:50:29', '2021-02-04 09:50:29');
INSERT INTO `eb_system_attachment` VALUES (182, 'QQ截圖20210204094949.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/f9279436d9654fe5bc3a80834e3689196r1u6erz23.png', 'crmebimage/content/2021/02/04/f9279436d9654fe5bc3a80834e3689196r1u6erz23.png', '227952', 'png', 0, 1, '2021-02-04 09:50:29', '2021-02-04 09:50:29');
INSERT INTO `eb_system_attachment` VALUES (183, 'QQ截圖20210204095004.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/7a26f54e4bdd40e7ac575ff86d2c449cg59tnz05wv.png', 'crmebimage/content/2021/02/04/7a26f54e4bdd40e7ac575ff86d2c449cg59tnz05wv.png', '240581', 'png', 0, 1, '2021-02-04 09:50:29', '2021-02-04 09:50:29');
INSERT INTO `eb_system_attachment` VALUES (184, 'QQ截圖20210204094958.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/c74faa63942b4915ad7efd77f756777a6xc9jdasm6.png', 'crmebimage/content/2021/02/04/c74faa63942b4915ad7efd77f756777a6xc9jdasm6.png', '340761', 'png', 0, 1, '2021-02-04 09:50:29', '2021-02-04 09:50:29');
INSERT INTO `eb_system_attachment` VALUES (185, 'QQ截圖20210204095314.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/f847946785dc49f2a656c3caee85af2czmrk2olnav.png', 'crmebimage/content/2021/02/04/f847946785dc49f2a656c3caee85af2czmrk2olnav.png', '155333', 'png', 0, 1, '2021-02-04 09:53:31', '2021-02-04 09:53:31');
INSERT INTO `eb_system_attachment` VALUES (186, 'QQ截圖20210204095320.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/e24cf8b2805546b38e1e0d848050bceax4jo3ah28i.png', 'crmebimage/content/2021/02/04/e24cf8b2805546b38e1e0d848050bceax4jo3ah28i.png', '141457', 'png', 0, 1, '2021-02-04 09:53:31', '2021-02-04 09:53:31');
INSERT INTO `eb_system_attachment` VALUES (187, '78c23202012301419084929.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/04/fb067ec720bd40c19f9fe0e46068ff515e3rumal4x.png', 'crmebimage/operation/2021/02/04/fb067ec720bd40c19f9fe0e46068ff515e3rumal4x.png', '3982', 'png', 0, 1, '2021-02-04 10:13:10', '2021-02-04 10:13:10');
INSERT INTO `eb_system_attachment` VALUES (188, '9c2a3160cbe04f36aa3340cc8f97dc67a9ai2hbt9f.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/04/1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', 'crmebimage/operation/2021/02/04/1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', '24056', 'png', 0, 1, '2021-02-04 10:54:07', '2021-02-04 10:54:07');
INSERT INTO `eb_system_attachment` VALUES (189, 'QQ截圖20201204142830.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/2f79c8beea874c0595383adc7a3aa4fa31txurrkeg.png', 'crmebimage/product/2021/02/04/2f79c8beea874c0595383adc7a3aa4fa31txurrkeg.png', '257344', 'png', 1, 1, '2021-02-04 11:24:19', '2021-02-04 11:24:19');
INSERT INTO `eb_system_attachment` VALUES (190, 'QQ截圖20201204142841.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/4f4aa24c0a1c4721968ba932790b7d015afa6pp17e.png', 'crmebimage/product/2021/02/04/4f4aa24c0a1c4721968ba932790b7d015afa6pp17e.png', '203907', 'png', 1, 1, '2021-02-04 11:24:22', '2021-02-04 11:24:22');
INSERT INTO `eb_system_attachment` VALUES (191, 'QQ截圖20201204142821.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/c01f4b87f867443ea767ef0488dbe833i0k0sm36dr.png', 'crmebimage/product/2021/02/04/c01f4b87f867443ea767ef0488dbe833i0k0sm36dr.png', '166625', 'png', 1, 1, '2021-02-04 11:24:25', '2021-02-04 11:24:25');
INSERT INTO `eb_system_attachment` VALUES (192, '90A06EDB-0066-4919-AB49-CEEAA3414564.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/04/ace8f34bfec041efab5f88a21f12acbe6l22vhlmdk.png', 'crmebimage/user/2021/02/04/ace8f34bfec041efab5f88a21f12acbe6l22vhlmdk.png', '160444', 'png', 1, 1, '2021-02-04 11:37:47', '2021-02-04 11:37:47');
INSERT INTO `eb_system_attachment` VALUES (193, '7F02593F-6998-46B4-974F-D4060410C712.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/04/4bb796dc77b249f5bc8c97a3e80784aautvyldk507.png', 'crmebimage/user/2021/02/04/4bb796dc77b249f5bc8c97a3e80784aautvyldk507.png', '160444', 'png', 1, 1, '2021-02-04 11:40:12', '2021-02-04 11:40:12');
INSERT INTO `eb_system_attachment` VALUES (194, 'e8789202012031203336022 (1).png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/04/43ac186be9ff43e28e4e8224387076945zx0z06lr6.png', 'crmebimage/operation/2021/02/04/43ac186be9ff43e28e4e8224387076945zx0z06lr6.png', '2932', 'png', 0, 1, '2021-02-04 14:43:18', '2021-02-04 14:43:18');
INSERT INTO `eb_system_attachment` VALUES (195, '1607498682(1).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/04/f11f2ed1f1a645d7bcc70ac41de73b6eamiqvx472a.jpg', 'crmebimage/user/2021/02/04/f11f2ed1f1a645d7bcc70ac41de73b6eamiqvx472a.jpg', '18860', 'jpeg', 1, 1, '2021-02-04 15:17:23', '2021-02-04 15:17:23');
INSERT INTO `eb_system_attachment` VALUES (196, 'e8789202012031203336022 (1).png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/02e9a0f2b28a462792a33053166d5195ldzqq7pr6e.png', 'crmebimage/product/2021/02/04/02e9a0f2b28a462792a33053166d5195ldzqq7pr6e.png', '2932', 'png', 1, 1, '2021-02-04 15:39:18', '2021-02-04 15:39:18');
INSERT INTO `eb_system_attachment` VALUES (197, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/c9f096758c9a4db3b46abdb1c9260974go39chqmw3.jpg', 'crmebimage/product/2021/02/04/c9f096758c9a4db3b46abdb1c9260974go39chqmw3.jpg', '6766', 'jpeg', 1, 1, '2021-02-04 15:39:51', '2021-02-04 15:39:51');
INSERT INTO `eb_system_attachment` VALUES (198, 'OPPO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/d0d49ba5ebf44099b3c88a2297dbe8a72w9obq2wse.jpg', 'crmebimage/product/2021/02/04/d0d49ba5ebf44099b3c88a2297dbe8a72w9obq2wse.jpg', '3659', 'jpeg', 1, 1, '2021-02-04 15:40:07', '2021-02-04 15:40:07');
INSERT INTO `eb_system_attachment` VALUES (199, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/e108b68147714faf98782b9ddf21a585svuq0a6v4m.jpg', 'crmebimage/product/2021/02/04/e108b68147714faf98782b9ddf21a585svuq0a6v4m.jpg', '6766', 'jpeg', 1, 1, '2021-02-04 15:40:10', '2021-02-04 15:40:10');
INSERT INTO `eb_system_attachment` VALUES (200, 'VIVO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/a2d24aeef8bb40f38a3b3760355c03a4t8xk95996f.jpg', 'crmebimage/product/2021/02/04/a2d24aeef8bb40f38a3b3760355c03a4t8xk95996f.jpg', '6528', 'jpeg', 1, 1, '2021-02-04 15:42:49', '2021-02-04 15:42:49');
INSERT INTO `eb_system_attachment` VALUES (201, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/1d6fd605bfc341f98a746015b486c7b5w0bsaj83pj.jpg', 'crmebimage/product/2021/02/04/1d6fd605bfc341f98a746015b486c7b5w0bsaj83pj.jpg', '6766', 'jpeg', 1, 1, '2021-02-04 15:42:52', '2021-02-04 15:42:52');
INSERT INTO `eb_system_attachment` VALUES (202, 'OPPO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/04/31f5bd61cf7542ddb61ab8b732d15808repem8kwpw.jpg', 'crmebimage/product/2021/02/04/31f5bd61cf7542ddb61ab8b732d15808repem8kwpw.jpg', '3659', 'jpeg', 1, 1, '2021-02-04 15:42:56', '2021-02-04 15:42:56');
INSERT INTO `eb_system_attachment` VALUES (203, 'QQ截圖20210204163521.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/1d2960aadd4e4c33b803d6020d57de2botmcd1b6y2.png', 'crmebimage/content/2021/02/04/1d2960aadd4e4c33b803d6020d57de2botmcd1b6y2.png', '309349', 'png', 0, 1, '2021-02-04 16:35:35', '2021-02-04 16:35:35');
INSERT INTO `eb_system_attachment` VALUES (204, 'QQ截圖20210204163559.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/d8947c62cf2045a592248b6296f056e5g3yv5pvxro.png', 'crmebimage/content/2021/02/04/d8947c62cf2045a592248b6296f056e5g3yv5pvxro.png', '42734', 'png', 0, 1, '2021-02-04 16:36:22', '2021-02-04 16:36:22');
INSERT INTO `eb_system_attachment` VALUES (205, 'QQ截圖20210204163607.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/77bf0c84e2a4431fb3d7999b895ff24fwd00fa9cmc.png', 'crmebimage/content/2021/02/04/77bf0c84e2a4431fb3d7999b895ff24fwd00fa9cmc.png', '23757', 'png', 0, 1, '2021-02-04 16:36:22', '2021-02-04 16:36:22');
INSERT INTO `eb_system_attachment` VALUES (206, 'QQ截圖20210204163550.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/13cf0c1db5b5440bab6b3563857b0b892dufhh8hca.png', 'crmebimage/content/2021/02/04/13cf0c1db5b5440bab6b3563857b0b892dufhh8hca.png', '181552', 'png', 0, 1, '2021-02-04 16:36:22', '2021-02-04 16:36:22');
INSERT INTO `eb_system_attachment` VALUES (207, 'QQ截圖20210204163613.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/04/41db5a673a4d40798010014b61e6d4cbsk15f6xovj.png', 'crmebimage/content/2021/02/04/41db5a673a4d40798010014b61e6d4cbsk15f6xovj.png', '141338', 'png', 0, 1, '2021-02-04 16:36:22', '2021-02-04 16:36:22');
INSERT INTO `eb_system_attachment` VALUES (210, 'src=http___pic.51yuansu.com_pic3_cover_01_64_06_59576321339db_610.jpg&refer=http___pic.51yuansu.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/marketing/2021/02/05/ffd76f033a4d4e8eb1bdf80ef009b22327ujotl7ym.jpg', 'crmebimage/marketing/2021/02/05/ffd76f033a4d4e8eb1bdf80ef009b22327ujotl7ym.jpg', '28383', 'jpeg', 0, 1, '2021-02-05 14:28:28', '2021-02-05 14:28:28');
INSERT INTO `eb_system_attachment` VALUES (211, 'u=1869472749,1158264850&fm=26&gp=0.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/marketing/2021/02/05/3b0dd2b7edee486cbf619d7c674ba0aeylcs8k37qb.jpg', 'crmebimage/marketing/2021/02/05/3b0dd2b7edee486cbf619d7c674ba0aeylcs8k37qb.jpg', '75860', 'jpeg', 0, 1, '2021-02-05 14:28:28', '2021-02-05 14:28:28');
INSERT INTO `eb_system_attachment` VALUES (212, 'src=http___bpic.588ku.com_element_origin_min_pic_16_10_18_155805d48cd84e6.jpg&refer=http__.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/marketing/2021/02/05/fba14bef318f4aaba3f3a7747a94b153ggcwsgwut2.jpg', 'crmebimage/marketing/2021/02/05/fba14bef318f4aaba3f3a7747a94b153ggcwsgwut2.jpg', '14509', 'jpeg', 0, 1, '2021-02-05 14:28:33', '2021-02-05 14:28:33');
INSERT INTO `eb_system_attachment` VALUES (213, 'QQ截圖20210205143041.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/4d7e988b70e7460e99e7ba9347efba49hb4r9arxmm.png', 'crmebimage/content/2021/02/05/4d7e988b70e7460e99e7ba9347efba49hb4r9arxmm.png', '270826', 'png', 0, 1, '2021-02-05 14:31:21', '2021-02-05 14:31:21');
INSERT INTO `eb_system_attachment` VALUES (214, 'QQ截圖20210205143052.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/33d82581825344ea9f6e9e65ad060309ai8ovibxs3.png', 'crmebimage/content/2021/02/05/33d82581825344ea9f6e9e65ad060309ai8ovibxs3.png', '308077', 'png', 0, 1, '2021-02-05 14:31:21', '2021-02-05 14:31:21');
INSERT INTO `eb_system_attachment` VALUES (215, 'QQ截圖20210205143107.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/e6113febfdc1464ea91cbb78c32127f1y7xl0o9apa.png', 'crmebimage/content/2021/02/05/e6113febfdc1464ea91cbb78c32127f1y7xl0o9apa.png', '303304', 'png', 0, 1, '2021-02-05 14:31:21', '2021-02-05 14:31:21');
INSERT INTO `eb_system_attachment` VALUES (216, 'QQ截圖20210205143101.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/84e4a72635154ce695671837a764ce79sive0j4ods.png', 'crmebimage/content/2021/02/05/84e4a72635154ce695671837a764ce79sive0j4ods.png', '323431', 'png', 0, 1, '2021-02-05 14:31:21', '2021-02-05 14:31:21');
INSERT INTO `eb_system_attachment` VALUES (217, 'QQ截圖20210205143113.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/7447c4a489ea4e6993fbec8165e1399cxnfz70aroh.png', 'crmebimage/content/2021/02/05/7447c4a489ea4e6993fbec8165e1399cxnfz70aroh.png', '276998', 'png', 0, 1, '2021-02-05 14:31:21', '2021-02-05 14:31:21');
INSERT INTO `eb_system_attachment` VALUES (218, 'QQ截圖20210205143041.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/a7f85f2a8cd14ee193e6de094644c05dmv05adogi6.png', 'crmebimage/product/2021/02/05/a7f85f2a8cd14ee193e6de094644c05dmv05adogi6.png', '270826', 'png', 1, 1, '2021-02-05 16:04:39', '2021-02-05 16:04:39');
INSERT INTO `eb_system_attachment` VALUES (219, 'QQ截圖20210205143052.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/8e231c77deab4887abbe4f7625f00b84zvm5l4p3ki.png', 'crmebimage/product/2021/02/05/8e231c77deab4887abbe4f7625f00b84zvm5l4p3ki.png', '308077', 'png', 1, 1, '2021-02-05 16:04:42', '2021-02-05 16:04:42');
INSERT INTO `eb_system_attachment` VALUES (220, 'QQ截圖20210205143101.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/bb2f033aafb54e67990497d1d7cb9f51af0tv94tlz.png', 'crmebimage/product/2021/02/05/bb2f033aafb54e67990497d1d7cb9f51af0tv94tlz.png', '323431', 'png', 1, 1, '2021-02-05 16:04:44', '2021-02-05 16:04:44');
INSERT INTO `eb_system_attachment` VALUES (221, 'QQ截圖20210205143107.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/e49807a1f96e4a22b2647372df821827z5c21me02q.png', 'crmebimage/product/2021/02/05/e49807a1f96e4a22b2647372df821827z5c21me02q.png', '303304', 'png', 1, 1, '2021-02-05 16:04:47', '2021-02-05 16:04:47');
INSERT INTO `eb_system_attachment` VALUES (222, 'QQ截圖20210205143113.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/5b60e6c098e24aebb02a865579d18e9e0utz93mxru.png', 'crmebimage/product/2021/02/05/5b60e6c098e24aebb02a865579d18e9e0utz93mxru.png', '276998', 'png', 1, 1, '2021-02-05 16:04:49', '2021-02-05 16:04:49');
INSERT INTO `eb_system_attachment` VALUES (223, 'QQ截圖20210205161136.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/ebc3ccf2e6b847e19331cf3811fb1d3c1e723tgrkt.png', 'crmebimage/content/2021/02/05/ebc3ccf2e6b847e19331cf3811fb1d3c1e723tgrkt.png', '271655', 'png', 0, 1, '2021-02-05 16:12:22', '2021-02-05 16:12:22');
INSERT INTO `eb_system_attachment` VALUES (224, 'QQ截圖20210205161158.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/62305c9a5eff4560beddb3b6a21985b58xkq9dom28.png', 'crmebimage/content/2021/02/05/62305c9a5eff4560beddb3b6a21985b58xkq9dom28.png', '268815', 'png', 0, 1, '2021-02-05 16:12:31', '2021-02-05 16:12:31');
INSERT INTO `eb_system_attachment` VALUES (225, 'QQ截圖20210205161206.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/7c6c71087df74fccb7ff0ab3fe6d78e003lhz2lbx4.png', 'crmebimage/content/2021/02/05/7c6c71087df74fccb7ff0ab3fe6d78e003lhz2lbx4.png', '266924', 'png', 0, 1, '2021-02-05 16:12:31', '2021-02-05 16:12:31');
INSERT INTO `eb_system_attachment` VALUES (226, 'QQ截圖20210205161214.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/24050f58c9b440bfb1ece426beaca7c33ec9g9hscf.png', 'crmebimage/content/2021/02/05/24050f58c9b440bfb1ece426beaca7c33ec9g9hscf.png', '312537', 'png', 0, 1, '2021-02-05 16:12:31', '2021-02-05 16:12:31');
INSERT INTO `eb_system_attachment` VALUES (227, 'QQ截圖20210205161147.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/ec370cb4f22840cfadaae51a8c8d24c7yu8dsw43tg.png', 'crmebimage/content/2021/02/05/ec370cb4f22840cfadaae51a8c8d24c7yu8dsw43tg.png', '309741', 'png', 0, 1, '2021-02-05 16:12:31', '2021-02-05 16:12:31');
INSERT INTO `eb_system_attachment` VALUES (228, 'QQ截圖20210205161412.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/fd744f11584a4bc185033e5fa7ac4054jagkyos0ky.png', 'crmebimage/content/2021/02/05/fd744f11584a4bc185033e5fa7ac4054jagkyos0ky.png', '267336', 'png', 0, 1, '2021-02-05 16:14:40', '2021-02-05 16:14:40');
INSERT INTO `eb_system_attachment` VALUES (229, 'QQ截圖20210205161421.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/485b87a64c27407ba7b7ad02aa278751ik55rsvrtc.png', 'crmebimage/content/2021/02/05/485b87a64c27407ba7b7ad02aa278751ik55rsvrtc.png', '312503', 'png', 0, 1, '2021-02-05 16:14:40', '2021-02-05 16:14:40');
INSERT INTO `eb_system_attachment` VALUES (230, 'QQ截圖20210205161429.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/f113f2a2f9314a31b4476442dc184213matsjvmm6c.png', 'crmebimage/content/2021/02/05/f113f2a2f9314a31b4476442dc184213matsjvmm6c.png', '270012', 'png', 0, 1, '2021-02-05 16:14:40', '2021-02-05 16:14:40');
INSERT INTO `eb_system_attachment` VALUES (231, 'QQ截圖20210205161421.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/05/26538b3de6f14605bee3bc3f40123d75s5ylvpbpfz.png', 'crmebimage/content/2021/02/05/26538b3de6f14605bee3bc3f40123d75s5ylvpbpfz.png', '312503', 'png', 0, 1, '2021-02-05 16:15:04', '2021-02-05 16:15:04');
INSERT INTO `eb_system_attachment` VALUES (232, 'QQ截圖20210205161429.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/a5e207fafb5e416696e990358ca921076fukqzeyf4.png', 'crmebimage/product/2021/02/05/a5e207fafb5e416696e990358ca921076fukqzeyf4.png', '270012', 'png', 1, 1, '2021-02-05 18:02:39', '2021-02-05 18:02:39');
INSERT INTO `eb_system_attachment` VALUES (233, 'QQ截圖20210205161421.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/7b5a3ab87311451aa34b174d5c89dafb3863igabh7.png', 'crmebimage/product/2021/02/05/7b5a3ab87311451aa34b174d5c89dafb3863igabh7.png', '312503', 'png', 1, 1, '2021-02-05 18:02:42', '2021-02-05 18:02:42');
INSERT INTO `eb_system_attachment` VALUES (234, 'QQ截圖20210205161412.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/05/3d7c39b52e0349b6b6596dffee8b2ba7gumctphh0y.png', 'crmebimage/product/2021/02/05/3d7c39b52e0349b6b6596dffee8b2ba7gumctphh0y.png', '267336', 'png', 1, 1, '2021-02-05 18:02:45', '2021-02-05 18:02:45');
INSERT INTO `eb_system_attachment` VALUES (235, '78c23202012301419084929 (1).png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/06/096513f6db34432da64c9df987daae2f1akx2cbthv.png', 'crmebimage/operation/2021/02/06/096513f6db34432da64c9df987daae2f1akx2cbthv.png', '3982', 'png', 0, 1, '2021-02-06 09:08:34', '2021-02-06 09:08:34');
INSERT INTO `eb_system_attachment` VALUES (236, '9c2a3160cbe04f36aa3340cc8f97dc67a9ai2hbt9f.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/06/628fe75274214e029bb9be968bd61f010xtgd0sxtj.png', 'crmebimage/user/2021/02/06/628fe75274214e029bb9be968bd61f010xtgd0sxtj.png', '24056', 'png', 1, 1, '2021-02-06 10:29:15', '2021-02-06 10:29:15');
INSERT INTO `eb_system_attachment` VALUES (237, '8484D2A8-5BE9-4FC2-800D-7D08637DD0FA.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/06/30b6b9a84a4f41b0b8c1bb9c74a3139c1nuso75lvq.png', 'crmebimage/user/2021/02/06/30b6b9a84a4f41b0b8c1bb9c74a3139c1nuso75lvq.png', '1164903', 'png', 1, 1, '2021-02-06 10:31:33', '2021-02-06 10:31:33');
INSERT INTO `eb_system_attachment` VALUES (238, '摩托羅拉.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/06/651b911ac891481cb67624ba9d798b0ck0738tvw0z.jpg', 'crmebimage/user/2021/02/06/651b911ac891481cb67624ba9d798b0ck0738tvw0z.jpg', '13608', 'jpeg', 7, 1, '2021-02-06 11:12:26', '2021-02-06 11:12:26');
INSERT INTO `eb_system_attachment` VALUES (239, 'TB2slw1XRTkJKJjSspkXXaGQXXa_!!693060164.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/07/924077eb54e045fcb2bdb93dda5e77a3k6duqjmfe1.jpg', 'crmebimage/operation/2021/02/07/924077eb54e045fcb2bdb93dda5e77a3k6duqjmfe1.jpg', '9730', 'jpeg', 0, 1, '2021-02-07 11:43:43', '2021-02-07 11:43:43');
INSERT INTO `eb_system_attachment` VALUES (240, 'TB2slw1XRTkJKJjSspkXXaGQXXa_!!693060164.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/07/61bd59fcadae45188e7c7835af781f448shxe0jn9t.jpg', 'crmebimage/store/2021/02/07/61bd59fcadae45188e7c7835af781f448shxe0jn9t.jpg', '9730', 'jpeg', 0, 1, '2021-02-07 11:50:20', '2021-02-07 11:50:20');
INSERT INTO `eb_system_attachment` VALUES (241, 'TB2slw1XRTkJKJjSspkXXaGQXXa_!!693060164.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/07/bb958ed0dbbb40e3bf4963b8536ea12azq6yh3gikw.jpg', 'crmebimage/store/2021/02/07/bb958ed0dbbb40e3bf4963b8536ea12azq6yh3gikw.jpg', '9730', 'jpeg', 0, 1, '2021-02-07 11:52:54', '2021-02-07 11:52:54');
INSERT INTO `eb_system_attachment` VALUES (242, '音頻文件.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/07/f6bc1901af8a4f8d86b9202a19e3ac9fc4ms6e7ofy.mp3', 'file/operation/2021/02/07/f6bc1901af8a4f8d86b9202a19e3ac9fc4ms6e7ofy.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-07 12:17:13', '2021-02-07 12:17:13');
INSERT INTO `eb_system_attachment` VALUES (243, 'vioce.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/07/46cf370d946f44b8a2283483916813bbpmxvx9svh8.mp3', 'file/operation/2021/02/07/46cf370d946f44b8a2283483916813bbpmxvx9svh8.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-07 12:18:58', '2021-02-07 12:18:58');
INSERT INTO `eb_system_attachment` VALUES (244, 'vioce.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/07/d4f3a8c322bb410b8de5f264d5985ff1nyv1c3v4re.mp3', 'file/operation/2021/02/07/d4f3a8c322bb410b8de5f264d5985ff1nyv1c3v4re.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-07 12:19:04', '2021-02-07 12:19:04');
INSERT INTO `eb_system_attachment` VALUES (245, '訂單提示音.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/07/ff54c84b441a48bc894709cbc027b60a99i749wv2k.mp3', 'file/operation/2021/02/07/ff54c84b441a48bc894709cbc027b60a99i749wv2k.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-07 12:19:23', '2021-02-07 12:19:23');
INSERT INTO `eb_system_attachment` VALUES (246, '訂單提示音.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/07/03a34bcd3e7343448f28ae45a4c365d0je7dzd0e60.mp3', 'file/operation/2021/02/07/03a34bcd3e7343448f28ae45a4c365d0je7dzd0e60.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-07 12:19:35', '2021-02-07 12:19:35');
INSERT INTO `eb_system_attachment` VALUES (247, 'QQ截圖20210207141957.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/07/3cd64db508f64dff981efd7eb6acde3be3hqbmob08.png', 'crmebimage/store/2021/02/07/3cd64db508f64dff981efd7eb6acde3be3hqbmob08.png', '194466', 'png', 0, 1, '2021-02-07 14:20:09', '2021-02-07 14:20:09');
INSERT INTO `eb_system_attachment` VALUES (248, 'tmp_3rmA3IdRvi8TAzjzubgXBCHnC4H1hZTk.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/20/29e5c1fd3f1b43659439b1d6988632b30k4e7djcne.jpg', 'crmebimage/user/2021/02/20/29e5c1fd3f1b43659439b1d6988632b30k4e7djcne.jpg', '132050', 'text/plain', 7, 1, '2021-02-20 10:32:30', '2021-02-20 10:32:30');
INSERT INTO `eb_system_attachment` VALUES (249, 'tmp_ikDCodC2iPNZQqTs9Fc6zWkS7Tvz2csl.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/20/1691224acf33455ea786e49fda3d00c0r9004mmi85.jpg', 'crmebimage/user/2021/02/20/1691224acf33455ea786e49fda3d00c0r9004mmi85.jpg', '132050', 'text/plain', 7, 1, '2021-02-20 10:59:13', '2021-02-20 10:59:13');
INSERT INTO `eb_system_attachment` VALUES (250, '4c9ed202101291039049048.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/22/4cce4749c65449e09d728bdb88dfb1fdzahn59gcbf.png', 'crmebimage/operation/2021/02/22/4cce4749c65449e09d728bdb88dfb1fdzahn59gcbf.png', '2932', 'png', 0, 1, '2021-02-22 10:06:11', '2021-02-22 10:06:11');
INSERT INTO `eb_system_attachment` VALUES (251, '1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/22/6b91faae640646c6a8cf7769700ef8c6awr0swmz8q.png', 'crmebimage/operation/2021/02/22/6b91faae640646c6a8cf7769700ef8c6awr0swmz8q.png', '24056', 'png', 0, 1, '2021-02-22 10:17:09', '2021-02-22 10:17:09');
INSERT INTO `eb_system_attachment` VALUES (252, 'QQ截圖20210222142807.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/2ab0b704fbe140228afa8415615a988aq1a06mkfhs.png', 'crmebimage/content/2021/02/22/2ab0b704fbe140228afa8415615a988aq1a06mkfhs.png', '151332', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (253, 'QQ截圖20210222142837.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/8a621f3b558e4e47ae3cbf31adc863dchw0igx218c.png', 'crmebimage/content/2021/02/22/8a621f3b558e4e47ae3cbf31adc863dchw0igx218c.png', '177833', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (254, 'QQ截圖20210222142827.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/4b3d4923a90e4ad4918ed285e7c62056n194jz8kxs.png', 'crmebimage/content/2021/02/22/4b3d4923a90e4ad4918ed285e7c62056n194jz8kxs.png', '214518', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (255, 'QQ截圖20210222142845.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/3b5efb3e0f3b44f9aa1fce22d0ccf0e2vwnit795ah.png', 'crmebimage/content/2021/02/22/3b5efb3e0f3b44f9aa1fce22d0ccf0e2vwnit795ah.png', '87789', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (256, 'QQ截圖20210222142816.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/24a91372954d479590638a6da03c3a3263izi1cm56.png', 'crmebimage/content/2021/02/22/24a91372954d479590638a6da03c3a3263izi1cm56.png', '174235', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (257, 'QQ截圖20210222142742.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/7508e372453043f08c4e39aad3c5b381bmv4inhq56.png', 'crmebimage/content/2021/02/22/7508e372453043f08c4e39aad3c5b381bmv4inhq56.png', '152446', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (258, 'QQ截圖20210222142758.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/02/22/6f48495484974ed49b800d76e20b755cshbh0k4g1q.png', 'crmebimage/content/2021/02/22/6f48495484974ed49b800d76e20b755cshbh0k4g1q.png', '119616', 'png', 0, 1, '2021-02-22 14:29:07', '2021-02-22 14:29:07');
INSERT INTO `eb_system_attachment` VALUES (259, 'QQ截圖20210222144338.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/22/52477b0df2d54defb71ecc91858eaaacd864ugup2g.png', 'crmebimage/store/2021/02/22/52477b0df2d54defb71ecc91858eaaacd864ugup2g.png', '206365', 'png', 0, 1, '2021-02-22 14:43:49', '2021-02-22 14:43:49');
INSERT INTO `eb_system_attachment` VALUES (260, 'QQ截圖20210222144405.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/22/d81c07c3197f41e89c102d44376f5e08qhkbuorpz7.png', 'crmebimage/store/2021/02/22/d81c07c3197f41e89c102d44376f5e08qhkbuorpz7.png', '143382', 'png', 0, 1, '2021-02-22 14:44:09', '2021-02-22 14:44:09');
INSERT INTO `eb_system_attachment` VALUES (261, 'QQ截圖20210222145551.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/22/fd8e5b5eb1ca415383d56cf38c2d93e19fahxy6rsd.png', 'crmebimage/store/2021/02/22/fd8e5b5eb1ca415383d56cf38c2d93e19fahxy6rsd.png', '267076', 'png', 0, 1, '2021-02-22 14:56:01', '2021-02-22 14:56:01');
INSERT INTO `eb_system_attachment` VALUES (262, 'QQ截圖20210222145543.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/02/22/90de59f9af08493c9f8ceb46a3ae0717yl1xp6ko9l.png', 'crmebimage/store/2021/02/22/90de59f9af08493c9f8ceb46a3ae0717yl1xp6ko9l.png', '244979', 'png', 0, 1, '2021-02-22 14:56:01', '2021-02-22 14:56:01');
INSERT INTO `eb_system_attachment` VALUES (263, 'QQ截圖20210222142816.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/374d5395ef0e44b4a9f6a936880ce463pzv45g82z6.png', 'crmebimage/product/2021/02/22/374d5395ef0e44b4a9f6a936880ce463pzv45g82z6.png', '174235', 'png', 1, 1, '2021-02-22 16:02:29', '2021-02-22 16:02:29');
INSERT INTO `eb_system_attachment` VALUES (264, 'QQ截圖20210222142816.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/5a59be38cdd84712927fc4b60857e8d3zu9nmvfrs1.png', 'crmebimage/product/2021/02/22/5a59be38cdd84712927fc4b60857e8d3zu9nmvfrs1.png', '174235', 'png', 1, 1, '2021-02-22 16:02:34', '2021-02-22 16:02:34');
INSERT INTO `eb_system_attachment` VALUES (265, 'QQ截圖20210222142827.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/9534b83616894fc8a9c886630f9f9a9cho49al1o6n.png', 'crmebimage/product/2021/02/22/9534b83616894fc8a9c886630f9f9a9cho49al1o6n.png', '214518', 'png', 1, 1, '2021-02-22 16:02:36', '2021-02-22 16:02:36');
INSERT INTO `eb_system_attachment` VALUES (266, 'QQ截圖20210222142837.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/8fadc026ec8f47bdb6b22347d4a31bddet5m2c52uo.png', 'crmebimage/product/2021/02/22/8fadc026ec8f47bdb6b22347d4a31bddet5m2c52uo.png', '177833', 'png', 1, 1, '2021-02-22 16:02:40', '2021-02-22 16:02:40');
INSERT INTO `eb_system_attachment` VALUES (267, 'QQ截圖20210222144338.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/dec5fd7b7b204ffd99eeaf339d1c9a63guk457e6h8.png', 'crmebimage/product/2021/02/22/dec5fd7b7b204ffd99eeaf339d1c9a63guk457e6h8.png', '206365', 'png', 1, 1, '2021-02-22 16:02:43', '2021-02-22 16:02:43');
INSERT INTO `eb_system_attachment` VALUES (268, 'QQ截圖20210222142742.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/1ce345ab9efb494fbaa17a38b0ecde23bnizhtmooo.png', 'crmebimage/product/2021/02/22/1ce345ab9efb494fbaa17a38b0ecde23bnizhtmooo.png', '152446', 'png', 1, 1, '2021-02-22 16:18:41', '2021-02-22 16:18:41');
INSERT INTO `eb_system_attachment` VALUES (269, 'QQ截圖20210222142758.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/a0912cde589a4852967bd8d93ac5b216nccbfqvi3q.png', 'crmebimage/product/2021/02/22/a0912cde589a4852967bd8d93ac5b216nccbfqvi3q.png', '119616', 'png', 1, 1, '2021-02-22 16:18:44', '2021-02-22 16:18:44');
INSERT INTO `eb_system_attachment` VALUES (270, 'QQ截圖20210222142807.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/c13d79f60d1149c1be52eb4de6a1350ada9xhfvwjh.png', 'crmebimage/product/2021/02/22/c13d79f60d1149c1be52eb4de6a1350ada9xhfvwjh.png', '151332', 'png', 1, 1, '2021-02-22 16:18:46', '2021-02-22 16:18:46');
INSERT INTO `eb_system_attachment` VALUES (271, '1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/c15b647c365b475eae4d45d1d52e14aan69bbfsrsx.png', 'crmebimage/product/2021/02/22/c15b647c365b475eae4d45d1d52e14aan69bbfsrsx.png', '24056', 'png', 1, 1, '2021-02-22 16:18:51', '2021-02-22 16:18:51');
INSERT INTO `eb_system_attachment` VALUES (272, '1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/22/133d85663ec243279232afecf3ee683e956dyfgtxw.png', 'crmebimage/product/2021/02/22/133d85663ec243279232afecf3ee683e956dyfgtxw.png', '24056', 'png', 1, 1, '2021-02-22 16:18:53', '2021-02-22 16:18:53');
INSERT INTO `eb_system_attachment` VALUES (273, '訂單提示音.mp3', '/www/wwwroot/api.beta.java.crmeb.net/file/operation/2021/02/23/c26ecb9efd49487cb1e54e04a51492e4wafest96s8.mp3', 'file/operation/2021/02/23/c26ecb9efd49487cb1e54e04a51492e4wafest96s8.mp3', '9216', 'audio/mpeg', 10, 1, '2021-02-23 14:57:42', '2021-02-23 14:57:42');
INSERT INTO `eb_system_attachment` VALUES (274, 'D552EB39-DC8B-40CE-BD37-CEEEDDA59022.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/23/bcaef7b319af4386a685fc9a50658d01dfab5y8v63.jpeg', 'crmebimage/product/2021/02/23/bcaef7b319af4386a685fc9a50658d01dfab5y8v63.jpeg', '221040', 'jpeg', 1, 1, '2021-02-23 15:03:22', '2021-02-23 15:03:22');
INSERT INTO `eb_system_attachment` VALUES (275, '4EC2A189-E04F-4F95-BC8D-DAFB081842E6.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/23/4fbc04c29c8c42928fb1f23649cce8a9673gpx0srn.jpeg', 'crmebimage/product/2021/02/23/4fbc04c29c8c42928fb1f23649cce8a9673gpx0srn.jpeg', '157268', 'jpeg', 1, 1, '2021-02-23 15:03:28', '2021-02-23 15:03:28');
INSERT INTO `eb_system_attachment` VALUES (276, 'E72F28BC-7256-4430-93AC-5090CECE5933.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/02/23/1cef53abd5224915a5f2322383142fdds5xdli39qj.jpeg', 'crmebimage/product/2021/02/23/1cef53abd5224915a5f2322383142fdds5xdli39qj.jpeg', '108255', 'jpeg', 1, 1, '2021-02-23 15:03:34', '2021-02-23 15:03:34');
INSERT INTO `eb_system_attachment` VALUES (277, 'iShot2021-02-24 10.07.08.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/maintain/2021/02/24/23ab5b9968aa4e29a245ea8b8a4804cbkscfppxkwq.png', 'crmebimage/maintain/2021/02/24/23ab5b9968aa4e29a245ea8b8a4804cbkscfppxkwq.png', '519350', 'png', 0, 1, '2021-02-24 10:07:24', '2021-02-24 10:07:24');
INSERT INTO `eb_system_attachment` VALUES (278, '12A21C9D-B009-4B7F-8CF5-3FE1B2BAC787.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/24/4a201aed98ca48bb8366fd183ab2b9494k9hwmcckx.png', 'crmebimage/user/2021/02/24/4a201aed98ca48bb8366fd183ab2b9494k9hwmcckx.png', '300879', 'png', 1, 1, '2021-02-24 19:53:04', '2021-02-24 19:53:04');
INSERT INTO `eb_system_attachment` VALUES (279, 'c4cb884d2f3b44b1b5b771453e52dcc130ozbmrkpy.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/24/c84b324b088641c7988c3197891bbf1ezu3ql5e1w0.png', 'crmebimage/operation/2021/02/24/c84b324b088641c7988c3197891bbf1ezu3ql5e1w0.png', '3626', 'png', 0, 1, '2021-02-24 21:34:06', '2021-02-24 21:34:06');
INSERT INTO `eb_system_attachment` VALUES (280, '6bdc377cfeaabd07d91b9d017825b1db.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/maintain/2021/02/25/e45bb464369f485ca8775b0349befdc2pkvtzg8xlc.png', 'crmebimage/maintain/2021/02/25/e45bb464369f485ca8775b0349befdc2pkvtzg8xlc.png', '8069', 'png', 0, 1, '2021-02-25 09:58:51', '2021-02-25 09:58:51');
INSERT INTO `eb_system_attachment` VALUES (281, 'crmeb.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/25/1044da7cb6544c978f9c95fde324cbb4zxg8iby21b.png', 'crmebimage/operation/2021/02/25/1044da7cb6544c978f9c95fde324cbb4zxg8iby21b.png', '17362', 'png', 541, 1, '2021-02-25 10:29:20', '2021-02-25 10:29:20');
INSERT INTO `eb_system_attachment` VALUES (283, 'WechatIMG126.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/maintain/2021/02/25/b81d29a8e5144b628652fdc85c8fc191lm9qw1vfn4.jpeg', 'crmebimage/maintain/2021/02/25/b81d29a8e5144b628652fdc85c8fc191lm9qw1vfn4.jpeg', '80741', 'jpeg', 0, 1, '2021-02-25 10:33:06', '2021-02-25 10:33:06');
INSERT INTO `eb_system_attachment` VALUES (284, 'QQ截圖20201204150959.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/5421e26982de4d29972af9ff1855cbeal1xwf3fwbh.png', 'crmebimage/user/2021/02/25/5421e26982de4d29972af9ff1855cbeal1xwf3fwbh.png', '604837', 'png', 7, 1, '2021-02-25 11:01:53', '2021-02-25 11:01:53');
INSERT INTO `eb_system_attachment` VALUES (285, 'QQ截圖20201204150959.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/eb640c0fd5724197bf218d2d5e56c5a4f9hsz9dy2m.png', 'crmebimage/user/2021/02/25/eb640c0fd5724197bf218d2d5e56c5a4f9hsz9dy2m.png', '604837', 'png', 7, 1, '2021-02-25 11:02:09', '2021-02-25 11:02:09');
INSERT INTO `eb_system_attachment` VALUES (286, '0c4b29a624e97cb26ff7e4ca473b4c5f.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/6f12af3aba2649a8acea5fa4aeb8b009pdwoqmvfxi.jpg', 'crmebimage/user/2021/02/25/6f12af3aba2649a8acea5fa4aeb8b009pdwoqmvfxi.jpg', '34003', 'jpeg', 0, 1, '2021-02-25 11:57:35', '2021-02-25 11:57:35');
INSERT INTO `eb_system_attachment` VALUES (287, 'fbacd351e606f494431a9c777ce7522c.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/1d923c7a21ff4518aaf8b16d05636cbfsi9lk65ps8.png', 'crmebimage/user/2021/02/25/1d923c7a21ff4518aaf8b16d05636cbfsi9lk65ps8.png', '3629', 'png', 0, 1, '2021-02-25 11:57:58', '2021-02-25 11:57:58');
INSERT INTO `eb_system_attachment` VALUES (288, 'f834709c81367d94f5fb67d82a7d34bd.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/b5c6c0ebbf0144e098c4e3c2c24325fbsc59uvpzvj.png', 'crmebimage/user/2021/02/25/b5c6c0ebbf0144e098c4e3c2c24325fbsc59uvpzvj.png', '4248', 'png', 0, 1, '2021-02-25 12:05:01', '2021-02-25 12:05:01');
INSERT INTO `eb_system_attachment` VALUES (289, 'e3d227d703e847a02655132f223436f8.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/ec79d7ad3d9f4c228895b8319af6346fppxqtnoehi.png', 'crmebimage/user/2021/02/25/ec79d7ad3d9f4c228895b8319af6346fppxqtnoehi.png', '3894', 'png', 0, 1, '2021-02-25 12:05:27', '2021-02-25 12:05:27');
INSERT INTO `eb_system_attachment` VALUES (290, '7adae9b31744480adf98a5c28a4ea095.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/ec5938108678432ca8228909b29b02c3ragcx0lo28.png', 'crmebimage/user/2021/02/25/ec5938108678432ca8228909b29b02c3ragcx0lo28.png', '4699', 'png', 0, 1, '2021-02-25 12:06:10', '2021-02-25 12:06:10');
INSERT INTO `eb_system_attachment` VALUES (291, '58908a8c245f422da6e0924dec27c95d.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/02/25/8eb3fddbd8c84ac09269d4c3058c28f9d93m5jrafz.png', 'crmebimage/user/2021/02/25/8eb3fddbd8c84ac09269d4c3058c28f9d93m5jrafz.png', '5110', 'png', 0, 1, '2021-02-25 12:06:41', '2021-02-25 12:06:41');
INSERT INTO `eb_system_attachment` VALUES (292, 'f.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/25/7aa0a3fe4b26440f8c10a5a27ec55502u39xni4dsr.png', 'crmebimage/operation/2021/02/25/7aa0a3fe4b26440f8c10a5a27ec55502u39xni4dsr.png', '2251', 'png', 0, 1, '2021-02-25 14:18:53', '2021-02-25 14:18:53');
INSERT INTO `eb_system_attachment` VALUES (293, '微信收款碼.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/02/25/bf74edf7106544f1a7893a2796ce4260uaeyzinl3h.png', 'crmebimage/operation/2021/02/25/bf74edf7106544f1a7893a2796ce4260uaeyzinl3h.png', '58674', 'png', 0, 1, '2021-02-25 14:19:53', '2021-02-25 14:19:53');
INSERT INTO `eb_system_attachment` VALUES (294, 'QQ截圖20201204150959.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/03/10/c988c28c65f84214b0f70347a06f9ba2xuj2w6u1ae.png', 'crmebimage/content/2021/03/10/c988c28c65f84214b0f70347a06f9ba2xuj2w6u1ae.png', '604837', 'png', 0, 1, '2021-03-10 09:42:56', '2021-03-10 09:42:56');
INSERT INTO `eb_system_attachment` VALUES (295, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/c54de640dd324f13b55f6309254abda944zs5ixmy8.jpg', 'crmebimage/product/2021/03/10/c54de640dd324f13b55f6309254abda944zs5ixmy8.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:36:34', '2021-03-10 11:36:34');
INSERT INTO `eb_system_attachment` VALUES (296, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/cb6fed83427b49a78ca5e4add16f59739sxue9c4yg.jpg', 'crmebimage/product/2021/03/10/cb6fed83427b49a78ca5e4add16f59739sxue9c4yg.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:36:38', '2021-03-10 11:36:38');
INSERT INTO `eb_system_attachment` VALUES (297, 'Screenshot_20210308_160007_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/ee6939f4b91e4725bc977c19691f06beqobz6we5pw.jpg', 'crmebimage/product/2021/03/10/ee6939f4b91e4725bc977c19691f06beqobz6we5pw.jpg', '105260', 'jpeg', 1, 1, '2021-03-10 11:36:43', '2021-03-10 11:36:43');
INSERT INTO `eb_system_attachment` VALUES (298, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/396e366f43304d8ea2c27e7a1226f962aujso83myi.jpg', 'crmebimage/product/2021/03/10/396e366f43304d8ea2c27e7a1226f962aujso83myi.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:36:49', '2021-03-10 11:36:49');
INSERT INTO `eb_system_attachment` VALUES (299, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/4981e93d76ec43cea0641edf6a5de5e9f40iza6sax.jpg', 'crmebimage/product/2021/03/10/4981e93d76ec43cea0641edf6a5de5e9f40iza6sax.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:36:53', '2021-03-10 11:36:53');
INSERT INTO `eb_system_attachment` VALUES (300, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/f128dba7713c4d30bfb2c8586d53fa19mfuzvqgm1n.jpg', 'crmebimage/product/2021/03/10/f128dba7713c4d30bfb2c8586d53fa19mfuzvqgm1n.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:36:56', '2021-03-10 11:36:56');
INSERT INTO `eb_system_attachment` VALUES (301, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/1f5fa0f52ad34c8b9d1bee0e974f11d761lfi8dukm.jpg', 'crmebimage/product/2021/03/10/1f5fa0f52ad34c8b9d1bee0e974f11d761lfi8dukm.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:36:59', '2021-03-10 11:36:59');
INSERT INTO `eb_system_attachment` VALUES (302, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/504c60ab78ab4b729589280d4ceeae585l6pnr21e8.jpg', 'crmebimage/product/2021/03/10/504c60ab78ab4b729589280d4ceeae585l6pnr21e8.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:37:02', '2021-03-10 11:37:02');
INSERT INTO `eb_system_attachment` VALUES (303, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/c958221c4eca4b13850eee28db32f349gfahzjxt58.jpg', 'crmebimage/product/2021/03/10/c958221c4eca4b13850eee28db32f349gfahzjxt58.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:37:13', '2021-03-10 11:37:13');
INSERT INTO `eb_system_attachment` VALUES (304, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/b259e0afd9f049f6841452a18006c720fnpgm2gt1d.jpg', 'crmebimage/product/2021/03/10/b259e0afd9f049f6841452a18006c720fnpgm2gt1d.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:48:42', '2021-03-10 11:48:42');
INSERT INTO `eb_system_attachment` VALUES (305, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/3adf64eb8efb430492eabf226683d7ectqtx3ps50x.jpg', 'crmebimage/product/2021/03/10/3adf64eb8efb430492eabf226683d7ectqtx3ps50x.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:48:45', '2021-03-10 11:48:45');
INSERT INTO `eb_system_attachment` VALUES (306, 'Screenshot_20210308_160007_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/fd26d6979463453a8493f6cc7733597bjrbx8146zz.jpg', 'crmebimage/product/2021/03/10/fd26d6979463453a8493f6cc7733597bjrbx8146zz.jpg', '105260', 'jpeg', 1, 1, '2021-03-10 11:48:49', '2021-03-10 11:48:49');
INSERT INTO `eb_system_attachment` VALUES (307, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/f0287f08d21a4261a33775598d69fd07nnp3fvojvz.jpg', 'crmebimage/product/2021/03/10/f0287f08d21a4261a33775598d69fd07nnp3fvojvz.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:48:53', '2021-03-10 11:48:53');
INSERT INTO `eb_system_attachment` VALUES (308, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/eda71f806b41488784cd65e01937d1c0mi3a6sfzxr.jpg', 'crmebimage/product/2021/03/10/eda71f806b41488784cd65e01937d1c0mi3a6sfzxr.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:48:56', '2021-03-10 11:48:56');
INSERT INTO `eb_system_attachment` VALUES (309, 'Screenshot_20210308_160007_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/7d2d40682431450685a178957f88f787wx1bu245iw.jpg', 'crmebimage/product/2021/03/10/7d2d40682431450685a178957f88f787wx1bu245iw.jpg', '105260', 'jpeg', 1, 1, '2021-03-10 11:49:00', '2021-03-10 11:49:00');
INSERT INTO `eb_system_attachment` VALUES (310, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/77f62ff437fc45bba125ebd479560e4apej6388nf2.jpg', 'crmebimage/product/2021/03/10/77f62ff437fc45bba125ebd479560e4apej6388nf2.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:49:04', '2021-03-10 11:49:04');
INSERT INTO `eb_system_attachment` VALUES (311, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/52b8c283b7cc46fb9aaf0e8a56556bf7p1gfrht4a9.jpg', 'crmebimage/product/2021/03/10/52b8c283b7cc46fb9aaf0e8a56556bf7p1gfrht4a9.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:49:07', '2021-03-10 11:49:07');
INSERT INTO `eb_system_attachment` VALUES (312, 'Screenshot_20210310_115036_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/5ace19ec4a604863a2ae9742c7ae1e81v53n3gdmwn.jpg', 'crmebimage/product/2021/03/10/5ace19ec4a604863a2ae9742c7ae1e81v53n3gdmwn.jpg', '576365', 'jpeg', 1, 1, '2021-03-10 11:51:44', '2021-03-10 11:51:44');
INSERT INTO `eb_system_attachment` VALUES (313, 'Screenshot_20210310_114927_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/684af04b28a84cd4b2ae01adf10e913bal7m7mpmly.jpg', 'crmebimage/product/2021/03/10/684af04b28a84cd4b2ae01adf10e913bal7m7mpmly.jpg', '427735', 'jpeg', 1, 1, '2021-03-10 11:51:48', '2021-03-10 11:51:48');
INSERT INTO `eb_system_attachment` VALUES (314, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/240e2af402964abfbacb4b6b8b915358s574bkz6sd.jpg', 'crmebimage/product/2021/03/10/240e2af402964abfbacb4b6b8b915358s574bkz6sd.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:51:52', '2021-03-10 11:51:52');
INSERT INTO `eb_system_attachment` VALUES (315, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/057c482b9a0949a3bccbfd9fffd74475t873drfffe.jpg', 'crmebimage/product/2021/03/10/057c482b9a0949a3bccbfd9fffd74475t873drfffe.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 11:51:56', '2021-03-10 11:51:56');
INSERT INTO `eb_system_attachment` VALUES (316, 'Screenshot_20210310_115036_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/b14b61ada5c94922bd40db21fad7d97dkmto7ppyx2.jpg', 'crmebimage/product/2021/03/10/b14b61ada5c94922bd40db21fad7d97dkmto7ppyx2.jpg', '576365', 'jpeg', 1, 1, '2021-03-10 11:51:59', '2021-03-10 11:51:59');
INSERT INTO `eb_system_attachment` VALUES (317, 'Screenshot_20210310_114927_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/805e8aa95fce4bc18ba936e2dd4a76a2uup8353i2j.jpg', 'crmebimage/product/2021/03/10/805e8aa95fce4bc18ba936e2dd4a76a2uup8353i2j.jpg', '427735', 'jpeg', 1, 1, '2021-03-10 11:52:02', '2021-03-10 11:52:02');
INSERT INTO `eb_system_attachment` VALUES (318, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/4b2fa3b78871454cb22108836c2f159640xxedzs7z.jpg', 'crmebimage/product/2021/03/10/4b2fa3b78871454cb22108836c2f159640xxedzs7z.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:52:06', '2021-03-10 11:52:06');
INSERT INTO `eb_system_attachment` VALUES (319, 'Screenshot_20210310_114927_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/20b757c79956484cba76b4d06f838cf31evj9l5guu.jpg', 'crmebimage/product/2021/03/10/20b757c79956484cba76b4d06f838cf31evj9l5guu.jpg', '427735', 'jpeg', 1, 1, '2021-03-10 11:52:09', '2021-03-10 11:52:09');
INSERT INTO `eb_system_attachment` VALUES (320, 'Screenshot_20210310_114927_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/684c8a1f2e994f23a5a83ecf7fd5f12f0qjl2yb8ck.jpg', 'crmebimage/product/2021/03/10/684c8a1f2e994f23a5a83ecf7fd5f12f0qjl2yb8ck.jpg', '427735', 'jpeg', 1, 1, '2021-03-10 11:52:17', '2021-03-10 11:52:17');
INSERT INTO `eb_system_attachment` VALUES (321, 'Screenshot_20210310_091029_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/42c00a6cd923450a9bc468523afb19fawetel8v7cc.jpg', 'crmebimage/product/2021/03/10/42c00a6cd923450a9bc468523afb19fawetel8v7cc.jpg', '411756', 'jpeg', 1, 1, '2021-03-10 11:52:21', '2021-03-10 11:52:21');
INSERT INTO `eb_system_attachment` VALUES (322, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/4663b226f1a54540a81b5c1f40173b3493nxbd6f3o.jpg', 'crmebimage/product/2021/03/10/4663b226f1a54540a81b5c1f40173b3493nxbd6f3o.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 11:52:25', '2021-03-10 11:52:25');
INSERT INTO `eb_system_attachment` VALUES (323, 'Screenshot_20210310_115036_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/5d1879426d684daea70b480b3ecf7b298vtgzus3hd.jpg', 'crmebimage/product/2021/03/10/5d1879426d684daea70b480b3ecf7b298vtgzus3hd.jpg', '576365', 'jpeg', 1, 1, '2021-03-10 15:23:54', '2021-03-10 15:23:54');
INSERT INTO `eb_system_attachment` VALUES (324, 'Screenshot_20210310_114927_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/6737d6e2112e4998ad15f5519fc94bd3lhsx891flc.jpg', 'crmebimage/product/2021/03/10/6737d6e2112e4998ad15f5519fc94bd3lhsx891flc.jpg', '427735', 'jpeg', 1, 1, '2021-03-10 15:23:57', '2021-03-10 15:23:57');
INSERT INTO `eb_system_attachment` VALUES (325, 'Screenshot_20210310_112909_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/9e376df63de5458dab2e5e2a8d46ee6eggkum3argg.jpg', 'crmebimage/product/2021/03/10/9e376df63de5458dab2e5e2a8d46ee6eggkum3argg.jpg', '346024', 'jpeg', 1, 1, '2021-03-10 15:24:00', '2021-03-10 15:24:00');
INSERT INTO `eb_system_attachment` VALUES (326, 'Screenshot_20210310_105547_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/10/5b9229bf82f54735a5c495f35a5d8db09fx30t92g4.jpg', 'crmebimage/product/2021/03/10/5b9229bf82f54735a5c495f35a5d8db09fx30t92g4.jpg', '498563', 'jpeg', 1, 1, '2021-03-10 15:24:04', '2021-03-10 15:24:04');
INSERT INTO `eb_system_attachment` VALUES (327, '67122170b3a31e0a.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/store/2021/03/11/5c10e486679d4d6d9fb7f20db15883223zl8pwc117.png', 'crmebimage/store/2021/03/11/5c10e486679d4d6d9fb7f20db15883223zl8pwc117.png', '233746', 'png', 0, 1, '2021-03-11 12:26:30', '2021-03-11 12:26:30');
INSERT INTO `eb_system_attachment` VALUES (328, '微信圖片_20210303182341.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/03/11/aec3fa817873484dbe9179afa51f9855kzma9srjlq.png', 'crmebimage/content/2021/03/11/aec3fa817873484dbe9179afa51f9855kzma9srjlq.png', '340123', 'png', 0, 1, '2021-03-11 14:16:27', '2021-03-11 14:16:27');
INSERT INTO `eb_system_attachment` VALUES (329, '1607498682(1).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/75a70b31d9e9482b923d4e4a39a24f37q55zbl3199.jpg', 'crmebimage/product/2021/03/12/75a70b31d9e9482b923d4e4a39a24f37q55zbl3199.jpg', '18860', 'jpeg', 1, 1, '2021-03-12 17:16:33', '2021-03-12 17:16:33');
INSERT INTO `eb_system_attachment` VALUES (330, 'img.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/dd32cfcefbcf407080ad62afd193b5fcj9agoynylh.jpg', 'crmebimage/product/2021/03/12/dd32cfcefbcf407080ad62afd193b5fcj9agoynylh.jpg', '56665', 'jpeg', 1, 1, '2021-03-12 17:16:40', '2021-03-12 17:16:40');
INSERT INTO `eb_system_attachment` VALUES (331, '微信圖片_20201124152134.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/dd25f69e4cc94551a72992047141c67fz8e88u41lg.png', 'crmebimage/product/2021/03/12/dd25f69e4cc94551a72992047141c67fz8e88u41lg.png', '28524', 'png', 1, 1, '2021-03-12 17:16:47', '2021-03-12 17:16:47');
INSERT INTO `eb_system_attachment` VALUES (332, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/cfd8b474b4ba4ffbb832c7dd7d040f3avs3jgl094e.png', 'crmebimage/product/2021/03/12/cfd8b474b4ba4ffbb832c7dd7d040f3avs3jgl094e.png', '2480', 'png', 1, 1, '2021-03-12 17:17:14', '2021-03-12 17:17:14');
INSERT INTO `eb_system_attachment` VALUES (333, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/1ebf3ac187a04ae09af4f498dacc0801dluusr11jy.png', 'crmebimage/product/2021/03/12/1ebf3ac187a04ae09af4f498dacc0801dluusr11jy.png', '2480', 'png', 1, 1, '2021-03-12 17:17:18', '2021-03-12 17:17:18');
INSERT INTO `eb_system_attachment` VALUES (334, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/c1ee9152cc0e42de91824e96c79d7176f1nyknxyka.png', 'crmebimage/product/2021/03/12/c1ee9152cc0e42de91824e96c79d7176f1nyknxyka.png', '2717', 'png', 1, 1, '2021-03-12 17:17:21', '2021-03-12 17:17:21');
INSERT INTO `eb_system_attachment` VALUES (335, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/b47b58a839eb409b8b304c58468b1bf83ti4dliufe.png', 'crmebimage/product/2021/03/12/b47b58a839eb409b8b304c58468b1bf83ti4dliufe.png', '2230', 'png', 1, 1, '2021-03-12 17:17:25', '2021-03-12 17:17:25');
INSERT INTO `eb_system_attachment` VALUES (336, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/0d1365b46a26411eac3157a1fd416006vw0u690yqj.png', 'crmebimage/product/2021/03/12/0d1365b46a26411eac3157a1fd416006vw0u690yqj.png', '2193', 'png', 1, 1, '2021-03-12 17:17:28', '2021-03-12 17:17:28');
INSERT INTO `eb_system_attachment` VALUES (337, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/63a50c168e924e81b2a79d0189d6808bn7ccp6bty9.png', 'crmebimage/product/2021/03/12/63a50c168e924e81b2a79d0189d6808bn7ccp6bty9.png', '2359', 'png', 1, 1, '2021-03-12 17:23:07', '2021-03-12 17:23:07');
INSERT INTO `eb_system_attachment` VALUES (338, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/6fd2f83d768445aabfc3f0e807f89324hpvkq3c8hd.png', 'crmebimage/product/2021/03/12/6fd2f83d768445aabfc3f0e807f89324hpvkq3c8hd.png', '2717', 'png', 1, 1, '2021-03-12 17:23:11', '2021-03-12 17:23:11');
INSERT INTO `eb_system_attachment` VALUES (339, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/12bdc002e09e465cbde9564cef6ec13ewn1sai43f5.png', 'crmebimage/product/2021/03/12/12bdc002e09e465cbde9564cef6ec13ewn1sai43f5.png', '2230', 'png', 1, 1, '2021-03-12 17:23:16', '2021-03-12 17:23:16');
INSERT INTO `eb_system_attachment` VALUES (340, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/55fb552cfd5e4a3fb4fd92853da608a7l76qfh8j3v.png', 'crmebimage/product/2021/03/12/55fb552cfd5e4a3fb4fd92853da608a7l76qfh8j3v.png', '2193', 'png', 1, 1, '2021-03-12 17:23:19', '2021-03-12 17:23:19');
INSERT INTO `eb_system_attachment` VALUES (341, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/02565b65387e44818e711ab2eab57e4djd3hp0dkny.png', 'crmebimage/product/2021/03/12/02565b65387e44818e711ab2eab57e4djd3hp0dkny.png', '2717', 'png', 1, 1, '2021-03-12 17:23:35', '2021-03-12 17:23:35');
INSERT INTO `eb_system_attachment` VALUES (342, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/18d57588833342739acc8477d4781394mh5kc78txu.png', 'crmebimage/product/2021/03/12/18d57588833342739acc8477d4781394mh5kc78txu.png', '2480', 'png', 1, 1, '2021-03-12 17:23:39', '2021-03-12 17:23:39');
INSERT INTO `eb_system_attachment` VALUES (343, '2-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/501576fd6fa54585b22f0be522753beet6bsk01hiv.png', 'crmebimage/product/2021/03/12/501576fd6fa54585b22f0be522753beet6bsk01hiv.png', '2561', 'png', 1, 1, '2021-03-12 17:23:43', '2021-03-12 17:23:43');
INSERT INTO `eb_system_attachment` VALUES (344, '3-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/7d1cf5400b8449f7866bb53e08783171uhhz4i80cl.png', 'crmebimage/product/2021/03/12/7d1cf5400b8449f7866bb53e08783171uhhz4i80cl.png', '2397', 'png', 1, 1, '2021-03-12 17:23:46', '2021-03-12 17:23:46');
INSERT INTO `eb_system_attachment` VALUES (345, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/bb14d4e70ca2407b9ec2d4bd57117a9avy2af4hue7.png', 'crmebimage/product/2021/03/12/bb14d4e70ca2407b9ec2d4bd57117a9avy2af4hue7.png', '2193', 'png', 1, 1, '2021-03-12 17:23:51', '2021-03-12 17:23:51');
INSERT INTO `eb_system_attachment` VALUES (346, '4-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/51ae6eb8e2d94d1db6ee32a19c96a685qg5abbs6bk.png', 'crmebimage/product/2021/03/12/51ae6eb8e2d94d1db6ee32a19c96a685qg5abbs6bk.png', '2309', 'png', 1, 1, '2021-03-12 17:23:55', '2021-03-12 17:23:55');
INSERT INTO `eb_system_attachment` VALUES (347, '3-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/90089043580f472c90537d5c5518c078sx64xgl949.png', 'crmebimage/product/2021/03/12/90089043580f472c90537d5c5518c078sx64xgl949.png', '2397', 'png', 1, 1, '2021-03-12 17:24:00', '2021-03-12 17:24:00');
INSERT INTO `eb_system_attachment` VALUES (348, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/64748ea5d53549949ffe54519c7ee144blbhpuesn5.png', 'crmebimage/product/2021/03/12/64748ea5d53549949ffe54519c7ee144blbhpuesn5.png', '2230', 'png', 1, 1, '2021-03-12 17:24:05', '2021-03-12 17:24:05');
INSERT INTO `eb_system_attachment` VALUES (349, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/d5f65b52cdd54543bab85a3ea5ab2cd2aqstvq557z.png', 'crmebimage/product/2021/03/12/d5f65b52cdd54543bab85a3ea5ab2cd2aqstvq557z.png', '2359', 'png', 1, 1, '2021-03-12 17:24:42', '2021-03-12 17:24:42');
INSERT INTO `eb_system_attachment` VALUES (350, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/8232c0bdf4b044d88dcfa558809af33174e05oz2cu.png', 'crmebimage/product/2021/03/12/8232c0bdf4b044d88dcfa558809af33174e05oz2cu.png', '2717', 'png', 1, 1, '2021-03-12 17:24:45', '2021-03-12 17:24:45');
INSERT INTO `eb_system_attachment` VALUES (351, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/b78fe94e26bb4ceab4def716b5d7fffbbhvky49f4x.png', 'crmebimage/product/2021/03/12/b78fe94e26bb4ceab4def716b5d7fffbbhvky49f4x.png', '2480', 'png', 1, 1, '2021-03-12 17:24:49', '2021-03-12 17:24:49');
INSERT INTO `eb_system_attachment` VALUES (352, '2-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/33361f9574d64dd594a90a235919494dx5e6zj36j2.png', 'crmebimage/product/2021/03/12/33361f9574d64dd594a90a235919494dx5e6zj36j2.png', '2561', 'png', 1, 1, '2021-03-12 17:24:53', '2021-03-12 17:24:53');
INSERT INTO `eb_system_attachment` VALUES (353, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/aa5d0effadc94d3b87b8eeca4c7440b1hss32pb7fp.png', 'crmebimage/product/2021/03/12/aa5d0effadc94d3b87b8eeca4c7440b1hss32pb7fp.png', '2359', 'png', 1, 1, '2021-03-12 17:24:59', '2021-03-12 17:24:59');
INSERT INTO `eb_system_attachment` VALUES (354, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/f19d251c62de412b979bd16688fb2ef0or73gxozp9.png', 'crmebimage/product/2021/03/12/f19d251c62de412b979bd16688fb2ef0or73gxozp9.png', '2717', 'png', 1, 1, '2021-03-12 17:25:03', '2021-03-12 17:25:03');
INSERT INTO `eb_system_attachment` VALUES (355, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/5f25ce26156e4675b5b37f9ce47627cbqmy5dzygck.png', 'crmebimage/product/2021/03/12/5f25ce26156e4675b5b37f9ce47627cbqmy5dzygck.png', '2230', 'png', 1, 1, '2021-03-12 17:25:08', '2021-03-12 17:25:08');
INSERT INTO `eb_system_attachment` VALUES (356, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/328143e5ee2f40e3aa5f6fcbdad1674byak8rt6s1z.png', 'crmebimage/product/2021/03/12/328143e5ee2f40e3aa5f6fcbdad1674byak8rt6s1z.png', '2193', 'png', 1, 1, '2021-03-12 17:25:13', '2021-03-12 17:25:13');
INSERT INTO `eb_system_attachment` VALUES (357, '2-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/2a0947e15a344388888dfae6d858d6f22io46jtxyq.png', 'crmebimage/product/2021/03/12/2a0947e15a344388888dfae6d858d6f22io46jtxyq.png', '2561', 'png', 1, 1, '2021-03-12 17:25:20', '2021-03-12 17:25:20');
INSERT INTO `eb_system_attachment` VALUES (358, '4-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/86c51efa788b494f85b8e1d3249dfd96amgi0fz7hn.png', 'crmebimage/product/2021/03/12/86c51efa788b494f85b8e1d3249dfd96amgi0fz7hn.png', '2309', 'png', 1, 1, '2021-03-12 17:25:27', '2021-03-12 17:25:27');
INSERT INTO `eb_system_attachment` VALUES (359, 'close.gif', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/6ceffde31ec24178bc1fde205e9a1615q1ppyr852w.gif', 'crmebimage/product/2021/03/12/6ceffde31ec24178bc1fde205e9a1615q1ppyr852w.gif', '18292', 'gif', 1, 1, '2021-03-12 17:25:32', '2021-03-12 17:25:32');
INSERT INTO `eb_system_attachment` VALUES (360, 'address.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/14c355e376b848eea3d03f2796559a521b0dgs4s1u.png', 'crmebimage/product/2021/03/12/14c355e376b848eea3d03f2796559a521b0dgs4s1u.png', '2120', 'png', 1, 1, '2021-03-12 17:25:38', '2021-03-12 17:25:38');
INSERT INTO `eb_system_attachment` VALUES (361, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/93319d3eb70e4643b6431f5d0d53bc0fel2haoxo8h.png', 'crmebimage/product/2021/03/12/93319d3eb70e4643b6431f5d0d53bc0fel2haoxo8h.png', '2359', 'png', 1, 1, '2021-03-12 17:29:00', '2021-03-12 17:29:00');
INSERT INTO `eb_system_attachment` VALUES (362, '1-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/57c82174113840cea7837ea202329aaaz8h4dbuawv.png', 'crmebimage/product/2021/03/12/57c82174113840cea7837ea202329aaaz8h4dbuawv.png', '2717', 'png', 1, 1, '2021-03-12 17:29:04', '2021-03-12 17:29:04');
INSERT INTO `eb_system_attachment` VALUES (363, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/0ea4e124ffe2460baf8b01f0537f257f8lxs9mfqat.png', 'crmebimage/product/2021/03/12/0ea4e124ffe2460baf8b01f0537f257f8lxs9mfqat.png', '2480', 'png', 1, 1, '2021-03-12 17:29:08', '2021-03-12 17:29:08');
INSERT INTO `eb_system_attachment` VALUES (364, '2-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/46cb1ce42dc649bab43c42c6b48cef448dl5dzg5gf.png', 'crmebimage/product/2021/03/12/46cb1ce42dc649bab43c42c6b48cef448dl5dzg5gf.png', '2561', 'png', 1, 1, '2021-03-12 17:29:12', '2021-03-12 17:29:12');
INSERT INTO `eb_system_attachment` VALUES (365, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/24555df2855e4695b452e11247dac8443ikc2eanyr.png', 'crmebimage/product/2021/03/12/24555df2855e4695b452e11247dac8443ikc2eanyr.png', '2230', 'png', 1, 1, '2021-03-12 17:29:15', '2021-03-12 17:29:15');
INSERT INTO `eb_system_attachment` VALUES (366, '3-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/28c1cac264c14dd99bbb6298c523dc09sdypsrql5z.png', 'crmebimage/product/2021/03/12/28c1cac264c14dd99bbb6298c523dc09sdypsrql5z.png', '2397', 'png', 1, 1, '2021-03-12 17:29:18', '2021-03-12 17:29:18');
INSERT INTO `eb_system_attachment` VALUES (367, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/87bf00bdfa964243b56c506a927d9984jbh3sko5w5.png', 'crmebimage/product/2021/03/12/87bf00bdfa964243b56c506a927d9984jbh3sko5w5.png', '2193', 'png', 1, 1, '2021-03-12 17:29:21', '2021-03-12 17:29:21');
INSERT INTO `eb_system_attachment` VALUES (368, 'close.gif', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/b745f5208d2d4111aa320e176826c99a65yz29xtsv.gif', 'crmebimage/product/2021/03/12/b745f5208d2d4111aa320e176826c99a65yz29xtsv.gif', '18292', 'gif', 1, 1, '2021-03-12 17:29:26', '2021-03-12 17:29:26');
INSERT INTO `eb_system_attachment` VALUES (369, '4-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/954a3f77fba0444388d111a511cfc19ebnm0b119fw.png', 'crmebimage/product/2021/03/12/954a3f77fba0444388d111a511cfc19ebnm0b119fw.png', '2309', 'png', 1, 1, '2021-03-12 17:29:31', '2021-03-12 17:29:31');
INSERT INTO `eb_system_attachment` VALUES (370, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/a3b26d091d724a6688e76405c98b2ea1rhk1pnxw6x.png', 'crmebimage/product/2021/03/12/a3b26d091d724a6688e76405c98b2ea1rhk1pnxw6x.png', '2359', 'png', 1, 1, '2021-03-12 17:30:21', '2021-03-12 17:30:21');
INSERT INTO `eb_system_attachment` VALUES (371, 'close.gif', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/0d8368d408c845be88b994af97750fb80qx6u2ds0j.gif', 'crmebimage/product/2021/03/12/0d8368d408c845be88b994af97750fb80qx6u2ds0j.gif', '18292', 'gif', 1, 1, '2021-03-12 17:30:24', '2021-03-12 17:30:24');
INSERT INTO `eb_system_attachment` VALUES (372, '1-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/9173fbbc252c434eaed36edd82c89af73unb5jl071.png', 'crmebimage/product/2021/03/12/9173fbbc252c434eaed36edd82c89af73unb5jl071.png', '2359', 'png', 1, 1, '2021-03-12 17:30:29', '2021-03-12 17:30:29');
INSERT INTO `eb_system_attachment` VALUES (373, '2-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/79a99b028b83430ab537af1f4cdbd123fs84kd3uj0.png', 'crmebimage/product/2021/03/12/79a99b028b83430ab537af1f4cdbd123fs84kd3uj0.png', '2480', 'png', 1, 1, '2021-03-12 17:30:33', '2021-03-12 17:30:33');
INSERT INTO `eb_system_attachment` VALUES (374, '3-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/40ae6f6ec04c4dc9bc3a657d697bb0e3l9xb2wk404.png', 'crmebimage/product/2021/03/12/40ae6f6ec04c4dc9bc3a657d697bb0e3l9xb2wk404.png', '2230', 'png', 1, 1, '2021-03-12 17:30:37', '2021-03-12 17:30:37');
INSERT INTO `eb_system_attachment` VALUES (375, '2-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/38682dd2e9ec444486c13ce71eac4468n45lxouj9w.png', 'crmebimage/product/2021/03/12/38682dd2e9ec444486c13ce71eac4468n45lxouj9w.png', '2561', 'png', 1, 1, '2021-03-12 17:30:41', '2021-03-12 17:30:41');
INSERT INTO `eb_system_attachment` VALUES (376, '4-001.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/324921b23aac43bb82184d62af077593duupdyhzqt.png', 'crmebimage/product/2021/03/12/324921b23aac43bb82184d62af077593duupdyhzqt.png', '2193', 'png', 1, 1, '2021-03-12 17:30:44', '2021-03-12 17:30:44');
INSERT INTO `eb_system_attachment` VALUES (377, '4-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/817526ae0b3443efa6cf306390abb4adef4ezt2ktl.png', 'crmebimage/product/2021/03/12/817526ae0b3443efa6cf306390abb4adef4ezt2ktl.png', '2309', 'png', 1, 1, '2021-03-12 17:30:48', '2021-03-12 17:30:48');
INSERT INTO `eb_system_attachment` VALUES (378, '3-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/777e1f74e7544b8e8681666fdd39dc56w8h1e7b4hg.png', 'crmebimage/product/2021/03/12/777e1f74e7544b8e8681666fdd39dc56w8h1e7b4hg.png', '2397', 'png', 1, 1, '2021-03-12 17:30:52', '2021-03-12 17:30:52');
INSERT INTO `eb_system_attachment` VALUES (379, 'close.gif', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/9d08062170654368b71bde555af10d0cldyloavm6q.gif', 'crmebimage/product/2021/03/12/9d08062170654368b71bde555af10d0cldyloavm6q.gif', '18292', 'gif', 1, 1, '2021-03-12 17:30:56', '2021-03-12 17:30:56');
INSERT INTO `eb_system_attachment` VALUES (380, '3-002.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/12/00ae9012b0b748499e95d77006c3731b35anmmkc7l.png', 'crmebimage/product/2021/03/12/00ae9012b0b748499e95d77006c3731b35anmmkc7l.png', '2397', 'png', 1, 1, '2021-03-12 17:31:00', '2021-03-12 17:31:00');
INSERT INTO `eb_system_attachment` VALUES (381, '微信圖片_20210303182341.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/16/7691fc797e43421282688e819339415dc41ummcebx.png', 'crmebimage/user/2021/03/16/7691fc797e43421282688e819339415dc41ummcebx.png', '340123', 'png', 7, 1, '2021-03-16 09:57:02', '2021-03-16 09:57:02');
INSERT INTO `eb_system_attachment` VALUES (382, 'mmexport1614648147940.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/16/5ab568b10408454dbba64049790f7658li60vcpn80.jpg', 'crmebimage/user/2021/03/16/5ab568b10408454dbba64049790f7658li60vcpn80.jpg', '417238', 'jpeg', 7, 1, '2021-03-16 16:55:12', '2021-03-16 16:55:12');
INSERT INTO `eb_system_attachment` VALUES (383, 'mmexport1614648147940.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/9eb6464f134c49f0b89c9b99c0d79d2374k4i5jako.jpg', 'crmebimage/product/2021/03/16/9eb6464f134c49f0b89c9b99c0d79d2374k4i5jako.jpg', '417238', 'jpeg', 1, 1, '2021-03-16 16:55:39', '2021-03-16 16:55:39');
INSERT INTO `eb_system_attachment` VALUES (384, 'QQ截圖20201204142821.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/b76b718ecd68494b9eedf5db57abdff5w6aw7k9m5f.png', 'crmebimage/product/2021/03/16/b76b718ecd68494b9eedf5db57abdff5w6aw7k9m5f.png', '166625', 'png', 1, 1, '2021-03-16 17:09:56', '2021-03-16 17:09:56');
INSERT INTO `eb_system_attachment` VALUES (385, '1615887504122_photo_001.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/4c5aeb789b3f47e489832aa719a7bfb3xv1mcxw8ae.jpg', 'crmebimage/product/2021/03/16/4c5aeb789b3f47e489832aa719a7bfb3xv1mcxw8ae.jpg', '2265538', 'jpeg', 1, 1, '2021-03-16 17:38:27', '2021-03-16 17:38:27');
INSERT INTO `eb_system_attachment` VALUES (386, '1615887553960_1615887539-IMG_2014.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/a903e2d912a54786b8b3d67b3037375c1y1o4fdf96.jpg', 'crmebimage/product/2021/03/16/a903e2d912a54786b8b3d67b3037375c1y1o4fdf96.jpg', '756653', 'jpeg', 1, 1, '2021-03-16 17:39:15', '2021-03-16 17:39:15');
INSERT INTO `eb_system_attachment` VALUES (387, '1615887595575_1615887539-IMG_2014.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/171217628b754f68b0e6dfbae5401d4eepl2v30bcb.jpg', 'crmebimage/product/2021/03/16/171217628b754f68b0e6dfbae5401d4eepl2v30bcb.jpg', '756653', 'jpeg', 1, 1, '2021-03-16 17:39:57', '2021-03-16 17:39:57');
INSERT INTO `eb_system_attachment` VALUES (388, '1615887615989_photo_002.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/b3e2feb9fb98418ba5b0bfa19790499fc0o59vgr06.jpg', 'crmebimage/product/2021/03/16/b3e2feb9fb98418ba5b0bfa19790499fc0o59vgr06.jpg', '1053376', 'jpeg', 1, 1, '2021-03-16 17:40:17', '2021-03-16 17:40:17');
INSERT INTO `eb_system_attachment` VALUES (389, '1615889281103_1615887539-IMG_2014.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/3e3a31f9ddc148d5a9bc8f34e224e2d439x1kbjtjx.jpg', 'crmebimage/product/2021/03/16/3e3a31f9ddc148d5a9bc8f34e224e2d439x1kbjtjx.jpg', '756653', 'jpeg', 1, 1, '2021-03-16 18:08:02', '2021-03-16 18:08:02');
INSERT INTO `eb_system_attachment` VALUES (390, 'd2287b6148abe1fc59b475c4a486f38c.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/a56f0579b2dc4ddc808805493c4ce43dzecl0o222d.png', 'crmebimage/product/2021/03/16/a56f0579b2dc4ddc808805493c4ce43dzecl0o222d.png', '5110', 'png', 1, 1, '2021-03-16 18:13:10', '2021-03-16 18:13:10');
INSERT INTO `eb_system_attachment` VALUES (391, '601ff5cc109160c84632cf5bdf4af058.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/ab34c83ca6db4c1b8afbc38a2c20e2455d9h8tf3bp.png', 'crmebimage/product/2021/03/16/ab34c83ca6db4c1b8afbc38a2c20e2455d9h8tf3bp.png', '4248', 'png', 1, 1, '2021-03-16 18:13:13', '2021-03-16 18:13:13');
INSERT INTO `eb_system_attachment` VALUES (392, '7adae9b31744480adf98a5c28a4ea095.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/16/7208acfc508440d094a3f57c90f2c4c3nklq76zq01.png', 'crmebimage/product/2021/03/16/7208acfc508440d094a3f57c90f2c4c3nklq76zq01.png', '4699', 'png', 1, 1, '2021-03-16 18:13:17', '2021-03-16 18:13:17');
INSERT INTO `eb_system_attachment` VALUES (393, '1615951763819_photo_001.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/17/6edcdabe83a14f7d9b11b23b783e26ed9612h14oay.jpg', 'crmebimage/user/2021/03/17/6edcdabe83a14f7d9b11b23b783e26ed9612h14oay.jpg', '807512', 'jpeg', 7, 1, '2021-03-17 11:29:25', '2021-03-17 11:29:25');
INSERT INTO `eb_system_attachment` VALUES (394, '1615953729443_1615887539-IMG_2014.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/17/8d658e2d7d21497081778d84489e626fn9df2ppawt.jpg', 'crmebimage/user/2021/03/17/8d658e2d7d21497081778d84489e626fn9df2ppawt.jpg', '756653', 'jpeg', 1, 1, '2021-03-17 12:02:11', '2021-03-17 12:02:11');
INSERT INTO `eb_system_attachment` VALUES (395, '1615953737574_1615887539-IMG_2014.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/17/4196513c63b2435e84d5d24221917d2a25cpgtu5qm.jpg', 'crmebimage/user/2021/03/17/4196513c63b2435e84d5d24221917d2a25cpgtu5qm.jpg', '756653', 'jpeg', 1, 1, '2021-03-17 12:02:19', '2021-03-17 12:02:19');
INSERT INTO `eb_system_attachment` VALUES (396, 'Screenshot_20210317_111901_com.tencent.mm.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/24ee86a1020548efb1f23e57c8bc5d73zq6om1pkz0.jpg', 'crmebimage/product/2021/03/17/24ee86a1020548efb1f23e57c8bc5d73zq6om1pkz0.jpg', '248644', 'jpeg', 1, 1, '2021-03-17 15:15:24', '2021-03-17 15:15:24');
INSERT INTO `eb_system_attachment` VALUES (397, 'df297edf749242c7.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/03/17/e0e44920b4d446f5929598118d1add1fku2lsde6aa.jpg', 'crmebimage/content/2021/03/17/e0e44920b4d446f5929598118d1add1fku2lsde6aa.jpg', '30777', 'jpeg', 0, 1, '2021-03-17 15:20:16', '2021-03-17 15:20:16');
INSERT INTO `eb_system_attachment` VALUES (398, 'VIVO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/beea7797f1c447869dc702bf52b35edfkk9mfyp4me.jpg', 'crmebimage/product/2021/03/17/beea7797f1c447869dc702bf52b35edfkk9mfyp4me.jpg', '6528', 'jpeg', 1, 1, '2021-03-17 16:25:06', '2021-03-17 16:25:06');
INSERT INTO `eb_system_attachment` VALUES (399, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/24e22f32e8204acc97d13b881306482aqc5eb0pg9y.jpg', 'crmebimage/product/2021/03/17/24e22f32e8204acc97d13b881306482aqc5eb0pg9y.jpg', '6766', 'jpeg', 1, 1, '2021-03-17 16:25:10', '2021-03-17 16:25:10');
INSERT INTO `eb_system_attachment` VALUES (400, '酷派.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/f073c5102a5c4eedaba24264b11fccd4xdi01b0ifb.jpg', 'crmebimage/product/2021/03/17/f073c5102a5c4eedaba24264b11fccd4xdi01b0ifb.jpg', '7236', 'jpeg', 1, 1, '2021-03-17 16:25:13', '2021-03-17 16:25:13');
INSERT INTO `eb_system_attachment` VALUES (401, '16CA273D-896E-49F4-B258-5367AA336EB2.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/f4dee674527c47aa8e3eb91f10d407f320vcc2pmb7.jpeg', 'crmebimage/product/2021/03/17/f4dee674527c47aa8e3eb91f10d407f320vcc2pmb7.jpeg', '189104', 'jpeg', 1, 1, '2021-03-17 16:39:19', '2021-03-17 16:39:19');
INSERT INTO `eb_system_attachment` VALUES (402, '21629990-DD04-4A60-BF4A-5BB1E2DEF5AF.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/0b945394e7304c93a6f2b230417f1dcfp9858k4skh.jpeg', 'crmebimage/product/2021/03/17/0b945394e7304c93a6f2b230417f1dcfp9858k4skh.jpeg', '189104', 'jpeg', 1, 1, '2021-03-17 16:39:25', '2021-03-17 16:39:25');
INSERT INTO `eb_system_attachment` VALUES (403, '796A01E5-AC90-40A2-BE38-CBD3EFA2296C.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/17/7229c88f4c6649d49ac97334ddfaa7222br8tidua7.jpeg', 'crmebimage/product/2021/03/17/7229c88f4c6649d49ac97334ddfaa7222br8tidua7.jpeg', '189104', 'jpeg', 1, 1, '2021-03-17 16:39:31', '2021-03-17 16:39:31');
INSERT INTO `eb_system_attachment` VALUES (404, '1615973548360_IMG_20210314_190115.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/17/4f2bf4c274bb48f9a19b8aab0a90d6f52whmv6g75q.jpg', 'crmebimage/user/2021/03/17/4f2bf4c274bb48f9a19b8aab0a90d6f52whmv6g75q.jpg', '146164', 'jpeg', 1, 1, '2021-03-17 17:32:33', '2021-03-17 17:32:33');
INSERT INTO `eb_system_attachment` VALUES (409, '47aaa9df468b46ee968eb9d10de3e447v9jc8xim6q.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/03/18/019e7a89c5dd4b4d9aa8a35be7bfeb5fgnjuqtdbtk.jpg', 'crmebimage/operation/2021/03/18/019e7a89c5dd4b4d9aa8a35be7bfeb5fgnjuqtdbtk.jpg', '71811', 'jpeg', 0, 1, '2021-03-18 11:13:49', '2021-03-18 11:13:49');
INSERT INTO `eb_system_attachment` VALUES (410, 'QQ截圖20201204112117.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/18/ab1b4093b0b249fb9124c8bb6009894c0qdkzj1e48.png', 'crmebimage/product/2021/03/18/ab1b4093b0b249fb9124c8bb6009894c0qdkzj1e48.png', '240325', 'png', 1, 1, '2021-03-18 11:31:53', '2021-03-18 11:31:53');
INSERT INTO `eb_system_attachment` VALUES (411, 'QQ截圖20201204112133.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/18/3dcc2d78acac4155961324dc1cca9551xxa1vexwb6.png', 'crmebimage/product/2021/03/18/3dcc2d78acac4155961324dc1cca9551xxa1vexwb6.png', '202125', 'png', 1, 1, '2021-03-18 11:31:56', '2021-03-18 11:31:56');
INSERT INTO `eb_system_attachment` VALUES (412, 'QQ截圖20201204142821.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/18/fa695a907a464c5d8b80fdf0cb9c6ae2t3p9o8sb61.png', 'crmebimage/product/2021/03/18/fa695a907a464c5d8b80fdf0cb9c6ae2t3p9o8sb61.png', '166625', 'png', 1, 1, '2021-03-18 11:32:00', '2021-03-18 11:32:00');
INSERT INTO `eb_system_attachment` VALUES (413, '1616385314353_photo_001.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/22/a2cbba18cb12497d891c927e253930b7t38bqhzogd.jpg', 'crmebimage/product/2021/03/22/a2cbba18cb12497d891c927e253930b7t38bqhzogd.jpg', '622230', 'jpeg', 1, 1, '2021-03-22 11:55:15', '2021-03-22 11:55:15');
INSERT INTO `eb_system_attachment` VALUES (414, 'Screenshot_20210322_110609_com.huawei.calculator.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/23/a7676dc58d1045429a310a9d254de2762xu5o2j14a.jpg', 'crmebimage/product/2021/03/23/a7676dc58d1045429a310a9d254de2762xu5o2j14a.jpg', '193044', 'jpeg', 1, 1, '2021-03-23 19:57:56', '2021-03-23 19:57:56');
INSERT INTO `eb_system_attachment` VALUES (415, 'AA3514AC-1345-4A36-8761-59520A4ECB3C.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/24/9f44ccfd7878424ebceb144fd21af51bg1zspmubak.png', 'crmebimage/user/2021/03/24/9f44ccfd7878424ebceb144fd21af51bg1zspmubak.png', '2797291', 'png', 1, 1, '2021-03-24 09:56:56', '2021-03-24 09:56:56');
INSERT INTO `eb_system_attachment` VALUES (416, '8EE18F32-1813-41A8-8929-89E5FBBF59CB.jpeg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/24/d42b3f3afcdf4ad48253ec6090abfdc65wf8nycd77.jpeg', 'crmebimage/user/2021/03/24/d42b3f3afcdf4ad48253ec6090abfdc65wf8nycd77.jpeg', '492752', 'jpeg', 1, 1, '2021-03-24 09:59:04', '2021-03-24 09:59:04');
INSERT INTO `eb_system_attachment` VALUES (417, 'tmp_8bbff990f226758dc84d07f71835341de35b890ac57c7373.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/24/0af8578af02340fd8e232b50af6a5c27owpqkdizd8.jpg', 'crmebimage/product/2021/03/24/0af8578af02340fd8e232b50af6a5c27owpqkdizd8.jpg', '193044', 'jpeg', 1, 1, '2021-03-24 14:30:50', '2021-03-24 14:30:50');
INSERT INTO `eb_system_attachment` VALUES (418, 'tmp_419bfcbff544d6f9a09f847d034ed0c6166755207901101f.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/24/e01f63532b7c4fd99ef5d16ab77cd8e0tgl0glha8u.jpg', 'crmebimage/user/2021/03/24/e01f63532b7c4fd99ef5d16ab77cd8e0tgl0glha8u.jpg', '193044', 'jpeg', 1, 1, '2021-03-24 17:08:05', '2021-03-24 17:08:05');
INSERT INTO `eb_system_attachment` VALUES (419, 'Screenshot_20210322_110609_com.huawei.calculator.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/24/a6a028b4641740849a896cf71e6329f8u1usoucl4s.jpg', 'crmebimage/user/2021/03/24/a6a028b4641740849a896cf71e6329f8u1usoucl4s.jpg', '193044', 'jpeg', 1, 1, '2021-03-24 17:08:52', '2021-03-24 17:08:52');
INSERT INTO `eb_system_attachment` VALUES (420, '1616576985724_wx_camera_1616422022040.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/24/04f7e1e000d84a87b16f8a4ab5767179qjzi8v7rt2.jpg', 'crmebimage/user/2021/03/24/04f7e1e000d84a87b16f8a4ab5767179qjzi8v7rt2.jpg', '53024', 'jpeg', 1, 1, '2021-03-24 17:09:45', '2021-03-24 17:09:45');
INSERT INTO `eb_system_attachment` VALUES (421, '1616381226-IMG_1936.PNG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/25/4125c3f6b9c448ce9281a4fb3d5f7a7b5ph95zujty.PNG', 'crmebimage/user/2021/03/25/4125c3f6b9c448ce9281a4fb3d5f7a7b5ph95zujty.PNG', '410796', 'png', 1, 1, '2021-03-25 12:08:04', '2021-03-25 12:08:04');
INSERT INTO `eb_system_attachment` VALUES (422, '1616654182631_1616500879-IMG_2049.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/25/742548c724d2414dbf26a353b0c99f82228rfp7rn3.jpg', 'crmebimage/user/2021/03/25/742548c724d2414dbf26a353b0c99f82228rfp7rn3.jpg', '849439', 'jpeg', 1, 1, '2021-03-25 14:36:24', '2021-03-25 14:36:24');
INSERT INTO `eb_system_attachment` VALUES (423, '1616641789-IMG_2071.PNG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/25/d927d2a732aa4567b1441df4378134f6px9hxhf1u0.PNG', 'crmebimage/user/2021/03/25/d927d2a732aa4567b1441df4378134f6px9hxhf1u0.PNG', '108772', 'png', 1, 1, '2021-03-25 14:36:32', '2021-03-25 14:36:32');
INSERT INTO `eb_system_attachment` VALUES (424, '1616486155-IMG_2047.PNG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/25/a1106303c6844d7fb0f41fd182f64f1eqnrd7nq3b5.PNG', 'crmebimage/product/2021/03/25/a1106303c6844d7fb0f41fd182f64f1eqnrd7nq3b5.PNG', '108793', 'png', 1, 1, '2021-03-25 14:36:46', '2021-03-25 14:36:46');
INSERT INTO `eb_system_attachment` VALUES (425, '1616654242947_photo_001.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/25/d4fc1a945bbf418081d1781d0f0d9f3fkog84s04eh.jpg', 'crmebimage/product/2021/03/25/d4fc1a945bbf418081d1781d0f0d9f3fkog84s04eh.jpg', '1191193', 'jpeg', 1, 1, '2021-03-25 14:37:26', '2021-03-25 14:37:26');
INSERT INTO `eb_system_attachment` VALUES (426, '6e94ff2bcf3e32be911470c546b53888.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/27/199b59b831fe4a2588ae1ca439435d0d7g6x47shfm.png', 'crmebimage/product/2021/03/27/199b59b831fe4a2588ae1ca439435d0d7g6x47shfm.png', '56103', 'png', 1, 1, '2021-03-27 09:41:23', '2021-03-27 09:41:23');
INSERT INTO `eb_system_attachment` VALUES (427, '1616809292660_IMG_20210221_173609.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/03/27/931437f92db14905b3aa8e226b479629eed60sjir2.jpg', 'crmebimage/product/2021/03/27/931437f92db14905b3aa8e226b479629eed60sjir2.jpg', '103041', 'jpeg', 1, 1, '2021-03-27 09:41:32', '2021-03-27 09:41:32');
INSERT INTO `eb_system_attachment` VALUES (428, 'mm_facetoface_collect_qrcode_1616809355774.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/27/f1037ae0f0d24e8892528e4894ddbaa1d0he96ron6.png', 'crmebimage/user/2021/03/27/f1037ae0f0d24e8892528e4894ddbaa1d0he96ron6.png', '135568', 'png', 1, 1, '2021-03-27 09:42:48', '2021-03-27 09:42:48');
INSERT INTO `eb_system_attachment` VALUES (429, '1617097411689_1616921501-IMG_7822.PNG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/30/0ae769e3072748378796d99f9c6163c2xy4dikuvj0.PNG', 'crmebimage/user/2021/03/30/0ae769e3072748378796d99f9c6163c2xy4dikuvj0.PNG', '1188667', 'png', 1, 1, '2021-03-30 17:43:32', '2021-03-30 17:43:32');
INSERT INTO `eb_system_attachment` VALUES (430, '1617096983-IMG_2079.JPG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/30/6d78fe9acdcf484ba8ebbfb8474f524c4waiffsrde.JPG', 'crmebimage/user/2021/03/30/6d78fe9acdcf484ba8ebbfb8474f524c4waiffsrde.JPG', '189069', 'jpeg', 1, 1, '2021-03-30 17:49:46', '2021-03-30 17:49:46');
INSERT INTO `eb_system_attachment` VALUES (431, '1617096983-IMG_2079.JPG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/03/30/171ccd8dcb69436799c3fab6cf3fe50893oziq86xc.JPG', 'crmebimage/user/2021/03/30/171ccd8dcb69436799c3fab6cf3fe50893oziq86xc.JPG', '189069', 'jpeg', 1, 1, '2021-03-30 17:50:24', '2021-03-30 17:50:24');
INSERT INTO `eb_system_attachment` VALUES (433, '1490719605-CE71067A-45DF-492A-B086-BEF1AE757154.JPG', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/04/05/d197c56b250040ac81e4480cdaa68963pirxs8wlgd.JPG', 'crmebimage/user/2021/04/05/d197c56b250040ac81e4480cdaa68963pirxs8wlgd.JPG', '47490', 'jpeg', 7, 1, '2021-04-05 07:58:13', '2021-04-05 07:58:13');
INSERT INTO `eb_system_attachment` VALUES (434, 'img.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/04/10/4c1ba3bbec7d499ca5d5f72d25e8ab79n61bu7ni0m.jpg', 'crmebimage/user/2021/04/10/4c1ba3bbec7d499ca5d5f72d25e8ab79n61bu7ni0m.jpg', '56665', 'jpeg', 7, 1, '2021-04-10 10:22:57', '2021-04-10 10:22:57');
INSERT INTO `eb_system_attachment` VALUES (435, 'moon.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/operation/2021/04/20/93416841e4d24d78acc3e5033a5655a2koamzvaetn.jpg', 'crmebimage/operation/2021/04/20/93416841e4d24d78acc3e5033a5655a2koamzvaetn.jpg', '32797', 'jpeg', 303, 1, '2021-04-20 14:53:00', '2021-04-20 14:53:00');
INSERT INTO `eb_system_attachment` VALUES (436, 'timg (3).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/maintain/2021/04/20/2fa4b060a4e04e8d82ef909fa26f855bkslyn2qjgt.jpg', 'crmebimage/maintain/2021/04/20/2fa4b060a4e04e8d82ef909fa26f855bkslyn2qjgt.jpg', '50410', 'jpeg', 0, 1, '2021-04-20 14:58:05', '2021-04-20 14:58:05');
INSERT INTO `eb_system_attachment` VALUES (437, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/02c786fed6c0401b8f592b5e609aa3172fy9qhbsc5.png', 'crmebimage/product/2021/04/27/02c786fed6c0401b8f592b5e609aa3172fy9qhbsc5.png', '137798', 'png', 1, 1, '2021-04-27 14:24:33', '2021-04-27 14:24:33');
INSERT INTO `eb_system_attachment` VALUES (438, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/29ba3248b90b4e2585f7aa15ee2f475dahzrvff4c4.png', 'crmebimage/product/2021/04/27/29ba3248b90b4e2585f7aa15ee2f475dahzrvff4c4.png', '137798', 'png', 1, 1, '2021-04-27 14:25:53', '2021-04-27 14:25:53');
INSERT INTO `eb_system_attachment` VALUES (439, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/5022f5e5a9254a0b95356c1276a056dasxxpsmn07b.png', 'crmebimage/product/2021/04/27/5022f5e5a9254a0b95356c1276a056dasxxpsmn07b.png', '137798', 'png', 1, 1, '2021-04-27 15:06:19', '2021-04-27 15:06:19');
INSERT INTO `eb_system_attachment` VALUES (440, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/74f42524c36348da90d121d0dd1ffd8deyymm92ubi.png', 'crmebimage/product/2021/04/27/74f42524c36348da90d121d0dd1ffd8deyymm92ubi.png', '137798', 'png', 1, 1, '2021-04-27 18:37:45', '2021-04-27 18:37:45');
INSERT INTO `eb_system_attachment` VALUES (441, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/28d29c2ab46a44bfb4274188d638d3030j4armzxvm.png', 'crmebimage/product/2021/04/27/28d29c2ab46a44bfb4274188d638d3030j4armzxvm.png', '137798', 'png', 1, 1, '2021-04-27 18:38:47', '2021-04-27 18:38:47');
INSERT INTO `eb_system_attachment` VALUES (442, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/27/695ffc00cc4e43e9953e5b4f0ed6a07bhko3ymca2r.png', 'crmebimage/product/2021/04/27/695ffc00cc4e43e9953e5b4f0ed6a07bhko3ymca2r.png', '137798', 'png', 1, 1, '2021-04-27 18:42:09', '2021-04-27 18:42:09');
INSERT INTO `eb_system_attachment` VALUES (443, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/28/0a89ece960024a6e93ad5859e107ae836bfqg6z4nt.png', 'crmebimage/product/2021/04/28/0a89ece960024a6e93ad5859e107ae836bfqg6z4nt.png', '137798', 'png', 1, 1, '2021-04-28 10:03:48', '2021-04-28 10:03:48');
INSERT INTO `eb_system_attachment` VALUES (444, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/28/f8f5874dc10c41cc9a1bce64566d2a2dhvuphtrz7q.png', 'crmebimage/product/2021/04/28/f8f5874dc10c41cc9a1bce64566d2a2dhvuphtrz7q.png', '137798', 'png', 1, 1, '2021-04-28 10:19:59', '2021-04-28 10:19:59');
INSERT INTO `eb_system_attachment` VALUES (445, '20210325174423541.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/04/28/28523e8155b24b339830a79d672e61ad64lkh2l58b.png', 'crmebimage/product/2021/04/28/28523e8155b24b339830a79d672e61ad64lkh2l58b.png', '137798', 'png', 1, 1, '2021-04-28 12:24:44', '2021-04-28 12:24:44');
INSERT INTO `eb_system_attachment` VALUES (446, 'QQ截圖20210512102029.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/f60f1f2935fc4c81bf3fda716efc00e9wrj6ejb2ck.png', 'crmebimage/content/2021/05/12/f60f1f2935fc4c81bf3fda716efc00e9wrj6ejb2ck.png', '268374', 'png', 0, 1, '2021-05-12 10:20:40', '2021-05-12 10:20:40');
INSERT INTO `eb_system_attachment` VALUES (447, 'QQ截圖20210512102134.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/4a8f6e47ad824df89c6ade3133092fb6jhxtgzjnsl.png', 'crmebimage/content/2021/05/12/4a8f6e47ad824df89c6ade3133092fb6jhxtgzjnsl.png', '89274', 'png', 0, 1, '2021-05-12 10:22:01', '2021-05-12 10:22:01');
INSERT INTO `eb_system_attachment` VALUES (448, 'QQ截圖20210512102058.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/e799d1493f504cd199f94b365c341d2blt6ko5u28n.png', 'crmebimage/content/2021/05/12/e799d1493f504cd199f94b365c341d2blt6ko5u28n.png', '173386', 'png', 0, 1, '2021-05-12 10:22:01', '2021-05-12 10:22:01');
INSERT INTO `eb_system_attachment` VALUES (449, 'QQ截圖20210512102124.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/be81685fc12b40ce9dd99baa5cf9dee5ksegf8kota.png', 'crmebimage/content/2021/05/12/be81685fc12b40ce9dd99baa5cf9dee5ksegf8kota.png', '233955', 'png', 0, 1, '2021-05-12 10:22:01', '2021-05-12 10:22:01');
INSERT INTO `eb_system_attachment` VALUES (450, 'QQ截圖20210512102112.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/3c8acd6656504f1798b5ffaecd43e600i5g2tgu6cj.png', 'crmebimage/content/2021/05/12/3c8acd6656504f1798b5ffaecd43e600i5g2tgu6cj.png', '205545', 'png', 0, 1, '2021-05-12 10:22:01', '2021-05-12 10:22:01');
INSERT INTO `eb_system_attachment` VALUES (451, '綠色.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/bfa5fad8c0cb4ac9b6e0426d3d55cc7223j0l36fns.png', 'crmebimage/content/2021/05/12/bfa5fad8c0cb4ac9b6e0426d3d55cc7223j0l36fns.png', '236558', 'png', 0, 1, '2021-05-12 10:25:21', '2021-05-12 10:25:21');
INSERT INTO `eb_system_attachment` VALUES (452, '藍色.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/12/15894cc0b56d45a2badfd95b7227be58a2o2mqnucu.png', 'crmebimage/content/2021/05/12/15894cc0b56d45a2badfd95b7227be58a2o2mqnucu.png', '227700', 'png', 0, 1, '2021-05-12 10:25:21', '2021-05-12 10:25:21');
INSERT INTO `eb_system_attachment` VALUES (453, 'QQ截圖20201204142830.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/6f52470f05e649b097179364966b813fnt9p76yd0g.png', 'crmebimage/product/2021/05/12/6f52470f05e649b097179364966b813fnt9p76yd0g.png', '257344', 'png', 1, 1, '2021-05-12 16:53:49', '2021-05-12 16:53:49');
INSERT INTO `eb_system_attachment` VALUES (454, 'QQ截圖20201204142821.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/65e276923ae948e1a12e58d8b02773dahcq9tp0cmb.png', 'crmebimage/product/2021/05/12/65e276923ae948e1a12e58d8b02773dahcq9tp0cmb.png', '166625', 'png', 1, 1, '2021-05-12 16:53:52', '2021-05-12 16:53:52');
INSERT INTO `eb_system_attachment` VALUES (455, 'QQ截圖20201204142841.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/f0c0ae9ebb5f4a5ead2aee0ed1ec8881ejiey5qgij.png', 'crmebimage/product/2021/05/12/f0c0ae9ebb5f4a5ead2aee0ed1ec8881ejiey5qgij.png', '203907', 'png', 1, 1, '2021-05-12 16:53:55', '2021-05-12 16:53:55');
INSERT INTO `eb_system_attachment` VALUES (456, 'QQ截圖20201204150959.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/1be594c3ae814db1bd8d6ffaca445a3aewmoz2t9we.png', 'crmebimage/product/2021/05/12/1be594c3ae814db1bd8d6ffaca445a3aewmoz2t9we.png', '604837', 'png', 1, 1, '2021-05-12 16:53:58', '2021-05-12 16:53:58');
INSERT INTO `eb_system_attachment` VALUES (457, 'QQ截圖20201204142821.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/0f9f2df0b66644f792c5a6c0af049144fd9wjmd75p.png', 'crmebimage/product/2021/05/12/0f9f2df0b66644f792c5a6c0af049144fd9wjmd75p.png', '166625', 'png', 1, 1, '2021-05-12 16:54:02', '2021-05-12 16:54:02');
INSERT INTO `eb_system_attachment` VALUES (458, 'QQ截圖20201204142830.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/8f594f371a1f4369a82609fc94682c35y5upvz8uje.png', 'crmebimage/product/2021/05/12/8f594f371a1f4369a82609fc94682c35y5upvz8uje.png', '257344', 'png', 1, 1, '2021-05-12 16:54:04', '2021-05-12 16:54:04');
INSERT INTO `eb_system_attachment` VALUES (459, 'QQ截圖20201204112117.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/f88d85cef98d4c1fb391be8ffed5a62ftyokg51bn9.png', 'crmebimage/product/2021/05/12/f88d85cef98d4c1fb391be8ffed5a62ftyokg51bn9.png', '240325', 'png', 1, 1, '2021-05-12 16:54:07', '2021-05-12 16:54:07');
INSERT INTO `eb_system_attachment` VALUES (460, 'QQ截圖20201204142830.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/3e7860b2736c4dd68e18c42886b278144dlm8fx1xz.png', 'crmebimage/product/2021/05/12/3e7860b2736c4dd68e18c42886b278144dlm8fx1xz.png', '257344', 'png', 1, 1, '2021-05-12 16:54:10', '2021-05-12 16:54:10');
INSERT INTO `eb_system_attachment` VALUES (461, 'QQ截圖20201204142841.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/12/9f5388ed54b9494e92abde1f34ca10e5hw8nkm3mma.png', 'crmebimage/product/2021/05/12/9f5388ed54b9494e92abde1f34ca10e5hw8nkm3mma.png', '203907', 'png', 1, 1, '2021-05-12 16:54:13', '2021-05-12 16:54:13');
INSERT INTO `eb_system_attachment` VALUES (462, 'VIVO.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/75725d4c61d14cd8b8f8015f2da1caaciel1icu6xp.jpg', 'crmebimage/product/2021/05/13/75725d4c61d14cd8b8f8015f2da1caaciel1icu6xp.jpg', '6528', 'jpeg', 1, 1, '2021-05-13 10:00:26', '2021-05-13 10:00:26');
INSERT INTO `eb_system_attachment` VALUES (463, '華為.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/c6a1abefe86d4fe389f217b74d0f7c4e0n8n5v7dga.jpg', 'crmebimage/product/2021/05/13/c6a1abefe86d4fe389f217b74d0f7c4e0n8n5v7dga.jpg', '16905', 'jpeg', 1, 1, '2021-05-13 10:00:28', '2021-05-13 10:00:28');
INSERT INTO `eb_system_attachment` VALUES (464, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/1067b4f373b24d28806b093d1f4ef7f74t9kppdrog.jpg', 'crmebimage/product/2021/05/13/1067b4f373b24d28806b093d1f4ef7f74t9kppdrog.jpg', '6766', 'jpeg', 1, 1, '2021-05-13 10:00:31', '2021-05-13 10:00:31');
INSERT INTO `eb_system_attachment` VALUES (465, '聯想.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/6c4b2fd0d5b94a41933a73893d5c9534s1r5kmm0cf.jpg', 'crmebimage/product/2021/05/13/6c4b2fd0d5b94a41933a73893d5c9534s1r5kmm0cf.jpg', '17420', 'jpeg', 1, 1, '2021-05-13 10:00:35', '2021-05-13 10:00:35');
INSERT INTO `eb_system_attachment` VALUES (466, '聯想.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/cbe4a5443cc44759823758830d2189105004p3ed2b.jpg', 'crmebimage/product/2021/05/13/cbe4a5443cc44759823758830d2189105004p3ed2b.jpg', '17420', 'jpeg', 1, 1, '2021-05-13 10:02:05', '2021-05-13 10:02:05');
INSERT INTO `eb_system_attachment` VALUES (467, '酷派.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/1840caff53be438bbdeb972ac625b2227zffzutxbx.jpg', 'crmebimage/product/2021/05/13/1840caff53be438bbdeb972ac625b2227zffzutxbx.jpg', '7236', 'jpeg', 1, 1, '2021-05-13 10:02:07', '2021-05-13 10:02:07');
INSERT INTO `eb_system_attachment` VALUES (468, '錘子.jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/product/2021/05/13/477f963092e8419b80e387fb54adcf79g7isbjo9vj.jpg', 'crmebimage/product/2021/05/13/477f963092e8419b80e387fb54adcf79g7isbjo9vj.jpg', '6766', 'jpeg', 1, 1, '2021-05-13 10:02:10', '2021-05-13 10:02:10');
INSERT INTO `eb_system_attachment` VALUES (469, '1607498682(1).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/13/d32d61205a854419b18b4ca4b07428f5yga78d654z.jpg', 'crmebimage/user/2021/05/13/d32d61205a854419b18b4ca4b07428f5yga78d654z.jpg', '18860', 'jpeg', 7, 1, '2021-05-13 11:19:16', '2021-05-13 11:19:16');
INSERT INTO `eb_system_attachment` VALUES (470, '1a2f46d78d344650905c6b7a89f7fa005rwfic85li.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/14/bce6833c32f04a06b9ffa691127e65a0usdoxbo3sq.png', 'crmebimage/user/2021/05/14/bce6833c32f04a06b9ffa691127e65a0usdoxbo3sq.png', '24056', 'png', 1, 1, '2021-05-14 15:25:14', '2021-05-14 15:25:14');
INSERT INTO `eb_system_attachment` VALUES (471, '微信圖片1_20210327172406.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/14/13685dc1901849c29970da9933c303ddxrmr0xdbx1.png', 'crmebimage/user/2021/05/14/13685dc1901849c29970da9933c303ddxrmr0xdbx1.png', '5640', 'png', 1, 1, '2021-05-14 15:25:59', '2021-05-14 15:25:59');
INSERT INTO `eb_system_attachment` VALUES (472, '微信圖片1_20210327172406.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/14/2dac985be4f6453097c758bd9ee9e639hw7nstue03.png', 'crmebimage/user/2021/05/14/2dac985be4f6453097c758bd9ee9e639hw7nstue03.png', '5640', 'png', 1, 1, '2021-05-14 15:27:11', '2021-05-14 15:27:11');
INSERT INTO `eb_system_attachment` VALUES (473, '微信圖片1_20210327172406.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/14/5241c6a347e6439ca67f5db467304409ws52g3tx0e.png', 'crmebimage/user/2021/05/14/5241c6a347e6439ca67f5db467304409ws52g3tx0e.png', '5640', 'png', 1, 1, '2021-05-14 15:27:37', '2021-05-14 15:27:37');
INSERT INTO `eb_system_attachment` VALUES (474, '微信圖片1_20210327172406.png', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/user/2021/05/14/371140a2b2064afd82a672cde591667az3kk89y92v.png', 'crmebimage/user/2021/05/14/371140a2b2064afd82a672cde591667az3kk89y92v.png', '5640', 'png', 1, 1, '2021-05-14 15:28:56', '2021-05-14 15:28:56');
INSERT INTO `eb_system_attachment` VALUES (475, '1607498682(1).jpg', '/www/wwwroot/api.beta.java.crmeb.net/crmebimage/content/2021/05/21/203f83376bfe470d8128f4ad7820fee2n2umfha452.jpg', 'crmebimage/content/2021/05/21/203f83376bfe470d8128f4ad7820fee2n2umfha452.jpg', '18860', 'jpeg', 0, 1, '2021-05-21 10:09:03', '2021-05-21 10:09:03');

-- ----------------------------
-- Table structure for eb_system_city
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_city`;
CREATE TABLE `eb_system_city`  (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市id',
                                   `level` int(11) NOT NULL DEFAULT 0 COMMENT '省市級別',
                                   `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父級id',
                                   `area_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '區號',
                                   `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名稱',
                                   `merger_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '合併名稱',
                                   `lng` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '經度',
                                   `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '緯度',
                                   `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否展示',
                                   `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                   `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3971 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '城市表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_city
-- ----------------------------
INSERT INTO `eb_system_city` VALUES (385, 714402, 1, 714401, '0', '彰化縣', '台灣,彰化', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (386, 717531, 1, 714401, '0', '新北市', '台灣,新北', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (387, 719868, 1, 714401, '0', '澎湖縣', '台灣,澎湖', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (388, 720118, 1, 714401, '0', '屏東縣', '台灣,屏東', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (389, 722024, 1, 714401, '0', '臺中市', '台灣,臺中', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (390, 725488, 1, 714401, '0', '臺南市', '台灣,臺南', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (391, 727730, 1, 714401, '0', '臺北市', '台灣,臺北', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (392, 729928, 1, 714401, '0', '臺東縣', '台灣,臺東', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (393, 730843, 1, 714401, '0', '桃園市', '台灣,桃園', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (394, 734179, 1, 714401, '0', '宜蘭縣', '台灣,宜蘭', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (395, 736051, 1, 714401, '0', '南投縣', '台灣,南投', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (396, 737856, 1, 714401, '0', '南海島', '台灣,南海島', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (397, 737861, 1, 714401, '0', '苗慄縣', '台灣,苗慄', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (398, 739957, 1, 714401, '0', '嘉義市', '台灣,嘉義', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (399, 740510, 1, 714401, '0', '嘉義縣', '台灣,嘉義', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (400, 742126, 1, 714401, '0', '新竹市', '台灣,新竹', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (401, 742636, 1, 714401, '0', '新竹縣', '台灣,新竹', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (402, 743938, 1, 714401, '0', '花蓮縣', '台灣,花蓮', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (403, 745674, 1, 714401, '0', '高雄市', '台灣,高雄', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (404, 748553, 1, 714401, '0', '基隆市', '台灣,基隆', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (405, 749571, 1, 714401, '0', '金門縣', '台灣,金門', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (406, 749930, 1, 714401, '0', '連江縣', '台灣,連江', '119.539704', '26.197364', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (407, 749957, 1, 714401, '0', '雲林縣', '台灣,雲林', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3648, 714403, 2, 714402, '0', '芳苑鄉', '台灣,彰化,芳苑', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3649, 714632, 2, 714402, '0', '芬園鄉', '台灣,彰化,芬園', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3650, 714701, 2, 714402, '0', '福興鄉', '台灣,彰化,福興', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3651, 714777, 2, 714402, '0', '和美鎮', '台灣,彰化,和美', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3652, 715055, 2, 714402, '0', '花壇鄉', '台灣,彰化,花壇', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3653, 715172, 2, 714402, '0', '鹿港鎮', '台灣,彰化,鹿港', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3654, 715490, 2, 714402, '0', '埤頭鄉', '台灣,彰化,埤頭', '120.464542', '23.890392', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3655, 715602, 2, 714402, '0', '埔心鄉', '台灣,彰化,埔心', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3656, 715745, 2, 714402, '0', '埔鹽鄉', '台灣,彰化,埔鹽', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3657, 715795, 2, 714402, '0', '伸港鄉', '台灣,彰化,伸港', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3658, 715960, 2, 714402, '0', '社頭鄉', '台灣,彰化,社頭', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3659, 716105, 2, 714402, '0', '田尾鄉', '台灣,彰化,田尾', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3660, 716202, 2, 714402, '0', '田中鎮', '台灣,彰化,田中', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3661, 716341, 2, 714402, '0', '線西鄉', '台灣,彰化,線西', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3662, 716421, 2, 714402, '0', '溪湖鎮', '台灣,彰化,溪湖', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3663, 716750, 2, 714402, '0', '秀水鄉', '台灣,彰化,秀水', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3664, 716874, 2, 714402, '0', '溪州鄉', '台灣,彰化,溪州', '120.492906', '23.853578', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3665, 717107, 2, 714402, '0', '永靖鄉', '台灣,彰化,永靖', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3666, 717238, 2, 714402, '0', '員林市', '台灣,彰化,員林市', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3667, 717447, 2, 714402, '0', '竹塘鄉', '台灣,彰化,竹塘', '120.416000', '24.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3668, 717532, 2, 717531, '0', '八里區', '台灣,新北,八里區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3669, 717645, 2, 717531, '0', '板橋區', '台灣,新北,板橋區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3670, 717902, 2, 717531, '0', '貢寮區', '台灣,新北,貢寮區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3671, 717955, 2, 717531, '0', '金山區', '台灣,新北,金山區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3672, 718036, 2, 717531, '0', '林口區', '台灣,新北,林口區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3673, 718195, 2, 717531, '0', '蘆洲區', '台灣,新北,蘆洲區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3674, 718266, 2, 717531, '0', '坪林區', '台灣,新北,坪林區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3675, 718327, 2, 717531, '0', '平溪區', '台灣,新北,平溪區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3676, 718375, 2, 717531, '0', '瑞芳區', '台灣,新北,瑞芳區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3677, 718490, 2, 717531, '0', '三重區', '台灣,新北,三重區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3678, 718786, 2, 717531, '0', '三峽區', '台灣,新北,三峽區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3679, 718879, 2, 717531, '0', '三芝區', '台灣,新北,三芝區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3680, 718980, 2, 717531, '0', '深坑區', '台灣,新北,深坑區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3681, 719023, 2, 717531, '0', '石碇區', '台灣,新北,石碇區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3682, 719115, 2, 717531, '0', '石門區', '台灣,新北,石門區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3683, 719155, 2, 717531, '0', '雙溪區', '台灣,新北,雙溪區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3684, 719243, 2, 717531, '0', '樹林區', '台灣,新北,樹林區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3685, 719382, 2, 717531, '0', '泰山區', '台灣,新北,泰山區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3686, 719498, 2, 717531, '0', '淡水區', '台灣,新北,淡水區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3687, 719731, 2, 717531, '0', '土城區', '台灣,新北,土城區', '121.465746', '25.012366', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3688, 719869, 2, 719868, '0', '白沙鄉', '台灣,澎湖,白沙', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3689, 719890, 2, 719868, '0', '湖西鄉', '台灣,澎湖,湖西', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3690, 719916, 2, 719868, '0', '馬公市', '台灣,澎湖,馬公市', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3691, 720065, 2, 719868, '0', '七美鄉', '台灣,澎湖,七美', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3692, 720090, 2, 719868, '0', '望安鄉', '台灣,澎湖,望安', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3693, 720102, 2, 719868, '0', '西嶼鄉', '台灣,澎湖,西嶼', '119.566417', '23.569733', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3694, 720119, 2, 720118, '0', '三地門鄉', '台灣,屏東,三地門', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3695, 720142, 2, 720118, '0', '獅子鄉', '台灣,屏東,獅子', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3696, 720163, 2, 720118, '0', '泰武鄉', '台灣,屏東,泰武', '120.626012', '22.591307', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3697, 720186, 2, 720118, '0', '萬丹鄉', '台灣,屏東,萬丹', '120.486423', '22.588123', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3698, 720415, 2, 720118, '0', '萬巒鄉', '台灣,屏東,萬巒', '120.566478', '22.571966', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3699, 720480, 2, 720118, '0', '霧臺鄉', '台灣,屏東,霧臺', '120.727653', '22.743675', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3700, 720502, 2, 720118, '0', '新埤鄉', '台灣,屏東,新埤', '120.545190', '22.465998', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3701, 720553, 2, 720118, '0', '新園鄉', '台灣,屏東,新園', '120.459758', '22.544147', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3702, 720649, 2, 720118, '0', '鹽埔鄉', '台灣,屏東,鹽埔', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3703, 720748, 2, 720118, '0', '竹田鄉', '台灣,屏東,竹田', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3704, 720835, 2, 720118, '0', '長治鄉', '台灣,屏東,長治', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3705, 720975, 2, 720118, '0', '潮州鎮', '台灣,屏東,潮州', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3706, 721293, 2, 720118, '0', '車城鄉', '台灣,屏東,車城', '120.707694', '22.072115', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3707, 721335, 2, 720118, '0', '春日鄉', '台灣,屏東,春日', '120.622000', '22.368284', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3708, 721344, 2, 720118, '0', '東港鎮', '台灣,屏東,東港', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3709, 721490, 2, 720118, '0', '枋寮鄉', '台灣,屏東,枋寮', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3710, 721617, 2, 720118, '0', '枋山鄉', '台灣,屏東,枋山', '120.647762', '22.262550', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3711, 721638, 2, 720118, '0', '高樹鄉', '台灣,屏東,高樹', '120.595945', '22.825131', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3712, 721805, 2, 720118, '0', '恆春鎮', '台灣,屏東,恆春', '120.487928', '22.682802', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3713, 721930, 2, 720118, '0', '佳冬鄉', '台灣,屏東,佳冬', '120.545370', '22.417786', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3714, 722025, 2, 722024, '0', '梧棲區', '台灣,臺中,梧棲區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3715, 722212, 2, 722024, '0', '烏日區', '台灣,臺中,烏日區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3716, 722402, 2, 722024, '0', '新社區', '台灣,臺中,新社區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3717, 722474, 2, 722024, '0', '西屯區', '台灣,臺中,西屯區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3718, 722699, 2, 722024, '0', '北屯區', '台灣,臺中,北屯區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3719, 722879, 2, 722024, '0', '中區', '台灣,臺中,中區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3720, 722923, 2, 722024, '0', '大肚區', '台灣,臺中,大肚區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3721, 723021, 2, 722024, '0', '大甲區', '台灣,臺中,大甲區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3722, 723211, 2, 722024, '0', '大裡區', '台灣,臺中,大裡區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3723, 723592, 2, 722024, '0', '大雅區', '台灣,臺中,大雅區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3724, 723756, 2, 722024, '0', '大安區', '台灣,臺中,大安區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3725, 723802, 2, 722024, '0', '東勢區', '台灣,臺中,東勢區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3726, 723966, 2, 722024, '0', '東區', '台灣,臺中,東區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3727, 724148, 2, 722024, '0', '豐原區', '台灣,臺中,豐原區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3728, 724424, 2, 722024, '0', '和平區', '台灣,臺中,和平區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3729, 724504, 2, 722024, '0', '後裡區', '台灣,臺中,後裡區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3730, 724656, 2, 722024, '0', '龍井區', '台灣,臺中,龍井區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3731, 724797, 2, 722024, '0', '南屯區', '台灣,臺中,南屯區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3732, 724872, 2, 722024, '0', '北區', '台灣,臺中,北區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3733, 725199, 2, 722024, '0', '清水區', '台灣,臺中,清水區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3734, 725489, 2, 725488, '0', '佳裡區', '台灣,臺南,佳裡區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3735, 725588, 2, 725488, '0', '將軍區', '台灣,臺南,將軍區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3736, 725620, 2, 725488, '0', '六甲區', '台灣,臺南,六甲區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3737, 725679, 2, 725488, '0', '柳營區', '台灣,臺南,柳營區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3738, 725795, 2, 725488, '0', '龍崎區', '台灣,臺南,龍崎區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3739, 725841, 2, 725488, '0', '麻豆區', '台灣,臺南,麻豆區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3740, 725927, 2, 725488, '0', '南化區', '台灣,臺南,南化區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3741, 725938, 2, 725488, '0', '楠西區', '台灣,臺南,楠西區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3742, 725973, 2, 725488, '0', '北區', '台灣,臺南,北區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3743, 726300, 2, 725488, '0', '七股區', '台灣,臺南,七股區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3744, 726338, 2, 725488, '0', '仁德區', '台灣,臺南,仁德區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3745, 726539, 2, 725488, '0', '善化區', '台灣,臺南,善化區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3746, 726675, 2, 725488, '0', '山上區', '台灣,臺南,山上區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3747, 726691, 2, 725488, '0', '南區', '台灣,臺南,南區', '120.679305', '24.133453', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3748, 727041, 2, 725488, '0', '中西區', '台灣,臺南,中西區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3749, 727251, 2, 725488, '0', '下營區', '台灣,臺南,下營區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3750, 727339, 2, 725488, '0', '西港區', '台灣,臺南,西港區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3751, 727375, 2, 725488, '0', '新化區', '台灣,臺南,新化區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3752, 727425, 2, 725488, '0', '新市區', '台灣,臺南,新市區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3753, 727529, 2, 725488, '0', '新營區', '台灣,臺南,新營區', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3754, 727731, 2, 727730, '0', '北投區', '台灣,臺北,北投區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3755, 727897, 2, 727730, '0', '大同區', '台灣,臺北,大同區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3756, 728070, 2, 727730, '0', '大安區', '台灣,臺北,大安區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3757, 728116, 2, 727730, '0', '南港區', '台灣,臺北,南港區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3758, 728220, 2, 727730, '0', '內湖區', '台灣,臺北,內湖區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3759, 728340, 2, 727730, '0', '士林區', '台灣,臺北,士林區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3760, 728550, 2, 727730, '0', '松山區', '台灣,臺北,松山區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3761, 728713, 2, 727730, '0', '萬華區', '台灣,臺北,萬華區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3762, 728920, 2, 727730, '0', '文山區', '台灣,臺北,文山區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3763, 729073, 2, 727730, '0', '信義區', '台灣,臺北,信義區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3764, 729277, 2, 727730, '0', '中山區', '台灣,臺北,中山區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3765, 729583, 2, 727730, '0', '中正區', '台灣,臺北,中正區', '121.517057', '25.048074', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3766, 729929, 2, 729928, '0', '卑南鄉', '台灣,臺東,卑南', '121.117213', '22.781744', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3767, 729994, 2, 729928, '0', '長濱鄉', '台灣,臺東,長濱', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3768, 730033, 2, 729928, '0', '成功鎮', '台灣,臺東,成功', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3769, 730107, 2, 729928, '0', '池上鄉', '台灣,臺東,池上', '121.212999', '23.123275', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3770, 730196, 2, 729928, '0', '達仁鄉', '台灣,臺東,達仁', '120.878316', '22.296142', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3771, 730219, 2, 729928, '0', '大武鄉', '台灣,臺東,大武', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3772, 730268, 2, 729928, '0', '東河鄉', '台灣,臺東,東河', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3773, 730308, 2, 729928, '0', '關山鎮', '台灣,臺東,關山', '121.158084', '23.047483', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3774, 730384, 2, 729928, '0', '海端鄉', '台灣,臺東,海端', '121.172009', '23.101079', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3775, 730409, 2, 729928, '0', '金峰鄉', '台灣,臺東,金峰', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3776, 730416, 2, 729928, '0', '蘭嶼鄉', '台灣,臺東,蘭嶼', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3777, 730423, 2, 729928, '0', '綠島鄉', '台灣,臺東,綠島', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3778, 730438, 2, 729928, '0', '鹿野鄉', '台灣,臺東,鹿野', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3779, 730510, 2, 729928, '0', '太麻裡鄉', '台灣,臺東,太麻裡', '120.999365', '22.610919', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3780, 730565, 2, 729928, '0', '臺東市', '台灣,臺東,臺東市', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3781, 730832, 2, 729928, '0', '延平鄉', '台灣,臺東,延平', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3782, 730844, 2, 730843, '0', '八德區', '台灣,桃園,八德區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3783, 731212, 2, 730843, '0', '大溪區', '台灣,桃園,大溪區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3784, 731471, 2, 730843, '0', '大園區', '台灣,桃園,大園區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3785, 731767, 2, 730843, '0', '復興區', '台灣,桃園,復興區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3786, 731835, 2, 730843, '0', '觀音區', '台灣,桃園,觀音區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3787, 732079, 2, 730843, '0', '龜山區', '台灣,桃園,龜山區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3788, 732469, 2, 730843, '0', '龍潭區', '台灣,桃園,龍潭區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3789, 732800, 2, 730843, '0', '蘆竹區', '台灣,桃園,蘆竹區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3790, 733144, 2, 730843, '0', '平鎮區', '台灣,桃園,平區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3791, 733179, 2, 730843, '0', '桃園區', '台灣,桃園,桃園區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3792, 733390, 2, 730843, '0', '新屋區', '台灣,桃園,新屋區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3793, 733537, 2, 730843, '0', '楊梅區', '台灣,桃園,楊梅區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3794, 733876, 2, 730843, '0', '中壢區', '台灣,桃園,中壢區', '121.083000', '25.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3795, 734180, 2, 734179, '0', '大同鄉', '台灣,宜蘭,大同', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3796, 734246, 2, 734179, '0', '釣魚臺', '台灣,宜蘭,釣魚臺', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3797, 734248, 2, 734179, '0', '冬山鄉', '台灣,宜蘭,冬山', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3798, 734579, 2, 734179, '0', '礁溪鄉', '台灣,宜蘭,礁溪', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3799, 734681, 2, 734179, '0', '羅東鎮', '台灣,宜蘭,羅東', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3800, 734842, 2, 734179, '0', '南澳鄉', '台灣,宜蘭,南澳', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3801, 734865, 2, 734179, '0', '三星鄉', '台灣,宜蘭,三星', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3802, 735104, 2, 734179, '0', '蘇澳鎮', '台灣,宜蘭,蘇澳', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3803, 735319, 2, 734179, '0', '頭城鎮', '台灣,宜蘭,頭城', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3804, 735419, 2, 734179, '0', '五結鄉', '台灣,宜蘭,五結', '121.796468', '24.685615', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3805, 735620, 2, 734179, '0', '宜蘭市', '台灣,宜蘭,宜蘭市', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3806, 735851, 2, 734179, '0', '員山鄉', '台灣,宜蘭,員山', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3807, 735970, 2, 734179, '0', '壯圍鄉', '台灣,宜蘭,壯圍', '121.500000', '24.600000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3808, 736052, 2, 736051, '0', '草屯鎮', '台灣,南投,草屯', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3809, 736305, 2, 736051, '0', '國姓鄉', '台灣,南投,國姓', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3810, 736356, 2, 736051, '0', '集集鎮', '台灣,南投,集集', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3811, 736449, 2, 736051, '0', '鹿谷鄉', '台灣,南投,鹿谷', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3812, 736522, 2, 736051, '0', '名間鄉', '台灣,南投,名間', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3813, 736622, 2, 736051, '0', '南投市', '台灣,南投,南投市', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3814, 736887, 2, 736051, '0', '埔裡鎮', '台灣,南投,埔裡', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3815, 737266, 2, 736051, '0', '仁愛鄉', '台灣,南投,仁愛', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3816, 737337, 2, 736051, '0', '水裡鄉', '台灣,南投,水裡', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3817, 737496, 2, 736051, '0', '信義鄉', '台灣,南投,信義', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3818, 737533, 2, 736051, '0', '魚池鄉', '台灣,南投,魚池', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3819, 737591, 2, 736051, '0', '中寮鄉', '台灣,南投,中寮', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3820, 737625, 2, 736051, '0', '竹山鎮', '台灣,南投,竹山', '120.830000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3821, 737857, 2, 737856, '0', '東沙群島', '台灣,南海島,東沙群島', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3822, 737859, 2, 737856, '0', '南沙群島', '台灣,南海島,南沙群島', '0.000000', '0.000000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3823, 737862, 2, 737861, '0', '頭屋鄉', '台灣,苗慄,頭屋', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3824, 737894, 2, 737861, '0', '西湖鄉', '台灣,苗慄,西湖', '120.743700', '24.556610', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3825, 737948, 2, 737861, '0', '苑裡鎮', '台灣,苗慄,苑裡', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3826, 738050, 2, 737861, '0', '造橋鄉', '台灣,苗慄,造橋', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3827, 738158, 2, 737861, '0', '竹南鎮', '台灣,苗慄,竹南', '120.872636', '24.685510', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3828, 738454, 2, 737861, '0', '卓蘭鎮', '台灣,苗慄,卓蘭', '120.823440', '24.309510', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3829, 738528, 2, 737861, '0', '大湖鄉', '台灣,苗慄,大湖', '120.863640', '24.422548', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3830, 738619, 2, 737861, '0', '公館鄉', '台灣,苗慄,公館', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3831, 738695, 2, 737861, '0', '後龍鎮', '台灣,苗慄,後龍', '120.786474', '24.612613', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3832, 738882, 2, 737861, '0', '苗慄市', '台灣,苗慄,苗慄市', '120.819288', '24.561582', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3833, 739250, 2, 737861, '0', '南莊鄉', '台灣,苗慄,南莊', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3834, 739302, 2, 737861, '0', '三灣鄉', '台灣,苗慄,三灣', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3835, 739369, 2, 737861, '0', '三義鄉', '台灣,苗慄,三義', '120.765515', '24.413037', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3836, 739419, 2, 737861, '0', '獅潭鄉', '台灣,苗慄,獅潭', '120.918024', '24.540004', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3837, 739465, 2, 737861, '0', '泰安鄉', '台灣,苗慄,泰安', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3838, 739487, 2, 737861, '0', '銅鑼鄉', '台灣,苗慄,銅鑼', '120.786475', '24.489502', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3839, 739564, 2, 737861, '0', '通霄鎮', '台灣,苗慄,通霄', '120.676696', '24.489084', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3840, 739642, 2, 737861, '0', '頭份市', '台灣,苗慄,頭份市', '120.818985', '24.561601', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3841, 739958, 2, 739957, '0', '東區', '台灣,嘉義,東區', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3842, 740140, 2, 739957, '0', '西區', '台灣,嘉義,西區', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3843, 740511, 2, 740510, '0', '阿里山鄉', '台灣,嘉義,阿里山', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3844, 740536, 2, 740510, '0', '布袋鎮', '台灣,嘉義,布袋', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3845, 740625, 2, 740510, '0', '大林鎮', '台灣,嘉義,大林', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3846, 740746, 2, 740510, '0', '大埔鄉', '台灣,嘉義,大埔', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3847, 740792, 2, 740510, '0', '東石鄉', '台灣,嘉義,東石', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3848, 740845, 2, 740510, '0', '番路鄉', '台灣,嘉義,番路', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3849, 740943, 2, 740510, '0', '六腳鄉', '台灣,嘉義,六腳', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3850, 740975, 2, 740510, '0', '鹿草鄉', '台灣,嘉義,鹿草', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3851, 741010, 2, 740510, '0', '梅山鄉', '台灣,嘉義,梅山', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3852, 741137, 2, 740510, '0', '民雄鄉', '台灣,嘉義,民雄', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3853, 741312, 2, 740510, '0', '朴子市', '台灣,嘉義,朴子市', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3854, 741451, 2, 740510, '0', '水上鄉', '台灣,嘉義,水上', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3855, 741550, 2, 740510, '0', '太保市', '台灣,嘉義,太保市', '120.332737', '23.459115', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3856, 741646, 2, 740510, '0', '溪口鄉', '台灣,嘉義,溪口', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3857, 741688, 2, 740510, '0', '新港鄉', '台灣,嘉義,新港', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3858, 741750, 2, 740510, '0', '義竹鄉', '台灣,嘉義,義竹', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3859, 741785, 2, 740510, '0', '中埔鄉', '台灣,嘉義,中埔', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3860, 741936, 2, 740510, '0', '竹崎鄉', '台灣,嘉義,竹崎', '120.452538', '23.481568', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3861, 742127, 2, 742126, '0', '東區', '台灣,新竹,東區', '120.973544', '24.805226', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3862, 742309, 2, 742126, '0', '北區', '台灣,新竹,北區', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3863, 742637, 2, 742636, '0', '峨眉鄉', '台灣,新竹,峨眉', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3864, 742674, 2, 742636, '0', '關西鎮', '台灣,新竹,關西', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3865, 742797, 2, 742636, '0', '橫山鄉', '台灣,新竹,橫山', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3866, 742852, 2, 742636, '0', '湖口鄉', '台灣,新竹,湖口', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3867, 743201, 2, 742636, '0', '尖石鄉', '台灣,新竹,尖石', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3868, 743246, 2, 742636, '0', '芎林鄉', '台灣,新竹,芎林', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3869, 743298, 2, 742636, '0', '五峰鄉', '台灣,新竹,五峰', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3870, 743319, 2, 742636, '0', '新豐鄉', '台灣,新竹,新豐', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3871, 743414, 2, 742636, '0', '新埔鎮', '台灣,新竹,新埔', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3872, 743527, 2, 742636, '0', '竹北市', '台灣,新竹,竹北市', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3873, 743565, 2, 742636, '0', '竹東鎮', '台灣,新竹,竹東', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3874, 743725, 2, 742636, '0', '寶山鄉', '台灣,新竹,寶山', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3875, 743888, 2, 742636, '0', '北埔鄉', '台灣,新竹,北埔', '120.968798', '24.806738', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3876, 743939, 2, 743938, '0', '卓溪鄉', '台灣,花蓮,卓溪', '121.301890', '23.344908', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3877, 743956, 2, 743938, '0', '豐濱鄉', '台灣,花蓮,豐濱', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3878, 743993, 2, 743938, '0', '鳳林鎮', '台灣,花蓮,鳳林', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3879, 744128, 2, 743938, '0', '富裡鄉', '台灣,花蓮,富裡', '121.244694', '23.175468', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3880, 744185, 2, 743938, '0', '光復鄉', '台灣,花蓮,光復', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3881, 744246, 2, 743938, '0', '花蓮市', '台灣,花蓮,花蓮市', '121.606927', '23.981993', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3882, 744625, 2, 743938, '0', '吉安鄉', '台灣,花蓮,吉安', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3883, 745050, 2, 743938, '0', '瑞穗鄉', '台灣,花蓮,瑞穗', '121.373373', '23.496080', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3884, 745196, 2, 743938, '0', '壽豐鄉', '台灣,花蓮,壽豐', '121.506030', '23.869774', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3885, 745354, 2, 743938, '0', '萬榮鄉', '台灣,花蓮,萬榮', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3886, 745363, 2, 743938, '0', '新城鄉', '台灣,花蓮,新城', '121.604120', '24.039243', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3887, 745486, 2, 743938, '0', '秀林鄉', '台灣,花蓮,秀林', '121.300000', '23.830000', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3888, 745532, 2, 743938, '0', '玉裡鎮', '台灣,花蓮,玉裡', '121.312109', '23.334236', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3889, 745675, 2, 745674, '0', '阿蓮區', '台灣,高雄,阿蓮區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3890, 745715, 2, 745674, '0', '大寮區', '台灣,高雄,大寮區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3891, 746083, 2, 745674, '0', '大社區', '台灣,高雄,大社區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3892, 746199, 2, 745674, '0', '大樹區', '台灣,高雄,大樹區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3893, 746294, 2, 745674, '0', '鳳山區', '台灣,高雄,鳳山區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3894, 746624, 2, 745674, '0', '岡山區', '台灣,高雄,岡山區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3895, 746906, 2, 745674, '0', '鼓山區', '台灣,高雄,鼓山區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3896, 747053, 2, 745674, '0', '湖內區', '台灣,高雄,湖內區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3897, 747108, 2, 745674, '0', '甲仙區', '台灣,高雄,甲仙區', '120.587980', '23.083957', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3898, 747150, 2, 745674, '0', '苓雅區', '台灣,高雄,苓雅區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3899, 747342, 2, 745674, '0', '林園區', '台灣,高雄,林園區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3900, 747481, 2, 745674, '0', '六龜區', '台灣,高雄,六龜區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3901, 747536, 2, 745674, '0', '路竹區', '台灣,高雄,路竹區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3902, 747643, 2, 745674, '0', '茂林區', '台灣,高雄,茂林區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3903, 747647, 2, 745674, '0', '美濃區', '台灣,高雄,美濃區', '120.542419', '22.894882', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3904, 747764, 2, 745674, '0', '彌陀區', '台灣,高雄,彌陀區', '120.250672', '22.781561', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3905, 747894, 2, 745674, '0', '那瑪夏區', '台灣,高雄,那瑪夏區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3906, 747902, 2, 745674, '0', '楠梓區', '台灣,高雄,楠梓區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3907, 748258, 2, 745674, '0', '內門區', '台灣,高雄,內門區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3908, 748344, 2, 745674, '0', '鳥松區', '台灣,高雄,鳥松區', '120.311922', '22.620856', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3909, 748554, 2, 748553, '0', '安樂區', '台灣,基隆,安樂區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3910, 748581, 2, 748553, '0', '暖暖區', '台灣,基隆,暖暖區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3911, 748599, 2, 748553, '0', '七堵區', '台灣,基隆,七堵區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3912, 748670, 2, 748553, '0', '仁愛區', '台灣,基隆,仁愛區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3913, 748716, 2, 748553, '0', '信義區', '台灣,基隆,信義區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3914, 748920, 2, 748553, '0', '中山區', '台灣,基隆,中山區', '121.746248', '25.130741', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3915, 749226, 2, 748553, '0', '中正區', '台灣,基隆,中正區', '121.768000', '25.151647', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3916, 749572, 2, 749571, '0', '金城鎮', '台灣,金門,金城', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3917, 749647, 2, 749571, '0', '金湖鎮', '台灣,金門,金湖', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3918, 749752, 2, 749571, '0', '金寧鄉', '台灣,金門,金寧', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3919, 749810, 2, 749571, '0', '金沙鎮', '台灣,金門,金沙', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3920, 749894, 2, 749571, '0', '烈嶼鄉', '台灣,金門,烈嶼', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3921, 749928, 2, 749571, '0', '烏坵鄉', '台灣,金門,烏坵', '118.317089', '24.432706', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3922, 749931, 2, 749930, '0', '北竿鄉', '台灣,連江,北竿', '119.539704', '26.197364', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3923, 749938, 2, 749930, '0', '東引鄉', '台灣,連江,東引', '119.539704', '26.197364', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3924, 749941, 2, 749930, '0', '莒光鄉', '台灣,連江,莒光', '119.539704', '26.197364', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3925, 749947, 2, 749930, '0', '南竿鄉', '台灣,連江,南竿', '119.539704', '26.197364', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3926, 749958, 2, 749957, '0', '褒忠鄉', '台灣,雲林,褒忠', '120.309069', '23.695652', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3927, 749991, 2, 749957, '0', '北港鎮', '台灣,雲林,北港', '120.296759', '23.572428', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3928, 750170, 2, 749957, '0', '莿桐鄉', '台灣,雲林,莿桐', '120.497033', '23.757251', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3929, 750218, 2, 749957, '0', '大埤鄉', '台灣,雲林,大埤', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3930, 750291, 2, 749957, '0', '東勢鄉', '台灣,雲林,東勢', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3931, 750363, 2, 749957, '0', '鬥六市', '台灣,雲林,鬥六市', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3932, 750795, 2, 749957, '0', '鬥南鎮', '台灣,雲林,鬥南', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3933, 751009, 2, 749957, '0', '二崙鄉', '台灣,雲林,二崙', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3934, 751071, 2, 749957, '0', '古坑鄉', '台灣,雲林,古坑', '120.558553', '23.644734', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3935, 751147, 2, 749957, '0', '虎尾鎮', '台灣,雲林,虎尾', '120.429231', '23.707796', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3936, 751400, 2, 749957, '0', '口湖鄉', '台灣,雲林,口湖', '120.178640', '23.585506', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3937, 751493, 2, 749957, '0', '林內鄉', '台灣,雲林,林內', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3938, 751555, 2, 749957, '0', '崙背鄉', '台灣,雲林,崙背', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3939, 751674, 2, 749957, '0', '麥寮鄉', '台灣,雲林,麥寮', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3940, 751764, 2, 749957, '0', '水林鄉', '台灣,雲林,水林', '120.241228', '23.571067', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3941, 751832, 2, 749957, '0', '四湖鄉', '台灣,雲林,四湖', '120.220781', '23.635426', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3942, 751907, 2, 749957, '0', '臺西鄉', '台灣,雲林,臺西', '120.196139', '23.702821', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3943, 751956, 2, 749957, '0', '土庫鎮', '台灣,雲林,土庫', '120.527173', '23.696887', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3944, 752034, 2, 749957, '0', '西螺鎮', '台灣,雲林,西螺', '120.457123', '23.797412', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
INSERT INTO `eb_system_city` VALUES (3945, 752149, 2, 749957, '0', '元長鄉', '台灣,雲林,元長', '120.311052', '23.649577', 1, '2021-07-16 11:33:35', '2021-07-16 11:33:35');
-- ----------------------------
-- Table structure for eb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config`;
CREATE TABLE `eb_system_config`  (
                                     `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
                                     `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字段名稱',
                                     `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字段提示文字',
                                     `form_id` int(10) NULL DEFAULT 0 COMMENT '表單id',
                                     `value` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '值',
                                     `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否隱藏',
                                     `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                     `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `status+name`(`name`) USING BTREE,
                                     INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5615 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_config
-- ----------------------------
INSERT INTO `eb_system_config` VALUES (177, 'close_system', '', 0, '0', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (195, 'store_postage', '', 0, '0', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (202, 'main_business', '', 0, ' IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (203, 'vice_business', '', 0, 'IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 ', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (204, 'store_brokerage_rate_1', '', 0, '80', 0, '2020-05-14 15:20:25', '2020-07-14 16:44:50');
INSERT INTO `eb_system_config` VALUES (205, 'user_extract_min_price', '', 0, '0', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (206, 'sx_sign_min_int', '', 0, '1', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (207, 'sx_sign_max_int', '', 0, '5', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (208, 'about_us', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (218, 'store_brokerage_rate_2', '', 0, '60', 0, '2020-05-14 15:20:25', '2020-07-14 16:44:54');
INSERT INTO `eb_system_config` VALUES (219, 'store_brokerage_status', 'store_brokerage_status', 0, '1', 0, '2020-05-14 15:20:25', '2020-08-05 17:42:38');
INSERT INTO `eb_system_config` VALUES (227, 'user_extract_bank', '', 0, '中國銀行', 0, '2020-05-14 15:20:25', '2020-06-09 17:43:00');
INSERT INTO `eb_system_config` VALUES (228, 'fast_number', '', 0, '10', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (229, 'bast_number', '', 0, '10', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (230, 'first_number', '', 0, '10', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (234, 'accessKey', '', 0, 'AKIDylJg18LnK', 0, '2020-05-14 15:20:25', '2020-06-03 17:20:54');
INSERT INTO `eb_system_config` VALUES (235, 'secretKey', '', 0, 'SebIWXNxtpTs3', 0, '2020-05-14 15:20:25', '2020-06-03 17:21:02');
INSERT INTO `eb_system_config` VALUES (236, 'storage_name', '', 0, 'wuht-13009', 0, '2020-05-14 15:20:25', '2020-06-03 17:21:18');
INSERT INTO `eb_system_config` VALUES (239, 'order_bargain_time', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (240, 'order_seckill_time', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (241, 'order_pink_time', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (242, 'storage_region', '', 0, 'ap-chengdu', 0, '2020-05-14 15:20:25', '2020-06-03 17:37:19');
INSERT INTO `eb_system_config` VALUES (245, 'system_delivery_time', '', 0, '1', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (254, 'cache_config', '', 0, '00', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (256, 'develop_id', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (257, 'printing_api_key', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (258, 'printing_client_id', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (259, 'terminal_number', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (262, 'confirmTakeOverSwitch', '', 0, '0', 0, '2020-05-14 15:20:25', '2020-06-17 09:34:31');
INSERT INTO `eb_system_config` VALUES (267, 'new_goods_bananr', '', 0, '', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (269, 'extract_time', '', 0, '1', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (270, 'store_brokerage_price', '', 0, '1', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (272, 'promotion_number', '', 0, '3', 0, '2020-05-14 15:20:25', '2020-05-14 16:37:47');
INSERT INTO `eb_system_config` VALUES (278, 'form-1', '', 0, '{\n    \"id\": 278,\n    \"item\": [\n        {\n            \"name\": \"form-1-name\",\n            \"value\": \"form-1-value\"\n        },\n        {\n            \"name\": \"form-1-name1\",\n            \"value\": \"form-1-value1\"\n        }\n    ]\n}', 0, '2020-05-14 16:57:27', '2020-05-14 17:07:04');
INSERT INTO `eb_system_config` VALUES (645, 'importProductTB', '', 0, 'https://api03.6bqb.com/taobao/detail', 0, '2020-06-05 14:35:08', '2020-09-08 12:15:01');
INSERT INTO `eb_system_config` VALUES (646, 'importProductJD', '', 0, 'https://api03.6bqb.com/jd/detail', 0, '2020-06-05 14:35:34', '2020-09-08 12:15:08');
INSERT INTO `eb_system_config` VALUES (647, 'importProductSN', '', 0, 'https://api03.6bqb.com/suning/detail', 0, '2020-06-05 14:35:41', '2020-09-08 12:14:59');
INSERT INTO `eb_system_config` VALUES (648, 'importProductPDD', '', 0, 'https://api03.6bqb.com/pdd/detail', 0, '2020-06-05 14:36:20', '2020-09-08 12:15:04');
INSERT INTO `eb_system_config` VALUES (649, 'importProductTM', '', 0, 'https://api03.6bqb.com/tmall/detail', 0, '2020-06-09 14:24:32', '2020-09-08 12:14:57');
INSERT INTO `eb_system_config` VALUES (657, 'sms_account', '', 0, 't', 0, '2020-06-16 12:17:29', '2020-12-23 17:16:10');
INSERT INTO `eb_system_config` VALUES (658, 'sms_token', '', 0, 'adm', 0, '2020-06-16 12:17:35', '2020-12-23 17:16:09');
INSERT INTO `eb_system_config` VALUES (844, 'qnUploadUrl', 'qnUploadUrl', 82, 'https://xx.com', 0, '2020-06-19 11:50:29', '2020-06-19 11:50:29');
INSERT INTO `eb_system_config` VALUES (845, 'qnAccessKey', 'qnAccessKey', 82, '2CdCKYsRc', 0, '2020-06-19 11:50:29', '2020-06-19 11:50:29');
INSERT INTO `eb_system_config` VALUES (846, 'qnSecretKey', 'qnSecretKey', 82, 'PRUPTTIuV', 0, '2020-06-19 11:50:29', '2020-06-19 11:50:29');
INSERT INTO `eb_system_config` VALUES (847, 'qnStorageName', 'qnStorage134123Name', 82, 'w3', 0, '2020-06-19 11:50:29', '2020-06-19 11:50:29');
INSERT INTO `eb_system_config` VALUES (848, 'qnStorageRegion', 'qnStorageRegion', 82, 'qini', 0, '2020-06-19 11:50:30', '2020-06-19 11:50:30');
INSERT INTO `eb_system_config` VALUES (988, 'integralRatio', 'integralRatio', 0, '0', 0, '2020-07-08 15:21:59', '2020-08-10 21:27:45');
INSERT INTO `eb_system_config` VALUES (989, 'balance_func_status', 'balance_func_status', 0, '1', 0, '2020-07-09 10:09:33', '2020-07-14 19:02:16');
INSERT INTO `eb_system_config` VALUES (991, 'brokerage_func_status', 'brokerage_func_status', 0, '1', 0, '2020-07-21 10:42:36', '2020-07-21 10:42:36');
INSERT INTO `eb_system_config` VALUES (992, 'store_brokerage_ratio', 'store_brokerage_ratio', 0, '20', 0, '2020-07-21 10:45:10', '2020-12-18 11:34:26');
INSERT INTO `eb_system_config` VALUES (993, 'store_brokerage_two', 'store_brokerage_two', 0, '10', 0, '2020-07-21 10:45:41', '2020-07-21 10:45:41');
INSERT INTO `eb_system_config` VALUES (994, 'brokerage_bindind', 'brokerage_bindind', 0, '1', 0, '2020-07-21 15:29:25', '2020-07-21 15:29:25');
INSERT INTO `eb_system_config` VALUES (1167, 'txUploadUrl', 'txUploadUrl', 83, 'https://wuh.com', 0, '2020-08-10 11:05:59', '2020-08-10 11:05:59');
INSERT INTO `eb_system_config` VALUES (1168, 'txAccessKey', 'txAccessKey', 83, 'AKIDylJg18L', 0, '2020-08-10 11:05:59', '2020-08-10 11:05:59');
INSERT INTO `eb_system_config` VALUES (1169, 'txSecretKey', 'txSecretKey', 83, 'SebIWXNxtpT', 0, '2020-08-10 11:05:59', '2020-08-10 11:05:59');
INSERT INTO `eb_system_config` VALUES (1170, 'txStorageName', 'txStorageName', 83, 'wu', 0, '2020-08-10 11:05:59', '2020-08-10 11:05:59');
INSERT INTO `eb_system_config` VALUES (1171, 'txStorageRegion', 'txStorageRegion', 83, 'ap', 0, '2020-08-10 11:05:59', '2020-08-10 11:05:59');
INSERT INTO `eb_system_config` VALUES (1467, 'field102', 'field102', 75, '1', 0, '2020-08-12 11:31:45', '2020-08-12 11:31:45');
INSERT INTO `eb_system_config` VALUES (1468, 'field103', 'field103', 75, '1', 0, '2020-08-12 11:31:45', '2020-08-12 11:31:45');
INSERT INTO `eb_system_config` VALUES (1469, 'field104', 'field104', 75, '1', 0, '2020-08-12 11:31:45', '2020-08-12 11:31:45');
INSERT INTO `eb_system_config` VALUES (1470, 'field105', 'field105', 75, '1', 0, '2020-08-12 11:31:45', '2020-08-12 11:31:45');
INSERT INTO `eb_system_config` VALUES (1775, 'field101', 'field101', 118, '[{\"attId\":2829,\"name\":\"233119quyrec7to3ws3rco.jpg\",\"attDir\":\"/www/wwwroot/api.java.crmeb.net/image/operation/2020/08/17/8d87f9a5b10c4e21a368ea334def8a81em2naxhpwb.jpg\",\"sattDir\":\"image/operation/2020/08/17/8d87f9a5b10c4e21a368ea334def8a81em2naxhpwb.jpg\",\"attSize\":\"367760\",\"attType\":\"jpeg\",\"pid\":0,\"imageType\":4,\"createTime\":\"2020-08-17 10:08:35\",\"updateTime\":\"2020-08-17 10:08:40\",\"localImg\":\"\",\"isSelect\":true},{\"attId\":2819,\"name\":\"timg.jpg\",\"attDir\":\"/www/wwwroot/api.java.crmeb.net/image/store/2020/08/15/adae23e354114cd5bd8f3cae740741c23opxeh8kw2.jpg\",\"sattDir\":\"image/store/2020/08/15/adae23e354114cd5bd8f3cae740741c23opxeh8kw2.jpg\",\"attSize\":\"26852\",\"attType\":\"jpeg\",\"pid\":0,\"imageType\":4,\"createTime\":\"2020-08-15 09:26:55\",\"updateTime\":\"2020-08-15 09:26:58\",\"isSelect\":true},{\"attId\":2801,\"name\":\"O1CN01PRg4nV29zFminzdOU_!!1714128138.jpg_430x430q90.jpg\",\"attDir\":\"/www/wwwroot/api.java.crmeb.net/image/content/2020/08/14/48644350a8de49cabac344d5f8a96a673uixxoj8g6.jpg\",\"sattDir\":\"image/content/2020/08/14/48644350a8de49cabac344d5f8a96a673uixxoj8g6.jpg\",\"attSize\":\"17428\",\"attType\":\"jpeg\",\"pid\":0,\"imageType\":4,\"createTime\":\"2020-08-14 14:28:10\",\"updateTime\":\"2020-08-14 14:28:13\",\"isSelect\":true}]', 0, '2020-08-17 10:29:36', '2020-08-17 10:29:36');
INSERT INTO `eb_system_config` VALUES (2189, 'field112', 'field112', 63, '999', 0, '2020-09-08 19:37:47', '2020-09-08 19:37:47');
INSERT INTO `eb_system_config` VALUES (2190, 'field114', 'field114', 63, '100', 0, '2020-09-08 19:37:47', '2020-09-08 19:37:47');
INSERT INTO `eb_system_config` VALUES (2191, 'op', 'op', 63, '2', 0, '2020-09-08 19:37:47', '2020-09-08 19:37:47');
INSERT INTO `eb_system_config` VALUES (2192, 'field102', 'field102', 63, '2', 0, '2020-09-08 19:37:47', '2020-09-08 19:37:47');
INSERT INTO `eb_system_config` VALUES (2193, 'yunzhifu_appId', 'yunzhifu_appId', 121, 'wx7', 0, '2020-09-09 15:03:17', '2020-09-09 15:03:17');
INSERT INTO `eb_system_config` VALUES (2194, 'yunzhifu_sign', 'yunzhifu_sign', 121, '7fbd8', 0, '2020-09-09 15:03:17', '2020-09-09 15:03:17');
INSERT INTO `eb_system_config` VALUES (2335, 'stt', 'stt', 112, '1', 0, '2020-09-17 11:12:01', '2020-09-17 11:12:01');
INSERT INTO `eb_system_config` VALUES (2336, 'dd', 'dd', 112, '1', 0, '2020-09-17 11:12:01', '2020-09-17 11:12:01');
INSERT INTO `eb_system_config` VALUES (3111, 'yzf_h5_url', 'yzf_h5_url', 76, 'https://yzf.', 0, '2020-12-07 16:19:00', '2020-12-07 16:19:00');
INSERT INTO `eb_system_config` VALUES (3172, 'config_export_temp_id', 'config_export_temp_id', 0, '42bd2', 0, '2020-12-10 14:50:34', '2020-12-17 14:49:31');
INSERT INTO `eb_system_config` VALUES (3173, 'config_export_id', 'config_export_id', 0, '1', 0, '2020-12-10 14:50:45', '2020-12-17 14:49:31');
INSERT INTO `eb_system_config` VALUES (3174, 'config_export_com', 'config_export_com', 0, 'yuant', 0, '2020-12-10 14:52:57', '2020-12-17 14:49:31');
INSERT INTO `eb_system_config` VALUES (3396, 'importProductToken', 'importProductToken', 122, '3DB', 0, '2020-12-22 16:11:25', '2020-12-22 16:11:25');
INSERT INTO `eb_system_config` VALUES (4053, 'config_export_open', 'config_export_open', 129, '1', 0, '2021-02-04 11:21:21', '2021-02-04 11:21:21');
INSERT INTO `eb_system_config` VALUES (4054, 'config_export_to_name', 'config_export_to_name', 129, '王大蛋', 0, '2021-02-04 11:21:21', '2021-02-04 11:21:21');
INSERT INTO `eb_system_config` VALUES (4055, 'config_export_to_tel', 'config_export_to_tel', 129, '1871038', 0, '2021-02-04 11:21:21', '2021-02-04 11:21:21');
INSERT INTO `eb_system_config` VALUES (4056, 'config_export_to_address', 'config_export_to_address', 129, '新區', 0, '2021-02-04 11:21:21', '2021-02-04 11:21:21');
INSERT INTO `eb_system_config` VALUES (4057, 'config_export_siid', 'config_export_siid', 129, 'K', 0, '2021-02-04 11:21:21', '2021-02-04 11:21:21');
INSERT INTO `eb_system_config` VALUES (4288, 'alUploadUrl', 'alUploadUrl', 81, 'https://wu.com', 0, '2021-02-07 11:58:03', '2021-02-07 11:58:03');
INSERT INTO `eb_system_config` VALUES (4289, 'alAccessKey', 'alAccessKey', 81, '3123', 0, '2021-02-07 11:58:03', '2021-02-07 11:58:03');
INSERT INTO `eb_system_config` VALUES (4290, 'alSecretKey', 'alSecretKey', 81, 'rGSz', 0, '2021-02-07 11:58:03', '2021-02-07 11:58:03');
INSERT INTO `eb_system_config` VALUES (4291, 'alStorageName', 'alStorageName', 81, 'wu', 0, '2021-02-07 11:58:03', '2021-02-07 11:58:03');
INSERT INTO `eb_system_config` VALUES (4292, 'alStorageRegion', 'alStorageRegion', 81, 'os', 0, '2021-02-07 11:58:03', '2021-02-07 11:58:03');
INSERT INTO `eb_system_config` VALUES (4410, 'bastInfo', 'bastInfo', 133, 'asda sd', 0, '2021-02-23 14:58:53', '2021-02-23 14:58:53');
INSERT INTO `eb_system_config` VALUES (4411, 'firstInfo', 'firstInfo', 133, '1', 0, '2021-02-23 14:58:53', '2021-02-23 14:58:53');
INSERT INTO `eb_system_config` VALUES (4412, 'salesInfo', 'salesInfo', 133, '1', 0, '2021-02-23 14:58:53', '2021-02-23 14:58:53');
INSERT INTO `eb_system_config` VALUES (4413, 'hotInfo', 'hotInfo', 133, '1', 0, '2021-02-23 14:58:53', '2021-02-23 14:58:53');
INSERT INTO `eb_system_config` VALUES (4432, 'offline_pay_status', 'offline_pay_status', 79, '0', 0, '2021-02-24 11:13:52', '2021-02-24 11:13:52');
INSERT INTO `eb_system_config` VALUES (5077, 'yue_pay_status', 'yue_pay_status', 80, '1', 0, '2021-03-19 16:27:33', '2021-03-19 16:27:33');
INSERT INTO `eb_system_config` VALUES (5102, 'store_free_postage_switch', 'store_free_postage_switch', 74, 'false', 0, '2021-03-19 16:31:04', '2021-03-19 16:31:04');
INSERT INTO `eb_system_config` VALUES (5103, 'store_free_postage', 'store_free_postage', 74, '699', 0, '2021-03-19 16:31:04', '2021-03-19 16:31:04');
INSERT INTO `eb_system_config` VALUES (5104, 'tengxun_map_key', 'tengxun_map_key', 74, 'SM-XWFX7', 0, '2021-03-19 16:31:04', '2021-03-19 16:31:04');
INSERT INTO `eb_system_config` VALUES (5105, 'store_self_mention', 'store_self_mention', 74, 'true', 0, '2021-03-19 16:31:04', '2021-03-19 16:31:04');
INSERT INTO `eb_system_config` VALUES (5298, 'wechat_app_appid', 'wechat_app_appid', 134, 'wxa', 0, '2021-03-24 16:21:36', '2021-03-24 16:21:36');
INSERT INTO `eb_system_config` VALUES (5299, 'wechat_app_appsecret', 'wechat_app_appsecret', 134, 'e1', 0, '2021-03-24 16:21:36', '2021-03-24 16:21:36');
INSERT INTO `eb_system_config` VALUES (5372, 'lowerOrderSwitch', 'lowerOrderSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5373, 'deliverGoodsSwitch', 'deliverGoodsSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5374, 'priceRevisionSwitch', 'priceRevisionSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5375, 'sms_code_expire', 'sms_code_expire', 111, '5', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5376, 'adminLowerOrderSwitch', 'adminLowerOrderSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5377, 'adminPaySuccessSwitch', 'adminPaySuccessSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5378, 'adminConfirmTakeOverSwitch', 'adminConfirmTakeOverSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5379, 'adminRefundSwitch', 'adminRefundSwitch', 111, '0', 0, '2021-03-24 16:24:32', '2021-03-24 16:24:32');
INSERT INTO `eb_system_config` VALUES (5487, 'wechat_appid', 'wechat_appid', 65, 'wx1b9', 0, '2021-04-28 18:15:18', '2021-05-17 18:26:54');
INSERT INTO `eb_system_config` VALUES (5488, 'wechat_appsecret', 'wechat_appsecret', 65, '3e29', 0, '2021-04-28 18:15:18', '2021-05-17 18:27:00');
INSERT INTO `eb_system_config` VALUES (5489, 'field101', 'field101', 65, 'crmebJava', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5490, 'field103', 'field103', 65, 'bnoKBzDNXlbS1vG', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5491, 'field104', 'field104', 65, '1', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5492, 'wechat_share_img', 'wechat_share_img', 65, 'crmebimage/operation/2021/02/25/1044da7cb6544c978f9c95fde324cbb4zxg8iby21b.png', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5493, 'wechat_qrcode', 'wechat_qrcode', 65, 'crmebimage/operation/2021/02/25/bf74edf7106544f1a7893a2796ce4260uaeyzinl3h.png', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5494, 'wechat_share_title', 'wechat_share_title', 65, 'CRMEB_Java', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5495, 'wechat_share_synopsis', 'wechat_share_synopsis', 65, 'CRMEB-Java商業版v1.3.2震撼發布！', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5496, 'h5_avatar', 'h5_avatar', 65, 'crmebimage/operation/2021/02/25/7aa0a3fe4b26440f8c10a5a27ec55502u39xni4dsr.png', 0, '2021-04-28 18:15:18', '2021-04-28 18:15:18');
INSERT INTO `eb_system_config` VALUES (5528, 'pay_weixin_app_appid', 'pay_weixin_app_appid', 135, 'wx', 0, '2021-05-08 16:07:33', '2021-05-08 16:07:33');
INSERT INTO `eb_system_config` VALUES (5529, 'pay_weixin_app_key', 'pay_weixin_app_key', 135, 'cd94c0', 0, '2021-05-08 16:07:33', '2021-05-08 16:07:33');
INSERT INTO `eb_system_config` VALUES (5530, 'pay_weixin_app_mchid', 'pay_weixin_app_mchid', 135, '15', 0, '2021-05-08 16:07:33', '2021-05-08 16:07:33');
INSERT INTO `eb_system_config` VALUES (5531, 'pay_mini_app_client_p12', 'pay_mini_app_client_p12', 135, 'file/xx.p12', 0, '2021-05-08 16:07:33', '2021-05-08 16:07:33');
INSERT INTO `eb_system_config` VALUES (5532, 'pay_weixin_app_certificate_path', 'pay_weixin_app_certificate_path', 135, '/www/wwwroot/api.beta.java.crmeb.net/xx.p12', 0, '2021-05-08 16:07:33', '2021-05-08 16:07:33');
INSERT INTO `eb_system_config` VALUES (5536, 'pay_routine_appid', 'pay_routine_appid', 68, 'wx', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5537, 'pay_routine_appsecret', 'pay_routine_appsecret', 68, '3e', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5538, 'pay_routine_mchid', 'pay_routine_mchid', 68, '151', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5539, 'pay_routine_key', 'pay_routine_key', 68, 'cd94c0b', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5540, 'pay_mini_client_p12', 'pay_mini_client_p12', 68, 'file/xx.p12', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5541, 'pay_routine_certificate_path', 'pay_routine_certificate_path', 68, '/www/xx.p12', 0, '2021-05-08 16:56:11', '2021-05-08 16:56:11');
INSERT INTO `eb_system_config` VALUES (5547, 'system_product_copy_type', 'system_product_copy_type', 127, '1', 0, '2021-05-12 09:50:46', '2021-05-12 09:50:46');
INSERT INTO `eb_system_config` VALUES (5548, 'copy_product_apikey', 'copy_product_apikey', 127, '3DB8A3A', 0, '2021-05-12 09:50:46', '2021-05-12 09:50:46');
INSERT INTO `eb_system_config` VALUES (5549, 'logistics_type', 'logistics_type', 128, '1', 0, '2021-05-12 14:54:57', '2021-05-12 14:54:57');
INSERT INTO `eb_system_config` VALUES (5550, 'system_express_app_code', 'system_express_app_code', 128, '123123123123', 0, '2021-05-12 14:54:57', '2021-05-12 14:54:57');
INSERT INTO `eb_system_config` VALUES (5551, 'pay_weixin_appid', 'pay_weixin_appid', 67, 'wx', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5552, 'pay_weixin_appsecret', 'pay_weixin_appsecret', 67, '5a', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5553, 'pay_weixin_mchid', 'pay_weixin_mchid', 67, '151', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5554, 'pay_routine_client_p12', 'pay_routine_client_p12', 67, 'file/xx.p12', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5555, 'pay_weixin_certificate_path', 'pay_weixin_certificate_path', 67, '/www/xx.p12', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5556, 'pay_weixin_key', 'pay_weixin_key', 67, 'cd94c0', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5557, 'pay_weixin_open', 'pay_weixin_open', 67, '1', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5558, 'paydir', 'paydir', 67, '1111', 0, '2021-05-12 17:39:52', '2021-05-12 17:39:52');
INSERT INTO `eb_system_config` VALUES (5559, 'replenishment_num', 'replenishment_num', 77, '20', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5560, 'store_stock', 'store_stock', 77, '11', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5561, 'stor_reason', 'stor_reason', 77, '收貨地址填錯了\n與描述不符 \n信息填錯了，重新拍 \n收到商品損壞了 \n未按預定時間發貨 \n其它原因\n測試111', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5562, 'mobile_top_logo', 'mobile_top_logo', 77, 'crmebimage/operation/2021/03/18/c5b8fe78a21b45d49dfbd406244b407ai71zxyf2vn.png', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5563, 'order_cancel_time', 'order_cancel_time', 77, '1', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5564, 'order_activity_time', 'order_activity_time', 77, '1', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5565, 'vip_open', 'vip_open', 77, '1', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5566, 'new_order_audio_link', 'new_order_audio_link', 77, 'file/operation/2021/02/23/c26ecb9efd49487cb1e54e04a51492e4wafest96s8.mp3', 0, '2021-05-13 10:04:48', '2021-05-13 10:04:48');
INSERT INTO `eb_system_config` VALUES (5570, 'integral_ratio', 'integral_ratio', 109, '0.5', 0, '2021-05-13 15:35:18', '2021-05-13 15:35:18');
INSERT INTO `eb_system_config` VALUES (5571, 'order_give_integral', 'order_give_integral', 109, '1', 0, '2021-05-13 15:35:18', '2021-05-13 15:35:18');
INSERT INTO `eb_system_config` VALUES (5572, 'freeze_integral_day', 'freeze_integral_day', 109, '1', 0, '2021-05-13 15:35:18', '2021-05-13 15:35:18');
INSERT INTO `eb_system_config` VALUES (5582, 'store_user_min_recharge', 'store_user_min_recharge', 78, '0.01', 0, '2021-05-14 16:40:18', '2021-05-14 16:40:18');
INSERT INTO `eb_system_config` VALUES (5583, 'recharge_switch', 'recharge_switch', 78, 'true', 0, '2021-05-14 16:40:18', '2021-05-14 16:40:18');
INSERT INTO `eb_system_config` VALUES (5584, 'recharge_attention', 'recharge_attention', 78, '1、充值金額最少為100\n2、充值後只能用於消費\n3、提現金額需要手續費3%\n4、提現到賬需要2~3天時間\n5、案件十大還是卡是今安徽省空間哈薩克就殺', 0, '2021-05-14 16:40:18', '2021-05-14 16:40:18');
INSERT INTO `eb_system_config` VALUES (5585, 'site_name', 'site_name', 64, 'CRMEB_JAVA', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5586, 'site_url', 'site_url', 64, 'https://app.beta.java.crmeb.net', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5587, 'api_url', 'api_url', 64, 'https://api.beta.java.crmeb.net', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5588, 'site_logo_lefttop', 'site_logo_lefttop', 64, 'crmebimage/operation/2021/03/18/d812528dfcc34fca84c2f9344c0c570eq4btvh1234.png', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5589, 'site_logo_square', 'site_logo_square', 64, 'crmebimage/operation/2021/03/18/3fa25d6e6dac4d5d85c4abf3af168185n1ozehifuw.png', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5590, 'site_logo_login', 'site_logo_login', 64, 'crmebimage/operation/2021/03/18/c5b8fe78a21b45d49dfbd406244b407ai71zxyf2vn.png', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5591, 'admin_login_bg_pic', 'admin_login_bg_pic', 64, 'crmebimage/operation/2021/03/18/019e7a89c5dd4b4d9aa8a35be7bfeb5fgnjuqtdbtk.jpg', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5592, 'mobile_login_logo', 'mobile_login_logo', 64, 'crmebimage/operation/2021/02/25/7aa0a3fe4b26440f8c10a5a27ec55502u39xni4dsr.png', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5593, 'seo_title', 'seo_title', 64, 'CRMEBSEO', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5594, 'news_slides_limit', 'news_slides_limit', 64, '3', 0, '2021-05-14 17:44:42', '2021-05-14 17:44:42');
INSERT INTO `eb_system_config` VALUES (5598, 'routine_appid', 'routine_appid', 66, 'wx1b9', 0, '2021-05-21 12:02:20', '2021-05-21 12:02:20');
INSERT INTO `eb_system_config` VALUES (5599, 'routine_appsecret', 'routine_appsecret', 66, '3e29', 0, '2021-05-21 12:02:20', '2021-05-21 12:02:20');
INSERT INTO `eb_system_config` VALUES (5600, 'routine_name', 'routine_name', 66, '一碼秦川', 0, '2021-05-21 12:02:20', '2021-05-21 12:02:20');
INSERT INTO `eb_system_config` VALUES (5608, 'localUploadUrl', 'localUploadUrl', 108, 'https://xxx.crmeb.cn', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5609, 'upload_root_path', 'upload_root_path', 108, '/www/ww/', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5610, 'image_ext_str', 'image_ext_str', 108, 'jpg,jpeg,gif,png,bmp,PNG,JPG', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5611, 'image_max_size', 'image_max_size', 108, '3', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5612, 'file_ext_str', 'file_ext_str', 108, 'zip,doc,docx,xls,xlsx,pdf,mp3,wma,wav,amr,mp4,pem,p12', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5613, 'file_max_size', 'file_max_size', 108, '20', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');
INSERT INTO `eb_system_config` VALUES (5614, 'uploadType', 'uploadType', 108, '1', 0, '2021-06-11 14:57:11', '2021-06-11 14:57:11');

-- ----------------------------
-- Table structure for eb_system_form_temp
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_form_temp`;
CREATE TABLE `eb_system_form_temp`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表單模板id',
                                        `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表單名稱',
                                        `info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表單簡介',
                                        `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表單內容',
                                        `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                        `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表單模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_form_temp
-- ----------------------------
INSERT INTO `eb_system_form_temp` VALUES (63, 'string', 'stringEdited', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"年收入\",\"labelWidth\":\"\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":112,\"renderKey\":1589768825139,\"defaultValue\":999},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入年收入\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field112\"},{\"__config__\":{\"label\":\"test1\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":114,\"renderKey\":1589857300162},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入test1\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field114\"},{\"__config__\":{\"label\":\"下拉選擇\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":101,\"renderKey\":1599553667384,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":1},{\"label\":\"選項二\",\"value\":2}]},\"placeholder\":\"請選擇下拉選擇\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":false,\"multiple\":false,\"__vModel__\":\"op\"},{\"__config__\":{\"label\":\"單選框組\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":102,\"renderKey\":1599564804814,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":1},{\"label\":\"選項二\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field102\"}]}', '2020-05-15 17:19:17', '2020-09-08 19:35:38');
INSERT INTO `eb_system_form_temp` VALUES (64, '基礎配置', '系統設置-基礎配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":300,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"網站名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":126,\"renderKey\":1595658466046},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入網站名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"site_name\"},{\"__config__\":{\"label\":\"網站地址\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":111,\"renderKey\":1597048570961},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"site_url\",\"placeholder\":\"webSiet網站地址網站地址\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"Api地址【支付回調】\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"api_url\",\"placeholder\":\"webSiet網站地址Api地址【支付回調】\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"主頁左上角logo[後台]\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":124,\"renderKey\":1595658064081},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"picture-card\",\"multiple\":false,\"__vModel__\":\"site_logo_lefttop\"},{\"__config__\":{\"label\":\"主頁左上角縮回菜單logo[後台]\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":127,\"renderKey\":1595658695317},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"site_logo_square\"},{\"__config__\":{\"label\":\"登錄頁logo[後台]\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1612510257294},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"picture-card\",\"multiple\":false,\"__vModel__\":\"site_logo_login\"},{\"__config__\":{\"label\":\"登錄頁背景圖\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":152,\"renderKey\":1596017451389},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"admin_login_bg_pic\"},{\"__config__\":{\"label\":\"移動端登錄頁logo\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":128,\"renderKey\":1595658697800},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"mobile_login_logo\"},{\"__config__\":{\"label\":\"SEO標題\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1589534140652},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入SEO標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"seo_title\"},{\"__config__\":{\"label\":\"新聞幻燈片數量上限\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":116,\"renderKey\":1589941416644},\"placeholder\":\"新聞幻燈片數量上限\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"news_slides_limit\",\"min\":3,\"max\":10}]}', '2020-05-15 17:20:10', '2021-02-05 15:35:02');
INSERT INTO `eb_system_form_temp` VALUES (65, '公眾號配置', '應用配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"AppId\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1589942266186},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入AppId\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"wechat_appid\"},{\"__config__\":{\"label\":\"AppSecret\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1589942280095},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入AppSecret\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"wechat_appsecret\"},{\"__config__\":{\"label\":\"微信驗證Token\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1613723085302},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入微信驗證Token\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field101\"},{\"__config__\":{\"label\":\"EncodingAESKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1613723136701},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入EncodingAESKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field103\"},{\"__config__\":{\"label\":\"消息加密方式\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":104,\"renderKey\":1613723166459},\"__slot__\":{\"options\":[{\"label\":\"明文模式\",\"value\":1},{\"label\":\"兼容模式\",\"value\":2},{\"label\":\"安全模式\",\"value\":3}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field104\"},{\"__config__\":{\"label\":\"微信分享圖片\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":123,\"renderKey\":1597063713790},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"wechat_share_img\"},{\"__config__\":{\"label\":\"公眾號關聯二維碼\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":124,\"renderKey\":1597063784328},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"wechat_qrcode\"},{\"__config__\":{\"label\":\"微信分享標題\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":135,\"renderKey\":1591000910252,\"defaultValue\":\"CRMEB\"},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入微信分享標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"wechat_share_title\"},{\"__config__\":{\"label\":\"微信分享簡介\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":136,\"renderKey\":1591001203576,\"defaultValue\":\"CRMEB\"},\"type\":\"textarea\",\"placeholder\":\"請輸入微信分享簡介\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"wechat_share_synopsis\"},{\"__config__\":{\"label\":\"用戶H5默認頭像\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":126,\"renderKey\":1597063821840},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"h5_avatar\"}]}', '2020-05-15 17:22:16', '2021-03-09 22:46:18');
INSERT INTO `eb_system_form_temp` VALUES (66, '小程序配置', '應用配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":140,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"appId\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1589942764174},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入appId\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"routine_appid\"},{\"__config__\":{\"label\":\"AppSecret\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1589942771851},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入AppSecret\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"routine_appsecret\"},{\"__config__\":{\"label\":\"小程序名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1589942826385},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入小程序名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"routine_name\"}]}', '2020-05-15 17:39:17', '2020-12-21 11:29:57');
INSERT INTO `eb_system_form_temp` VALUES (67, '公眾號支付配置', '支付配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"appId\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1589942880822},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入appId\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_weixin_appid\"},{\"__config__\":{\"label\":\"Appsecret\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1589942891565},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Appsecret\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_weixin_appsecret\"},{\"__config__\":{\"label\":\"Mchid\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1589942909192},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Mchid\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_weixin_mchid\"},{\"__config__\":{\"label\":\"公眾號商戶證書\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1606895770397},\"__slot__\":{\"list-type\":true},\"name\":\"upfile\",\"__vModel__\":\"pay_routine_client_p12\"},{\"__config__\":{\"label\":\"商戶證書絕對路徑\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1620460466542},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入商戶證書絕對路徑商戶證書絕對路徑商戶證書絕對路徑\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_weixin_certificate_path\"},{\"__config__\":{\"label\":\"Key\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":106,\"renderKey\":1589942961506},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Key\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_weixin_key\"},{\"__config__\":{\"label\":\"微信支付\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":107,\"renderKey\":1589942970321,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"開啟\",\"value\":1},{\"label\":\"關閉\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"pay_weixin_open\"},{\"__config__\":{\"label\":\"配置目錄\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":108,\"renderKey\":1589942998404},\"type\":\"textarea\",\"placeholder\":\"請輸入配置目錄\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"paydir\"}]}', '2020-05-16 10:19:37', '2021-05-08 15:58:44');
INSERT INTO `eb_system_form_temp` VALUES (68, '小程序支付配置', '支付配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"Appid\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1589943059385},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Appid\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_routine_appid\"},{\"__config__\":{\"label\":\"Appsecret\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1589943069474},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Appsecret\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_routine_appsecret\"},{\"__config__\":{\"label\":\"Mchid\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1589943084448},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Mchid\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_routine_mchid\"},{\"__config__\":{\"label\":\"Key\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1589943093596},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入Key\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_routine_key\"},{\"__config__\":{\"label\":\"小程序商戶證書\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1606877259081},\"__slot__\":{\"list-type\":true},\"name\":\"upfile\",\"__vModel__\":\"pay_mini_client_p12\"},{\"__config__\":{\"label\":\"商戶證書絕對路徑\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1620461041708},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"商戶證書絕對路徑商戶證書絕對路徑\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"pay_routine_certificate_path\"}]}', '2020-05-16 10:35:06', '2021-05-08 16:04:39');
INSERT INTO `eb_system_form_temp` VALUES (70, '編輯城市', '編輯城市', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"上級名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"parentName\",\"placeholder\":\"上級名稱上級名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":false,\"readonly\":true,\"disabled\":false},{\"__config__\":{\"label\":\"名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":109,\"renderKey\":1589790937111},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"20\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"name\"}]}', '2020-05-18 16:39:58', '2020-08-15 16:38:28');
INSERT INTO `eb_system_form_temp` VALUES (71, '添加物流公司', '添加物流公司', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"公司名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"defaultValue\":\"\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入公司名稱公司名稱公司名稱公司名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"編碼\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":109,\"renderKey\":1589858082280},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入編碼\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"code\"},{\"__config__\":{\"label\":\"排序\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":0,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":false,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":114,\"renderKey\":1589858279409,\"defaultValue\":0},\"placeholder\":\"0\",\"step\":1,\"step-strictly\":true,\"controls-position\":\"right\",\"disabled\":false,\"__vModel__\":\"sort\",\"min\":0},{\"__config__\":{\"label\":\"單選框組\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1597721904770,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"隱藏\",\"value\":0},{\"label\":\"顯示\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"isShow\"}]}', '2020-05-19 11:17:03', '2020-08-18 11:46:40');
INSERT INTO `eb_system_form_temp` VALUES (72, '上傳文件配置-基礎配置', '上傳文件配置-基礎配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":130,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"layout\":\"rowFormItem\",\"tagIcon\":\"row\",\"label\":\"行容器\",\"layoutTree\":true,\"children\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/layout\",\"formId\":101,\"span\":24,\"renderKey\":1592474288129,\"componentName\":\"row101\",\"gutter\":15},\"type\":\"default\",\"justify\":\"start\",\"align\":\"top\"}]}', '2020-05-19 17:10:40', '2020-06-18 17:58:09');
INSERT INTO `eb_system_form_temp` VALUES (74, '物流配置', '物流配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":23,\"formBtns\":true,\"unFocusedComponentBorder\":false,\"fields\":[{\"__config__\":{\"label\":\"全場滿額包郵開關\",\"labelWidth\":180,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":23,\"optionType\":\"default\",\"regList\":[],\"required\":false,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":102,\"renderKey\":1613806479762,\"defaultValue\":false},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":\"false\"},{\"label\":\"開啟\",\"value\":\"true\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"store_free_postage_switch\"},{\"__config__\":{\"label\":\"全場滿額包郵（元）\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":180,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":18,\"layout\":\"colFormItem\",\"required\":false,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":101,\"renderKey\":1589939942507,\"defaultValue\":1},\"placeholder\":\"全場滿額包郵（元）全場滿額包郵（元）全場滿額包郵（元）\",\"step\":1,\"step-strictly\":true,\"controls-position\":\"right\",\"disabled\":false,\"__vModel__\":\"store_free_postage\",\"min\":0},{\"__config__\":{\"label\":\"騰訊地圖KEY\",\"labelWidth\":180,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":false,\"layout\":\"colFormItem\",\"span\":23,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1589940263502},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入騰訊地圖KEY\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"tengxun_map_key\"},{\"__config__\":{\"label\":\"是否開啟提貨點自提\",\"labelWidth\":180,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":23,\"optionType\":\"default\",\"regList\":[],\"required\":false,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":107,\"renderKey\":1589940326254,\"defaultValue\":false},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":\"false\"},{\"label\":\"開啟\",\"value\":\"true\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"store_self_mention\"}]}', '2020-05-20 10:07:14', '2021-02-20 15:36:02');
INSERT INTO `eb_system_form_temp` VALUES (75, '小票打印', '小票打印', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":190,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"支付成功訂單打印開關\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1589943790530,\"defaultValue\":\"‘1’\"},\"__slot__\":{\"options\":[{\"label\":\"關\",\"value\":\"‘1’\"},{\"label\":\"開\",\"value\":\"‘2’\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field101\"},{\"__config__\":{\"label\":\"開發者ID\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1589943827496},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入開發者ID\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field102\"},{\"__config__\":{\"label\":\"應用秘鑰\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1589943840899},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入應用秘鑰\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field103\"},{\"__config__\":{\"label\":\"應用ID\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1589943850581},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入應用ID\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field104\"},{\"__config__\":{\"label\":\"終端號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1589943850893},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入終端號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field105\"}]}', '2020-05-20 11:04:26', '2020-05-21 11:39:09');
INSERT INTO `eb_system_form_temp` VALUES (76, '雲智服', '雲智服', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":120,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"客服H5鏈接\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1599641784700},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入客服H5鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"yzf_h5_url\"}]}', '2020-05-21 11:07:21', '2020-09-09 16:57:11');
INSERT INTO `eb_system_form_temp` VALUES (77, '商城基礎配置', '商城配置-商城基礎配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":250,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"待補貨數量\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":300,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":101,\"renderKey\":1590031949003,\"defaultValue\":20},\"placeholder\":\"待補貨數量\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"replenishment_num\",\"max\":99999,\"min\":0},{\"__config__\":{\"label\":\"警戒庫存\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":300,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":102,\"renderKey\":1590032029141,\"defaultValue\":2},\"placeholder\":\"警戒庫存\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"store_stock\",\"max\":99999,\"min\":0},{\"__config__\":{\"label\":\"退貨理由\",\"labelWidth\":300,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":103,\"renderKey\":1590032054065,\"defaultValue\":\"收貨地址填錯了 與描述不符 信息填錯了，重新拍 收到商品損壞了 未按預定時間發貨 其它原因\"},\"type\":\"textarea\",\"placeholder\":\"請填寫退貨理由\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"stor_reason\"},{\"__config__\":{\"label\":\"移動端頂部logo圖標(127*45)\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":300,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":124,\"renderKey\":1595659136385},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"mobile_top_logo\"},{\"__config__\":{\"label\":\"普通商品未支付取消訂單時間(單位:小時)\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":300,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":105,\"renderKey\":1590032096481,\"defaultValue\":2},\"placeholder\":\"普通商品未支付取消訂單時間(單位:小時)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"order_cancel_time\",\"max\":99999,\"min\":0,\"precision\":0},{\"__config__\":{\"label\":\"活動商品未支付取消訂單時間(單位小時)\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":300,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":106,\"renderKey\":1590032112020,\"defaultValue\":2},\"placeholder\":\"活動商品未支付取消訂單時間(單位:小時)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"order_activity_time\",\"max\":99999,\"min\":0,\"precision\":0},{\"__config__\":{\"label\":\"會員功能是否開啟\",\"labelWidth\":300,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":111,\"renderKey\":1590032159205,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"vip_open\"},{\"__config__\":{\"label\":\"新訂單語音提示\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":300,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1597300171239},\"__slot__\":{\"list-type\":true},\"name\":\"upfile\",\"__vModel__\":\"new_order_audio_link\"}]}', '2020-05-21 11:37:57', '2021-03-19 19:15:32');
INSERT INTO `eb_system_form_temp` VALUES (78, '充值配置', '商城配置-充值配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":200,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"用戶最低充值金額\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":101,\"renderKey\":1590032399200,\"defaultValue\":0.01},\"placeholder\":\"用戶最低充值金額\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"store_user_min_recharge\",\"min\":0},{\"__config__\":{\"label\":\"小程序充值開關\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":102,\"renderKey\":1590032438060,\"defaultValue\":false},\"__slot__\":{\"options\":[{\"label\":\"開啟\",\"value\":\"true\"},{\"label\":\"關閉\",\"value\":\"false\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"recharge_switch\"},{\"__config__\":{\"label\":\"充值注意事項\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":103,\"renderKey\":1590032466493,\"defaultValue\":\"充值後帳戶的金額不能提現，可用於商城消費使用 佣金導入賬戶之後不能再次導出、不可提現 賬戶充值出現問題可聯繫商城客服，也可撥打商城客服熱線：4008888888\"},\"type\":\"textarea\",\"placeholder\":\"請輸入充值注意事項\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"recharge_attention\"}]}', '2020-05-21 11:41:45', '2020-12-18 16:35:30');
INSERT INTO `eb_system_form_temp` VALUES (79, '線下支付', '支付設置-線下支付', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"線下支付狀態\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1590041613118,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"開啟\",\"value\":1},{\"label\":\"關閉\",\"value\":0}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"offline_pay_status\"}]}', '2020-05-21 14:14:10', '2021-01-09 11:26:55');
INSERT INTO `eb_system_form_temp` VALUES (80, '余額支付', '支付配置-余額支付', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"余額支付狀態\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1590041613118,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"開啟\",\"value\":1},{\"label\":\"關閉\",\"value\":0}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"yue_pay_status\"}]}', '2020-05-21 14:14:49', '2021-01-08 11:52:28');
INSERT INTO `eb_system_form_temp` VALUES (81, '阿里雲配置', '阿里雲配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"空間域名 Domain\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1590041796581},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本空間域名 Domain\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alUploadUrl\"},{\"__config__\":{\"label\":\"accessKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1590041835433},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本accessKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alAccessKey\"},{\"__config__\":{\"label\":\"secretKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1590041835651},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本secretKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alSecretKey\"},{\"__config__\":{\"label\":\"存儲空間名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1590041835857},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本存儲空間名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alStorageName\"},{\"__config__\":{\"label\":\"所屬地域\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1590041836043},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本所屬地域\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alStorageRegion\"}]}', '2020-05-21 14:18:12', '2020-06-18 17:57:01');
INSERT INTO `eb_system_form_temp` VALUES (82, '七牛雲配置', '七牛雲配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"空間域名 Domain\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1590041796581},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本空間域名 Domain\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"qnUploadUrl\"},{\"__config__\":{\"label\":\"accessKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1590041835433},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本accessKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"qnAccessKey\"},{\"__config__\":{\"label\":\"qnSecretKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1590041835651},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本qnSecretKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"qnSecretKey\"},{\"__config__\":{\"label\":\"存儲空間名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1590041835857},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本存儲空間名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"qnStorageName\"},{\"__config__\":{\"label\":\"所屬地域\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1590041836043},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本所屬地域\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"qnStorageRegion\"}]}', '2020-05-21 14:18:29', '2020-06-18 17:56:54');
INSERT INTO `eb_system_form_temp` VALUES (83, '騰訊雲配置', '騰訊雲配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":150,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"空間域名 Domain\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1590041796581},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本空間域名 Domain\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"txUploadUrl\"},{\"__config__\":{\"label\":\"accessKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1590041835433},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本accessKeyaccessKeyaccessKeyaccessKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"txAccessKey\"},{\"__config__\":{\"label\":\"secretKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1590041835651},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本secretKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"txSecretKey\"},{\"__config__\":{\"label\":\"存儲空間名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1590041835857},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本存儲空間名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"txStorageName\"},{\"__config__\":{\"label\":\"所屬地域\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1590041836043},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本所屬地域\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"txStorageRegion\"}]}', '2020-05-21 14:18:46', '2020-06-18 17:56:49');
INSERT INTO `eb_system_form_temp` VALUES (84, '微信菜單編輯', '微信菜單編輯', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"菜單名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1590118075352},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入菜單名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"name\"},{\"__config__\":{\"label\":\"規則狀態\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":103,\"renderKey\":1590118119244},\"__slot__\":{\"options\":[{\"label\":\"關鍵字\",\"value\":1},{\"label\":\"跳轉網頁\",\"value\":2},{\"label\":\"小程序\",\"value\":3}]},\"placeholder\":\"請選擇規則狀態\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":false,\"multiple\":false,\"__vModel__\":\"type\"},{\"__config__\":{\"label\":\"關鍵字\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1590118097394},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入關鍵字\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"key\"}]}', '2020-05-22 11:29:22', '2020-05-22 15:56:20');
INSERT INTO `eb_system_form_temp` VALUES (85, 'testRedioBtn', 'testRedioBtn', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"單選框組\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":104,\"renderKey\":1590380476713,\"defaultValue\":\"‘0’\"},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":\"‘0’\"},{\"label\":\"選項二\",\"value\":\"‘1’\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field104\"}]}', '2020-05-25 12:21:54', '2020-05-25 12:27:00');
INSERT INTO `eb_system_form_temp` VALUES (86, '秒殺配置', '秒殺配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":158,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"開始時間(整數小時)\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":101,\"renderKey\":1590387965990},\"placeholder\":\"計數器開始時間(整數小時)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"field101\"},{\"__config__\":{\"label\":\"持續時間(整數小時)\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":102,\"renderKey\":1590388014422},\"placeholder\":\"計數器持續時間(整數小時)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"field102\"},{\"__config__\":{\"label\":\"幻燈片\",\"tag\":\"el-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":103,\"renderKey\":1590388029048},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":false,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"picture-card\",\"multiple\":false,\"__vModel__\":\"field103\"},{\"__config__\":{\"label\":\"排序\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":104,\"renderKey\":1590388040940,\"defaultValue\":0},\"placeholder\":\"排序\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"field104\"},{\"__config__\":{\"label\":\"狀態\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":106,\"renderKey\":1590388076282,\"defaultValue\":\"‘0’\"},\"__slot__\":{\"options\":[{\"label\":\"顯示\",\"value\":\"‘0’\"},{\"label\":\"隱藏\",\"value\":\"‘1’\"}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field106\"},{\"__config__\":{\"label\":\"我是梁總\",\"tag\":\"el-checkbox-group\",\"tagIcon\":\"checkbox\",\"defaultValue\":[],\"span\":24,\"showLabel\":true,\"labelWidth\":null,\"layout\":\"colFormItem\",\"optionType\":\"default\",\"required\":true,\"regList\":[],\"changeTag\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/checkbox\",\"formId\":101,\"renderKey\":1616152329724},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":1},{\"label\":\"選項二\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"field101\"}]}', '2020-05-25 14:28:50', '2021-03-19 19:12:19');
INSERT INTO `eb_system_form_temp` VALUES (87, '簽到', '簽到', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"顯示標題\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"title\",\"placeholder\":\"請輸入顯示標題顯示標題顯示標題顯示標題顯示標題顯示標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"第幾天\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":127,\"renderKey\":1590647892129,\"defaultValue\":1},\"placeholder\":\"第幾天第幾天\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"day\",\"min\":0},{\"__config__\":{\"label\":\"積分\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":129,\"renderKey\":1590649451776,\"defaultValue\":1},\"placeholder\":\"積分值\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"integral\",\"min\":1},{\"__config__\":{\"label\":\"經驗\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":128,\"renderKey\":1590649448797,\"defaultValue\":1},\"placeholder\":\"經驗值\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"experience\"}]}', '2020-05-28 14:33:02', '2020-05-28 15:07:25');
INSERT INTO `eb_system_form_temp` VALUES (89, '個人中心菜單', '個人中心菜單', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"菜單名\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入菜單名菜單名菜單名菜單名菜單名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"圖標(48*48)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":105,\"renderKey\":1596072707659},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"},{\"__config__\":{\"label\":\"小程序鏈接\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":142,\"renderKey\":1591060899296},\"__slot__\":{\"options\":[{\"label\":\"地址管理\",\"value\":\"/pages/users/user_address_list/index\"},{\"label\":\"會員中心\",\"value\":\"/pages/users/user_vip/index\"},{\"label\":\"砍價記錄\",\"value\":\"/pages/activity/bargain/index\"},{\"label\":\"推廣中心\",\"value\":\"/pages/users/user_spread_user/index\"},{\"label\":\"我的余額\",\"value\":\"/pages/users/user_money/index\"},{\"label\":\"我的收藏\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"label\":\"優惠券\",\"value\":\"/pages/users/user_coupon/index\"},{\"label\":\"後台訂單管理\",\"value\":\"/pages/admin/order/index\"},{\"label\":\"聯繫客服\",\"value\":\"/pages/service/index\"},{\"label\":\"訂單核銷\",\"value\":\"/pages/admin/order_cancellation/index\"}]},\"placeholder\":\"請選擇小程序跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"url\"},{\"__config__\":{\"label\":\"公眾號鏈接\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":140,\"renderKey\":1591064071606},\"__slot__\":{\"options\":[{\"label\":\"地址管理\",\"value\":\"/pages/users/user_address_list/index\"},{\"label\":\"會員中心\",\"value\":\"/pages/users/user_vip/index\"},{\"label\":\"砍價記錄\",\"value\":\"/pages/activity/bargain/index\"},{\"label\":\"推廣中心\",\"value\":\"/pages/users/user_spread_user/index\"},{\"label\":\"我的余額\",\"value\":\"/pages/users/user_money/index\"},{\"label\":\"我的收藏\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"label\":\"優惠券\",\"value\":\"/pages/users/user_coupon/index\"},{\"label\":\"後台訂單管理\",\"value\":\"/pages/admin/order/index\"},{\"label\":\"聯繫客服\",\"value\":\"https://yzf.qq.com/xv/web/static/chat/index.html?sign=37ef9b97db2656c32340cde61ce2b56a2176efe72ac7ed421c77607b5c816611ec4775a17c7605b33df1ffe1d22a4ce7464dd07b\"},{\"label\":\"訂單核銷\",\"value\":\"/pages/admin/order_cancellation/index\"}]},\"placeholder\":\"請選擇跳轉鏈接公眾號鏈接公眾號鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"wap_url\"}]}', '2020-06-02 09:24:19', '2020-09-09 15:55:20');
INSERT INTO `eb_system_form_temp` VALUES (90, '個人中心輪播圖', '個人中心輪播圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1597289113769},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":140,\"renderKey\":1591064520353},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入跳轉跳轉鏈接跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"url\"}]}', '2020-06-02 10:24:06', '2020-08-13 11:25:22');
INSERT INTO `eb_system_form_temp` VALUES (91, '首頁精品推薦benner圖', '首頁精品推薦benner圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591065625767},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"請輸入跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"圖片(710*280)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":\"\",\"showLabel\":true,\"labelWidth\":130,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597286116626},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:36:05');
INSERT INTO `eb_system_form_temp` VALUES (92, '首發新品推薦Banner圖片', '首發新品推薦Banner圖片', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591065625767},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"請輸入跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":120,\"required\":false,\"span\":24,\"showTip\":false,\"buttonText\":\"\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1613962570936},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image\",\"name\":\"file\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-06-02 10:41:29', '2021-02-22 10:56:54');
INSERT INTO `eb_system_form_temp` VALUES (93, '首頁促銷單品推薦Banner圖片', '首頁促銷單品推薦Banner圖片', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591065625767},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"請輸入跳轉鏈接跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"圖片(710*280)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":130,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597286206728},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:37:37');
INSERT INTO `eb_system_form_temp` VALUES (94, '熱門榜單推薦Banner圖片', '熱門榜單推薦Banner圖片', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591065625767},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"請輸入跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1614154650561},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image\",\"name\":\"file\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-06-02 10:41:29', '2021-02-24 16:17:48');
INSERT INTO `eb_system_form_temp` VALUES (95, '首頁banner滾動圖', '首頁banner滾動圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591065625767},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"請輸入跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"圖片(710*280)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":130,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1597286491734},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:43:11');
INSERT INTO `eb_system_form_temp` VALUES (96, '導航模塊', '導航模塊', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標題\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入標題標題標題標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"圖片\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597287354047},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"},{\"__config__\":{\"label\":\"跳轉鏈接\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":102,\"renderKey\":1591080591082},\"__slot__\":{\"options\":[{\"label\":\"商城首頁\",\"value\":\"/pages/index/index\"},{\"label\":\"個人推廣\",\"value\":\"/pages/user_spread_user/index\"},{\"label\":\"優惠券\",\"value\":\"/pages/users/user_get_coupon/index\"},{\"label\":\"個人中心\",\"value\":\"/pages/user/user\"},{\"label\":\"秒殺列表\",\"value\":\"/pages/activity/goods_seckill/index\"},{\"label\":\"拼團列表頁\",\"value\":\"/pages/activity/goods_combination/index\"},{\"label\":\"砍價列表\",\"value\":\"/pages/activity/goods_bargain/index\"},{\"label\":\"分類頁面\",\"value\":\"/pages/goods_cate/goods_cate\"},{\"label\":\"地址列表\",\"value\":\"/pages/users/user_address_list/index\"},{\"label\":\"提現頁面\",\"value\":\"/pages/user_cash/index\"},{\"label\":\"推廣統計\",\"value\":\"/pages/promoter-list/index\"},{\"label\":\"賬戶金額\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"label\":\"推廣二維碼頁面\",\"value\":\"/pages/promotion-card/promotion-card\"},{\"label\":\"購物車頁面\",\"value\":\"/pages/order_addcart/order_addcart\"},{\"label\":\"訂單列表頁面\",\"value\":\"/pages/users/order_list/index\"},{\"label\":\"文章列表頁\",\"value\":\"/pages/news_list/index\"},{\"label\":\"我要簽到\",\"value\":\"/pages/users/user_sgin/index\"},{\"label\":\"我的收藏\",\"value\":\"/pages/users/user_goods_collection/index\"}]},\"placeholder\":\"請選擇跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"url\"},{\"__config__\":{\"label\":\"底部菜單\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":103,\"renderKey\":1591080806108,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"是\",\"value\":1},{\"label\":\"否\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"show\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:56:06');
INSERT INTO `eb_system_form_temp` VALUES (97, '首頁滾動新聞', '首頁滾動新聞', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"滾動文字\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"info\",\"placeholder\":\"請輸入滾動文字滾動文字\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"showLabel\":true,\"labelWidth\":120,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":102,\"renderKey\":1591080591082},\"__slot__\":{\"options\":[{\"label\":\"商城首頁\",\"value\":\"/pages/index/index\"},{\"label\":\"個人推廣\",\"value\":\"/pages/user_spread_user/index\"},{\"label\":\"優惠券\",\"value\":\"/pages/users/user_get_coupon/index\"},{\"label\":\"個人中心\",\"value\":\"/pages/user/user\"},{\"label\":\"秒殺列表\",\"value\":\"/pages/activity/goods_seckill/index\"},{\"label\":\"拼團列表頁\",\"value\":\"/pages/activity/goods_combination/index\"},{\"label\":\"砍價列表\",\"value\":\"/pages/activity/goods_bargain/index\"},{\"label\":\"分類頁面\",\"value\":\"/pages/goods_cate/goods_cate\"},{\"label\":\"地址列表\",\"value\":\"/pages/users/user_address_list/index\"},{\"label\":\"提現頁面\",\"value\":\"/pages/user_cash/index\"},{\"label\":\"推廣統計\",\"value\":\"/pages/promoter-list/index\"},{\"label\":\"賬戶金額\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"label\":\"推廣二維碼頁面\",\"value\":\"/pages/promotion-card/promotion-card\"},{\"label\":\"購物車頁面\",\"value\":\"/pages/order_addcart/order_addcart\"},{\"label\":\"訂單列表頁面\",\"value\":\"/pages/users/order_list/index\"},{\"label\":\"文章列表頁\",\"value\":\"/pages/news_list/index\"}]},\"placeholder\":\"請選擇跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"url\"},{\"__config__\":{\"label\":\"底部菜單\",\"labelWidth\":120,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":103,\"renderKey\":1591080806108,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"是\",\"value\":1},{\"label\":\"否\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"show\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:35:02');
INSERT INTO `eb_system_form_temp` VALUES (98, '首頁活動區域圖片', '首頁活動區域圖片', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"圖片(710*280)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":130,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1597286612904},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"image\"},{\"__config__\":{\"label\":\"標題\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"title\",\"placeholder\":\"請輸入標題標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"簡介\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591081196107},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"info\",\"placeholder\":\"請輸入簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"跳轉鏈接\",\"showLabel\":true,\"labelWidth\":130,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":102,\"renderKey\":1591080591082},\"__slot__\":{\"options\":[{\"label\":\"秒殺列表\",\"value\":\"/pages/activity/goods_seckill/index\"},{\"label\":\"拼團列表頁\",\"value\":\"/pages/activity/goods_combination/index\"},{\"label\":\"砍價列表\",\"value\":\"/pages/activity/goods_bargain/index\"}]},\"placeholder\":\"請選擇跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"link\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:44:02');
INSERT INTO `eb_system_form_temp` VALUES (99, '首頁超值爆款', '首頁超值爆款', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"圖片(710*280)\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":130,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597286019454},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"image\"},{\"__config__\":{\"label\":\"標題\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"title\",\"placeholder\":\"請輸入標題標題標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"簡介\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591081196107},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"info\",\"placeholder\":\"請輸入簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"簡介2\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591081406040},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"info\",\"placeholder\":\"請輸入2簡介2\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"類型\",\"showLabel\":true,\"labelWidth\":130,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":102,\"renderKey\":1591080591082},\"__slot__\":{\"options\":[{\"label\":\"精品推薦\",\"value\":1},{\"label\":\"熱門榜單\",\"value\":2},{\"label\":\"首發新品\",\"value\":3},{\"label\":\"促銷單品\",\"value\":4}]},\"placeholder\":\"請選擇類型\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"type\"}]}', '2020-06-02 10:41:29', '2020-08-13 10:34:41');
INSERT INTO `eb_system_form_temp` VALUES (100, '首頁文字配置', '首頁文字配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"快速選擇簡介\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"fast_info\",\"placeholder\":\"請輸入快速選擇簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"精品推薦簡介\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1591081579041},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"bast_info\",\"placeholder\":\"請輸入精品推薦簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"首發新品簡介\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1591081598503},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"first_info\",\"placeholder\":\"請輸入首發新品簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"促銷單品簡介\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1591081599048},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"sales_info\",\"placeholder\":\"請輸入促銷單品簡介\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false}]}', '2020-06-02 15:07:11', '2020-06-02 15:07:11');
INSERT INTO `eb_system_form_temp` VALUES (101, '首頁精品推薦benner圖', '首頁精品推薦benner圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"圖片\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597285983911},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"img\"},{\"__config__\":{\"label\":\"描述\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1591083877308},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入描述\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"comment\"},{\"__config__\":{\"label\":\"跳轉鏈接\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1591083894228},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入跳轉鏈接\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"link\"}]}', '2020-06-02 15:45:01', '2020-08-13 10:33:18');
INSERT INTO `eb_system_form_temp` VALUES (102, '熱門搜索', '熱門搜索', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"標籤\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"title\",\"placeholder\":\"請輸入標籤\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false}]}', '2020-06-03 11:34:29', '2020-06-03 11:34:29');
INSERT INTO `eb_system_form_temp` VALUES (103, '充值金額設置', '設置充值金額額度選擇', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"售價\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1591773075965},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入售價\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"price\"},{\"__config__\":{\"label\":\"贈送\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1591773074670},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入贈送\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"give_money\"}]}', '2020-06-10 15:12:15', '2020-06-10 15:12:15');
INSERT INTO `eb_system_form_temp` VALUES (104, '修改訂單', '修改訂單', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"訂單編號\",\"labelWidth\":130,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"訂單編號訂單編號訂單編號訂單編號訂單編號訂單編號\",\"style\":{\"width\":\"50%\"},\"clearable\":false,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":true,\"disabled\":false,\"__vModel__\":\"orderId\"},{\"__config__\":{\"label\":\"商品總價\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":130,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":108,\"renderKey\":1592186382632,\"defaultValue\":0},\"placeholder\":\"商品總價\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":true,\"__vModel__\":\"totalPrice\",\"min\":0},{\"__config__\":{\"label\":\"原始郵費\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":130,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":104,\"renderKey\":1592186354404,\"defaultValue\":0},\"placeholder\":\"原始郵費\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":true,\"__vModel__\":\"totalPostage\",\"min\":0},{\"__config__\":{\"label\":\"實際支付金額\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":130,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":106,\"renderKey\":1592186379453,\"defaultValue\":0},\"placeholder\":\"實際支付金額\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"payPrice\",\"min\":0},{\"__config__\":{\"label\":\"實際支付郵費\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":130,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":107,\"renderKey\":1592186381287,\"defaultValue\":0},\"placeholder\":\"實際支付郵費\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":true,\"__vModel__\":\"payPostage\",\"min\":0}]}', '2020-06-15 10:11:19', '2021-03-24 11:07:33');
INSERT INTO `eb_system_form_temp` VALUES (105, '模板消息', '模板消息', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"模板編號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"tempKey\",\"placeholder\":\"請輸入模板編號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"模板ID\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":106,\"renderKey\":1592281492122},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入模板ID\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"tempId\"},{\"__config__\":{\"label\":\"模板名\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1592281490129},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入模板名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"name\"},{\"__config__\":{\"label\":\"回覆內容\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":104,\"renderKey\":1592281487212},\"type\":\"textarea\",\"placeholder\":\"請輸入回覆內容\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"content\"},{\"__config__\":{\"label\":\"狀態\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":109,\"renderKey\":1592289933100,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"開啟\",\"value\":1},{\"label\":\"關閉\",\"value\":0}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"status\"}]}', '2020-06-16 12:28:38', '2020-12-04 16:49:38');
INSERT INTO `eb_system_form_temp` VALUES (106, '拒絕退款', '拒絕退款', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"拒絕退款單號\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"orderId\",\"placeholder\":\"請輸入拒絕退款單號拒絕退款單號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":true,\"disabled\":false},{\"__config__\":{\"label\":\"不退款原因\",\"labelWidth\":120,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":112,\"renderKey\":1592451273684},\"type\":\"textarea\",\"placeholder\":\"請輸入不退款原因\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"reason\"}]}', '2020-06-18 11:36:28', '2020-06-18 11:45:56');
INSERT INTO `eb_system_form_temp` VALUES (107, '立即退款', '立即退款', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"退款單號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"orderId\",\"placeholder\":\"請輸入退款單號退款單號退款單號退款單號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":true,\"disabled\":false},{\"__config__\":{\"label\":\"退款金額\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":110,\"renderKey\":1592452495718},\"placeholder\":\"退款金額\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"amount\",\"min\":0}]}', '2020-06-18 11:57:03', '2021-01-06 14:43:22');
INSERT INTO `eb_system_form_temp` VALUES (108, '文件上傳-基礎配置', '文件上傳-本地配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"本地圖片域名\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1592476026393},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入本地圖片域名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"localUploadUrl\"},{\"__config__\":{\"label\":\"圖片存儲路徑\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1598343790958},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入圖片存儲路徑\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"upload_root_path\"},{\"__config__\":{\"label\":\"允許上傳圖片後綴\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1598344152903},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"允許上傳圖片後綴，多個英文逗號分割允許上傳圖片後綴\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"image_ext_str\"},{\"__config__\":{\"label\":\"允許上傳最大圖片(單位 M，最大值50 )\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"regList\":[],\"formId\":104,\"renderKey\":1598344206314},\"placeholder\":\"單位 M允許上傳最大圖片(單位 M，最大值50 )\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"image_max_size\",\"min\":1,\"max\":50},{\"__config__\":{\"label\":\"允許上傳文件後綴\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":106,\"renderKey\":1598344273484},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"，多個英文逗號分割\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"file_ext_str\"},{\"__config__\":{\"label\":\"允許上傳最大文件(單位 M，最大值500 )\",\"labelWidth\":270,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"regList\":[],\"formId\":107,\"renderKey\":1598344275586},\"placeholder\":\"單位 M允許上傳最大文件(單位 M，最大值500 )\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"file_max_size\",\"min\":1,\"max\":500},{\"__config__\":{\"label\":\"文件存儲\",\"showLabel\":true,\"labelWidth\":270,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":102,\"renderKey\":1599545811870,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"本地\",\"value\":1},{\"label\":\"七牛雲\",\"value\":2},{\"label\":\"阿里雲\",\"value\":3},{\"label\":\"騰訊雲\",\"value\":4}]},\"placeholder\":\"請選擇文件存儲文件存儲\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":true,\"multiple\":false,\"__vModel__\":\"uploadType\"}]}', '2020-06-18 18:28:13', '2021-03-18 16:05:59');
INSERT INTO `eb_system_form_temp` VALUES (109, '積分設置', '積分設置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":23,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"積分抵用比例(1積分抵多少金額)\",\"labelWidth\":350,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"defaultValue\":3,\"required\":true,\"layout\":\"colFormItem\",\"span\":23,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"regList\":[]},\"placeholder\":\"請輸入積分抵用比例積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)積分抵用比例(1積分抵多少金額)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"integral_ratio\",\"min\":0,\"precision\":1,\"max\":99},{\"__config__\":{\"label\":\"下單贈送積分比例（實際支付1元贈送多少積分）\",\"labelWidth\":350,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"defaultValue\":1,\"required\":true,\"layout\":\"colFormItem\",\"span\":23,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"regList\":[],\"formId\":105,\"renderKey\":1594871750052},\"placeholder\":\"請輸入下單贈送積分比例（實際支付1元贈送多少積分）\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"order_give_integral\",\"min\":0,\"precision\":0},{\"__config__\":{\"label\":\"積分凍結時間(天)\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":350,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":23,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":103,\"renderKey\":1614734147419,\"defaultValue\":0},\"placeholder\":\"積分凍結時間(天)\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"freeze_integral_day\",\"min\":0,\"precision\":0,\"max\":99}]}', '2020-07-16 12:01:34', '2021-03-03 09:20:21');
INSERT INTO `eb_system_form_temp` VALUES (110, '短信模板消息', '短信模板消息', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"模板名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":140,\"renderKey\":1595402251597},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入模板名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"title\"},{\"__config__\":{\"label\":\"模板內容\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":141,\"renderKey\":1595402320867,\"defaultValue\":\"您的驗證碼是：{$code}，有效期為{$time}分鐘。如非本人操作，可不用理會。模板中的{$code}和{$time}需要替換成對應的變量，請開發者知曉。修改此項無效！\"},\"type\":\"textarea\",\"placeholder\":\"請輸入模板內容\",\"autosize\":{\"minRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"content\"},{\"__config__\":{\"label\":\"模板類型\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":142,\"renderKey\":1595402411016,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"驗證碼\",\"value\":1},{\"label\":\"通知\",\"value\":2},{\"label\":\"推廣\",\"value\":3}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"type\"}]}', '2020-07-22 15:21:26', '2020-12-01 11:56:33');
INSERT INTO `eb_system_form_temp` VALUES (111, '短信設置', '短信設置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":300,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":16,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"支付成功提醒[用戶]\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":109,\"renderKey\":1595407327280,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"lowerOrderSwitch\"},{\"__config__\":{\"label\":\"發貨提醒[用戶]\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":102,\"renderKey\":1595407325650,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"deliverGoodsSwitch\"},{\"__config__\":{\"label\":\"改價短信提醒[用戶]\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":108,\"renderKey\":1595407326924,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"priceRevisionSwitch\"},{\"__config__\":{\"label\":\"驗證碼有效時間 (分鐘)\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"required\":true,\"layout\":\"colFormItem\",\"span\":16,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"regList\":[],\"formId\":103,\"renderKey\":1598497111542,\"defaultValue\":1},\"placeholder\":\"請輸入驗證碼有效時間 (分鐘)\",\"step\":1,\"step-strictly\":true,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"sms_code_expire\",\"min\":1},{\"__config__\":{\"label\":\"用戶下單管理員提醒\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":104,\"renderKey\":1595407326261,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"adminLowerOrderSwitch\"},{\"__config__\":{\"label\":\"用戶支付成功管理員提醒\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":105,\"renderKey\":1595407326439,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"adminPaySuccessSwitch\"},{\"__config__\":{\"label\":\"用戶退款管理員提醒\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":106,\"renderKey\":1595407326609,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"adminConfirmTakeOverSwitch\"},{\"__config__\":{\"label\":\"用戶確認收貨管理員短信提醒\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":107,\"renderKey\":1595407326779,\"defaultValue\":0},\"__slot__\":{\"options\":[{\"label\":\"關閉\",\"value\":0},{\"label\":\"開啟\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"adminRefundSwitch\"}]}', '2020-07-22 17:00:03', '2021-02-05 10:58:48');
INSERT INTO `eb_system_form_temp` VALUES (112, 'stivepeimTestSelfForm', 'stivepeimTestSelfForm', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"下拉選擇\",\"showLabel\":true,\"labelWidth\":null,\"tag\":\"el-select\",\"tagIcon\":\"select\",\"layout\":\"colFormItem\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/select\",\"formId\":101,\"renderKey\":1600310768204,\"defaultValue\":2},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":1},{\"label\":\"選項二\",\"value\":2}]},\"placeholder\":\"請選擇下拉選擇\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"disabled\":false,\"filterable\":false,\"multiple\":false,\"__vModel__\":\"stt\"},{\"__config__\":{\"label\":\"單選框組\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":103,\"renderKey\":1600311960968,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"選項一\",\"value\":1},{\"label\":\"選項二\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"dd\"},{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1603703137783,\"defaultValue\":\"我很帥\"},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本單行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field101\"}]}', '2020-07-24 14:48:28', '2020-10-26 17:05:45');
INSERT INTO `eb_system_form_temp` VALUES (113, '推廣分享海報', '推廣分享海報', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"title\",\"placeholder\":\"請輸入名稱名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"背景圖\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":true,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":104,\"renderKey\":1596006415029},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-07-29 15:07:42', '2021-03-24 14:23:05');
INSERT INTO `eb_system_form_temp` VALUES (114, '後台登錄頁輪播圖', '後台登錄頁輪播圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"輪播圖\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1596017879033},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"pic\"}]}', '2020-07-29 18:15:46', '2020-07-29 18:18:11');
INSERT INTO `eb_system_form_temp` VALUES (115, '訂單詳情狀態圖', '訂單詳情狀態圖', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"訂單狀態\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"orderStatus\",\"placeholder\":\"0=未支付,1=待發貨,2=待收貨,3=待評價,4=已完成\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"icon地址\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1596022715722},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"url\",\"placeholder\":\"\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false}]}', '2020-07-29 19:40:23', '2020-07-29 19:49:40');
INSERT INTO `eb_system_form_temp` VALUES (116, '測試配置表單', '測試自定義表單', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"網站名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":126,\"renderKey\":1595658466046},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入網站名稱\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"site_name\"},{\"__config__\":{\"label\":\"網站地址\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":111,\"renderKey\":1597048570961},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"site_url\",\"placeholder\":\"webSiet網站地址網站地址\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"Api地址\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"api_url\",\"placeholder\":\"webSiet網站地址Api地址\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"後台LOGO(左上角logo,建議尺寸[170*50])\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":124,\"renderKey\":1595658064081},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"picture-card\",\"multiple\":false,\"__vModel__\":\"site_logo\"},{\"__config__\":{\"label\":\"登錄頁LOGO\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":128,\"renderKey\":1595658697800},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"login_logo\"},{\"__config__\":{\"label\":\"後台LOGO-正方形（尺寸180*180）\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":127,\"renderKey\":1595658695317},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"site_logo_square\"},{\"__config__\":{\"label\":\"登錄頁背景圖\",\"tag\":\"self-upload\",\"tagIcon\":\"upload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":152,\"renderKey\":1596017451389},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"admin_login_bg_pic\"},{\"__config__\":{\"label\":\"SEO標題\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1589534140652},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入SEO標題\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"seo_title\"},{\"__config__\":{\"label\":\"新聞幻燈片數量上限\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-input-number\",\"tagIcon\":\"number\",\"span\":24,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"document\":\"https://element.eleme.cn/#/zh-CN/component/input-number\",\"formId\":116,\"renderKey\":1589941416644},\"placeholder\":\"新聞幻燈片數量上限\",\"step\":1,\"step-strictly\":false,\"controls-position\":\"\",\"disabled\":false,\"__vModel__\":\"news_slides_limit\"}]}', '2020-08-11 14:26:14', '2020-08-11 14:26:14');
INSERT INTO `eb_system_form_temp` VALUES (117, '測試表單', '測試', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"多行文本\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":101,\"renderKey\":1597127427203},\"type\":\"textarea\",\"placeholder\":\"請輸入多行文本\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field101\"}]}', '2020-08-11 14:30:40', '2020-08-11 14:30:40');
INSERT INTO `eb_system_form_temp` VALUES (118, '測試001', '測試', '{\"formRef\":\"user_info\",\"formModel\":\"fromData\",\"size\":\"mini\",\"labelPosition\":\"top\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":50,\"disabled\":false,\"span\":24,\"formBtns\":true,\"unFocusedComponentBorder\":true,\"fields\":[{\"__config__\":{\"label\":\"按鈕\",\"showLabel\":true,\"changeTag\":true,\"labelWidth\":null,\"tag\":\"el-button\",\"tagIcon\":\"button\",\"span\":24,\"layout\":\"colFormItem\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/button\",\"formId\":101,\"renderKey\":1597631676019},\"__slot__\":{\"default\":\"主要按鈕\"},\"type\":\"primary\",\"icon\":\"el-icon-search\",\"round\":false,\"size\":\"small\",\"plain\":false,\"circle\":false,\"disabled\":false,\"__vModel__\":\"field101\"},{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597634310872},\"__slot__\":{\"list-type\":true},\"action\":\"https://jsonplaceholder.typicode.com/posts/\",\"disabled\":true,\"accept\":\"\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"field101\"},{\"__config__\":{\"label\":\"上傳文件\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":101,\"renderKey\":1597634534306},\"__slot__\":{\"list-type\":true},\"name\":\"upfile\",\"__vModel__\":\"field101\"}]}', '2020-08-11 14:40:01', '2020-08-17 11:22:13');
INSERT INTO `eb_system_form_temp` VALUES (119, '測試測試', '測試測試', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[{\"pattern\":\"/^1(3|4|5|7|8|9)\\\\d{9}$/\",\"message\":\"手機號格式錯誤\"}]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"mobile\",\"placeholder\":\"請輸入手機號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":130,\"renderKey\":1597631929188},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image/*\",\"name\":\"file\",\"auto-upload\":true,\"list-type\":\"text\",\"multiple\":false,\"__vModel__\":\"field130\"},{\"__config__\":{\"label\":\"上傳文件\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":131,\"renderKey\":1597631933444},\"__slot__\":{\"list-type\":true},\"accept\":\"audio/*\",\"name\":\"upfile\",\"__vModel__\":\"field131\"}]}', '2020-08-17 10:39:06', '2020-08-17 10:39:06');
INSERT INTO `eb_system_form_temp` VALUES (120, '測後期刪', '測後期刪', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[{\"pattern\":\"/^1(3|4|5|7|8|9)\\\\d{9}$/\",\"message\":\"手機號格式錯誤\"}]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"mobile\",\"placeholder\":\"請輸入手機號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"自定義上傳\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"fileSize\":2,\"sizeUnit\":\"MB\",\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":134,\"renderKey\":1597632545133},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image\",\"name\":\"file\",\"multiple\":false,\"__vModel__\":\"field134\"},{\"__config__\":{\"label\":\"上傳文件\",\"tag\":\"upload-file\",\"tagIcon\":\"uploadPicture\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"點擊上傳\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":134,\"renderKey\":1597632587620},\"__slot__\":{\"list-type\":true},\"accept\":\".doc,.docx\",\"name\":\"upfile\",\"__vModel__\":\"field134\"}]}', '2020-08-17 10:49:50', '2020-08-17 10:49:50');
INSERT INTO `eb_system_form_temp` VALUES (122, '99api', '99api', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"ApiKey\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1599538285999},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入ApiKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"importProductToken\"}]}', '2020-09-08 12:17:06', '2020-09-08 12:17:06');
INSERT INTO `eb_system_form_temp` VALUES (123, '秒殺配置', '秒殺配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"名稱\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"name\",\"placeholder\":\"請輸入名稱\",\"style\":{\"width\":\"445px\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"20\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"時間範圍\",\"tag\":\"time-select\",\"tagIcon\":\"time-select\",\"span\":24,\"showLabel\":true,\"labelWidth\":null,\"layout\":\"colFormItem\",\"defaultValue\":null,\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/time-picker\",\"formId\":121,\"renderKey\":1600316421235},\"style\":{\"width\":\"100%\"},\"disabled\":false,\"clearable\":true,\"placeholder\":\"請選擇時間範圍\",\"format\":\"HH:mm\",\"value-format\":\"HH:mm\",\"__vModel__\":\"time\"},{\"__config__\":{\"label\":\"幻燈片\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":122,\"renderKey\":1600316451807},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image\",\"name\":\"file\",\"multiple\":true,\"__vModel__\":\"silderImgs\"},{\"__config__\":{\"label\":\"狀態\",\"tag\":\"el-switch\",\"tagIcon\":\"switch\",\"defaultValue\":1,\"span\":24,\"showLabel\":true,\"labelWidth\":null,\"layout\":\"colFormItem\",\"required\":true,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/switch\",\"formId\":124,\"renderKey\":1600316508895},\"style\":{},\"disabled\":false,\"active-text\":\"開啟\",\"inactive-text\":\"關閉\",\"active-color\":null,\"inactive-color\":null,\"active-value\":1,\"inactive-value\":0,\"__vModel__\":\"status\"}]}', '2020-09-17 12:23:38', '2020-10-20 17:57:52');
INSERT INTO `eb_system_form_temp` VALUES (124, '微信提現申請', '微信提現申請', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"姓名\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"realName\",\"placeholder\":\"請輸入姓名姓名姓名姓名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"20\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"提現金額\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":126,\"renderKey\":1600828362052},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入提現金額\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":true,\"disabled\":false,\"__vModel__\":\"extractPrice\"},{\"__config__\":{\"label\":\"微信號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":127,\"renderKey\":1600828491788},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入微信號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"wechat\"},{\"__config__\":{\"label\":\"備註\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":128,\"renderKey\":1600828493137},\"type\":\"textarea\",\"placeholder\":\"請輸入備註\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"mark\"}]}', '2020-09-23 10:38:16', '2020-10-29 09:33:51');
INSERT INTO `eb_system_form_temp` VALUES (125, '銀行卡提現申請', '銀行卡提現申請', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"姓名\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"defaultValue\":\"\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"realName\",\"placeholder\":\"請輸入姓名姓名姓名姓名姓名姓名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"15\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"提現金額\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1603703481683},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入提現金額\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":true,\"disabled\":false,\"__vModel__\":\"extractPrice\"},{\"__config__\":{\"label\":\"銀行卡號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1603703520389},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入銀行卡號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"bankCode\"},{\"__config__\":{\"label\":\"開戶行\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1603703557229},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入開戶行\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"bankName\"},{\"__config__\":{\"label\":\"備註\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":104,\"renderKey\":1603703559381},\"type\":\"textarea\",\"placeholder\":\"請輸入備註\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"mark\"}]}', '2020-10-26 17:14:21', '2020-10-29 09:57:58');
INSERT INTO `eb_system_form_temp` VALUES (126, '支付寶提現申請', '支付寶提現申請', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"姓名\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"defaultValue\":\"\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"realName\",\"placeholder\":\"請輸入姓名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"15\",\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"提現金額\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1603703481683},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入提現金額\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":true,\"disabled\":false,\"__vModel__\":\"extractPrice\"},{\"__config__\":{\"label\":\"支付寶賬號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1603703520389},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入支付寶賬號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"alipayCode\"},{\"__config__\":{\"label\":\"備註\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":false,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":104,\"renderKey\":1603703559381},\"type\":\"textarea\",\"placeholder\":\"請輸入備註\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"mark\"}]}', '2020-10-26 17:15:51', '2020-10-26 17:15:51');
INSERT INTO `eb_system_form_temp` VALUES (127, '採集商品配置', '採集商品配置', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"接口選擇\",\"labelWidth\":150,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1607573281676,\"defaultValue\":2},\"__slot__\":{\"options\":[{\"label\":\"一號通\",\"value\":1},{\"label\":\"99Api\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"system_product_copy_type\"},{\"__config__\":{\"label\":\"99Api apiKey\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":107,\"renderKey\":1607574237325},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入99Api apiKey\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"copy_product_apikey\"}]}', '2020-12-10 12:04:13', '2020-12-10 14:37:55');
INSERT INTO `eb_system_form_temp` VALUES (128, '物流查詢', '物流查詢', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"接口選擇\",\"labelWidth\":150,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1607573397849,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"一號通\",\"value\":1},{\"label\":\"阿里雲物流查詢\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"logistics_type\"},{\"__config__\":{\"label\":\"快遞查詢密鑰\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1607574358258},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"阿里云云市場快遞查詢接口密鑰購買地址：https://market.aliyun.com/products/57126001/cmapi021863.html?userCode=dligum2z\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"system_express_app_code\"}]}', '2020-12-10 12:11:38', '2021-03-25 14:14:35');
INSERT INTO `eb_system_form_temp` VALUES (129, '電子面單', '電子面單', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"電子面單是否開啟\",\"labelWidth\":150,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1607573397849,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"打開\",\"value\":1},{\"label\":\"關閉\",\"value\":2}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"config_export_open\"},{\"__config__\":{\"label\":\"發貨人姓名\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1607573602374},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"快遞面單發貨人姓名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"el-icon-warning-outline\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"config_export_to_name\"},{\"__config__\":{\"label\":\"發貨人電話\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":103,\"renderKey\":1607573608679},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"快遞面單發貨人電話\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"config_export_to_tel\"},{\"__config__\":{\"label\":\"發貨人詳細地址\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":104,\"renderKey\":1607573609130},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"快遞面單發貨人詳細地址\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"config_export_to_address\"},{\"__config__\":{\"label\":\"電子面單打印機編號\",\"labelWidth\":150,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":105,\"renderKey\":1607573609617},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請購買快遞100電子面單打印機，淘寶地址：https://m.tb.cn/h.437NvI0 官網：https://www.kuaidi100.com/cloud/print/cloudprinterSecond.shtml\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"el-icon-warning-outline\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"config_export_siid\"}]}', '2020-12-10 12:18:18', '2020-12-17 15:00:27');
INSERT INTO `eb_system_form_temp` VALUES (130, '充值退款', '充值退款', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"編號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":102,\"renderKey\":1608271559043},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入編號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":true,\"__vModel__\":\"id\"},{\"__config__\":{\"label\":\"退款單號\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"orderId\",\"placeholder\":\"請輸入退款單號退款單號退款單號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":true,\"readonly\":true,\"disabled\":false},{\"__config__\":{\"label\":\"狀態\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-radio-group\",\"tagIcon\":\"radio\",\"changeTag\":true,\"layout\":\"colFormItem\",\"span\":24,\"optionType\":\"default\",\"regList\":[],\"required\":true,\"border\":false,\"document\":\"https://element.eleme.cn/#/zh-CN/component/radio\",\"formId\":101,\"renderKey\":1608263757741,\"defaultValue\":1},\"__slot__\":{\"options\":[{\"label\":\"本金+贈送\",\"value\":2},{\"label\":\"僅本金\",\"value\":1}]},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"__vModel__\":\"type\"}]}', '2020-12-18 11:56:49', '2020-12-18 14:49:17');
INSERT INTO `eb_system_form_temp` VALUES (131, 't1', 't1', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[{\"pattern\":\"/^1(3|4|5|7|8|9)\\\\d{9}$/\",\"message\":\"手機號格式錯誤\"}]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"mobile\",\"placeholder\":\"請輸入手機號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false},{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[],\"formId\":101,\"renderKey\":1611281166533},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"placeholder\":\"請輸入單行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"field101\"}]}', '2021-01-22 10:06:08', '2021-01-22 10:06:08');
INSERT INTO `eb_system_form_temp` VALUES (132, 't2', 't2', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"單行文本\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[{\"pattern\":\"/^1(3|4|5|7|8|9)\\\\d{9}$/\",\"message\":\"手機號格式錯誤\"}]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"mobile\",\"placeholder\":\"請輸入手機號\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":11,\"show-word-limit\":true,\"readonly\":false,\"disabled\":false}]}', '2021-01-22 10:06:20', '2021-01-22 10:06:20');
INSERT INTO `eb_system_form_temp` VALUES (133, '首頁配置', '首頁配置', '{\"formRef\":\"stivepeimEdited\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":140,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"精品推薦簡介\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":103,\"renderKey\":1591148546642},\"type\":\"textarea\",\"placeholder\":\"請輸入精品推薦簡介\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"bastInfo\"},{\"__config__\":{\"label\":\"首發新品簡介\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":104,\"renderKey\":1591148566944},\"type\":\"textarea\",\"placeholder\":\"請輸入首發新品簡介\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"firstInfo\"},{\"__config__\":{\"label\":\"促銷單品簡介\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":105,\"renderKey\":1591148567412},\"type\":\"textarea\",\"placeholder\":\"請輸入促銷單品簡介\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"salesInfo\"},{\"__config__\":{\"label\":\"熱門推薦簡介\",\"labelWidth\":null,\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"formId\":102,\"renderKey\":1597821020375},\"type\":\"textarea\",\"placeholder\":\"請輸入熱門推薦簡介\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"maxlength\":null,\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"__vModel__\":\"hotInfo\"}]}', '2021-02-06 11:19:43', '2021-02-06 11:19:43');
INSERT INTO `eb_system_form_temp` VALUES (134, '測試134', '測試134', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"測試\",\"labelWidth\":null,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"defaultValue\":\"\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"test\",\"placeholder\":\"請輸入測試\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false}]}', '2021-03-24 16:16:16', '2021-06-11 15:18:36');
INSERT INTO `eb_system_form_temp` VALUES (135, '測試135', '測試135', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"測試\",\"labelWidth\":200,\"showLabel\":true,\"changeTag\":true,\"tag\":\"el-input\",\"tagIcon\":\"input\",\"defaultValue\":\"\",\"required\":true,\"layout\":\"colFormItem\",\"span\":24,\"document\":\"https://element.eleme.cn/#/zh-CN/component/input\",\"regList\":[]},\"__slot__\":{\"prepend\":\"\",\"append\":\"\"},\"__vModel__\":\"test\",\"placeholder\":\"請輸入測試\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"el-icon-mobile\",\"suffix-icon\":\"\",\"maxlength\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false}]}', '2021-03-24 16:24:43', '2021-06-11 15:18:08');
INSERT INTO `eb_system_form_temp` VALUES (136, '拼團列表banner', '拼團列表banner', '{\"formRef\":\"elForm\",\"formModel\":\"formData\",\"size\":\"medium\",\"labelPosition\":\"right\",\"labelWidth\":100,\"formRules\":\"rules\",\"gutter\":15,\"disabled\":false,\"span\":24,\"formBtns\":true,\"fields\":[{\"__config__\":{\"label\":\"請上傳圖片\",\"tag\":\"self-upload\",\"tagIcon\":\"selfUpload\",\"layout\":\"colFormItem\",\"defaultValue\":null,\"showLabel\":true,\"labelWidth\":null,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"\",\"regList\":[],\"changeTag\":true,\"document\":\"https://element.eleme.cn/#/zh-CN/component/upload\",\"formId\":102,\"renderKey\":1620439915360},\"__slot__\":{\"list-type\":true},\"disabled\":true,\"accept\":\"image\",\"name\":\"file\",\"multiple\":false,\"__vModel__\":\"value\"}]}', '2021-05-08 10:12:43', '2021-05-08 10:44:37');

-- ----------------------------
-- Table structure for eb_system_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group`;
CREATE TABLE `eb_system_group`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '組合數據ID',
                                    `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '數據組名稱',
                                    `info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '簡介',
                                    `form_id` int(11) NOT NULL DEFAULT 0 COMMENT 'form 表單 id',
                                    `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                    `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '組合數據表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group
-- ----------------------------
INSERT INTO `eb_system_group` VALUES (37, '移動端_首頁中部推薦banner圖', '移動端_首頁中部推薦banner圖', 95, '2020-05-15 10:38:22', '2021-02-24 18:24:35');
INSERT INTO `eb_system_group` VALUES (48, '移動端_首頁banner滾動圖', '移動端_首頁banner滾動圖', 95, '2020-05-15 10:38:22', '2021-02-24 18:24:06');
INSERT INTO `eb_system_group` VALUES (52, '移動端_首頁_精品推薦benner圖', '移動端_首頁_精品推薦benner圖', 91, '2020-05-15 10:38:22', '2021-02-24 18:11:47');
INSERT INTO `eb_system_group` VALUES (53, '移動端_訂單詳情狀態圖', '移動端_訂單詳情狀態圖', 115, '2020-05-15 10:38:22', '2021-02-24 18:23:25');
INSERT INTO `eb_system_group` VALUES (54, '移動端_個人中心功能菜單', '移動端_個人中心功能菜單', 89, '2020-05-15 10:38:22', '2021-02-24 18:22:22');
INSERT INTO `eb_system_group` VALUES (55, '移動端_我的_簽到天數配置', '移動端_我的_簽到天數配置', 87, '2020-05-15 10:38:22', '2021-02-24 18:21:38');
INSERT INTO `eb_system_group` VALUES (57, '移動端_首頁_熱門榜單推薦圖片', '移動端_首頁_熱門榜單推薦圖片', 94, '2020-05-15 10:38:22', '2021-02-24 18:11:34');
INSERT INTO `eb_system_group` VALUES (58, '移動端_首頁_首發新品推薦圖片', '移動端_首頁_首發新品推薦圖片', 92, '2020-05-15 10:38:22', '2021-02-24 18:11:18');
INSERT INTO `eb_system_group` VALUES (59, '移動端_首頁活動_促銷單品推薦圖片', '移動端_首頁活動_促銷單品推薦圖片', 93, '2020-05-15 10:38:22', '2021-02-24 18:10:29');
INSERT INTO `eb_system_group` VALUES (60, '移動端_我的推廣_分享海報', '移動端_我的推廣_分享海報', 113, '2020-05-15 10:38:22', '2021-02-24 18:10:08');
INSERT INTO `eb_system_group` VALUES (62, '移動端_充值金額設置', '移動端_設置充值金額額度選擇', 103, '2020-05-15 10:38:22', '2021-02-24 18:08:56');
INSERT INTO `eb_system_group` VALUES (65, '移動端_個人中心輪播圖', '移動端_個人中心輪播圖', 90, '2020-06-02 10:25:03', '2021-02-24 17:38:12');
INSERT INTO `eb_system_group` VALUES (67, '移動端_首頁導航', '移動端_首頁導航', 96, '2020-06-02 14:54:41', '2021-02-24 17:37:59');
INSERT INTO `eb_system_group` VALUES (68, '移動端_首頁滾動新聞_二期配置', '移動端_首頁滾動新聞_二期配置', 97, '2020-06-02 18:00:47', '2021-02-24 18:08:45');
INSERT INTO `eb_system_group` VALUES (70, '移動端_首頁超值爆款區域', '移動端_首頁超值爆款漁區', 99, '2020-06-02 18:01:10', '2021-02-24 16:43:57');
INSERT INTO `eb_system_group` VALUES (71, '移動端_熱門搜索', '移動端_熱門搜索', 102, '2020-06-03 11:34:42', '2021-02-24 16:43:36');
INSERT INTO `eb_system_group` VALUES (72, 'WEBPC管理端_登錄頁輪播圖', 'WEBPC管理端_登錄頁輪播圖', 114, '2020-07-29 18:16:11', '2021-02-24 16:42:50');
INSERT INTO `eb_system_group` VALUES (73, '移動端_拼團列表banner', '移動端_拼團列表banner', 136, '2021-05-08 10:13:24', '2021-05-08 10:13:24');

-- ----------------------------
-- Table structure for eb_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group_data`;
CREATE TABLE `eb_system_group_data`  (
                                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '組合數據詳情ID',
                                         `gid` int(11) NOT NULL DEFAULT 0 COMMENT '對應的數據組id',
                                         `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '數據組對應的數據值（json數據）',
                                         `sort` int(11) NOT NULL DEFAULT 0 COMMENT '數據排序',
                                         `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態（1：開啟；2：關閉；）',
                                         `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                         `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '組合數據詳情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group_data
-- ----------------------------
INSERT INTO `eb_system_group_data` VALUES (39, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第一天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"1\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"10\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"10\"}],\"id\":87,\"sort\":1,\"status\":true}', 1, 1, '2020-05-28 14:34:00', '2020-05-28 15:08:02');
INSERT INTO `eb_system_group_data` VALUES (40, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第二天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"2\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"20\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"20\"}],\"id\":87,\"sort\":2,\"status\":true}', 2, 1, '2020-05-28 14:34:09', '2020-05-28 15:08:08');
INSERT INTO `eb_system_group_data` VALUES (41, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第三天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"3\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"30\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"30\"}],\"id\":87,\"sort\":3,\"status\":true}', 3, 1, '2020-05-28 14:34:14', '2020-05-28 15:08:14');
INSERT INTO `eb_system_group_data` VALUES (42, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第四天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"4\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"40\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"40\"}],\"id\":87,\"sort\":4,\"status\":true}', 4, 1, '2020-05-28 14:34:19', '2020-05-28 15:08:20');
INSERT INTO `eb_system_group_data` VALUES (43, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第五天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"5\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"50\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"50\"}],\"id\":87,\"sort\":5,\"status\":true}', 5, 1, '2020-05-28 14:34:34', '2020-05-28 15:08:26');
INSERT INTO `eb_system_group_data` VALUES (44, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第六天\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"6\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"60\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"60\"}],\"id\":87,\"sort\":6,\"status\":true}', 6, 1, '2020-05-28 14:34:39', '2020-05-28 15:08:33');
INSERT INTO `eb_system_group_data` VALUES (57, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"會員中心\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/481e308eeabf4910823b3558ccc19403mv8yjufemd.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_vip/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_vip/index\"}],\"id\":89,\"sort\":1,\"status\":true}', 1, 1, '2020-06-02 09:36:26', '2020-09-09 14:32:55');
INSERT INTO `eb_system_group_data` VALUES (58, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"砍價記錄\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/01/16/e98db74f48ea4ed3b35d4432636edd05w9qf1rowh4.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/activity/bargain/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/activity/bargain/index\"}],\"id\":89,\"sort\":2,\"status\":true}', 2, 1, '2020-06-02 09:36:45', '2021-05-06 16:04:00');
INSERT INTO `eb_system_group_data` VALUES (59, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"我的推廣\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/f09a614eca0546748e5e71b565e8d662kxkezi9bbv.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_spread_user/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_spread_user/index\"}],\"id\":89,\"sort\":3,\"status\":true}', 3, 1, '2020-06-02 09:37:12', '2020-08-13 11:17:04');
INSERT INTO `eb_system_group_data` VALUES (60, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"我的余額\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/9e9c5129966244b78cfb68778fbd7a81k6stba15mw.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_money/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_money/index\"}],\"id\":89,\"sort\":4,\"status\":true}', 4, 1, '2020-06-02 09:37:28', '2020-08-13 11:17:17');
INSERT INTO `eb_system_group_data` VALUES (61, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"地址信息\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/8529e290c5874ddd82fcf7b104955949izoulykd53.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_address_list/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_address_list/index\"}],\"id\":89,\"sort\":5,\"status\":true}', 5, 1, '2020-06-02 09:37:39', '2020-08-13 11:17:40');
INSERT INTO `eb_system_group_data` VALUES (62, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"我的收藏\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/278a0afed5af4f3bbdd4924eff96a6adqa5k51i1cb.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_goods_collection/index\"}],\"id\":89,\"sort\":6,\"status\":true}', 6, 1, '2020-06-02 09:37:57', '2020-08-13 11:17:54');
INSERT INTO `eb_system_group_data` VALUES (63, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"優惠券\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/5f56e229217a4c38b3da0e3a53ecc667o478oy5v4v.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_coupon/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"/pages/users/user_coupon/index\"}],\"id\":89,\"sort\":7,\"status\":true}', 7, 1, '2020-06-02 09:38:18', '2020-08-13 11:18:16');
INSERT INTO `eb_system_group_data` VALUES (64, 54, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"聯繫客服\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/content/2020/08/13/42b5167b93a44430ba86acc8bf666de3h2owh5walv.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/service/index\"},{\"name\":\"wap_url\",\"title\":\"wap_url\",\"value\":\"https://yzf.qq.com/xv/web/static/chat/index.html?sign=37ef9b97db2656c32340cde61ce2b56a2176efe72ac7ed421c77607b5c816611ec4775a17c7605b33df1ffe1d22a4ce7464dd07b\"}],\"id\":89,\"sort\":8,\"status\":true}', 8, 1, '2020-06-02 09:38:36', '2020-09-09 15:55:45');
INSERT INTO `eb_system_group_data` VALUES (68, 65, '{\"fields\":[{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/1aeaed1e02e542088c53eaaa38dab6eddyxjgr4n70.jpg\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"www.crmeb.net\"}],\"id\":90,\"sort\":2,\"status\":true}', 2, 1, '2020-06-02 10:29:03', '2020-08-13 13:00:40');
INSERT INTO `eb_system_group_data` VALUES (71, 52, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"pro\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_vip/index\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/64edb94f67fd46dd9031995ef2be86fca3xpw8y5kz.jpg\"}],\"id\":91,\"sort\":3,\"status\":true}', 3, 1, '2020-06-02 10:43:33', '2020-08-13 12:33:23');
INSERT INTO `eb_system_group_data` VALUES (72, 70, '{\"fields\":[{\"name\":\"image\",\"title\":\"image\",\"value\":\"crmebimage/maintain/2020/08/13/9c42291970364fcb8d7fdbdaf96900152rpyexrh3s.png\"},{\"name\":\"title\",\"title\":\"title\",\"value\":\"精品推薦\"},{\"name\":\"info\",\"title\":\"info\",\"value\":\"精品推薦\"},{\"name\":\"type\",\"title\":\"type\",\"value\":\"1\"}],\"id\":99,\"sort\":1,\"status\":true}', 1, 1, '2020-06-03 09:22:32', '2021-02-24 16:07:05');
INSERT INTO `eb_system_group_data` VALUES (74, 70, '{\"fields\":[{\"name\":\"image\",\"title\":\"image\",\"value\":\"crmebimage/maintain/2020/08/13/6c7b8a2777a743bcac0b4d11465384bejp8n19peeg.png\"},{\"name\":\"title\",\"title\":\"title\",\"value\":\"首發新品\"},{\"name\":\"info\",\"title\":\"info\",\"value\":\"首發新品\"},{\"name\":\"type\",\"title\":\"type\",\"value\":\"3\"}],\"id\":99,\"sort\":3,\"status\":true}', 3, 1, '2020-06-03 09:23:15', '2021-02-24 16:09:56');
INSERT INTO `eb_system_group_data` VALUES (75, 70, '{\"fields\":[{\"name\":\"image\",\"title\":\"image\",\"value\":\"crmebimage/maintain/2020/08/13/ae7f17f9ebae4c6fbb51772b934d4077xllfw2cd12.png\"},{\"name\":\"title\",\"title\":\"title\",\"value\":\"促銷單品\"},{\"name\":\"info\",\"title\":\"info\",\"value\":\"多買多省\"},{\"name\":\"type\",\"title\":\"type\",\"value\":\"4\"}],\"id\":99,\"sort\":0,\"status\":true}', 0, 1, '2020-06-03 09:23:32', '2021-02-24 16:10:31');
INSERT INTO `eb_system_group_data` VALUES (78, 48, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"pro\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/news_details/index?id=1\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/2e0e4ffe26d045968fe9e6082e7221b5eohjjkkg0a.jpg\"}],\"id\":95,\"sort\":1,\"status\":true}', 1, 1, '2020-06-03 09:29:54', '2021-02-25 10:22:38');
INSERT INTO `eb_system_group_data` VALUES (79, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"商品分類\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/91379d2939284e5db2a9cc0915fccf4a6wru3vj2q3.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/goods_cate/goods_cate\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"1\"}],\"id\":96,\"sort\":1,\"status\":true}', 1, 1, '2020-06-03 09:33:06', '2020-08-13 11:27:31');
INSERT INTO `eb_system_group_data` VALUES (80, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"領優惠券\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/e62f702add5043c6af73a95becca0985s0nebb3f3d.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_get_coupon/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":2,\"status\":true}', 2, 1, '2020-06-03 09:33:18', '2020-08-13 11:27:49');
INSERT INTO `eb_system_group_data` VALUES (81, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"行業資訊\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/6292cc8c10564acbbb7d43eed26ed8798ij2deo3sk.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/news_list/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":3,\"status\":true}', 3, 1, '2020-06-03 09:33:38', '2020-08-13 11:28:02');
INSERT INTO `eb_system_group_data` VALUES (82, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"我要簽到\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/d4003b6bdbbb4ec2bf93c5f7a6e9f6383fwxssjlwp.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_sgin/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":4,\"status\":true}', 4, 1, '2020-06-03 09:35:33', '2020-08-13 11:28:25');
INSERT INTO `eb_system_group_data` VALUES (83, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"我的收藏\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/50bed67b30774124a07b8003247243f059fmipd1zd.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_goods_collection/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":5,\"status\":true}', 5, 1, '2020-06-03 09:37:36', '2020-08-13 11:28:39');
INSERT INTO `eb_system_group_data` VALUES (84, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"拼團活動\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/5f71607a688940eea181dcd1ed6e9f51m1icpzgorz.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/activity/goods_combination/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":6,\"status\":true}', 6, 1, '2020-06-03 09:37:50', '2020-11-20 14:58:11');
INSERT INTO `eb_system_group_data` VALUES (85, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"秒殺活動\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/09/22/418de2532b63423eab7f9fa2f67a9e5erxr5d76106.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/activity/goods_seckill/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":7,\"status\":true}', 7, 1, '2020-06-03 09:38:01', '2020-09-22 11:52:23');
INSERT INTO `eb_system_group_data` VALUES (86, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"砍價活動\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/02/25/e45bb464369f485ca8775b0349befdc2pkvtzg8xlc.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/activity/goods_bargain/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":8,\"status\":true}', 8, 1, '2020-06-03 09:38:13', '2021-02-25 09:58:55');
INSERT INTO `eb_system_group_data` VALUES (87, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"地址管理\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/2f2a3420ee0945fdb05614691f7beda8oiax27m3yb.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/user_address_list/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":9,\"status\":true}', 9, 1, '2020-06-03 09:38:29', '2021-02-20 10:56:42');
INSERT INTO `eb_system_group_data` VALUES (88, 67, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"訂單管理\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/af3304699927443db884fe468295cee8oss2xgnb4n.png\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/users/order_list/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"2\"}],\"id\":96,\"sort\":10,\"status\":true}', 10, 1, '2020-06-03 09:38:42', '2021-02-20 10:56:47');
INSERT INTO `eb_system_group_data` VALUES (89, 68, '{\"fields\":[{\"name\":\"info\",\"title\":\"info\",\"value\":\"CRMEB電商系統Java版正式發布！\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/news_list/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"1\"}],\"id\":97,\"sort\":1,\"status\":true}', 1, 1, '2020-06-03 09:39:53', '2020-08-13 10:33:17');
INSERT INTO `eb_system_group_data` VALUES (90, 68, '{\"fields\":[{\"name\":\"info\",\"title\":\"info\",\"value\":\"CRMEB電商系統Java版正式發布！\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/news_list/index\"},{\"name\":\"show\",\"title\":\"show\",\"value\":\"1\"}],\"id\":97,\"sort\":2,\"status\":true}', 2, 1, '2020-06-03 09:40:11', '2020-08-13 10:33:14');
INSERT INTO `eb_system_group_data` VALUES (91, 71, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"衣服\"}],\"id\":102,\"sort\":1,\"status\":true}', 1, 1, '2020-06-03 11:34:54', '2020-06-03 11:34:54');
INSERT INTO `eb_system_group_data` VALUES (92, 71, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"鞋子\"}],\"id\":102,\"sort\":2,\"status\":true}', 2, 1, '2020-06-03 11:35:00', '2020-06-03 11:35:00');
INSERT INTO `eb_system_group_data` VALUES (93, 71, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"葉子\"}],\"id\":102,\"sort\":3,\"status\":true}', 3, 1, '2020-06-03 11:35:07', '2020-06-03 11:35:07');
INSERT INTO `eb_system_group_data` VALUES (94, 71, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"MacBook Pro\"}],\"id\":102,\"sort\":4,\"status\":true}', 4, 1, '2020-06-03 11:35:29', '2020-06-03 11:35:29');
INSERT INTO `eb_system_group_data` VALUES (95, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"0.01\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"0.1\"}],\"id\":103,\"sort\":1,\"status\":true}', 1, 1, '2020-06-10 15:13:01', '2021-05-13 10:25:43');
INSERT INTO `eb_system_group_data` VALUES (96, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"30.00\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"3.00\"}],\"id\":103,\"sort\":2,\"status\":true}', 2, 1, '2020-06-10 15:13:15', '2020-06-10 15:13:15');
INSERT INTO `eb_system_group_data` VALUES (97, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"50.00\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"5.00\"}],\"id\":103,\"sort\":3,\"status\":true}', 3, 1, '2020-06-10 15:13:39', '2020-06-10 15:13:39');
INSERT INTO `eb_system_group_data` VALUES (98, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"500.00\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"50.00\"}],\"id\":103,\"sort\":12,\"status\":true}', 12, 1, '2020-06-10 15:13:49', '2021-05-13 10:26:27');
INSERT INTO `eb_system_group_data` VALUES (99, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"800.00\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"100.00\"}],\"id\":103,\"sort\":15,\"status\":true}', 15, 1, '2020-06-10 15:13:58', '2021-05-13 10:26:20');
INSERT INTO `eb_system_group_data` VALUES (100, 60, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"海報1\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/product/2020/08/03/755bf516b1ca4b6db3bfeaa4dd5901cdh71kob20re.jpg\"}],\"id\":113,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 15:08:28', '2020-08-03 16:55:49');
INSERT INTO `eb_system_group_data` VALUES (101, 60, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"海報2\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/02/25/b81d29a8e5144b628652fdc85c8fc191lm9qw1vfn4.jpeg\"}],\"id\":113,\"sort\":2,\"status\":true}', 2, 1, '2020-07-29 15:08:41', '2021-02-25 10:33:10');
INSERT INTO `eb_system_group_data` VALUES (102, 60, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"海報3\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/02/25/4a436732f0fa471b9162e7fcbffda533q20hvmp9l5.jpeg\"}],\"id\":113,\"sort\":3,\"status\":true}', 3, 1, '2020-07-29 15:09:02', '2021-02-25 10:33:17');
INSERT INTO `eb_system_group_data` VALUES (109, 72, '{\"fields\":[{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/04/20/2fa4b060a4e04e8d82ef909fa26f855bkslyn2qjgt.jpg\"}],\"id\":114,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 18:16:33', '2021-04-20 14:58:09');
INSERT INTO `eb_system_group_data` VALUES (111, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"0\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122042.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 19:59:14', '2021-02-24 12:21:07');
INSERT INTO `eb_system_group_data` VALUES (112, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"1\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122043.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 19:59:29', '2021-02-24 12:21:28');
INSERT INTO `eb_system_group_data` VALUES (113, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"2\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122044.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 19:59:47', '2021-02-24 12:21:40');
INSERT INTO `eb_system_group_data` VALUES (114, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"3\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122045.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 20:00:02', '2021-02-24 12:21:53');
INSERT INTO `eb_system_group_data` VALUES (115, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"4\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122046.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 20:00:14', '2021-02-24 12:22:07');
INSERT INTO `eb_system_group_data` VALUES (116, 53, '{\"fields\":[{\"name\":\"orderStatus\",\"title\":\"orderStatus\",\"value\":\"9\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://gitee.com/stivepeim/img4mk/raw/master/20210224122047.gif\"}],\"id\":115,\"sort\":1,\"status\":true}', 1, 1, '2020-07-29 20:00:30', '2021-02-24 12:22:18');
INSERT INTO `eb_system_group_data` VALUES (117, 37, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"精品推薦\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/goods_details/index?id=9\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/f77ff754930b48f6b9acb56ea4740e93qnbzwe6lu7.jpg\"}],\"id\":95,\"sort\":1,\"status\":true}', 1, 1, '2020-08-13 12:34:52', '2021-02-24 18:18:19');
INSERT INTO `eb_system_group_data` VALUES (118, 37, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"BANNER\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"/pages/goods_details/index?id=24\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/f2fb85fba7bd4078adb252014d3e8896e48sbh2gwr.jpg\"}],\"id\":95,\"sort\":2,\"status\":true}', 2, 1, '2020-08-13 12:41:15', '2021-02-24 18:18:24');
INSERT INTO `eb_system_group_data` VALUES (119, 48, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"首頁banner\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"*\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/38470df90d8c436fade672478461e3732l8z7ernvh.jpg\"}],\"id\":95,\"sort\":2}', 2, 1, '2020-08-13 12:42:49', '2020-08-13 12:42:49');
INSERT INTO `eb_system_group_data` VALUES (120, 59, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"1\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"1\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2020/08/13/f2fb85fba7bd4078adb252014d3e8896e48sbh2gwr.jpg\"}],\"id\":93,\"sort\":1}', 1, 1, '2020-08-13 13:04:36', '2020-08-13 13:04:36');
INSERT INTO `eb_system_group_data` VALUES (122, 55, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"第七條\"},{\"name\":\"day\",\"title\":\"day\",\"value\":\"7\"},{\"name\":\"integral\",\"title\":\"integral\",\"value\":\"70\"},{\"name\":\"experience\",\"title\":\"experience\",\"value\":\"70\"}],\"id\":87,\"sort\":7,\"status\":true}', 7, 1, '2020-12-21 16:18:20', '2020-12-21 16:18:40');
INSERT INTO `eb_system_group_data` VALUES (124, 70, '{\"fields\":[{\"name\":\"image\",\"title\":\"image\",\"value\":\"crmebimage/content/2021/02/05/ec370cb4f22840cfadaae51a8c8d24c7yu8dsw43tg.png\"},{\"name\":\"title\",\"title\":\"title\",\"value\":\"熱門榜單\"},{\"name\":\"info\",\"title\":\"info\",\"value\":\"熱門榜單\"},{\"name\":\"type\",\"title\":\"type\",\"value\":\"2\"}],\"id\":99,\"sort\":1,\"status\":true}', 1, 1, '2021-02-06 11:30:25', '2021-02-24 16:09:47');
INSERT INTO `eb_system_group_data` VALUES (125, 71, '{\"fields\":[{\"name\":\"title\",\"title\":\"title\",\"value\":\"測試\"}],\"id\":102,\"sort\":0,\"status\":true}', 0, 1, '2021-02-07 12:18:07', '2021-02-07 12:18:07');
INSERT INTO `eb_system_group_data` VALUES (126, 58, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"1111\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"1111\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/store/2021/02/07/3cd64db508f64dff981efd7eb6acde3be3hqbmob08.png\"}],\"id\":92,\"sort\":1,\"status\":true}', 1, 1, '2021-02-22 10:58:27', '2021-02-22 10:58:46');
INSERT INTO `eb_system_group_data` VALUES (127, 69, '{\"fields\":[{\"name\":\"image\",\"title\":\"image\",\"value\":\"crmebimage/maintain/2021/02/24/23ab5b9968aa4e29a245ea8b8a4804cbkscfppxkwq.png\"},{\"name\":\"title\",\"title\":\"title\",\"value\":\"stivepeim\"},{\"name\":\"info\",\"title\":\"info\",\"value\":\"stivepeim\"},{\"name\":\"link\",\"title\":\"link\",\"value\":\"/pages/activity/goods_seckill/index\"}],\"id\":98,\"sort\":1,\"status\":true}', 1, 1, '2021-02-24 10:07:52', '2021-02-24 10:07:52');
INSERT INTO `eb_system_group_data` VALUES (128, 57, '{\"fields\":[{\"name\":\"name\",\"title\":\"name\",\"value\":\"21212\"},{\"name\":\"url\",\"title\":\"url\",\"value\":\"https://crmeb.com\"},{\"name\":\"pic\",\"title\":\"pic\",\"value\":\"crmebimage/maintain/2021/02/24/23ab5b9968aa4e29a245ea8b8a4804cbkscfppxkwq.png\"}],\"id\":94,\"sort\":1,\"status\":true}', 1, 1, '2021-02-24 16:15:46', '2021-02-24 16:18:07');
INSERT INTO `eb_system_group_data` VALUES (129, 73, '{\"fields\":[{\"name\":\"value\",\"title\":\"value\",\"value\":\"crmebimage/operation/2021/04/20/93416841e4d24d78acc3e5033a5655a2koamzvaetn.jpg\"}],\"id\":136,\"sort\":1,\"status\":false}', 1, 0, '2021-05-08 10:13:47', '2021-05-14 17:57:27');
INSERT INTO `eb_system_group_data` VALUES (130, 73, '{\"fields\":[{\"name\":\"value\",\"title\":\"value\",\"value\":\"crmebimage/operation/2021/02/04/080e3fe9dd9645dca740ca8e74d423e246dbybhnu7.jpg\"}],\"id\":136,\"sort\":2,\"status\":true}', 2, 1, '2021-05-08 10:14:20', '2021-05-08 10:45:23');
INSERT INTO `eb_system_group_data` VALUES (131, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"100\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"10\"}],\"id\":103,\"sort\":8,\"status\":true}', 8, 1, '2021-05-13 10:24:56', '2021-05-13 10:26:10');
INSERT INTO `eb_system_group_data` VALUES (132, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"200\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"20\"}],\"id\":103,\"sort\":9,\"status\":true}', 9, 1, '2021-05-13 10:25:07', '2021-05-13 10:26:05');
INSERT INTO `eb_system_group_data` VALUES (133, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"300\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"30\"}],\"id\":103,\"sort\":10,\"status\":true}', 10, 1, '2021-05-13 10:25:15', '2021-05-13 10:26:00');
INSERT INTO `eb_system_group_data` VALUES (134, 62, '{\"fields\":[{\"name\":\"price\",\"title\":\"price\",\"value\":\"10\"},{\"name\":\"give_money\",\"title\":\"give_money\",\"value\":\"1\"}],\"id\":103,\"sort\":2,\"status\":true}', 2, 1, '2021-05-13 10:26:48', '2021-05-13 10:27:01');

-- ----------------------------
-- Table structure for eb_system_role
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_role`;
CREATE TABLE `eb_system_role`  (
                                   `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
                                   `role_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份管理名稱',
                                   `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份管理權限(menus_id)',
                                   `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
                                   `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '狀態',
                                   `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                   `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '身份管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_role
-- ----------------------------
INSERT INTO `eb_system_role` VALUES (1, '超級管理員', '267,42,43,175,176,318,319,320,321,322,44,558,127,323,324,325,128,328,329,331,333,45,46,335,337,338,339,340,341,47,48,345,346,347,348,349,350,49,357,358,559,162,351,352,353,356,164,363,364,366,561,56,57,367,368,369,372,562,58,113,114,115,373,374,141,171,172,375,376,377,173,174,381,382,383,385,387,139,583,118,119,158,397,398,159,402,123,160,161,459,460,461,492,493,494,495,496,497,598,599,600,146,147,148,464,465,466,467,468,563,564,469,470,452,317,450,51,80,552,505,547,548,549,550,551,553,554,555,556,52,53,408,409,410,54,403,404,405,540,55,541,542,543,544,546,129,130,565,566,567,568,569,570,571,131,572,573,574,575,576,577,132,165,166,417,418,419,167,420,421,422,578,579,580,168,425,426,427,169,66,528,581,67,68,69,432,433,434,437,438,439,250,442,443,444,582', 0, 1, '2020-04-18 11:19:25', '2021-05-21 15:02:22');
INSERT INTO `eb_system_role` VALUES (4, '門店核銷', '267,42,43,175,176,318,319,320,321,322,44,558,127,323,324,325,128,328,329,331,333,45,46,335,337,338,339,340,341,47,48,345,346,347,348,349,350,49,357,358,559,162,351,352,353,356,164,363,364,366,561,113,114,115,373,374,141,171,172,375,376,377,173,174,381,382,383,385,387,139,140,389,390,392,396,316,393,583,118,119,158,397,398,159,402,123,160,161,459,460,461,492,493,494,495,496,497,146,147,148,464,465,466,467,468,563,564,469,470,452,317,450,66,528,581,67,69,432,437', 1, 1, '2021-02-04 14:05:27', '2021-04-20 15:03:01');
INSERT INTO `eb_system_role` VALUES (5, '演示站', '267,42,43,175,44,558,127,323,128,328,333,45,46,337,47,48,346,349,350,49,357,162,351,356,164,366,561,56,57,367,372,562,58,113,114,115,141,171,172,375,173,174,387,139,140,396,316,393,118,119,158,397,398,159,402,123,160,161,459,460,461,492,493,494,495,496,497,146,147,148,464,465,466,467,468,563,469,470,452,317,450,51,80,505,547,52,53,408,54,403,55,541,542,129,130,565,566,131,572,573,576,577,132,165,166,417,167,578,168,425,169,66,528,67,68,69,432,437,250,442', 1, 1, '2021-02-25 15:34:57', '2021-02-25 15:34:57');
INSERT INTO `eb_system_role` VALUES (6, '管理員', '267,42,43,175,176,318,319,320,321,322,44,558,127,323,324,325,128,328,329,331,333,45,46,335,337,338,339,340,341,47,48,345,346,347,348,349,350,49,357,358,559,162,351,352,353,356,164,363,364,366,561,113,114,115,373,374,141,171,172,375,376,377,173,174,381,382,383,385,387,139,140,389,390,392,396,316,393,583,118,119,158,397,398,159,402,123,160,161,459,460,461,492,493,494,495,496,497,146,147,148,464,465,466,467,468,563,564,469,470,452,317,450,66,528,581,67,69,432,433,434,437,438,439', 1, 1, '2021-04-20 15:04:27', '2021-04-20 15:04:27');

-- ----------------------------
-- Table structure for eb_system_store
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_store`;
CREATE TABLE `eb_system_store`  (
                                    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '門店名稱',
                                    `introduction` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '簡介',
                                    `phone` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手機號碼',
                                    `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省市區',
                                    `detailed_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '詳細地址',
                                    `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '門店logo',
                                    `latitude` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '緯度',
                                    `longitude` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '經度',
                                    `valid_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '核銷有效日期',
                                    `day_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '每日營業開關時間',
                                    `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否顯示',
                                    `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否刪除',
                                    `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                    `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '門店自提' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_store_staff
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_store_staff`;
CREATE TABLE `eb_system_store_staff`  (
                                          `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `uid` int(10) UNSIGNED NOT NULL COMMENT '管理員id',
                                          `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店員頭像',
                                          `store_id` int(11) NOT NULL COMMENT '門店id',
                                          `staff_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '店員名稱',
                                          `phone` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手機號碼',
                                          `verify_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '核銷開關',
                                          `status` tinyint(2) NULL DEFAULT 1 COMMENT '狀態',
                                          `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                          `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '門店店員表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_user_level`;
CREATE TABLE `eb_system_user_level`  (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '會員名稱',
                                         `experience` int(11) NOT NULL DEFAULT 0 COMMENT '達到多少升級經驗',
                                         `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否顯示 1=顯示,0=隱藏',
                                         `grade` int(11) NOT NULL DEFAULT 0 COMMENT '會員等級',
                                         `discount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '享受折扣',
                                         `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '會員卡背景',
                                         `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '會員圖標',
                                         `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '說明',
                                         `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否刪除.1=刪除,0=未刪除',
                                         `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                         `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '普通會員等級' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_user_level
-- ----------------------------
INSERT INTO `eb_system_user_level` VALUES (1, '普通會員', 0, 1, 1, 100.00, '0', 'crmebimage/user/2021/02/25/1d923c7a21ff4518aaf8b16d05636cbfsi9lk65ps8.png', '青銅會員', 0, '2020-04-28 15:07:20', '2021-03-18 16:14:51');
INSERT INTO `eb_system_user_level` VALUES (2, '黃銅會員', 500, 1, 2, 95.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8c3bff.jpg', 'crmebimage/user/2021/02/25/b5c6c0ebbf0144e098c4e3c2c24325fbsc59uvpzvj.png', '黃銅會員', 0, '2020-04-28 15:07:20', '2021-03-18 16:12:12');
INSERT INTO `eb_system_user_level` VALUES (3, '白銀會員', 1000, 1, 3, 94.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8d6ae1.jpg', 'crmebimage/user/2021/02/25/ec79d7ad3d9f4c228895b8319af6346fppxqtnoehi.png', '白銀會員', 0, '2020-04-28 15:07:20', '2021-03-18 16:12:22');
INSERT INTO `eb_system_user_level` VALUES (4, '黃金會員', 2000, 1, 4, 90.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8b27f1.jpg', 'crmebimage/user/2021/02/25/ec5938108678432ca8228909b29b02c3ragcx0lo28.png', '黃金會員', 0, '2020-04-28 15:07:20', '2021-03-16 10:27:03');
INSERT INTO `eb_system_user_level` VALUES (5, '鑽石會員', 10000, 1, 7, 50.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8dfe16.jpg', 'crmebimage/user/2021/02/25/8eb3fddbd8c84ac09269d4c3058c28f9d93m5jrafz.png', '鑽石會員', 0, '2020-04-28 15:07:20', '2021-03-19 14:27:16');

-- ----------------------------
-- Table structure for eb_template_message
-- ----------------------------
DROP TABLE IF EXISTS `eb_template_message`;
CREATE TABLE `eb_template_message`  (
                                        `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
                                        `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=訂閱消息,1=微信模板消息',
                                        `temp_key` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板編號',
                                        `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名',
                                        `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回覆內容',
                                        `temp_id` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板ID',
                                        `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '狀態',
                                        `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                        `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of eb_template_message
-- ----------------------------
INSERT INTO `eb_template_message` VALUES (11, 1, 'OPENTM200565260', '充值成功通知', '交易單號{{rechargeOrderId.DATA}}\n充值金額{{rechargeAmount.DATA}}\n賬戶余額{{rechargeAfterBalance.DATA}}\n充值時間{{rechargeDate.DATA}}', '_0KAysps9Yj0SM3nacaF_9xw77w1NQYjOpnl4TQAp7k', 0, '2020-06-16 10:44:44', '2020-12-04 14:27:10');
INSERT INTO `eb_template_message` VALUES (20, 1, 'OPENTM200565259', '訂單發貨提醒', '{{first.DATA}}\r\n訂單編號：{{keyword1.DATA}}\r\n物流公司：{{keyword2.DATA}}\r\n物流單號：{{keyword3.DATA}}\r\n{{remark.DATA}}', 'ERBLR4u2hP3n6WQbFlHuQXcB-qtFamnKh6pNfRNBF4o', 1, '2020-06-16 10:44:44', '2020-12-04 12:09:01');
INSERT INTO `eb_template_message` VALUES (23, 1, 'OPENTM407456411', '拼團成功通知', '{{first.DATA}}\n訂單編號：{{keyword1.DATA}}\n團購商品：{{keyword2.DATA}}\n{{remark.DATA}}', 'Z2Omd14Zs2DQzqcPSOtu7dyQJYoCE8l2v27rjxQZqMk', 1, '2020-06-16 10:44:44', '2020-12-03 16:26:04');
INSERT INTO `eb_template_message` VALUES (27, 1, 'OPENTM410292733', '砍價成功提醒', '{{first.DATA}}\n商品名稱：{{keyword1.DATA}}\n底價：{{keyword2.DATA}}\n{{remark.DATA}}', 'MUqBKNiYEWtcUnNis9md08XRXIRyUXK4JlMLzBkar2s', 1, '2020-06-16 10:44:44', '2020-12-03 16:27:27');
INSERT INTO `eb_template_message` VALUES (34, 1, 'OPENTM207707249', '訂單配送通知', '{{first.DATA}}\r\n商品明細：{{keyword1.DATA}}\r\n下單時間：{{keyword2.DATA}}\r\n配送地址：{{keyword3.DATA}}\r\n配送人：{{keyword4.DATA}}\r\n聯繫電話：{{keyword5.DATA}}\r\n{{remark.DATA}}', 'X5Xn0qKhWf-JRbBB9mKWm_SBBWnblwx7kXMJl3-Fr6E', 1, '2020-12-03 16:03:24', '2021-01-28 15:53:18');
INSERT INTO `eb_template_message` VALUES (35, 1, 'OPENTM207791277', '訂單支付成功通知', '{{first.DATA}}\r\n訂單編號：{{keyword1.DATA}}\r\n支付金額：{{keyword2.DATA}}\r\n{{remark.DATA}}', 'E7dtaOtnDSwmNtUB1zCvoTeV4MrtaBlDdw05qh43_do', 1, '2021-01-28 11:43:51', '2021-01-28 11:43:51');
INSERT INTO `eb_template_message` VALUES (36, 1, 'OPENTM413386489', '訂單收貨通知', '{{first.DATA}}\r\n訂單編號：{{keyword1.DATA}}\r\n訂單狀態：{{keyword2.DATA}}\r\n收貨時間：{{keyword3.DATA}}\r\n商品詳情：{{keyword4.DATA}}\r\n{{remark.DATA}}', 'ERKU8BEZ5J3zdM5JFfalsGpz7mfpUdn12rOqDI4JBNE', 1, '2021-01-28 15:12:15', '2021-01-28 15:12:15');
INSERT INTO `eb_template_message` VALUES (37, 1, 'OPENTM410119152', '退款進度通知', '{{first.DATA}}\r\n訂單編號：{{keyword1.DATA}}\r\n訂單金額：{{keyword2.DATA}}\r\n下單時間：{{keyword3.DATA}}\r\n{{remark.DATA}}', NULL, 0, '2021-01-29 11:43:06', '2021-01-29 11:43:06');
INSERT INTO `eb_template_message` VALUES (45, 0, '14198', '訂單配送通知', '交易單號\r\n{{character_string1.DATA}}\r\n\r\n充值金額\r\n{{amount3.DATA}}\r\n\r\n充值時間\r\n{{date5.DATA}}\r\n\r\n贈送金額\r\n{{amount6.DATA}}\r\n\r\n備註\r\n{{thing7.DATA}}', 'B4zbo-s0fS8PRJ62rquZd4_Lred4c3pD_VTzenbVfbQ', 1, '2021-03-05 16:19:50', '2021-03-05 16:20:25');
INSERT INTO `eb_template_message` VALUES (46, 0, 'OPENTM200565260', '充值成功通知', '交易單號\r\n{{character_string1.DATA}}\r\n\r\n充值金額\r\n{{amount3.DATA}}\r\n\r\n充值時間\r\n{{date5.DATA}}\r\n\r\n贈送金額\r\n{{amount6.DATA}}\r\n\r\n備註\r\n{{thing7.DATA}}', 'QLSXLPHfjWC7ZxpoUX-q4gC54bgdW4Dsx30bRv_TUqk', 1, '2021-03-05 16:21:19', '2021-03-05 16:21:19');
INSERT INTO `eb_template_message` VALUES (47, 0, '9283', '確認收貨通知', '訂單號\r\n{{character_string6.DATA}}\r\n\r\n訂單狀態\r\n{{phrase4.DATA}}\r\n\r\n簽收時間\r\n{{time7.DATA}}\r\n\r\n商品名稱\r\n{{thing1.DATA}}\r\n\r\n備註\r\n{{thing5.DATA}}', 'qdhOurmVg2gQisPs5Ow_qhyHmKnhhyg41hE3AKNmSd0', 1, '2021-03-05 16:22:03', '2021-03-05 16:22:03');
INSERT INTO `eb_template_message` VALUES (48, 0, '516', '訂單支付成功通知', '訂單編號\r\n{{character_string1.DATA}}\r\n\r\n訂單金額\r\n{{amount2.DATA}}\r\n\r\n備註\r\n{{thing7.DATA}}', '342Cp6e-8TbJzpahqD40Rz-yZaHUDb_CUb0KiGxC4ik', 1, '2021-03-05 16:22:48', '2021-03-05 16:22:48');
INSERT INTO `eb_template_message` VALUES (49, 0, '2920', '砍價結果通知', '商品名稱\r\n{{thing6.DATA}}\r\n\r\n砍後底價\r\n{{amount3.DATA}}\r\n\r\n溫馨提示\r\n{{thing5.DATA}}', 'U1ay6t-sUMpvEEDZq32zxU_5JT0DzKnNu1pQo-5-lP4', 1, '2021-03-05 16:23:26', '2021-03-05 16:23:26');
INSERT INTO `eb_template_message` VALUES (50, 0, '5164', '拼團成功提醒', '訂單編號\r\n{{character_string1.DATA}}\r\n\r\n商品名稱\r\n{{thing2.DATA}}\r\n\r\n備註\r\n{{thing5.DATA}}', '8rcdTAUI05q4IqSD9vnyxX_L4Yqc0TDjfjUocr5L244', 1, '2021-03-05 16:24:13', '2021-03-05 16:24:13');
INSERT INTO `eb_template_message` VALUES (51, 0, '467', '訂單發貨提醒', '訂單編號\r\n{{character_string1.DATA}}\r\n\r\n快遞公司\r\n{{name3.DATA}}\r\n\r\n快遞單號\r\n{{character_string4.DATA}}\r\n\r\n溫馨提示\r\n{{thing7.DATA}}', 'ddpICalk-ZCaEXqZZZRzkElLzNSpSqFZSLgLR11p4dE', 1, '2021-03-05 16:25:05', '2021-03-05 16:25:05');

-- ----------------------------
-- Table structure for eb_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_user`;
CREATE TABLE `eb_user`  (
                            `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用戶id',
                            `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用戶賬號',
                            `pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用戶密碼',
                            `real_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '真實姓名',
                            `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '生日',
                            `card_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '身份證號碼',
                            `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用戶備註',
                            `partner_id` int(11) NULL DEFAULT NULL COMMENT '合夥人id',
                            `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用戶分組id',
                            `tag_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '標籤id',
                            `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用戶昵稱',
                            `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用戶頭像',
                            `phone` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手機號碼',
                            `add_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '添加ip',
                            `last_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最後一次登錄ip',
                            `now_money` decimal(16, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '用戶余額',
                            `brokerage_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '佣金金額',
                            `integral` int(11) NULL DEFAULT 0 COMMENT '用戶剩餘積分',
                            `experience` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用戶剩餘經驗',
                            `sign_num` int(11) NULL DEFAULT 0 COMMENT '連續簽到天數',
                            `status` tinyint(1) NULL DEFAULT 1 COMMENT '1為正常，0為禁止',
                            `level` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '等級',
                            `spread_uid` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推廣員id',
                            `spread_time` timestamp(0) NULL DEFAULT NULL COMMENT '推廣員關聯時間',
                            `user_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用戶類型',
                            `is_promoter` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否為推廣員',
                            `pay_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用戶購買次數',
                            `spread_count` int(11) NULL DEFAULT 0 COMMENT '下級人數',
                            `addres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '詳細地址',
                            `adminid` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '管理員編號 ',
                            `login_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用戶登陸類型，h5,wechat,routine',
                            `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                            `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                            `last_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '最後一次登錄時間',
                            `clean_time` timestamp(0) NULL DEFAULT NULL COMMENT '清除時間',
                            `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/0/' COMMENT '推廣等級記錄',
                            `subscribe` tinyint(3) NULL DEFAULT 0 COMMENT '是否關注公眾號',
                            `subscribe_time` timestamp(0) NULL DEFAULT NULL COMMENT '關注公眾號時間',
                            `sex` tinyint(1) NULL DEFAULT 1 COMMENT '性別，0未知，1男，2女，3保密',
                            `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'CN' COMMENT '國家，中國CN，其他OTHER',
                            PRIMARY KEY (`uid`) USING BTREE,
                            UNIQUE INDEX `account`(`account`) USING BTREE,
                            INDEX `spreaduid`(`spread_uid`) USING BTREE,
                            INDEX `level`(`level`) USING BTREE,
                            INDEX `status`(`status`) USING BTREE,
                            INDEX `is_promoter`(`is_promoter`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_address`;
CREATE TABLE `eb_user_address`  (
                                    `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用戶地址id',
                                    `uid` int(10) UNSIGNED NOT NULL COMMENT '用戶id',
                                    `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人姓名',
                                    `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人電話',
                                    `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人所在省',
                                    `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人所在市',
                                    `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市id',
                                    `district` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人所在區',
                                    `detail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收貨人詳細地址',
                                    `post_code` int(10) NOT NULL DEFAULT 0 COMMENT '郵編',
                                    `longitude` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '經度',
                                    `latitude` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '緯度',
                                    `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默認',
                                    `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否刪除',
                                    `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                    `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `uid`(`uid`) USING BTREE,
                                    INDEX `is_default`(`is_default`) USING BTREE,
                                    INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_bill`;
CREATE TABLE `eb_user_bill`  (
                                 `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用戶賬單id',
                                 `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用戶uid',
                                 `link_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '關聯id',
                                 `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 支出 1 = 獲得',
                                 `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '賬單標題',
                                 `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '明細種類',
                                 `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '明細類型',
                                 `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明細數字',
                                 `balance` decimal(16, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩餘',
                                 `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '備註',
                                 `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 帶確定 1 = 有效 -1 = 無效',
                                 `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                 `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `openid`(`uid`) USING BTREE,
                                 INDEX `status`(`status`) USING BTREE,
                                 INDEX `add_time`(`create_time`) USING BTREE,
                                 INDEX `pm`(`pm`) USING BTREE,
                                 INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶賬單表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_brokerage_record
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_brokerage_record`;
CREATE TABLE `eb_user_brokerage_record`  (
                                             `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '記錄id',
                                             `uid` int(10) NOT NULL DEFAULT 0 COMMENT '用戶uid',
                                             `link_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '關聯id（orderNo,提現id）',
                                             `link_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '關聯類型（order,extract，yue）',
                                             `type` int(1) NOT NULL DEFAULT 1 COMMENT '類型：1-增加，2-扣減（提現）',
                                             `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '標題',
                                             `price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '金額',
                                             `balance` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '剩餘',
                                             `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '備註',
                                             `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態：1-訂單創建，2-凍結期，3-完成，4-失效（訂單退款），5-提現申請',
                                             `frozen_time` int(3) NOT NULL DEFAULT 0 COMMENT '凍結期時間（天）',
                                             `thaw_time` bigint(14) NOT NULL DEFAULT 0 COMMENT '解凍時間',
                                             `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                             `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `openid`(`uid`) USING BTREE,
                                             INDEX `status`(`status`) USING BTREE,
                                             INDEX `add_time`(`create_time`) USING BTREE,
                                             INDEX `type`(`type`) USING BTREE,
                                             INDEX `type_link`(`type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶佣金記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_extract`;
CREATE TABLE `eb_user_extract`  (
                                    `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                    `uid` int(10) UNSIGNED NULL DEFAULT NULL,
                                    `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名稱',
                                    `extract_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'bank' COMMENT 'bank = 銀行卡 alipay = 支付寶 weixin=微信',
                                    `bank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '銀行卡',
                                    `bank_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '開戶地址',
                                    `alipay_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付寶賬號',
                                    `extract_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '提現金額',
                                    `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `balance` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00,
                                    `fail_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '無效原因',
                                    `status` tinyint(2) NULL DEFAULT 0 COMMENT '-1 未通過 0 審核中 1 已提現',
                                    `wechat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信號',
                                    `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                    `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    `fail_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失敗時間',
                                    `bank_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '銀行名稱',
                                    `qrcode_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信收款二維碼',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `extract_type`(`extract_type`) USING BTREE,
                                    INDEX `status`(`status`) USING BTREE,
                                    INDEX `openid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶提現表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_group`;
CREATE TABLE `eb_user_group`  (
                                  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
                                  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用戶分組名稱',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶分組表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user_group
-- ----------------------------
INSERT INTO `eb_user_group` VALUES (1, '初級會員');
INSERT INTO `eb_user_group` VALUES (2, '中級會員');
INSERT INTO `eb_user_group` VALUES (3, '高級會員');

-- ----------------------------
-- Table structure for eb_user_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_integral_record`;
CREATE TABLE `eb_user_integral_record`  (
                                            `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '記錄id',
                                            `uid` int(10) NOT NULL DEFAULT 0 COMMENT '用戶uid',
                                            `link_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '關聯id-orderNo,(sign,system默認為0）',
                                            `link_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'order' COMMENT '關聯類型（order,sign,system）',
                                            `type` int(1) NOT NULL DEFAULT 1 COMMENT '類型：1-增加，2-扣減',
                                            `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '標題',
                                            `integral` int(11) NOT NULL DEFAULT 0 COMMENT '積分',
                                            `balance` int(11) NOT NULL DEFAULT 0 COMMENT '剩餘',
                                            `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '備註',
                                            `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態：1-訂單創建，2-凍結期，3-完成，4-失效（訂單退款）',
                                            `frozen_time` int(3) NOT NULL DEFAULT 0 COMMENT '凍結期時間（天）',
                                            `thaw_time` bigint(14) NOT NULL DEFAULT 0 COMMENT '解凍時間',
                                            `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                            `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                            PRIMARY KEY (`id`) USING BTREE,
                                            INDEX `openid`(`uid`) USING BTREE,
                                            INDEX `status`(`status`) USING BTREE,
                                            INDEX `add_time`(`create_time`) USING BTREE,
                                            INDEX `type`(`type`) USING BTREE,
                                            INDEX `type_link`(`type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶積分記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_level`;
CREATE TABLE `eb_user_level`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用戶uid',
                                  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等級vip',
                                  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '會員等級',
                                  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:禁止,1:正常',
                                  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '備註',
                                  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已通知',
                                  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否刪除,0=未刪除,1=刪除',
                                  `discount` int(11) NOT NULL DEFAULT 0 COMMENT '享受折扣',
                                  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                  `expired_time` timestamp(0) NULL DEFAULT NULL COMMENT '過期時間',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶等級記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_recharge`;
CREATE TABLE `eb_user_recharge`  (
                                     `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                     `uid` int(10) NULL DEFAULT NULL COMMENT '充值用戶UID',
                                     `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '訂單號',
                                     `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '充值金額',
                                     `give_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '購買贈送金額',
                                     `recharge_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值類型',
                                     `paid` tinyint(1) NULL DEFAULT 0 COMMENT '是否充值',
                                     `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '充值支付時間',
                                     `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值時間',
                                     `refund_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款金額',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
                                     INDEX `uid`(`uid`) USING BTREE,
                                     INDEX `recharge_type`(`recharge_type`) USING BTREE,
                                     INDEX `paid`(`paid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用戶充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_sign`;
CREATE TABLE `eb_user_sign`  (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用戶uid',
                                 `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '簽到說明',
                                 `number` int(11) NOT NULL DEFAULT 0 COMMENT '獲得',
                                 `balance` int(11) NOT NULL DEFAULT 0 COMMENT '剩餘',
                                 `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '類型，1積分，2經驗',
                                 `create_day` date NOT NULL COMMENT '簽到日期',
                                 `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `uid`(`uid`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '簽到記錄表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_tag`;
CREATE TABLE `eb_user_tag`  (
                                `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
                                `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '標籤名稱',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '標籤管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user_tag
-- ----------------------------
INSERT INTO `eb_user_tag` VALUES (1, '中級');
INSERT INTO `eb_user_tag` VALUES (2, '高級');
INSERT INTO `eb_user_tag` VALUES (3, '黃金');
INSERT INTO `eb_user_tag` VALUES (4, '超級');
INSERT INTO `eb_user_tag` VALUES (6, '鑽石');

-- ----------------------------
-- Table structure for eb_user_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_token`;
CREATE TABLE `eb_user_token`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `uid` int(10) UNSIGNED NOT NULL COMMENT '用戶 id',
                                  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
                                  `type` tinyint(1) NULL DEFAULT 1 COMMENT '類型，1 公眾號， 2 小程序, 3 unionid, 5AppIos,6AppAndroid,7ios',
                                  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                  `expires_time` datetime(0) NULL DEFAULT NULL COMMENT '到期時間',
                                  `login_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登錄ip',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  UNIQUE INDEX `type+token`(`type`, `token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_program_my_temp
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_program_my_temp`;
CREATE TABLE `eb_wechat_program_my_temp`  (
                                              `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                              `tid` int(11) NOT NULL COMMENT '微信模板id',
                                              `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模版標題',
                                              `kid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板關鍵字id，多個逗號分割',
                                              `scene_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '場景描述',
                                              `temp_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信模板id',
                                              `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擴展字段',
                                              `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '狀態 0，禁用，1啟用',
                                              `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '應用場景',
                                              `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                              `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小程序我的模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_program_public_temp
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_program_public_temp`;
CREATE TABLE `eb_wechat_program_public_temp`  (
                                                  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                  `tid` int(11) NOT NULL COMMENT '微信模板id',
                                                  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模版標題',
                                                  `type` tinyint(1) NOT NULL COMMENT '模版類型，2 為一次性訂閱，3 為長期訂閱',
                                                  `category_id` int(11) NOT NULL COMMENT '模版所屬類目 id',
                                                  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                                  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                                  PRIMARY KEY (`id`) USING BTREE,
                                                  UNIQUE INDEX `tid`(`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小程序微信公共模板庫' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_reply`;
CREATE TABLE `eb_wechat_reply`  (
                                    `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信關鍵字回覆id',
                                    `keywords` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '關鍵字',
                                    `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回覆類型',
                                    `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回覆數據',
                                    `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '回覆狀態 0=不可用  1 =可用',
                                    `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
                                    `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新時間',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    UNIQUE INDEX `key`(`keywords`) USING BTREE,
                                    INDEX `type`(`type`) USING BTREE,
                                    INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信關鍵字回覆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_wechat_reply
-- ----------------------------
INSERT INTO `eb_wechat_reply` VALUES (1, 'default', 'text', '{\"content\":\"dd\",\"mediaId\":\"\",\"srcUrl\":\"\"}', 1, '2020-12-09 12:32:26', '2021-02-24 18:22:19');
INSERT INTO `eb_wechat_reply` VALUES (7, 'news', 'news', '{\"content\":\"\",\"mediaId\":\"\",\"srcUrl\":\"\",\"articleData\":{\"title\":\"你最美\",\"imageInput\":[\"crmebimage/maintain/2021/01/16/e98db74f48ea4ed3b35d4432636edd05w9qf1rowh4.png\"]},\"articleId\":1}', 1, '2020-06-12 11:31:33', '2020-08-13 09:49:07');
INSERT INTO `eb_wechat_reply` VALUES (8, 'subscribe', 'text', '{\"content\":\"你好！！！！\",\"mediaId\":\"\",\"srcUrl\":\"\",\"articleData\":{}}', 1, '2020-06-17 10:16:17', '2020-08-13 09:48:16');
INSERT INTO `eb_wechat_reply` VALUES (9, '你好', 'text', '{\"content\":\"是啊,你好\",\"articleData\":{},\"mediaId\":\"\",\"srcUrl\":\"\",\"articleId\":null}', 1, '2020-11-30 10:05:27', '2020-11-30 10:05:27');
INSERT INTO `eb_wechat_reply` VALUES (10, '測試', 'text', '{\"content\":\"測惡俗\",\"articleData\":{},\"mediaId\":\"\",\"srcUrl\":\"\",\"articleId\":null}', 1, '2020-12-09 12:15:12', '2020-12-09 12:15:12');

SET FOREIGN_KEY_CHECKS = 1;
