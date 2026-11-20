INSERT INTO departments2 VALUES (281, 'Antes del savepoint', NULL, 1700);
SAVEPOINT punto1;
INSERT INTO departments2 VALUES (282, 'Despues del savepoint', NULL, 1700);
SELECT department_id, department_name FROM departments2 WHERE department_id IN (281, 282) ORDER BY 1;
ROLLBACK TO SAVEPOINT punto1;
SELECT department_id, department_name FROM departments2 WHERE department_id IN (281, 282) ORDER BY 1;
ROLLBACK;