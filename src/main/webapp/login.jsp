
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <meta name="viewport" content="width=device-width" ,initial-scale=1.0>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>


<div class="fashinable">

    <form id="login" class="input-group" action="login" method="post">
        <header><h1>LOGIN PAGE</h1></header>
        <br><br>
        <label for="log_email">  <input type="text" class="input-field" placeholder="User Email" name="log_email"
                                        id="log_email" placeholder="User email"required></label><br><br>

        <label for="log_password"> <input type="text" class="input-field" placeholder="Enter Password" name="log_password"
                                          id="log_password" required></label><br><br><br>
        <input type="checkbox" class="check-box"><span>Remember Password</span><br><br>

        <button type="submit" style="background-color:#7d6dc3;
        color: #fff; border-radius: 100px;width: 70px;height: 30px;"> LOGIN
        </button>
    </form>
</div>
</body>
</html>