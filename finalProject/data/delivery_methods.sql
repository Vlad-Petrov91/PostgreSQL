CREATE TABLE "delivery_methods" (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  description TEXT default NULL
);

INSERT INTO delivery_methods (name,description)
VALUES
  ('Hendrerit Id Ante Ltd','id nunc interdum feugiat. Sed nec metus'),
  ('Elit Nulla Foundation','Suspendisse dui. Fusce diam nunc, ullamcorper eu,'),
  ('Magnis Dis Parturient Consulting','in lobortis tellus justo sit amet nulla.'),
  ('Eleifend Egestas Ltd','convallis ligula. Donec luctus aliquet odio. Etiam'),
  ('Massa Mauris Vestibulum PC','ligula. Nullam enim. Sed nulla ante, iaculis'),
  ('Nec Mollis Vitae Associates','placerat, augue. Sed molestie. Sed id risus'),
  ('Eget Nisi Associates','pharetra. Quisque ac libero nec ligula consectetuer'),
  ('Nascetur Ridiculus Incorporated','elementum sem, vitae aliquam eros turpis non'),
  ('Amet Diam Eu LLC','libero at auctor ullamcorper, nisl arcu iaculis'),
  ('Commodo Hendrerit Company','tellus, imperdiet non, vestibulum nec, euismod in,');
