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
    <title>ログイン</title>
</head>

<body class="body">
    <div class="container rounded d-flex justify-content-center align-items-center" >
        <div class="row border border-dark rounded-2 hako">
            <div class="col-sm-4 col-12 ps-2 pt-2">
                <h1>ログイン</h1>
            </div>

            <div class="col-sm-8 col-12 p-3">
                <form method="post" action="ListServlet">
                    <div class="row">
                        <div class="col-sm-4 col-12 ">
                            <p class="lh-lg">メール</p>
                        </div>
                        <div class="col-sm-8 col-12">
                            <input class="form-control" type="text" id="mail" name="mail" placeholder="メール" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 col-12">
                            <p class="lh-lg">パスワード</p>
                        </div>
                        <div class="col-sm-8 col-12">
                            <input class="form-control" type="password" id="pass" name="pass" placeholder="パスワード" /><br>
                        </div>
                    </div>

                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button class="btn btn-primary" type="submit" name="login-btn" value="ログイン">ログイン</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/bootstrap.bundle.min.js" defer></script>
</body>

</html>