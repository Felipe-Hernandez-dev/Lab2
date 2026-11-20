SET SERVEROUTPUT ON
BEGIN
  SET TRANSACTION NAME 'trx_departments2';
  DBMS_OUTPUT.PUT_LINE('--- INICIO de la transaccion: ' || TO_CHAR(SYSDATE,'HH24:MI:SS'));

  INSERT INTO departments2 VALUES (274, 'Transaccion A', NULL, 1700);
  UPDATE departments2 SET department_name = 'Transaccion A (editado)' WHERE department_id = 274;
  DBMS_OUTPUT.PUT_LINE('Operaciones DML realizadas (sin confirmar todavia)');

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('--- FIN de la transaccion (COMMIT): ' || TO_CHAR(SYSDATE,'HH24:MI:SS'));
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('--- FIN con ROLLBACK por error: ' || SQLERRM);
END;
/
SELECT * FROM departments2 WHERE department_id = 274;