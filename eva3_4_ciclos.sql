MySQL Shell 8.0.41

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c --mc root@localhost_3307
Creating a Classic session to 'root@localhost_3307'
Please provide the password for 'root@localhost_3307':
MySQL Error 2005 (HY000): Unknown MySQL server host 'localhost_3307' (11001)
 MySQL  SQL > \c --mc root@localhost:3307
Creating a Classic session to 'root@localhost:3307'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 11
Server version: 8.0.41 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3307 ssl  SQL > use tdb_eva3;
MySQL Error 1049: Unknown database 'tdb_eva3'
 MySQL  localhost:3307 ssl  SQL > use tbd_eva3;
Default schema set to `tbd_eva3`.
Fetching global names, object names from `tbd_eva3` for auto-completion... Press ^C to stop.
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select sumatoria(6);
ERROR: 1305 (42000): FUNCTION tbd_eva3.sumatoria does not exist
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select simartoria(5);
ERROR: 1054 (42S22): Unknown column 'cont' in 'field list'
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > drop function simatoria;
ERROR: 1305 (42000): FUNCTION tbd_eva3.simatoria does not exist
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > drop function simartoria;
Query OK, 0 rows affected (0.0287 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select sumatoria(6);
ERROR: 1054 (42S22): Unknown column 'cont' in 'field list'
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > drop function sumatoria;
Query OK, 0 rows affected (0.0170 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select sumatoria(6);
+--------------+
| sumatoria(6) |
+--------------+
|           21 |
+--------------+
1 row in set (0.0021 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select sumas(6);
+----------+
| sumas(6) |
+----------+
|       21 |
+----------+
1 row in set (0.0024 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select  suma_repeat(6);
+----------------+
| suma_repeat(6) |
+----------------+
|             21 |
+----------------+
1 row in set (0.0025 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select  es_bisiesto(1900);
+-------------------+
| es_bisiesto(1900) |
+-------------------+
| no bisiesto       |
+-------------------+
1 row in set (0.0030 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL > select  es_bisiesto(2000);
+-------------------+
| es_bisiesto(2000) |
+-------------------+
| bisiesto          |
+-------------------+
1 row in set (0.0012 sec)
 MySQL  localhost:3307 ssl  tbd_eva3  SQL >