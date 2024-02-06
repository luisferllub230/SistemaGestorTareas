CREATE DATABASE gestorTareas;

use gestorTareas;


-- user table
create table usuarios(
    id integer primary key not null AUTO_INCREMENT,
    estado varchar(255) not null,
    nombre varchar(255) not null,
    imagen  MEDIUMBLOB,
    nombre_usuario varchar(255) not null,
    correo varchar(100) not null,
    password varchar(30) not null, 
    unique index 'email_unique' (correo asc)
);

Insert into usuarios (estado, nombre, imagen, nombre_usuario, correo, password) 
VALUES
('Active', 'John Smith', NULL, 'john_smith', 'john.smith@example.com', 'securepass123'),
('Active', 'Jane Doe', NULL, 'jane_doe', 'jane.doe@example.com', 'password456'),

INSERT INTO usuarios (estado, nombre, imagen, nombre_usuario, correo, password)
SELECT 
    'Active' as estado,
    CONCAT('Jane Doe', id) as nombre,
    NULL as imagen,
    CONCAT('jane_doe', id) as nombre_usuario,
    CONCAT('jane.doe', id, '@example.com') as correo,
    CONCAT('password456', id, '__password') as password
FROM usuarios
LIMIT 50;

-- usuarios_tareas 
create table usuarios_tareas (
    usuarios_id int,
    tareas_id int,
    primary key (usuarios_id, tareas_id),
    FOREIGN KEY (usuarios_id) references usuarios(id),
    FOREIGN KEY (tareas_id) references tareas(id)
);


-- task table
create table tareas (
    id integer primary key not null AUTO_INCREMENT,
    estado varchar(255),
    nombre varchar(255) null,
    imagen  MEDIUMBLOB,
    fecha_inicio date not null,
    fecha_cierre date not null 
);
