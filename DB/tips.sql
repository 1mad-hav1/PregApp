# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_babyglow
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-04-29 07:40:34
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_babyglow'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_babyglow" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_babyglow";


#
# Table structure for table 'tbl_tips'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_tips" (
  "tips_id" int(10) unsigned NOT NULL auto_increment,
  "tips_subject" varchar(200) default NULL,
  "tips_description" varchar(500) default NULL,
  PRIMARY KEY  ("tips_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_tips'
#

LOCK TABLES "tbl_tips" WRITE;
/*!40000 ALTER TABLE "tbl_tips" DISABLE KEYS;*/
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('1','Hydration','Drink plenty of water throughout the day to stay hydrated, especially as pregnancy increases your fluid needs.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('2','Nutrition','Consume a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and dairy products to ensure adequate nutrition for you and your baby.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('3','Supplementation','Take prenatal vitamins containing folic acid, iron, calcium, and other essential nutrients as recommended by your healthcare provider to support fetal development.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('4','Physical Activity','Engage in regular, moderate exercise such as walking, swimming, or prenatal yoga to improve circulation, reduce stress, and promote overall well-being.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('5','Posture','Maintain good posture to alleviate back pain and discomfort associated with pregnancy. Use proper body mechanics when lifting or carrying objects.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('6','Sleep','Prioritize sleep and aim for 7-9 hours of quality sleep per night. Use pillows to support your body and find a comfortable sleeping position.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('7','Stress Management','Practice relaxation techniques such as deep breathing, meditation, or prenatal massage to reduce stress and promote relaxation.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('8','Education','Enroll in prenatal classes to learn about childbirth, breastfeeding, newborn care, and parenting skills. These classes can help you feel more prepared and confident.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('9','Healthcare','Attend regular prenatal appointments and communicate openly with your healthcare provider about any concerns or questions you may have.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('10','Substance Avoidance','Avoid alcohol, tobacco, and illicit drugs, as they can harm your baby''s development and increase the risk of complications during pregnancy.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('11','Oral Health','Maintain regular dental check-ups and practice good oral hygiene by brushing and flossing daily. Pregnancy hormones can increase the risk of gum disease.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('12','Clothing','Choose loose-fitting, comfortable clothing made from breathable fabrics to accommodate your changing body shape and minimize discomfort.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('13','Heat','Avoid overheating by staying indoors during peak sun hours, wearing lightweight clothing, and staying hydrated in hot weather.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('14','Labor Preparation','Create a birth plan, pack a hospital bag, and discuss pain management options with your healthcare provider to prepare for labor and delivery.');
REPLACE INTO "tbl_tips" ("tips_id", "tips_subject", "tips_description") VALUES
	('15','Relationship','Spend quality time with your partner, communicate openly about your feelings, and involve them in your pregnancy journey to strengthen your bond as a couple.');
/*!40000 ALTER TABLE "tbl_tips" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
