CREATE TABLE "products" (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  category_id integer NULL,
  description TEXT default NULL,
  count integer NULL,
  images_id integer NULL,
  average_rating varchar(100),
  added_at varchar(255)
);

INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Nunc Mauris Morbi Corp.',20,'sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim',86,1,'1.8','2022-12-19 06:07:11'),
  ('Eu Turpis Industries',11,'primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor',98,2,'4.1','2023-08-14 12:29:10'),
  ('Ultrices Posuere Incorporated',19,'nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor',98,3,'4.1','2022-10-15 00:38:39'),
  ('Suscipit Est Institute',24,'euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim',21,4,'2.9','2022-08-14 04:45:39'),
  ('Nunc Sollicitudin LLC',5,'Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.',79,5,'4.3','2022-08-31 14:03:27'),
  ('Quisque Varius Inc.',4,'justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in',18,6,'4.2','2022-10-19 09:04:53'),
  ('Morbi Tristique Ltd',21,'lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet',99,7,'1.4','2022-01-19 22:50:43'),
  ('Mattis LLC',15,'quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.',40,8,'3.6','2023-07-15 06:33:40'),
  ('In Condimentum Donec Inc.',21,'Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique',29,9,'3.4','2023-08-20 20:27:10'),
  ('Lectus Pede Foundation',25,'egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis',70,10,'3.0','2022-01-27 02:36:27');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Non Corporation',9,'leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu',11,11,'3.2','2023-10-03 20:26:00'),
  ('Tincidunt Aliquam Arcu Incorporated',12,'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing',9,12,'0.3','2023-04-16 06:53:20'),
  ('Placerat Orci Lacus PC',21,'Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,',67,13,'2.2','2022-12-30 12:01:49'),
  ('Augue Porttitor PC',11,'Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor.',33,14,'0.9','2022-02-08 16:58:20'),
  ('Nec Enim Nunc Corporation',1,'Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis',97,15,'4.8','2022-05-22 12:20:55'),
  ('Justo Eu Associates',15,'Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam',75,16,'1.1','2023-07-19 23:23:21'),
  ('Luctus Aliquet Odio Institute',18,'magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,',57,17,'2.4','2023-02-25 08:55:32'),
  ('Lectus Sit Corp.',9,'sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,',81,18,'4.8','2022-09-02 08:21:48'),
  ('Aliquam Erat Volutpat LLC',24,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet',27,19,'3.7','2023-01-31 03:31:39'),
  ('Egestas Blandit Incorporated home',24,'sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit',2,20,'2.3','2022-03-06 20:03:40');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Sed Dui Fusce Institute',15,'vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis',59,21,'2.9','2022-09-19 11:45:47'),
  ('Nunc In Ltd',16,'urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,',68,22,'2.4','2022-06-09 06:20:39'),
  ('A Auctor PC',22,'dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.',53,23,'5.6','2023-09-20 05:21:18'),
  ('Pellentesque A Facilisis LLP',20,'Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.',62,24,'4.1','2022-02-13 18:32:31'),
  ('In LLC',19,'est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae',77,25,'3.3','2023-07-01 03:26:08'),
  ('Fermentum Convallis Ligula Corp.',23,'risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis',19,26,'3.2','2022-03-01 21:37:06'),
  ('Egestas Blandit Incorporated',12,'nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc',34,27,'2.7','2022-12-29 08:20:02'),
  ('Risus LLP',18,'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac',93,28,'2.8','2022-01-15 00:50:18'),
  ('Erat Eget Ipsum Institute',7,'sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec',83,29,'-1.2','2022-01-09 06:03:32'),
  ('Libero Lacus Inc.',8,'ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,',52,30,'1.7','2022-02-17 08:55:54');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Mollis Duis LLC',9,'molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos',48,31,'4.6','2023-03-08 04:13:46'),
  ('Dignissim Lacus Foundation',15,'nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus',97,32,'1.9','2023-08-26 12:09:26'),
  ('Sed Pharetra Foundation',22,'non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget',27,33,'0.9','2023-07-02 02:35:40'),
  ('Tristique Pharetra LLC',7,'neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor',40,34,'3.9','2023-02-21 23:34:58'),
  ('In Corp.',10,'ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad',30,35,'3.4','2021-12-21 14:46:39'),
  ('Ante Bibendum PC',23,'et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula',83,36,'2.3','2022-05-03 18:48:18'),
  ('Ligula Nullam Industries',20,'nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu',61,37,'1.4','2022-05-05 03:36:15'),
  ('Proin Dolor LLC',24,'netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla',88,38,'2.4','2023-04-22 10:59:13'),
  ('Fusce Mollis Institute',8,'lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper,',20,39,'2.5','2022-11-01 23:06:38'),
  ('Dapibus Id Blandit Foundation',9,'nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu',39,40,'2.8','2021-11-14 17:29:04');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Odio Vel Est Limited',20,'ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis',75,41,'1.7','2023-08-06 23:59:07'),
  ('Arcu PC',16,'imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate',42,42,'0.8','2023-07-16 21:58:54'),
  ('Arcu Sed Corporation',24,'Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum.',86,43,'1.6','2021-12-19 06:18:33'),
  ('Magna A Tortor LLP',20,'magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem',75,44,'3.2','2022-09-30 23:19:00'),
  ('Odio Vel Est PC',15,'sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit',74,45,'2.2','2022-08-22 03:33:04'),
  ('Sed Diam PC',3,'cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis',30,46,'3.8','2022-08-07 16:06:10'),
  ('Varius Orci Associates',5,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget',14,47,'2.3','2023-02-07 21:07:42'),
  ('Morbi Vehicula Company',14,'sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis',37,48,'4.1','2023-05-18 03:07:25'),
  ('Fringilla Est Incorporated',4,'molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet',51,49,'1.9','2022-12-04 15:50:44'),
  ('Cursus Et Ltd',9,'dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes,',25,50,'1.5','2023-06-23 19:05:19');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Quisque Varius Corp.',13,'neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat,',74,51,'3.6','2022-09-20 20:20:03'),
  ('Integer LLC',24,'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare',10,52,'2.7','2022-12-13 09:58:02'),
  ('Ornare Libero LLC',24,'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris',81,53,'2.3','2022-02-25 10:44:34'),
  ('Vestibulum Accumsan Foundation',16,'Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',98,54,'2.4','2022-02-24 05:59:57'),
  ('Libero Foundation',5,'Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.',86,55,'3.7','2022-03-07 21:41:15'),
  ('Est LLC',2,'Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum',67,56,'2.4','2023-05-03 02:27:41'),
  ('Nunc In Corporation',17,'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo',30,57,'3.3','2022-02-24 22:23:53'),
  ('Elit Foundation',14,'Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper.',50,58,'3.2','2023-05-02 09:24:37'),
  ('Nullam Ut Institute',3,'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et',95,59,'4.7','2021-11-28 09:34:40'),
  ('Bibendum Fermentum Metus Ltd',17,'a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae',54,60,'3.0','2021-11-29 04:29:48');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Auctor Vitae Consulting',3,'diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis',63,61,'2.1','2022-08-09 02:17:22'),
  ('Accumsan Convallis Ante Limited',23,'tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum',67,62,'2.0','2022-11-20 09:47:53'),
  ('Massa Quisque PC',2,'diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut,',53,63,'2.8','2022-02-26 20:37:10'),
  ('Ullamcorper Eu Euismod Corporation',8,'Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi',71,64,'2.1','2023-06-30 12:38:34'),
  ('Lectus A Corporation',3,'eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a',73,65,'2.5','2022-04-18 07:17:27'),
  ('Est Ac Corp.',25,'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel',79,66,'0.3','2023-09-16 00:12:35'),
  ('Integer Vulputate Inc.',9,'nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum,',14,67,'3.2','2023-05-11 11:52:58'),
  ('Molestie Dapibus Ligula Industries',6,'mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis',25,68,'2.5','2022-06-12 06:35:41'),
  ('Ultrices Mauris Industries',4,'vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis',64,69,'6.0','2022-05-14 08:34:08'),
  ('Aliquam Industries',4,'libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum',53,70,'1.6','2023-01-08 09:37:07');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Cras Vulputate LLC',20,'Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue',15,71,'4.8','2023-03-18 08:36:29'),
  ('Ac Associates',21,'eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque',79,72,'0.8','2022-04-28 08:02:06'),
  ('Commodo Auctor Velit Foundation',3,'consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.',62,73,'2.4','2023-08-09 23:26:43'),
  ('Mi Felis Associates',16,'consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.',81,74,'4.3','2022-12-06 17:47:07'),
  ('Odio Semper Ltd',20,'vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue',45,75,'2.7','2022-07-25 23:19:29'),
  ('Semper Auctor Consulting',16,'mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis',97,76,'0.8','2023-02-14 21:51:31'),
  ('Aliquam Nec Inc.',15,'non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam',42,77,'2.7','2022-05-08 07:16:13'),
  ('Lobortis Foundation',10,'velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem',48,78,'-0.9','2022-05-21 06:42:22'),
  ('Vulputate Ullamcorper Incorporated',2,'quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in',71,79,'3.4','2023-10-01 09:06:39'),
  ('Neque Morbi Foundation',4,'ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur',31,80,'1.9','2023-05-06 09:11:20');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Dui Semper Industries',5,'facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis',78,81,'5.3','2023-07-21 04:37:32'),
  ('Pede Inc.',10,'Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed',2,82,'2.9','2022-08-28 04:50:44'),
  ('Purus Accumsan Interdum Industries',20,'ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent',65,83,'2.0','2022-09-14 13:38:57'),
  ('Vivamus Molestie Dapibus Inc.',6,'Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae',59,84,'3.0','2022-10-03 11:13:36'),
  ('Diam Luctus Ltd',15,'Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat,',47,85,'4.1','2023-05-01 15:31:45'),
  ('Congue In Limited',21,'eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.',23,86,'3.5','2023-05-29 16:29:38'),
  ('Urna Justo Corp.',12,'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam',5,87,'1.5','2022-07-04 09:35:36'),
  ('Commodo Industries',2,'dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis.',94,88,'2.9','2021-11-22 14:58:15'),
  ('Nullam Nisl Maecenas Institute',20,'amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu,',52,89,'2.9','2022-08-22 06:09:24'),
  ('Ac Mattis Inc.',18,'egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu',99,90,'5.6','2023-06-09 08:27:30');
INSERT INTO products (name,category_id,description,count,images_id,average_rating,added_at)
VALUES
  ('Non Egestas Inc.',5,'Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum',8,91,'0.4','2022-02-07 04:02:32'),
  ('Fringilla Purus Mauris Limited',24,'ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur',70,92,'2.3','2022-05-03 09:22:25'),
  ('Tempus Eu Corp.',10,'quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla',18,93,'3.1','2023-01-07 21:38:03'),
  ('Cras LLC',1,'turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.',60,94,'4.7','2022-07-19 19:38:58'),
  ('Cras Convallis Industries',3,'nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut',33,95,'3.0','2023-05-21 16:54:00'),
  ('Dui Cras Ltd',2,'quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.',94,96,'4.1','2022-01-25 21:30:47'),
  ('At Pede Cras Corporation',20,'Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem,',64,97,'4.2','2022-07-26 04:44:27'),
  ('Etiam Ligula Tortor Ltd',10,'ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras',59,98,'1.2','2022-12-26 22:20:22'),
  ('Parturient Montes Corporation',8,'lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti',5,99,'1.1','2022-09-20 12:19:32'),
  ('Lectus Convallis Est Industries',15,'sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque',25,100,'3.2','2022-01-24 11:52:21');
