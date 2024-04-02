# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_babyglow
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-04-02 17:07:04
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
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('2','madhav','admin@gmail.com','admin123');
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
  PRIMARY KEY  ("appointments_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_appointments'
#

LOCK TABLES "tbl_appointments" WRITE;
/*!40000 ALTER TABLE "tbl_appointments" DISABLE KEYS;*/
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('4','7','9','8');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('5','7','24','7');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('6','7','24','7');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('7','7','20','7');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('8','7','19','7');
REPLACE INTO "tbl_appointments" ("appointments_id", "user_id", "scheduleslots_id", "hospital_id") VALUES
	('9','7','25','7');
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
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('4','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('5','Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('6','Kottayam');
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
) AUTO_INCREMENT=10;



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
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_emergency'
#

LOCK TABLES "tbl_emergency" WRITE;
/*!40000 ALTER TABLE "tbl_emergency" DISABLE KEYS;*/
REPLACE INTO "tbl_emergency" ("emergency_id", "emergency_name", "emergency_contact", "place_id") VALUES
	('2','Police','100','2');
REPLACE INTO "tbl_emergency" ("emergency_id", "emergency_name", "emergency_contact", "place_id") VALUES
	('3','Ambulance','108','3');
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
);



#
# Dumping data for table 'tbl_food'
#

# No data found.



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
  "hospital_location" varchar(50) default NULL,
  "services_id" int(10) unsigned default NULL,
  "hospital_proof" varchar(50) default NULL,
  "hospital_photo" varchar(50) default NULL,
  PRIMARY KEY  ("hospital_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_hospital'
#

LOCK TABLES "tbl_hospital" WRITE;
/*!40000 ALTER TABLE "tbl_hospital" DISABLE KEYS;*/
REPLACE INTO "tbl_hospital" ("hospital_id", "hospital_name", "place_id", "hospital_logo", "hospital_address", "hospital_email", "hospital_password", "hospital_contact", "hospital_location", "services_id", "hospital_proof", "hospital_photo") VALUES
	('7','smitha','1','HospitalLogo_1287.jpg','smitha address','smitha@gmail.com','smitha123','123456789',NULL,'1','HospitalProof_1560.jpeg','HospitalPhoto_1670.jpg');
REPLACE INTO "tbl_hospital" ("hospital_id", "hospital_name", "place_id", "hospital_logo", "hospital_address", "hospital_email", "hospital_password", "hospital_contact", "hospital_location", "services_id", "hospital_proof", "hospital_photo") VALUES
	('8','Nirmala','2','HospitalLogo_1763.jpg','nirmala address','nirmala@gmail.com','nirmala123','123456789',NULL,NULL,'HospitalProof_2056.jpg','HospitalPhoto_1283.jpeg');
/*!40000 ALTER TABLE "tbl_hospital" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_hospitalservices'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_hospitalservices" (
  "hospitalservices_id" int(10) unsigned NOT NULL auto_increment,
  "hospital_id" int(10) unsigned default NULL,
  "service_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("hospitalservices_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_hospitalservices'
#

LOCK TABLES "tbl_hospitalservices" WRITE;
/*!40000 ALTER TABLE "tbl_hospitalservices" DISABLE KEYS;*/
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "service_id") VALUES
	('1','8','4');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "service_id") VALUES
	('2','8','5');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "service_id") VALUES
	('6','7','4');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "service_id") VALUES
	('9','7','8');
REPLACE INTO "tbl_hospitalservices" ("hospitalservices_id", "hospital_id", "service_id") VALUES
	('11','7','9');
/*!40000 ALTER TABLE "tbl_hospitalservices" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "place_pincode" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	('1','Thodupuzha',NULL,'5');
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	('2','Muvattupuzha',NULL,'4');
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	('3','Kothamangalam',NULL,'4');
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
  PRIMARY KEY  ("schedule_id")
) AUTO_INCREMENT=22;



#
# Dumping data for table 'tbl_schedule'
#

LOCK TABLES "tbl_schedule" WRITE;
/*!40000 ALTER TABLE "tbl_schedule" DISABLE KEYS;*/
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id") VALUES
	('18','8','Sunday','8');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id") VALUES
	('19','7','Sunday','5');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id") VALUES
	('20','7','Tuesday','5');
REPLACE INTO "tbl_schedule" ("schedule_id", "hospital_id", "schedule_day", "doctors_id") VALUES
	('21','7','Sunday','9');
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
) AUTO_INCREMENT=28;



#
# Dumping data for table 'tbl_scheduleslots'
#

LOCK TABLES "tbl_scheduleslots" WRITE;
/*!40000 ALTER TABLE "tbl_scheduleslots" DISABLE KEYS;*/
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('9','1111','1','1','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('10','1111','0','6','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('11','1111','0','8','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('12','1111','0','11','18');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('19','22','1','2','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('20','22','1','3','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('21','22','0','4','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('22','22','0','5','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('23','22','0','6','20');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('24','2','2','1','19');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('25','2','1','2','19');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('26','7','0','1','21');
REPLACE INTO "tbl_scheduleslots" ("scheduleslots_id", "scheduleslots_max", "scheduleslots_count", "slots_id", "schedule_id") VALUES
	('27','7','0','3','21');
/*!40000 ALTER TABLE "tbl_scheduleslots" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_services'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_services" (
  "services_id" int(10) unsigned NOT NULL auto_increment,
  "services_name" varchar(50) default NULL,
  PRIMARY KEY  ("services_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_services'
#

LOCK TABLES "tbl_services" WRITE;
/*!40000 ALTER TABLE "tbl_services" DISABLE KEYS;*/
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('4','Gynecologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('5','Neurologist');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('7','Counselling');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('8','Diagnostic');
REPLACE INTO "tbl_services" ("services_id", "services_name") VALUES
	('9','Psychiatry');
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
);



#
# Dumping data for table 'tbl_tips'
#

# No data found.



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
) AUTO_INCREMENT=9;



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
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
