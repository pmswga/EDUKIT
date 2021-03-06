use `iep`;

DROP PROCEDURE IF EXISTS addTest;
DROP PROCEDURE IF EXISTS removeTest;
DROP PROCEDURE IF EXISTS changeCaptionTest;
DROP PROCEDURE IF EXISTS changeSubjectTest;
DROP PROCEDURE IF EXISTS setGroup;
DROP PROCEDURE IF EXISTS unsetGroup;

DROP PROCEDURE IF EXISTS getTestsForGroup;
DROP PROCEDURE IF EXISTS getTestGroups;
DROP PROCEDURE IF EXISTS getUnsetGroups;
DROP PROCEDURE IF EXISTS getTests;
DROP PROCEDURE IF EXISTS getTest;
DROP PROCEDURE IF EXISTS getAllTests;
DROP PROCEDURE IF EXISTS clearTest;

DROP PROCEDURE IF EXISTS addQuestion;
DROP PROCEDURE IF EXISTS addAnswer;
DROP PROCEDURE IF EXISTS removeQuestion;
DROP PROCEDURE IF EXISTS removeAnswer;
DROP PROCEDURE IF EXISTS changeCaptionQuestion;
DROP PROCEDURE IF EXISTS changeRAnswerQuestion;
DROP PROCEDURE IF EXISTS changeCaptionAnswer;
DROP PROCEDURE IF EXISTS getQuestions; /* Для конкретного теста */
DROP PROCEDURE IF EXISTS getAnswers; /* Для конкретного вопроса */

DROP PROCEDURE IF EXISTS createStudentTest;
DROP PROCEDURE IF EXISTS putStudentAnswer;
DROP PROCEDURE IF EXISTS getStudentTest;
DROP PROCEDURE IF EXISTS getStudentTests;
DROP PROCEDURE IF EXISTS getStudentAnswers;

DROP PROCEDURE IF EXISTS getStudentsResultByGroup;
DROP PROCEDURE IF EXISTS getStudentsResultByTest;

DROP FUNCTION IF EXISTS isGroupForTest;

DELIMITER //

/* Работа с тестами */

CREATE PROCEDURE addTest(emailTeacher char(30), subject_id int, test_caption char(30))
BEGIN
  INSERT INTO `tests` (`id_teacher`, `id_subject`, `caption`) VALUES (getTeacherId(emailTeacher), subject_id, test_caption);
END;

CREATE PROCEDURE removeTest(test_id int)
BEGIN
  DELETE FROM `tests` WHERE `id_test`=test_id;
END;

CREATE PROCEDURE changeCaptionTest(test_id int, test_caption char(255))
BEGIN
  UPDATE `tests` SET `caption`=test_caption
  WHERE `id_test`=test_id;
END;

CREATE PROCEDURE changeSubjectTest(test_id int, subject_id int)
BEGIN
  UPDATE `tests` SET `id_subject`=subject_id
  WHERE `id_test`=test_id;
END;

CREATE PROCEDURE setGroup(test_id int, test_grp int)
BEGIN
  INSERT INTO `groups_tests` (`id_test`, `id_group`) VALUES (test_id, test_grp);
END;

CREATE PROCEDURE unsetGroup(test_id int, test_grp int)
BEGIN
  DELETE FROM `groups_tests` WHERE `id_test`=test_id AND `id_group`=test_grp;
END;

CREATE PROCEDURE getTestsForGroup(grp int)
BEGIN
	SELECT t.id_test,
			t.caption, 
            CONCAT(u.sn, ' ', LEFT(u.fn, 1), '. ', LEFT(u.pt, 1), '.') as author,
            s.description as subject_caption,
            s.id_subject  as subject_id
    FROM `tests` t
		INNER JOIN `groups_tests` gt ON t.id_test=gt.id_test
		INNER JOIN `subjects` s ON s.id_subject=t.id_subject
        INNER JOIN `users` u ON t.id_teacher=u.id_user 
	WHERE `id_group`=grp;
END;

CREATE PROCEDURE getTestGroups(test_id int)
BEGIN
  SELECT g.grp         as grp_id, 
  			g.description as grp_descp, 
			g.edu_year    as grp_edu_year, 
			g.is_budget	  as grp_payment, 
			s.id_spec     as sped_id, 
			s.code_spec   as spec_code, 
			s.description as spec_descp
  FROM `groups_tests` g_t
    INNER JOIN `groups` g ON g.grp=g_t.id_group
    INNER JOIN `specialty` s ON g.spec_id=s.id_spec
  WHERE g_t.id_test=test_id
  ORDER BY g.description;
END;

CREATE FUNCTION isGroupForTest(test_id int, grp int)
	RETURNS BOOL
BEGIN
	IF EXISTS (SELECT `id_group` FROM `groups_tests` WHERE `id_test`=test_id AND `id_group`=grp) THEN
        RETURN TRUE;
    ELSE
		RETURN false;
    END IF;
END;

