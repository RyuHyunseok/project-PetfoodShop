package co.teamtwo.prj.product.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.teamtwo.prj.admin.service.AdminProductService;
import co.teamtwo.prj.admin.service.AdminProductVO;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.serviceImpl.ProductServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class ProductController {
	@Autowired
	private AdminProductService dao;

	@RequestMapping(value = "/product/productaddform", method = RequestMethod.GET)
	public String productaddform() {
		return "admin/product/productaddform";
	}

	@RequestMapping(value = "/product/productadd", method = RequestMethod.POST)
	public String productadd(@RequestParam("productName") String productName,
							@RequestParam("productPrice") int productPrice,
							@RequestParam("categoryL") String categoryL,
							@RequestParam("categoryM") String categoryM,
							@RequestParam("imgFile") String imgFile,
							@RequestParam("quantity") int quantity,
							Model model) {
		
		AdminProductVO vo = new AdminProductVO();
		vo.setName(productName);
		vo.setPrice(productPrice);
		vo.setCategoryL(categoryL);
		vo.setCategoryM(categoryM);
		vo.setImgName(imgFile);
		vo.setQuantity(quantity);
		
		String L = vo.getCategoryL();
		String M = vo.getCategoryM();
		
		if(M.equals("닭가슴살")) {
			vo.setImgPath("resources/img/food/chicken/"+ imgFile);
		} else if(M.equals("소고기")) {
			vo.setImgPath("resources/img/food/beef/" + imgFile);
		} else if(M.equals("연어")) {
			vo.setImgPath("resources/img/food/salmon/" + imgFile);
		} else if(M.equals("오리")) {
			vo.setImgPath("resources/img/food/duck/" + imgFile);
		} else if(M.equals("펫밀크")) {
			vo.setImgPath("resources/img/snack/petmilk/" + imgFile);
		} else if(M.equals("트릿")) {
			vo.setImgPath("resources/img/snack/treat/" + imgFile);
		} else if(M.equals("껌")) {
			vo.setImgPath("resources/img/snack/chewingGum/" + imgFile);
		} else if(M.equals("영양제")) {
			vo.setImgPath("resources/img/snack/nutrients/" + imgFile);
		} else if(M.equals("배변패드")) {
			vo.setImgPath("resources/img/petSupplies/pad/" + imgFile);
		} else if(M.equals("목욕용품")) {
			vo.setImgPath("resources/img/petSupplies/bathSupplies/" + imgFile);
		} else if(M.equals("외출용품")) {
			vo.setImgPath("resources/img/petSupplies/outdoorSupplies/" + imgFile);
		} else if(M.equals("생활용품")) {
			vo.setImgPath("resources/img/petSupplies/dailySupplies/" + imgFile);
		}
		
		if("강아지화식".equals(L) && "닭가슴살".equals(M)) {
			vo.setCategoryId("F-1");
		} else if("강아지화식".equals(L) && "소고기".equals(M)) {
			vo.setCategoryId("F-2");
		} else if("강아지화식".equals(L) && "연어".equals(M)) {
			vo.setCategoryId("F-3");
		} else if("강아지화식".equals(L) && "오리".equals(M)) {
			vo.setCategoryId("F-4");
		} else if("간식".equals(L) && "펫밀크".equals(M)) {
			vo.setCategoryId("S-1");
		} else if("간식".equals(L) && "트릿".equals(M)) {
			vo.setCategoryId("S-2");
		} else if("간식".equals(L) && "껌".equals(M)) {
			vo.setCategoryId("S-3");
		} else if("간식".equals(L) && "영양제".equals(M)) {
			vo.setCategoryId("S-4");
		} else if("펫용품".equals(L) && "배변패드".equals(M)) {
			vo.setCategoryId("P-1");
		} else if("펫용품".equals(L) && "목욕용품".equals(M)) {
			vo.setCategoryId("P-2");
		} else if("펫용품".equals(L) && "외출용품".equals(M)) {
			vo.setCategoryId("P-3");
		} else if("펫용품".equals(L) && "생활용품".equals(M)) {
			vo.setCategoryId("P-4");
		};
		
		int result = dao.AdminProductInsert(vo);
		
		if (result == 1) {
			model.addAttribute("msg", "add메시지담기");
			model.addAttribute("uri", "/admin");
			return "admin/alert";
		} else {
			return "errorPage";
		}

	}

	@RequestMapping(value = "/product/producteditform", method = RequestMethod.POST)
	public String producteditform(Model model, @RequestParam("productId") int productId) {
		// 넘어온 productId로 DB에서 데이터를 찾아 model에 실어 보낸다
		System.out.println(productId);
		model.addAttribute("productName", "임시 상품 이름");
		model.addAttribute("productId", productId);
		// 전달 받은 "productId"를 뷰로 productId 값을 전달한다.
		return "admin/product/producteditform";
	}

	@RequestMapping(value = "/product/productedit", method = RequestMethod.POST)
	public String productedit(Model model, 
							@RequestParam("productName") String productName,
							@RequestParam("productPrice") int productPrice,
							@RequestParam("categoryL") String categoryL,
							@RequestParam("categoryM") String categoryM,
							@RequestParam("productId") int productId,
							@RequestParam("imgFile") String imgFile,
							@RequestParam("quantity") int quantity) {
		
		AdminProductVO vo = new AdminProductVO();
		vo.setName(productName);
		vo.setPrice(productPrice);
		vo.setCategoryL(categoryL);
		vo.setCategoryM(categoryM);
		vo.setId(productId);
		vo.setImgName(imgFile);
		vo.setQuantity(quantity);
		
		String L = vo.getCategoryL();
		String M = vo.getCategoryM();
		
		if(M.equals("닭가슴살")) {
			vo.setImgPath("resources/img/food/chicken/"+ imgFile);
		} else if(M.equals("소고기")) {
			vo.setImgPath("resources/img/food/beef/" + imgFile);
		} else if(M.equals("연어")) {
			vo.setImgPath("resources/img/food/salmon/" + imgFile);
		} else if(M.equals("오리")) {
			vo.setImgPath("resources/img/food/duck/" + imgFile);
		} else if(M.equals("펫밀크")) {
			vo.setImgPath("resources/img/snack/petmilk/" + imgFile);
		} else if(M.equals("트릿")) {
			vo.setImgPath("resources/img/snack/treat/" + imgFile);
		} else if(M.equals("껌")) {
			vo.setImgPath("resources/img/snack/chewingGum/" + imgFile);
		} else if(M.equals("영양제")) {
			vo.setImgPath("resources/img/snack/nutrients/" + imgFile);
		} else if(M.equals("배변패드")) {
			vo.setImgPath("resources/img/petSupplies/pad/" + imgFile);
		} else if(M.equals("목욕용품")) {
			vo.setImgPath("resources/img/petSupplies/bathSupplies/" + imgFile);
		} else if(M.equals("외출용품")) {
			vo.setImgPath("resources/img/petSupplies/outdoorSupplies/" + imgFile);
		} else if(M.equals("생활용품")) {
			vo.setImgPath("resources/img/petSupplies/dailySupplies/" + imgFile);
		};
		
		if("강아지화식".equals(L) && "닭가슴살".equals(M)) {
			vo.setCategoryId("F-1");
		} else if("강아지화식".equals(L) && "소고기".equals(M)) {
			vo.setCategoryId("F-2");
		} else if("강아지화식".equals(L) && "연어".equals(M)) {
			vo.setCategoryId("F-3");
		} else if("강아지화식".equals(L) && "오리".equals(M)) {
			vo.setCategoryId("F-4");
		} else if("간식".equals(L) && "펫밀크".equals(M)) {
			vo.setCategoryId("S-1");
		} else if("간식".equals(L) && "트릿".equals(M)) {
			vo.setCategoryId("S-2");
		} else if("간식".equals(L) && "껌".equals(M)) {
			vo.setCategoryId("S-3");
		} else if("간식".equals(L) && "영양제".equals(M)) {
			vo.setCategoryId("S-4");
		} else if("펫용품".equals(L) && "배변패드".equals(M)) {
			vo.setCategoryId("P-1");
		} else if("펫용품".equals(L) && "목욕용품".equals(M)) {
			vo.setCategoryId("P-2");
		} else if("펫용품".equals(L) && "외출용품".equals(M)) {
			vo.setCategoryId("P-3");
		} else if("펫용품".equals(L) && "생활용품".equals(M)) {
			vo.setCategoryId("P-4");
		};
		
		int result = dao.AdminProductUpdate(vo);
		
		// [edit 성공 시 alert 출력 후 redirect 하기]
		// msg, uri 실어서 alert.jsp로 보낸다
		// alert.jsp에서는 alert를 출력한 후 location.replace를 사용한다
		if (result == 1) {
			model.addAttribute("msg", "edit메시지담기");
			model.addAttribute("uri", "/admin");
			return "admin/alert";			
		} else {
			return "errorPage";
		}
	}

	@RequestMapping(value = "/product/productdelete", method = RequestMethod.POST)
	public String productdelete(Model model,
								@RequestParam("productId") int productId) {
		
		AdminProductVO vo = new AdminProductVO();
		vo.setId(productId);
		
		int result = dao.AdminProductDelete(vo);
		
		// [delete 성공 시 alert 출력 후 redirect 하기]
		// msg, uri 실어서 alert.jsp로 보낸다
		// alert.jsp에서는 alert를 출력한 후 location.replace를 사용한다
		
		if(result == 1) {
			model.addAttribute("msg", "delete메시지담기");
			model.addAttribute("uri", "/admin");
			return "admin/alert";			
		} else {
			return "errorPage";
		}
	}
	
}
