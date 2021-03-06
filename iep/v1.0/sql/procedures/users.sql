use `iep`;

DROP PROCEDURE IF EXISTS addUser;
DROP PROCEDURE IF EXISTS addAdmin;
DROP PROCEDURE IF EXISTS addTeacher;
DROP PROCEDURE IF EXISTS addStudent;
DROP PROCEDURE IF EXISTS addParent;
DROP PROCEDURE IF EXISTS removeUser;
DROP PROCEDURE IF EXISTS removeAdmin;

DROP PROCEDURE IF EXISTS grantElder;
DROP PROCEDURE IF EXISTS revokeElder;

DROP PROCEDURE IF EXISTS changeUserPassword;
DROP PROCEDURE IF EXISTS getUserType;

DROP PROCEDURE IF EXISTS authentification;
DROP PROCEDURE IF EXISTS authentificationAdmin;



DROP PROCEDURE IF EXISTS getTeacherInfo;
DROP PROCEDURE IF EXISTS getStudentInfo;
DROP PROCEDURE IF EXISTS getElderInfo;
DROP PROCEDURE IF EXISTS getParentInfo;

DROP PROCEDURE IF EXISTS getAllAdmins;
DROP PROCEDURE IF EXISTS getAllUsers;
DROP PROCEDURE IF EXISTS getAllStudents;
DROP PROCEDURE IF EXISTS getAllElders;
DROP PROCEDURE IF EXISTS getAllStudentsElders;
DROP PROCEDURE IF EXISTS getAllParents;
DROP PROCEDURE IF EXISTS getAllTeachers;


DROP PROCEDURE IF EXISTS setChild;
DROP PROCEDURE IF EXISTS unsetChild;
DROP PROCEDURE IF EXISTS changeRelation;
DROP PROCEDURE IF EXISTS getChilds;


DROP PROCEDURE IF EXISTS setSubject;
DROP PROCEDURE IF EXISTS unsetSubject;
DROP PROCEDURE IF EXISTS getSubjects;
DROP PROCEDURE IF EXISTS getUnsetSubjects;

/* Реализация */

DELIMITER //

CREATE PROCEDURE addUser(sn char(30), fn char(30), pt char(30), email char(30), passwd char(32), u_type int)
BEGIN
	INSERT INTO `users` (`sn`, `fn`, `pt`, `email`, `passwd`, `id_type_user`) VALUES (sn, fn, pt, email, passwd, u_type);
END;


CREATE PROCEDURE addAdmin(sn char(30), fn char(30), pt char(30), email char(30), passwd char(32))
BEGIN
	INSERT INTO `admins` (`sn`, `fn`, `pt`, `email`, `passwd`) VALUES (sn, fn, pt, email, passwd);
END;

CREATE PROCEDURE addTeacher(sn char(30), fn char(30), pt char(32), t_email char(255), paswd char(32), info text)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;

	START TRANSACTION;
	INSERT INTO `users` (`fn`, `sn`, `pt`, `email`, `passwd`, `id_type_user`) VALUES (fn, sn, pt, t_email, paswd, 1);
	INSERT INTO `teachers` (`id_teacher`, `info`) VALUES ((SELECT DISTINCT LAST_INSERT_ID() FROM `users`), info);
	COMMIT;
END;

CREATE PROCEDURE addStudent(sn char(30), fn char(30), pt char(30), s_email char(30), paswd char(32), ha char(255), cp char(30), s_grp int)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
    
	START TRANSACTION;
	INSERT INTO `users` (`sn`, `fn`, `pt`, `email`, `passwd`, `id_type_user`) VALUES (sn, fn, pt, s_email, paswd, 3);
	INSERT INTO `students` (`id_student`, `home_address`, `cell_phone`, `grp`) VALUES ((select getStudentId(s_email)), ha, cp, s_grp);
	COMMIT;
END;

CREATE PROCEDURE addParent(sn char(30), fn char(30), pt char(30), p_email char(30), paswd char(32), p_age int(11), p_education char(50), p_wp char(255), p_post char(255), hp char(30), cp char(30))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
    
	START TRANSACTION;
	INSERT INTO `users` (`fn`, `sn`, `pt`, `email`, `passwd`, `id_type_user`) VALUES (fn, sn, pt, p_email, paswd, 4);
	INSERT INTO `parents` (`id_parent`, `age`, `education`, `work_place`, `post`, `home_phone`, `cell_phone`) VALUES (getParentId(p_email), p_age, p_education, p_wp, p_post, hp, cp);
	COMMIT;
END;

CREATE PROCEDURE removeUser(u_email char(30))
BEGIN
	DELETE FROM `users` WHERE `email`=u_email;
END;

CREATE PROCEDURE removeAdmin(a_email char(30))
BEGIN
	DELETE FROM `admins` WHERE `email`=a_email;
END;

CREATE PROCEDURE grantElder(s_email char(30))
BEGIN
	DECLARE grp_id int;
	SELECT `grp` INTO grp_id FROM `users` u INNER JOIN `students` s ON u.id_user=s.id_student WHERE `email`=s_email;
	
	IF NOT (isGroupHaveElder(grp_id)) THEN
		UPDATE `users` u SET u.id_type_user=2
		WHERE u.email=s_email AND u.id_type_user=3;	
	END IF;
END;

CREATE PROCEDURE revokeElder(s_email char(30))
BEGIN
	UPDATE `users` u SET u.id_type_user=3
	WHERE u.email=s_email AND u.id_type_user=2;
END;

