package controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.MD5;
import entity.User;
import service.User_service;
import util.SearchInfo;

@Controller
public class Choice {
@Autowired
User_service service;
@RequestMapping("login")
public String index(ModelMap m,SearchInfo info,User op,HttpSession session) {
	session.removeAttribute("statecount");
	session.removeAttribute("sdetail");
	session.removeAttribute("date");
	// String a=(String) session.getAttribute("randomCode").toString();
	// if (a.equalsIgnoreCase(op.getComments())) {
		 List<User> oo=service.select(info);
			for (int i = 0; i <oo.size(); i++) {
				if (oo.get(i).getEmail().equals(op.getEmail())) {
					if (oo.get(i).getPassword().equals(MD5.MD5(op.getPassword()))) {
						SimpleDateFormat newdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String date =newdate.format(new Date());
						int id =oo.get(i).getId();
						session.setAttribute("date", date);
						session.setAttribute("sdetail",service.getById(id));
						return "redirect:/index.jsp";
					}else {
						 session.setAttribute("statecount", "ÃÜÂë´íÎó!");
						return "redirect:/login.jsp";
					}
				}
			}
	/*}else {
		session.setAttribute("statecount", "ÑéÖ¤Âë´íÎó!");
	}
	 */
			
	return "redirect:/login.jsp";
}
@RequestMapping("clearsession")
public String clearsession(HttpSession session) {
	session.removeAttribute("sdetail");
	return "login";
}

}
