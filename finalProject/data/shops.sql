CREATE TABLE "shops" (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  address varchar(255) default NULL,
  opening_hors varchar(255)
);

INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Auctor Velit Eget Consulting','P.O. Box 258, 7316 Egestas. Avenue','2022-02-21 09:42:27'),
  ('Eu Lacus Company','P.O. Box 731, 6328 Donec St.','2023-01-05 12:35:06'),
  ('Ut Dolor LLP','290-2063 Elementum Ave','2023-09-17 04:43:25'),
  ('Nunc LLC','P.O. Box 282, 4936 Curabitur Road','2023-01-17 17:14:36'),
  ('Donec Nibh Limited','668-2509 Integer St.','2022-11-06 12:01:34'),
  ('Mauris Suspendisse LLP','P.O. Box 903, 8770 Lacus. Rd.','2023-01-07 16:44:07'),
  ('Tellus LLC','511-721 Aliquam Rd.','2022-04-29 13:21:32'),
  ('Lobortis Quis Corp.','649-4695 Non Avenue','2022-02-25 11:32:47'),
  ('Conubia Nostra Per Associates','Ap #527-6307 Lorem St.','2023-10-25 12:18:04'),
  ('Sociis Natoque LLP','P.O. Box 276, 9011 Tortor, Ave','2023-08-30 03:00:15');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Dictum Eu Placerat Ltd','P.O. Box 167, 4608 Tincidunt, Av.','2022-05-13 10:33:39'),
  ('Non Enim Institute','Ap #439-809 Ut Av.','2022-12-31 16:53:20'),
  ('Sociis Natoque LLC','330-2388 Eu, Rd.','2022-02-14 05:34:45'),
  ('Velit Justo Institute','Ap #207-7163 Pellentesque St.','2023-06-29 03:43:37'),
  ('Dis Parturient Montes Industries','P.O. Box 770, 582 Augue Rd.','2023-01-07 07:33:23'),
  ('Nunc Mauris LLC','P.O. Box 642, 2527 Mauris Rd.','2022-10-18 20:03:29'),
  ('Risus LLC','P.O. Box 285, 3931 Posuere St.','2022-05-29 10:32:15'),
  ('Id Ante Dictum Associates','Ap #161-1844 A, Rd.','2022-10-28 02:57:03'),
  ('Nullam Suscipit Incorporated','Ap #500-7260 Integer Avenue','2023-03-09 00:56:32'),
  ('Aliquam Iaculis Lacus Consulting','Ap #890-8122 Mi. Av.','2022-06-25 17:37:18');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Cras Lorem LLP','Ap #732-6404 Vitae St.','2022-02-03 08:23:11'),
  ('Arcu Sed Eu LLP','Ap #395-3456 Venenatis St.','2022-10-28 01:45:16'),
  ('Enim Incorporated','742-1102 Mauris Road','2023-05-21 17:36:56'),
  ('Inceptos Hymenaeos Mauris PC','519-9654 Sit Road','2023-08-08 09:02:59'),
  ('Ac LLC','904-559 Nunc Rd.','2023-09-24 19:10:20'),
  ('Egestas Nunc Sed Company','1573 Sagittis. St.','2023-01-25 11:31:05'),
  ('Egestas Hendrerit Corporation','9316 Augue Street','2022-05-29 04:08:33'),
  ('Fusce Mollis Corporation','Ap #590-3248 Iaculis Avenue','2022-12-31 10:24:31'),
  ('Fringilla Mi LLP','Ap #437-5796 Blandit St.','2022-10-08 16:33:43'),
  ('Eget Institute','Ap #177-7367 At Rd.','2022-08-16 10:06:29');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Sit Amet Limited','771 Diam. Rd.','2023-01-27 00:11:10'),
  ('Dapibus Id Blandit Company','Ap #873-2539 Elit. Avenue','2022-05-21 06:46:09'),
  ('Pharetra Ut Inc.','P.O. Box 924, 7570 Pellentesque Rd.','2022-03-22 07:03:22'),
  ('Mollis Vitae Posuere LLC','Ap #789-7630 Suspendisse Road','2022-01-08 14:49:46'),
  ('Vestibulum Lorem LLC','209 Accumsan Ave','2023-06-27 21:29:29'),
  ('Nisi Inc.','714-5877 Et, Road','2023-07-06 07:09:55'),
  ('Libero Donec LLC','970-9237 Scelerisque Rd.','2022-09-13 09:24:00'),
  ('Eget Nisi Dictum Inc.','P.O. Box 800, 6562 Pellentesque Road','2022-05-20 00:21:45'),
  ('Phasellus Fermentum Incorporated','Ap #610-425 Cras Ave','2023-08-09 05:31:27'),
  ('Leo Vivamus LLC','Ap #753-1160 Facilisis Road','2023-09-08 13:19:12');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Non Egestas A Associates','3754 Cras St.','2022-03-11 02:57:47'),
  ('Vulputate Foundation','952-4101 Mauris Ave','2022-01-14 11:46:34'),
  ('Semper Rutrum Institute','160-1904 Elit, Rd.','2021-11-15 22:39:07'),
  ('Quisque Varius Limited','627-489 Blandit. Ave','2022-05-17 19:25:27'),
  ('Lobortis Quis Institute','123-4960 Dignissim Ave','2023-07-20 06:21:07'),
  ('Sem Elit Industries','125-2580 Ut Road','2022-03-07 13:33:04'),
  ('Curabitur Ut LLP','529-4163 In St.','2022-12-15 11:40:08'),
  ('Eget Volutpat Incorporated','303-9478 Mus. Avenue','2023-01-08 16:14:14'),
  ('Tristique Neque Venenatis Inc.','Ap #410-1278 Ac Rd.','2023-10-11 11:34:04'),
  ('Consequat Institute','Ap #113-7338 Scelerisque, Ave','2022-01-13 02:54:58');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Netus Et Institute','659-6387 Augue Road','2022-08-05 04:58:18'),
  ('Cursus Foundation','Ap #220-6379 Sed St.','2022-11-10 17:35:06'),
  ('Et PC','Ap #664-391 Ligula. Road','2023-07-09 18:36:58'),
  ('Magna A Neque LLP','754-9499 Erat Rd.','2022-08-13 03:10:14'),
  ('Pellentesque Habitant Morbi LLP','P.O. Box 101, 6894 Volutpat Road','2022-01-14 08:08:26'),
  ('Justo Proin Non PC','Ap #856-9429 Natoque St.','2022-12-26 23:56:54'),
  ('Natoque Penatibus Et Associates','Ap #994-3691 Tellus Rd.','2022-10-03 21:41:36'),
  ('Tempor Arcu Incorporated','Ap #350-9967 In Street','2021-11-08 00:09:07'),
  ('Nulla Facilisi Sed Limited','480-1388 Etiam Rd.','2023-02-10 06:39:04'),
  ('Semper Auctor Mauris Consulting','P.O. Box 491, 4805 Eget Street','2023-09-07 19:38:14');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Lobortis Augue Associates','841-429 Mus. Ave','2023-04-26 05:42:04'),
  ('Vivamus Nibh Dolor Incorporated','Ap #388-8358 Ultrices St.','2022-03-12 04:40:27'),
  ('Ipsum Donec Corp.','606-7316 Pede Road','2022-04-04 14:34:40'),
  ('Donec Consectetuer Mauris Corporation','314-900 Enim. Ave','2023-08-14 22:55:01'),
  ('Nec LLP','Ap #827-4387 Elit, Rd.','2022-06-11 16:15:22'),
  ('Commodo Auctor Ltd','215-6213 Urna Av.','2023-09-15 21:00:24'),
  ('Non Enim Commodo Industries','4688 Venenatis Street','2022-07-09 03:17:47'),
  ('Ultrices Ltd','993-6227 Sed Rd.','2022-03-18 20:20:27'),
  ('Egestas Aliquam Corp.','Ap #262-5334 Arcu. St.','2022-11-02 08:38:45'),
  ('Morbi Sit PC','Ap #749-7054 Sagittis Street','2022-10-19 10:33:31');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Quisque Varius Nam LLC','601-5204 Velit. Road','2023-09-13 13:19:54'),
  ('Egestas Limited','106-1105 Fringilla, Rd.','2023-09-27 21:45:46'),
  ('Vivamus Corp.','Ap #139-102 Eget Rd.','2022-11-26 08:58:35'),
  ('Tincidunt Ltd','426-8879 Nulla Road','2023-07-11 03:19:47'),
  ('Pretium Neque Ltd','8479 Aliquet, Rd.','2023-01-10 14:32:52'),
  ('Libero Proin Mi Corporation','7249 Elementum Street','2023-08-31 09:15:12'),
  ('Adipiscing Mauris Corporation','Ap #488-6247 Mauris Ave','2022-05-29 14:33:27'),
  ('Aenean Industries','P.O. Box 866, 6648 Metus Road','2022-05-27 18:27:35'),
  ('Sagittis Felis Limited','7223 Etiam Av.','2022-03-31 20:55:28'),
  ('Aliquam Tincidunt Corporation','829-4994 Leo, St.','2022-04-17 08:24:25');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Gravida Sagittis Corporation','3184 Penatibus St.','2022-12-19 15:12:32'),
  ('Metus In Incorporated','525-5709 Erat Ave','2023-08-05 18:12:18'),
  ('In Institute','Ap #660-4619 Pede Avenue','2022-07-01 10:21:07'),
  ('Consectetuer Adipiscing Ltd','P.O. Box 783, 1627 Est, Ave','2022-05-30 19:04:50'),
  ('Eget Varius LLC','Ap #205-6498 Amet, Av.','2023-03-13 06:52:19'),
  ('Magnis Dis Ltd','P.O. Box 988, 6302 Vitae St.','2021-11-26 23:54:24'),
  ('Aliquam Institute','572-7476 Neque Ave','2023-03-17 08:29:23'),
  ('Ipsum PC','Ap #818-8427 Eget St.','2023-06-29 22:49:36'),
  ('Sed Dictum Corporation','861-8492 Est Rd.','2022-07-23 06:51:12'),
  ('Eget Industries','P.O. Box 652, 5045 Tellus. Rd.','2022-11-29 09:11:47');
