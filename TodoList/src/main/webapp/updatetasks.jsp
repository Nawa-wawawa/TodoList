<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.7.10/dist/css/tempus-dominus.min.css" />
<title>タスク詳細（更新、削除）</title>
</head>

<body class="body">
	<div class="container">
		<div class="row border border-dark">
			<div class="col-10 bg-info">
				<h1>ToDo管理君</h1>
			</div>
			<div
				class="col-2 bg-info d-grid gap-2 d-md-flex justify-content-md-end p-2">
				<a href="LogoutServlet" class="btn btn-primary" role="button"
					aria-disabled="true">ログアウト</a>
			</div>
		</div>
		<div class="row min-vh-100 border border-dark">
			<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
				style="background-color: azure;">
				<h2>タスク詳細</h2>
				<h4>
					<a href="ListServlet">タスクの一覧</a><br> <a href="NewtaskServlet">タスクの新規設定</a>
				</h4>

			</div>
			<div class="col-sm-8 col-12 p-2 border border-dark "
				style="background-color: azure;">
				<h2>タスクの一覧</h2>
				<div class="list border border-dark">
					<c:forEach var="item" items="${tasklist}">
						<div class="accordion" id="accordion${item.id}">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading${item.id}">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapse${item.id}"
										aria-expanded="false" aria-controls="collapse${item.id}">
										${item.task}</button>

								</h2>
								<div id="collapse${item.id}" class="accordion-collapse collapse"
									aria-labelledby="heading${item.id}"
									data-bs-parent="#accordion${item.id}">
									<div class="accordion-body">
										<div class="row">
											<div class="row">
												<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>状態</p>
												</div>
												<div
													class="col-sm-8 col-12 ps-2 pt-2 border border-dark d-flex"
													style="background-color: azure;">
													<p class="bg-primary" style="--bs-bg-opacity: .5;">${item.status}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>タスク名</p>
												</div>
												<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>${item.task}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>期限</p>
												</div>
												<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>${item.deadline}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>担当者</p>
												</div>
												<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
													style="background-color: azure;">
													<p>${item.name}</p>
												</div>
											</div>
										</div>
										<div
											class="d-flex justify-content-end align-items-center gap-2">
											<button type="button" class="btn btn-primary mt-3 "
												data-bs-toggle="modal"
												data-bs-target="#Modal${item.getId()}">タスクの変更</button>
											<button type="button" class="btn btn-outline-danger mt-3"
												data-bs-toggle="modal"
												data-bs-target="#Modaldelete${item.getId()}">削除</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="Modaldelete${item.getId()}"
							tabindex="-1" aria-labelledby="ModalLabel${item.getId()}"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="ModalLabel${item.getId()}">本当に削除しますか</h1>
										<button type="submit" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<input type="hidden" name="id" value="${item.getId()}">

									<div class="modal-body">確定を押すとデータベースから選手の情報が駆除されます。</div>
									<div class="modal-footer">
										<form method="post" action="DeleteServlet">
											<input type="hidden" name="id" value="${item.getId()}">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">やめる</button>
											<button type="submit" class="btn btn-danger">確定</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="Modal${item.getId()}" tabindex="-1"
							aria-labelledby="ModalLabel${item.getId()}" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form id="form" name="form" method="post"
										action="UpdateServlet">
										<div class="modal-header bg-info">
											<h1 class="modal-title fs-5" id="ModalLabel${item.getId()}">タスクの変更内容</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<!-- 状態選択 -->
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon">状態 </span>
													<select class="form-select"
														aria-label="Default select example" id="task-status"
														name="status">
														<option value="未着手"
															${item.status == '未着手' ? 'selected' : ''}>未着手</option>
														<option value="着手中"
															${item.status == '着手中' ? 'selected' : ''}>着手中</option>
														<option value="完了"
															${item.status == '完了' ? 'selected' : ''}>完了</option>
													</select>
												</div>

												<!-- タスク名 -->
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon2">タスク名</span>
													<input type="text" class="form-control" id="task-name"
														name="task" aria-describedby="basic-addon2" required
														value="${item.task}" />
												</div>

												<!-- 期限 -->
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon3">期限
													</span> <input type="date" class="form-control" id="datepicker"
														name="deadline" required value="${item.deadline}" />
												</div>
												<input type="hidden" name="id" value="${item.getId()}">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">戻る</button>
											<button class="btn btn-primary" type="submit"
												aria-disabled="true">確定</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Modal -->
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js" defer></script>
	<!--	<script-->
	<!--		src="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.7.10/dist/js/tempus-dominus.min.js"-->
	<!--		defer></script>-->
	<!--	<script src="js/new.js" defer></script>-->
	<!--	<script-->
	<!--		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>-->

</body>

</html>