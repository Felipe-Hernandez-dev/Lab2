SELECT USER AS usuario, SYS_CONTEXT('USERENV','CON_NAME') AS pdb FROM dual;
SELECT COUNT(*) AS empleados FROM employees;
SELECT COUNT(*) AS departamentos FROM departments;
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
ORDER BY table_name, constraint_type;