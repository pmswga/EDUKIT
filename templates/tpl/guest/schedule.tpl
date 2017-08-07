{assign var="title" value="Расписание"}
{include file='html/begin.tpl'}
<div class="container-fluid">
	{include file='guest/menu.tpl'}
	<div class="row">
		<div class="col-md-12">
			<div class="container-fluid">
				<div id="rings" class="col-md-3">
					<h2>Расписание</h2>
					<nav id="nowDay" class="text-center">
						<ul class="pagination pagination-sm">
							<li id="1"><a>ПН</a></li>
							<li id="2"><a>ВТ</a></li>
							<li id="3"><a>СР</a></li>
							<li id="4"><a>ЧТ</a></li>
							<li id="5"><a>ПТ</a></li>
							<li id="6"><a>СБ</a></li>
							<li id="7"><a>ВС</a></li>
						</ul>
					</nav>
					<table id="schedule_rings" class="table table-bordered">
						<thead>
							<td colspan="2"><h4>Звонки</h4></td>
						</thead>
						<tr>
							<th>1 пара</th>
							<td>8:30 - 10:00</td>
						</tr>
						<tr>
							<th>2 пара</th>
							<td>10:10 - 11:40</td>
						</tr>
						<tr>
							<th>3 пара</th>
							<td>11:50 - 13:40</td>
						</tr>
						<tr>
							<th>4 пара</th>
							<td>13:50 - 15:20</td>
						</tr>
						<tr>
							<th>5 пара</th>
							<td>15:30 - 17:00</td>
						</tr>
						<tr>
							<th>6 пара</th>
							<td>17:10 - 18:30</td>
						</tr>
						<tr>
							<th>7 пара</th>
							<td>18:35 - 20:00</td>
						</tr>
					</table>
					<table id="schedule_lunchs" class="table table-bordered">
						<thead>
							 <td colspan="2"><h4>Обеды</h4></td>
						</thead>
						<tr>
							<td>1 смена (11:40 - 12:10) </td>
							<td> 1, 2 этаж старого здания</td>
						</tr>
						<tr>
							<td>2 смена (12:30 - 12:50) </td>
							<td> 1 этаж нового здания, 3 этаж старого здания</td>
						</tr>
						<tr>
							<td>3 смена (13:20 - 13:40) </td>
							<td> 3, 4 этаж нового здания</td>
						</tr>
					</table>
				</div>
			<div id="news" class="col-md-9">
					<form class="form-inline" method="POST">
						<div class="form-group">
							<select name="group" class="form-control">
                {foreach from=$groups item=group}
                  <option value="{$group->getGroupID()}">{$group->getNumberGroup()}</option>
                {/foreach}
							</select>
						</div>
						<input type="submit" name="selectGroupButton" value="Показать" class="btn btn-default">
					</form>
					<hr>
					<div class="panel-group" id="scheduleGroups">
            {foreach from=$schedules key=grp item=schedule}
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#scheduleGroups" href="#{$grp}">
                      {$grp}
                    </a>
                  </h4>
                </div>
                <div id="{$grp}" class="panel-collapse collapse in">
                  <div class="panel-body">
                    {foreach from=$schedule key=day item=data}
                      <table class="table table-hover">
                        <thead>
                          <h3>{$day}</h3>
                        </thead>
                        <tbody>
                          {foreach from=$data item=entry}
                            <tr>
                              <td>{$entry['pair']}</td>
                              <td>{$entry['subject']}</td>
                            </tr>
                          {/foreach}
                        </tbody>
                      </table>
                    {/foreach}
                    
                    <!--
                    <table id="schedule_lunchs" class="table table-bordered">
                      <thead>
                         <td colspan="7"><h2 align="center">Занятия</h2></td>
                      </thead>
                      <tbody>
                        <tr>
                          <th>Пара</th>
                          <th>Понедельник</th>
                          <th>Вторник</th>
                          <th>Среда</th>
                          <th>Четверг</th>
                          <th>Пятница</th>
                          <th>Суббота</th>
                        </tr>
                          <tr>
                        {foreach from=$schedule item=entry}
                            <td>{$entry['pair']}</td>
                            <td>{$entry['subject']}</td>
                        {/foreach}
                          </tr>
                      </tbody>
                    </table>
                    -->
                  </div>
                </div>
              </div>
            {/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
<script type="text/javascript">

	/*!
		@descp Скрипт для определения дня недели
	*/

	var date = new Date;
	var day = date.getDay();
	
	if(day != 0) {
		document.getElementById(day).setAttribute("class", "active");
	} else {
		document.getElementById("7").setAttribute("class", "active");
	}
	
</script>
{include file='html/end.tpl'}