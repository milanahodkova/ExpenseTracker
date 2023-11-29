package servlet;

import dao.UserDao;
import db.HibernateUtil;
import entity.User;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String about = req.getParameter("about");

        User user = new User(fullName,email,password,about);
        //System.out.println(user);

        UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
        boolean f = dao.saveUser(user);

        HttpSession session = req.getSession();
        if(f){
            session.setAttribute("msg", "Register successfully");
            resp.sendRedirect("register.jsp");
        }else{
            session.setAttribute("msg", "Something wrong on server!");
            resp.sendRedirect("register.jsp");
        }
    }
}
