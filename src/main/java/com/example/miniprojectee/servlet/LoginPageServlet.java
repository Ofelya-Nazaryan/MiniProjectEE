package com.example.miniprojectee.servlet;

import com.example.miniprojectee.manager.UserManager;
import com.example.miniprojectee.models.User;
import com.example.miniprojectee.util.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "login-page", value = "/login-page", loadOnStartup = 1)
public class LoginPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);

    }



}
