<%--
  Created by IntelliJ IDEA.
  User: Ofelya
  Date: 30-Aug-22
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta lang="UTF 8">
    <meta name="viewport" content="width=device-width" ,initial-scale=1.0>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="register">
    <form action="register" method="post">

        <header>REGISTRATION PAGE</header>
        <br><br>

        <label for="reg_name"> User name: </label>
        <input type="text" name="reg_name" id="reg_name" placeholder="Ofelya">
        <br><br>

        <label for="reg_surname"> User surname: </label>
        <input type="text" name="reg_surname" id="reg_surname" placeholder="Nazaryan">
        <br><br>

        <label for="reg_age"> User age: </label>
        <input type="number" name="reg_age" id="reg_age">
        <br><br>

        <label for="reg_email"> Email </label>
        <input type="email" id="reg_email" name="reg_email" placeholder="ofelya@gmail.com ">
        <br><br>

        <label for="reg_phone_number"> Phone: </label>
        <input type="tel" id="reg_phone_number" name="reg_phone_number" placeholder="+374 77 77 77 77">
        <br><br>

        <label for="reg_password"> Password: </label>
        <input type="password" id="reg_password" name="reg_password" maxlength="12" placeholder="Type no more 12 elemet">
        <br><br>

        <label for="reg_gender"> Gender </label>
        <select id="reg_gender" name="reg_gender">
            <option value="FEMALE">Female</option>
            <option value="MALE">Male</option>
            <option value="OTHER" selected>Other</option>
        </select>


        <br><br>
        <% if (request.getParameter("reg_error")!=null) { %>
        <div class="input-row reg-error"><%=request.getParameter("reg_error")%></div>
        <% } %>

<div>
    <a href="userhome.jsp">
        <button  type="submit"  style="background-color:#7d6dc3; color: #fff; border-radius: 100px;width: 70px;height: 30px;"> Submit</button>
    </a>
    <a href="#">
    <button type="reset"  style="background-color:#7d6dc3; color: #fff; border-radius: 100px;width: 70px;height: 30px;"> Back </button>
    </a>
</div>
</div>
</form>
</body>


</html>
