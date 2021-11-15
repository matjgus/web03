<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
Class.forName("org.mariadb.jdbc.Driver");
out.print("드라이버 로딩성공");
String url="jdbc:mysql://localhost:3307/javadb";
String user="root";
String pass="123456";
Connection conn = DriverManager.getConnection(url, user, pass);
out.print("=====>"+conn);
String query="SELECT prodid, customer, price, num, totalprice FROM customer;";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next()){
	String prodid = rs.getString(1);
	String customer = rs.getString(2);
	int price = rs.getInt(3);
	String num = rs.getString(4);
	int totalprice=rs.getInt(5);
	out.print("<BR>" +prodid+" : "+customer +" : "+price+" : "+num+" : "+totalprice);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>