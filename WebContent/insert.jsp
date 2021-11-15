<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
request.setCharacterEncoding("utf-8");

String prodid = request.getParameter("prodid");
String customer = request.getParameter("customer");
int price = Integer.parseInt(request.getParameter("price"));
int num = Integer.parseInt(request.getParameter("num"));

out.print(prodid+"<br>");
out.print(customer+"<br>");
out.print(price+"<br>");
out.print(num+"<br>");

Class.forName("org.mariadb.jdbc.Driver");
String url="jdbc:mariadb://localhost:3307/javadb";
String user="root";
String password="123456";
Connection conn=DriverManager.getConnection(url, user, password);
String sql="insert into customer values(?,?,?,?,?)";
PreparedStatement pstmt= conn.prepareStatement(sql);

pstmt.setString(1, prodid);
pstmt.setString(2, customer);
pstmt.setInt(3, price);
pstmt.setInt(4, num);
pstmt.setInt(5, num*price);

pstmt.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>