Acest repository conține codul și structura bazei de date pentru un sistem de gestiune medicală, destinat unui spital. Baza de date permite stocarea și gestionarea informațiilor despre pacienți, personalul medical, programări, condiții medicale, medicamente și asigurări medicale.

Structura bazei de date
Baza de date conține următoarele tabele independente:

SALON: Informații despre salon, inclusiv ID-ul, capacitatea și etajul.
ASISTENTA: Informații despre asistente, cum ar fi ID-ul, numele, salariul și salonul repartizat fiecăreia.
DOCTORI: Informații despre medici, inclusiv ID-ul, numele, specialitatea, telefonul, salariul, data angajării și adresa.
ASIGURARE: Informații despre asigurările medicale, inclusiv ID-ul, descrierea și tipul.
PACIENTI: Informații despre pacienți, inclusiv ID-ul, numele, adresa, telefonul, asigurarea și salonul asociat fiecăruia.
CONDITIE_MEDICALA: Informații despre starea medicală, inclusiv ID-ul, numele și descrierea.
COND_MED_PREC: Informații despre afecțiunile medicale anterioare ale unui pacient, inclusiv ID-ul și descrierea.
MEDICAMENTE: Informații despre medicamente, inclusiv ID-ul, numele, cantitatea, unitatea de măsură și efectele secundare.
PLATA: Informații despre plățile efectuate de către pacienți pentru consultații și tot ce presupune aceasta, inclusiv ID-ul, metoda de plată și suma.
Baza de date conține și următoarele tabele asociative:

MEDICAMENTE_PROGRAMARE: Asociază medicamentele acordate în cadrul programărilor.
CONDITIE_PACIENTI: Asociază pacienții cu afecțiunile medicale.
PROGRAMARI: Permite programarea mai multor pacienți cu mai mulți medici și invers, conținând informații despre programări, inclusiv ID-ul și data.
Utilizare
Pentru a utiliza această bază de date, se poate accesa și gestiona folosind software-ul de gestionare a bazelor de date preferat (de exemplu, MySQL, PostgreSQL, etc.). Pentru a putea implementa această bază de date într-un sistem medical real, se recomandă consultarea unui specialist în baze de date sau a unui inginer software.