package co.teamtwo.prj.orderDetail.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailVO {
	private int id;
	private Long orderId;
	private int productId;
	private int quantity;
}
