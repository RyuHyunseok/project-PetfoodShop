package co.teamtwo.prj.admin.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.teamtwo.prj.admin.service.AdminProductService;
import co.teamtwo.prj.admin.service.AdminProductVO;
import co.teamtwo.prj.member.service.MemberService;
import co.teamtwo.prj.member.service.MemberVO;

@Controller
public class AdminController {
	@Autowired
	private AdminProductService dao;
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = { "/admin","/admin/home"}, method = RequestMethod.GET)
	public String adminhome(Model model, HttpServletRequest request) {
		
		String auth = (String) request.getSession().getAttribute("auth");
		
		if(auth != null && auth.equals("admin")) {
			List<AdminProductVO> AdminProducts = new ArrayList<AdminProductVO>();
			AdminProducts = dao.AdminProductSelectList();
			model.addAttribute("AdminProducts", AdminProducts);
			
			return "admin/home";
			
		} else {
			return "redirect:/signinform";
		}
	}
	
	@RequestMapping(value = { "/adminmember"})
	public String adminmember(Model model, HttpServletRequest request) {
		
		String auth = (String) request.getSession().getAttribute("auth");
		
		if(auth != null && auth.equals("admin")) {
			List<MemberVO> members = ms.MemberSelectList();
			model.addAttribute("members", members);
			
			return "admin/member";
			
		} else {
			return "redirect:/signinform";
		}
	}
	
	@RequestMapping(value = { "/signout"})
	public String signout(Model model, HttpSession session) {
		session.invalidate();
		return "main/home";
	}
}
