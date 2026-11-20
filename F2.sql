-- 1) FKs primero (las que dependen de otras)
ALTER TABLE departments DISABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE departments DISABLE CONSTRAINT dept_loc_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees   DISABLE CONSTRAINT emp_manager_fk;

-- 2) PK y UNIQUE (CASCADE por si otra tabla, como job_history, las referencia)
ALTER TABLE employees   DISABLE CONSTRAINT emp_emp_id_pk CASCADE;
ALTER TABLE departments DISABLE CONSTRAINT dept_id_pk CASCADE;
ALTER TABLE employees   DISABLE CONSTRAINT emp_email_uk;

-- 3) CHECK y NOT NULL
ALTER TABLE employees   DISABLE CONSTRAINT emp_salary_min;
ALTER TABLE employees   DISABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees   DISABLE CONSTRAINT emp_job_nn;
ALTER TABLE departments DISABLE CONSTRAINT dept_name_nn;

-- Verificación: estado de restricciones (incluye job_history por el CASCADE)
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS','JOB_HISTORY')
ORDER BY table_name, constraint_type;

-- Verificación: ¿qué pasó con los índices?
SELECT table_name, index_name, uniqueness
FROM user_indexes
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
ORDER BY table_name, index_name;