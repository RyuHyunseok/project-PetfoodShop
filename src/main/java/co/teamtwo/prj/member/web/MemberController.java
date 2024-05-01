package co.teamtwo.prj.member.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import co.teamtwo.prj.cart.service.CartService;
import co.teamtwo.prj.cart.service.CartVO;
import co.teamtwo.prj.member.service.MailSendService;
import co.teamtwo.prj.member.service.MemberService;
import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.product.service.CategoryVO;
import co.teamtwo.prj.product.service.PagingVO;
import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private MailSendService mailService;
	@Autowired
	private ProductService ps;
	@Autowired
	private CartService cs;
    @Autowired
	private CartService CartServiceDAO;


	@RequestMapping("/signinform")
	public String signinform(Model model) {
		return "member/signinform";
	}

	@RequestMapping("/logincheck")
	public @ResponseBody String logincheck(HttpServletRequest request, HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setUsername(request.getParameter("username"));
		vo.setPassword(request.getParameter("password"));
		String message;
		MemberVO member = ms.memberSelect(vo);
		if (member != null) {
			if(member.getAuth().equals("admin")) {
				message = "admin";
			} else {
				message = "success";
			}
			session.setAttribute("name", member.getName());
			session.setAttribute("username", member.getUsername());
			session.setAttribute("id", member.getId());
			session.setAttribute("auth", member.getAuth());
		} else {
			message = "error";
		}
		return message;
	}

	@RequestMapping("/signupform1")
	public String signupform(Model model) {
		return "member/signupform1";
	}

	@RequestMapping("/signupform2")
	public String signupform2(Model model) {
		return "member/signupform2";
	}

	@RequestMapping("/signupform3")
	public String signupform3(Model model, MemberVO vo) {
		ms.memberInsert(vo);
		model.addAttribute("name", vo.getName());
		return "member/signupform3";
	}

	@RequestMapping("/findid1")
	public String findid1(Model model) {
		return "member/findid1";
	}

	@RequestMapping("/findpassword1")
	public String findpassword1(Model model) {
		return "member/findpassword1";
	}

	@RequestMapping("/findpassword2")
	public String findpassword2(Model model, MemberVO vo) {
		model.addAttribute("email",vo.getEmail());
		model.addAttribute("username",vo.getUsername());
		return "member/findpassword2";
	}

	@RequestMapping("/findpassword3")
	public String findpassword3(Model model, MemberVO vo) {
		model.addAttribute("username",vo.getUsername());
		return "member/findpassword3";
	}

	@RequestMapping("/findpassword4")
	public String findpassword4(Model model, MemberVO vo) {
		ms.memberUpdate(vo);
		return "member/findpassword4";
	}

	@RequestMapping("/findid2")
	public String findid2(Model model,HttpServletRequest request,MemberVO vo) {
		MemberVO resultVO = new MemberVO();
		if(request.getParameter("emailOrTel").equals("email")) {
			vo.setTel(null);
			resultVO = ms.memberSelect(vo);
		} else {
			vo.setEmail(null);
			resultVO = ms.memberSelect(vo);
		}
		model.addAttribute("name", resultVO.getName());
		model.addAttribute("username", resultVO.getUsername());
		return "member/findid2";
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session, HttpServletRequest request) {
		
		Integer id = (Integer) session.getAttribute("id");
		if(id != null) {
			CartServiceDAO.CartAllDelete(id);
			System.out.println("Cartlist의 상품을 삭제했습니다.");			
		} else {
			System.out.println("세션에 id 속성이 존재하지 않습니다.");
		}
		
		session.invalidate();
		
		return "redirect:home";
	}

	@PostMapping("/usernameCheck")
	public @ResponseBody String usernameCheck(String username) {
		MemberVO paramVO = new MemberVO();
		paramVO.setUsername(username);
		MemberVO resultVO = ms.memberSelect(paramVO);
		String message = "";
		if (resultVO == null) {
			message = "success";
		} else {
			message = "error";
		}
		return message;
	}

	@PostMapping("/searchMember")
	public @ResponseBody String searchMember(HttpServletRequest request) {
		MemberVO paramVO = new MemberVO();
		MemberVO resultVO = new MemberVO();
		String message = "";
		paramVO.setName(request.getParameter("name"));
		if (request.getParameter("bool").equals("true")) {
			paramVO.setEmail(request.getParameter("email"));
		} else {
			paramVO.setTel(request.getParameter("tel"));
		}
		
		resultVO = ms.memberSelect(paramVO);
		if(resultVO != null) {
			message = "success";
		} else {
			message = "error";
		}

		return message;
	}
	
	@PostMapping("/searchMember2")
	public @ResponseBody String searchMember2(HttpServletRequest request) {
		MemberVO paramVO = new MemberVO();
		MemberVO resultVO = new MemberVO();
		String message = "";
		paramVO.setName(request.getParameter("name"));
		paramVO.setUsername(request.getParameter("username"));
		resultVO = ms.memberSelect(paramVO);
		if(resultVO != null) {
			message = resultVO.getEmail();
		} else {
			message = "error";
		}

		return message;
	}
	
	@PostMapping("/emailSend")
	public @ResponseBody String emailSend(String email, HttpSession session) {
		String emailNum = mailService.joinEmail(email);
		session.setAttribute("emailNum", emailNum);
		return emailNum;
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		MemberVO paramVO = new MemberVO();
		paramVO.setUsername(session.getAttribute("username").toString());
		MemberVO resultVO = ms.memberSelect(paramVO);
		model.addAttribute("member", resultVO);
		return "member/mypage";
	}
	
	@RequestMapping("/membereditform")
	public String membereditform(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO paramVO = new MemberVO();
		paramVO.setUsername(session.getAttribute("username").toString());
		MemberVO resultVO = ms.memberSelect(paramVO);
		model.addAttribute("member", resultVO);
		return "member/membereditform";
	}
	
	@RequestMapping("/memberdeleteform")
	public String memberdeleteform(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO paramVO = new MemberVO();
		paramVO.setUsername(session.getAttribute("username").toString());
		MemberVO resultVO = ms.memberSelect(paramVO);
		model.addAttribute("member", resultVO);
		return "member/memberdeleteform";
	}
	
	@RequestMapping("/wishlist")
	public String wishlist(Model model, HttpSession session) {
		WishListVO vo = new WishListVO();
		vo.setCustomerId((int)session.getAttribute("id"));
		List<ProductVO> wishlist = ps.WishListSelectProduct(vo);
		model.addAttribute("wishlist", wishlist);
		return "member/wishlist";
	}
	
	@PostMapping(value="/memberUpdate", produces = "application/text; charset=UTF-8")
	public @ResponseBody String memberUpdate(MemberVO vo, HttpSession session) {
		if(vo.getPassword().equals("")) {
			vo.setPassword(null);
		}
		session.setAttribute("name", vo.getName());
		ms.memberUpdate(vo);
		return "회원정보가 변경되었습니다.";
	}
	
	@PostMapping("/ajaxMemberDelete")
	public @ResponseBody void ajaxMemberDelete(HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setUsername(session.getAttribute("username").toString());
		ms.memberDelete(vo);
		session.invalidate();
	}
	
	@PostMapping("/adminMemberDelete")
	public @ResponseBody void adminMemberDelete(MemberVO vo) {
		ms.memberDelete(vo);
	}
	
	@PostMapping(value="wishlistinsert",  produces = "application/text; charset=UTF-8")
	public @ResponseBody String wishlistinsert(ProductVO vo, HttpServletRequest request) {
		
		
		
		String message = "";
		WishListVO wishlistVO = new WishListVO();
		HttpSession session = request.getSession(false);
		if(session.getAttribute("username") != null) {
			wishlistVO.setCustomerId((int)session.getAttribute("id"));
			wishlistVO.setProductId(vo.getId());
			if(ms.SelectWishList(wishlistVO).isEmpty()) {
				ps.WishListInsert(wishlistVO);
			}
			
			int wishlistCount = ps.WishListCount((int)session.getAttribute("id"));
			message = "상품이 찜리스트에 등록되었습니다";
		} else {
			message = "로그인 후 이용해 주세요.";
		}
		return message;
	}
	
	@PostMapping("/wishlistdel")
	public @ResponseBody void wishlistdel(HttpServletRequest request) {
		String[] productList = request.getParameterValues("productList");
		List<ProductVO> products = new ArrayList<ProductVO>();	
		for (String string : productList) {
			ProductVO product = new ProductVO();
			product.setId(Integer.valueOf(string));
			products.add(product);
		}
		ps.WishListDel(products);
		
		Integer id = (Integer) request.getSession().getAttribute("id");
		
		int wishlistCount = ps.WishListCount(id.intValue());
		
	}
	
	@PostMapping("/wishlistcart")
	public @ResponseBody void wishlistcart(HttpServletRequest request, HttpSession session) {
		String[] productList = request.getParameterValues("productList");	
		for (String string : productList) {
			CartVO cartVO = new CartVO();
			cartVO.setCustomerId((int)session.getAttribute("id"));
			cartVO.setProductId(Integer.valueOf(string));
			if(cs.cartSelect(cartVO) == null) { 
				cs.CartInsert(cartVO);
			}
		}
	}
	
	@PostMapping("/wishlistpaginglist")
	public @ResponseBody List<ProductVO> wishlistpaginglist(@RequestParam("num")int num, HttpSession session) {
		WishListVO vo = new WishListVO();
		vo.setCustomerId((int)session.getAttribute("id"));
		int startNum = (num-1)*9;
		int count = 9;
		
		List<ProductVO> products = ms.wishlistPagingList(vo, startNum, count);
		return products;
	}
	
	@RequestMapping("/wishlistpagingbutton")
	public @ResponseBody PagingVO wishlistpagingbutton(@RequestParam("num")int num, HttpSession session) {
		WishListVO vo = new WishListVO();
		vo.setCustomerId((int)session.getAttribute("id"));
		List<ProductVO> products = ps.WishListSelectProduct(vo);
		PagingVO pagingVO = new PagingVO();
		int thisPage = num;
		int totalPage = products.size()/9;
		if(products.size()%9 > 0) {
			totalPage++;
		}
		int endPage =0;
		int startPage =0;
		if(num %5 == 0) {
			endPage = num;
			startPage = endPage-4;
		} else {
			var forBool = true;
			while(forBool) {
				num++;
				if(num %5 == 0) {
					endPage = num;
					startPage = endPage-4;
					forBool = false;
				}
			}
		}
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		boolean prev = false;
		boolean next = false;
		if(totalPage > endPage) {
			next = true;
		}
		if(thisPage > 5) {
			prev = true;
		}
		pagingVO.setThisPage(thisPage);
		pagingVO.setStartPage(startPage);
		pagingVO.setEndPage(endPage);
		pagingVO.setTotalPage(totalPage);
		pagingVO.setPrev(prev);
		pagingVO.setNext(next);
		return pagingVO;
	}
	
	@RequestMapping("/wishlistnullcheck")
	public @ResponseBody String wishlistnullcheck(HttpSession session) {
		String message = "";
		WishListVO vo = new WishListVO();
		vo.setCustomerId((int)session.getAttribute("id"));
		if(ms.SelectWishList(vo).isEmpty()) {
			message = "null";
		} else {
			message = "notNull";
		}
		return message;
	}
	
	@RequestMapping("/mypageorderlist") 
	public String mypageorderlist(Model model) {
		model.addAttribute("message", "테스트");
		return "member/orderlist";
	}
	
	@PostMapping("/home")
	public String loginhome() {
		return "main/home";
	}
	
	@RequestMapping("/getWishlistCount")
	@ResponseBody
	public Map<String, Integer> getWishlistCount(HttpServletRequest request) {
		
		Integer id = (Integer) request.getSession().getAttribute("id");
		
	    if (id == null) {
	       
	    	return null;
	    }
		
		int wishlistCount = ps.WishListCount(id.intValue());
		
		Map<String, Integer> response = new HashMap<>();
		response.put("wishlistCount", wishlistCount);
		
		return response;
	}
}
