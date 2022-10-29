CREATE TABLE "orders" (
  id SERIAL PRIMARY KEY,
  user_id integer NULL,
  price varchar(100),
  delivery_method_id integer NULL,
  payment_method_id integer NULL,
  shop_id integer NULL,
  completed varchar(255) default NULL,
  added_at varchar(255)
);

INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (48,'2006.93',4,7,65,'Yes','2022-12-20 12:45:23'),
  (96,'1855.79',9,3,89,'No','2022-02-04 15:05:15'),
  (40,'2023.57',5,9,94,'Yes','2023-01-19 07:01:39'),
  (75,'2109.75',6,6,35,'No','2022-08-30 09:12:48'),
  (26,'2035.85',3,6,23,'Yes','2022-01-27 23:56:31'),
  (16,'1732.08',4,5,24,'Yes','2022-10-24 17:20:30'),
  (22,'1808.16',4,8,73,'Yes','2022-12-16 22:31:08'),
  (69,'2125.52',5,10,64,'Yes','2022-12-15 12:48:26'),
  (70,'1853.90',1,3,74,'No','2023-05-06 04:29:11'),
  (24,'1857.94',9,9,8,'No','2022-12-09 19:45:38');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (46,'1970.75',6,7,44,'No','2023-10-02 02:24:38'),
  (65,'2159.57',8,2,17,'No','2022-11-14 22:25:12'),
  (2,'1888.13',8,8,88,'Yes','2022-08-30 04:36:55'),
  (26,'2122.65',3,9,38,'No','2021-12-23 02:35:41'),
  (1,'1872.76',1,10,61,'Yes','2021-12-15 22:24:41'),
  (84,'1953.41',4,9,84,'No','2023-05-12 01:14:20'),
  (15,'1987.95',8,9,37,'No','2022-01-29 10:36:27'),
  (47,'2070.18',2,9,22,'No','2022-12-30 14:43:14'),
  (4,'2100.12',6,1,5,'No','2022-02-21 15:28:01'),
  (13,'2132.03',1,3,55,'Yes','2022-07-24 09:05:11');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (16,'2028.31',4,9,55,'No','2022-07-09 17:34:04'),
  (21,'1961.45',8,4,89,'Yes','2022-10-01 08:56:41'),
  (71,'2101.91',9,3,94,'No','2023-04-17 13:19:57'),
  (24,'1949.99',8,6,84,'No','2023-07-01 02:19:53'),
  (97,'1916.01',9,1,5,'No','2023-05-30 10:09:24'),
  (42,'1989.94',6,9,70,'Yes','2023-05-17 14:26:11'),
  (18,'2040.70',3,7,27,'No','2022-10-26 04:12:43'),
  (27,'1999.69',8,8,67,'No','2022-06-04 22:42:42'),
  (99,'1956.91',2,4,72,'No','2022-05-17 12:47:50'),
  (3,'2085.83',8,1,58,'No','2023-09-06 02:32:32');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (69,'2079.34',6,3,78,'No','2022-01-11 19:05:19'),
  (86,'1916.51',9,7,49,'No','2022-09-05 11:33:13'),
  (70,'1975.95',10,8,46,'No','2022-08-12 04:09:54'),
  (32,'1833.73',6,6,44,'No','2022-02-05 18:59:28'),
  (8,'1989.65',6,7,62,'No','2022-08-02 02:26:48'),
  (33,'1822.13',7,2,87,'No','2023-06-11 18:42:16'),
  (39,'1981.81',3,1,11,'No','2023-10-24 02:05:14'),
  (44,'1984.37',2,4,85,'No','2021-12-27 20:27:07'),
  (48,'1912.81',7,4,100,'Yes','2022-07-23 20:45:06'),
  (99,'1924.43',2,5,77,'No','2023-02-24 09:33:22');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (19,'2189.12',7,8,98,'Yes','2023-07-26 03:20:15'),
  (78,'2146.96',9,1,72,'Yes','2022-09-08 14:27:38'),
  (43,'2157.92',5,5,26,'No','2022-05-13 15:07:23'),
  (51,'2032.04',3,4,64,'No','2023-03-16 11:05:10'),
  (57,'1800.33',6,6,92,'No','2022-02-05 00:40:15'),
  (47,'1905.67',7,1,65,'Yes','2022-02-12 05:21:01'),
  (17,'2060.37',5,7,14,'No','2023-07-15 02:30:40'),
  (65,'2201.18',3,4,3,'Yes','2023-03-09 16:56:43'),
  (57,'1987.52',9,3,91,'No','2023-04-07 21:40:03'),
  (94,'2009.27',4,1,7,'No','2023-05-10 02:17:23');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (91,'2051.60',6,10,49,'Yes','2021-12-31 17:38:43'),
  (98,'2170.35',8,6,94,'Yes','2022-09-14 20:34:49'),
  (41,'2179.78',4,4,91,'No','2023-06-27 05:57:41'),
  (16,'2005.21',2,5,38,'No','2021-11-29 00:48:08'),
  (23,'2282.85',8,7,93,'Yes','2023-02-07 09:35:27'),
  (46,'1991.92',5,1,71,'Yes','2022-04-03 20:58:15'),
  (18,'2052.64',2,8,81,'No','2023-08-09 03:09:50'),
  (23,'2086.11',2,8,4,'No','2022-07-10 17:00:43'),
  (86,'1758.75',7,7,57,'No','2021-12-05 00:08:16'),
  (46,'1968.59',10,4,60,'No','2023-06-29 19:04:55');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (79,'1767.99',7,3,29,'No','2022-05-21 05:27:13'),
  (64,'1908.66',8,8,41,'Yes','2022-02-17 14:10:16'),
  (99,'1783.43',3,5,50,'Yes','2022-05-03 17:30:39'),
  (89,'2088.32',9,7,98,'No','2023-05-27 20:10:38'),
  (36,'1991.65',8,1,5,'Yes','2022-10-16 20:01:07'),
  (71,'1892.65',8,1,3,'Yes','2021-12-01 04:48:50'),
  (38,'1815.95',3,2,73,'Yes','2022-01-11 21:57:20'),
  (49,'2031.00',6,3,87,'No','2023-01-24 23:07:14'),
  (28,'1740.30',3,1,13,'Yes','2023-09-04 16:00:24'),
  (58,'2171.73',7,4,5,'No','2022-02-06 16:45:52');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (96,'1951.44',4,2,18,'Yes','2022-07-28 19:55:16'),
  (80,'1864.07',6,8,31,'Yes','2023-07-16 17:13:46'),
  (77,'2011.31',7,3,82,'No','2022-12-28 03:00:33'),
  (63,'1926.63',5,5,20,'Yes','2023-01-26 09:59:09'),
  (22,'2019.61',8,8,37,'Yes','2022-08-04 14:01:42'),
  (94,'2007.28',3,4,91,'Yes','2022-02-01 08:21:23'),
  (37,'2023.21',7,4,45,'Yes','2023-03-07 20:47:23'),
  (58,'2183.27',5,4,80,'No','2023-05-13 06:36:02'),
  (17,'1949.32',2,3,82,'No','2022-02-02 23:27:19'),
  (97,'1881.69',8,2,65,'Yes','2023-10-20 21:32:08');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (41,'2018.65',6,8,95,'No','2022-12-21 09:16:24'),
  (94,'2082.39',5,8,85,'Yes','2022-02-10 23:07:23'),
  (63,'2151.84',6,5,28,'No','2021-11-10 03:10:24'),
  (56,'2037.80',2,5,73,'No','2023-03-11 20:20:29'),
  (10,'2007.92',3,1,43,'No','2022-09-02 02:44:35'),
  (88,'1869.65',2,6,91,'Yes','2022-07-28 12:13:53'),
  (63,'2203.34',2,4,91,'No','2023-09-10 21:49:59'),
  (21,'2195.92',7,2,5,'No','2022-04-20 14:41:18'),
  (20,'2063.39',1,1,52,'Yes','2022-12-16 10:11:02'),
  (54,'1913.66',3,2,32,'No','2023-04-09 20:00:28');
