package co.teamtwo.prj.orderlist.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.order.service.OrderService;
import co.teamtwo.prj.order.service.OrderVO;
import co.teamtwo.prj.orderDetail.service.OrderDetailService;
import co.teamtwo.prj.orderDetail.service.OrderDetailVO;
import co.teamtwo.prj.product.service.CategoryVO;
import co.teamtwo.prj.product.service.PagingVO;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class OrderlistController {
	@Autowired
	private OrderService os;
	@Autowired
	private OrderDetailService ods;
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist(Model model) {
		model.addAttribute("message", "테스트2");
		return "orderlist/orderlist";
	}
	
	@RequestMapping(value= "/ordercancel", method = RequestMethod.GET)
	public String ordercancel() {
		return null;
	}
	
	@RequestMapping("/orderspaginglist")
	public @ResponseBody List<OrderVO> orderspaginglist(int num,HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId((int)session.getAttribute("id"));
		List<OrderVO> orders = os.OrderSelectList(memberVO);
		int startNum = (num-1)*9;
		int count = 9;
		List<OrderVO> returnOrders = new ArrayList<OrderVO>();
		for(var i = startNum; i < (startNum+count); i++) {
			if(i == orders.size()) {
				break;
			} else {
				returnOrders.add(orders.get(i));
			}
		}
		return returnOrders;
	}
	
	@RequestMapping("/orderdetailpaginglist")
	public @ResponseBody List<OrderDetailVO> orderdetailpaginglist(HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId((int)session.getAttribute("id"));
		List<OrderDetailVO> orderdetail = ods.OrderDetailSelectList(memberVO);
		return orderdetail;
	}
	
	@RequestMapping("/orderlistpagingbutton")
	public @ResponseBody PagingVO orderlistpagingbutton(int num, HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId((int)session.getAttribute("id"));
		List<OrderVO> orders = os.OrderSelectList(memberVO);
		PagingVO vo = new PagingVO();
		int thisPage = num;
		int totalPage = orders.size()/9;
		if(orders.size()%9 > 0) {
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
		vo.setThisPage(thisPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		vo.setPrev(prev);
		vo.setNext(next);
		return vo;
	}
	
	@RequestMapping("/orderlistproduct")
	public @ResponseBody List<ProductVO> orderlistproduct(HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId((int)session.getAttribute("id"));
		List<OrderDetailVO> orderdetail = ods.OrderDetailSelectList(memberVO);
		if(orderdetail != null && orderdetail.size() > 0) {
			List<ProductVO> products = ods.OrderDetailProductSelectList(orderdetail);
			return products;
		}
		return null;
	}
}
