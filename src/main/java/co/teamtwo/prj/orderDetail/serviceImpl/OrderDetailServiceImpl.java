package co.teamtwo.prj.orderDetail.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.orderDetail.service.OrderDetailMapper;
import co.teamtwo.prj.orderDetail.service.OrderDetailService;
import co.teamtwo.prj.orderDetail.service.OrderDetailVO;
import co.teamtwo.prj.product.service.ProductVO;

@Service
@Primary
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailMapper map;
	
	@Override
	public List<OrderDetailVO> OrderDetailSelectList(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailSelectList(vo);
	}

	@Override
	public OrderDetailVO OrderDetailSelect(OrderDetailVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailSelect(vo);
	}

	@Override
	public int OrderDetailInsert(OrderDetailVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailInsert(vo);
	}

	@Override
	public int OrderDetailUpdate(OrderDetailVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailUpdate(vo);
	}

	@Override
	public int OrderDetailDelete(OrderDetailVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailDelete(vo);
	}
	
	@Override
	public int ProductQuantityUpdate(OrderDetailVO vo) {
		return map.ProductQuantityUpdate(vo);
	}

	@Override
	public List<ProductVO> OrderDetailProductSelectList(List<OrderDetailVO> orderdetail) {
		// TODO Auto-generated method stub
		return map.OrderDetailProductSelectList(orderdetail);
	}
}
