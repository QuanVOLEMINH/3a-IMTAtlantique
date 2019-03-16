<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzane</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">

	<%
		String ajoutdoc = request.getParameter("ajoutdoc");
		String docmise = request.getParameter("docmise");
		String identifiant = (String) session.getAttribute("identifiant");
		String reponse = null;
		String objet = null;
		boolean traite = false;
		String description = null;
		int numboucle = 0;
	%>
	<%@ include file="ouvreBase2.jsp"%>
	<%@ include file="accesmenuFicheAdministration.jspf"%>

	<%
		PreparedStatement pstmt1 = conn1
				.prepareStatement("SELECT * FROM fiche WHERE reponse = '' or reponse is null");
		ResultSet rset1 = pstmt1.executeQuery();
	%>

	<h2>Liste des fiches non traitees</h2>

	<table border="1" width="800" class="Casebleu1">
		<tr>
			<th>Numero</th>
			<th>Objet</th>
			<th>Date Creation</th>
		</tr>
		<%
			while (rset1.next()) {
		%>
		<tr>
			<td><a
				href='reponseFicheCitoyenne.jsp?numeroFiche=<%=rset1.getString("id")%>'><%=rset1.getString("id")%></a></td>
			<td><%=rset1.getString("objet")%></td>
			<td><%=rset1.getString("datedemande")%></td>
		</tr>

		<%
			}
		%>

	</table>

	<%
		PreparedStatement pstmt2 = conn1
				.prepareStatement("SELECT * FROM fiche WHERE reponse != '' and reponse is not null");
		ResultSet rset2 = pstmt2.executeQuery();
	%>
	<h2>Liste des fiches traitees</h2>

	<table border="1" width="800" class="Casebleu1">
		<tr>
			<th>Numero</th>
			<th>Objet</th>
			<th>Date Creation</th>
			<th>Reponse</th>
		</tr>
		<%
			while (rset2.next()) {
		%>
		<tr>
			<td><a
				href='reponseFicheCitoyenne.jsp?numeroFiche=<%=rset2.getString("id")%>'><%=rset2.getString("id")%></a></td>
			<td><%=rset2.getString("objet")%></td>
			<td><%=rset2.getString("datedemande")%></td>
			<td><%=rset2.getString("reponse")%></td>
		</tr>

		<%
			}
		%>

	</table>
	<!--
*	  une liste des fiches qui n'ont pas �t� trait�es (champs r�ponse inexistant),
*	  une liste des fiches traitees.  
*  Dans ces deux listes vous mettez :
*	  une ligne par fiche, cette  ligne comprend : le numero de la fiche (id), l'objet de la fiche, la date de creation de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*  Avec le numero de la fiche vous mettez un lien vers la page "reponseFicheCitoyenne.jsp" qui permet d'ecrire la reponse de la fiche, 
-->
</body>
</html>
