-- employees: una violación por fila
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300, 'Prueba', 'Uno', 'SKING', SYSDATE, 'IT_PROG', 5000);        -- UNIQUE: email repetido

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (301, 'Prueba', 'Dos', 'TEST301', SYSDATE, 'IT_PROG', -500);      -- CHECK: salario negativo

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (302, 'Prueba', NULL, 'TEST302', SYSDATE, 'IT_PROG', 5000);       -- NOT NULL: last_name

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary, manager_id, department_id)
VALUES (303, 'Prueba', 'Cuatro', 'TEST303', SYSDATE, 'XX_JOB', 5000, 9999, 999);  -- FK: job, manager, depto

-- departments
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (900, NULL, NULL, 1700);                                           -- NOT NULL: department_name

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (901, 'Prueba FK', 9999, 9999);                                    -- FK: manager y location

-- Verificación
SELECT employee_id, last_name, email, salary, job_id, manager_id, department_id
FROM employees WHERE employee_id BETWEEN 300 AND 303 ORDER BY 1;

SELECT * FROM departments WHERE department_id IN (900, 901) ORDER BY 1;