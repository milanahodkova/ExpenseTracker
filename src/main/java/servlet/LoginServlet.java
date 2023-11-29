package servlet;

import dao.UserDao;
import db.HibernateUtil;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
        User user = dao.login(email, password);

        HttpSession session = req.getSession();
        if(user == null){
            session.setAttribute("msg","invalid Email & Password");
            resp.sendRedirect("login.jsp");
        }else{
            session.setAttribute("loginUser", user);
            resp.sendRedirect("index.jsp");
        }
    }
}
