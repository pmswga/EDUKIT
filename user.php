<?php
  require_once "start.php";
	
	use IEP\Structures\News;
	use IEP\Structures\Test;
	use IEP\Structures\OneQuestion;
	use IEP\Structures\Subject;
  use IEP\Structures\TrafficEntry;
	
	if(isset($_SESSION['user']))
	{
		$user = $_SESSION['user'];
		
		switch($user->getUserType())
		{
			case USER_TYPE_STUDENT:
			{
				$sogroups = $UM->query("SELECT * FROM `v_Students` WHERE `grp`=:grp AND `email`!=:email",
					[":grp" => $user->getGroup()->getNumberGroup(), ":email" => $user->getEmail()]
				);
        $elder = $UM->query("SELECT * FROM `v_Elders` WHERE `grp`=:grp",
          [":grp" => $user->getGroup()->getNumberGroup()]
        )[0];
        
        !empty($elder) ? $sogroups[] = $elder : null;
        
				$CT->assign("fio", $user->getSn()." ".$user->getFn()." ".$user->getPt());
				$CT->assign("sogroups", $sogroups);
				$CT->assign("user", $user);
				$CT->assign("tests", $TM->getTestsForGroup($user->getGroup()->getGroupID()));
        
        $traffic = $UM->query("call getTrafficStudent(:s_email)", [":s_email" => $user->getEmail()]);
				
        $CT->assign("traffic", $traffic);
        $CT->assign("completedTests", $TM->getStudentTests($user->getEmail()));
        
				$CT->assign("schedules", $SHM->getScheduleGroup($user->getGroup()->getGroupID()));
        $CT->assign("changed_schedules", $SHM->getChangeScheduleGroup($user->getGroup()->getGroupID()));
        
				$CT->Show("accounts/student.tpl");
			} break;
			case USER_TYPE_TEACHER:
			{
        $user->setTests($TM->getTests($user->getEmail()));
        $user->setNews($NM->getNews($user->getEmail()));
        $user->setSubjects($SM->getSubjects($user->getEmail()));
				
				$CT->assign("user", $user);
				$CT->assign("groups", $GM->getAllGroups());
        $CT->assign("unset_subjects", $SM->getUnsetSubjects($user->getEmail()));
				
				$CT->Show("accounts/teacher.tpl");
				
				if (!empty($_POST['addNewsButton'])) {
					$data = CForm::getData(array("caption", "content", "dp"));
					
					$new_news = new News($data['caption'], $data['content'], $user->getEmail(), $data['dp']);
					
					if ($NM->add($new_news)) {
						CTools::Message("Новость опубликована");
					} else {
						CTools::Message("Произошла ошибка");
					}
					
					CTools::Redirect("user.php");
				}
				
				if (!empty($_POST['removeNewsButton'])) {
					$select_news = $_POST['select_news'];
					
          if (!empty($select_news)) {
            $result = true;
            for ($i = 0; $i < count($select_news); $i++) {
              $result *= $NM->remove($select_news[$i]);
            }
            
            if ($result) {
              CTools::Message("Новости были удалены");
            } else {
              CTools::Message("Произошла ошибка");
            }
            
            CTools::Redirect("user.php");
          }
          
				}
        
				if (!empty($_POST['setSubjectButton'])) {
					$select_subject = $_POST['select_subject'];
          
          if (!empty($select_subject)) {            
            $result = true;
            for ($i = 0; $i < count($select_subject); $i++) {
              $result *= $SM->setSubject($user->getEmail(), $select_subject[$i]);
            }
            
            if ($result) {
              CTools::Message("Предметы успешно назначены");
            } else {
              CTools::Message("Произошла ошибка");
            }
            
            CTools::Redirect("user.php");
          }
          
				}
				
				if (!empty($_POST['unsetSubjectButton'])) {
					$select_subject = $_POST['select_subject'];
					
          if (!empty($select_subject)) {
            $result = true;
            for ($i = 0; $i < count($select_subject); $i++) {
              $result *= $SM->unsetSubject($user->getEmail(), $select_subject[$i]);
            }
            
            if ($result) {
              CTools::Message("Предметы убраны");
            } else {
              CTools::Message("Произошла ошибка");
            }
            
            CTools::Redirect("user.php");
          }
          
				}
				
				if (!empty($_POST['addTestButton'])) {
					$caption = htmlspecialchars($_POST['caption']);
					$subject = $_POST['subject'];
					$select_group = $_POST['select_group'] ?? array();
					
					$new_test = new Test($caption, $subject, $user->getEmail(), $select_group);
          
					if ($TM->add($new_test)) {
						CTools::Message("Тест успешно создан");
					} else {
						CTools::Message("Произошла ошибка");
					}
					
					CTools::Redirect("user.php");
				}
				
				if (!empty($_POST['removeTestButton'])) {
					$select_test = $_POST['select_test'];
          
          if (!empty($select_test)) {
            
            $result = true;
            for ($i = 0; $i < count($select_test); $i++) {
              $TM->remove($select_test[$i]);
            }
            
            if ($result) {
              CTools::Message("Тест удалён");
            } else {
              CTools::Message("Произошла ошибка");
            }
            
            CTools::Redirect("user.php");
          }
          
				}
				
			} break;
			case USER_TYPE_PARENT:
			{
        
				$CT->assign("user", $user);
        
        $childs = array();
        foreach ($user->getChilds() as $child) {
          
          $tests = $TM->getStudentTests($child->getEmail());
          $traffic = $UM->query("call getTrafficStudent(:s_email)", [":s_email" => $child->getEmail()]);
          
          $childs[] = array(
            "student" => $child,
            "tests"   => $tests,
            "traffic" => $traffic
          );
          
        }
				$CT->assign("childs", $childs);
        
				$CT->Show("accounts/parent.tpl");
			} break;
      case USER_TYPE_ELDER:
      {
        
        $ifTrafficFixed = $UM->query("SELECT ifTrafficFixed(:e_email) as result", 
          [":e_email" => $user->getEmail()]
        )[0]['result'];
        
        if ($ifTrafficFixed == 0) {
          
          $sogroups = $UM->query("SELECT * FROM `v_Students` WHERE `grp`=:grp",
            [":grp" => $user->getGroup()->getNumberGroup()]
          );
          $CT->assign("sogroups", $sogroups);
          
        }
        
        $traffic = $UM->query("call getTrafficStudent(:s_email)", [":s_email" => $user->getEmail()]);
				
        $CT->assign("user", $user);
				$CT->assign("tests", $TM->getTestsForGroup($user->getGroup()->getGroupID()));
        $CT->assign("traffic", $traffic);
        
        if (!empty($_POST['commitTrafficButton'])) {
          $count_pairs = $_POST['count_pairs'];
          $traffic = $_POST['traffic'];
          
          $result = true;
          foreach ($traffic as $key => $value) {
            $result *= $TRM->add(new TrafficEntry($key, date("Y.m.d"), $value[0]*2, $count_pairs*2)); 
          }
          
          if ($result) {
            CTools::Message("Изменения зафиксированны");
          } else {
            CTools::Message("Ошибка при фиксации");
          }
          
          CTools::Redirect("user.php");
          
        }
        
        
        $CT->Show("accounts/elder.tpl");
      } break;
      default:
      {
        unset($_SESSION['user']);
        CTools::Redirect("index.php");
      } break;
		}
	}
	else CTools::Redirect("index.php");
	
?>
