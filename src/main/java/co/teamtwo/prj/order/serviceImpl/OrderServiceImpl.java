package co.teamtwo.prj.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.order.service.OrderMapper;
import co.teamtwo.prj.order.service.OrderService;
import co.teamtwo.prj.order.service.OrderVO;

@Service
@Primary
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper map;
	
	@Override
	public List<OrderVO> OrderSelectList(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.OrderSelectList(vo);
	}

	@Override
	public OrderVO OrderSelect(OrderVO vo) {
		// TODO Auto-generated method stub
		return map.OrderSelect(vo);
	}

	@Override
	public int OrderInsert(OrderVO vo) {
		// TODO Auto-generated method stub
		return map.OrderInsert(vo);
	}

	@Override
	public int OrderUpdate(OrderVO vo) {
		// TODO Auto-generated method stub
		return map.OrderUpdate(vo);
	}

	@Override
	public int OrderDelete(OrderVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDelete(vo);
	}

	@Override
	public int OrderDetailDelete(OrderVO vo) {
		// TODO Auto-generated method stub
		return map.OrderDetailDelete(vo);
	}

}
