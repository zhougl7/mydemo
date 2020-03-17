package web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vcode="";
        String vcodes="";
        int width=88;
        int height=35;
        Random random = new Random();
        BufferedImage image = new BufferedImage(width,height, BufferedImage.TYPE_INT_RGB);
        Graphics graphics = image.getGraphics();
        graphics.setColor(Color.white);
        graphics.fillRect(0,0,width,height);
        graphics.setColor(getRandomColor());
        graphics.drawRect(0,0,width-1,height-1);
        graphics.setFont(new Font("微软雅黑", Font.BOLD, 20));
        //写单词
        for(int i=1;i<=4;i++){
            graphics.setColor(getRandomColor());
            vcode=getRandomWord() + "";
            vcodes=vcodes + vcode;
            graphics.drawString(vcode,i*width/5,height/3*2);
        }
        request.getSession().setAttribute("vcodes",vcodes);
        //画干扰线
        for(int i=1;i<3;i++){
            graphics.setColor(getRandomColor());
            graphics.drawLine(random.nextInt(width),random.nextInt(height),random.nextInt(width),random.nextInt(height));
        }
        //画干扰点
        for(int i=1; i<20;i++){
            graphics.setColor(getRandomColor());
            graphics.drawRect(random.nextInt(width),random.nextInt(height),1,1);
        }

        ImageIO.write(image,"jpg",response.getOutputStream());
    }


    private static Color getRandomColor(){
        Random random = new Random();
        Color color = new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256));
        return color;
    }

    private static char getRandomWord(){
        String words="1234567890abcdefghijklmnopqistuvwxyzABCDEFGHIJKLMNOPQISTUVWXYZ";
        Random random = new Random();
        int ranword = random.nextInt(words.length());
        char word=words.charAt(ranword);
        return word;
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
