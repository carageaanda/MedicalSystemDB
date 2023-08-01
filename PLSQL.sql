-- Exercitiul 8: Crearea unui tabel de mesaje

CREATE TABLE MESAJE (
message_id NUMBER PRIMARY KEY,
message VARCHAR(255),
message_type VARCHAR2(1) CHECK (message_type IN ('E', 'W', 'I')),
created_by VARCHAR2(40) NOT NULL,
created_at DATE NOT NULL
);


-- Exercitiul 9: 
-- •	Subprogram stocat independent(inclusiv apelare) care să utilizeze 2 tipuri de colecție învățate
--- Prin intermediul acestei proceduri sunt afișate, pentru fiecare asigurare, pacienții care o au și numărul de programări pe care îl are fiecare. Pentru afișarea datelor, a fost necesară folosirea a două tablouri imbricate, în cadrul cărora au fost stocate id-ul și numele asigurării, iar în cadrul tabloului indexat au fost stocate informații despre pacienți, precum: id-ul pacientului, numele și id-ul asigurării.



CREATE OR REPLACE PROCEDURE proc2 IS
    TYPE tab_imb_id_asig IS TABLE OF ASIGURARE.id_asigurare%TYPE;
    t_id_asig tab_imb_id_asig := tab_imb_id_asig();

    TYPE tab_imb_det_asiginfo IS TABLE OF ASIGURARE.asigurare_info%TYPE;
    t_det_asiginfo tab_imb_det_asiginfo := tab_imb_det_asiginfo();

    TYPE pacienti_inreg IS RECORD
        (id_pacient PACIENTI.id_pacient%TYPE,
        nume_pacient PACIENTI.nume_pacient%TYPE,
        id_asigurare ASIGURARE.id_asigurare%TYPE);

    TYPE tab_pacienti IS TABLE OF pacienti_inreg INDEX BY BINARY_INTEGER;
    t_pac tab_pacienti;

    i INTEGER;
    cont INTEGER;
    j INTEGER;
    nr_programari INTEGER;
    
BEGIN
    SELECT id_asigurare
    BULK COLLECT INTO t_id_asig
    FROM ASIGURARE
    ORDER BY id_asigurare;
    
    
    SELECT asigurare_info
    BULK COLLECT INTO t_det_asiginfo
    FROM ASIGURARE
    ORDER BY id_asigurare;
    
    i := t_id_asig.FIRST;
    j := t_det_asiginfo.FIRST;
    
    
    WHILE i <= t_id_asig.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Asigurarea cu id-ul '||t_id_asig(i)||' ('||t_det_asiginfo(j)||')');
        
       
        
        SELECT id_pacient, nume_pacient, ASIGURARE.id_asigurare
        BULK COLLECT INTO t_pac
        FROM PACIENTI
        JOIN ASIGURARE ON PACIENTI.id_asigurare = ASIGURARE.id_asigurare
        WHERE ASIGURARE.id_asigurare = t_id_asig(i);
        
               IF t_pac.COUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('    '||'Niciun pacient nu are acest tip de asigurare!');
            DBMS_OUTPUT.NEW_LINE;
        ELSE
            IF t_pac.COUNT >= 1 THEN
                DBMS_OUTPUT.PUT_LINE('    '||'Pacientii care au acest tip de asigurare:');
                DBMS_OUTPUT.NEW_LINE;
            ELSE
                DBMS_OUTPUT.PUT_LINE('    '||'Pacientul care are acest tip de asigurare:');
                DBMS_OUTPUT.NEW_LINE;
            END IF;

            cont := 0;
            FOR k IN t_pac.FIRST..t_pac.LAST LOOP
                cont := cont+1;
                DBMS_OUTPUT.PUT('        '||cont||'. '||t_pac(k).nume_pacient);
                
                SELECT COUNT(*)
                INTO nr_programari
                FROM  PROGRAMARI
                WHERE id_pacient = t_pac(k).id_pacient;
                
                DBMS_OUTPUT.PUT_LINE(' | numar de programari: '||nr_programari);
            END LOOP;
        END IF;
        
        i:=i+1;
        j:=j+1;
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    
END proc2;


SET SERVEROUTPUT ON;
BEGIN
    proc2;
END;


-- •	Subprogram stocat independent(inclusiv apelare) care să utilizeze 2 tipuri de cursoare învățate, unul dintre acestea fiind cursor parametrizat;
--- Această procedură afișează numărul medicilor din București, iar pentru specialitatea “Dermatologie” afișează numele medicului și salariu anual al acestuia.

