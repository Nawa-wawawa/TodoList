<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/login.css" rel="stylesheet" />
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
				<a href="LoginServlet" class="btn btn-primary" role="button"
					aria-disabled="true">ログアウト</a>
			</div>
		</div>
		<div class="row min-vh-100 border border-dark">
			<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
				style="background-color: azure;">
				<h2>タスク詳細</h2>
				<h4>
					<a href="ListServlet">タスクの一覧</a><br>
					<a href="NewtaskServlet">タスクの新規設定</a>
				</h4>

			</div>
			<div class="col-sm-8 col-12 p-2 border border-dark "
				style="background-color: azure;">
				<h2>タスクの一覧</h2>
				<div class="list border border-dark">
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseOne"
									aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
									HTML研修</button>
							</h2>
							<div id="panelsStayOpen-collapseOne"
								class="accordion-collapse collapse show">
								<div class="accordion-body">
									<div class="row">
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>状態</p>
											</div>
											<div class="col-sm-8 col-12 p-2 border border-dark d-flex"
												style="background-color: azure;">
												<select class="form-select"
													aria-label="Default select example">
													<option value="1">完了</option>
													<option value="2">着手中</option>
													<option value="3">未着手</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>タスク名</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>HTML研修</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>期限</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>２０２５年４月２３日</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>担当者</p>
											</div>
											<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
												style="background-color: azure;">
												<p>ナワ ユウマ</p>
											</div>
										</div>
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end p-2">
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal">タスクの変更
									</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
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
								<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>状態</p>
								</div>
								<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark"
									style="background-color: azure;">
									<p>完了</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>タスク名</p>
								</div>
								<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>HTML研修</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>期限</p>
								</div>
								<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>２０２５年４月２３日</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>担当者</p>
								</div>
								<div class="col-sm-8 col-12 ps-2 pt-2 border border-dark "
									style="background-color: azure;">
									<p>ナワ ユウマ</p>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">戻る</button>
						<a href="list.html" class="btn btn-primary" role="button"
							aria-disabled="true">確定</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js" defer></script>
</body>

</html>