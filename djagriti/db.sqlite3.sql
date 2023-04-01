BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "crm_price" (
	"id"	integer NOT NULL,
	"price_name"	varchar(25) NOT NULL,
	"price_value"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cms_cmsslider" (
	"id"	integer NOT NULL,
	"cms_img"	varchar(100) NOT NULL,
	"cms_title"	varchar(200) NOT NULL,
	"cms_text"	varchar(200) NOT NULL,
	"cms_css"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "telebot_telesettings" (
	"id"	integer NOT NULL,
	"tg_token"	varchar(200) NOT NULL,
	"tg_chat"	varchar(200) NOT NULL,
	"tg_message"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "crm_naprcrm" (
	"id"	integer NOT NULL,
	"napr_name"	varchar(100) NOT NULL,
	"description"	text,
	"image"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "crm_order" (
	"id"	integer NOT NULL,
	"order_dt"	datetime NOT NULL,
	"order_phone"	varchar(18) NOT NULL,
	"date"	datetime NOT NULL,
	"order_napr_id"	bigint,
	"order_price_id"	bigint,
	"order_name"	varchar(30) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("order_napr_id") REFERENCES "crm_naprcrm"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("order_price_id") REFERENCES "crm_price"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "cms_cmsteachers" (
	"id"	integer NOT NULL,
	"photo"	varchar(100) NOT NULL,
	"name"	varchar(100) NOT NULL,
	"slug"	varchar(100) NOT NULL UNIQUE,
	"description"	text NOT NULL,
	"napr_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("napr_id") REFERENCES "crm_naprcrm"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-07-22 06:45:02.881996');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-07-22 06:45:02.904955');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-07-22 06:45:02.935314');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-07-22 06:45:02.950272');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-07-22 06:45:02.962272');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-07-22 06:45:02.981909');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-07-22 06:45:02.995017');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-07-22 06:45:03.009128');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-07-22 06:45:03.015387');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-07-22 06:45:03.030628');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-07-22 06:45:03.036741');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-07-22 06:45:03.043018');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-07-22 06:45:03.058261');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-07-22 06:45:03.070527');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-07-22 06:45:03.082857');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-07-22 06:45:03.094490');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-07-22 06:45:03.106457');
INSERT INTO "django_migrations" VALUES (18,'crm','0001_initial','2022-07-22 06:45:03.120807');
INSERT INTO "django_migrations" VALUES (19,'cms','0001_initial','2022-07-22 06:45:03.133917');
INSERT INTO "django_migrations" VALUES (20,'sessions','0001_initial','2022-07-22 06:45:03.146124');
INSERT INTO "django_migrations" VALUES (21,'crm','0002_alter_order_order_price','2022-07-22 09:01:51.557068');
INSERT INTO "django_migrations" VALUES (22,'telebot','0001_initial','2022-07-22 09:01:51.567402');
INSERT INTO "django_migrations" VALUES (23,'crm','0003_naprcrm_description_naprcrm_image','2022-11-26 11:01:53.470008');
INSERT INTO "django_migrations" VALUES (24,'crm','0004_alter_order_order_name','2022-11-27 10:04:43.979021');
INSERT INTO "django_migrations" VALUES (25,'cms','0002_alter_cmsteachers_id','2023-02-09 06:26:51.898316');
INSERT INTO "django_migrations" VALUES (26,'cms','0003_alter_cmsteachers_id','2023-02-09 06:36:59.948593');
INSERT INTO "django_admin_log" VALUES (35,'2022-11-26 11:13:37.866385','1','Хатха-йога','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_admin_log" VALUES (36,'2022-11-26 11:14:05.085276','2','Айенгара-йога','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_admin_log" VALUES (37,'2022-11-26 11:14:32.144264','3','Йога в гамаках','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_admin_log" VALUES (38,'2022-11-26 11:15:03.680172','4','Нидра-йога','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_admin_log" VALUES (39,'2022-11-26 11:15:27.350258','5','Дыхание и медитации','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_admin_log" VALUES (40,'2022-11-26 11:16:00.517241','6','Детская йога','[{"changed": {"fields": ["\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435", "Image"]}}]',7,8,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'crm','naprcrm');
INSERT INTO "django_content_type" VALUES (8,'crm','price');
INSERT INTO "django_content_type" VALUES (9,'crm','order');
INSERT INTO "django_content_type" VALUES (10,'cms','cmsslider');
INSERT INTO "django_content_type" VALUES (11,'cms','cmsteachers');
INSERT INTO "django_content_type" VALUES (12,'telebot','telesettings');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_naprcrm','Can add Направление');
INSERT INTO "auth_permission" VALUES (26,7,'change_naprcrm','Can change Направление');
INSERT INTO "auth_permission" VALUES (27,7,'delete_naprcrm','Can delete Направление');
INSERT INTO "auth_permission" VALUES (28,7,'view_naprcrm','Can view Направление');
INSERT INTO "auth_permission" VALUES (29,8,'add_price','Can add Цена');
INSERT INTO "auth_permission" VALUES (30,8,'change_price','Can change Цена');
INSERT INTO "auth_permission" VALUES (31,8,'delete_price','Can delete Цена');
INSERT INTO "auth_permission" VALUES (32,8,'view_price','Can view Цена');
INSERT INTO "auth_permission" VALUES (33,9,'add_order','Can add Заказ');
INSERT INTO "auth_permission" VALUES (34,9,'change_order','Can change Заказ');
INSERT INTO "auth_permission" VALUES (35,9,'delete_order','Can delete Заказ');
INSERT INTO "auth_permission" VALUES (36,9,'view_order','Can view Заказ');
INSERT INTO "auth_permission" VALUES (37,10,'add_cmsslider','Can add Слайд');
INSERT INTO "auth_permission" VALUES (38,10,'change_cmsslider','Can change Слайд');
INSERT INTO "auth_permission" VALUES (39,10,'delete_cmsslider','Can delete Слайд');
INSERT INTO "auth_permission" VALUES (40,10,'view_cmsslider','Can view Слайд');
INSERT INTO "auth_permission" VALUES (41,11,'add_cmsteachers','Can add Тренер');
INSERT INTO "auth_permission" VALUES (42,11,'change_cmsteachers','Can change Тренер');
INSERT INTO "auth_permission" VALUES (43,11,'delete_cmsteachers','Can delete Тренер');
INSERT INTO "auth_permission" VALUES (44,11,'view_cmsteachers','Can view Тренер');
INSERT INTO "auth_permission" VALUES (45,12,'add_telesettings','Can add Настройки');
INSERT INTO "auth_permission" VALUES (46,12,'change_telesettings','Can change Настройки');
INSERT INTO "auth_permission" VALUES (47,12,'delete_telesettings','Can delete Настройки');
INSERT INTO "auth_permission" VALUES (48,12,'view_telesettings','Can view Настройки');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$320000$XiAy70I4qMUZGfxcWhde9n$XXEiACqximSjqqRgETsHsCnHTmlKEL5oKu/JGA0546c=','2022-11-20 13:41:22.692846',0,'admin','','',0,1,'2022-11-13 08:54:25.030254','');
INSERT INTO "auth_user" VALUES (8,'pbkdf2_sha256$320000$bBCcknQW5mVLeYxTFwc43G$8jafN+lp0fKJWsnKO2Kw76mFy7bk8mLn4keEkFVXbZQ=','2023-02-03 14:00:30.114385',1,'root','','dim.gusakov2016@yandex.ru',1,1,'2022-11-13 15:27:43.565175','');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$320000$LmVN1fVZbDkL5W6egwre3e$kuSBgd5GpFiyH+CyxO/pf4Nurec3nkRw+FylSVWBYIg=','2022-11-13 15:30:47.227426',0,'admin2','','',0,1,'2022-11-13 15:30:36.569730','');
INSERT INTO "crm_price" VALUES (1,'Разовое занятие',900);
INSERT INTO "crm_price" VALUES (2,'Абонемент на месяц',4500);
INSERT INTO "crm_price" VALUES (3,'Абонемент на год',24000);
INSERT INTO "cms_cmsslider" VALUES (1,'sliderimg/imgonline-com-ua-Resize-ndkMSdJKkI33Yux_D2vnh61.png','Первый','Первый','active');
INSERT INTO "cms_cmsslider" VALUES (2,'sliderimg/carousel_1_H0WoINM.jpg','Второй','Второй','-');
INSERT INTO "cms_cmsslider" VALUES (3,'sliderimg/carousel_2_rcQUxzT.jpg','Третий','Третий','-');
INSERT INTO "cms_cmsslider" VALUES (4,'sliderimg/carousel_3_LPfX8sS.jpg','Третий','Третий','-');
INSERT INTO "django_session" VALUES ('8mi1cdi5zs20x7qkk42b4bjfoo74f0wx','.eJxVjDsOwjAQRO_iGlmbxfGHkp4zWOtdBweQI8VJhbg7iZQCutG8N_NWkdalxLXlOY6iLqpTp98uET9z3YE8qN4nzVNd5jHpXdEHbfo2SX5dD_fvoFAr2xo8GHLZO4fWMGQUb4AxBfQibC1AMB0lwpScDLhlCOKkPzPwgNirzxfKsDeJ:1oEmRo:4h-ZKT10ro0IJagXP6hkl5HV_1W6uJ2Q9tgj14UGT3w','2022-08-05 06:47:40.184935');
INSERT INTO "django_session" VALUES ('yzub79kqrdl3xcoqiajkqvsv6zewuech','.eJxVjDsOwjAQRO_iGlmbxfGHkp4zWOtdBweQI8VJhbg7iZQCutG8N_NWkdalxLXlOY6iLqpTp98uET9z3YE8qN4nzVNd5jHpXdEHbfo2SX5dD_fvoFAr2xo8GHLZO4fWMGQUb4AxBfQibC1AMB0lwpScDLhlCOKkPzPwgNirzxfKsDeJ:1oVOzA:f4DNBkMiQHP1jP8SyVIrRzBRoazKftcQhyHSY9U3HEU','2022-09-20 03:10:48.915849');
INSERT INTO "django_session" VALUES ('j02ezr6t991hd1ghgw8ybb8pbilv84x7','.eJxVjDsOwjAQRO_iGlmbxfGHkp4zWOtdBweQI8VJhbg7iZQCutG8N_NWkdalxLXlOY6iLqpTp98uET9z3YE8qN4nzVNd5jHpXdEHbfo2SX5dD_fvoFAr2xo8GHLZO4fWMGQUb4AxBfQibC1AMB0lwpScDLhlCOKkPzPwgNirzxfKsDeJ:1oew9x:zibkYi6E8yno_eAMpZxKw89zNd9fZC1aMLrpU43-RhM','2022-10-16 10:25:21.135581');
INSERT INTO "django_session" VALUES ('rsu9lurwrh9i05pkl1u7xzj37uw46eym','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1ouEwv:2bnCwHTUBKJkfgG2sIMactTuRIt_nYfgBKCPoHB8xS0','2022-11-27 15:31:09.093037');
INSERT INTO "django_session" VALUES ('8yr9hs1qkxcs0geymygedaps2zpixf6z','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1ow2bA:guY6UetwaUUVw2Zs50_QcvtAjIdMyuzPZKeZqlHpDI4','2022-12-02 14:44:08.786984');
INSERT INTO "django_session" VALUES ('7jnezrbkjrz19iqth00fc9ozfjz0p45a','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1owMIY:gIDd1FcB3DtrkSRNFJZB-WBGZZ8OJqV9IqNs7YNrCOU','2022-12-03 11:46:14.787331');
INSERT INTO "django_session" VALUES ('ry7enh4e3hr4g0ljdtvlhq9rf1rd31q8','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1owkZn:iqtdYTf46W1dBX48__fSfEfQrL3h0-8O4AFI5ZraPxc','2022-12-04 13:41:39.223640');
INSERT INTO "django_session" VALUES ('jkwdnz3n5lx15h6wxkb6evt3dzm3zivq','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1oxqpV:NfPcsa-EBV4c50-UUeYXb23Zsd6bSOuxnjAlahInUXQ','2022-12-07 14:34:25.616587');
INSERT INTO "django_session" VALUES ('49v4z3ot78o80q45g9mqqd5jyhu8qgzq','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1oyt72:5a5gXTLTqzDE2FCegjx9wAwfSd84VVbIUeCMEr0EC40','2022-12-10 11:12:48.799948');
INSERT INTO "django_session" VALUES ('phawp2ul6ad8syepr16dmgne02eoppvw','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1ozAzi:3aboahOunCmYGjppt9bpDbgsv7iH3hYkB_1xRRGNryc','2022-12-11 06:18:26.960463');
INSERT INTO "django_session" VALUES ('ax5iast5ra1wcho2nu18ki1w3f4f38xm','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1ozIVY:ceWsMu-VJSY8k1sJML831o6UtIiPy2e8TYAgSOnHcP4','2022-12-11 14:19:48.567180');
INSERT INTO "django_session" VALUES ('2qnftwzb08kziezxp20hhytet99tpzr9','.eJxVjEsOwjAMBe-SNYripCk2S_Y9Q-XYLi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6i0N3-t0Ky8PGHeidx9vkZRrXeSh-V_xBF99Mas_r4f4d9Lz03zohFUYAigCQEnKFIudMhqnKOVDkOlBgE4mmoaOasiiACnaxtqLu_QG4Sjd9:1pNwcA:ziTQwWhn0QsmOmIqGGZuXvL9mHFKva4RhtBP1mOjFv8','2023-02-17 14:00:30.120442');
INSERT INTO "telebot_telesettings" VALUES (1,'5418764465:AAEwo07d-UaQdR2UFuNCoyXrrrb3-EUwxEU','-604669800','Заявка с сайта:
Имя: { name }
Телефон: { phone }');
INSERT INTO "crm_naprcrm" VALUES (1,'Хатха-йога','Основа современной йоги. Служит начальной ступенью для познания своих возможностей.','napr/01-_N7J6idh.jpg');
INSERT INTO "crm_naprcrm" VALUES (2,'Айенгара-йога','Стиль хатха-йоги, основанный на физическом выравнивании тела в позах.','napr/02-.jpg');
INSERT INTO "crm_naprcrm" VALUES (3,'Йога в гамаках','Практика, которая даёт силу мышцам и ощущение расслабленности всего тела.','napr/03---.jpg');
INSERT INTO "crm_naprcrm" VALUES (4,'Нидра-йога','Йога нидра - это техника осознанного расслабления, иначе именуемая как йога сна.','napr/04-.jpg');
INSERT INTO "crm_naprcrm" VALUES (5,'Дыхание и медитации','Работа со своим внутренним «Я». Упор на сознание человека.','napr/05---.jpg');
INSERT INTO "crm_naprcrm" VALUES (6,'Детская йога','Комплекс упражнений из хатха-йоги с тематическими и динамичными играми.','napr/_.jpg');
INSERT INTO "crm_order" VALUES (13,'2022-11-08 08:28:45.196410','+7 (914) 002-92-69','2022-08-19 21:00:00',1,1,'Олежка');
INSERT INTO "crm_order" VALUES (14,'2022-11-06 14:39:56.549123','+7 (983) 244-14-81','2022-07-29 18:00:00',3,2,'Дмитрий');
INSERT INTO "crm_order" VALUES (15,'2022-09-06 03:11:52.285366','+7 (983) 244-14-81','2022-09-14 14:00:00',2,2,'Дмитрий');
INSERT INTO "crm_order" VALUES (16,'2022-10-14 13:28:31.135211','+7 (914) 002-92-69','2022-10-11 20:00:00',2,1,'Димасик');
INSERT INTO "crm_order" VALUES (20,'2022-11-06 08:08:16.493371','+7 (914) 002-92-69','2022-11-02 16:08:00',4,1,'Дима');
INSERT INTO "crm_order" VALUES (22,'2022-11-06 08:20:16.139952','+7 (914) 002-92-59','2022-11-09 16:20:00',3,2,'Дмитри');
INSERT INTO "crm_order" VALUES (23,'2022-11-06 08:25:54.605976','+7 (914) 002-92-69','2022-11-10 16:25:00',2,3,'Дмитрий');
INSERT INTO "crm_order" VALUES (27,'2022-11-06 08:43:16.191268','+7 (914) 000-20-20','2022-11-02 16:43:00',2,2,'Джагрити');
INSERT INTO "crm_order" VALUES (28,'2022-11-06 08:46:12.388691','+7 (914) 002-92-69','2022-11-02 16:46:00',2,3,'Дмитрий');
INSERT INTO "crm_order" VALUES (29,'2022-11-06 08:48:36.223422','+7 (914) 002-92-69','2022-11-10 16:48:00',4,1,'Марина');
INSERT INTO "crm_order" VALUES (31,'2022-11-08 08:39:13.575725','+7 (914) 002-92-69','2022-10-27 11:10:00',3,1,'Оля');
INSERT INTO "crm_order" VALUES (32,'2022-11-08 09:13:30.966801','+7 (964) 222-41-60','2022-11-09 19:00:00',6,1,'Сашечка');
INSERT INTO "crm_order" VALUES (33,'2022-11-20 08:33:04.019969','+7 (983) 244-14-81','2022-11-22 13:00:00',2,1,'Дмитрий');
INSERT INTO "crm_order" VALUES (34,'2022-11-20 08:37:28.046163','+7 (983) 244-14-81','2022-11-23 05:00:00',1,2,'Мария');
INSERT INTO "crm_order" VALUES (35,'2022-11-20 13:31:34.691155','+7 (983) 244-14-81','2022-11-22 07:00:00',4,1,'Ирина');
INSERT INTO "crm_order" VALUES (36,'2022-11-20 13:34:08.564119','+7 (983) 244-14-81','2022-11-23 13:34:00',1,1,'Ирина');
INSERT INTO "crm_order" VALUES (37,'2022-11-20 13:35:03.239149','+7 (983) 244-14-81','2022-11-25 05:00:00',4,2,'Ирина');
INSERT INTO "crm_order" VALUES (38,'2022-11-27 14:19:16.905295','+7 (914) 002-92-69','2022-11-30 09:00:00',5,3,'Арина');
INSERT INTO "crm_order" VALUES (39,'2023-02-03 14:02:12.799119','+7 (914) 002-92-69','2023-02-09 14:02:00',1,2,'Любовь');
INSERT INTO "cms_cmsteachers" VALUES (1,'teachers_photo/teacher_1_g4pWBgl.jpg','Дарья Восток','darya-vostok','Сертифицированный преподаватель йоги по методу Б.К.С. Айенгара (Yoga Practica), детской йоги (Федерация йоги, семинары Виктории Занкиной, Ваджра йога). Занимаюсь йогой с 2016 года, преподаю с 2020 года. Постоянно углубляю свои знания в области йоги. Считаю, что это путь, который имеет начало и не имеет конца. Посещаю семинары, мастер классы и курсы опытных отечественных и зарубежных преподавателей. Увлекаюсь ароматерапией. Верю, что йога и аромамагия эфирных масел поддерживают друг друга на пути к гармонии тела, ума и эмоций.',6);
INSERT INTO "cms_cmsteachers" VALUES (2,'teachers_photo/teacher_2_j79lIBz.jpg','Ольга Максимова','olga-maksimova','Я - дипломированный йогатерапевт, инструктор хатха-йоги и йога-нидры. В практику йоги пришла в 2008 году, вдохновляясь идеями физического и духовного саморазвития (из-за высоких интеллектуальных нагрузок эти задачи были особенно актуальны - тогда я работала 5 дней в офисе и одновременно училась в институте).
Придя на занятие по хатха-йоге практически тут же втянулась: заметно улучшилась осанка, развилась гибкость как тела так и ума, после каждого занятия улучшалось настроение.
5 лет я практиковала для себя, знакомясь с различными школами и направлениями в йоге, после чего мне захотелось делиться своими знаниями с окружающими. В 2013 году я прошла первый тренерский курс, после чего начался мой путь преподавателя йоги.
Осознавая свою ответственность перед учениками, я постоянно развиваю свои навыки ведения занятий, расширяю круг знаний в области человеческого тела, ума, сознания и подсознания. На этом мой путь не прекращается, я постоянно посещаю семинары и мастер-классы ведущих учителей йоги России и Зарубежья. Регулярно прохожу випассаны и йога-ретриты для поддержания внутреннего ресурса на проведение практик.',4);
INSERT INTO "cms_cmsteachers" VALUES (3,'teachers_photo/teacher_3_SjODhdu.jpg','Рената Швец','renata-shvec','Я являюсь сертифицированным инструктором хатха-йоги и детской йоги. Свое знакомство с йогой начала в 2013 г., когда стала заниматься хатха-йогой в группе. Тогда многое не получалось, сложно было даже несколько секунд устоять в какой-либо асане. Во многом благодаря своему учителю, ее любви к людям и своему делу, моя практика становилась все увереннее. Со временем я ощутила на себе, что хатха-йога - мягкий инструмент правки. Постоянство практики приносит свои плоды, тело становится гибче, здоровее, крепче, сознание расширяется.
Постепенно изменяется чувствование себя и окружающего мира. Несомненно, с йогой жизнь меняется к лучшему!
Обучающие курсы для для учителей йоги я стала проходить ежегодно с 2017 г. (это школа YogaProf в Москве, Aum Yoga school в Индии, Петербургская школа йоги, курсы по детской йоге Виктории Занкиной).',1);
INSERT INTO "cms_cmsteachers" VALUES (4,'teachers_photo/teacher_4_N05cmaR.jpg','Дмитриева Елена','dmitrieva-elena','Я начала заниматься йогой больше 10 лет назад, когда мы с подругой после групповой тренировки или тренажерного зала врывались на класс йоги ближе к окончанию практики и почти засыпали в шавасане.
С того времени так или иначе ЙОГА присутствовала в моей жизни - асаны, дыхательные практики, медитации помогали расслабиться, обрести опору, сконцентрироваться на своих целях, когда-то даже удовлетворить своё эго (многие скажут, что эго это не про йогу, но я всего лишь человек).',3);
INSERT INTO "cms_cmsteachers" VALUES (5,'teachers_photo/teacher_5_Twmm9jc.jpg','Владимир Акулов','vladimir-akulov','Для Владимира Акулова медитация – это простой и действенный способ сделать жизнь чуть более осознанной, радостной, гармоничной. Владимир помогает другим тоже прикоснуться к этому, на себе почувствовать эффект медитации и вдохновляет на регулярную практику',5);
INSERT INTO "cms_cmsteachers" VALUES (6,'teachers_photo/teacher_6_VsFxgOE.jpg','Анастасия Поддубная','anastasiya-poddubnaya','Моя личная практика началась с 2010 года. Преподавание с 2014. Люди приходят к йоге по разным причинам, лично мне йога помогла обрести себя.
Для меня йога это танец души и тела. Момент настоящего, в котором сливаются воедино движение, дыхание и энергия. Благодаря практике у меня появилась неповторимая легкость и бодрость, йога сделала меня сильной: выносливой физически и духовно. Йога - это мой путь, и я очень благодарна всем преподавателям, которые меня вдохновляли и делились своим опытом.
Углубляясь в практику, мне самой захотелось поделиться тем, что дает мне йога! На мой взгляд, любая осознанная йога-практика дает массу бонусов.',2);
INSERT INTO "cms_cmsteachers" VALUES (7,'teachers_photo/test.jpg','Дмитрий','dmitry','ddddd',1);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "crm_order_order_napr_id_11910dc1" ON "crm_order" (
	"order_napr_id"
);
CREATE INDEX IF NOT EXISTS "crm_order_order_price_id_03fcd05f" ON "crm_order" (
	"order_price_id"
);
CREATE INDEX IF NOT EXISTS "cms_cmsteachers_napr_id_da4a41df" ON "cms_cmsteachers" (
	"napr_id"
);
COMMIT;
