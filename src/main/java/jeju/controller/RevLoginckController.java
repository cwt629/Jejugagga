package jeju.controller;

// 필요한 import 구문들

import jeju.dao.MemberTableDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RevLoginckController {

    private final MemberTableDao memberTableDao;

    @Autowired
    public RevLoginckController(MemberTableDao memberTableDao) {
        this.memberTableDao = memberTableDao;
    }

    @PostMapping("/login")
    public String login(@RequestParam("id") String id, @RequestParam("password") String password,
                        HttpServletRequest request, HttpSession session) {
        if (memberTableDao.isLoginCheck(id, password)) {
            session.setAttribute("isLoggedIn", true);
            String redirectUrl = request.getParameter("redirect");
            return "redirect:" + (redirectUrl != null ? redirectUrl : "/");
        } else {
            session.setAttribute("isLoggedIn", false);
            return "redirect:/member/loginform/";
        }
    }
}