INSERT INTO shops (name,address,opening_hors)
VALUES
  ('Nunc Ac Corporation','1775 Varius. Avenue','2023-01-20 10:36:34'),
  ('Facilisis Consulting','1427 Dis St.','2023-06-13 13:11:47'),
  ('Aliquam Ornare Incorporated','558-2891 Vulputate, Road','2023-02-15 09:38:42'),
  ('Fringilla Ornare Corp.','P.O. Box 627, 6960 Neque St.','2021-12-25 17:18:20'),
  ('Semper Industries','Ap #750-431 Egestas Road','2022-11-28 18:30:49'),
  ('Class Aptent Taciti Institute','Ap #729-4341 A, Road','2023-05-04 16:03:04'),
  ('Arcu Aliquam Corp.','Ap #589-6566 Luctus Rd.','2021-12-02 01:27:19'),
  ('Nibh Donec Est Corporation','Ap #756-2534 Quisque Street','2023-07-23 11:24:10'),
  ('Praesent Eu LLC','172-2950 Varius Rd.','2022-11-22 13:28:43'),
  ('Nisi Magna Corporation','P.O. Box 694, 185 Hendrerit St.','2022-05-03 05:41:05');
  
  string(20592) "UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =1;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =2;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =3;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =4;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =5;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =6;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =7;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =8;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =9;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =10;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =11;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =12;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =13;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =14;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =15;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =16;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =17;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =18;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =19;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =20;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =21;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =22;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =23;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =24;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =25;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =26;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =27;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =28;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =29;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =30;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =31;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =32;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =33;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =34;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =35;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =36;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =37;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =38;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =39;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =40;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =41;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =42;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =43;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =44;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =45;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =46;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =47;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =48;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =49;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =50;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =51;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =52;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =53;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =54;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =55;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =56;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =57;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =58;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =59;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =60;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =61;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =62;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =63;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =64;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =65;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =66;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =67;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =68;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =69;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =70;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =71;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =72;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =73;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =74;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =75;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =76;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =77;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =78;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =79;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =80;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =81;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =82;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =83;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =84;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =85;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =86;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =87;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =88;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =89;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =90;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =91;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =92;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =93;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =94;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =95;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =96;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =97;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =98;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =99;
UPDATE shops SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =100;
"
