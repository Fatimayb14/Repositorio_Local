use mascotasDB;
-- Consulta todas las personas
select * from personas;
-- Consulta todos los animales
select * from animales;
-- Consulta todos los tipos de animales
select * from animales;
-- Consulta todos los tipos de animales ordenados por nombre de manera ascendente
select * from  tipos_animales order by nombre Asc;
-- Consulta todos los animales cuyo tipo de animal sea 1 ordenado por nombre de manera ascendente y por raza descendente;
select * from animales 
where tipo_animal=1 
-- order by nombre ASC  order by raza desc;
-- Consulta todos los animales cuya edad sea menor que 3 ordena por peso;
-- select * from animales where edad <3;
-- Consulta todos los animales que hayan fallecido, ordena por fecha de defuncion descendente
-- select * from animales_fallecidos order by fecha desc;
-- Listar los nombres y edades de personas mayores de 30 años, ordenadas por nombre.
/* select nombre, edad
from personas
where edad >30
order by nombre;*/
-- Encontrar los NIF y direcciones de personas sin correo electrónico.
/*select NIF, direccion
from personas
where correo_electronico is null or correo_electronico = '';*/
/*select NIF, edad
from personas
where cp is NOT NULL;
-- Buscar personas que no tienen un segundo apellido definido, mostrar sus nombres y edades.
select nombre, edad
from personas
where segundo_apellido;

-- Busca todas las personas menores de 30 y muestra su nif, (nombre y apellido1) en una columna nombre_persona, edad. Ordena por el nombre_persona
 select  * from personas where edad <30 ('nombre', ' ' , 'apellido1') nombre_persona order by nombre_persona;

-- Busca todas las personas y muestra su nif, (nombre apellido1 apellido2) en una columna nombre_pesona, edad. Ordena por el nombre_persona
 select * from personas
-- Arregla la consulta para que no haya null en nombre de persona
select nombre from persona where nombre is not null;
-- Personas cuyo apellido1 empieza con 'G' y tienen más de 25 años
 select * from personas left (apellido1('G')) where edad >25;
-- Personas cuyo apellido1 termine con 'z'.
select * from personas where apellido1 '%z';
-- Personas cuyo correo sea de gmail.com
select * from personas where correo = gmail.com;
-- Pon en mayusculas el nombre de los animales. Solo los animales cuya edad sea 2 o 3. Muestra el nombre en mayuscula y la edad.
 select * from animales upper (where edad (2.3)) upper (nombre,' ', edad); -- ?
-- Buscar los nombres y edades de los animales cuyo tamaño sea 'mediano' y sexo sea 'F'.
select nombre, edad
from animales
where tamaño= mediano;

