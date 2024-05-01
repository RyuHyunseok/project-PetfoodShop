package co.teamtwo.prj.snack.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class SnackController {
	@Autowired
	private ProductService dao;
	
	@RequestMapping("/snack")
	public String snack(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		Products = dao.ProductSelectList("S");
		model.addAttribute("Products", Products);
		
		int count = Products.size();
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
		
		return "snack/snack";
	}
	
	@RequestMapping("/topping")
	public String topping(Model model) {
		return "snack/topping";
	}
	
	@RequestMapping("/healthfood")
	public String healthfood(Model model) {
		return "snack/healthfood";
	}
	
	@RequestMapping("/petmilk")
	public String petmilk(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("S-1");
		Products = dao.FilteredProductSelectList(vo);
		model.addAttribute("Products", Products);
		
		int count = Products.size();
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
		
		return "snack/petmilk";
	}
	
	@RequestMapping("/treat")
	public String treat(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("S-2");
		Products = dao.FilteredProductSelectList(vo);
		model.addAttribute("Products", Products);
		
		int count = Products.size();
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
		
		return "snack/treat";
	}
	
	@RequestMapping("/gum")
	public String gum(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("S-3");
		Products = dao.FilteredProductSelectList(vo);
		model.addAttribute("Products", Products);
		
		int count = Products.size();
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
		
		return "snack/gum";
	}
	
	@RequestMapping("/supplement")
	public String supplement(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("S-4");
		Products = dao.FilteredProductSelectList(vo);
		model.addAttribute("Products", Products);
		
		int count = Products.size();
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
		
		return "snack/supplement";
	}
	
	@RequestMapping("/giftset")
	public String giftset(Model model) {
		return "snack/giftset";
	}
}
