<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/list.css" rel="stylesheet" />
<title>タスク一覧</title>
</head>

<body class="body">
	<div class="container ">
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
				<h2>タスク管理</h2>
				<h4>
					<a href="NewtaskServlet">タスクの新規設定</a><br>
				</h4>
				<h4>
					<a href="UpdateServlet">タスクの更新</a>
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
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js" defer></script>
</body>

</html>