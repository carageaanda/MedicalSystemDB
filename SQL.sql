
-- 1)	Returnează salariul total al tuturor medicilor, grupați pe specialitate, care au lucrat mai mult de un anumit număr de luni și au un salariu mai mare decât o anumită sumă.

SELECT specialitate, SUM(salariu) as SALARIU_TOTAL, MONTHS_BETWEEN(SYSDATE, data_angajare) AS LUNI_LUCRATE
FROM doctori
GROUP BY specialitate, MONTHS_BETWEEN(SYSDATE, data_angajare)
HAVING MONTHS_BETWEEN(SYSDATE, data_angajare) > 12
AND SUM(salariu) > 20000

-- 2)	Returnează numele pacientului, numele medicamentului, cantitatea și unitatea de măsură a medicamentului pentru toți pacienții cărora li s-a prescris un anumit medicament, iar numele medicamentului conține un cuvânt specific, ordonat după cantitatea de medicament în ordine descrescătoare.

SELECT nume_pacient, nume_medicament, cantitate, unitate_masura
FROM MEDICAMENTE_PROGRAMARE
JOIN PROGRAMARI ON MEDICAMENTE_PROGRAMARE.id_programare = PROGRAMARI.id_programare
JOIN PACIENTI ON PROGRAMARI.id_pacient = PACIENTI.id_pacient
JOIN MEDICAMENTE ON MEDICAMENTE_PROGRAMARE.id_medicament = MEDICAMENTE.id_medicament
WHERE INSTR(nume_medicament, 'cili') > 0
ORDER BY cantitate DESC


-- 3)	Găsirea medicului asociat fiecărui pacient și preluarea informațiilor suplimentare, precum numele pacientului, primele 3 cifre ale numărului de telefon al pacientului și ultimele 4 cifre ale numărului de telefon al medicului. Interogarea ordonează și rezultatul după medicul asociat. 

WITH PACIENTI_DOCTORI AS (
  SELECT PACIENTI.id_pacient, CONNECT_BY_ROOT (DOCTORI.nume_doctor) AS doctor_asociat_pacientului
  FROM PROGRAMARI
  JOIN PACIENTI ON PACIENTI.id_pacient = PROGRAMARI.id_pacient
  JOIN DOCTORI ON DOCTORI.id_doctor = PROGRAMARI.id_doctor
  START WITH PACIENTI.id_pacient = PACIENTI.id_pacient
  CONNECT BY NOCYCLE PACIENTI.id_pacient = PRIOR PACIENTI.id_pacient
)
SELECT nume_pacient, doctor_asociat_pacientului, SUBSTR(PACIENTI.telefon, 1, 3) AS telefon_pacient, SUBSTR(DOCTORI.telefon, -4) AS telefon_doctor
FROM PACIENTI_DOCTORI
LEFT JOIN PACIENTI
ON PACIENTI_DOCTORI.id_pacient = PACIENTI.id_pacient
LEFT JOIN DOCTORI
ON PACIENTI_DOCTORI.doctor_asociat_pacientului = DOCTORI.nume_doctor
ORDER BY doctor_asociat_pacientului;



-- 4)	Preluarea numărului de programări pentru fiecare medic în ultimele 3 luni și gruparea după nume și specialitatea medicului.

SELECT nume_doctor, specialitate, COUNT(id_programare) as NUMAR_PROGRAMARI
FROM DOCTORI 
JOIN PROGRAMARI 
ON DOCTORI.id_doctor = PROGRAMARI.id_doctor 
WHERE data_programare >= ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'YYYY-MM-DD'), -3) 
GROUP BY nume_doctor, specialitate


-- 5)	Afișarea numelor pacienților care începe cu litera J și informațiile de asigurare ale acestora.

SELECT nume_pacient, asigurare_info 
FROM PACIENTI 
JOIN ASIGURARE 
ON PACIENTI.id_asigurare = ASIGURARE.id_asigurare 
WHERE UPPER(nume_pacient) LIKE 'J%'


-- 6)	Afișarea medicamentului, unde efectele secundare conțin cuvântul “dureri”, cantitatea totală folosită și numărul de programări în care s-a dat spre folosință medicamentul respectiv. 

SELECT nume_medicament, SUM(cantitate), COUNT(id_programare)
FROM MEDICAMENTE 
JOIN MEDICAMENTE_PROGRAMARE 
ON MEDICAMENTE.id_medicament = MEDICAMENTE_PROGRAMARE.id_medicament 
WHERE LOWER(efecte_secundare) LIKE '%dureri%' 
GROUP BY nume_medicament


-- 7)	Afișarea numelor pacienților, a numelui medicului, dar și starea medicală actuală a fiecărui pacient. Dacă id_conditie este 10, va afișa “TRATAT”, dacă id_conditie este 2 va afișa “INCURABIL” și dacă nu este nici una dintre acestea va afișa “IN CURS DE VERIFICARE”.

SELECT PACIENTI.nume_pacient, DOCTORI.nume_doctor, DECODE(CONDITIE_PACIENTI.id_conditie, 10, 'TRATAT', 2, 'INCURABIL', 'IN CURS DE VERIFICARE') as STARE_PACIENTI
FROM PROGRAMARI
JOIN PACIENTI ON PACIENTI.id_pacient = PROGRAMARI.id_pacient
JOIN DOCTORI ON DOCTORI.id_doctor = PROGRAMARI.id_doctor
JOIN CONDITIE_PACIENTI ON PACIENTI.id_pacient = CONDITIE_PACIENTI.id_pacient;



