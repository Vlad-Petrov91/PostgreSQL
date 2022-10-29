CREATE TABLE "users" (
  id SERIAL PRIMARY KEY,
  first_name varchar(255) default NULL,
  last_name varchar(255) default NULL,
  address varchar(255) default NULL,
  email varchar(255) default NULL,
  phone varchar(100) default NULL,
  created_at varchar(255)
);

INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Alexander','Boone','Ap #168-4043 A, Avenue','feugiat.nec@hotmail.com','1-839-284-4023','2023-05-05 13:41:00'),
  ('Lev','Davidson','P.O. Box 731, 6517 Rutrum Ave','quisque.libero.lacus@google.couk','1-811-506-6903','2021-10-29 17:03:30'),
  ('Kadeem','Key','Ap #459-4900 Amet Ave','facilisis.vitae@icloud.com','1-121-504-7904','2022-06-20 16:02:37'),
  ('Maris','Hurst','Ap #785-2495 Est Street','nec@protonmail.ca','1-421-885-6222','2022-07-09 12:46:17'),
  ('Ezekiel','Erickson','708-3613 Fringilla. St.','lacus.cras.interdum@aol.net','1-338-826-6739','2022-07-06 04:36:12'),
  ('Griffith','Osborn','Ap #342-4705 Hendrerit Avenue','convallis.convallis@yahoo.couk','1-768-387-7177','2022-03-11 17:38:28'),
  ('Nolan','Dixon','637-6218 Sagittis Av.','phasellus.vitae.mauris@outlook.ca','1-834-531-7419','2022-07-22 02:48:03'),
  ('Lacy','Anderson','126-2904 Habitant St.','morbi@outlook.org','1-330-848-8825','2023-01-20 05:34:56'),
  ('Knox','Stanton','148-9852 In Ave','amet.metus@hotmail.edu','1-949-587-2658','2022-12-09 14:13:37'),
  ('Vincent','Thornton','3524 Volutpat. St.','pellentesque.ut.ipsum@google.com','1-491-453-3606','2022-11-01 01:35:48');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Nevada','Conley','241-4438 Urna. Rd.','tellus.eu.augue@protonmail.org','1-876-544-8417','2022-12-07 10:36:02'),
  ('Tate','Donaldson','Ap #296-6129 Lorem Ave','quis@icloud.org','1-372-651-5455','2022-04-01 15:59:59'),
  ('Mira','Whitfield','112-855 Nec Rd.','suspendisse.commodo.tincidunt@aol.com','1-968-330-4864','2022-03-17 16:31:27'),
  ('Cailin','Murphy','791-5417 Velit. Av.','consectetuer.euismod.est@yahoo.edu','1-838-746-5462','2022-08-13 14:58:19'),
  ('Lars','Gonzales','8430 Cursus Road','sit.amet@hotmail.couk','1-651-220-8741','2022-04-30 14:58:30'),
  ('Hayden','Cain','Ap #256-1711 Ut, Rd.','congue.turpis@aol.couk','1-935-717-6670','2021-12-08 23:02:21'),
  ('Imani','Gilmore','3159 Aliquam Rd.','vulputate.posuere@protonmail.edu','1-367-827-7370','2022-08-11 15:44:33'),
  ('Arsenio','Henderson','518-4708 Semper Road','fringilla@icloud.edu','1-977-745-3738','2023-05-30 23:34:40'),
  ('Callum','Vance','3033 Nunc Rd.','magnis.dis.parturient@outlook.com','1-462-489-6483','2023-01-18 11:37:14'),
  ('Octavia','Nicholson','1040 Velit St.','nunc.mauris.sapien@icloud.ca','1-454-851-9754','2022-05-02 17:41:12');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Dane','Good','1112 Rhoncus. Avenue','elementum.purus.accumsan@aol.org','1-743-351-3237','2023-09-02 22:02:57'),
  ('Darryl','Knox','5913 Nisl Road','nisi.nibh.lacinia@icloud.edu','1-586-968-1539','2023-02-26 18:29:51'),
  ('Heather','Daniels','Ap #427-9610 Aliquet Av.','elit.pretium.et@google.couk','1-367-500-1512','2022-07-11 08:51:26'),
  ('Mannix','Burt','162-5119 Etiam Av.','porttitor.vulputate.posuere@protonmail.net','1-554-390-8490','2021-12-22 18:17:15'),
  ('Rhona','Townsend','Ap #143-3679 Mauris. Rd.','suspendisse.non@google.ca','1-759-856-3787','2022-05-23 02:34:32'),
  ('Uma','Collier','Ap #989-3538 Non, Ave','magnis@outlook.com','1-751-878-3705','2023-10-02 15:28:03'),
  ('Isadora','Vazquez','3933 Suspendisse Road','cursus.in@hotmail.couk','1-361-485-7219','2023-05-21 08:39:02'),
  ('Justin','England','4902 Mattis St.','nibh@icloud.edu','1-558-372-0271','2022-12-18 15:59:53'),
  ('Armand','Battle','7740 Quisque Street','morbi.sit@icloud.ca','1-727-613-7684','2023-03-06 09:39:48'),
  ('Hammett','Evans','P.O. Box 593, 7672 Vel, Road','mollis.phasellus.libero@aol.couk','1-988-393-9584','2023-03-20 00:40:03');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Marsden','Jordan','P.O. Box 691, 9021 Nunc St.','elit.fermentum@yahoo.ca','1-871-516-3170','2023-02-04 02:22:18'),
  ('Wayne','Paul','Ap #738-3168 Cras Av.','non@outlook.net','1-343-279-8352','2021-11-16 10:37:22'),
  ('Maxwell','Grant','Ap #104-5334 Vel, Av.','lorem.eu@yahoo.edu','1-183-425-1547','2022-09-01 04:15:51'),
  ('Raymond','Morrow','Ap #858-2198 Eros St.','magna.praesent.interdum@protonmail.org','1-151-353-7793','2022-05-10 02:09:20'),
  ('Keiko','Malone','P.O. Box 983, 2794 Tortor. St.','venenatis.vel@icloud.ca','1-258-411-9518','2023-08-05 10:43:59'),
  ('Macaulay','Hatfield','Ap #398-6792 Commodo Street','natoque.penatibus@icloud.org','1-721-233-3915','2023-06-17 15:36:52'),
  ('Hillary','Mccarthy','542-5627 Cum Ave','luctus.lobortis.class@outlook.com','1-742-517-3871','2022-04-14 09:33:45'),
  ('Martha','Holder','661-2922 Varius St.','lectus.pede.ultrices@aol.net','1-698-346-3731','2022-03-05 17:02:31'),
  ('Kelsey','Nguyen','P.O. Box 633, 3179 Scelerisque Road','orci.luctus@hotmail.org','1-556-363-3237','2023-04-10 09:48:21'),
  ('Gil','Mckee','6203 Nibh. St.','feugiat.placerat@protonmail.edu','1-825-466-2779','2023-06-02 06:55:32');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Ori','Greer','P.O. Box 942, 4180 Ut St.','duis.a@yahoo.com','1-426-525-2627','2022-06-19 07:30:21'),
  ('Ursula','Raymond','Ap #242-3276 Ipsum. Rd.','eleifend@outlook.ca','1-216-835-3523','2023-10-20 23:51:37'),
  ('Zephania','Duran','893-7301 Nunc Rd.','duis.gravida@aol.com','1-213-687-8258','2023-04-15 17:23:44'),
  ('Jillian','Navarro','619 Eu, Av.','sed.eget@aol.com','1-320-535-2759','2022-08-09 10:14:26'),
  ('Randall','Meadows','1861 Turpis. Road','curae.phasellus@yahoo.ca','1-362-410-2182','2022-02-21 01:33:26'),
  ('Dolan','Lamb','773-8124 Vivamus Rd.','eget.lacus@hotmail.com','1-487-749-7138','2023-09-08 16:55:23'),
  ('Julian','Valencia','5549 Turpis Street','elementum.dui@outlook.net','1-326-890-6417','2022-10-15 06:51:47'),
  ('Stacey','Hansen','Ap #345-9781 Auctor Rd.','tortor.nunc.commodo@protonmail.couk','1-480-131-0411','2023-01-21 15:56:27'),
  ('Slade','Estrada','Ap #377-3890 Ultrices Avenue','nibh.sit@protonmail.com','1-741-127-5418','2022-04-02 00:58:51'),
  ('Roth','Reid','781-308 Amet, Rd.','nunc.ac@aol.ca','1-932-241-4299','2021-12-01 12:45:23');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Otto','O''connor','Ap #550-2302 Lectus Road','nisl.elementum@yahoo.edu','1-505-454-4782','2023-04-24 18:41:43'),
  ('Cadman','Herman','Ap #446-3334 Pretium St.','diam.proin@hotmail.net','1-431-356-5801','2022-06-24 21:19:38'),
  ('Rajah','Romero','832-4292 A St.','erat.sed@protonmail.edu','1-757-308-8330','2022-11-09 00:54:08'),
  ('Shad','Berger','196-1673 Accumsan Street','dolor@hotmail.couk','1-924-302-7731','2022-03-10 20:37:23'),
  ('Rajah','Ellison','7059 Lacinia Road','feugiat.placerat@hotmail.com','1-585-382-6769','2022-01-30 09:33:57'),
  ('Melodie','Chang','P.O. Box 324, 9966 Montes, St.','accumsan.neque.et@protonmail.net','1-633-634-7523','2023-08-06 02:37:01'),
  ('Brent','Hunt','P.O. Box 433, 7340 Eros Rd.','lorem.donec.elementum@protonmail.edu','1-846-962-4447','2023-10-21 13:07:36'),
  ('Unity','Mcintosh','P.O. Box 603, 8507 Sollicitudin Avenue','porttitor.eros@google.net','1-310-581-4366','2022-01-16 09:05:12'),
  ('Grant','Bennett','859-350 Feugiat Ave','dictum@outlook.couk','1-885-465-8814','2023-03-05 12:06:33'),
  ('September','Parsons','Ap #804-3367 Curabitur Street','porttitor.eros@hotmail.com','1-536-311-2760','2023-04-08 16:45:30');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Joy','Wright','P.O. Box 804, 7436 Amet Ave','diam.nunc.ullamcorper@google.ca','1-557-972-2493','2022-03-16 20:02:17'),
  ('Merrill','Chapman','634-1798 Aliquet Avenue','mollis.vitae.posuere@protonmail.edu','1-465-708-5463','2022-04-12 23:09:43'),
  ('Murphy','Cote','Ap #864-885 Vitae Ave','at@google.org','1-248-521-2482','2022-08-12 07:37:26'),
  ('Daria','Figueroa','Ap #376-2912 Elementum Avenue','elit.erat@yahoo.edu','1-974-538-6160','2022-10-24 09:00:26'),
  ('Acton','Rich','880-6580 Lorem, Ave','nibh.aliquam@icloud.com','1-466-611-4261','2022-04-23 09:34:35'),
  ('Constance','Campbell','P.O. Box 402, 252 Proin St.','aliquam.nec@aol.couk','1-828-463-0384','2022-06-29 20:51:37'),
  ('Iliana','Park','Ap #257-324 Arcu Av.','penatibus.et@aol.com','1-570-295-4865','2023-04-16 11:36:22'),
  ('Stacy','Mcdowell','Ap #232-5663 Ut Road','a.purus@outlook.org','1-970-451-5378','2022-02-08 21:46:19'),
  ('Grady','Jacobs','Ap #675-1370 Nisl Street','sed@google.net','1-405-511-8765','2022-10-08 08:32:58'),
  ('Flavia','William','692-9295 Mollis Rd.','eros.non.enim@aol.edu','1-839-343-7631','2022-12-14 22:57:24');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Brynne','Rosario','9204 Lorem Ave','dictum.sapien.aenean@yahoo.ca','1-553-871-3477','2023-10-05 20:24:13'),
  ('Candace','Rivers','P.O. Box 993, 6334 Malesuada Rd.','diam.sed@outlook.edu','1-539-518-2974','2023-07-02 11:36:47'),
  ('Isabella','Knight','415-9870 Odio, St.','lacus.vestibulum@icloud.com','1-463-637-6785','2023-07-01 02:06:22'),
  ('Price','Guzman','Ap #991-5177 Purus Ave','sit@yahoo.edu','1-686-867-3142','2023-07-26 08:02:14'),
  ('Rashad','Barton','607-443 Nunc Road','nibh.sit@icloud.couk','1-645-297-6585','2023-03-25 05:01:09'),
  ('Oliver','Gilliam','746-303 Elementum, Rd.','sollicitudin.commodo@icloud.com','1-344-443-4166','2022-09-14 23:10:30'),
  ('Emily','Wilson','5402 Cras Av.','aliquam@yahoo.com','1-154-361-2496','2022-04-19 06:03:31'),
  ('Dieter','Hughes','336-4552 Sed Rd.','ultrices.vivamus@yahoo.edu','1-361-834-1260','2022-12-08 15:12:13'),
  ('Sophia','Wheeler','1153 Eu, St.','nisl.elementum@aol.couk','1-633-323-5114','2023-03-19 12:59:24'),
  ('Jenna','Burch','Ap #471-3164 Ipsum St.','ante.nunc.mauris@outlook.com','1-469-391-2553','2023-06-09 04:50:35');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Amanda','Livingston','Ap #726-6253 Semper St.','duis.sit@protonmail.ca','1-529-113-3383','2023-03-03 04:38:50'),
  ('Valentine','Clements','Ap #317-280 Est Road','sed@aol.com','1-848-223-3675','2022-12-14 08:15:24'),
  ('Petra','Kramer','424-7564 Hendrerit Ave','mus.proin@hotmail.ca','1-151-627-6553','2023-06-29 23:22:38'),
  ('Ezekiel','Rodgers','7108 Integer Ave','a.nunc.in@google.com','1-555-959-7674','2022-01-11 16:34:48'),
  ('Martin','Bruce','P.O. Box 827, 2776 Luctus Road','vestibulum.accumsan@yahoo.org','1-337-473-2865','2023-10-22 13:55:12'),
  ('Maya','Burch','806-2842 Massa. Rd.','nulla.eu@hotmail.edu','1-743-367-9833','2023-05-18 15:28:51'),
  ('Acton','Love','5336 Ut Street','hymenaeos.mauris@google.couk','1-362-889-3414','2022-02-03 20:35:00'),
  ('Damon','Kelly','Ap #131-9437 Nulla. Road','eget.dictum@outlook.edu','1-247-212-7124','2021-12-15 07:04:37'),
  ('Destiny','Hubbard','P.O. Box 683, 2207 Lorem St.','nam.porttitor@google.com','1-449-513-8220','2022-08-01 12:32:28'),
  ('Velma','Dickson','Ap #450-8374 Integer Rd.','suscipit.nonummy.fusce@yahoo.org','1-223-515-2350','2023-09-25 09:02:46');
