package co.teamtwo.prj.member.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	int id;
	String username;
	String password;
	String name;
	String tel;
	String postcode;
	String roadAddress;
	String jibunAddress;
	String detailAddress;
	String email;
	LocalDate regDate;
	LocalDate modDate;
	String auth;
}
