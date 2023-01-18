
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