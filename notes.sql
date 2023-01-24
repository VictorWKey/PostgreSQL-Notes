
//* CREAR TABLA */
CREATE TABLE alumnos (
    numcontrol BIGINT,
    nombre VARCHAR(50),
    apellidopaterno(50),
    fechaingreso DATE,
    promedio DECIMAL(6, 2),
    tipoalumno CHARACTER(1)
);

/* INSERTAR VALORES */
INSERT INTO alumnos(numcontrol, nombre, fechaingreso, promedio) /* Si vas a insertar en todas columnas no es necesario lo del parentesis */
VALUES (1, "Victor", "Lopez", "2022/06/15", 9.5, "B"), (2, "Juan", "Hernandez" , "2022/06/16", 8.9, "A")


/* SELECT */
SELECT * FROM empleados
SELECT nombre, promedio FROM empleados WHERE promedio > 9 AND nombre = "Victor Lopez"

/* CONCATENAR COLUMNAS */
SELECT nombre || ' ' || apellidopaterno AS nombreyapellido, promedio FROM alumnos WHERE promedio > 8 /* Concatena columnas con un espacion */ 

/* BORRAR ENTIDADES */
DELETE FROM usuarios -- Borra todo los registros
DELETE FROM usuarios WHERE id = 35
DELETE FROM usuarios WHERE promedio > 90 BETWEEN promedio < 180

DROP TABLE alumnos, empleados -- Eliminar una o mas tablas. Si no existe da error
DROP TABLE IF EXISTS 

/* UPDATE */
UPDATE empleados SET nombre = "Victor Lopez", ciudad = "Irapuato" WHERE id = 42 -- Si no especificamos el WHERE, modifica todos

/* ORDER BY */
SELECT * FROM clientes ORDER BY idcliente DESC -- Por defecto es ASC

/* SELECT INDISTINCT */
SELECT DISTINCT totaldeuda FROM clientes ORDER BY totaldeuda DESC -- Con el DISTINCT evitamos registros con valores repetidos

/* GROUP BY */
SELECT sexo, COUNT(*) FROM personas GROUP BY sexo -- La funcion indicada se le aplicara a las columnas del GROUPBY y ademas mostraremos esa columna
SELECT sexo, MAX(*) FROM personas GROUP BY sexo
SELECT sexo, MIN(*) FROM personas GROUP BY sexo

SELECT nombreditorial, COUNT(*) FROM personas WHERE precio BETWEEN 100 AND 300 GROUP BY nombreditorial
SELECT nombreditorial, precio, COUNT(*) FROM personas WHERE precio BETWEEN 100 AND 300 GROUP BY nombreditorial, precio -- Se puede agrupar por una o mas variables

/* PRIMARY KEY */
CREATE TABLE alumnos (
    numcontrol BIGINT PRIMARY KEY,
    nombre VARCHAR(50)
)

/* INNER JOIN  */
SELECT orders.id, customers.name -- Seleccionamos los campos que se deben mostrar de las tablas que seleccionamos. En caso de que seleccionemos todo de las dos tablas y pongamos primero el customers en el FROM, primero se mostrara la tabla del FROM, osea la de customers, y luego la del INNER JOIN osea la de orders
FROM orders -- Seleccionamos la primera tabla que queremos unir
INNER JOIN customers -- Seleccionamos la segunda tabla que queremos unir. INNER JOIN indica que solo se mostrara las filas en las que el valor del campo "customer_id" en la tabla "orders" es igual al valor del campo "customer_id" en la tabla "customers".
ON orders.customer_id = customers.customer_id; -- Aqui indicamos sobre que campos se debe realizar la union de las dos tablas
-- En este caso, el id que su usa para unir en customers es una primary key, en cambio en el de orders, no se usa primary key, por lo tanto se puede repetir y asi un cliente tener varios pedidos
-- Recuerda que el id ademas de evitar que se repita una id, tambien evita que se repitan los datos con ese mismo id
-- La columna de orders que hace referencia al id del customer, puede repetirse y por lo tanto, podriamos agregarle a esa tabla, los datos de cada customer haciendo el inner join
-- **Lo que tienes que entender es que la primarykey no evita que hagamos inners, lo unico que evita es que en su tabla original se repitan los valores. ESO ES TODO LO QUE HACE. SOLO EN SU TABLA ORIGINAL.** En cambio si la combinamos con otra con inner, ahi si ya no importa si se repita o no, porque estamos uniendo dos tablas con sus columnas de id cada una. Y en este caso, la tabla orders necesita de los id de la tabla customers,

/* Tipos de relaciones */

-- Uno a uno: Un pasajero tiene solo un pasaporte y un pasaporte pertenece solo a un pasajero 
-- Uno a muchos: Un cliente puede tener muchos pedidos, y un pedido solo pertenece a un cliente
-- Mucho a muchos: Un alumno puede tener muchos profesores y un profesor puede tener muchos alumnos

CREATE TABLE estudiantes(
    idestudiantes INTEGER PRIMARY KEY,
    apellidos VARCHAR(45),
    nombre VARCHAR(45)
);

CREATE TABLE infoestudiantes(
    id_estudiante INTEGER PRIMARY KEY,
    ciudad VARCHAR(45),
    telefono VARCHAR(12),
    CONSTRAINT FK_id_estudiante 
    FOREIGN KEY (id_estudiante) -- La foreign key nos permite no añadir datos que no contenga el id contenido en la tabla y columna de referencia. Esto es un uno a uno debido a que los ids que se utilizan para unir son primarykey
    REFERENCES estudiantes(idestudiante)
);