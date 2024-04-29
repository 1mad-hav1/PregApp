# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_babyglow
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    4/28/2024 10:45:48 PM
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_babyglow'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_babyglow" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_babyglow";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) default NULL,
  "admin_email" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('3','madhav','admin@gmail.com','admin123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_appointments'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_appointments" (
  "appointments_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" int(10) unsigned default NULL,
  "scheduleslots_id" int(10) unsigned default NULL,
  "hospital_id" int(10) unsigned default NULL,
  "doctors_id" int(10) unsigned default NULL,
  "appointments_date" varchar(30) default NULL,
  "appointments_cancel" int(10) unsigned default NULL,
  "appointments_online" int(10) unsigned default NULL,
  PRIMARY KEY  ("appointments_id")
) AUTO_INCREMENT=26;



#
# Dumping data for table 'tbl_appointments'
#

LOCK TABLES "tbl_appointments" WRITE;
/*!40000 ALTER TABLE "tbl_appointments" DISABLE KEYS;*/
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('17','10','9','8','8','2024-04-14',NULL,'0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('18','10','45','8','8','2024-04-11','1','0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('19','11','46','8','8','2024-04-11',NULL,'0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('20','12','46','8','8','2024-04-11',NULL,'0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('21','13','10','8','8','2024-04-14',NULL,'0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('22','10','45','8','8','2024-04-24','1','0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('23','10','12','8','8','2024-04-28','2','1');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('24','8','46','8','8','2024-04-16',NULL,'0');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id", "doctors_id", "appointments_date", "appointments_cancel", "appointments_online") VALUES
	('25','8','46','8','8','2024-05-01',NULL,'0');
/*!40000 ALTER TABLE "tbl_appointments" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_categories'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_categories" (
  "categories_id" int(10) unsigned NOT NULL auto_increment,
  "categories_name" varchar(50) default NULL,
  PRIMARY KEY  ("categories_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_categories'
#

LOCK TABLES "tbl_categories" WRITE;
/*!40000 ALTER TABLE "tbl_categories" DISABLE KEYS;*/
REPLACE INTO "tbl_categories" ("categories_id", "categories_name") VALUES
	('3','jjjj');
REPLACE INTO "tbl_categories" ("categories_id", "categories_name") VALUES
	('4','dadas');
REPLACE INTO "tbl_categories" ("categories_id", "categories_name") VALUES
	('5','fweew');
/*!40000 ALTER TABLE "tbl_categories" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chat" (
  "chat_id" int(10) unsigned NOT NULL auto_increment,
  "chat_content" varchar(100) NOT NULL,
  "chat_date" varchar(100) NOT NULL,
  "user_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("chat_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_chat'
#

LOCK TABLES "tbl_chat" WRITE;
/*!40000 ALTER TABLE "tbl_chat" DISABLE KEYS;*/
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_date", "user_id") VALUES
	('4','hii
','April 08 2024, 06:06 PM','9');
REPLACE INTO "tbl_chat" ("chat_id", "chat_content", "chat_date", "user_id") VALUES
	('5','helloo
','April 08 2024, 06:12 PM','7');
/*!40000 ALTER TABLE "tbl_chat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_comment'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_comment" (
  "comment_id" int(10) unsigned NOT NULL auto_increment,
  "comment_content" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  "post_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("comment_id")
);



#
# Dumping data for table 'tbl_comment'
#

# No data found.



#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('1','Thiruvananthapuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('2','Kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('3','Pathanamthitta');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('4','Alappuzha');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('5','Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('6','Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('7','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('8','Thrissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('9','Palakkad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('10','Malappuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('11','Kozhikode');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('12','Wayanad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('13','Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('14','Kasaragod');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_doctors'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_doctors" (
  "doctors_id" int(10) unsigned NOT NULL auto_increment,
  "doctors_name" varchar(50) default NULL,
  "doctors_email" varchar(50) default NULL,
  "doctors_contact" bigint(20) unsigned default NULL,
  "hospitalservices_id" int(10) unsigned default NULL,
  "doctors_photo" varchar(100) default NULL,
  "doctors_qualification" varchar(50) default NULL,
  PRIMARY KEY  ("doctors_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_doctors'
#

LOCK TABLES "tbl_doctors" WRITE;
/*!40000 ALTER TABLE "tbl_doctors" DISABLE KEYS;*/
REPLACE INTO "tbl_doctors" ("doctors_id", "doctors_name", "doctors_email", "doctors_contact", "hospitalservices_id", "doctors_photo", "doctors_qualification") VALUES
	('5','Ron','ron@gmail.com','1234567890','9','DoctorPhoto_1577.jpeg','MBBS');
REPLACE INTO "tbl_doctors" ("doctors_id", "doctors_name", "doctors_email", "doctors_contact", "hospitalservices_id", "doctors_photo", "doctors_qualification") VALUES
	('6','Elna','elna@gmail.com','1234567890','8','DoctorPhoto_1962.jpeg','MBBS');
REPLACE INTO "tbl_doctors" ("doctors_id", "doctors_name", "doctors_email", "doctors_contact", "hospitalservices_id", "doctors_photo", "doctors_qualification") VALUES
	('8','Elna','elna@gmail.com','1234567890','1','DoctorPhoto_1803.jpeg','MBBS');
REPLACE INTO "tbl_doctors" ("doctors_id", "doctors_name", "doctors_email", "doctors_contact", "hospitalservices_id", "doctors_photo", "doctors_qualification") VALUES
	('9','Elna','elna@gmail.com','12346789','11','DoctorPhoto_1780.jpeg','MBBS');
REPLACE INTO "tbl_doctors" ("doctors_id", "doctors_name", "doctors_email", "doctors_contact", "hospitalservices_id", "doctors_photo", "doctors_qualification") VALUES
	('11','Sharon','sharon@gmail.com','1234567890','20','DoctorPhoto_1210.jpg','PHD');
/*!40000 ALTER TABLE "tbl_doctors" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_emergency'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_emergency" (
  "emergency_id" int(10) unsigned NOT NULL auto_increment,
  "emergency_name" varchar(50) default NULL,
  "emergency_contact" bigint(20) unsigned default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("emergency_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_emergency'
#

LOCK TABLES "tbl_emergency" WRITE;
/*!40000 ALTER TABLE "tbl_emergency" DISABLE KEYS;*/
REPLACE INTO "tbl_emergency" ("emergency_id", "emergency_name", "emergency_contact", "place_id") VALUES
	('3','Ambulance','108','3');
REPLACE INTO "tbl_emergency" ("emergency_id", "emergency_name", "emergency_contact", "place_id") VALUES
	('4','Ambulance','103','1');
REPLACE INTO "tbl_emergency" ("emergency_id", "emergency_name", "emergency_contact", "place_id") VALUES
	('5','Police','100','2');
/*!40000 ALTER TABLE "tbl_emergency" ENABLE KEYS;*/
UNLOCK TABLES;


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


#
# Table structure for table 'tbl_hospital'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_hospital" (
  "hospital_id" int(3) unsigned NOT NULL auto_increment,
  "hospital_name" varchar(50) default NULL,
  "place_id" int(3) unsigned default NULL,
  "hospital_logo" varchar(200) default NULL,
  "hospital_address" varchar(200) default NULL,
  "hospital_email" varchar(50) default NULL,
  "hospital_password" varchar(50) default NULL,
  "hospital_contact" bigint(20) unsigned default NULL,
  "hospital_proof" varchar(50) default NULL,
  "hospital_photo" varchar(50) default NULL,
  "hospital_status" int(10) unsigned default '0',
  PRIMARY KEY  ("hospital_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_hospital'
#

LOCK TABLES "tbl_hospital" WRITE;
/*!40000 ALTER TABLE "tbl_hospital" DISABLE KEYS;*/
REPLACE INTO "tbl_hospital" ("hospital_id", "hospital_name", "place_id", "hospital_logo", "hospital_address", "hospital_email", "hospital_password", "hospital_contact", "hospital_proof", "hospital_photo", "hospital_status") VALUES
	('7','smitha','1','HospitalLogo_1287.jpg','smitha address','smitha@gmail.com','smitha123','123456789','HospitalProof_1560.jpeg','HospitalPhoto_1670.jpg','1');
REPLACE INTO "tbl_hospital" ("hospital_id", "hospital_name", "place_id", "hospital_logo", "hospital_address", "hospital_email", "hospital_password", "hospital_contact", "hospital_proof", "hospital_photo", "hospital_status") VALUES
	('8','Nirmala','2','HospitalLogo_1763.jpg','nirmala address','nirmala@gmail.com','nirmala123','123456789','HospitalProof_2056.jpg','HospitalPhoto_1283.jpeg','1');
REPLACE INTO "tbl_hospital" ("hospital_id", "hospital_name", "place_id", "hospital_logo", "hospital_address", "hospital_email", "hospital_password", "hospital_contact", "hospital_proof", "hospital_photo", "hospital_status") VALUES
	('9','St George','3','HospitalLogo_1943.jpg','st george address','stgeorge@gmail.com','stg12','1234567890','HospitalProof_1933.webp','HospitalPhoto_1003.jpg','0');
/*!40000 ALTER TABLE "tbl_hospital" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_hospitalservices'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_hospitalservices" (
  "hospitalservices_id" int(10) unsigned NOT NULL auto_increment,
  "hospital_id" int(10) unsigned default NULL,
  "services_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("hospitalservices_id")
) AUTO_INCREMENT=21;



#
# Dumping data for table 'tbl_hospitalservices'
#

LOCK TABLES "tbl_hospitalservices" WRITE;
/*!40000 ALTER TABLE "tbl_hospitalservices" DISABLE KEYS;*/
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('1','8','4');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('2','8','5');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('6','7','4');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('9','7','8');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('11','7','9');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('12','9','4');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('18','9','8');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "services_id") VALUES
	('20','9','7');
/*!40000 ALTER TABLE "tbl_hospitalservices" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=467;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('7','Kochi (Cochin)','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('8','Aluva','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('9','Kothamangalam','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('10','Muvattupuzha','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('11','North Paravur','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('12','Angamaly','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('13','Perumbavoor','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('14','Fort Kochi','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('15','Mattancherry','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('16','Kalady','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('17','Tripunithura','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('18','Kakkanad','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('19','Thrikkakara','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('20','Edapally','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('21','Cherai','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('22','Vypin Island','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('23','Maradu','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('24','Palluruthy','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('25','Thoppumpady','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('26','Palarivattom','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('27','Panampilly Nagar','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('28','Marine Drive','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('29','Thevara','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('30','Puthuvype','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('31','Ernakulam South','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('32','Ernakulam North','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('33','Kalamassery','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('34','Thiruvankulam','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('35','Aroor','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('36','Mulanthuruthy','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('37','Thiruvananthapuram','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('38','Neyyattinkara','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('39','Varkala','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('40','Attingal','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('41','Kattakada','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('42','Nedumangad','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('43','Kovalam','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('44','Poovar','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('45','Aruvikkara','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('46','Vizhinjam','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('47','Karakulam','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('48','Kazhakuttam','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('49','Kaniyapuram','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('50','Pothencode','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('51','Vattiyoorkavu','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('52','Parassala','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('53','Kulathoor','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('54','Balaramapuram','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('55','Pallippuram','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('56','Kannammoola','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('57','Nemom','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('58','Vellayani','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('59','Peroorkada','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('60','Thiruvallam','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('61','Mangalapuram','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('62','Murukkumpuzha','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('63','Kilimanoor','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('64','Chirayinkeezhu','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('65','Tholicode','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('66','Kudappanakunnu','1');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('67','Kollam','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('68','Karunagappally','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('69','Punalur','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('70','Paravur','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('71','Kottarakkara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('72','Pathanapuram','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('73','Chavara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('74','Anchal','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('75','Kundara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('76','Chadayamangalam','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('77','Oachira','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('78','Ayoor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('79','Kulathupuzha','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('80','Adoor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('81','Sasthamkotta','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('82','Edakkidom','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('83','Thenmala','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('84','Elampalloor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('85','Kilikollur','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('86','Mayyanad','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('87','Poruvazhy','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('88','Thazhava','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('89','Sakthikulangara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('90','Kottamkara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('91','Puthoor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('92','Velinalloor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('93','Neendakara','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('94','Alappad','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('95','Panmana','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('96','Elampal','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('97','Mynagappally','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('98','Pallimon','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('99','Thrikkaruva','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('100','Kulakkada','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('101','Kottiyam','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('102','Nedumpana','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('103','Pallikkodi','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('104','Kannanalloor','2');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('105','Adoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('106','Aranmula','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('107','Chengannur','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('108','Konni','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('109','Kozhencherry','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('110','Mallappally','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('111','Pathanamthitta','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('112','Ranni','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('113','Thiruvalla','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('114','Kulanada','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('115','Elanthoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('116','Kodumon','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('117','Koipuram','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('118','Vazhamuttom','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('119','Thumpamon','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('120','Nedumkunnam','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('121','Pullad','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('122','Mavelikkara','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('123','Cherukolpuzha','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('124','Kalanjoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('125','Perunad','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('126','Kadampanad','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('127','Thottapuzhassery','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('128','Kuttoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('129','Kozhancherry','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('130','Kaviyoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('131','Pandalam Thekkekara','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('132','Malayalapuzha','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('133','Mannar','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('134','Niranam','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('135','Vadasserikara','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('136','Karikalkulam','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('137','Kaipattoor','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('138','Parumala','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('139','Vadaserikara','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('140','Vallicode','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('141','Pramadom','3');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('142','Cherthala','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('143','Ambalappuzha','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('144','Kayamkulam','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('145','Harippad','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('146','Mavelikkara','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('147','Chengannur','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('148','Cherthala','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('149','Karthikappally','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('150','Kuttanad','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('151','Mararikkulam','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('152','Champakulam','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('153','Thakazhi','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('154','Mannar','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('155','Pulinkunnu','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('156','Thrikkunnapuzha','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('157','Cherthala South','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('158','Cherthala North','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('159','Arookutty','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('160','Thanneermukkom','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('161','Pattanakkad','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('162','Ramankary','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('163','Thalavady','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('164','Thiruvampady','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('165','Kainakary','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('166','Kavalam','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('167','Pallippad','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('168','Ezhupunna','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('169','Aroor','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('170','Thaikattussery','4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('171','Changanassery','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('172','Vaikom','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('173','Ettumanoor','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('174','Pala','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('175','Thiruvalla','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('176','Kanjirappally','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('177','Erattupetta','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('178','Palai','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('179','Mundakayam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('180','Kaduthuruthy','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('181','Kuravilangad','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('182','Chingavanam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('183','Kottayam-Malabar','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('184','Kudakkachira','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('185','Kumarakom','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('186','Manimala','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('187','Vakathanam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('188','Athirampuzha','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('189','Meenachil','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('190','Bharananganam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('191','Ponkunnam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('192','Aymanam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('193','Ramapuram','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('194','Vaikom','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('195','Kurichi','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('196','Kidangoor','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('197','Thalayolaparambu','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('198','Uzhavoor','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('199','Thiruvarpu','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('200','Elikulam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('201','Thidanad','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('202','Kanakkari','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('203','Erumely','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('204','Karukachal','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('205','Thalanad','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('206','Manarcad','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('207','Ayarkunnam','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('208','Kappumthala','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('209','Neendoor','5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('210','Thodupuzha','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('211','Munnar','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('212','Idukki','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('213','Painavu','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('214','Adimali','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('215','Nedumkandam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('216','Kattappana','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('217','Cheruthoni','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('218','Rajakkad','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('219','Vagamon','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('220','Kuttikkanam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('221','Peerumedu','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('222','Thookkupalam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('223','Vandiperiyar','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('224','Marayoor','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('225','Kanjirappally','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('226','Kumily','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('227','Rajakumari','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('228','Ramakkalmedu','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('229','Kunchithanni','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('230','Elappara','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('231','Vathikudy','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('232','Anakkara','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('233','Kokkayar','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('234','Bodimettu','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('235','Kuttikanam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('236','Santhanpara','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('237','Devikulam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('238','Kallar','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('239','Peruvanthanam','6');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('240','Chalakudy','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('241','Guruvayur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('242','Irinjalakuda','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('243','Kodungallur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('244','Kunnamkulam','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('245','Chavakkad','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('246','Wadakkanchery','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('247','Thalikulam','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('248','Pavaratty','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('249','Thriprayar','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('250','Chelakkara','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('251','Pudukkad','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('252','Mala','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('253','Nenmenikkara','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('254','Kuttanellur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('255','Mulankunnathukavu','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('256','Athirappilly','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('257','Thiruvilwamala','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('258','Vadakkanchery','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('259','Velur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('260','Thiruvanchikulam','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('261','Pazhayannur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('262','Anthikkad','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('263','Puthukkad','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('264','Nadathara','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('265','Nattika','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('266','Ollur','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('267','Cherpu','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('268','Peringottukara','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('269','Ottapalam','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('270','Chittur-Thathamangalam','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('271','Mannarkkad','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('272','Alathur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('273','Pattambi','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('274','Shoranur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('275','Cherpulassery','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('276','Koduvayur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('277','Malampuzha','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('278','Kongad','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('279','Kuzhalmannam','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('280','Kollengode','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('281','Thrithala','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('282','Parudur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('283','Walayar','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('284','Pudussery Central','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('285','Kottayi','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('286','Thachampara','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('287','Kalpathy','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('288','Nenmara','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('289','Mangalam Dam','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('290','Mundur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('291','Vadakkencherry','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('292','Kuzhur','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('293','Nellaya','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('294','Puthucode','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('295','Kallekkad','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('296','Pathirippala','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('297','Puduppariyaram','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('298','Manjeri','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('299','Tirur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('300','Perinthalmanna','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('301','Ponnani','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('302','Nilambur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('303','Kottakkal','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('304','Tanur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('305','Tirurangadi','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('306','Parappanangadi','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('307','Edappal','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('308','Wandoor','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('309','Valanchery','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('310','Vengara','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('311','Kondotty','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('312','Kalpetta','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('313','Kuttippuram','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('314','Pulamanthole','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('315','Mankada','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('316','Thirurangadi','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('317','Vazhakkad','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('318','Kottappadi','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('319','Areacode','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('320','Karuvarakundu','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('321','Kizhuparamba','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('322','Melattur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('323','Kuttur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('324','Kunnamangalam','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('325','Pandikkad','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('326','Othukkungal','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('327','Perumanna','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('328','Areekode','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('329','Morayur','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('330','Thennala','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('331','Nannambra','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('332','Edarikkode','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('333','Puthanathani','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('334','Vazhakkad','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('335','Vadakara','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('336','Thamarassery','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('337','Koyilandy','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('338','Feroke','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('339','Balussery','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('340','Ramanattukara','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('341','Kunnamangalam','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('342','Koduvally','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('343','Perambra','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('344','Mavoor','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('345','Beypore','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('346','Chelannur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('347','Mukkam','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('348','Payyoli','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('349','Cheruvannur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('350','Thikkodi','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('351','Elathur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('352','Kadalundi','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('353','Thiruvambady','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('354','Kodenchery','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('355','Nadapuram','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('356','Kakkodi','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('357','Olavanna','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('358','Madavoor','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('359','Narikkuni','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('360','Atholi','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('361','Chorode','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('362','Unnikulam','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('363','Chevayur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('364','NIT Calicut','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('365','Kayanna','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('366','Kuttikkattur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('367','Thuneri','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('368','Kuruvattur','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('369','Omassery','11');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('370','Kalpetta','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('371','Sulthan Bathery','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('372','Mananthavady','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('373','Vythiri','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('374','Meppadi','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('375','Pulpally','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('376','Thirunelli','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('377','Thariyode','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('378','Ambalavayal','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('379','Panamaram','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('380','Vellamunda','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('381','Muppainad','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('382','Padinjarathara','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('383','Pozhuthana','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('384','Thondernad','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('385','Kenichira','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('386','Noolpuzha','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('387','Nenmeni','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('388','Nalloornad','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('389','Kaniyambetta','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('390','Muttil','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('391','Kalladi','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('392','Poothadi','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('393','Makkiyad','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('394','Kavumannam','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('395','Thavinhal','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('396','Chundale','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('397','Ambalavayal','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('398','Nenmeni','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('399','Vengapally','12');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('400','Thalassery','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('401','Payyannur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('402','Mattannur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('403','Taliparamba','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('404','Kuthuparamba','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('405','Iritty','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('406','Panoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('407','Pappinisseri','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('408','Chakkarakkal','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('409','Thaliparamba','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('410','Cheruthazham','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('411','Valapattanam','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('412','Muzhappilangad','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('413','Kottiyoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('414','Anthoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('415','Kandamkunnu','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('416','Kavumbhagam','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('417','Chakkarakkal','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('418','Keezhallur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('419','Peringathur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('420','Kottiyoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('421','Chirakkal','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('422','Dharmadam','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('423','Edakkad','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('424','Elayavoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('425','Irikkur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('426','Kadirur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('427','Kakkabe','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('428','Kalliad','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('429','Kallur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('430','Kanichar','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('431','Karivellur','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('432','Kavumbhagam','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('433','Koodali','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('434','Kottayam Malabar','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('435','Kudiyanmala','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('436','Kuthuparamba','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('437','Kuttiattoor','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('438','Madayi','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('439','Kanhangad','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('440','Nileshwar','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('441','Manjeshwar','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('442','Kumbla','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('443','Uppala','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('444','Cheruvathur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('445','Trikaripur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('446','Badiyadka','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('447','Vellarikundu','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('448','Parappa','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('449','Padanna','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('450','Hosdurg','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('451','Cherkala','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('452','Cheruvathur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('453','Periya','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('454','Kumbala','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('455','Adhur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('456','Mogral Puthur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('457','Paivalike','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('458','Kudlu','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('459','Mulleria','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('460','Chengala','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('461','Madoor','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('462','Trikarpur','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('463','Karadka','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('464','Kadambar','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('465','Bedadka','14');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('466','Kasaragod Town','14');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_post'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_post" (
  "post_id" int(10) unsigned NOT NULL auto_increment,
  "post_name" varchar(50) default NULL,
  "post_like" int(10) unsigned default NULL,
  "user_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("post_id")
);



#
# Dumping data for table 'tbl_post'
#

# No data found.



#
# Table structure for table 'tbl_schedule'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_schedule" (
  "schedule_id" int(10) unsigned NOT NULL auto_increment,
  "hospital_id" int(10) unsigned default NULL,
  "schedule_day" varchar(20) default NULL,
  "doctors_id" int(10) unsigned default NULL,
  "schedule_online" int(10) unsigned default NULL,
  PRIMARY KEY  ("schedule_id")
) AUTO_INCREMENT=29;



#
# Dumping data for table 'tbl_schedule'
#

LOCK TABLES "tbl_schedule" WRITE;
/*!40000 ALTER TABLE "tbl_schedule" DISABLE KEYS;*/
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('18','8','Sunday','8','1');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('19','7','Sunday','5','0');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('20','7','Tuesday','5','0');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('21','7','Sunday','9','1');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('23','9','Tuesday','11','0');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('25','9','Sunday','11','0');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('26','8','Wednesday','8','0');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('27','8','Sunday','8','1');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id", "schedule_online") VALUES
	('28','8','Sunday','8','1');
/*!40000 ALTER TABLE "tbl_schedule" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_scheduleslots'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_scheduleslots" (
  "scheduleslots_id" int(10) unsigned NOT NULL auto_increment,
  "scheduleslots_max" int(10) unsigned default NULL,
  "scheduleslots_count" int(10) unsigned default '0',
  "slots_id" int(10) unsigned default NULL,
  "schedule_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("scheduleslots_id")
) AUTO_INCREMENT=56;



#
# Dumping data for table 'tbl_scheduleslots'
#

LOCK TABLES "tbl_scheduleslots" WRITE;
/*!40000 ALTER TABLE "tbl_scheduleslots" DISABLE KEYS;*/
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('9','1111','1','1','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('10','1111','1','6','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('11','1111','0','8','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('12','1111','1','11','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('19','22','0','2','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('20','22','0','3','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('21','22','0','4','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('22','22','0','5','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('23','22','0','6','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('24','2','0','1','19');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('25','2','0','2','19');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('26','7','0','1','21');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('27','7','0','3','21');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('37','20','0','1','23');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('38','20','0','2','23');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('39','20','0','3','23');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('43','3','0','8','25');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('44','3','0','9','25');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('45','20','0','10','26');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('46','20','5','11','26');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('47','20','0','12','26');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('48','11','0','1','27');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('49','11','0','2','27');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('55','22','0','4','28');
/*!40000 ALTER TABLE "tbl_scheduleslots" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_services'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_services" (
  "services_id" int(10) unsigned NOT NULL auto_increment,
  "services_name" varchar(50) default NULL,
  PRIMARY KEY  ("services_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_services'
#

LOCK TABLES "tbl_services" WRITE;
/*!40000 ALTER TABLE "tbl_services" DISABLE KEYS;*/
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('1','Gynecologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('2','Perinatologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('3','Physician');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('4','Lactation Consultant');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('5','Neonatologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('6','Anesthesiologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('7','Pediatrician');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('8','Endocrinologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('9','Genetic Counselor');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('10','Radiologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('11','Nutritionist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('12','Physical Therapist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('13','Psychiatrist');
/*!40000 ALTER TABLE "tbl_services" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_slots'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_slots" (
  "slots_id" int(10) unsigned NOT NULL auto_increment,
  "slots_fromtime" varchar(50) default NULL,
  "slots_totime" varchar(50) default NULL,
  PRIMARY KEY  ("slots_id")
) AUTO_INCREMENT=25;



#
# Dumping data for table 'tbl_slots'
#

LOCK TABLES "tbl_slots" WRITE;
/*!40000 ALTER TABLE "tbl_slots" DISABLE KEYS;*/
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('1','00:00','01:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('2','01:00','02:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('3','02:00','03:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('4','03:00','04:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('5','04:00','05:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('6','05:00','06:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('7','06:00','07:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('8','07:00','08:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('9','08:00','09:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('10','09:00','10:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('11','10:00','11:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('12','11:00','12:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('13','12:00','13:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('14','13:00','14:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('15','14:00','15:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('16','15:00','16:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('17','16:00','17:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('18','17:00','18:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('19','18:00','19:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('20','19:00','20:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('21','20:00','21:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('22','21:00','22:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('23','22:00','23:00');
REPLACE INTO "tbl_slots" ("slots_id", "slots_fromtime", "slots_totime") VALUES
	('24','23:00','00:00');
/*!40000 ALTER TABLE "tbl_slots" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subcategories'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subcategories" (
  "subcategories_id" int(10) unsigned NOT NULL auto_increment,
  "subcategories_name" varchar(50) default NULL,
  "categories_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("subcategories_id")
);



#
# Dumping data for table 'tbl_subcategories'
#

# No data found.



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


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_contact" bigint(20) unsigned default NULL,
  "user_email" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "user_address" varchar(100) default NULL,
  "user_photo" varchar(50) default NULL,
  "user_lmp" date default NULL,
  "user_dob" date default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('7','Aswathy','789456123','aaswathy@gmail.com','aswathy123','2','aswathy address','UserPhoto_1148.jpeg','2024-03-16','2024-03-07');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('8','Mariya Nixon','9876432210','sundari@gmail.com','mariya','1','Palamattathil(h)
','UserPhoto_1338.jpeg','2024-03-15','2003-01-10');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('9','seetha','1234567890','seetha@gmail.com1','seetha123','2','flat100','UserPhoto_1437.webp','2024-04-01','2020-01-28');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('10','Aswathy','1234567890','aswathyravindran.t02@gmail.com','aswathy1','2','aswathy address','UserPhoto_1109.jpg','2024-04-03','2024-04-10');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('11','Ron','123567890','ronsiby369@gmail.com','ron123','2','Palamattam','UserPhoto_1146.jpg','2024-04-04','2024-04-10');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('12','Elna','123567890','elnathankachan89@gmail.com','elna123','1','kochukudiyil','UserPhoto_1157.jpg','2024-04-04','2024-04-10');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('13','Sharon','123567890','sharonsunny8035@gmail.com','sharon123','2','woww','UserPhoto_1408.jpeg','2024-04-26','2024-04-16');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('14','madhav','1234567890','kmadhav1028@gmail.com','madhav123','2','adadada','UserPhoto_1233.jpg','2024-04-04','2024-04-04');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_password", "place_id", "user_address", "user_photo", "user_lmp", "user_dob") VALUES
	('15','madhav','123467890','madh@gmail.com','nirmala123','2','adadad','UserPhoto_1032.jpg','2024-04-07','2024-04-20');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
