SELECT COUNT(*) AS filas_inicio FROM departments2;

-- Transacción que vamos a deshacer: INSERT + UPDATE + DELETE
INSERT INTO departments2 VALUES (280, 'Se deshace', NULL, 1700);
UPDATE departments2 SET department_name = 'MODIFICADO' WHERE department_id = 271;
DELETE FROM departments2 WHERE department_id = 272;
SELECT * FROM departments2 WHERE department_id IN (271, 272, 280) ORDER BY 1;

ROLLBACK;
SELECT * FROM departments2 WHERE department_id IN (271, 272, 280) ORDER BY 1;
SELECT COUNT(*) AS filas_final FROM departments2;

-- Rollback parcial con SAVEPOINT
INSERT INTO departments2 VALUES (281, 'Antes del savepoint', NULL, 1700);
SAVEPOINT punto1;
INSERT INTO departments2 VALUES (282, 'Despues del savepoint', NULL, 1700);
ROLLBACK TO SAVEPOINT punto1;
SELECT * FROM departments2 WHERE department_id IN (281, 282) ORDER BY 1;
ROLLBACK;
SELECT COUNT(*) AS filas_cierre FROM departments2;