CREATE OR REPLACE PROCEDURE proc1 AS 
CURSOR c1 IS
SELECT COUNT(id_doctor) FROM DOCTORI WHERE adresa = 'Bucuresti';

cursor c2(p_specialitate varchar2) IS
SELECT nume_doctor, salariu*12 anual_sal
FROM DOCTORI
WHERE specialitate = p_specialitate;

v1 NUMBER;
v2 c2%ROWTYPE;

BEGIN
OPEN c1;
LOOP
FETCH c1 INTO v1;
EXIT WHEN c1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Exista: '|| v1 ||' doctori in Bucuresti');
END LOOP;
CLOSE c1;

OPEN c2('Dermatologie');
FETCH c2 INTO v2;
WHILE (c2%FOUND) LOOP
DBMS_OUTPUT.PUT_LINE ('Doctorul: ' || v2.nume_doctor ||
'are salariul anual : ' || v2.anual_sal);
FETCH c2 INTO v2;
END LOOP;
CLOSE c2;
END;

EXECUTE proc1;


-- •	Subprogram stocat independent de tip funcție, care să utilizeze într-o singură comandă SQL 3 dintre tabelele definite; tratarea tuturor excepțiilor care pot apărea(definiți minim 2 excepții); apelarea subprogramului astfel încât să fie evidențiate toate cazurile tratate
--- Afișează numele pacientului, informații despre asigurarea acestuia și starea medicala pentru un anumit pacient al cărui ID este trecut ca parametru.
CREATE OR REPLACE FUNCTION pacienti_info (p_id_pacient NUMBER)
RETURN VARCHAR2
AS
v_nume_pacient VARCHAR2(50);
v_nume_asigurare VARCHAR2(50);
v_nume_conditie VARCHAR2(50);
v_eroare VARCHAR2(255);
BEGIN
BEGIN
SELECT nume_pacient, asigurare_info
INTO v_nume_pacient, v_nume_asigurare
FROM PACIENTI p
JOIN ASIGURARE a ON p.id_asigurare = a.id_asigurare
WHERE p.id_pacient = p_id_pacient;
EXCEPTION
WHEN NO_DATA_FOUND THEN
v_eroare := 'Pacientul cu ID-ul ' || p_id_pacient || ' nu a fost gasit in baza de date.';
RAISE_APPLICATION_ERROR(-20001, v_eroare);
END;

BEGIN
SELECT nume_conditie
INTO v_nume_conditie
FROM CONDITIE_MEDICALA c
JOIN CONDITIE_PACIENTI cp ON c.id_conditie = cp.id_conditie
WHERE cp.id_pacient = p_id_pacient;
EXCEPTION
WHEN NO_DATA_FOUND THEN
v_eroare := 'Nu exista conditii medicale inregistrate pentru pacientul cu ID-ul ' || p_id_pacient;
RAISE_APPLICATION_ERROR(-20002, v_eroare);
END;

RETURN v_nume_pacient || ' ' || v_nume_asigurare || ' ' || v_nume_conditie;
END;

BEGIN
dbms_output.put_line(retrieve_patient_info(100));
END;
/
BEGIN
dbms_output.put_line(retrieve_patient_info(21));
END;
/
BEGIN
dbms_output.put_line(retrieve_patient_info(1));
END;
/

-- •	Trigger de tip LMD la nivel de comandă (inclusiv declanșare)
--- Se restricționează inserarea în tabelul PROGRAMARI în zilele cuprinse între 25 și 31 ale lunii.
CREATE OR REPLACE TRIGGER restrict_insert_programari
    BEFORE INSERT ON PROGRAMARI
DECLARE
    ziua_curenta NUMBER;
BEGIN

    ziua_curenta := EXTRACT(DAY FROM sysdate);

    IF ziua_curenta BETWEEN 25 AND 31 THEN
        raise_application_error(-20100,'Nu se pot face inserari in tabela intre zilele de 25-31');
    END IF;
END;

INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(22,  to_date('2023-03-01', 'yyyy-mm-dd'), 1, 1);

-- •	Trigger de tip LMD la nivel de linie (inclusiv declanșare)
--- Prin intermediul trigger-ului ne asigurăm că salariul asistentei poate fi doar mărit, nu și micșorat. Dacă salariul este micșorat, atunci este afișată o eroare, dacă este mărit, atunci este afișat un mesaj cu salariul vechi și salariul actualizat, nou.

