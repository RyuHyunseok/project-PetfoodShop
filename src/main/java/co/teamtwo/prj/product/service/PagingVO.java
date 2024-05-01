package co.teamtwo.prj.product.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVO {
	int startPage,endPage,thisPage,totalPage;
	boolean prev,next;
	
}
