
CREATE TABLE IF NOT EXISTS envios(
id_envio SERIAL PRIMARY KEY,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
id_proveedor INT NOT NULL,
fecha_envio DATE NOT NULL,
estado VARCHAR(40) NOT NULL,
total INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS clientes(
id_cliente SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
direccion VARCHAR(300) NOT NULL,
telefono VARCHAR(20) UNIQUE NOT NULL,
pais VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados(
id_empleado SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
cargo VARCHAR(100) NOT NULL,
email VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS proveedores(
id_proveedor SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
contacto VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
direccion VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS detalles_envios(
id_detalle SERIAL PRIMARY KEY,
id_envio INT NOT NULL,
producto VARCHAR(50) NOT NULL,
cantidad INT NOT NULL,
precio_unitario FLOAT NOT NULL,
FOREIGN KEY (id_envio) REFERENCES envios(id_envio) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS regiones(
id_region SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
pais VARCHAR(100) NOT NULL
);

-- Inserta al menos **10 clientes** en la tabla `Clientes`.
INSERT INTO clientes (nombre, email, direccion, telefono, pais)   --NO se pone el id porque es serial y es auto incremental (se crea sola yendo ascendente)
VALUES ('Lola', 'lola@gmail.com', 'calle Arturo Soria 28, Madrid','123456789', 'Espania'),
('Juana', 'juanadearco@gmail.com', 'calle Vicento Soria 78, Madrid','234567891', 'Espania'),
('Andrea', 'andrea@gmail.com', 'calle Alcon 56, Soria','345678912', 'Espania'),
('Pedro', 'pedro@outlook.com', 'calle Gran Vía 34, Barcelona','4567891234', 'España'),
('Lucía', 'lucia@gmail.com', 'calle Alcalá 32, Madrid','5678912345', 'España'),
('Ricardo', 'ricardo@gmail.com', 'paseo de la Castellana 89, Madrid','678901234', 'España'),
('Laura', 'laura@gmail.com', 'calle Goya 101, Madrid','789123456', 'España'),
('Miguel', 'miguel@gmail.com', 'calle Diego de León 4, Alcobendas','891234567', 'España'),
('Isabel', 'isabel@gmail.com', 'calle Príncipe de Vergara 58, Madrid','912345678', 'España'),
('Fernando', 'fernando@gmail.com', 'calle López de Hoyos 75, Alcorcon','012345678', 'España');

-- Inserta al menos **5 empleados** en la tabla `Empleados`.
INSERT INTO empleados (nombre, cargo, email)
VALUES ('Ana Gómez', 'Gerente de Marketing', 'ana.gomez@empresa.com'),
('Luis Martínez', 'Desarrollador Web', 'luis.martinez@empresa.com'),
('Sara López', 'Analista de Datos', 'sara.lopez@empresa.com'),
('Javier Rodríguez', 'Director de Finanzas', 'javier.rodriguez@empresa.com'),
('Elena Fernández', 'Recursos Humanos', 'elena.fernandez@empresa.com');

-- Inserta al menos **3 proveedores** en la tabla `Proveedores`.
INSERT INTO proveedores (nombre, contacto, telefono, direccion)
VALUES ('ITO', 'Jeancha', '0034611178497', 'calle Arturo Soria 23'),
('Distribuciones Globales S.A.', 'Juan López', '666 123 456', 'Calle Mayor 5, Barcelona'),
('Servicios Tecnológicos SL', 'Ana Martínez', '677 234 567', 'Avenida de la Constitución 10, Sevilla'),
('Suministros y Logística S.L.', 'María Fernández', '688 345 678', 'Plaza del Sol 23, Valencia'),
('Materiales Industriales S.A.', 'Carlos García', '699 456 789', 'Calle Oporto 11, Málaga'),
('Transportes Nacionales SL', 'Laura Rodríguez', '611 567 890', 'Paseo de la Castellana 55, Madrid');
-- Inserta al menos **8 envíos** en la tabla `Envíos`, asignando envíos a los clientes, empleados y proveedores registrados.
INSERT INTO envios (id_cliente , id_empleado, id_proveedor , fecha_envio, estado, total )
VALUES (11, 2, 3, '2024-10-15', 'En tránsito', 150.75),
(20, 1, 4, '2024-10-16', 'Entregado', 200.00),
(13, 3, 12, '2024-10-17', 'Pendiente', 350.50),
(14, 4, 5, '2024-10-18', 'En tránsito', 420.00),
(11, 1, 3, '2024-10-19', 'Cancelado', 100.00),
(15, 3, 4, '2024-10-20', 'Entregado', 250.25),
(12, 2, 5, '2024-10-21', 'En tránsito', 175.75),
(14, 5, 2, '2024-10-22', 'Pendiente', 310.00),
(13, 2, 8, '2024-10-23', 'En tránsito', 275.50),
(15, 3, 3, '2024-10-24', 'Entregado', 400.00);
SELECT * FROM envios e 
-- Inserta los detalles correspondientes en la tabla `Detalle de Envíos`, asegurando que las cantidades y precios unitarios sean consistentes con los productos y los envíos.
INSERT INTO detalles_envios (id_envio, producto, cantidad, precio_unitario)
VALUES (51, 'Laptop Dell XPS', 2, 750.00),
(51, 'Mouse inalámbrico', 5, 25.00),
(52, 'Monitor Samsung', 3, 200.00),
(53, 'Teclado Mecánico', 4, 60.00),
(53, 'Silla ergonómica', 1, 150.00),
(54, 'Impresora HP', 2, 120.00),
(55, 'Router Wi-Fi', 3, 50.00),
(60, 'Cable HDMI', 10, 12.00),
(57, 'Proyector Epson', 1, 400.00),
(58, 'SSD Kingston 1TB', 4, 100.00),
(59, 'Smartphone Samsung Galaxy', 2, 600.00),
(60, 'Auriculares Bluetooth', 6, 45.00);
-- Inserta al menos **5 regiones** en la tabla `Regiones`.
INSERT INTO regiones (nombre, pais)
VALUES ('Madrid', 'Espania'),
('Cataluña', 'España'),
('Baviera', 'Alemania'),
('Lombardía', 'Italia'),
('Andalucia', 'Espania'),
('Asturias', 'Espania');
SELECT * FROM clientes c 
--3)
--1. Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 53` a "Entregado".
UPDATE envios 
SET estado = 'Entregado'
WHERE id_envio = 53;

--2. Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".
UPDATE empleados	 
SET cargo = 'Director de datos'
WHERE id_empleado = 5;
--3. Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.
UPDATE detalles_envios 
SET precio_unitario = precio_unitario * 1.10
WHERE producto = 'Laptop Dell XPS';
--4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".
UPDATE clientes 
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente = 12;
--5. Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 4` al proveedor con `id_proveedor = 3`.
UPDATE envios 
SET id_proveedor = 3
WHERE id_envio = 54;
--6. Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.
UPDATE detalles_envios e 
SET cantidad = 5
WHERE id_envio = 52;
--7. Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 5` en 50 unidades monetarias.
UPDATE envios 
SET total = total + 50
WHERE id_envio = 55;
--8. Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".
UPDATE envios 
SET id_proveedor = 3
WHERE id_envio = 54;
--9. Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".
UPDATE clientes 
SET pais = 'Portugal'
WHERE id_cliente = 16;
--10. Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10"
UPDATE envios 
SET fecha_envio = '2024-08-10'
WHERE id_envio = 57;

--4)
--1. Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.
ALTER TABLE clientes            
ADD COLUMN fecha_nacimiento DATE;
--2. Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.
ALTER TABLE proveedores            
ADD COLUMN codigo_postal VARCHAR(10);
--3. Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.
ALTER TABLE proveedores            
DROP COLUMN contacto;
--4. Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.
ALTER TABLE regiones            
DROP COLUMN pais;
--5. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`.
ALTER TABLE clientes            
ALTER COLUMN telefono TYPE VARCHAR(15);
--6. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.
ALTER TABLE envios            
ALTER COLUMN total TYPE NUMERIC(12, 2);
--7. Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.
ALTER TABLE empleados            
ADD COLUMN fecha_contrato DATE;
--8. Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.
ALTER TABLE envios            
DROP COLUMN estado;
--9. Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.
ALTER TABLE empleados            
RENAME COLUMN nombre TO nombre_completo;

--5)
--1. Listar todos los clientes que viven en España.
SELECT nombre 
FROM clientes 
WHERE pais = 'España'
--2. Obtener todos los envíos realizados por un empleado específico.
SELECT * 
FROM envios 
WHERE id_empleado = 3
--3. Listar todos los productos incluidos en un envío específico.
SELECT producto 
FROM detalles_envios 
WHERE id_envio = 53
--4. Encontrar todos los proveedores con un teléfono específico.
SELECT * 
FROM proveedores 
WHERE telefono = '677 234 567'
--5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".
SELECT nombre_completo 
FROM empleados 
WHERE cargo = 'Supervisor de Envíos'
--6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
SELECT * 
FROM envios 
WHERE id_cliente = 15
--7. Listar todas las regiones con su nombre y país.
SELECT nombre 
FROM regiones 
--8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.
SELECT producto 
FROM detalles_envios 
WHERE precio_unitario > 50
--9. Obtener todos los envíos realizados el 2024-08-05.
SELECT * 
FROM envios 
WHERE fecha_envio = '2024-08-05'
--10. Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
SELECT id_cliente 
FROM clientes 
WHERE telefono LIKE '6003%'    -lo he hecho con otro númeor primero para comprobar que funcionaba


