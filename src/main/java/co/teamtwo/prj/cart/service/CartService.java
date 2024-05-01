package co.teamtwo.prj.cart.service;

import java.util.List;

public interface CartService {

	List<CartVO> CartSelectList(int id);
	int CartInsert(CartVO vo);
	int CartDelete(CartVO vo);
	
	int CartQuantityUpdate(CartVO vo);
	
	int getProductIdByProductName(String productName);
	int getQuantityByProductName(String productName);
	CartVO cartSelect(CartVO vo);
	int CartAllDelete(int cart_customerId);
	
	boolean isProductInCart(CartVO vo);
	
	int CartListCount(int id);
}
