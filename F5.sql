-- B.1 Duplicar la tabla
CREATE TABLE departments2 AS SELECT * FROM departments;
SELECT COUNT(*) AS filas FROM departments2;

-- ¿Qué se copió realmente?
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name = 'DEPARTMENTS2';
SELECT index_name FROM user_indexes WHERE table_name = 'DEPARTMENTS2';

-- B.2 Insertar tres filas (sin COMMIT)
INSERT INTO departments2 VALUES (271, 'Prueba A', NULL, 1700);
INSERT INTO departments2 VALUES (272, 'Prueba B', NULL, 1700);
INSERT INTO departments2 VALUES (273, 'Prueba C', NULL, 1700);

SELECT COUNT(*) AS filas_en_mi_sesion FROM departments2;