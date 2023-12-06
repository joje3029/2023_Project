<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN" />

<%@ include file="../common/head2.jsp"%>

<%@ include file="../common/toastUiEditorLib.jsp" %>

<script>
	const nameRegex = /^[가-힣A-Za-z]{2,30}$/;  //name
	const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //email
	
	const findLoginIdForm_onSubmit = function(form) {
		form.name.value = form.name.value.trim();//이름
		form.email.value = form.email.value.trim();//이메일
		
		//이름
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요');
			form.name.focus();
			return;
		}
		
		//이름 검증.
		 if (!nameRegex.test(form.name.value)) {
		    alert('이름은 한글 또는 영문으로 2~30자 이내여야 합니다.');
		    form.name.value ='';
		    form.name.focus();
		    return false;
	   }
		
		//이메일
		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요');
			form.email.focus();
			return;
		}
		
		//이메일 검증
		if (!emailRegex .test(form.email.value)) {
			 alert('이메일은 예시처럼 입력해주세요.');
			form.email .value ='';
		    form.email.focus();
		    return false;
	   }
		
		 alert('여기까지 오케?');
	}
</script>

		<section class="login">
        <h1 class="text-4xl">아이디 찾기</h1>
       		<div class="container">
	            <form action="doFindId" method="post"
	                    onsubmit="findLoginIdForm_onSubmit(this); return false;">
                        <table>
                            <tr>
                                <th class="w-16"><span class="text-red-700">*</span>이름</th>
                                <td><input type="text" name="name" placeholder="이름을 입력해주세요"
                                    class="input input-bordered w-full max-w-xs input-sm"></td>
                            </tr>
                            <tr>
                                <th><span class="text-red-700">*</span>이메일</th>
                                <td><input type="text" name="email" placeholder="이메일 입력해주세요 예) asd123@gmail.com"
                                    class="input input-bordered w-full max-w-xs input-sm">
                                    <div class="btn btn-sm ml-1"><a href="doSendCertificationMail">인증번호 받기</a></div></td>
                            </tr>
                            <tr>
                                <th><span class="text-red-700">*</span>인증번호 입력</th>
                                <td><input type="text" name="certificationNum" placeholder="인증번호를 입력해주세요"
                                    class="input input-bordered w-full max-w-xs input-sm">
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <button class="btn">확인</button>
                                </th>
                            </tr>
                        </table>
	            </form>
	      	</div>
    </section>
	</body>
</html>