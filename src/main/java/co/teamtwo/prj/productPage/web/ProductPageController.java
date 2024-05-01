package co.teamtwo.prj.productPage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.order.service.OrderService;
import co.teamtwo.prj.order.service.OrderVO;
import co.teamtwo.prj.payment.RefundService;
import co.teamtwo.prj.product.service.CategoryVO;
import co.teamtwo.prj.product.service.PagingVO;
import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;

@Controller
public class ProductPageController {
	@Autowired
	private ProductService dao;
	@Autowired
	private RefundService rs;
	@Autowired
	private OrderService os;
	
	@RequestMapping("/food")
	public String ProductPage(Model model) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		Products = dao.ProductSelectList("F");
		int count = Products.size();
		model.addAttribute("Products", Products);
		model.addAttribute("totalNumber", count);
		
		List<ProductVO> RandomList1 = new ArrayList<ProductVO>();
		RandomList1 = dao.RandomProductSelectList();
		List<ProductVO> RandomList2 = new ArrayList<ProductVO>();
		RandomList2 = dao.RandomProductSelectList();
		List<ProductVO> RandomList3 = new ArrayList<ProductVO>();
		RandomList3 = dao.RandomProductSelectList();
		model.addAttribute("RandomList1", RandomList1);
		model.addAttribute("RandomList2", RandomList2);
		model.addAttribute("RandomList3", RandomList3);
		
		return "food/food";
	}
	
	@RequestMapping("/searchresult")
	public String searchresult(Model model, ProductVO vo) {
		model.addAttribute("searchInput", vo.getName());
		List<ProductVO> products = dao.ProductSearch(vo);
		model.addAttribute("products", products);
		return "search/searchresult";
	}
	
	@RequestMapping("/paginglist")
	public @ResponseBody List<ProductVO> paginglist(int num, CategoryVO vo, String sortBy) {
		List<ProductVO> products = dao.CategoryProductSelect(vo);
		List<ProductVO> sortProducts = dao.ProductSort(products, sortBy);
		int startNum = (num-1)*9;
		int count = 9;
		List<ProductVO> returnProducts = new ArrayList<ProductVO>();
		for(var i = startNum; i < (startNum+count); i++) {
			if(i == sortProducts.size()) {
				break;
			} else {
				returnProducts.add(sortProducts.get(i));
			}
		}
		return returnProducts;
	}
	
	@RequestMapping("/searchpaginglist")
	public @ResponseBody List<ProductVO> searchpaginglist(String[] productList, String sortBy, int num) {
		List<ProductVO> products = new ArrayList<ProductVO>();
		for(String id: productList) {
			if(!id.equals("")) {
				ProductVO vo = new ProductVO();
				vo.setId(Integer.valueOf(id));
				products.add(vo);
			}
		}
		List<ProductVO> sortProducts = dao.ProductSort(products, sortBy);
		int startNum = (num-1)*9;
		int count = 9;
		List<ProductVO> returnProducts = new ArrayList<ProductVO>();
		for(var i = startNum; i < (startNum+count); i++) {
			if(i == sortProducts.size()) {
				break;
			} else {
				returnProducts.add(sortProducts.get(i));
			}
		}
		
		return returnProducts;
	}
	
	@RequestMapping("/pagingbutton")
	public @ResponseBody PagingVO pagingbutton(int num, CategoryVO categoryVO) {
		List<ProductVO> products = dao.CategoryProductSelect(categoryVO);
		PagingVO vo = new PagingVO();
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
		vo.setThisPage(thisPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		vo.setPrev(prev);
		vo.setNext(next);
		return vo;
	}
	
	@RequestMapping("/searchpagingbutton")
	public @ResponseBody PagingVO searchpagingbutton(String[] productList, int num) {
		List<ProductVO> products = new ArrayList<ProductVO>();
		for(String id: productList) {
			if(!id.equals("")) {
				ProductVO vo = new ProductVO();
				vo.setId(Integer.valueOf(id));
				products.add(vo);
			}
		}
		PagingVO vo = new PagingVO();
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
		vo.setThisPage(thisPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		vo.setPrev(prev);
		vo.setNext(next);
		return vo;
	}
	
	@RequestMapping("/categorytotalnumber")
	public @ResponseBody int categorytotalnumber(CategoryVO vo) {
		List<ProductVO> products = dao.CategoryProductSelect(vo);
		int count = products.size();
		return count;
	}
	
	@RequestMapping("/searchtotalnumber")
	public @ResponseBody int searchtotalnumber(String[] productList) {
		List<ProductVO> products = new ArrayList<ProductVO>();
		for(String id: productList) {
			if(!id.equals("")) {
				ProductVO vo = new ProductVO();
				vo.setId(Integer.valueOf(id));
				products.add(vo);
			}
		}
		int count = products.size();
		return count;
	}

	@PostMapping("/gettoken")
	public @ResponseBody String gettoken(@RequestParam("apiKey")String apiKey, @RequestParam("secretKey")String secretKey) throws IOException {
		return rs.getToken(apiKey, secretKey);
	}
	
	@PostMapping("/refundrequest")
	public @ResponseBody void refundrequest(@RequestParam("token")String token, @RequestParam("merchant_uid")Long merchant_uid, @RequestParam("reason")String reason) throws IOException {
		rs.refundRequest(token,String.valueOf(merchant_uid), reason);
	}
}
