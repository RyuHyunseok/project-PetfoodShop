package co.teamtwo.prj.admin.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminProductVO {
	private String name;
	private int price;
	private String categoryL;
	private String categoryM;
	private String imgPath;
	private String imgName;
	private String categoryId;
	private int id;
	private int quantity;
}
