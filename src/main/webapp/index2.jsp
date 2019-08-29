<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<h2>Hello World!</h2>
<%--使用EL表达式pageContext获取当前项目名--%>
<a href="${pageContext.request.contextPath}/findBooks">查询所有</a>
<a href="${pageContext.request.contextPath}/addBook">添加书籍</a>
<form action="" method="post">
    <input type="hidden" name="_method" value="findbook">
</form>

</body>
</html>
