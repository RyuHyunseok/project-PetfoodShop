package co.teamtwo.prj.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.teamtwo.prj.member.service.MemberVO;

public interface ProductService {
	List<ProductVO> ProductSelectList(String firstCharacter);
	ProductVO ProductSelect(ProductVO vo);
	int ProductInsert(ProductVO vo);
	int ProductUpdate(ProductVO vo);
	int ProductDelete(ProductVO vo);
	
	List<ProductVO> FilteredProductSelectList(ProductVO vo);
	List<ProductVO> ProductSearch(ProductVO vo);
	List<ProductVO> ProductSort(List<ProductVO> productList,String sortBy);
	List<ProductVO> CategoryProductSelect(CategoryVO vo);
	List<ProductVO> PagingProductSelectList(CategoryVO vo, int startNum, int count);
	int WishListInsert(WishListVO wishlistVO);
	List<ProductVO> WishListSelectProduct(WishListVO vo);
	int WishListDel(List<ProductVO> productList);
	
	List<ProductVO> RandomProductSelectList();
	
	List<ProductVO> RandomFoodSelectList();
	List<ProductVO> RandomSnackSelectList();
	List<ProductVO> RandomSupplySelectList();
	List<ProductVO> RandomSelectList();
	int WishListCount(int id);
	
}
