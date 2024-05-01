package co.teamtwo.prj.member.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.teamtwo.prj.member.service.MemberVO;
//test
import co.teamtwo.prj.product.service.ProductVO;
import co.teamtwo.prj.product.service.WishListVO;
public interface MemberMapper {
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	List<MemberVO> MemberSelectList();
	MemberVO memberSelect2(MemberVO vo);
	List<ProductVO> wishlistPagingList(@Param("vo")WishListVO vo,@Param("startNum")int startNum,@Param("count")int count);
	List<WishListVO> SelectWishList(WishListVO vo);
}
