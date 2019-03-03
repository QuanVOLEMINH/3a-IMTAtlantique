<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzane</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">

	<%@ include file="accesmenuFiche.jspf"%>
	<%
		String nom = (String) session.getAttribute("nom");
		String id = (String) session.getAttribute("id");
		String identifiant = (String) session.getAttribute("identifiant");
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<%@ include file="ouvreBase2.jsp"%>

	<h2>Vos demandes</h2>
	<table class="Casebleu1">
		<tr>
			<th>Id</th>
			<th>Objet</th>
			<th>Description</th>
			<th>Date demande</th>
			<th>Reponse</th>
		</tr>
		<%
			PreparedStatement pstmt = conn1.prepareStatement("SELECT * FROM fiche WHERE demandeur = ?");
			pstmt.setString(1, id);
			ResultSet rset = pstmt.executeQuery();
			int i = 0;
			while (rset.next()) {
				if (i % 2 == 0) {
					out.println("<tr style='background: white;'>");
				} else {
					out.println("<tr>");
				}
				i++;

				out.println("<td>" + rset.getString("id") + "</td>");
				out.println("<td>" + rset.getString("objet") + "</td>");
				out.println("<td>" + rset.getString("description") + "</td>");
				out.println("<td>" + rset.getString("datedemande") + "</td>");
				out.println("<td>" + rset.getString("reponse") + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
	<!-- 
*	 une ligne par fiche, 
*   cette  ligne comprend : le numero de la fiche (id), l'objet de la fiche, 
*               la date de creation de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*	Avec le numero de la fiche vous mettez 
*          un lien vers la page d'affichage du contenu de la fiche : ficheCitoyenne.jsp
-->