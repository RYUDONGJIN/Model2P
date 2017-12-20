<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h2>회원 가입 양식</h2>
	<form action="Mproc2.do" method="post">
		<table width="400" border="1" bordercolor="gray">
			<tr height="40">
				<td width="150" align="center">아이디</td>
				<td width="250"><input type="text" name="id"></td>
			</tr>
			<tr height="40">
				<td width="150" align="center">비밀번호</td>
				<td width="250"><input type="password" name="pw"></td>
			</tr>
			<tr height="40">
				<td width="150" align="center">이메일</td>
				<td width="250"><input type="email" name="email"></td>
			</tr>
			<tr height="40">
				<td width="150" align="center">전화</td>
				<td width="250"><input type="tel" name="tel"></td>
			</tr>
			<tr height="40">
				<td width="150" align="center">주소</td>
				<td width="250"><input type="text" name="address"></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>