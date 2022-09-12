package com.example.miniprojectee.servlet;



import com.example.miniprojectee.enums.Gender;
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

@WebServlet(name = "register-page", value = "/register-page", loadOnStartup = 1)
public class RegistrationPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("registration.jsp").forward(req, resp);
            }



}
