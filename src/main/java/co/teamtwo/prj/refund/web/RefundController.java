package co.teamtwo.prj.refund.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.order.service.OrderService;
import co.teamtwo.prj.order.service.OrderVO;
import co.teamtwo.prj.orderDetail.service.OrderDetailService;
import co.teamtwo.prj.orderDetail.service.OrderDetailVO;
import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class RefundController {
	@Autowired
	private OrderService os;
	@Autowired
	private OrderDetailService ods;
	@Autowired
	private ProductService ps;

	@PostMapping("/refundresult")
	public String refundresult(Model model, HttpServletRequest request, HttpSession session) {
		String[] orderId = request.getParameterValues("orderId");
		String[] refundBool = request.getParameterValues("refundBool");

		
		List<OrderVO> successRefundList = new ArrayList<OrderVO>();
		List<OrderVO> failRefundList = new ArrayList<OrderVO>();

		MemberVO vo = new MemberVO();
		vo.setId((int) session.getAttribute("id"));
		List<OrderDetailVO> orderDetailList = ods.OrderDetailSelectList(vo);
		List<ProductVO> productList = ods.OrderDetailProductSelectList(orderDetailList);

		for (int i = 0; i < refundBool.length; i++) {
			if (refundBool[i].equals("success")) {
				OrderVO paramVO = new OrderVO();
				paramVO.setId(Long.valueOf(orderId[i]));
				OrderVO resultVO = os.OrderSelect(paramVO);
				successRefundList.add(resultVO);
			} else {
				OrderVO paramVO = new OrderVO();
				paramVO.setId(Long.valueOf(orderId[i]));
				OrderVO resultVO = os.OrderSelect(paramVO);
				failRefundList.add(resultVO);
			}
		}

		model.addAttribute("successRefundList", successRefundList);
		model.addAttribute("failRefundList", failRefundList);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("productList", productList);
		
		for(OrderVO deleteVO : successRefundList) {
			os.OrderDetailDelete(deleteVO);
			os.OrderDelete(deleteVO);
		}
		
		return "refund/refundresult";
	}
}
