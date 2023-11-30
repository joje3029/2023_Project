<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN" />

<%@ include file="../common/head2.jsp"%>

<script>
	const joinForm_onSubmit = function(form){
		form.loginId.value = form.loginId.value.trim(); 
		form.loginPw.value = form.loginPw.value.trim();
		form.checkLoginPw.value = form.checkLoginPw.value.trim(); 
		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim(); 
		form.email.value = form.email.value.trim();
		form.certification.value = form.certification.value.trim(); 
		
		console.log("test");
		
		if(form.loginId.value.length ==0){
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return
		}
		if(form.loginPw.value.length ==0){
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return
		}
		if(form.checkLoginPw.value.length ==0){
			alert('확인비밀번호를 입력해주세요');
			form.checkLoginPw.focus();
			return
		}
		
		if(form.name.value.length ==0){
			alert('이름을 입력해주세요');
			form.name.focus();
			return
		}
		if(form.nickname.value.length ==0){
			alert('닉네임을 입력해주세요');
			form.nickname.focus();
			return
		}
		if(form.email.value.length ==0){
			alert('이메일을 입력해주세요');
			form.email.focus();
			return
		}
		if(form.certification.value.length ==0){
			alert('본인인증번호를 입력해주세요');
			form.certification.focus();
			return
		}
		

		form.submit();
	}
</script>

<section class="login">
	<h1 class="text-4xl">회원정보수정</h1>
	<form action="domodify" method="post"
		onsubmit="joinForm_onSubmit(this); return false;">
		<table>
			<tr colspan="2"><p class="text-xs"><span class="text-red-700">*</span>표시는 필수 기입항목입니다.</p></tr>
			<tr>
				<th><span class="text-red-700">*</span>이름</th>
				<td><input type="text" name="name" placeholder="이름을 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm"></td>
			</tr>
			<tr>
				<th><span class="text-red-700">*</span>닉네임</th>
				<td class="flex"><input type="text" name="nickname" placeholder="닉네임을 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm">
					<div class="btn btn-sm ml-1">중복확인</div></td>
			</tr>
			<tr>
				<th><span class="text-red-700">*</span>이메일</th>
				<td><input type="text" name="email" placeholder="이메일 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" placeholder="전화번호 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td class="flex"><input type="text" name="address" placeholder="주소를 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm">
					<div class="btn btn-sm ml-1">우편번호로찾기</div></td>
			</tr>
			<tr>
				<th><span class="text-red-700">*</span>본인인증</th>
				<td class="flex"><input type="text" name="certification" placeholder="본인인증번호를 입력해주세요"
					class="input input-bordered w-full max-w-xs input-sm">
					<div class="btn btn-sm ml-1">인증번호</div></td>
			</tr>
		</table>
		<div class="button_center flex">
			<div class="btn mr-2">취소</div>
			<button class="btn">저장</button>
		</div>
	</form>
</section>
</body>
</html>