INSERT INTO users (first_name,last_name,address,email,phone,created_at)
VALUES
  ('Joshua','Morrow','364-7795 Convallis St.','cras@google.couk','1-356-115-1581','2021-12-08 22:44:02'),
  ('Ruth','Doyle','Ap #182-5047 Consequat Street','odio@outlook.ca','1-524-721-1884','2022-10-26 22:01:37'),
  ('Amy','Lowe','726-8178 At, Ave','mi.fringilla@google.net','1-523-118-7559','2022-03-30 12:34:07'),
  ('Marny','Sloan','469-7184 Libero St.','nulla.tincidunt@outlook.net','1-854-285-7546','2022-06-29 10:18:06'),
  ('Burton','Kim','Ap #197-548 Lacus Street','egestas@outlook.ca','1-429-514-3371','2023-01-19 02:03:07'),
  ('Alyssa','Irwin','964-5904 Nec, Rd.','justo.proin.non@yahoo.couk','1-657-160-4992','2021-11-14 20:41:27'),
  ('Cheyenne','Knight','213-2584 Posuere St.','ante.iaculis.nec@hotmail.com','1-647-420-6457','2022-08-14 13:10:11'),
  ('Hamish','Pate','P.O. Box 353, 5635 Sem. St.','etiam@aol.org','1-244-520-5208','2022-03-23 23:59:08'),
  ('Tatyana','Navarro','P.O. Box 524, 255 Vel, Ave','ac@google.net','1-735-221-8341','2022-10-12 00:56:13'),
  ('Hannah','Noel','628 Fringilla St.','magna.a.tortor@hotmail.org','1-710-732-8949','2023-08-05 19:50:22');
