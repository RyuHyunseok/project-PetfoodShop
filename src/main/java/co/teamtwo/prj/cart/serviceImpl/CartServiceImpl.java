package co.teamtwo.prj.cart.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.cart.service.CartMapper;
import co.teamtwo.prj.cart.service.CartService;
import co.teamtwo.prj.cart.service.CartVO;

@Service
@Primary
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper map;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CartVO> CartSelectList(int id) {
		// TODO Auto-generated method stub
		return map.CartSelectList(id);
	}

	@Override
	public int CartInsert(CartVO vo) {
		// TODO Auto-generated method stub
		return map.CartInsert(vo);
	}

	@Override
	public int CartDelete(CartVO vo) {
		// TODO Auto-generated method stub
		return map.CartDelete(vo);
	}

	@Override
	public int CartQuantityUpdate(CartVO vo) {
		return map.CartQuantityUpdate(vo);
	}
	
	@Override
	public int getProductIdByProductName(String productName) {
		return map.getProductIdByProductName(productName);
	}
	
	@Override
	public int getQuantityByProductName(String productName) {
		return map.getQuantityByProductName(productName);
	}

	@Override
	public CartVO cartSelect(CartVO vo) {
		// TODO Auto-generated method stub
		return map.cartSelect(vo);
	}

	@Override
	public int CartAllDelete(int cart_customerId) {
		return map.CartAllDelete(cart_customerId);
	}
	
	@Override
	public boolean isProductInCart(CartVO vo) {
		return map.isProductInCart(vo);
	}
	
	@Override
	public int CartListCount(int id) {
		return map.CartListCount(id);
	}

}