/*
 
 Выбирает все не назначенные группы на тест
 
*/

CREATE PROCEDURE getUnsetGroups(test_id int)
BEGIN
	SELECT g.grp as grp_id,
			g.description as grp_descp,
            g.edu_year as grp_edu_year,
            g.is_budget as grp_payment,
            s.id_spec as spec_id,
            s.code_spec as spec_code,
            s.description as spec_descp
    FROM `groups_tests` gt
		RIGHT JOIN `groups` g ON gt.id_group=g.grp AND gt.id_test=test_id
		RIGHT JOIN `specialty` s ON g.spec_id=s.id_spec
	WHERE gt.id_test is null;
END;

CREATE PROCEDURE getTest(test_id int)
BEGIN
  SELECT * FROM `v_Tests` WHERE `id_test`=test_id;
END;

CREATE PROCEDURE getTests(emailTeacher char(30))
BEGIN
  SELECT * FROM `v_Tests` WHERE `author`=emailTeacher;
END;

CREATE PROCEDURE getAllTests()
BEGIN
  SELECT * FROM `v_Tests`;
END;

CREATE PROCEDURE clearTest(test_id int)
BEGIN
  DELETE FROM `questions` WHERE `id_test`=test_id;
END;

CREATE PROCEDURE addQuestion(test_id int, test_question char(255), test_r_answer char(255))
BEGIN
  INSERT INTO `questions` (`id_test`, `question`, `r_answer`) VALUES (test_id, test_question, test_r_answer);
END;

CREATE PROCEDURE addAnswer(question_id int, answ char(255))
BEGIN
  INSERT INTO `answers` (`id_question`, `answer`) VALUES (question_id, answ);
END;

CREATE PROCEDURE removeQuestion(question_id int)
BEGIN
  DELETE FROM `questions` WHERE `id_question`=question_id;
END;

CREATE PROCEDURE removeAnswer(answer_id int)
BEGIN
  DELETE FROM `answers` WHERE `id_answer`=answer_id;
END;

CREATE PROCEDURE changeCaptionQuestion(question_id int, new_quest char(255))
BEGIN
  UPDATE `questions` SET `question`=new_quest WHERE `id_question`=question_id;
END;

CREATE PROCEDURE changeRAnswerQuestion(question_id int, new_r_answer char(255))
BEGIN
  UPDATE `questions` SET `r_answer`=new_r_answer WHERE `id_question`=question_id;
END;

CREATE PROCEDURE changeCaptionAnswer(answer_id int, new_answ char(255))
BEGIN
  UPDATE `answers` SET `answer`=new_answ WHERE `id_answer`=answer_id;
END;

CREATE PROCEDURE getQuestions(test_id int)
BEGIN
  SELECT `id_question`, `question`, `r_answer` FROM `questions` WHERE `id_test`=test_id ORDER BY `id_question`;
END;

CREATE PROCEDURE getAnswers(question_id int)
BEGIN
  SELECT a.id_answer, a.answer
  FROM `answers` a
    INNER JOIN `questions` q ON q.id_question=a.id_question
  WHERE a.id_question=question_id
  ORDER BY a.id_answer;
END;

CREATE PROCEDURE createStudentTest(test_id int, student_email char(30), subject char(255), t_caption char(255), mark int)
BEGIN
	INSERT INTO `student_tests` (`id_student_test`, `id_student`, `subject`, `caption`, `date_pass`, `mark`) VALUES (test_id, getStudentId(student_email), subject, t_caption, now(), mark);
END;

CREATE PROCEDURE putStudentAnswer(student_test int, question char(255), answer char(255))
BEGIN
	INSERT INTO `student_answers` (`id_student_test`, `question`, `answer`) VALUES (student_test, question, answer);
END;

CREATE PROCEDURE getStudentTest(student_email char(255), student_test int)
BEGIN
	SELECT u.email, st.caption, st.subject, st.date_pass, st.mark 
	FROM `student_tests` st 
		INNER JOIN `users` u ON st.id_student=u.id_user
	WHERE st.id_student_test=student_test AND st.id_student=getStudentID(student_email);
END;

CREATE PROCEDURE getStudentTests(student_email char(255))
BEGIN
	SELECT * 
    FROM `student_tests`
    WHERE `id_student`=getStudentId(student_email)
    ORDER BY `caption`;
END;

CREATE PROCEDURE getStudentsResultByTest(test_id int)
BEGIN
    SELECT DISTINCT * FROM v_Groups WHERE id_grp IN (SELECT id_group FROM groups_tests WHERE id_test = test_id);
END;

CREATE PROCEDURE getStudentsResultByGroup(group_id int)
BEGIN
	SELECT * FROM v_Students WHERE grp_id=group_id;
END;

CREATE PROCEDURE getStudentAnswers(student_test int)
BEGIN
  SELECT `question`, `answer`
  FROM `student_answers`
  WHERE `id_student_test`=student_test;
END;


//

DELIMITER ;