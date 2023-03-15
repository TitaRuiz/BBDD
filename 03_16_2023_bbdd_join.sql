SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE if not exists LigaA(
	nombre varchar(20)
);
CREATE TABLE if not exists LigaB(
	nombre varchar(20)
);

INSERT into LigaA (nombre) VALUES ('Ana');
INSERT into LigaA (nombre) VALUES ('Pedro');
INSERT into LigaA (nombre) VALUES ('Luis');
INSERT into LigaA (nombre) VALUES ('Pilar');
INSERT into LigaA (nombre) VALUES ('Ramiro');

INSERT into LigaB (nombre) VALUES (N'Juan');
INSERT into LigaB (nombre) VALUES (N'Laura');
INSERT into LigaB (nombre) VALUES (N'Luis');
INSERT into LigaB (nombre) VALUES (N'Pilar');


