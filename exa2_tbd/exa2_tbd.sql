exa2_tbd

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c --mc root@localhost:3307;
Invalid URI: Illegal character [;] found at position 19
\connect [--mx|--mysqlx|--mc|--mysql] [--ssh <sshuri>] <URI>
 MySQL  SQL > \c --mc root@localhost:3307
Creating a Classic session to 'root@localhost:3307'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 13
Server version: 8.0.41 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3307 ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| northwind          |
| performance_schema |
| prueba             |
| prueba1            |
| sakila             |
| segurototal        |
| sys                |
| tarjeta            |
| tarjetas           |
| tbd_eva3           |
| tdb_eva1           |
| tdb_eva2           |
| world              |
+--------------------+
15 rows in set (0.0009 sec)
 MySQL  localhost:3307 ssl  SQL > create database exa2_tbd;
Query OK, 1 row affected (0.0128 sec)
 MySQL  localhost:3307 ssl  SQL > CREATE TABLE alumnos (
                               ->     id_alumno INT PRIMARY KEY AUTO_INCREMENT,
                               ->     nombre VARCHAR(100)
                               ->  carrera VARCHAR(50));
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'carrera VARCHAR(50))' at line 4
 MySQL  localhost:3307 ssl  SQL > CREATE TABLE alumnos (     id_alumno INT PRIMARY KEY AUTO_INCREMENT,     nombre VARCHAR(100) , carrera VARCHAR(50));
ERROR: 1046 (3D000): No database selected
 MySQL  localhost:3307 ssl  SQL > use exa2_tbd;
