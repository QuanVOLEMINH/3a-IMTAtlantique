
<!-- fermer la session et retour � l'inscription -->

<%
	session.invalidate();
	response.sendRedirect("index.jsp?finsession=Session est fini");
%>
