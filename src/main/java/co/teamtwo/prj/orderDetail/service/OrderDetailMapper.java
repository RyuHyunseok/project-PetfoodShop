package co.teamtwo.prj.orderDetail.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.product.service.ProductVO;

public interface OrderDetailMapper {
	List<OrderDetailVO> OrderDetailSelectList(MemberVO vo);
	OrderDetailVO OrderDetailSelect(OrderDetailVO vo);
	int OrderDetailInsert(OrderDetailVO vo);
	int OrderDetailUpdate(OrderDetailVO vo);
	int OrderDetailDelete(OrderDetailVO vo);
	
	int ProductQuantityUpdate(OrderDetailVO vo);
	List<ProductVO> OrderDetailProductSelectList(@Param("orderdetail")List<OrderDetailVO> orderdetail);
}
