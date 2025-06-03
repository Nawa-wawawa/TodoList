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
<title>新規タスクの設定</title>
</head>

<body class="body">
	<div class="container ">
		<div class="row border border-dark">
			<div class="col-10 bg-info">
				<h1>ToDo管理君</h1>
			</div>
			<div
				class="col-2 bg-info d-grid gap-2 d-md-flex justify-content-md-end p-2">
				<a href="LogoutServlet" class="btn btn-primary" role="button"
					aria-disabled="true">ログアウト</a>
			</div>
			<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark"
				style="background-color: azure;">
				<h2>新規タスクの設定</h2>
				<h4>
					<a href="ListServlet">タスクの一覧</a><br> <a href="UpdateServlet">タスクの更新</a><br>
				</h4>

			</div>
			<div class="col-sm-8 col-12 p-3" style="background-color: azure;">
				<form id="form" name="form" method="post" action="NewtaskServlet">
					<div class="mb-3">
						<!-- 新規作成ラベル -->
						<label for="task-status" class="form-label"><h4>新規作成</h4></label>

						<!-- 状態選択 -->
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon">状態 </span> <select
								class="form-select" aria-label="Default select example"
								id="task-status" name="status">
								<option value="未着手">未着手</option>
								<option value="着手中">着手中</option>
								<option value="完了">完了</option>
							</select>
						</div>

						<!-- タスク名 -->
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon2">タスク名</span> <input
								type="text" class="form-control" id="task-name" name="task"
								aria-describedby="basic-addon2" required />
						</div>

						<!-- 期限 -->
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon3">期限 </span> <input
								type="date" class="form-control" id="datepicker" name="deadline"
								required />
						</div>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#exampleModal">タスクの設定</button>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header bg-info">
									<h1 class="modal-title fs-5" id="exampleModalLabel">決めたタスク内容</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p>状態</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p id="modal-status"></p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p>タスク名</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p id="modal-task"></p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p>期限</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark"
												style="background-color: azure;">
												<p id="modal-deadline"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">戻る</button>
									<button class="btn btn-primary" type="submit"
										aria-disabled="true">確定</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="js/todo.js" defer></script>
	<script src="js/date.js" defer></script>

	<script src="js/bootstrap.bundle.min.js" defer></script>
</body>

</html>