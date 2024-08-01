/*
 Navicat Premium Dump SQL

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : diproavilm

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 06/07/2024 18:05:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit`  (
  `idaudit` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `ipaddr` varchar(15) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `action` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `route` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `jsoninit` text CHARACTER SET utf16 COLLATE utf16_general_ci NULL,
  `jsonfinal` text CHARACTER SET utf16 COLLATE utf16_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idaudit`) USING BTREE,
  INDEX `IDUSER`(`iduser` ASC) USING BTREE,
  CONSTRAINT `IDUSER` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit
-- ----------------------------

-- ----------------------------
-- Table structure for beneficiary
-- ----------------------------
DROP TABLE IF EXISTS `beneficiary`;
CREATE TABLE `beneficiary`  (
  `idbeneficiary` int NOT NULL AUTO_INCREMENT,
  `type` enum('C','P','A') CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'C' COMMENT 'C-Cliente P-Proveedor A-Ambos',
  `identificationnumber` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '' COMMENT 'Numero de cedula, ruc, pasaporte, o tax number en caso de ser internacionales',
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `phone` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `web` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idbeneficiary`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of beneficiary
-- ----------------------------
INSERT INTO `beneficiary` VALUES (1, 'A', '1700000000', 'DIPROAVILM', 'Quito', '', '', '');

-- ----------------------------
-- Table structure for bot_audit
-- ----------------------------
DROP TABLE IF EXISTS `bot_audit`;
CREATE TABLE `bot_audit`  (
  `idbotaudit` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL DEFAULT 0,
  `textentered` text CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `keyresult` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbotaudit`) USING BTREE,
  INDEX `FkUser`(`iduser` ASC) USING BTREE,
  CONSTRAINT `FkUser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bot_audit
-- ----------------------------
INSERT INTO `bot_audit` VALUES (75, 6, 'UPDATE PASSWORD', 'menu', '2024-07-05 11:12:18');
INSERT INTO `bot_audit` VALUES (76, 6, 'password 278351', '', '2024-07-05 11:12:18');
INSERT INTO `bot_audit` VALUES (77, 6, 'menu', 'menu', '2024-07-05 11:15:00');
INSERT INTO `bot_audit` VALUES (78, 6, 'CHANGE PASSWORD', 'menu', '2024-07-05 11:15:59');
INSERT INTO `bot_audit` VALUES (79, 6, 'chechpassword', '', '2024-07-05 11:23:46');
INSERT INTO `bot_audit` VALUES (80, 6, 'menu', 'menu', '2024-07-05 11:27:07');
INSERT INTO `bot_audit` VALUES (81, 6, 'reportes', 'reportes', '2024-07-05 11:32:28');
INSERT INTO `bot_audit` VALUES (82, 6, 'CHANGE PASSWORD', 'menu', '2024-07-05 11:33:40');
INSERT INTO `bot_audit` VALUES (83, 6, 'ayuda', 'ayuda', '2024-07-05 11:39:30');
INSERT INTO `bot_audit` VALUES (84, 6, 'menu', 'menu', '2024-07-05 11:39:34');
INSERT INTO `bot_audit` VALUES (85, 6, 'reportes', 'reportes', '2024-07-05 11:39:36');
INSERT INTO `bot_audit` VALUES (86, 6, 'lista_usuarios', 'lista_usuarios', '2024-07-05 11:39:38');
INSERT INTO `bot_audit` VALUES (87, 6, 'lista_stock', 'lista_existencias', '2024-07-05 11:39:41');
INSERT INTO `bot_audit` VALUES (88, 6, 'lista_productos', 'lista_productos', '2024-07-05 11:39:44');
INSERT INTO `bot_audit` VALUES (89, 6, 'buenos dias', 'saludo', '2024-07-05 11:42:43');
INSERT INTO `bot_audit` VALUES (90, 6, 'buenas tardes', 'saludo', '2024-07-05 11:42:54');
INSERT INTO `bot_audit` VALUES (91, 6, 'menu', 'menu', '2024-07-05 11:43:00');
INSERT INTO `bot_audit` VALUES (92, 6, 'CHANGE PASSWORD', 'menu', '2024-07-05 11:47:24');
INSERT INTO `bot_audit` VALUES (93, 6, 'reportes', 'reportes', '2024-07-05 11:47:41');
INSERT INTO `bot_audit` VALUES (94, 6, 'lista_usuarios', 'lista_usuarios', '2024-07-05 11:47:44');
INSERT INTO `bot_audit` VALUES (95, 6, 'hello', 'saludo', '2024-07-05 12:06:25');
INSERT INTO `bot_audit` VALUES (96, 6, 'lista_usuarios jorge', 'lista_usuarios', '2024-07-05 12:16:44');
INSERT INTO `bot_audit` VALUES (97, 6, 'lista_usuarios jorge', 'lista_usuarios', '2024-07-05 12:19:50');
INSERT INTO `bot_audit` VALUES (98, 6, 'lista_usuarios jorge', 'lista_usuarios', '2024-07-05 12:20:15');
INSERT INTO `bot_audit` VALUES (99, 6, 'menu', 'menu', '2024-07-05 12:22:33');
INSERT INTO `bot_audit` VALUES (100, 6, 'reportes', 'reportes', '2024-07-05 12:22:36');
INSERT INTO `bot_audit` VALUES (101, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:22:38');
INSERT INTO `bot_audit` VALUES (102, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:25:08');
INSERT INTO `bot_audit` VALUES (103, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:25:42');
INSERT INTO `bot_audit` VALUES (104, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:25:59');
INSERT INTO `bot_audit` VALUES (105, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:30:33');
INSERT INTO `bot_audit` VALUES (106, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:32:44');
INSERT INTO `bot_audit` VALUES (107, 6, 'reportes', 'reportes', '2024-07-05 12:34:06');
INSERT INTO `bot_audit` VALUES (108, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:35:24');
INSERT INTO `bot_audit` VALUES (109, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:37:52');
INSERT INTO `bot_audit` VALUES (110, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:38:08');
INSERT INTO `bot_audit` VALUES (111, 6, 'lista_productos', 'lista_productos', '2024-07-05 12:38:54');
INSERT INTO `bot_audit` VALUES (112, 6, 'cambiar_formato', '', '2024-07-05 12:40:45');
INSERT INTO `bot_audit` VALUES (113, 6, 'cambiar_formato', '', '2024-07-05 12:41:22');
INSERT INTO `bot_audit` VALUES (114, 6, 'cambiar_formato', 'cambiar_formato', '2024-07-05 12:42:15');
INSERT INTO `bot_audit` VALUES (115, 6, 'csv', '', '2024-07-05 12:56:36');
INSERT INTO `bot_audit` VALUES (116, 6, 'cambiar_formato', 'cambiar_formato', '2024-07-05 12:59:17');
INSERT INTO `bot_audit` VALUES (117, 6, 'hello', 'saludo', '2024-07-05 14:40:16');
INSERT INTO `bot_audit` VALUES (118, 6, 'hello', 'saludo', '2024-07-05 14:40:35');
INSERT INTO `bot_audit` VALUES (119, 6, 'hols', '', '2024-07-05 14:40:39');
INSERT INTO `bot_audit` VALUES (120, 6, 'como estas', '', '2024-07-05 14:40:43');
INSERT INTO `bot_audit` VALUES (121, 6, 'buenos dias', 'saludo', '2024-07-05 14:41:55');
INSERT INTO `bot_audit` VALUES (122, 6, 'menu', 'menu', '2024-07-05 14:42:06');
INSERT INTO `bot_audit` VALUES (123, 6, 'reportes', 'reportes', '2024-07-05 14:42:07');
INSERT INTO `bot_audit` VALUES (124, 6, 'lista_usuarios', 'lista_usuarios', '2024-07-05 14:42:12');
INSERT INTO `bot_audit` VALUES (125, 6, 'cambiar_formato', 'cambiar_formato', '2024-07-05 14:42:14');
INSERT INTO `bot_audit` VALUES (126, 6, 'format_csv', 'format_csv', '2024-07-05 14:42:16');
INSERT INTO `bot_audit` VALUES (127, 6, 'hola', 'saludo', '2024-07-05 14:43:43');
INSERT INTO `bot_audit` VALUES (128, 6, 'menu', 'menu', '2024-07-05 21:31:41');
INSERT INTO `bot_audit` VALUES (129, 6, 'reportes', 'reportes', '2024-07-05 21:32:04');
INSERT INTO `bot_audit` VALUES (130, 6, 'lista_usuarios', 'lista_usuarios', '2024-07-05 21:32:07');
INSERT INTO `bot_audit` VALUES (131, 6, 'menu', 'menu', '2024-07-05 21:32:10');
INSERT INTO `bot_audit` VALUES (132, 6, 'ayuda', 'ayuda', '2024-07-05 21:32:12');
INSERT INTO `bot_audit` VALUES (133, 6, 'menu', 'menu', '2024-07-05 21:32:14');
INSERT INTO `bot_audit` VALUES (134, 6, 'reportes', 'reportes', '2024-07-05 21:32:19');
INSERT INTO `bot_audit` VALUES (135, 6, 'lista_productos', 'lista_productos', '2024-07-05 21:32:21');
INSERT INTO `bot_audit` VALUES (136, 6, 'menu', 'menu', '2024-07-05 21:32:29');
INSERT INTO `bot_audit` VALUES (137, 6, 'ayuda', 'ayuda', '2024-07-05 21:32:31');

-- ----------------------------
-- Table structure for bot_config
-- ----------------------------
DROP TABLE IF EXISTS `bot_config`;
CREATE TABLE `bot_config`  (
  `idbotconfig` int NOT NULL AUTO_INCREMENT,
  `iduser` int NULL DEFAULT 0,
  `module` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `vvalue` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idbotconfig`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bot_config
-- ----------------------------

-- ----------------------------
-- Table structure for bot_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `bot_dictionary`;
CREATE TABLE `bot_dictionary`  (
  `idbotdic` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `action` enum('T','Q','F','U') CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'T' COMMENT 'T-Text, Q-Query, F-Open File',
  `txt` text CHARACTER SET utf16 COLLATE utf16_general_ci NULL,
  `field_search` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idbotdic`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bot_dictionary
-- ----------------------------
INSERT INTO `bot_dictionary` VALUES (1, 'menu', 'T', 'Menu de Opciones\r\n\r\n/ayuda - Despliega las opciones de ayuda.\r\n/reportes - Para listar el menu de opciones para reportes.\r\n/password - Definir o cambiar la clave o pin de acceso.\r\n/checkpassword - Muestra el pin o clave actual.', '');
INSERT INTO `bot_dictionary` VALUES (2, 'reportes', 'T', 'Menu de Reportes\r\n\r\n/lista_productos,<texto> - Listado de productos.\r\n/lista_usuarios,<texto> - Listado de usuarios.\r\n/lista_stock,<texto> - Listado de stock por producto.\r\n\r\n<texto> - Es opcional si necesita buscar alguna coincidencia.\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (3, 'lista_usuarios', 'Q', 'SELECT CAST(iduser as CHAR) as id, fullname as nombre, rolename as rol FROM view_get_users WHERE status = 1 AND deleted_at IS NULL', 'fullname');
INSERT INTO `bot_dictionary` VALUES (4, 'lista_productos', 'Q', 'SELECT \r\n  CAST(idproduct AS CHAR) as idproduct,\r\n  CAST(idpresentation AS CHAR) as idpresentation,\r\n  productcode,\r\n  name,\r\n  description,\r\n  CAST(cost AS CHAR) AS cost, \r\n  CAST(stock as CHAR) AS stock,\r\n  CAST(price as CHAR) AS price,\r\n  CAST(stock_min as CHAR) AS stock_min,\r\n  CAST(stock_max as CHAR) AS stock_max\r\nFROM \r\n  product\r\nWHERE \r\n   status = 1', '');
INSERT INTO `bot_dictionary` VALUES (6, 'ingreso', 'T', 'Menu de Ingreso de Datos\r\n\r\n\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (7, 'egreso', 'T', 'Menu de Egreso de Datos\r\n\r\n\r\n\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (8, 'stock', 'T', 'Menu de Stock\r\n\r\n\r\n\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (9, 'saludo', 'T', 'Hola <nombre>, <tiempo>\r\n\r\nSoy 6UG8 bot, un asistente inteligente de la empresa DIPROAVILM,\r\ncomo te puedo ayudar el día de hoy.\r\n\r\n/menu - Para desplegar el listado de opciones del menú\r\n/ayuda - Para saber mas de como puedes ingresar tus requerimientos.\r\n\r\n\r\n\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (10, 'ayuda', 'T', 'Opcion de Ayuda\r\n\r\nSoy /6UG8 bot, un asistente inteligente de la empresa DIPROAVILM.\r\n\r\n- Puedes ingresar las opciones del menu con un / o sin nada, Ej: /ayuda o ayuda.\r\n- Puedes separar las opciones con una coma ( , ), asi indicaras que necesitas que se filtre la información con ese texto que acabas de indicar Ej: listado_usuarios,Carmen\r\n- En cualquier momento puedes ingresar la opcion que mas prefieras.\r\n- Todos los resultados saldran en formato CSV, a fin de que puedas copiarlos y abrirlos en una hoja de calculo.\r\n\r\n/menu - Despliega las opciones del menú.\r\n\r\nUn saludo, \r\n6UG8 bot\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (11, '6UG8', 'T', 'Soy 6UG8 bot, un asistente inteligente de la empresa DIPROAVILM.\r\n\r\n- Mis creadores son:\r\n     Hugo Alfredo Herrera Villalva\r\n     Jaime Santiago Borja Romero\r\n     Joel Darío Brito Parra\r\n     Jorge Luis López Romo\r\n     Ricardo Vaca Miño   \r\n\r\nDel 6 semestre de la carrera de Software de la Universidad UNIANDES.\r\n\r\n- Las herramientas usadas para mi creación son:\r\n    Python\r\n    Entorno virtual python\r\n    MySql\r\n    Telegram Plugins\r\n\r\n\r\n/menu - Despliega las opciones del menú.\r\n\r\nUn saludo, \r\n6UG8 bot', '');
INSERT INTO `bot_dictionary` VALUES (12, 'lista_existencias', 'T', 'Aun en desarrollo\r\n\r\n\r\n\r\n\r\n\r\n/menu - Puedes regresar al menu principal.\r\n\r\n ', '');
INSERT INTO `bot_dictionary` VALUES (13, 'hora', 'T', 'La hora actual es <time>\r\n\r\n', '');
INSERT INTO `bot_dictionary` VALUES (14, 'fecha', 'T', 'La fecha actual es <fecha>', '');
INSERT INTO `bot_dictionary` VALUES (15, 'cambiar_formato', 'T', 'Los formatos disponibles son:\r\n\r\n/format_csv\r\n/format_tabspace\r\n\r\n\r\n/menu - Regresar.', '');
INSERT INTO `bot_dictionary` VALUES (16, 'format_csv', 'U', 'UPDATE bot_config SET vvalue = \'csv\' WHERE module = \'FORMATO SALIDA\'', '');
INSERT INTO `bot_dictionary` VALUES (17, 'format_tabspace', 'U', 'UPDATE bot_config SET vvalue = \'tab\' WHERE module = \'FORMATO SALIDA\'', '');

-- ----------------------------
-- Table structure for bot_spelling
-- ----------------------------
DROP TABLE IF EXISTS `bot_spelling`;
CREATE TABLE `bot_spelling`  (
  `idbotspelling` int NOT NULL AUTO_INCREMENT,
  `wordfind` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `menurun` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT 'menu',
  PRIMARY KEY (`idbotspelling`) USING BTREE,
  INDEX `IDXword`(`wordfind` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bot_spelling
-- ----------------------------
INSERT INTO `bot_spelling` VALUES (1, 'hola', 'saludo');
INSERT INTO `bot_spelling` VALUES (2, 'hi', 'saludo');
INSERT INTO `bot_spelling` VALUES (3, 'hello', 'saludo');
INSERT INTO `bot_spelling` VALUES (4, 'start', 'saludo');
INSERT INTO `bot_spelling` VALUES (5, 'ayuda', 'ayuda');
INSERT INTO `bot_spelling` VALUES (6, 'help', 'ayuda');
INSERT INTO `bot_spelling` VALUES (7, 'reportes', 'reportes');
INSERT INTO `bot_spelling` VALUES (8, 'reports', 'reportes');
INSERT INTO `bot_spelling` VALUES (9, 'stock', 'stock');
INSERT INTO `bot_spelling` VALUES (10, 'existencias', 'stock');
INSERT INTO `bot_spelling` VALUES (11, 'ingreso', 'ingreso');
INSERT INTO `bot_spelling` VALUES (12, 'egreso', 'egreso');
INSERT INTO `bot_spelling` VALUES (13, 'lista_productos', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (14, 'products', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (15, 'lista', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (16, 'lista_usuarios', 'lista_usuarios');
INSERT INTO `bot_spelling` VALUES (17, 'user', 'lista_usuarios');
INSERT INTO `bot_spelling` VALUES (18, 'users', 'lista_usuarios');
INSERT INTO `bot_spelling` VALUES (19, 'list', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (20, 'lista_stock', 'lista_existencias');
INSERT INTO `bot_spelling` VALUES (21, 'lista_existencias', 'lista_existencias');
INSERT INTO `bot_spelling` VALUES (22, 'saludos', 'saludo');
INSERT INTO `bot_spelling` VALUES (24, 'ayudes', 'ayuda');
INSERT INTO `bot_spelling` VALUES (25, 'ayudita', 'ayuda');
INSERT INTO `bot_spelling` VALUES (26, 'ayudas', 'ayuda');
INSERT INTO `bot_spelling` VALUES (27, 'mano', 'ayuda');
INSERT INTO `bot_spelling` VALUES (29, 'usuarios', 'lista_usuarios');
INSERT INTO `bot_spelling` VALUES (30, 'productos', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (31, 'usuario', 'lista_usuarios');
INSERT INTO `bot_spelling` VALUES (32, 'menu', 'menu');
INSERT INTO `bot_spelling` VALUES (33, 'opciones', 'menu');
INSERT INTO `bot_spelling` VALUES (34, 'saludo', 'saludo');
INSERT INTO `bot_spelling` VALUES (36, 'time', 'hora');
INSERT INTO `bot_spelling` VALUES (37, 'tiempo', 'hora');
INSERT INTO `bot_spelling` VALUES (38, 'hora', 'hora');
INSERT INTO `bot_spelling` VALUES (39, 'date', 'fecha');
INSERT INTO `bot_spelling` VALUES (40, 'fecha', 'fecha');
INSERT INTO `bot_spelling` VALUES (41, 'dias', 'saludo');
INSERT INTO `bot_spelling` VALUES (42, 'tardes', 'saludo');
INSERT INTO `bot_spelling` VALUES (43, 'noches', 'saludo');
INSERT INTO `bot_spelling` VALUES (44, 'listas_productos', 'lista_productos');
INSERT INTO `bot_spelling` VALUES (45, 'cambiar_formato', 'cambiar_formato');
INSERT INTO `bot_spelling` VALUES (46, 'cambia_formato', 'cambiar_formato');
INSERT INTO `bot_spelling` VALUES (47, 'cambio_formato', 'cambiar_formato');
INSERT INTO `bot_spelling` VALUES (48, 'format_csv', 'format_csv');
INSERT INTO `bot_spelling` VALUES (49, 'format_tabspace', 'format_tabspace');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `idmenu` int NOT NULL AUTO_INCREMENT,
  `order` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '' COMMENT '01 o 0101',
  `name` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `icon` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT 'fa fa-cog',
  `route` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '' COMMENT '/',
  `submenu` int NULL DEFAULT 0 COMMENT '1-Si es submenu 0-No es submenu',
  `status` int NULL DEFAULT 1 COMMENT '1-Active   0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idmenu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '01', 'Administacion', 'fa fa-cog', NULL, 1, 1, '2024-06-21 15:00:39', '2024-06-21 15:47:29', NULL);
INSERT INTO `menu` VALUES (2, '0101', 'Usuarios', 'fa fa-cog', 'users', 0, 1, '2024-06-21 15:00:50', '2024-06-21 15:47:53', NULL);
INSERT INTO `menu` VALUES (3, '0102', 'Roles', 'fa fa-cog', 'roles', 0, 1, '2024-06-21 15:01:00', '2024-06-21 15:48:04', NULL);
INSERT INTO `menu` VALUES (4, '0103', 'Menu', 'fa fa-cog', 'menu', 0, 1, '2024-06-21 15:01:10', '2024-06-21 15:48:08', NULL);
INSERT INTO `menu` VALUES (5, '0104', 'Beneficiarios', 'fa fa-cog', 'bene', 0, 1, '2024-06-21 15:01:45', '2024-06-21 15:48:12', NULL);
INSERT INTO `menu` VALUES (6, '02', 'Almacen', 'fa fa-cog', NULL, 1, 1, '2024-06-21 15:09:14', '2024-06-21 15:47:47', NULL);
INSERT INTO `menu` VALUES (7, '0201', 'Generar movimiento', 'fa fa-cog', 'movs', 0, 1, '2024-06-21 15:09:17', '2024-06-21 15:48:24', NULL);
INSERT INTO `menu` VALUES (8, '0201', 'Reportes', 'fa fa-cog', NULL, 0, 0, '2024-06-21 15:09:43', '2024-06-21 15:48:46', NULL);
INSERT INTO `menu` VALUES (9, '00', 'Dashboard', 'fa fa-cog', 'dashboard', 0, 1, '2024-06-21 15:09:59', '2024-06-21 15:48:55', NULL);
INSERT INTO `menu` VALUES (10, '03', 'Informes', 'fa fa-cog', NULL, 1, 1, '2024-06-21 15:49:08', '2024-06-21 15:49:08', NULL);
INSERT INTO `menu` VALUES (11, '0301', 'Listado de Usuarios', 'fa fa-cog', 'repusuarios', 0, 1, '2024-06-21 15:49:22', '2024-06-21 15:50:03', NULL);
INSERT INTO `menu` VALUES (12, '0302', 'LIstado de Productos', 'fa fa-cog', 'repprod', 0, 1, '2024-06-21 15:49:27', '2024-06-21 15:50:07', NULL);
INSERT INTO `menu` VALUES (13, '0303', 'Listado de Beneficiarios', 'fa fa-cog', 'repbene', 0, 1, '2024-06-21 15:49:35', '2024-06-21 15:50:10', NULL);
INSERT INTO `menu` VALUES (14, '0304', 'Kardex por producto', 'fa fa-cog', 'repkardex', 0, 1, '2024-06-21 15:49:40', '2024-06-21 15:50:20', NULL);

-- ----------------------------
-- Table structure for movementtype
-- ----------------------------
DROP TABLE IF EXISTS `movementtype`;
CREATE TABLE `movementtype`  (
  `idmovementtype` int NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `sequential` bigint NULL DEFAULT 0,
  `entry` enum('I','E','A') CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT 'E' COMMENT 'I-Ingreso E-Egreso  A-Ambos',
  PRIMARY KEY (`idmovementtype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movementtype
-- ----------------------------
INSERT INTO `movementtype` VALUES (1, 'FV', 'Venta', 0, 'E');
INSERT INTO `movementtype` VALUES (2, 'FC', 'Compra', 0, 'I');
INSERT INTO `movementtype` VALUES (3, 'AS', 'Saldo Incial', 0, 'I');
INSERT INTO `movementtype` VALUES (4, 'AJ', 'Ajuste de Inventario ', 0, 'A');
INSERT INTO `movementtype` VALUES (5, 'DE', 'Descarga de Inventario', 0, 'E');
INSERT INTO `movementtype` VALUES (6, 'BA', 'Baja de Inventario', 0, 'E');
INSERT INTO `movementtype` VALUES (7, 'TF', 'Toma Fisica', 0, 'I');

-- ----------------------------
-- Table structure for presentation
-- ----------------------------
DROP TABLE IF EXISTS `presentation`;
CREATE TABLE `presentation`  (
  `idpresentation` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `acronym` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  PRIMARY KEY (`idpresentation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presentation
-- ----------------------------
INSERT INTO `presentation` VALUES (1, 'UNIDAD', 'U');
INSERT INTO `presentation` VALUES (2, 'GALON', 'GL');
INSERT INTO `presentation` VALUES (3, 'LITRO', 'LT');
INSERT INTO `presentation` VALUES (4, 'CANECA', 'CN');
INSERT INTO `presentation` VALUES (5, 'METRO', 'MTR');
INSERT INTO `presentation` VALUES (6, 'LIBRA', 'LBR');
INSERT INTO `presentation` VALUES (7, 'KILOGRAMOS', 'KG');
INSERT INTO `presentation` VALUES (8, 'ROLLO', 'ROL');
INSERT INTO `presentation` VALUES (9, 'METRO CUADRADO', 'M2');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `idpresentation` int NOT NULL,
  `productcode` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf16 COLLATE utf16_general_ci NULL,
  `cost` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `stock` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `stock_min` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `stock_max` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `image` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `status` int NULL DEFAULT 1 COMMENT '1-Active    0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `udated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idproduct`) USING BTREE,
  INDEX `IDXPre`(`idpresentation` ASC) USING BTREE,
  CONSTRAINT `IDXPre` FOREIGN KEY (`idpresentation`) REFERENCES `presentation` (`idpresentation`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, 'PTEST001', 'PRODUCTO1', 'PRODUCTO DE PRUEBA', 0.0000, 0.0000, 1.00, 1.0000, 50.0000, '', 1, '2024-07-05 12:22:10', '2024-07-05 12:22:10', NULL);

-- ----------------------------
-- Table structure for productmovement
-- ----------------------------
DROP TABLE IF EXISTS `productmovement`;
CREATE TABLE `productmovement`  (
  `idmovmentproduct` int NOT NULL AUTO_INCREMENT,
  `idproduct` int NOT NULL,
  `idtransaction` int NOT NULL,
  `qty` double(20, 4) NOT NULL DEFAULT 0.0000,
  `entry` enum('I','E') CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'I' COMMENT 'I-Ingreso  E-Egreso',
  `price` double(20, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`idmovmentproduct`) USING BTREE,
  INDEX `IDXPRO`(`idproduct` ASC) USING BTREE,
  INDEX `IDXTRAS`(`idtransaction` ASC) USING BTREE,
  CONSTRAINT `IDXPRO` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXTRAS` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productmovement
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '',
  `scope` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '' COMMENT 'R|W|D',
  `status` int NULL DEFAULT 1 COMMENT '1-Active 0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idrole`) USING BTREE,
  INDEX `IDXROLE`(`idrole` ASC) USING BTREE,
  INDEX `IDXSTATUSROLE`(`idrole` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Reporteador', 'R', 1, '2024-06-21 15:17:20', '2024-06-21 15:17:48', NULL);
INSERT INTO `role` VALUES (2, 'Administrador', 'RWD', 1, '2024-06-21 15:17:44', '2024-06-21 15:17:49', NULL);
INSERT INTO `role` VALUES (3, 'Usuario', 'RWD', 1, '2024-06-21 15:18:01', '2024-06-21 15:18:06', NULL);
INSERT INTO `role` VALUES (4, 'Super', 'RWD', 1, '2024-06-21 15:18:44', '2024-06-21 15:18:44', NULL);
INSERT INTO `role` VALUES (5, 'UserBot', '', 0, '2024-07-04 12:49:39', '2024-07-04 12:49:44', NULL);

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `idrolemenu` int NOT NULL AUTO_INCREMENT,
  `idrole` int NOT NULL,
  `idmenu` int NOT NULL,
  `status` int NOT NULL DEFAULT 1 COMMENT '1-Active    0-Inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idrolemenu`) USING BTREE,
  INDEX `IDXROL`(`idrole` ASC) USING BTREE,
  INDEX `IDME`(`idmenu` ASC) USING BTREE,
  CONSTRAINT `IDME` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXROL` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (2, 2, 1, 1, '2024-06-21 15:20:16', '2024-06-21 15:20:16', NULL);
INSERT INTO `rolemenu` VALUES (3, 2, 2, 1, '2024-06-21 15:20:17', '2024-06-21 15:20:27', NULL);
INSERT INTO `rolemenu` VALUES (4, 2, 3, 1, '2024-06-21 15:20:18', '2024-06-21 15:20:28', NULL);
INSERT INTO `rolemenu` VALUES (6, 2, 5, 1, '2024-06-21 15:20:20', '2024-06-21 15:20:26', NULL);
INSERT INTO `rolemenu` VALUES (7, 2, 6, 1, '2024-06-21 15:20:20', '2024-06-21 15:20:26', NULL);
INSERT INTO `rolemenu` VALUES (8, 2, 7, 1, '2024-06-21 15:20:21', '2024-06-21 15:20:29', NULL);
INSERT INTO `rolemenu` VALUES (9, 2, 8, 1, '2024-06-21 15:20:22', '2024-06-21 15:20:26', NULL);
INSERT INTO `rolemenu` VALUES (10, 2, 9, 1, '2024-06-21 15:20:22', '2024-06-21 15:21:06', NULL);
INSERT INTO `rolemenu` VALUES (11, 4, 1, 1, '2024-06-21 15:21:49', '2024-06-21 15:21:49', NULL);
INSERT INTO `rolemenu` VALUES (12, 4, 2, 1, '2024-06-21 15:21:53', '2024-06-21 15:21:53', NULL);
INSERT INTO `rolemenu` VALUES (13, 4, 3, 1, '2024-06-21 15:21:56', '2024-06-21 15:21:56', NULL);
INSERT INTO `rolemenu` VALUES (14, 4, 4, 1, '2024-06-21 15:21:58', '2024-06-21 15:21:58', NULL);
INSERT INTO `rolemenu` VALUES (15, 4, 5, 1, '2024-06-21 15:22:03', '2024-06-21 15:22:03', NULL);
INSERT INTO `rolemenu` VALUES (16, 4, 6, 1, '2024-06-21 15:22:09', '2024-06-21 15:22:09', NULL);
INSERT INTO `rolemenu` VALUES (18, 4, 7, 1, '2024-06-21 15:22:17', '2024-06-21 15:22:17', NULL);
INSERT INTO `rolemenu` VALUES (19, 4, 8, 1, '2024-06-21 15:22:20', '2024-06-21 15:22:20', NULL);
INSERT INTO `rolemenu` VALUES (20, 4, 9, 1, '2024-06-21 15:22:23', '2024-06-21 15:22:23', NULL);
INSERT INTO `rolemenu` VALUES (21, 1, 6, 1, '2024-06-21 15:22:44', '2024-06-21 15:22:44', NULL);
INSERT INTO `rolemenu` VALUES (22, 1, 8, 1, '2024-06-21 15:22:46', '2024-06-21 15:22:46', NULL);
INSERT INTO `rolemenu` VALUES (23, 3, 6, 1, '2024-06-21 15:23:53', '2024-06-21 15:23:53', NULL);
INSERT INTO `rolemenu` VALUES (24, 3, 7, 1, '2024-06-21 15:23:55', '2024-06-21 15:23:55', NULL);
INSERT INTO `rolemenu` VALUES (25, 3, 8, 1, '2024-06-21 15:23:58', '2024-06-21 15:23:58', NULL);
INSERT INTO `rolemenu` VALUES (26, 3, 9, 1, '2024-06-21 15:24:03', '2024-06-21 15:24:03', NULL);
INSERT INTO `rolemenu` VALUES (27, 2, 10, 1, '2024-06-21 15:52:06', '2024-06-21 15:52:06', NULL);
INSERT INTO `rolemenu` VALUES (28, 2, 11, 1, '2024-06-21 15:52:11', '2024-06-21 15:52:11', NULL);
INSERT INTO `rolemenu` VALUES (29, 2, 12, 1, '2024-06-21 15:52:14', '2024-06-21 15:52:14', NULL);
INSERT INTO `rolemenu` VALUES (30, 2, 13, 1, '2024-06-21 15:52:18', '2024-06-21 15:52:18', NULL);
INSERT INTO `rolemenu` VALUES (31, 2, 14, 1, '2024-06-21 15:52:21', '2024-06-21 15:52:21', NULL);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `iduser` int NULL DEFAULT NULL,
  `idbeneficiary` int NULL DEFAULT NULL,
  `idmovementtype` int NULL DEFAULT NULL,
  `date` varchar(19) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numberdocument` int NOT NULL DEFAULT 0,
  `subtotal` double(20, 2) NOT NULL DEFAULT 0.00,
  `discount` double(20, 2) NOT NULL DEFAULT 0.00,
  `total` double(20, 2) NOT NULL DEFAULT 0.00,
  `reference` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idtransaction`) USING BTREE,
  INDEX `IDXM`(`idmovementtype` ASC) USING BTREE,
  INDEX `IDXB`(`idbeneficiary` ASC) USING BTREE,
  INDEX `IDUSS`(`iduser` ASC) USING BTREE,
  CONSTRAINT `IDUSS` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXB` FOREIGN KEY (`idbeneficiary`) REFERENCES `beneficiary` (`idbeneficiary`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXM` FOREIGN KEY (`idmovementtype`) REFERENCES `movementtype` (`idmovementtype`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaction
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `idrole` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT 1 COMMENT '1-Active 0-Inactive',
  `idbot` bigint NOT NULL DEFAULT 0 COMMENT 'Si es diferente de 0 es que es usuario chatbot',
  `lang` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'es',
  `operations` bigint NOT NULL DEFAULT 0 COMMENT 'Numero de operacion que ha realizado en el sistema',
  `lastlogged` datetime NULL DEFAULT NULL COMMENT 'Ultimo dia que se logueo o inicio sesion',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`iduser`) USING BTREE,
  INDEX `IDXROLE`(`idrole` ASC) USING BTREE,
  CONSTRAINT `IDXROLE` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 2, 'jorge', 'jorge', 'Jorge', 1, 0, 'es', 0, NULL, '2024-06-21 15:30:34', '2024-07-04 12:54:56', NULL);
INSERT INTO `user` VALUES (2, 2, 'santiago', 'santiago', 'Santiago', 1, 0, 'es', 0, NULL, '2024-06-21 15:30:47', '2024-07-04 12:54:57', NULL);
INSERT INTO `user` VALUES (3, 2, 'hugo', 'hugo', 'Hugo', 1, 0, 'es', 0, NULL, '2024-06-21 15:31:03', '2024-07-04 12:54:57', NULL);
INSERT INTO `user` VALUES (4, 2, 'joel', 'joel', 'Joel', 1, 0, 'es', 0, NULL, '2024-06-21 15:31:15', '2024-07-04 12:54:58', NULL);
INSERT INTO `user` VALUES (5, 2, 'rick', 'rick', 'Ricardo', 1, 0, 'es', 0, NULL, '2024-06-21 15:31:31', '2024-07-04 12:54:59', NULL);
INSERT INTO `user` VALUES (6, 5, 'SantiagoDieum', '123456', 'Santiago Borja', 0, 1427181793, 'es', 91, NULL, '2024-07-04 13:14:09', '2024-07-05 21:32:31', NULL);

-- ----------------------------
-- View structure for view_get_menu
-- ----------------------------
DROP VIEW IF EXISTS `view_get_menu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_get_menu` AS select `role`.`idrole` AS `idrole`,`menu`.`idmenu` AS `idmenu`,`menu`.`order` AS `order`,`menu`.`name` AS `name`,`menu`.`icon` AS `icon`,`menu`.`route` AS `route`,`menu`.`submenu` AS `submenu` from ((`role` join `rolemenu` on((`role`.`idrole` = `rolemenu`.`idrole`))) join `menu` on((`rolemenu`.`idmenu` = `menu`.`idmenu`))) where (`menu`.`status` = 1) order by `menu`.`order`;

-- ----------------------------
-- View structure for view_get_users
-- ----------------------------
DROP VIEW IF EXISTS `view_get_users`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_get_users` AS select `u`.`iduser` AS `iduser`,`u`.`idrole` AS `idrole`,`r`.`name` AS `rolename`,`r`.`scope` AS `scope`,`u`.`username` AS `username`,`u`.`fullname` AS `fullname`,`u`.`status` AS `status`,`u`.`created_at` AS `created_at`,`u`.`udated_at` AS `udated_at`,`u`.`deleted_at` AS `deleted_at` from (`user` `u` join `role` `r` on((`u`.`idrole` = `r`.`idrole`)));

-- ----------------------------
-- Procedure structure for check_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `check_password`;
delimiter ;;
CREATE PROCEDURE `check_password`(IN toID int)
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
  DECLARE loPASS VARCHAR(255) DEFAULT("");
   
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
  
  IF loNUSER > 0 THEN
    
    SELECT `password` INTO loPASS FROM `user` WHERE idbot = toID;
    
    SET sndRESPONSE = CONCAT("SHOW|",loPASS);

  ELSE
    SET sndRESPONSE = "ERROR|USUARIO NO ENCONTRADO";
  END IF;

  SELECT sndRESPONSE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_password`;
delimiter ;;
CREATE PROCEDURE `set_password`(IN toID int, IN toNEWPASS varchar(255))
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
   
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
  
  IF loNUSER > 0 THEN
    
    START TRANSACTION;
    
    SET @loSQL = CONCAT("UPDATE user SET password='",toNEWPASS,"' WHERE idbot = ", toID);
    -- select @loSQL;
    
		PREPARE STMT FROM @loSQL;
		EXECUTE STMT;
    
    -- CALL store_bot_messages(toID, "", "", "", "UPDATE PASSWORD", "menu");
    
    COMMIT; 
    
    SET sndRESPONSE = "EXEC|menu";

  ELSE
    SET sndRESPONSE = "ERROR|USUARIO NO ENCONTRADO";
  END IF;

  SELECT sndRESPONSE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for store_bot_messages
-- ----------------------------
DROP PROCEDURE IF EXISTS `store_bot_messages`;
delimiter ;;
CREATE PROCEDURE `store_bot_messages`(IN toID bigint(11), IN toAuthor varchar(255), IN toLang varchar(255), IN toUsername varchar(255), IN toTextentered text, IN toKeyresult varchar(255))
BEGIN
  DECLARE loERROR INTEGER DEFAULT(0);
  DECLARE loNUSER INTEGER DEFAULT(0);
  DECLARE loIDUSER BIGINT DEFAULT(0);
  DECLARE loPASS VARCHAR(255) DEFAULT("");
  DECLARE loLASTLOGGED VARCHAR(255) DEFAULT("");
  DECLARE loIDROLE BIGINT DEFAULT(5);
  DECLARE sndRESPONSE VARCHAR(255) DEFAULT("");
 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET loERROR = 1;
 	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET loERROR = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET loERROR = 1;
  
  START TRANSACTION;
  
    SELECT count(*) INTO loNUSER FROM `user` WHERE idbot = toID;
    
    IF loNUSER = 0 THEN
      INSERT INTO user (username,password,fullname,status,idbot,lang, idrole) VALUES (toUsername, '', toAuthor, 0, toID, toLang, loIDROLE);
      
      SET sndRESPONSE = "NEW|PASSWOOD";
    ELSE
      SELECT iduser, `password`, COALESCE(lastlogged,"") INTO loIDUSER, loPASS, loLASTLOGGED FROM user WHERE idbot = toID LIMIT 1;
      
      UPDATE user SET operations = operations + 1 WHERE iduser = loIDUSER;
        
      INSERT INTO bot_audit (iduser, textentered, keyresult) VALUES (loIDUSER, toTextentered, toKeyresult);
      
      SET sndRESPONSE = "OK|";
      
      /*IF loPASS = "" THEN
        SET sndRESPONSE = "SET|PASSWOOD";
      ELSE
        UPDATE user SET operations = operations + 1 WHERE iduser = loIDUSER;
        
        INSERT INTO bot_audit (iduser, textentered, keyresult) VALUES (loIDUSER, toTextentered, toKeyresult);
        
        SET sndRESPONSE = "OK|";
        
        IF loLASTLOGGED = "" THEN
          SET sndRESPONSE = "LOGIN|";
        END IF;
        
        IF loLASTLOGGED != DATE(NOW()) THEN
          SET sndRESPONSE = "LOGIN|";
        END IF;
        
        
      END IF;.
      */
    END IF;
    
  COMMIT;

  SELECT sndRESPONSE;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