CREATE PROCEDURE changeUserPassword(u_email char(30), old_passwd char(32), new_passwd char(32))
BEGIN
	UPDATE `users` SET `password`=new_passwd WHERE `email`=u_email AND `password`=old_passwd;
END;

CREATE PROCEDURE authentification(u_email char(30), u_paswd char(32))
BEGIN
	SELECT * FROM `users` WHERE `email`=u_email AND `passwd`=u_paswd;
END;

CREATE PROCEDURE authentificationAdmin(u_email char(30), u_paswd char(32))
BEGIN
	SELECT * FROM `admins` WHERE `email`=u_email AND `passwd`=u_paswd;
END;

CREATE PROCEDURE getUserType()
BEGIN
	SELECT * FROM `typeUser` ORDER BY `id_type_user`, `description`;
END;

CREATE PROCEDURE getTeacherInfo(emailUser char(30))
BEGIN
	SELECT * FROM `v_Teachers` WHERE `email`=emailUser;
END;

CREATE PROCEDURE getStudentInfo(emailUser char(30))
BEGIN
	SELECT * FROM `v_Students` WHERE `email`=emailUser;
END;

CREATE PROCEDURE getElderInfo(emailUser char(30))
BEGIN
	SELECT * FROM `v_Elders` WHERE `email`=emailUser;
END;

CREATE PROCEDURE getParentInfo(emailUser char(30))
BEGIN
	SELECT * FROM `v_Parents` WHERE `email`=emailUser;
END;

CREATE PROCEDURE getAllAdmins()
BEGIN
	SELECT * FROM `admins` ORDER BY `sn`, `fn`, `pt`;
END;

CREATE PROCEDURE getAllUsers()
BEGIN
	SELECT * FROM `v_Users`;
END;

CREATE PROCEDURE getAllStudents()
BEGIN
	SELECT * FROM `v_Students`;
END;

CREATE PROCEDURE getAllElders()
BEGIN
	SELECT * FROM `v_Elders`;
END;

CREATE PROCEDURE getAllStudentsElders()
BEGIN
	(select * from `v_Students`)
	union all
	(select * from `v_Elders`);
END;

CREATE PROCEDURE getAllParents()
BEGIN
	SELECT * FROM `v_Parents`;
END;

CREATE PROCEDURE getAllTeachers()
BEGIN
	SELECT * FROM `v_Teachers`;
END;




/* Работа с детьми */

CREATE PROCEDURE setChild(p_email char(30), s_email char(30), type_relation int)
BEGIN
  INSERT INTO `parent_child` (`id_parent`, `id_children`, `id_type_relation`) VALUES (getParentId(p_email), getStudentId(s_email), type_relation);
END;

CREATE PROCEDURE unsetChild(emailParent char(30), emailStudent char(30))
BEGIN
	DELETE FROM `parent_child` WHERE `id_parent`=getParentId(emailParent) AND `id_children`=getStudentId(emailStudent);
END;

CREATE PROCEDURE changeRelation(emailParent char(30), emailStudent char(30), new_id_relation int)
BEGIN
	UPDATE `parent_child`
	SET `id_type_relation`=new_id_relation
	WHERE `id_parent`=getParentId(emailParent) AND `id_children`=getStudentId(emailStudent);
END;

CREATE PROCEDURE getChilds(emailParent char(30))
BEGIN
	SELECT  u.sn, 
			u.fn, 
			u.pt, 
            u.email, 
            u.passwd, 
            s.home_address, 
            s.cell_phone, 
            g.description as 'group', 
            sp.description as 'specialty', 
            r.description as 'relation'
	FROM `parent_child` pc
		INNER JOIN `users`     u  ON pc.id_children      = u.id_user
		INNER JOIN `students`  s  ON u.id_user           = s.id_student
		INNER JOIN `groups`    g  ON s.grp               = g.grp
		INNER JOIN `specialty` sp ON g.spec_id           = sp.id_spec
		INNER JOIN `relations` r  ON pc.id_type_relation = r.id_relation
	WHERE pc.id_parent=getParentId(emailParent)
	ORDER BY u.fn, u.sn, u.pt;
END;


/* Работа с предметами для преподавателя */

CREATE PROCEDURE setSubject(emailTeacher char(30), subject_id int)
BEGIN
  INSERT INTO `teacher_subjects` (`id_teacher`, `id_subject`) VALUES (getTeacherId(emailTeacher), subject_id);
END;

CREATE PROCEDURE unsetSubject(emailTeacher char(30), subject_id int)
BEGIN
	DELETE FROM `teacher_subjects` WHERE `id_teacher`=getTeacherId(emailTeacher) AND `id_subject`=subject_id;
END;

CREATE PROCEDURE getSubjects(emailTeacher char(30)) /* Для отображения предметов в его аккаунте  */
BEGIN
  SELECT s.description, s.id_subject
	FROM `subjects` s 
		INNER JOIN `teacher_subjects` ts ON s.id_subject=ts.id_subject
	WHERE ts.id_teacher=getTeacherId(emailTeacher)
	ORDER BY `description`;
END;

/*
	Выбирает все выбранные преподавателем предметы
*/

CREATE PROCEDURE getUnsetSubjects(emailTeacher char(30))
BEGIN	
	SELECT s.id_subject, s.description FROM `subjects` s
		LEFT JOIN `teacher_subjects` ts ON s.id_subject=ts.id_subject AND ts.id_teacher=getTeacherId(emailTeacher)
	WHERE ts.id_subject is null;
END;




//

DELIMITER ;