-- 1) Identificar las filas culpables (join entre exceptions y la tabla por ROWID)
SELECT x.constraint, e.employee_id, e.last_name, e.email, e.salary
FROM exceptions x JOIN employees e ON e.rowid = x.row_id
WHERE x.table_name = 'EMPLOYEES' ORDER BY 1, 2;

SELECT x.constraint, d.department_id, d.department_name, d.manager_id, d.location_id
FROM exceptions x JOIN departments d ON d.rowid = x.row_id
WHERE x.table_name = 'DEPARTMENTS' ORDER BY 1, 2;

-- 2) Limpiar: solo las filas de prueba
DELETE FROM employees   WHERE employee_id BETWEEN 300 AND 303;
DELETE FROM departments WHERE department_id IN (900, 901);
COMMIT;

-- 3) Reactivar las 9 restricciones pendientes
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_uk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_salary_min;
ALTER TABLE employees   ENABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE departments ENABLE CONSTRAINT dept_name_nn;
ALTER TABLE employees   ENABLE CONSTRAINT emp_manager_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_fk;
ALTER TABLE departments ENABLE CONSTRAINT dept_loc_fk;
ALTER TABLE departments ENABLE CONSTRAINT dept_mgr_fk;

-- 4) Verificación final
SELECT status, COUNT(*) AS restricciones
FROM user_constraints
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS','JOB_HISTORY')
GROUP BY status;

SELECT table_name, index_name, uniqueness
FROM user_indexes WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
ORDER BY table_name, index_name;

SELECT (SELECT COUNT(*) FROM employees) AS empleados,
       (SELECT COUNT(*) FROM departments) AS departamentos FROM dual;

-- 5) Limpiar la tabla auxiliar
DROP TABLE exceptions PURGE;