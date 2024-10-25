-- Crear la base de datos
CREATE DATABASE bdalicorp;


-- Usar la base de datos
USE bdalicorp;

-- Tabla para almacenar información de clientes
CREATE TABLE cliente (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(255)
);

-- Tabla para almacenar información de empleados
CREATE TABLE empleado (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    cargo VARCHAR(50)
);

-- Tabla para almacenar información de productos
CREATE TABLE producto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE inventario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    producto_id BIGINT NOT NULL,
    cantidad INT NOT NULL,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES producto(id) ON DELETE CASCADE
);

-- Tabla para almacenar información de ventas
CREATE TABLE venta (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cliente_id BIGINT NOT NULL,
    empleado_id BIGINT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (empleado_id) REFERENCES empleado(id) ON DELETE CASCADE
);

-- Tabla para almacenar información de detalles de venta
CREATE TABLE detalle_venta (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    venta_id BIGINT NOT NULL,
    producto_id BIGINT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES venta(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES producto(id) ON DELETE CASCADE
);
select  * from cliente c



INSERT INTO producto (nombre, descripcion, precio) VALUES
('Aceite Vegetal', 'Aceite vegetal de alta calidad, ideal para cocinar.', 4.50),
('Salsa de Soja', 'Salsa de soja fermentada, perfecta para marinados.', 2.30),
('Harina de Trigo', 'Harina de trigo para repostería y panadería.', 1.20),
('Arroz Blanco', 'Arroz blanco de grano largo, ideal para acompañamientos.', 1.50),
('Azúcar', 'Azúcar refinada, ideal para endulzar tus comidas y bebidas.', 0.80),
('Galletas de Mantequilla', 'Galletas crujientes con sabor a mantequilla.', 3.00),
('Jugo de Naranja', 'Jugo natural de naranja, sin conservantes.', 1.80),
('Margarina', 'Margarina vegetal para untar y cocinar.', 2.00),
('Pasta Espagueti', 'Pasta de trigo duro, ideal para platillos italianos.', 1.70),
('Sopa Instantánea', 'Sopa instantánea de pollo, fácil de preparar.', 1.00);

INSERT INTO inventario (producto_id, cantidad) VALUES
(1, 100), -- Aceite Vegetal
(2, 200), -- Salsa de Soja
(3, 150), -- Harina de Trigo
(4, 80),  -- Arroz Blanco
(5, 300), -- Azúcar
(6, 50),  -- Galletas de Mantequilla
(7, 120), -- Jugo de Naranja
(8, 60),  -- Margarina
(9, 90),  -- Pasta Espagueti
(10, 70); -- Sopa Instantánea

INSERT INTO cliente (nombre, email, telefono, direccion) VALUES
('Luis Saldana', 'ls.saldana25@gmail.com', '555-0123', 'Av. Principal 123, Ciudad'),
('jose López', 'Jose.lopez@gmail.com', '555-0456', 'Calle Secundaria 456, Ciudad'),
('Adrian García', 'adrian.garcia@gmail.com', '555-0789', 'Calle Tercera 789, Ciudad'),
('Mary Martínez', 'mary.martinez@gmail.com', '555-1011', 'Av. Cuarta 1011, Ciudad'),
('Luis Fernández', 'luis.fernandez@gmail.com', '555-1213', 'Calle Quinta 1213, Ciudad');

INSERT INTO empleado (nombre, email, telefono, cargo) VALUES
('Pedro Sánchez', 'pedro.sanchez@example.com', '555-1415', 'Cajero'),
('Lucía Ramírez', 'lucia.ramirez@example.com', '555-1617', 'Gerente'),
('Fernando Torres', 'fernando.torres@example.com', '555-1819', 'Cajero'),
('Sofía Díaz', 'sofia.diaz@example.com', '555-2021', 'Asistente'),
('Diego Morales', 'diego.morales@example.com', '555-2223', 'Supervisor');