
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<%
	ResultSet rset = null;
	PreparedStatement pstmt = null;
	String ajoutdoc = request.getParameter("ajoutdoc");
	String valider = request.getParameter("valider");
	String objet = request.getParameter("objet");
	String description = request.getParameter("description");
	String sauver = (String) session.getAttribute("sauver");
	int id = (Integer.valueOf((String) session.getAttribute("id"))).intValue();
	String dateDemandemysql = request.getParameter("dateDemandemysql");
	session.setAttribute("objet", objet);
	session.setAttribute("description", description);
	/*	
	* inscription de la fiche dans la base   (id du Citoyen, objet, description, datedemande)
	*   
	*
	*/
	pstmt = conn1
			.prepareStatement("Select * from fiche where objet = ? and description = ? and datedemande = ?");
	pstmt.setString(1, objet);
	pstmt.setString(2, description);
	pstmt.setString(3, dateDemandemysql);

	rset = pstmt.executeQuery();
	if (rset.next()) {
		response.sendRedirect("deposerUneDemande.jsp");
		return;
	}
	pstmt = conn1.prepareStatement(
			"INSERT INTO fiche(demandeur, objet, description, datedemande) VALUE(?, ?, ?, ?)");
	pstmt.setInt(1, id);
	pstmt.setString(2, objet);
	pstmt.setString(3, description);
	pstmt.setString(4, dateDemandemysql);
	pstmt.executeUpdate();

	if (ajoutdoc != null) {
		/*
		* demande de upload d'un document appel a la page pour le choix du fichier : uploadPage.jsp  
		*/
%>
<jsp:forward page="uploadPage.jsp" />
<%
	} else {
%>
<!-- fiche sans document on retourne a une page d'accueil, par exemple *
suivreMesDemandes.jsp -->
<jsp:forward page="envoieMail.jsp" />

<%
	}
%>

