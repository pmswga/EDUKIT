{assign var="title" value="EDUKIT | Пользователи"}
{$css_links[] = "vt.css"}
{include file="html/begin.tpl"}
  <div class="container-fluid">
    {include file="html/menu.tpl"}
    <div class="row">
      <div class="col-md-2">
        <ul class="nav nav-tabs tabs-left">
          <li class="active"><a href="#addUser" data-toggle="tab">Добавить</a></li>
          <li><a href="#viewUsers" data-toggle="tab">Просмотр</a></li>
          <li><a href="#grant" data-toggle="tab">Старосты</a></li>
          <li><a href="#editUser" data-toggle="tab">Изменить</a></li>
        </ul>
      </div>
      <div class="col-md-10">
        <div class="tab-content">
          <div class="tab-pane active" id="addUser">
            <div class="row">
              <div class="col-md-8">
              </div>
              <div class="col-md-4">
                <fieldset>
                  <legend>Преподаватель</legend>
                  <form name="addTeacherForm" method="POST">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>Фамилия</label>
                          <input type="text" name="sn" maxlength="30" class="form-control">
                        </div>
                        <div class="form-group">
                          <label>Имя</label>
                          <input type="text" name="fn" maxlength="30" class="form-control">
                        </div>
                        <div class="form-group">
                          <label>Отчество</label>
                          <input type="text" name="pt" maxlength="30" class="form-control">
                        </div>
                        <div class="form-group">
                          <label>E-mail</label>
                          <input type="email" name="email" maxlength="30" class="form-control">
                        </div>
                        <div class="form-group">
                          <label>Пароль</label>
                          <input type="password" name="paswd" maxlength="32" class="form-control">
                        </div>
                        <div class="form-group">
                          <label>Информация</label>
                          <textarea name="info" rows="5" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                          <input type="submit" name="addTeacherButton" value="Добавить" class="btn btn-primary">
                        </div>
                      </div>
                    </div>
                  </form>
                </fieldset>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="viewUsers">
						<div class="row">
							<div class="col-md-12">
								<div class="panel-group" id="views_users">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#views_users" href="#view_teachers">Преподаватели</a>
											</h4>
										</div>
										<div id="view_teachers" class="panel-collapse collapse">
											<div class="panel-body">
												<table class="table table-bordered">
													<tr>
														<th>Фамилия</th>
														<th>Имя</th>
														<th>Отчество</th>
														<th>E-mail</th>
														<th>Предметы</th>
													</tr>
													{foreach from=$teachers item=teacher}
														<tr>
															<td>{$teacher->getSn()}</td>
															<td>{$teacher->getFn()}</td>
															<td>{$teacher->getPt()}</td>
															<td>{$teacher->getEmail()}</td>
															<td>
                                {if $teacher->getSubjects() != NULL}
                                  <ul>
                                  {foreach from=$teacher->getSubjects() item=subject}
                                      <li>{$subject->getDescription()}</li>
                                  {/foreach}
                                  </ul>
                                {else}
                                  <h5 align="center">Предметы не выбраны</h5>
                                {/if}
															</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									<div class="panel panel-danger">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#views_users" href="#view_students">Студенты</a>
											</h4>
										</div>
										<div id="view_students" class="panel-collapse collapse">
											<div class="panel-body">
												{foreach from=$studentsByGroup key=group item=student}
													<div class="panel-group" id="view_groups_with_students">
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a data-toggle="collapse" data-parent="#view_groups_with_students" href="#{$group}">{$group}</a>
																</h4>
															</div>
															<div id="{$group}" class="panel-collapse collapse">
																<div class="panel-body"><table class="table table-bordered">
																	<table class="table table-bordered">
																		<tr>
																			<th>Фамилия</th>
																			<th>Имя</th>
																			<th>Отчество</th>
																			<th>E-mail</th>
																			<th>Адрес</th>
																			<th>Телефон</th>
																		</tr>
																		{foreach from=$student item=one_student}
																			<tr>
																				<td>{$one_student->getSn()}</td>
																				<td>{$one_student->getFn()}</td>
																				<td>{$one_student->getPt()}</td>
																				<td>{$one_student->getEmail()}</td>
																				<td>{$one_student->getHomeAddress()}</td>
																				<td>{$one_student->getCellPhone()}</td>
																			</tr>
																		{/foreach}
																	</table>
																</div>
															</div>
														</div>
													</div>
												{/foreach}
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#views_users" href="#view_parents">Родители</a>
											</h4>
										</div>
										<div id="view_parents" class="panel-collapse collapse">
											<div class="panel-body">
												<table class="table table-bordered">
													<tr>
														<th>Фамилия</th>
														<th>Имя</th>
														<th>Отчество</th>
														<th>E-mail</th>
														<th>Возраст</th>
														<th>Образование</th>
														<th>Место работы</th>
														<th>Пост</th>
														<th>Телефон</th>
														<th>Дети</th>
													</tr>
													{foreach from=$parents item=parent}
														<tr>
															<td>{$parent->getFn()}</td>
															<td>{$parent->getSn()}</td>
															<td>{$parent->getPt()}</td>
															<td>{$parent->getEmail()}</td>
															<td>{$parent->getAge()}</td>
															<td>{$parent->getEducation()}</td>
															<td>{$parent->getWorkPlace()}</td>
															<td>{$parent->getPost()}</td>
															<td>
																<ul>
																	<li>Домашний: {$parent->getHomePhone()}</li>
																	<li>Сотовый: {$parent->getCellPhone()}</li>
																</ul>
															</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#views_users" href="#view_elders">Старосты</a>
											</h4>
										</div>
										<div id="view_elders" class="panel-collapse collapse">
											<div class="panel-body">
												<table class="table table-bordered">
													<tr>
														<th>Фамилия</th>
														<th>Имя</th>
														<th>Отчество</th>
														<th>E-mail</th>
                            <th>Группа</th>
													</tr>
													{foreach from=$elders item=elder}
														<tr>
															<td>{$elder->getSn()}</td>
															<td>{$elder->getFn()}</td>
															<td>{$elder->getPt()}</td>
															<td>{$elder->getEmail()}</td>
                              <td>{$elder->getGroup()->getNumberGroup()}</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<fieldset>
							<legend>Удалить пользователя</legend>
							<div class="row">
								<form name="removeUserForm" method="POST" class="form-horizontal">
									<div class="col-md-8">
										<label>Пользователь</label>
										<select name="user" class="form-control">
											{foreach from=$allUsers item=user}
												<option value="{$user->getEmail()}">{$user->getSn()} {$user->getFn()} {$user->getPt()}</option>
											{/foreach}
										</select>
									</div>
									<div class="col-md-4">
										<input type="submit" name="removeUserButton" value="Удалить пользователя" class="btn btn-danger">
									</div>
								</form>
							</div>
						</fieldset>
						<br>
						<fieldset>
							<legend>Изменить тип пользователя</legend>
							<div class="row">
								<form name="changeTypeUserForm" method="POST" class="form-horizontal">
									<div class="col-md-4">
										<label>Пользователь</label>
										<select name="user" class="form-control">
											{foreach from=$allUsers item=user}
												<option value="{$user->getEmail()}">{$user->getSn()} {$user->getFn()} {$user->getPt()}</option>
											{/foreach}
										</select>
									</div>
									<div class="col-md-4">
										<label>Тип</label>
										<select name="type" class="form-control">
											{foreach from=$typeUsers item=typeUser}
												<option value="{$typeUser->getID()}">{$typeUser->getDescp()}</option>
											{/foreach}
										</select>
									</div>
									<div class="col-md-4">
										<input type="submit" name="changeTypeUserButton" value="Изменить тип пользователя" class="btn btn-warning">
									</div>
								</form>
							</div>
						</fieldset>
          </div>
          <div class="tab-pane" id="grant">
            <div class="row">
              <div class="col-md-6">
                <fieldset>
                  <legend>Назначить</legend>
                  <form name="grantElderForm" method="POST">
                    <div class="form-group">
                      <label>Студент</label>
                      <select name="studentEmail" class="form-control">
												{foreach from=$students item=student}
													<option value="{$student->getEmail()}">{$student->getSn()} {$student->getFn()} {$student->getPt()} | <small>{$student->getGroup()->getNumberGroup()}</small></option>
												{/foreach}
											</select>
                    </div>
                    <div class="form-group">
                      <input type="submit" name="grantElderButton" value="Назначить" class="btn btn-primary">
                    </div>
                  </form>
                </fieldset>
              </div>
              <div class="col-md-6">
                <fieldset>
                  <legend>Разжаловать</legend>
                  <form name="revokeElderForm" method="POST">
                    <div class="form-group">
                      <label>Студент</label>
                      <select name="studentEmail" class="form-control">
												{foreach from=$elders item=elder}
													<option value="{$elder->getEmail()}">{$elder->getSn()} {$elder->getFn()} {$elder->getPt()} | <small>{$elder->getGroup()->getNumberGroup()}</small></option>
												{/foreach}
											</select>
                    </div>
                    <div class="form-group">
                      <input type="submit" name="revokeElderButton" value="Разжаловать" class="btn btn-primary">
                    </div>
                  </form>
                </fieldset>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="editUser">
            4
          </div>
        </div>
      </div>
    </div>
  </div>
{include file="html/end.tpl"}