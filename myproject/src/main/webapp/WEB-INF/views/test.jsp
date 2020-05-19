<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과없음</title>
</head>
<body>
<a href="/">Home</a>
<hr>


<c:forEach var="item" items="${ member}" >
	<hr>
	${item}

</c:forEach>


</body>
</html>