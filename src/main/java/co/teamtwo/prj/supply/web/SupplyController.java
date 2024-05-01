package co.teamtwo.prj.supply.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;

@Controller
public class SupplyController {
	@Autowired
	private ProductService dao;
	
	@RequestMapping("/supply")
	public String supply(Model model) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		Products = dao.ProductSelectList("P");
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
		
		return "supply/supply";
	}
	
	@RequestMapping("/pottypad")
	public String pottypad(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("P-1");
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
		
		return "supply/pottypad";
	}
	
	@RequestMapping("/bathsupply")
	public String bathsupply(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("P-2");
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
		
		return "supply/bathsupply";
	}
	
	@RequestMapping("/outingsupply")
	public String outingsupply(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("P-3");
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
		
		return "supply/outingsupply";
	}
	
	@RequestMapping("/dailysupply")
	public String dailysupply(Model model, ProductVO vo) {
		
		List<ProductVO> Products = new ArrayList<ProductVO>();
		
		vo.setCategoryId("P-4");
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
		
		return "supply/dailysupply";
	}
	
	@RequestMapping("/dryfeed")
	public String dryfeed(Model model) {
		return "supply/dryfeed";
	}
}
