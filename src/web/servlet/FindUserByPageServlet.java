package web.servlet;

import domain.PageBean;
import domain.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findUserByPageServlet")
public class FindUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String current = request.getParameter("current");
        String rows = request.getParameter("rows");

        if(current == null || "".equals(current)){
            current="1";
        }
        if(rows == null || "".equals(rows)){
            rows="5";
        }

        Map<String, String[]> condition = request.getParameterMap();

        IUserService service = new UserServiceImpl();
        PageBean<User> pb = service.finUserByPage(current,rows,condition);



        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/userListServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
