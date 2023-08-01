-- Crearea tabelului SALON
CREATE TABLE SALON
(
  id_salon NUMBER(3) PRIMARY KEY,
  capacitate NUMBER(2),
  etaj NUMBER(2)
);


BEGIN
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (1, 10, 1);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (2, 15, 2);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (3, 10, 3);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (4, 15, 1);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (5, 10, 2);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (6, 15, 3);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (7, 10, 1);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (8, 15, 2);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (9, 10, 3);
INSERT INTO SALON (id_salon, capacitate, etaj) VALUES (10, 15, 1);

END;
/


-- Crearea tabelului ASISTENTA
CREATE TABLE ASISTENTA
(
  id_asistenta NUMBER(3) PRIMARY KEY,
  nume_asistenta VARCHAR(100) NOT NULL,
  salariu NUMBER(10),
  id_salon REFERENCES SALON(id_salon)
);


BEGIN
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (1, 'Anna Doe', 2000, 1);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (2, 'Jane Smith', 2500, 2);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (3, 'Olivia Johnson', 3000, 3);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (4, 'Emma Williams', 3500, 1);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (5, 'Michaela Brown', 4000, 2);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (6, 'Emily Davis', 4500, 3);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (7, 'Maria Garcia', 5000, 1);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (8, 'Madison Rodriguez', 5500, 2);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (9, 'Andra Hernandez', 6000, 3);
INSERT INTO ASISTENTA (id_asistenta, nume_asistenta, salariu, id_salon) VALUES (10, 'Andreea Moore', 6500, 1);
END;
/




-- Crearea tabelului DOCTORI
CREATE TABLE DOCTORI
(
  id_doctor NUMBER(3) PRIMARY KEY,
  nume_doctor VARCHAR(50) NOT NULL,
  specialitate VARCHAR(50) NOT NULL,
  telefon VARCHAR(20) NOT NULL,
  salariu NUMBER(10),
  data_angajare DATE,
  adresa VARCHAR(100) NOT NULL
  
);

