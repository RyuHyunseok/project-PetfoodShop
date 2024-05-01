package co.teamtwo.prj.checkout.web;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import co.teamtwo.prj.cart.service.CartService;
import co.teamtwo.prj.cart.service.CartVO;
import co.teamtwo.prj.member.service.MemberService;
import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.order.service.OrderService;
import co.teamtwo.prj.order.service.OrderVO;
import co.teamtwo.prj.orderDetail.service.OrderDetailService;
import co.teamtwo.prj.orderDetail.service.OrderDetailVO;

@Controller
public class CheckoutController {
	@Autowired
	private CartService dao;
	@Autowired
	private MemberService dao2;
	@Autowired
	private OrderService dao3;
	@Autowired
	private OrderDetailService dao4;
	
	@RequestMapping(value = "/checkoutform", method = RequestMethod.POST)
	public String checkoutform(Model model, CartVO vo, MemberVO MemberInfo,
								@RequestParam("productIds") List<Integer> productIds,
								@RequestParam("productQuantities") List<Integer> productQuantities,
								HttpServletRequest request
								) {
		List<CartVO> Carts = new ArrayList<CartVO>();
		List<Integer> productId = productIds;
		List<Integer> Quantity = productQuantities;		
		
		
		System.out.println(productId);
		System.out.println(Quantity);
		
		for(int i=0; i< productId.size() ; i++) {
			vo.setProductId(productId.get(i));
			vo.setQuantity(Quantity.get(i));
			dao.CartQuantityUpdate(vo);
		};
		
		int id = (int) request.getSession().getAttribute("id");
		
		Carts = dao.CartSelectList(id);
		model.addAttribute("Carts", Carts);
		
		
		MemberInfo.setId(id);
		MemberInfo = dao2.memberSelect2(MemberInfo);
		model.addAttribute("MemberInfo", MemberInfo);
		

		return "checkout/checkoutform";
	}

	
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(Model model, 
						   OrderVO vo, 
						   OrderDetailVO vo2, 
						   CartVO vo3, 
						   @RequestBody Map<String, Object> payload,
						   HttpServletRequest request) {
		

		System.out.println(payload);

		

	    Object idObject = payload.get("id");
	    Object customeridObject = payload.get("customerId");
	    Object nameObject = payload.get("name");
	    Object postcodeObject = payload.get("postcode");
	    Object addressObject = payload.get("Address");
	    Object productNameObject = payload.get("productName");
	    Object tellObject = payload.get("tel");
	    
	    
        long id = Long.parseLong(idObject.toString()); // 주문번호
        int customerId = Integer.parseInt(customeridObject.toString()); // 회원Id
        String name = nameObject.toString();
        String postcode = postcodeObject.toString();
        
        String[] addressParts = addressObject.toString().split(",");
        String road_address = addressParts[0];
        String jibun_address = addressParts[1];
        String detail_address = addressParts[2];
        String shipping_request = addressParts[3];
        
        String tel = tellObject.toString();
        
        String[] productNameParts = productNameObject.toString().split(",");
        

        vo2.setOrderId(id); // OrderDetailVO
        vo.setId(id); // OrderVO
        vo.setCustomerId(customerId);
        vo.setName(name);
        vo.setPostcode(postcode);
        vo.setRoadAddress(road_address);
        vo.setJibunAddress(jibun_address);
        vo.setDetailAddress(detail_address);
        vo.setShippingRequest(shipping_request);
        vo.setTel(tel);
        
        
        dao3.OrderInsert(vo); // OrderServiceDAO

        
        
        for(String productName : productNameParts) {
        		 vo3.setProductName(productName);
                 int productId = dao.getProductIdByProductName(productName); // CartServiceDAO
                 int quantity = dao.getQuantityByProductName(productName); // CartServiceDAO
                 
                 OrderDetailVO orderDetail = new OrderDetailVO();
                 orderDetail.setOrderId(id);
                 orderDetail.setProductId(productId);
                 orderDetail.setQuantity(quantity);
                 
                 System.out.println(orderDetail.getOrderId());
                 System.out.println(orderDetail.getProductId());
                 System.out.println(orderDetail.getQuantity());
                 
                 try {
                	    dao4.OrderDetailInsert(orderDetail);
                	    dao4.ProductQuantityUpdate(orderDetail);
                	} catch (Exception e) {
                	    e.printStackTrace();
                	}
        }
        

        
        int cart_customerId = (int) request.getSession().getAttribute("id");
        
        dao.CartAllDelete(cart_customerId); // CartServiceDAO
		
		return "common/message";
	}
	
	@RequestMapping(value = "/commonmessage", method = RequestMethod.GET)
	public String commonmessage(Model model) {
		
		String message = "결제가 완료되었습니다.";
		model.addAttribute("message" , message);
		
		return "common/message";
	}
}
