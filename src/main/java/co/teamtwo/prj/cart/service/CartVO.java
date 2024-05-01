package co.teamtwo.prj.cart.service;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int id;
	private int productId;
	private int customerId;
	private Date regDate;
	private String name;
	private int price;
	private String imgPath;
	private int quantity;
	private String productName;
}
