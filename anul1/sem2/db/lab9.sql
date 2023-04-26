-- SAPTAMANA 9 - LABORATOR 6 - Subcereri Necorelate


1.	Folosind subcereri, să se afişeze numele şi data angajării pentru salariaţii 
care au fost angajaţi după Gates.

SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
                   FROM employees
                   WHERE INITCAP(last_name)= 'Gates'
                   );


2.	Folosind subcereri, scrieţi o cerere pentru a afişa numele şi salariul 
pentru toţi colegii (din acelaşi departament) lui Gates. Se va exclude Gates. 

Se poate înlocui operatorul IN cu = ???
R: ___




--Se va inlocui Gates cu King;





3.	Folosind subcereri, să se afişeze numele şi salariul angajaţilor conduşi direct 
de preşedintele companiei (acesta este considerat angajatul care nu are manager).

-- REZOLVATI INDIVIDUAL

-- CEREREA TREBUIE SA RETURNEZE 14 ANGAJATI
-- VEZI IMAGINEA ATASATA IN LABORATOR

select * from employees
where manager_id = (select employee_id from employees where manager_id is null)


4.	Scrieți o cerere pentru a afişa numele, codul departamentului și salariul angajaților 
al căror cod de departament și salariu coincid cu codul departamentului și salariul 
unui angajat care câștigă comision. 

SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, salary
                                  FROM employees
                                  WHERE commission_pct is not null
                                  );
           
                                                                       
5.	Să se afișeze codul, numele și salariul tuturor angajaților al căror salariu 
este mai mare decât salariul mediu.

SELECT employee_id, last_name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) 
                FROM employees);


6.	Scrieti o cerere pentru a afișa angajații care câștigă 
(castiga = salariul plus comision din salariu) 
mai mult decât oricare funcționar (job-ul conţine şirul "CLERK"). 
Sortați rezultatele dupa salariu, în ordine descrescătoare;

select * from employees
where salary + NVL(commission_pct,0) * salary > (
    select max(salary + NVL(commission_pct,0) * salary) from employees where UPPER(job_id) like '%CLERK%'
)
order by salary desc;


7.	Scrieţi o cerere pentru a afişa numele angajatilor, numele departamentului 
şi salariul angajaţilor care câştigă comision, dar al căror şef direct nu câştigă comision.	

-- REZOLVATI IN ECHIPA DE 2 PERSOANE

select emp.last_name, departments.department_name, emp.salary
from employees emp
inner join departments 
on departments.department_id = emp.department_id
where NVL(emp.commission_pct, 0) > 0 
and emp.manager_id IN (select employee_id from employees where employee_id = emp.manager_id and NVL(commission_pct, 0) = 0);

-- CEREREA TREBUIE SA RETURNEZE 5 ANGAJATI
-- VEZI IMAGINEA ATASATA IN LABORATOR



8.	Să se afişeze numele angajaţilor, codul departamentului şi codul job-ului salariaţilor 
al căror departament se află în Toronto.

-- REZOLVATI IN ECHIPA DE 2 PERSOANE

-- CEREREA TREBUIE SA RETURNEZE 2 ANGAJATI
-- VEZI IMAGINEA ATASATA IN LABORATOR

select emp.last_name, emp.department_id, emp.job_id
from employees emp
inner join departments dep on emp.department_id = dep.department_id
inner join locations loc on loc.location_id = dep.location_id
where UPPER(loc.city) = 'TORONTO';


select emp.last_name, emp.department_id, emp.job_id
from employees emp
where emp.department_id IN (
    select department_id from departments dep
    inner join locations loc on loc.location_id = dep.location_id
    where UPPER(loc.city) = 'TORONTO'
);

9.	Să se obțină codurile departamentelor în care nu lucreaza nimeni 
(nu este introdus nici un salariat în tabelul employees). Sa se utilizeze subcereri;

select *
from departments
where department_id NOT IN (select unique department_id from employees where department_id is not null)


10.	Este posibilă introducerea de înregistrări prin intermediul subcererilor (specificate în locul tabelului). 
Ce reprezintă, de fapt, aceste subcereri? Să se analizeze următoarele comenzi INSERT:

INSERT INTO emp (employee_id, last_name, email, hire_date, job_id, salary, commission_pct) 
VALUES (252, 'Nume252', 'nume252@emp.com', SYSDATE, 'SA_REP', 5000, NULL);

SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct 
FROM emp
WHERE employee_id = 252;

ROLLBACK;

INSERT INTO 
   (SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct 
    FROM emp) 
VALUES (252, 'Nume252', 'nume252@emp.com', SYSDATE, 'SA_REP', 5000, NULL);


SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct 
FROM emp
WHERE employee_id = 252;

ROLLBACK;


11. Sa se creeze tabelul SUBALTERNI care sa contina codul, numele si prenumele angajatilor 
care il au manager pe Steven King, alaturi de codul si numele lui King.
Coloanele se vor numi cod, nume, prenume, cod_manager, nume_manager.

DESC employees;

CREATE TABLE SUBALTERNI
    (
    );
     

INSERT INTO SUBALTERNI (cod, nume, prenume, cod_manager, nume_manager)
        (SELECT 
        
        );
