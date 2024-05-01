<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/memberdeleteform.css?after"
	type="text/css">
</head>

<body>
	<div id="container">
		<div id="menu">
			<div id="menuHeader">마이페이지</div>
			<hr id="hr1">
			<div id="menuBody">
				<div class="menuBox"><a href="mypageorderlist">-주문목록</a></div>
				<div class="menuBox">
					<a href="membereditform">-회원정보 변경</a>
				</div>
				<div class="menuClick">
					<a href="memberdeleteform" style="color: #7fad39">-회원탈퇴</a>
				</div>
				<div class="menuBox">
					<a href="wishlist">-찜 리스트</a>
				</div>
			</div>
		</div>
		<div id="main">
			<form id="memberdelete" action="home" method="get"
				onsubmit="return passwordChk()">
				<section class="checkout spad" style="padding-top: 41px">
					<div class="container">
						<div class="row justify-content-center">
							<div class="checkout__form">
								<h4>회원탈퇴</h4>

								<div class="col-lg-12 mx-auto" style="width: 833px; padding: 0 15px;">

									<div id="blankBox"></div>
									<div>
										<div class="letter-spacing title">01.회원탈퇴 안내</div>
										<div class="letter-spacing" id="messageBox">
											&#60;OGANI&#62; 탈퇴안내 <br>
											<br> 회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br>
											불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다. <br>
											<br> ■ 아울러 회원 탈퇴 시의 아래 사항을 숙지하시기 바랍니다.<br> 1. 회원 탈퇴
											시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보
											보호정책에 따라 관리 됩니다.<br> 2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다.<br>
										</div>
										<div class="letter-spacing title">02.회원탈퇴 하기</div>
										<div class="letter-spacing">
											<table>
												<tr>
													<th>비밀번호</th>
													<td><input type="password" id="passwordBox"></td>
												</tr>
												<tr>
													<th>탈퇴사유</th>
													<td>
														<div class="flex">
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">고객서비스(상담,포장 등) 불만</span> <input
																	type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">배송불만</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
														</div>
														<div class="flex">
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">교환/환불/반품 불만</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">방문 빈도가 낮음</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
														</div>
														<div class="flex">
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">상품가격 불만</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">개인 정보유출 우려</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
														</div>
														<div class="flex">
															<div class="checkbox-wrapper-21 checkBoxSize">
																<label class="control control--checkbox"> <span
																	class="text">쇼핑몰의 신뢰도 불만</span> <input type="checkbox" />
																	<div class="control__indicator"></div>
																</label>
															</div>
														</div>

													</td>
												</tr>
												<tr>
													<th>남기실 말씀</th>
													<td><textarea spellcheck="false"></textarea></td>
												</tr>
											</table>
										</div>
										<div id="memberDeleteBox" class="letter-spacing">
											<button type="submit">탈퇴</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</section>
			</form>
		</div>
	</div>
	<input type="hidden" id="originalPasswordBox"
		value="${member.password }">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/js/memberdeleteform.js?after"></script>
</body>

</html>