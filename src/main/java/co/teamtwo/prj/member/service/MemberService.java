package co.teamtwo.prj.member.service;

import java.util.List;

import co.teamtwo.prj.admin.service.AdminProductVO;
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;

public interface MemberService {
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	List<MemberVO> MemberSelectList();
	MemberVO memberSelect2(MemberVO vo);
	List<ProductVO> wishlistPagingList(WishListVO vo,int startNum,int count);
	List<WishListVO> SelectWishList(WishListVO vo);
}
