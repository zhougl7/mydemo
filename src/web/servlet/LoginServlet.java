package web.servlet;

import com.alibaba.druid.support.json.JSONUtils;
import org.springframework.beans.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vcode = (String) request.getSession().getAttribute("vcodes");
        request.getSession().removeAttribute("vcodes");
        String checkcode = (String) request.getParameter("checkcode");
        if(!vcode.equalsIgnoreCase(checkcode)){
            request.setAttribute("msg","验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals("admin") && password.equals("123456")){
//            request.getRequestDispatcher("/findUserByPageServlet?current=1&rows=5").forward(request,response);
            response.sendRedirect(request.getContextPath() + "/findUserByPageServlet?current=1&rows=5");
        }else{
            request.setAttribute("msg","账号或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
