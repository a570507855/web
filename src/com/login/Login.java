package com.login;

import com.BaseMethod;
import com.main.user.dao.UserMapper;
import com.main.user.model.UserWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("login")
public class Login {

    @Autowired
    private UserMapper userMapper;

    private BaseMethod baseMethod = BaseMethod.getInstance();


    /***
     * 登录操作
     * @param request
     * @param response
     */
    @RequestMapping("login")
    public void login(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        if(session.getAttribute("accountNumber") == null){
            String accountNumber = request.getParameter("accountNumber");
            long phoneNumber = -1;
            String maibox = "";
            //判断是用手机号还是邮箱
            if(baseMethod.isNumer(accountNumber)){
                phoneNumber = Long.parseLong(accountNumber);
            }
            else{
                maibox = accountNumber;
            }
            UserWithBLOBs user = userMapper.selectByAccountNumber(phoneNumber, maibox);

            session.setAttribute("username", user.getUsername());
            session.setAttribute("isMember", user.getIsMember());
            session.setAttribute("sex", user.getSex());
            //设置session过期时间--默认30天
            session.setMaxInactiveInterval(60*60*24*30);
            Cookie c = new Cookie("sid", session.getId());
            //设置cookie过期时间--默认30天
            c.setMaxAge(60*60*24*30);
            c.setPath("/");
            response.addCookie(c);
        }
        try {
            response.sendRedirect("/views/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /***
     * 退出登录
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping("quit")
    public void quit(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.invalidate();

        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out = response.getWriter();
            String html = "<html>" +
                    "<head>" +
                    "<meta http-equiv=\"refresh\" content=\"2; url='/views/home'\">" +
                    "<title>退出登录</title>" +
                    "</head>" +
                    "<body>" +
                    "<div style=\"padding:30px;padding:36px 80px;border:1px solid #a9a9a9;background:#ffffff ; text-align:center; margin:20% auto; background-repeat: no-repeat; width:55%;\">" +
                    "<div><span>成功退出登录！<span></div>" +
                    "<div><a href=\"/views/home\">如果你的浏览器没反应，请点击这里...<a></div>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            out.println(html);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



        /***
     * 验证账号是否已经注册
     * @param accountNumber 账号
     * @return
     */
    @ResponseBody
    @RequestMapping("isRegister")
    public boolean isRegister(String accountNumber){
        long phoneNumber = 0;
        String maibox = "";
        //判断是用手机号还是邮箱
        if(baseMethod.isNumer(accountNumber)){
            phoneNumber = Long.parseLong(accountNumber);
        }
        else{
            maibox = accountNumber;
        }
        long i = userMapper.countByLogin(phoneNumber, maibox);
        return i != 0;
    }

    /***
     * 验证账号密码
     * @param accountNumber 账号
     * @param password  密码
     * @return
     */
    @ResponseBody
    @RequestMapping("isPass")
    public boolean isPass(String accountNumber, String password){
        long phoneNumber = 0;
        String maibox = "";
        UserWithBLOBs user = new UserWithBLOBs();
        long count = 0;
        user.setPassword(password);
        //判断是用手机号还是邮箱
        if(baseMethod.isNumer(accountNumber)){
            phoneNumber = Long.parseLong(accountNumber);
            user.setPhoneNumber(phoneNumber);
            count = userMapper.count(user);
        }
        else{
            maibox = accountNumber;
            user.setMailbox(maibox);
            count = userMapper.count(user);
        }
        return isRegister(accountNumber) && count != 0;
    }
}
