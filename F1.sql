-- Índices existentes
SELECT table_name, index_name, index_type, uniqueness
FROM user_indexes
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
ORDER BY table_name, index_name;

-- Columnas que cubre cada índice
SELECT table_name, index_name, column_name, column_position
FROM user_ind_columns
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
ORDER BY table_name, index_name, column_position;

-- Qué restricción originó cada índice
SELECT table_name, constraint_name, constraint_type, index_name
FROM user_constraints
WHERE table_name IN ('EMPLOYEES','DEPARTMENTS')
  AND index_name IS NOT NULL
ORDER BY table_name;