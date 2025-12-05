/* 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.name AS nameStudent, students.surname, students .date_of_birth, students.id, degrees.name AS nameDegree
FROM students
JOIN degrees ON students.degree_id=degrees.id
WHERE degrees.name="Corso di Laurea in Economia"*/

/*2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
SELECT degrees.name AS nameDegrees, degrees.level, degrees.email, degrees.website, departments.name AS nameDepartment, departments.phone, departments.head_of_department
FROM degrees
JOIN departments ON degrees.department_id=departments.id
WHERE degrees.level="magistrale"
AND departments.name="Dipartimento di Neuroscienze"
*/

/*Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM course_teacher
JOIN courses ON course_teacher.course_id=courses.id
JOIN teachers ON course_teacher.teacher_id=teachers.id
WHERE teachers.id=44
*/

/*4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nomw

SELECT students.name AS studentName , students.surname, students.degree_id, students.date_of_birth, departments.id AS idDepartment, departments.name AS nameDepartment
FROM students
JOIN degrees ON students.degree_id=degrees.id
JOIN departments ON degrees.department_id=departments.id
ORDER BY students.name ASC , students.surname ASC
*/

/*5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT courses.name AS nameCourse , courses.description, courses.period, courses.year, courses.cfu, teachers.name AS nameTeacher, teachers.surname AS surnameTeacher, teachers.email,teachers.office_address, teachers.office_number
FROM course_teacher
JOIN courses ON course_teacher.course_id=courses.id
JOIN teachers ON course_teacher.teacher_id=teachers.id

*/

/*Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)*/
#distinct elimina duplicati
SELECT 	DISTINCT  teachers.name, teachers.surname, departments.name AS nameDepartment
FROM course_teacher
JOIN teachers ON course_teacher.teacher_id=teachers.id
JOIN courses ON course_teacher.course_id=courses.id
JOIN degrees ON courses.degree_id=degrees.id
JOIN departments ON degrees.department_id=departments.id
WHERE departments.name="Dipartimento di Matematica"




