package co.teamtwo.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.member.map.MemberMapper;
import co.teamtwo.prj.member.service.MemberService;
import co.teamtwo.prj.member.service.MemberVO;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;
import jdk.jfr.Percentage;

@Service
@Primary
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper map;
	
	@Override
	public MemberVO memberSelect(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberDelete(vo);
	}
	
	@Override
	public List<MemberVO> MemberSelectList() {
		// TODO Auto-generated method stub
		return map.MemberSelectList();
	}
	
	@Override
	public MemberVO memberSelect2(MemberVO vo) {
		return map.memberSelect2(vo);
	}

	@Override
	public List<ProductVO> wishlistPagingList(WishListVO vo,int startNum,int count) {
		// TODO Auto-generated method stub
		return map.wishlistPagingList(vo,startNum,count);
	}

	@Override
	public List<WishListVO> SelectWishList(WishListVO vo) {
		// TODO Auto-generated method stub
		return map.SelectWishList(vo);
	}
}