INSERT INTO orders (user_id,price,delivery_method_id,payment_method_id,shop_id,completed,added_at)
VALUES
  (73,'2083.09',9,3,96,'Yes','2022-08-09 06:53:36'),
  (17,'1889.09',2,9,27,'Yes','2023-10-03 07:13:27'),
  (87,'1995.18',8,3,90,'No','2022-04-17 13:11:35'),
  (79,'1702.81',8,5,73,'Yes','2022-11-24 13:58:16'),
  (26,'2049.10',10,4,26,'No','2022-09-12 03:15:43'),
  (40,'2493.23',3,8,54,'Yes','2022-04-11 22:42:07'),
  (60,'1921.19',8,2,42,'Yes','2022-04-08 04:29:41'),
  (51,'1846.78',4,9,9,'No','2022-02-10 07:19:54'),
  (2,'2319.71',3,4,38,'Yes','2022-08-22 12:57:42'),
  (45,'2055.69',7,6,46,'No','2023-01-25 15:12:10');
 
 UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =1;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =2;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =3;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =4;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =5;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =6;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =7;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =8;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =9;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =10;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =11;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =12;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =13;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =14;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =15;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =16;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =17;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =18;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =19;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =20;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =21;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =22;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =23;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =24;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =25;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =26;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =27;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =28;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =29;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =30;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =31;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =32;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =33;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =34;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =35;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =36;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =37;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =38;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =39;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =40;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =41;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =42;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =43;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =44;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =45;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =46;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =47;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =48;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =49;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =50;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =51;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =52;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =53;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =54;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =55;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =56;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =57;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =58;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =59;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =60;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =61;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =62;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =63;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =64;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =65;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =66;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =67;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =68;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =69;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =70;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =71;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =72;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =73;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =74;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =75;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =76;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =77;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =78;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =79;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =80;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =81;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =82;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =83;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =84;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =85;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =86;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =87;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =88;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =89;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =90;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =91;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =92;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =93;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =94;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =95;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =96;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =97;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =98;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =99;
UPDATE orders SET products_and_quantity = products_and_quantity || json_build_object( 'product_id', round(RANDOM() * 100), 'count', round(RANDOM() * 20)) WHERE id =100;