CREATE OR REPLACE TRIGGER marire_salariu
BEFORE UPDATE OF salariu ON ASISTENTA
FOR EACH ROW
BEGIN 
   IF :NEW.salariu < :OLD.salariu THEN
      RAISE_APPLICATION_ERROR (-20222, 'salariul asistentei nu poate fi micsorat');
   END IF;
   DBMS_OUTPUT.PUT_LINE('Salariul a fost majorat de la ' || :OLD.salariu || ' la ' || :NEW.salariu);
END;

UPDATE ASISTENTA SET salariu = 5000 WHERE id_asistenta = 1;

-- •	Trigger de tip LDD (inclusiv declanșare)
--- La crearea, ștergerea sau modificarea unui tabel din baza de date, va fi afișat numele bazei de date, userul, evenimentul care s-a produs și data curentă.
CREATE OR REPLACE TRIGGER trigLDD
 AFTER CREATE OR DROP OR ALTER ON DATABASE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Baza de date: '||SYS.DATABASE_NAME);
    DBMS_OUTPUT.PUT_LINE('User: '||SYS.LOGIN_USER);
    DBMS_OUTPUT.PUT_LINE('Eveniment: '||SYS.SYSEVENT);
    DBMS_OUTPUT.PUT_LINE('Data: '||SYSTIMESTAMP);
END;
/

CREATE TABLE ttest 
(
id_test NUMBER(2) PRIMARY KEY,
nume VARCHAR(20)
);


-- •	Pachet care să conțină toate obiectele definite în cadrul punctului 9 (inclusiv apelarea lor)
CREATE OR REPLACE PACKAGE package_exercise IS
PROCEDURE proc2;
PROCEDURE proc1;
FUNCTION pacienti_info (p_id_pacient NUMBER)
RETURN VARCHAR2;
END package_exercise;
/
SHOW ERRORS
CREATE OR REPLACE PACKAGE BODY package_exercise IS
PROCEDURE proc2 IS
 TYPE tab_imb_id_asig IS TABLE OF ASIGURARE.id_asigurare%TYPE;
    t_id_asig tab_imb_id_asig := tab_imb_id_asig();

    TYPE tab_imb_det_asiginfo IS TABLE OF ASIGURARE.asigurare_info%TYPE;
    t_det_asiginfo tab_imb_det_asiginfo := tab_imb_det_asiginfo();

    TYPE pacienti_inreg IS RECORD
        (id_pacient PACIENTI.id_pacient%TYPE,
        nume_pacient PACIENTI.nume_pacient%TYPE,
        id_asigurare ASIGURARE.id_asigurare%TYPE);

    TYPE tab_pacienti IS TABLE OF pacienti_inreg INDEX BY BINARY_INTEGER;
    t_pac tab_pacienti;

    i INTEGER;
    cont INTEGER;
    j INTEGER;
    nr_programari INTEGER;
    
BEGIN
    SELECT id_asigurare
    BULK COLLECT INTO t_id_asig
    FROM ASIGURARE
    ORDER BY id_asigurare;
    
    
    SELECT asigurare_info
    BULK COLLECT INTO t_det_asiginfo
    FROM ASIGURARE
    ORDER BY id_asigurare;
    
    i := t_id_asig.FIRST;
    j := t_det_asiginfo.FIRST;
    
    
    WHILE i <= t_id_asig.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Asigurarea cu id-ul '||t_id_asig(i)||' ('||t_det_asiginfo(j)||')');
        
       
        
        SELECT id_pacient, nume_pacient, ASIGURARE.id_asigurare
        BULK COLLECT INTO t_pac
        FROM PACIENTI
        JOIN ASIGURARE ON PACIENTI.id_asigurare = ASIGURARE.id_asigurare
        WHERE ASIGURARE.id_asigurare = t_id_asig(i);
        
               IF t_pac.COUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('    '||'Niciun pacient nu are acest tip de asigurare!');
            DBMS_OUTPUT.NEW_LINE;
        ELSE
            IF t_pac.COUNT >= 1 THEN
                DBMS_OUTPUT.PUT_LINE('    '||'Pacientii care au acest tip de asigurare:');
                DBMS_OUTPUT.NEW_LINE;
            ELSE
                DBMS_OUTPUT.PUT_LINE('    '||'Pacientul care are acest tip de asigurare:');
                DBMS_OUTPUT.NEW_LINE;
            END IF;

            cont := 0;
            FOR k IN t_pac.FIRST..t_pac.LAST LOOP
                cont := cont+1;
                DBMS_OUTPUT.PUT('        '||cont||'. '||t_pac(k).nume_pacient);
                
                SELECT COUNT(*)
                INTO nr_programari
                FROM  PROGRAMARI
                WHERE id_pacient = t_pac(k).id_pacient;
                
                DBMS_OUTPUT.PUT_LINE(' | numar de programari: '||nr_programari);
            END LOOP;
        END IF;
        
        i:=i+1;
        j:=j+1;
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    
END proc2;

