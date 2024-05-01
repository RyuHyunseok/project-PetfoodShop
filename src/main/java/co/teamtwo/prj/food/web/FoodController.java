package co.teamtwo.prj.food.web;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class FoodController {
	@Autowired
	private ProductService dao;

	@RequestMapping(value = "/chicken", method = RequestMethod.GET)
	public String chicken(Model model) {
		
		ProductVO vo = new ProductVO(); /* 이 경우는 요청이 들어올 때 마다 새로운 ProductVO 객체를 생성한다.
											하지만 Spring MVC 에서는 요청 파라미터를 통해 객체를 자동으로 생성하기 때문에 밑의 방법을 쓰는게 간결하다. */
		List<ProductVO> Products = new ArrayList<ProductVO>(); 		
		
		vo.setCategoryId("F-1");
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
		
		return "food/chicken";
	}
	
	@RequestMapping(value = "/beef", method = RequestMethod.GET)
	public String beef(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("F-2");
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
		
		return "food/beef";
	}
	
	@RequestMapping(value = "/salmon", method = RequestMethod.GET)
	public String salmon(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("F-3");
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
		
		return "food/salmon";
	}
	
	@RequestMapping(value = "/duck", method = RequestMethod.GET)
	public String duck(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("F-4");
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
		
		return "food/duck";
	}
	

}
