package co.teamtwo.prj.cart.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.teamtwo.prj.cart.service.CartService;
import co.teamtwo.prj.cart.service.CartVO;
import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class CartController {
	@Autowired
	private CartService dao;

	
	@RequestMapping(value = "/cartlist", method = RequestMethod.GET)
	public String cartlist(Model model, 
						   CartVO vo, 
						   HttpServletRequest request) {
		
		Integer id = null;
		Object idObj = request.getSession().getAttribute("id"); /* HttpServletRequest객체는 HTTP요청을 나타내는 객체이며, 요청과 관련된 정보가 
																	모두 객체의 형태로 저장된다(Object 타입) */
		id = (Integer) idObj;
		
		if(id == null) {
			return "redirect:/signinform";
		} else {
			
			List<CartVO> Carts = new ArrayList<CartVO>();
			Carts = dao.CartSelectList(id);
			model.addAttribute("Carts", Carts);
			
			
			return "cart/cartlist";
			
		}
		
	}
	
	@RequestMapping(value = "/addcart", method = RequestMethod.GET)
	public String addcart(RedirectAttributes redirectAttributes, 
						  @RequestParam(name = "productId") int productId, 
						  CartVO vo,
						  HttpServletRequest request) {
		
		Integer id = null;
		Object idObj = request.getSession().getAttribute("id"); /* HttpServletRequest객체는 HTTP요청을 나타내는 객체이며, 요청과 관련된 정보가 
		 															모두 객체의 형태로 저장된다(Object 타입) */
		String referer = request.getHeader("Referer"); // Referer 헤더를 확인해서 해당 URL로 리다이렉트하면 바로 이전의 페이지로 돌아감
		
		
		if (idObj instanceof Integer) { // idObj가 Integer 클래스의 인스턴스이면 참
		    id = (Integer) idObj; // integer 타입으로 캐스팅
		}
		
		if(id == null) {
			
			return "redirect:/signinform";
			
		} else {
		
			
			vo.setProductId(productId);
			vo.setCustomerId(id);
			
			boolean isProductInCart = dao.isProductInCart(vo);
			
			if (isProductInCart) {
				redirectAttributes.addFlashAttribute("successMessage", "이미 장바구니에 있는 상품입니다.");
				return "redirect:" + referer ;
			} else {
			
			int result = dao.CartInsert(vo);
			
				if(result == 1) {
					
					redirectAttributes.addFlashAttribute("successMessage", "상품이 장바구니에 추가되었습니다.");
					
					if (referer != null && !referer.isEmpty()) {
						return "redirect:" + referer;
					} else {
						return "redirect:/home";
					}
					
				} else {
					return "errorPage";
				}
			}
		}
	}
	
	@RequestMapping(value = "/editcart", method = RequestMethod.GET)
	public String editcart() {
		return null;
	}
	
	@RequestMapping(value = "/deletecart", method = RequestMethod.GET)
	public String deletecart(RedirectAttributes redirectAttributes,
							@RequestParam(name = "productId") int productId, 
							CartVO vo) {
		System.out.println(productId);
		
		vo.setProductId(productId);
		
		int result = dao.CartDelete(vo);
		
		if(result == 1) {
			redirectAttributes.addFlashAttribute("successMessage", "상품이 장바구니에서 빠져나갔습니다.");
			return "redirect:/cartlist";
		} else {
			return "errorPage";
		}
	}
	
	@RequestMapping("/getCartlistCount")
	@ResponseBody
	public Map<String, Integer> getCartlistCount(HttpServletRequest request){
		
		Integer id = (Integer) request.getSession().getAttribute("id");
		
		int cartlistCount = dao.CartListCount(id.intValue());
		
		Map<String, Integer> response = new HashMap<>();
		response.put("cartlistCount", cartlistCount);
		
		return response;
	}
	
	
}
