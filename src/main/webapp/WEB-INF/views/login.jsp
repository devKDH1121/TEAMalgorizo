<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="include/head.jsp" %>
    <script>
		function toggleLoginButton(){
			const m_id = document.getElementById('m_id').value.trim();
			const m_password = document.getElementById('m_password').value.trim();
			const loginButton = document.getElementById('loginBtn');
			
			loginButton.disabled = !(m_id && m_password);
		}
    
		function handleKeyPress(event){
			if(event.key == 'Enter'){
				event.preventDefault();
				attemptLogin();
			}
			
		}
		
		function attemptLogin(){
			const m_id = document.getElementById('m_id').value.trim();
			const m_password = document.getElementById('m_password').value.trim();
			
			if(!m_id || !m_password){
				return false;
			}
			
			document.getElementById('loginForm').submit();
		}
		function validateLoginForm(){
			const m_id = document.getElementById("m_id").value;
			const m_password = document.getElementById("m_password").value;
			
			if(m_id === "" || m_password === ""){
				return false;
			}
			return true;
		}
		
    
    
    
    
    
	</script>
    
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left" class="d-flex flex-column justify-content-center" style="height: 100%;">
	                
                    
                    <h1 class="auth-title">Log in.</h1>
                    <p class="auth-subtitle mb-5">Algorizo Company</p>
					<c:if test="${error eq 'true' }">
						<div style="color:red; margin-bottom:10px;">아이디 또는 비밀번호가 잘못되었습니다.</div>
					</c:if>
                    <form action="${contextPath }/home" method="post" id="loginForm" onsubmit = "return validateLoginForm()">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" id="m_id" name="m_id" class="form-control form-control-xl" placeholder="사원번호" oninput="toggleLoginButton()" onkeypress="handleKeyPress(event)">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" id="m_password" name="m_password" class="form-control form-control-xl" placeholder="비밀번호" oninput="toggleLoginButton()" onkeypress="handleKeyPress(event)">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <button id="loginBtn" type="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-5" disabled>Log in</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class="text-gray-600">계정이 없으신가요? <a href="${contextPath }/register"
                                class="font-bold">회원가입</a></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right" class="d-flex justify-content-center align-items-center" style="height: 100%;">
				    <div class="mb-4">
				        <img src="${contextPath}/resources/img/Logo/arclogo_white.png" 
				             style="width: 700px; border-radius: 20px; display: block; margin: 0 auto;">
				    </div>
				</div>
            </div>
        </div>

    </div>
</body>

</html>