-- 8)	Afișarea numelor tuturor pacienților, numele medicului care i-a tratat ultima dată, data ultimei vizite, salariul minim și mediu al tuturor medicilor care au tratat pacientul, indicând salariul minim și mediu ca fiind 0 dacă pacientul nu are antecedente de tratament.

SELECT p.nume_pacient,
CASE
WHEN pr.id_programare IS NULL THEN 'Nu are un istoric al tratamentelor'
ELSE d.nume_doctor
END AS "Doctor",
MAX(pr.data_programare) as "Data ultimei vizite",
MIN(NULLIF(d.salariu, 0)) as "SALARIU MINIM",
AVG(NULLIF(d.salariu, 0)) as "SALARIU MEDIU"
FROM PROGRAMARI pr
RIGHT JOIN PACIENTI p ON p.id_pacient = pr.id_pacient
RIGHT JOIN DOCTORI d ON pr.id_doctor = d.id_doctor
GROUP BY p.nume_pacient,
CASE
WHEN pr.id_programare IS NULL THEN 'Nu are un istoric al tratamentelor'
ELSE d.nume_doctor
END;


-- 9)	Afișarea numărului de medici și camere diferite vizitate de fiecare pacient, chiar dacă pacientul nu a fost încă tratat. Se afișează, așadar, numele tuturor pacienților, iar pentru fiecare pacient numărul de medici diferiți vizitați, cât și numărul de camere diferite vizitate.

SELECT DISTINCT(p.nume_pacient), 
       NVL((SELECT COUNT(pr.id_doctor) FROM PROGRAMARI pr WHERE pr.id_pacient = p.id_pacient),0) as "Doctori diferiti vizitati",
       NVL((SELECT COUNT(p.id_salon) FROM PROGRAMARI pr WHERE pr.id_pacient = p.id_pacient),0) as "Camere diferite vizitate"
FROM PROGRAMARI pr 
JOIN PACIENTI p on p.id_pacient = pr.id_pacient


-- 10)	Afișarea numelui pacientului, a  numelui medicului și următoarea programare a pacientului folosind o subinterogare în clauza SELECT.

SELECT nume_pacient, nume_doctor, data_programare
FROM PACIENTI
JOIN PROGRAMARI
ON PACIENTI.id_pacient = PROGRAMARI.id_pacient
JOIN DOCTORI
ON PROGRAMARI.id_doctor = DOCTORI.id_doctor
WHERE PROGRAMARI.id_pacient = (SELECT id_pacient FROM PACIENTI WHERE nume_pacient = 'Patricia Smith')


-- 11)	Se afișează numai pacienții care au programat mai multe întâlniri decât numărul mediu de întâlniri programate de toți pacienții.

SELECT nume_pacient, COUNT(id_programare) as numar_programari
FROM PACIENTI
JOIN PROGRAMARI
ON PACIENTI.id_pacient = PROGRAMARI.id_pacient
GROUP BY nume_pacient
HAVING COUNT(id_programare) > (SELECT AVG(numar_programari) FROM (SELECT COUNT(id_programare) as numar_programari FROM PROGRAMARI GROUP BY id_pacient))


-- 12)	Afișarea numelui, cantității și cantitatea totală a tuturor medicamentelor care au ca efect secundar 'Dureri de stomac, reactii alergice'. 

SELECT nume_medicament, cantitate, (SELECT SUM(cantitate) FROM MEDICAMENTE) as total_cantitate
FROM MEDICAMENTE
WHERE efecte_secundare = 'Dureri de stomac, reactii alergice'


-- 13)	Afișarea sumei costului tuturor programărilor este împărțită la numărul de programară pentru a calcula costul mediu pe programare pentru fiecare medic.

SELECT nume_doctor, SUM(plata.suma) / COUNT(programari.id_programare) as cost_mediu_per_programare
FROM DOCTORI
JOIN PROGRAMARI
ON DOCTORI.id_doctor = PROGRAMARI.id_doctor
JOIN PLATA
ON PROGRAMARI.id_programare = PLATA.id_programare
GROUP BY nume_doctor;


-- 14) Afișarea pacienților și a condiției medicale pe care aceștia o au numai dacă descrierea condiției medicale conține cuvântul ‘infecție’

SELECT PACIENTI.nume_pacient, CONDITIE_MEDICALA.nume_conditie
FROM (
  SELECT id_conditie, nume_conditie FROM CONDITIE_MEDICALA WHERE descriere LIKE '%infectie%'
) pacient_conditions
JOIN CONDITIE_PACIENTI ON pacient_conditions.id_conditie = CONDITIE_PACIENTI.id_conditie
JOIN PACIENTI ON CONDITIE_PACIENTI.id_pacient = PACIENTI.id_pacient
JOIN CONDITIE_MEDICALA ON pacient_conditions.id_conditie = CONDITIE_MEDICALA.id_conditie;


-- 15)	Se afișează numele pacientului, informațiile de asigurare, numele medicamentului și efectele secundare ale medicamentului.

SELECT nume_pacient, asigurare_info, nume_medicament, efecte_secundare
FROM PACIENTI
FULL JOIN ASIGURARE ON PACIENTI.id_asigurare = ASIGURARE.id_asigurare
FULL JOIN PROGRAMARI ON PACIENTI.id_pacient = PROGRAMARI.id_pacient
FULL JOIN MEDICAMENTE_PROGRAMARE ON PROGRAMARI.id_programare = MEDICAMENTE_PROGRAMARE.id_programare
FULL JOIN MEDICAMENTE ON MEDICAMENTE_PROGRAMARE.id_medicament = MEDICAMENTE.id_medicament