BEGIN
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (1, 'John Doe', 'Chirurgie Plastica', '1234567890', 10000, to_date('2022-05-01', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (2, 'Richard David', 'Pediatrie', '2345678901', 12000, to_date('2020-08-10', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (3, 'Bob Johnson', 'Cardiologie', '3456789012', 15000, to_date('2020-10-20', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (4, 'Alisia Brown', 'Oncologie', '4567890123', 20000, to_date('2018-03-15', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (5, 'Michael Brown', 'Ortopedie', '5678901234', 25000, to_date('2019-04-12', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (6, 'Patrick Johnas', 'Anesteziologie', '6789012345', 30000, to_date('2020-09-11', 'yyyy-mm-dd'), 'Timisoara');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (7, 'Joshua Garcia', 'Neurologie', '7890123456', 35000, to_date('2021-01-21', 'yyyy-mm-dd'), 'Timisoara');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (8, 'Maddie Bryan', 'Gastroenterologie', '8901234567', 40000, to_date('2020-01-20', 'yyyy-mm-dd'), 'Bucuresti');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (9, 'Matthew Pop', 'Dermatologie', '9012345678', 45000, to_date('2018-12-01', 'yyyy-mm-dd'), 'Craiova');
INSERT INTO DOCTORI (id_doctor, nume_doctor, specialitate, telefon, salariu, data_angajare, adresa) VALUES (10, 'Andrew Robinson', 'Radiologie', '0123456789', 50000, to_date('2018-12-22', 'yyyy-mm-dd'), 'Bucuresti');
END;
/



-- Crearea tabelului ASIGURARE
CREATE TABLE ASIGURARE
(
  id_asigurare NUMBER(3) PRIMARY KEY,
  asigurare_info VARCHAR(100) NOT NULL,
  tip VARCHAR(50) NOT NULL
);


BEGIN
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (1, 'Blue Cross Blue Shield', 'publica');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (2, 'Aetna', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (3, 'United Healthcare', 'publica');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (4, 'Humana', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (5, 'Cigna','publica');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (6, 'Kaiser Permanente', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (7, 'Health Net', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (8, 'Medicare', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (9, 'Medicaid', 'privata');
INSERT INTO ASIGURARE (id_asigurare, asigurare_info, tip) VALUES (10, 'Amerigroup', 'publica');
END;
/

-- Crearea tabelului PACIENTI
CREATE TABLE PACIENTI
(
  id_pacient NUMBER(3) PRIMARY KEY,
  nume_pacient VARCHAR(100) NOT NULL,
  adresa VARCHAR(200) NOT NULL,
  telefon VARCHAR(10) NOT NULL,
  id_asigurare REFERENCES ASIGURARE(id_asigurare),
  id_salon REFERENCES SALON(id_salon)
);


BEGIN
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (1, 'James Doe', 'Bucuresti', '1234567890', 1, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (2, 'Patricia Smith', 'Timisoara', '2345678901', 2, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (3, 'Jennifer Johnson', 'Craiova', '3456789012', 3, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (4, 'Linda Williams', 'Cluj', '4567890123', 4, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (5, 'Elizabeth Brown', 'Timisoara', '5678901234', 5, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (6, 'Barbara Smith', 'Bucuresti', '1234567890', 6, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (7, 'Joseph Brown', 'Brasov', '2345678901', 7, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (8, 'Charles Johnson', 'Brasov', '3456789012', 9, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (9, 'Daniel Williams', 'Bucuresti', '4567890123', 8, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (10, 'Nancy Brown', 'Timisoara', '5678901234', 10, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (11, 'Kimberly Davis', 'Bucuresti', '6789012345', 1, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (12, 'Karen Garcia', 'Bucuresti', '7890123456', 2, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (13, 'Sarah Taylor', 'Craiova', '8901234567', 3, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (14, 'Sophia Perez', 'Bucuresti', '9012345678', 4, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (15, 'Paul Garcia', 'Bucuresti', '0123456789', 5, 1);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (16, 'Donna Martinez', 'Bucuresti', '1234567890', 1, 2);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (17, 'Jessica Lopez', 'Timisoara', '2345678901', 2, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (18, 'George Rodriguez', 'Cluj', '2345678901', 3, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (19, 'Timothy Brian', 'Bucuresti', '2345678901', 4, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (20, 'Cynthia Pop', 'Timisoara', '2345678901', 5, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (21, 'Mara Popescu', '624 Elm St', '2236478901', 5, 3);
INSERT INTO PACIENTI (id_pacient, nume_pacient, adresa, telefon, id_asigurare, id_salon) VALUES (22, 'Sassy Green', 'Timisoara', '5678557634', 10, 2);
END;
/


-- Crearea tabelului CONDITII MEDICALE PRECEDENTE
CREATE TABLE COND_MED_PREC
(
  id_cond_prec NUMBER(3) PRIMARY KEY,
  cond_med_den VARCHAR(100) NOT NULL,
  id_pacient REFERENCES PACIENTI(id_pacient)
);

BEGIN
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (1, 'Diabet', 1);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (2, 'Hipertensiune', 2);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (3, 'Astm', 3);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (4, 'Artrita', 1);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (5, 'Depresie', 1);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (6, 'Anxietate', 2);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (7, 'Cancer', 4);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (8, 'Boala cardiovasculara', 5);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (9, 'Obezitate', 6);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (10, 'Accident vascular cerebral', 7);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (11, 'Boala la rinichi', 8);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (12, 'Boala la ficat', 9);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (13, 'Boala autoimuna', 10);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (14, 'Boala tiroidiana', 11);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (15, 'Boala la plamani', 12);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (16, 'Boli gastrointestinale', 13);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (17, 'Tulburări neurologice', 13);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (18, 'Obezitate', 14);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (19, 'Boala infectioasa', 15);
INSERT INTO COND_MED_PREC (id_cond_prec, cond_med_den, id_pacient) VALUES (20, 'Boala de sange', 16);
END;
/



-- Crearea tabelului CONDITIE_MEDICALA
CREATE TABLE CONDITIE_MEDICALA
(
  id_conditie NUMBER(3) PRIMARY KEY,
  nume_conditie VARCHAR(100) NOT NULL, 
  descriere VARCHAR(200) NOT NULL
);


BEGIN
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (1, 'Cancer', 'O boala caracterizata prin cresterea si raspandirea necontrolata a celulelor anormale');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (2, 'Diabet', 'O afectiune cronica caracterizata prin niveluri ridicate de zahar in ssnge');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (3, 'Astm', 'O boală pulmonara cronica care inflameaza si ingusteaza caile respiratorii');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (4, 'Artrita', 'Un grup de afectiuni caracterizate prin inflamatie la nivelul articulatiilor');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (5, 'Hipertensiune', 'O afectiune cronica caracterizata prin hipertensiune arteriala');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (6, 'Boala cardiovasculara', 'Un termen general pentru o varietate de afectiuni care afecteaza inima');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (7, 'Depresie', 'O tulburare mentala caracterizata prin sentimente persistente de tristete, lipsa de speranta si pierderea interesului');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (8, 'Anemie', 'O afectiune caracterizata prin lipsa globulelor rosii sau a hemoglobinei in sange');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (9, 'Alergii', 'O afectiune caracterizata printr-un raspuns imunitar hiperactiv la o substanta');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (10, 'Gripa tip A', 'O infectie virala care afecteaza sistemul respirator');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (11, 'Dureri de spate', 'Durere resimtita in partea inferioara a spatelui');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (12, 'Migrene', 'Un tip de durere de cap caracterizata prin durere severa si alte simptome');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (13, 'Ulcer', 'Ulcerul gastric este dat de prezenta unei ulceratii dureroase sau rani ale mucoasei gastrice');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (14, 'Bronsita', 'Inflamatie a tuburilor bronsice');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (15, 'Pneumonie', 'O infectie a plamanilor care provoaca inflamatie si acumulare de lichid');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (16, 'Tuberculoza', 'O infectie bacteriana care afecteaza in primul rand plamanii');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (17, 'Gripa tip B', 'O infectie virala care afecteaza sistemul respirator');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (18, 'Pojar', 'O infectie virala foarte contagioasa');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (19, 'Varicelă', 'O infectie virala foarte contagioasa');
INSERT INTO CONDITIE_MEDICALA (id_conditie, nume_conditie, descriere) VALUES (20, 'Eczema', 'Un grup de afectiuni care fac ca pielea sa devina rosie, inflamata si provoaca mancarime');
END;
/



-- Crearea tabelului CONDITIE_PACIENTI
CREATE TABLE CONDITIE_PACIENTI
(
  id_pacient REFERENCES PACIENTI(id_pacient),
  id_conditie REFERENCES CONDITIE_MEDICALA(id_conditie)
);

BEGIN
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (1, 10);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (2, 17);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (3, 8);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (4, 9);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (5, 11);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (6, 12);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (7, 13);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (8, 14);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (9, 15);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (10, 16);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (11, 17);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (12, 18);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (13, 19);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (14, 20);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (15, 7);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (16, 6);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (17, 5);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (18, 4);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (19, 3);
INSERT INTO CONDITIE_PACIENTI (id_pacient, id_conditie) VALUES (20, 2);
END;
/



-- Crearea tabelului PROGRAMARI
CREATE TABLE PROGRAMARI
(
  id_programare NUMBER(3) PRIMARY KEY,
  data_programare DATE NOT NULL,
  id_pacient REFERENCES PACIENTI(id_pacient),
  id_doctor REFERENCES DOCTORI(id_doctor)

);

BEGIN
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(1,  to_date('2023-02-01', 'yyyy-mm-dd'), 1, 1);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(2,  to_date('2023-02-02', 'yyyy-mm-dd'), 2, 2);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(3,  to_date('2023-02-03', 'yyyy-mm-dd'), 3, 3);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(4,  to_date('2023-02-04', 'yyyy-mm-dd'), 4, 4);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(5,  to_date('2023-02-05', 'yyyy-mm-dd'), 5, 5);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(6,  to_date('2023-02-06', 'yyyy-mm-dd'), 6, 6);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(7,  to_date('2023-02-07', 'yyyy-mm-dd'), 7, 7);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(8,  to_date('2023-02-08', 'yyyy-mm-dd'), 8, 8);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(9,  to_date('2023-02-09', 'yyyy-mm-dd'), 9, 9);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(10,  to_date('2023-02-10', 'yyyy-mm-dd'), 10, 10);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(11,  to_date('2023-02-11', 'yyyy-mm-dd'), 11, 1);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(12,  to_date('2023-02-12', 'yyyy-mm-dd'), 12, 2);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(13,  to_date('2023-02-13', 'yyyy-mm-dd'), 13, 3);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(14,  to_date('2023-02-14', 'yyyy-mm-dd'), 14, 4);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(15,  to_date('2023-02-15', 'yyyy-mm-dd'), 15, 5);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(16,  to_date('2023-02-16', 'yyyy-mm-dd'), 16, 6);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(17,  to_date('2023-02-17', 'yyyy-mm-dd'), 17, 7);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(18,  to_date('2023-02-18', 'yyyy-mm-dd'), 18, 8);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(19,  to_date('2023-02-19', 'yyyy-mm-dd'), 19, 9);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(20,  to_date('2023-02-20', 'yyyy-mm-dd'), 20, 1);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(21,  to_date('2023-02-20', 'yyyy-mm-dd'), 20, 1);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(22,  to_date('2023-05-10', 'yyyy-mm-dd'), 22, 2);
INSERT INTO PROGRAMARI (id_programare, data_programare, id_pacient, id_doctor) VALUES(23,  to_date('2023-03-21', 'yyyy-mm-dd'), 22, 2);
END;
/


-- Crearea tabelului MEDICAMENTE
CREATE TABLE MEDICAMENTE
(
  id_medicament NUMBER(3) PRIMARY KEY,
  nume_medicament VARCHAR(100) NOT NULL,
  cantitate NUMBER(6),
  unitate_masura VARCHAR(10) NOT NULL,
  efecte_secundare VARCHAR(250) NOT NULL
);



BEGIN
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (1, 'Aspirin', 200, 'mg', 'Iritatie la stomac, risc crescut de sangerare');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (2, 'Ibuprofen', 200, 'mg', 'Iritatie la stomac, risc crescut de sangerare');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (3, 'Paracetamol', 500, 'mg', 'Leziuni hepatice la doze mari');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (4, 'Penicilina', 50, 'mg', 'Reactii alergice, diaree');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (5, 'Ampicilina', 20, 'mg', 'Reactii alergice, diaree');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (6, 'Eritromicina', 100, 'mg', 'Diaree, dureri abdominale');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (7, 'Ciprofloxacina', 300, 'mg', 'Greata, diaree');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (8, 'Metronidazol', 150, 'mg', 'Greata, diaree, gust metalic');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (9, 'Doxiciclina', 200, 'mg', 'Greata, diaree, sensibilitate la lumina soarelui');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (10, 'Hidroxiclorochina', 300, 'mg', 'Diaree, dureri de stomac, dureri de cap');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (11, 'Azitromicina', 100, 'mg', 'Diaree, greata, dureri de stomac');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (12, 'Levofloxacina', 50, 'mg', 'Diaree, greata, dureri de stomac');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (13, 'Amoxicilina', 20, 'mg', 'Diaree, reactii alergice');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (14, 'Clindamycin', 10, 'mg', 'Diaree, dureri de stomac');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (15, 'Sulfamethoxazole', 15, 'mg', 'Diaree, greata, reactii alergice');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (16, 'Trimethoprim', 10, 'mg', 'Greata, dureri de stomac');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (17, 'Cefuroxime', 50, 'mg', 'Dureri de stomac, reactii alergice');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (18, 'Cefdinir', 20, 'mg', 'Dureri de stomac, reactii alergice');
INSERT INTO MEDICAMENTE (id_medicament, nume_medicament, cantitate, unitate_masura, efecte_secundare) VALUES (20, 'Cefaclor', 10, 'mg', 'Dureri de stomac, reactii alergice');
END;
/



-- Crearea tabelului MEDICAMENTE_PROGRAMARE
CREATE TABLE MEDICAMENTE_PROGRAMARE
(
  id_medicament REFERENCES MEDICAMENTE(id_medicament),
  id_programare REFERENCES PROGRAMARI(id_programare)
);


BEGIN
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (1, 1);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (2, 2);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (3, 3);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (4, 4);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (5, 5);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (6, 6);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (7, 7);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (8, 8);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (9, 9);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (10, 10);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (11, 11);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (12, 12);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (13, 13);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (14, 14);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (15, 15);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (16, 16);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (17, 17);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (18, 18);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (20, 19);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (20, 20);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (1, 10);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (2, 11);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (3, 12);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (4, 13);
INSERT INTO MEDICAMENTE_PROGRAMARE (id_medicament, id_programare) VALUES (5, 14);

END;
/




-- Crearea tabelului PLATA
CREATE TABLE PLATA (
    id_plata NUMBER(3) PRIMARY KEY,
    modalitate_plata VARCHAR(50),
    suma NUMBER(15),
    id_programare REFERENCES PROGRAMARI(id_programare)
);



BEGIN
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (1, 1, 'Cash', 300);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (2, 2, 'Card de Credit', 500);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (3, 3, 'Card de Debit', 250);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (4, 4, 'Transfer Bancar Online', 450);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (5, 5, 'Cash', 520);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (6, 6, 'Card de Credit', 480);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (7, 7, 'Card de Debit', 230);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (8, 8, 'Transfer Bancar Online', 520);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (9, 9, 'Cash', 650);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (10, 10, 'Card de Credit', 400);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (11, 11, 'Card de Debit', 330);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (12, 12, 'Transfer Bancar Online', 250);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (13, 13, 'Cash', 400);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (14, 14, 'Card de Credit', 280);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (15, 15, 'Card de Debit', 350);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (16, 16, 'Transfer Bancar Online', 250);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (17, 17, 'Cash', 420);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (18, 18, 'Card de Credit', 350);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (19, 19, 'Card de Debit', 230);
INSERT INTO PLATA (id_plata, id_programare, modalitate_plata, suma) VALUES (20, 20, 'Transfer Bancar Online', 220);
END;
/


DROP TABLE ASISTENTA CASCADE CONSTRAINTS;
DROP TABLE SALON CASCADE CONSTRAINTS; 
DROP TABLE DOCTORI CASCADE CONSTRAINTS;
DROP TABLE ASIGURARE CASCADE CONSTRAINTS; 
DROP TABLE PACIENTI CASCADE CONSTRAINTS;
DROP TABLE CONDITIE_MEDICALA CASCADE CONSTRAINTS; 
DROP TABLE COND_MED_PREC CASCADE CONSTRAINTS;
DROP TABLE MEDICAMENTE CASCADE CONSTRAINTS; 
DROP TABLE PLATA CASCADE CONSTRAINTS;
DROP TABLE MEDICAMENTE_PROGRAMARE CASCADE CONSTRAINTS; 
DROP TABLE CONDITIE_PACIENTI CASCADE CONSTRAINTS;
DROP TABLE PROGRAMARI CASCADE CONSTRAINTS; 
