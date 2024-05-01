package co.teamtwo.prj.order.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {
	private long id;
	private int customerId;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String extraAddress;
	private String shippingRequest;
	private String tel;
	private String name;
	private String regDate;
}
