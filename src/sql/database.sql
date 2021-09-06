CREATE DATABASE libreria;
USE libreria;

CREATE TABLE publicaciones(
    IDlibro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descripcion TEXT,
    fecha DATE
);

INSERT INTO publicaciones(titulo,descripcion,fecha) VALUES('el principito','habla del principito',CURDATE());

DELIMITER $$
CREATE PROCEDURE dataget()
BEGIN
    SELECT IDlibro,titulo,descripcion,SUBSTRING(fecha, 1, 10)as fecha FROM publicaciones;
END$$ 

DELIMITER $$
CREATE PROCEDURE datainsert(IN titulo VARCHAR(100),IN descripcion TEXT)
BEGIN
    INSERT INTO publicaciones(titulo,descripcion,fecha) VALUES(titulo,descripcion,CURDATE());
END$$ 

DELIMITER $$
CREATE PROCEDURE dataupdate(IN titulo VARCHAR(100),IN descripcion TEXT,IN IDlib INT)
BEGIN
	UPDATE publicaciones SET titulo=titulo, descripcion=descripcion WHERE IDlibro=IDlib;
END$$ 

DELIMITER $$
CREATE PROCEDURE datadelete(IN IDlib INT)
BEGIN
    DELETE FROM publicaciones WHERE IDlibro=IDlib;
END$$ 