package co.teamtwo.prj.product.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.product.service.CategoryVO;
import co.teamtwo.prj.product.service.ProductMapper;
import co.teamtwo.prj.product.service.ProductService;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;

@Service
@Primary
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper map;
		
	@Override
	public List<ProductVO> ProductSelectList(String firstCharacter) {
		// TODO Auto-generated method stub
		return map.ProductSelectList(firstCharacter);
	}

	@Override
	public ProductVO ProductSelect(ProductVO vo) {
		// TODO Auto-generated method stub
		return map.ProductSelect(vo);
	}

	@Override
	public int ProductInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		return map.ProductInsert(vo);
	}

	@Override
	public int ProductUpdate(ProductVO vo) {
		// TODO Auto-generated method stub
		return map.ProductUpdate(vo);
	}

	@Override
	public int ProductDelete(ProductVO vo) {
		// TODO Auto-generated method stub
		return map.ProductDelete(vo);
	}
	
	@Override
	public List<ProductVO> FilteredProductSelectList(ProductVO vo) {
		
		return map.FilteredProductSelectList(vo);
	}

	@Override
	public List<ProductVO> ProductSearch(ProductVO vo) {
		// TODO Auto-generated method stub
		return map.ProductSearch(vo);
	}

	@Override
	public List<ProductVO> ProductSort(List<ProductVO> productList, String sortBy) {
		// TODO Auto-generated method stub
		return map.ProductSort(productList, sortBy);
	}

	@Override
	public List<ProductVO> CategoryProductSelect(CategoryVO vo) {
		// TODO Auto-generated method stub
		return map.CategoryProductSelect(vo);
	}

	@Override
	public List<ProductVO> PagingProductSelectList(CategoryVO vo, int startNum, int count) {
		// TODO Auto-generated method stub
		return map.PagingProductSelectList(vo, startNum, count);
	}

	@Override
	public int WishListInsert(WishListVO wishlistVO) {
		// TODO Auto-generated method stub
		return map.WishListInsert(wishlistVO);
	}

	@Override
	public List<ProductVO> WishListSelectProduct(WishListVO vo) {
		// TODO Auto-generated method stub
		return map.WishListSelectProduct(vo);
	}

	@Override
	public int WishListDel(List<ProductVO> productList) {
		// TODO Auto-generated method stub
		return map.WishListDel(productList);
	}
	
	@Override
	public List<ProductVO> RandomProductSelectList(){
		return map.RandomProductSelectList();
	}
	
	@Override
	public List<ProductVO> RandomFoodSelectList(){
		return map.RandomFoodSelectList();
	}
	@Override
	public List<ProductVO> RandomSnackSelectList(){
		return map.RandomSnackSelectList();
	}
	@Override
	public List<ProductVO> RandomSupplySelectList(){
		return map.RandomSupplySelectList();
	}

	@Override
	public List<ProductVO> RandomSelectList(){
		return map.RandomSelectList();
	}
	
	@Override
	public int WishListCount(int id) {
		return map.WishListCount(id);
	}
}
