<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion Base Document</title>
</head>
<body>

	<%
		PreparedStatement pstmt = conn1.prepareStatement("INSERT INTO document(nom, proprietaire) VALUE(?, ?)");

		String nomDocument = request.getParameter("docmise");
		int id = Integer.valueOf((String) session.getAttribute("id")).intValue();
		pstmt.setString(1, nomDocument);
		pstmt.setInt(2, id);
		pstmt.executeUpdate();
		
		session.setAttribute("nomDocument", nomDocument);
	%>
	<jsp:forward page="envoieMail.jsp" />
</body>
</html>