/*  Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM students
WHERE YEAR(date_of_birth) = 1990;
*/



/*Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM courses
WHERE cfu>10
*/

/*Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM students
WHERE YEAR(date_of_birth) > 1995;*/


/*Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)
SELECT * FROM courses
WHERE period="I semestre"
AND year = 1;
*/

/*Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)
SELECT * FROM exams
WHERE hour > '14:00:00'
AND date = '2020-06-20';
*/

/*Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM degrees
WHERE name LIKE '%Corso di Laurea Magistrale%'
*/

/*Da quanti dipartimenti è composta l'università? (12)
SELECT * FROM departments
*/

/*Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT * FROM teachers
WHERE phone IS NULL
*/

SELECT * FROM students;

/*. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date) AS anno,
       COUNT(*) AS numero_iscritti
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY anno;
*/

/*Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*) AS stesso_edificio
FROM teachers 
GROUP BY office_address
*/

/*Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(vote) AS media_voti
FROM exam_student;
*/

/*Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT name,
       COUNT(*) AS numero_corsi
FROM courses
GROUP BY name
ORDER BY name;
*/


/*1.Selezionare tutti i `corsi` del `Corso di Laurea in Informatica (22) 

SELECT `courses`.`id` AS `coursesId`,`courses`.`cfu`,`courses`.`name`, `courses`.`description`, `courses`.`period`, `courses`.`website`, `degrees`.`name`
FROM `courses`
JOIN`degrees` ON `courses`.`degree_id`=`degrees`.`id`
WHERE `degrees`.`name`="Corso di Laurea in Informatica"
*/


/*2. Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame

SELECT `courses`.`id` AS `courseId`, `exams`.`id` AS `examId`,`courses`.`name`, `courses`.`cfu`, `exams`.`date`, `exams`.`hour`,`exams`.`location`
FROM courses
JOIN `exams` ON `exams`. `course_id`= `courses`.`id`
WHERE	 `courses`.`id`= 144
*/

/*3. Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)

SELECT `departments`.`name` AS `departmentsName`, `departments`.`address` AS `addressDepartments`, `departments`.`phone`, `departments`.`head_of_department`, `degrees`.`id` AS `idDegrees`, `degrees`.`name` AS `degreesName`,`degrees`.`level`
FROM departments
JOIN `degrees` ON `degrees`.`department_id`= `departments`.`id`
WHERE `degrees`.`name`= "Corso di Laurea in Diritto dell'Economia"
*/

/*4. Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno*/
/* exams , courses , year , degrees
SELECT `degrees`.`name` AS `degreeName`, `courses`.`name` AS `courseName`, `courses`.`period`, `courses`.`year`, `courses`.`cfu`, `exams`.`date`, `exams`.`hour`, `exams`.`location`, `exams`.`date`
FROM degrees
JOIN `courses` ON `courses`.`degree_id`=`degrees`.`id`
JOIN `exams`ON `exams`.`course_id`= `courses`.`id`
WHERE `degrees`.`name`="Corso di Laurea Magistrale in Fisica"
AND `courses`.`year`= 1
*/

/* Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere (21)
# teachers, course_teacher, courses, degrees
SELECT DISTINCT teachers.name, teachers.surname, teachers.phone
FROM teachers
JOIN course_teacher ON course_teacher.teacher_id= teachers.id
JOIN courses ON course_teacher.course_id= courses.id
JOIN degrees ON courses.degree_id= degrees.id
WHERE degrees.name = "Corso di Laurea in Lettere"
*/
/* Selezionare il libretto universitario di Mirco Messina (matricola n. 620320) 
# student ,  courses, exams, exam_student
SELECT students.name , students.surname, students.registration_number, courses.name AS coursesName, exam_student.vote
FROM students
JOIN exam_student ON exam_student.student_id= students.id
JOIN exams ON exam_student.exam_id=exams.id
JOIN courses ON exams.course_id= courses.id
WHERE students.name= "Mirco"
AND students.surname="Messina"
AND exam_student.vote>=18
*/














