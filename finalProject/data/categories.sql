CREATE TABLE "categories" (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  description TEXT default NULL
);

INSERT INTO categories (name,description)
VALUES
  ('Tempus Lorem Fringilla Corporation','magna. Praesent interdum'),
  ('Molestie Pharetra Nibh Ltd','Nunc ut erat. Sed nunc est, mollis non,'),
  ('Amet Ornare Lectus Institute','taciti'),
  ('Convallis Ligula Limited','et magnis dis parturient montes,'),
  ('Cras Limited','porttitor vulputate, posuere vulputate, lacus.'),
  ('Et Magnis Dis Ltd','tellus. Suspendisse sed dolor.'),
  ('Aenean Eget Magna Associates','dictum ultricies ligula. Nullam'),
  ('Quisque Industries','Phasellus in felis. Nulla tempor augue ac'),
  ('In Institute','nisi magna sed dui. Fusce aliquam, enim nec'),
  ('Non Quam Corporation','interdum. Sed auctor odio a purus. Duis elementum, dui quis');
INSERT INTO categories (name,description)
VALUES
  ('Quam Curabitur Corporation','sociosqu ad litora torquent per'),
  ('Sed Sem Associates','vitae, aliquet nec, imperdiet'),
  ('Aliquet Diam Incorporated','Integer vitae nibh. Donec est mauris, rhoncus id,'),
  ('In Industries','orci. Ut'),
  ('Feugiat Metus Ltd','fames ac turpis'),
  ('Dolor Sit Amet Foundation','in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula'),
  ('Ad Foundation','aliquam iaculis, lacus pede'),
  ('Rutrum PC','eros non enim commodo'),
  ('Praesent Industries','a ultricies adipiscing, enim mi tempor lorem, eget mollis'),
  ('Velit Industries','non, sollicitudin a, malesuada id,');
INSERT INTO categories (name,description)
VALUES
  ('Dis Parturient Ltd','tincidunt dui augue eu tellus. Phasellus elit'),
  ('Aliquam Adipiscing Incorporated','gravida sit amet, dapibus id, blandit'),
  ('Ante Vivamus Inc.','nascetur ridiculus mus. Donec dignissim magna a'),
  ('Odio Semper Incorporated','fringilla ornare placerat, orci lacus vestibulum lorem, sit amet'),
  ('Pellentesque A Limited','arcu. Morbi sit amet massa.');
