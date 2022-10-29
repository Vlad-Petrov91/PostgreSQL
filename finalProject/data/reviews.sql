CREATE TABLE "reviews" (
  id SERIAL PRIMARY KEY,
  user_id integer NULL,
  product_id integer NULL,
  order_id integer NULL,
  text TEXT default NULL,
  rating integer NULL,
  images_id integer NULL,
  added_at varchar(255)
);

INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (67,86,80,'eget',4,39,'2022-03-22 06:37:44'),
  (50,57,69,'Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus',5,42,'2022-10-02 09:47:13'),
  (62,73,89,'vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque',2,70,'2023-03-30 06:30:04'),
  (70,98,93,'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed',3,2,'2022-04-13 22:02:21'),
  (90,28,7,'erat, in consectetuer ipsum nunc',1,73,'2022-01-11 05:24:11'),
  (3,58,41,'erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque.',1,63,'2022-04-14 21:46:51'),
  (47,4,81,'nostra, per inceptos hymenaeos.',2,98,'2023-01-23 15:46:21'),
  (13,90,94,'dapibus ligula. Aliquam erat volutpat. Nulla',3,3,'2022-09-05 04:25:45'),
  (20,4,94,'Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus.',3,66,'2022-04-06 00:27:53'),
  (69,55,53,'Aliquam auctor, velit eget laoreet',4,37,'2023-05-28 17:33:02');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (79,32,34,'viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus',4,6,'2022-08-16 13:07:24'),
  (81,87,35,'pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim',1,71,'2023-02-13 08:08:15'),
  (46,45,77,'mi. Duis risus odio, auctor vitae, aliquet nec,',3,25,'2022-12-11 15:39:46'),
  (97,55,3,'id,',3,58,'2022-06-13 09:11:51'),
  (46,29,72,'malesuada fames ac turpis egestas. Fusce aliquet magna a neque.',2,15,'2022-01-01 15:16:13'),
  (25,10,83,'Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies',3,39,'2023-09-25 12:46:20'),
  (92,52,39,'mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.',3,65,'2022-02-28 08:54:57'),
  (35,40,43,'nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum',2,25,'2023-05-06 17:31:19'),
  (78,36,44,'a sollicitudin orci sem eget',3,24,'2022-08-25 20:01:44'),
  (58,24,18,'ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim',3,6,'2022-12-02 09:56:14');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (22,36,49,'Aliquam auctor, velit eget laoreet',2,45,'2023-02-04 07:11:34'),
  (51,58,67,'dictum eu, eleifend nec, malesuada ut, sem.',3,17,'2023-02-14 19:14:09'),
  (16,43,81,'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,',1,33,'2022-04-28 05:53:50'),
  (1,67,20,'risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at',3,55,'2023-01-30 10:15:05'),
  (16,71,23,'inceptos hymenaeos. Mauris ut quam',4,19,'2022-02-04 22:58:33'),
  (73,35,65,'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin',3,17,'2021-11-08 18:05:24'),
  (82,75,84,'velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget',3,15,'2023-01-18 16:37:50'),
  (72,58,28,'vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue',4,48,'2022-03-23 01:40:04'),
  (70,20,28,'et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi',4,85,'2022-12-13 10:25:27'),
  (69,25,47,'erat eget',3,85,'2021-11-24 02:59:40');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (17,92,16,'lacus vestibulum lorem, sit amet ultricies sem magna',3,48,'2021-12-11 16:16:45'),
  (98,65,64,'orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero.',3,19,'2022-08-03 12:58:23'),
  (86,60,54,'Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare',5,69,'2023-06-29 05:24:42'),
  (11,67,51,'ullamcorper, nisl arcu iaculis',1,88,'2022-04-16 22:31:19'),
  (31,27,27,'enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem',4,25,'2022-11-22 16:54:32'),
  (17,100,95,'vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,',5,49,'2021-12-15 21:27:44'),
  (95,87,67,'lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend',2,56,'2022-01-17 14:20:45'),
  (72,21,20,'tristique senectus et netus et',4,56,'2022-04-07 22:20:57'),
  (54,44,12,'luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus',4,92,'2023-04-20 11:53:48'),
  (31,89,47,'leo. Morbi neque',4,7,'2023-01-31 18:26:57');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (18,91,61,'sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede,',4,67,'2023-04-27 17:32:21'),
  (81,12,42,'ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in',4,18,'2023-04-01 19:57:04'),
  (34,48,5,'Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,',3,11,'2023-08-13 16:15:55'),
  (34,32,79,'Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor',2,43,'2023-06-26 03:27:33'),
  (62,12,89,'eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate',4,11,'2022-07-22 14:50:02'),
  (24,40,4,'nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus',1,22,'2023-05-23 19:55:27'),
  (92,47,19,'erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,',4,72,'2022-12-08 10:06:39'),
  (14,27,74,'Vivamus euismod urna. Nullam lobortis quam a felis',3,8,'2022-06-02 05:58:45'),
  (23,75,71,'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis',2,56,'2021-12-29 18:50:39'),
  (14,92,34,'nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.',2,19,'2023-06-02 15:55:33');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (94,53,95,'blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum',5,83,'2023-03-31 07:09:39'),
  (24,100,2,'eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis',3,96,'2022-08-26 22:59:20'),
  (98,74,46,'blandit congue.',2,99,'2021-12-26 17:37:20'),
  (35,55,94,'Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec',4,6,'2023-07-20 12:01:11'),
  (9,71,39,'at, libero. Morbi accumsan laoreet ipsum.',4,91,'2022-12-16 13:06:44'),
  (84,94,27,'et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.',5,53,'2023-01-12 09:14:40'),
  (31,76,12,'ullamcorper. Duis cursus, diam',2,93,'2023-06-05 05:44:12'),
  (80,96,73,'accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.',4,98,'2022-04-23 09:36:10'),
  (52,26,63,'euismod in, dolor. Fusce feugiat.',4,74,'2023-07-10 04:41:55'),
  (68,70,2,'sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris',2,80,'2023-03-08 15:03:23');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (83,25,8,'lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere',4,23,'2023-07-18 16:40:44'),
  (27,48,78,'ut quam vel',3,56,'2022-09-08 23:41:58'),
  (91,79,43,'Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.',4,37,'2023-07-01 19:43:14'),
  (63,42,76,'pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,',1,41,'2021-11-14 01:55:37'),
  (87,42,14,'id, libero. Donec consectetuer mauris id sapien. Cras',3,32,'2023-04-13 13:00:51'),
  (57,56,22,'semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.',4,98,'2023-04-06 04:28:21'),
  (58,2,27,'auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin',3,1,'2022-08-20 08:16:44'),
  (100,69,60,'dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus',4,96,'2022-10-19 05:45:55'),
  (80,85,95,'nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam',1,65,'2022-09-02 00:28:38'),
  (33,51,7,'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.',1,61,'2022-09-15 11:05:45');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (15,14,35,'vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum.',3,97,'2021-10-30 11:20:04'),
  (25,75,50,'Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam',2,74,'2021-12-18 06:22:14'),
  (60,95,74,'tincidunt',4,6,'2022-05-06 20:08:02'),
  (54,30,85,'condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et',3,31,'2022-03-31 03:24:39'),
  (3,43,78,'dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et',2,90,'2023-02-22 16:25:37'),
  (33,27,33,'consequat, lectus',4,49,'2022-09-03 16:29:39'),
  (89,17,64,'elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut',4,53,'2022-12-21 08:48:57'),
  (10,45,67,'malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor',2,91,'2022-09-05 20:05:06'),
  (79,84,47,'Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,',3,72,'2022-05-11 19:27:58'),
  (90,15,29,'mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec',3,75,'2023-09-11 10:11:50');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (45,51,41,'nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.',4,82,'2022-06-26 03:47:55'),
  (22,3,71,'tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non',3,84,'2021-12-19 16:40:49'),
  (97,42,80,'pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor',5,34,'2022-12-26 19:30:19'),
  (12,48,4,'arcu iaculis enim, sit',2,52,'2023-10-25 04:27:19'),
  (10,99,24,'amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies',4,53,'2023-02-09 21:00:33'),
  (83,2,82,'vel, faucibus id, libero. Donec consectetuer mauris',2,40,'2023-03-13 07:43:34'),
  (30,26,24,'dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.',3,64,'2023-07-22 21:03:02'),
  (59,81,48,'diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit',1,58,'2023-04-30 13:54:40'),
  (83,17,23,'et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis',5,90,'2023-09-21 13:47:28'),
  (8,79,73,'cursus et,',3,30,'2022-11-03 22:18:30');
INSERT INTO reviews (user_id,product_id,order_id,text,rating,images_id,added_at)
VALUES
  (29,45,81,'sit amet,',2,8,'2022-01-10 23:25:04'),
  (39,17,51,'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique',2,66,'2022-09-26 11:40:12'),
  (84,34,41,'ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie',3,49,'2023-05-12 22:58:50'),
  (82,41,10,'gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras',4,96,'2022-06-06 16:44:10'),
  (19,34,96,'purus mauris a nunc. In at pede. Cras vulputate velit',2,30,'2022-09-06 17:49:23'),
  (46,82,51,'tristique neque venenatis',5,22,'2021-11-21 23:34:01'),
  (64,77,92,'nec luctus felis purus ac tellus. Suspendisse sed',3,27,'2022-04-10 16:43:14'),
  (88,18,15,'adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',3,8,'2022-02-06 03:35:37'),
  (82,4,13,'odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer',2,85,'2021-11-22 17:26:42'),
  (87,68,35,'orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in',2,53,'2022-09-03 21:12:43');
