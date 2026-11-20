-- Tabla donde Oracle anota las filas que impiden activar cada restricción
CREATE TABLE exceptions (row_id ROWID, owner VARCHAR2(128),
                         table_name VARCHAR2(128), constraint VARCHAR2(128));

-- 1) PK y UNIQUE
ALTER TABLE employees   ENABLE CONSTRAINT emp_emp_id_pk  EXCEPTIONS INTO exceptions;
ALTER TABLE departments ENABLE CONSTRAINT dept_id_pk     EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_uk   EXCEPTIONS INTO exceptions;

-- 2) CHECK y NOT NULL
ALTER TABLE employees   ENABLE CONSTRAINT emp_salary_min    EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_last_name_nn  EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_email_nn      EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_hire_date_nn  EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_nn        EXCEPTIONS INTO exceptions;
ALTER TABLE departments ENABLE CONSTRAINT dept_name_nn      EXCEPTIONS INTO exceptions;

-- 3) FK
ALTER TABLE employees   ENABLE CONSTRAINT emp_manager_fk EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_dept_fk    EXCEPTIONS INTO exceptions;
ALTER TABLE employees   ENABLE CONSTRAINT emp_job_fk     EXCEPTIONS INTO exceptions;
ALTER TABLE departments ENABLE CONSTRAINT dept_loc_fk    EXCEPTIONS INTO exceptions;
ALTER TABLE departments ENABLE CONSTRAINT dept_mgr_fk    EXCEPTIONS INTO exceptions;
ALTER TABLE job_history ENABLE CONSTRAINT jhist_emp_fk   EXCEPTIONS INTO exceptions;
ALTER TABLE job_history ENABLE CONSTRAINT jhist_dept_fk  EXCEPTIONS INTO exceptions;

-- Qué restricciones fallaron y cuántas filas las violan
SELECT constraint, table_name, COUNT(*) AS filas_culpables
FROM exceptions GROUP BY constraint, table_name ORDER BY 2, 1;

-- Estado actual
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS','JOB_HISTORY')
ORDER BY status, table_name, constraint_type;