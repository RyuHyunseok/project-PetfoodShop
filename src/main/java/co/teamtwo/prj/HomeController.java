package co.teamtwo.prj;



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
public class HomeController {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private ProductService ProductServiceDAO;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Model model) {
		
		System.out.println(dataSource.toString());
		
		
		List<ProductVO> RandomFoodList = new ArrayList<ProductVO>();
		RandomFoodList = ProductServiceDAO.RandomFoodSelectList();
		model.addAttribute("RandomFoodList", RandomFoodList);
		
		List<ProductVO> RandomSnackList = new ArrayList<ProductVO>();
		RandomSnackList = ProductServiceDAO.RandomSnackSelectList();
		model.addAttribute("RandomSnackList", RandomSnackList);
		
		List<ProductVO> RandomSupplyList = new ArrayList<ProductVO>();
		RandomSupplyList = ProductServiceDAO.RandomSupplySelectList();
		model.addAttribute("RandomSupplyList", RandomSupplyList);
		
		List<ProductVO> RandomList = new ArrayList<ProductVO>();
		RandomList = ProductServiceDAO.RandomSelectList();
		model.addAttribute("RandomList", RandomList);
		
		
		
		return "main/home";
	}

}
