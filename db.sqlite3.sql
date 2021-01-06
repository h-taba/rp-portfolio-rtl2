BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "projects_project" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"technology"	varchar(20) NOT NULL,
	"image"	varchar(200)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "blog_comment" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"author"	varchar(60) NOT NULL,
	"body"	text NOT NULL,
	"created_on"	datetime NOT NULL,
	"post_id"	integer NOT NULL,
	FOREIGN KEY("post_id") REFERENCES "blog_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "blog_post_categories" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"post_id"	integer NOT NULL,
	"category_id"	integer NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "blog_category"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("post_id") REFERENCES "blog_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "blog_post" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(255) NOT NULL,
	"body"	text NOT NULL,
	"created_on"	datetime NOT NULL,
	"last_modified"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "blog_category" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "projects_project" ("id","title","description","technology","image") VALUES (1,'My First Project','A web development project.','Django','projects/images/project1.png');
INSERT INTO "projects_project" ("id","title","description","technology","image") VALUES (2,'My Second Project','Another web development project.','Flask','projects/images/project2.png');
INSERT INTO "projects_project" ("id","title","description","technology","image") VALUES (3,'My Third Project','A final development project.','Django','projects/images/project3.png');
INSERT INTO "projects_project" ("id","title","description","technology","image") VALUES (4,'Django inchained','test  record ','Django','projects/images/images.jpeg');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('7pax3t0nve9j4n6wlmb9ircg1xnwrz5e','.eJxVjEEOwiAQRe_C2hCgA4JL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERWpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr81Z4DzUDgY6z0ZoqIheWdBWRccQIHBIxMDl6A4DIWy0hTQoHZapyzeH-IOOA0:1kMazN:jsk68mjc2MigEGyy_lZENto83XW7DdosiO9LJhDd1iM','2020-10-11 18:01:33.681234');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('v7nkuniphcik2qj79048jx29xfvc93pe','.eJxVjEEOwiAQRe_C2hCgA4JL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERWpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr81Z4DzUDgY6z0ZoqIheWdBWRccQIHBIxMDl6A4DIWy0hTQoHZapyzeH-IOOA0:1kMcdD:7Tx-z1Ash3omqoOVGEfRUDEGbd7QOJ5tHb2mwDPYqiA','2020-10-11 19:46:47.182257');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('sgzsvx1d8irxn20h1gch2zs5y4t5c6m1','.eJxVjDsOwjAQRO_iGln-RdlQ0nMGa727JgFkS3FSRdydREoBzRTz3symIq7LGNcmc5xYXZVTl98uIb2kHICfWB5VUy3LPCV9KPqkTd8ry_t2un8HI7ZxX5PHkE03UBaPqQs9DwYEEhqbxQEBcw9o2HobqO8A9pBEgZ0NeRCnPl_-pThp:1ktR3B:Wvz3s0gvVaFuUwzQKg2IWzhTvGC2czxwqFaVa-WeyzM','2021-01-10 08:05:13.673619');
INSERT INTO "blog_comment" ("id","author","body","created_on","post_id") VALUES (3,'hassan','good blog','2020-09-27 20:15:50.687502',4);
INSERT INTO "blog_comment" ("id","author","body","created_on","post_id") VALUES (4,'dgfdgfd','dfg','2020-10-05 23:48:28.194360',4);
INSERT INTO "blog_post_categories" ("id","post_id","category_id") VALUES (4,4,4);
INSERT INTO "blog_post_categories" ("id","post_id","category_id") VALUES (5,5,4);
INSERT INTO "blog_post" ("id","title","body","created_on","last_modified") VALUES (4,'Security Tools and Concepts That Are Easy to Use','In order to simplify the very complex world of security, we have broken it down into two sections. In this first section, we will discuss security tools in Ubuntu that you can configure and (once configured) require little interaction. We will also discuss general security concepts that are easy to implement into your daily computer use. There is a lot of existing security information already in existence in the Ubuntu Wikis and stickies in the Ubuntu Forums. There are some great resources there, in fact one of the best guides is linked here. But a lot of that material will seem complex to the new Ubuntu user - so the goal of this guide was to take the existing material and simplify it, making it possible to bridge the gap.','2020-09-27 20:13:43.899442','2020-09-27 20:13:43.899537');
INSERT INTO "blog_post" ("id","title","body","created_on","last_modified") VALUES (5,'Linux Vulnerabilities','The majority of new users are coming from Windows environments, where security focuses mostly on anti-virus software. To understand security on Ubuntu, you must shift your thinking from this point of view. In the following bullets, we''re going to analyze what threats actually effect you as a Ubuntu user.

    Myth: If I install an anti-virus program I''ll be fine.

    Reality: At the time of writing, there are no known viruses on the big bad web designed to target Linux. A few targeting Windows can execute in a manner that could allow compromise of a Linux system via an interpreter layer like Wine. Very few people recommend existing anti-virus software for Linux machines, in part because there are few decent free anti-malware solutions available. Enterprise class solutions are good, but the consumer-grade products aren''t on par with their Windows counterparts enough to warrant their use. Moreover, if you focus entirely on viruses then you are ignoring the vast majority of real threats to your Ubuntu machine.

    Myth: Security through obscurity keeps me safe.

    Reality: It''s a favoured argument from Linux supporters, but Linux/Ubuntu is not that obscure to “crackers”. They may be obscure to you or your friends, however, there are many who know how to exploit Linux vulnerabilities just as easy as Windows, Mac OSX, Solaris, AIX, or any other operating system''s vulnerabilities. The best defence is knowledge and preparation. Relying on an “obscure” operating system to hide behind is NOT a good strategy.

    Myth: I can browse however I want to because malware on the web is mostly designed for Windows.

    Reality: While the majority of malware does target Windows, this statement overlooks the fact that an entire spectrum of web based attack vectors exist that work on any operating system. Cross Site Scripting, Cross Site Request Forgery, Click-Jacking, Session Riding, and many other methods can be used to exploit weaknesses in a relationship of trust between you and a website, or a website and you, regardless of your operating system. For things like this we have browser add-ons which will be discussed in the browser security section.

    Myth: I don''t need to use fancy browser add-ons when using public access wifi because I use Ubuntu.

    Reality: An absurd statement. Most attacks carried out on public wifi include several varieties of man in the middle attacks. If you want to utilize public wifi, it is highly discouraged to do anything more than trivial in nature with it unless you are an advanced user and you know how to set up a virtual private network (VPN), a VPN via Secure Shell (SSH), or use Secure Sockets Layer (SSL) in conjunction with SSLstrip.

    Myth: I don''t need a firewall because Ubuntu has no open ports by default.

    Reality: This is a matter of risk tolerance. Added protection, particularly that which takes only a few minutes to set up, is always worth it. Firewalls are discussed in more depth later in this document.','2020-09-27 20:14:37.989682','2020-09-27 20:14:37.989775');
INSERT INTO "blog_category" ("id","name") VALUES (4,'Security');
INSERT INTO "blog_category" ("id","name") VALUES (5,'Ububtu');
INSERT INTO "blog_category" ("id","name") VALUES (6,'Windows');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$216000$vG46w063nZTY$dq3YFO9CUIoFhDakbdl3hJ1VkhHD5P//wszUBVv+9sY=','2020-09-27 19:46:47.116744',1,'admin1','','',1,1,'2020-09-27 18:00:02.674898','');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (2,'pbkdf2_sha256$216000$F7nKpMmDRpCh$lJvGo8aQ/ISo6RrEHpgfYFvdyIxe8hYTayo9JxUb1J0=','2020-12-27 08:05:13.670474',1,'admin','','',1,1,'2020-12-27 07:30:27.050035','');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (25,7,'add_project','Can add project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (26,7,'change_project','Can change project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (27,7,'delete_project','Can delete project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (28,7,'view_project','Can view project');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (29,8,'add_category','Can add category');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (30,8,'change_category','Can change category');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (31,8,'delete_category','Can delete category');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (32,8,'view_category','Can view category');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (33,9,'add_comment','Can add comment');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (34,9,'change_comment','Can change comment');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (35,9,'delete_comment','Can delete comment');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (36,9,'view_comment','Can view comment');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (37,10,'add_post','Can add post');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (38,10,'change_post','Can change post');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (39,10,'delete_post','Can delete post');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (40,10,'view_post','Can view post');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (2,'auth','permission');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (3,'auth','group');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (4,'auth','user');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (6,'sessions','session');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (7,'projects','project');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (8,'blog','category');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (9,'blog','comment');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (10,'blog','post');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2020-09-27 19:47:21.749057','1','Category object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (2,'2020-09-27 19:47:26.230725','2','Category object (2)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (3,'2020-09-27 19:47:30.699392','3','Category object (3)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (4,'2020-09-27 19:48:21.989477','1','Post object (1)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (5,'2020-09-27 19:48:57.381044','2','Post object (2)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (6,'2020-09-27 19:49:35.650319','3','Post object (3)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (7,'2020-09-27 20:03:06.747190','3','Category object (3)','',8,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (8,'2020-09-27 20:03:06.840458','2','Category object (2)','',8,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (9,'2020-09-27 20:03:06.885118','1','Category object (1)','',8,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (10,'2020-09-27 20:03:58.013815','3','Post object (3)','',10,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (11,'2020-09-27 20:04:05.911113','2','Post object (2)','',10,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (12,'2020-09-27 20:04:13.420716','1','Post object (1)','',10,1,3);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (13,'2020-09-27 20:09:17.278723','4','Category object (4)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (14,'2020-09-27 20:09:31.243380','5','Category object (5)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (15,'2020-09-27 20:09:42.521198','6','Category object (6)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (16,'2020-09-27 20:13:43.907434','4','Post object (4)','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (17,'2020-09-27 20:14:37.996527','5','Post object (5)','[{"added": {}}]',10,1,1);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2020-09-27 17:43:19.482109');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (2,'auth','0001_initial','2020-09-27 17:43:19.600542');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (3,'admin','0001_initial','2020-09-27 17:43:19.711567');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (4,'admin','0002_logentry_remove_auto_add','2020-09-27 17:43:19.844106');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-09-27 17:43:19.990667');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (6,'contenttypes','0002_remove_content_type_name','2020-09-27 17:43:20.083112');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (7,'auth','0002_alter_permission_name_max_length','2020-09-27 17:43:20.169790');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (8,'auth','0003_alter_user_email_max_length','2020-09-27 17:43:20.257223');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (9,'auth','0004_alter_user_username_opts','2020-09-27 17:43:20.355290');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (10,'auth','0005_alter_user_last_login_null','2020-09-27 17:43:20.439869');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (11,'auth','0006_require_contenttypes_0002','2020-09-27 17:43:20.495893');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-09-27 17:43:20.595975');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (13,'auth','0008_alter_user_username_max_length','2020-09-27 17:43:20.686133');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-09-27 17:43:20.766009');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (15,'auth','0010_alter_group_name_max_length','2020-09-27 17:43:20.859756');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (16,'auth','0011_update_proxy_permissions','2020-09-27 17:43:20.962486');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (17,'auth','0012_alter_user_first_name_max_length','2020-09-27 17:43:21.056598');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (18,'blog','0001_initial','2020-09-27 17:43:21.189557');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (19,'projects','0001_initial','2020-09-27 17:43:21.289549');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (20,'sessions','0001_initial','2020-09-27 17:43:21.420058');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (21,'projects','0002_remove_project_image','2020-12-27 07:34:42.961876');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (22,'projects','0003_project_image','2020-12-27 07:59:26.870412');
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "blog_comment_post_id_580e96ef" ON "blog_comment" (
	"post_id"
);
CREATE INDEX IF NOT EXISTS "blog_post_categories_category_id_2211dae5" ON "blog_post_categories" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "blog_post_categories_post_id_c34e7be1" ON "blog_post_categories" (
	"post_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "blog_post_categories_post_id_category_id_ed4f1727_uniq" ON "blog_post_categories" (
	"post_id",
	"category_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
