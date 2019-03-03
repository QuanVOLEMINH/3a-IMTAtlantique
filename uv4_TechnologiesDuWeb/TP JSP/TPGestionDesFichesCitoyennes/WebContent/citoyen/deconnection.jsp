
<!-- fermer la session et retour à l'inscription -->

<%
	session.invalidate();
	response.sendRedirect("index.jsp?finsession=Session est fini");
%>
