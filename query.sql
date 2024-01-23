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
    passwor varchar(30) not null, 
    unique index 'email_unique' ('email' asc)
); 

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