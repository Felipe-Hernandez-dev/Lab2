INSERT INTO departments2 VALUES (271, 'Prueba A', NULL, 1700);
INSERT INTO departments2 VALUES (272, 'Prueba B', NULL, 1700);
INSERT INTO departments2 VALUES (273, 'Prueba C', NULL, 1700);
COMMIT;
SELECT COUNT(*) AS filas_antes_de_cerrar FROM departments2;