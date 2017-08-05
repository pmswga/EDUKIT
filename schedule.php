<?php
	require_once "start.php";
	
  
  $data = $UM->query("call getScheduleGroup(1)");
  
  $dataByGroup = array();
  foreach ($data as $d) {
    $dataByGroup[$d['group']][] = $d;
  }
  
  $dataByGroupByDay = array();
  foreach ($dataByGroup as $key => $value) {
    
    foreach ($value as $day) {      
      $dataByGroupByDay[$key][$day['day']][] = $day;
    }
    
  }
  
  $CT->assign("schedules", $dataByGroupByDay);
  
	if (!isset($_SESSION['user'])) {
		
    $CT->Show("users/schedule.tpl");
	
  }
	else {
    $CT->Show("guest/schedule.tpl");    
  }

?>