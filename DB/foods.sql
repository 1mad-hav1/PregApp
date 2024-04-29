# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_babyglow
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-04-29 07:40:58
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_babyglow'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_babyglow" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_babyglow";


#
# Table structure for table 'tbl_food'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_food" (
  "food_id" int(10) unsigned NOT NULL auto_increment,
  "food_name" varchar(200) default NULL,
  "food_description" varchar(500) default NULL,
  PRIMARY KEY  ("food_id")
) AUTO_INCREMENT=20;



#
# Dumping data for table 'tbl_food'
#

LOCK TABLES "tbl_food" WRITE;
/*!40000 ALTER TABLE "tbl_food" DISABLE KEYS;*/
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('1','Leafy Greens','Rich in folate, iron, and fiber, essential for fetal development and preventing birth defects.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('2','Whole Grains','Excellent source of complex carbohydrates, providing sustained energy and preventing constipation.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('3','Lean Protein','Essential for building and repairing tissues, including the developing baby''s cells.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('4','Dairy Products','Excellent source of calcium and vitamin D, crucial for bone and teeth development in the fetus.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('5','Fruits','High in vitamins C and antioxidants, aiding in tissue repair and boosting the immune system.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('6','Vegetables','Packed with vitamins A, C, and K, supporting fetal eye, skin, and bone development.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('7','Nuts and Seeds','Rich in healthy fats, protein, and fiber, providing sustained energy and satiety.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('8','Legumes','High in protein, iron, and folate, crucial for fetal growth and preventing neural tube defects.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('9','Lean Meats','Excellent source of high-quality protein and iron, supporting muscle growth and preventing anemia.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('10','Eggs','Rich in protein, choline, and omega-3 fatty acids, supporting fetal brain development and preventing neural tube defects.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('11','Fatty Fish','Excellent source of omega-3 fatty acids, crucial for fetal brain and eye development.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('12','Avocado','Packed with healthy monounsaturated fats, providing energy and supporting fetal tissue development.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('13','Greek Yogurt','High in protein and calcium, supporting fetal bone and teeth development.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('14','Berries','Rich in antioxidants, vitamins, and fiber, supporting maternal immune function and preventing oxidative stress.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('15','Broccoli','Excellent source of folate, vitamin C, and fiber, supporting fetal growth and preventing birth defects.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('16','Cottage Cheese','High in protein and calcium, crucial for fetal bone and muscle development.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('17','Tomatoes','Rich in vitamin C, potassium, and antioxidants, supporting maternal immune function and fetal growth.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('18','Pumpkin Seeds','Excellent source of iron, magnesium, and zinc, supporting maternal and fetal health.');
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_description") VALUES
	('19','Sweet Potatoes','High in beta-carotene, vitamin C, and fiber, supporting fetal eye, skin, and digestive health.');
/*!40000 ALTER TABLE "tbl_food" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