Default schema set to `exa2_tbd`.
Fetching global names, object names from `exa2_tbd` for auto-completion... Press ^C to stop.
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > CREATE TABLE alumnos (     id_alumno INT PRIMARY KEY AUTO_INCREMENT,     nombre VARCHAR(100) , carrera VARCHAR(50));
Query OK, 0 rows affected (0.0289 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > CREATE TABLE  (     id_curso INT PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(100) , creditos INT);
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(     id_curso INT PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(100) , creditos INT' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > CREATE TABLE  cursos ( id_curso INT PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(100) , creditos INT);
Query OK, 0 rows affected (0.0183 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > CREATE TABLE inscripciones (
                                         ->     id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
                                         ->     id_alumno INT,
                                         ->     id_curso INT,
                                         ->     fecha_inscripcion DATE,
                                         ->     FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
                                         ->     FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
                                         -> );
Query OK, 0 rows affected (0.0484 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO alumnos (nombre, carrera) value ( juan perez , sistemas),( francia hernandez , sistemas),( jesus ochoa , ing civil);
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'perez , sistemas),( francia hernandez , sistemas),( jesus ochoa , ing civil)' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO alumnos (nombre, carrera) values ( juan perez , sistemas),( francia hernandez , sistemas), ( jesus ochoa , ing civil);
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'perez , sistemas),( francia hernandez , sistemas), ( jesus ochoa , ing civil)' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO alumnos (nombre, carrera) VALUES
                                         -> ('Juan Pérez', 'Ingeniería en Sistemas'),
                                         -> ('Ana García', 'Administración'),
                                         -> ('Luis Torres', 'Contaduría');
Query OK, 3 rows affected (0.0114 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO cursos (nombre, creditos) VALUES
                                         -> ('Matemáticas', 6),
                                         -> ('Historia', 4),
                                         -> ('Programación', 5);
Query OK, 3 rows affected (0.0042 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO inscripciones (id_alumno, id_curso, fecha_inscripcion) VALUES
                                         -> (1, 1, '2025-01-15'),
                                         -> (1, 3, '2025-01-16'),
                                         -> (2, 2, '2025-01-17'),
                                         -> (3, 1, '2025-01-18'),
                                         -> (2, 3, '2025-01-19');
Query OK, 5 rows affected (0.0107 sec)

Records: 5  Duplicates: 0  Warnings: 0
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > SELECT
                                         ->     a.nombre AS nombre_alumno,
                                         ->     c.nombre AS nombre_curso,
                                         ->     i.fecha_inscripcion
                                         -> FROM inscripciones i
                                         -> JOIN alumnos a ON i.id_alumno = a.id_alumno
                                         -> JOIN cursos c ON i.id_curso = c.id_curso;
+---------------+--------------+-------------------+
| nombre_alumno | nombre_curso | fecha_inscripcion |
+---------------+--------------+-------------------+
| Juan Pérez    | Matemáticas  | 2025-01-15        |
| Juan Pérez    | Programación | 2025-01-16        |
| Ana García    | Historia     | 2025-01-17        |
| Ana García    | Programación | 2025-01-19        |
| Luis Torres   | Matemáticas  | 2025-01-18        |
+---------------+--------------+-------------------+
5 rows in set (0.0006 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > SELECT
                                         ->     c.nombre AS nombre_curso,
                                         ->     a.nombre AS nombre_alumno
                                         -> FROM cursos c
                                         -> LEFT JOIN inscripciones i ON c.id_curso = i.id_curso
                                         -> LEFT JOIN alumnos a ON i.id_alumno = a.id_alumno;
+--------------+---------------+
| nombre_curso | nombre_alumno |
+--------------+---------------+
| Matemáticas  | Juan Pérez    |
| Matemáticas  | Luis Torres   |
| Historia     | Ana García    |
| Programación | Juan Pérez    |
| Programación | Ana García    |
+--------------+---------------+
5 rows in set (0.0005 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > SELECT
                                         ->     a.nombre AS nombre_alumno,
                                         ->     c.nombre AS nombre_curso
                                         -> FROM alumnos a
                                         -> LEFT JOIN inscripciones i ON a.id_alumno = i.id_alumno
                                         -> LEFT JOIN cursos c ON i.id_curso = c.id_curso;
+---------------+--------------+
| nombre_alumno | nombre_curso |
+---------------+--------------+
| Juan Pérez    | Matemáticas  |
| Juan Pérez    | Programación |
| Ana García    | Historia     |
| Ana García    | Programación |
| Luis Torres   | Matemáticas  |
+---------------+--------------+
5 rows in set (0.0006 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > SELECT
                                         ->     a.nombre AS nombre_alumno,
                                         ->     COUNT(i.id_curso) AS numero_de_cursos
                                         -> FROM alumnos a
                                         -> LEFT JOIN inscripciones i ON a.id_alumno = i.id_alumno
                                         -> GROUP BY a.id_alumno, a.nombre;
+---------------+------------------+
| nombre_alumno | numero_de_cursos |
+---------------+------------------+
| Juan Pérez    |                2 |
| Ana García    |                2 |
| Luis Torres   |                1 |
+---------------+------------------+
3 rows in set (0.0086 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > SELECT
                                         ->     a.nombre AS nombre_alumno,
                                         ->     COUNT(i.id_curso) AS numero_de_cursos
                                         -> FROM alumnos a
                                         -> LEFT JOIN inscripciones i ON a.id_alumno = i.id_alumno
                                         -> GROUP BY a.id_alumno, a.nombre;
+---------------+------------------+
| nombre_alumno | numero_de_cursos |
+---------------+------------------+
| Juan Pérez    |                2 |
| Ana García    |                2 |
| Luis Torres   |                1 |
+---------------+------------------+
3 rows in set (0.0005 sec)
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > INSERT INTO inscripciones (id_alumno, id_curso, fecha_inscripcion)
                                         -> VALUES (99, 1, '2025-01-20');
ERROR: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`exa2_tbd`.`inscripciones`, CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`))
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > DELETE FROM alumno WHERE id_alumno = 1;
ERROR: 1146 (42S02): Table 'exa2_tbd.alumno' doesn't exist
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > DELETE FROM alumnos WHERE id_alumno = 1;
ERROR: 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`exa2_tbd`.`inscripciones`, CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_alumn ALTER TABLE inscripciones DROP CONSTRAINT inscripciones_ibfk_1inscripciones;
ERROR: 3940 (HY000): Constraint 'inscripciones_ibfk_1inscripciones' does not exist.INT inscripciones_ibfk_1inscripciones;
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > ALTER TABLE inscripciones DROP CONSTRAINT inscripciones_ibfk_1;
Query OK, 0 rows affected (0.0187 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > ALETER TABLE inscripciones add  FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
                                         -> FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)^C
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > ALTER TABLE inscripciones add FOREING KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE, FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON CASCADE ON DELETE;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE, FOREIGN KEY ' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > ALTER TABLE inscripciones add FOREING KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL > ALTER TABLE inscripciones add FOREING KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'KEY (id_alumno) REREFENCES alumnos(id_alumno) ON CASCADE ON DELETE' at line 1
 MySQL  localhost:3307 ssl  exa2_tbd  SQL >












