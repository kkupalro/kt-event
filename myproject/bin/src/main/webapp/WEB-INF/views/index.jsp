<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
 <h3>SpringBoot 회원관리</h3><br><br>
<form id="findByIdForm" action="${pageContext.request.contextPath}/find-member-by-id">
아이디 <input type="text" id="memberId" name="memberId">
<input type="submit"  value="회원검색"><br><br>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script>
<input type="button" onclick="showMessage()" value="js-test">
</form>
</body>
</html>


















