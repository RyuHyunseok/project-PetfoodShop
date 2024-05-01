package co.teamtwo.prj.order.service;

import java.util.List;

import co.teamtwo.prj.member.service.MemberVO;

public interface OrderService {
	List<OrderVO> OrderSelectList(MemberVO vo);
	OrderVO OrderSelect(OrderVO vo);
	int OrderInsert(OrderVO vo);
	int OrderUpdate(OrderVO vo);
	int OrderDelete(OrderVO vo);
	int OrderDetailDelete(OrderVO vo);
}
