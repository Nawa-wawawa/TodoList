<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/list.css" rel="stylesheet" />
<title>新規登録</title>
</head>
<body>
	<form method="post" action="MkuserServlet">
		<div class="mb-3">
			<label for="mail" class="form-label">Email address</label> <input
				type="email" class="form-control" id="mail" name="mail"
				aria-describedby="emailHelp" required>
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="pass" class="form-label">Password</label> <input
				type="password" class="form-control" id="pass" name="pass" required>
		</div>
		<div class="mb-3">
			<label for="name" class="form-label">Name</label> <input type="text"
				class="form-control" id="name" name="name" required>
		</div>
		<a href="LoginServlet" type="戻る" class="btn btn-primary">戻る</a>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<script src="js/bootstrap.bundle.min.js" defer></script>
</body>
</html>