PROCEDURE proc1 AS 
CURSOR c1 IS
SELECT COUNT(id_doctor) FROM DOCTORI WHERE adresa = 'Bucuresti';

cursor c2(p_specialitate varchar2) IS
SELECT nume_doctor, salariu*12 anual_sal
FROM DOCTORI
WHERE specialitate = p_specialitate;

v1 NUMBER;
v2 c2%ROWTYPE;

BEGIN
OPEN c1;
LOOP
FETCH c1 INTO v1;
EXIT WHEN c1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Exista: '|| v1 ||' doctori in Bucuresti');
END LOOP;
CLOSE c1;

OPEN c2('Dermatologie');
FETCH c2 INTO v2;
WHILE (c2%FOUND) LOOP
DBMS_OUTPUT.PUT_LINE ('Doctorul: ' || v2.nume_doctor ||
'are salariul anual : ' || v2.anual_sal);
FETCH c2 INTO v2;
END LOOP;
CLOSE c2;
END;

FUNCTION pacienti_info (p_id_pacient NUMBER)
RETURN VARCHAR2
AS
v_nume_pacient VARCHAR2(50);
v_nume_asigurare VARCHAR2(50);
v_nume_conditie VARCHAR2(50);
v_eroare VARCHAR2(255);
BEGIN
BEGIN
SELECT nume_pacient, asigurare_info
INTO v_nume_pacient, v_nume_asigurare
FROM PACIENTI p
JOIN ASIGURARE a ON p.id_asigurare = a.id_asigurare
WHERE p.id_pacient = p_id_pacient;
EXCEPTION
WHEN NO_DATA_FOUND THEN
v_eroare := 'Pacientul cu ID-ul ' || p_id_pacient || ' nu a fost gasit in baza de date.';
RAISE_APPLICATION_ERROR(-20001, v_eroare);
END;

BEGIN
SELECT nume_conditie
INTO v_nume_conditie
FROM CONDITIE_MEDICALA c
JOIN CONDITIE_PACIENTI cp ON c.id_conditie = cp.id_conditie
WHERE cp.id_pacient = p_id_pacient;
EXCEPTION
WHEN NO_DATA_FOUND THEN
v_eroare := 'Nu exista conditii medicale inregistrate pentru pacientul cu ID-ul ' || p_id_pacient;
RAISE_APPLICATION_ERROR(-20002, v_eroare);
END;

RETURN v_nume_pacient || ' ' || v_nume_asigurare || ' ' || v_nume_conditie;
END;
END package_exercise;

BEGIN
proc2;
proc1;
dbms_output.put_line(retrieve_patient_info(1));
dbms_output.put_line(retrieve_patient_info(21));
dbms_output.put_line(retrieve_patient_info(100));
END;
/

-- Exercitiul 10: Exceptii/avertismente - adaugare in tabela mesaje + secventa
CREATE SEQUENCE increment_id
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20;

SET VERIFY OFF
ACCEPT adresa PROMPT 'Introduceti localitatea:'
DECLARE
v_nume DOCTORI.nume_doctor%TYPE;
v_specialitate DOCTORI.specialitate%TYPE;
v_adresa DOCTORI.adresa%TYPE:='&adresa';
BEGIN
SELECT nume_doctor, specialitate
INTO v_nume, v_specialitate
FROM DOCTORI
WHERE adresa = v_adresa;
INSERT INTO MESAJE 
VALUES (increment_id.NEXTVAL, v_nume ||' - '|| v_specialitate, 'I', USER, SYSDATE);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
INSERT INTO MESAJE 
VALUES (increment_id.NEXTVAL, 'Exista mai multi doctori din aceasta localitate', 'W', USER, SYSDATE);
WHEN NO_DATA_FOUND THEN
INSERT INTO MESAJE 
VALUES (increment_id.NEXTVAL, 'Nu exista doctori din aceasta localitate', 'E', USER, SYSDATE);
END;
/
SET VERIFY ON

