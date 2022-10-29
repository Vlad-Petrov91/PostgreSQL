CREATE TABLE "payment_methods" (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  description TEXT default NULL,
  requisites varchar(34)
);

INSERT INTO payment_methods (name,description,requisites)
VALUES
  ('Ut PC','placerat velit. Quisque varius. Nam porttitor scelerisque','DK1955871054467068'),
  ('Ante Inc.','vitae purus gravida sagittis. Duis gravida. Praesent','CR3072862735441328678'),
  ('Eget Metus Consulting','convallis in, cursus et, eros. Proin ultrices.','AZ67158325534457145206935937'),
  ('Ut LLC','magnis dis parturient montes, nascetur ridiculus mus.','GT71181676298574475371133457'),
  ('Elit Corporation','Curabitur dictum. Phasellus in felis. Nulla tempor','MT09AJRY26347212294010964690238'),
  ('Aliquet Libero Ltd','tincidunt, neque vitae semper egestas, urna justo','RO31QYXB7672075834248059'),
  ('Commodo At Institute','ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing','FR7550983227023389568122351'),
  ('Ultrices Inc.','pellentesque, tellus sem mollis dui, in sodales','DE96548788712962695404'),
  ('Taciti Sociosqu Corporation','eu, accumsan sed, facilisis vitae, orci. Phasellus','PL89673765668590825752418648'),
  ('Egestas Company','orci sem eget massa. Suspendisse eleifend. Cras','ES5750841214874345436783');
