<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Demande Citoyenne Mairie Loc-Maria-Plouzane</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">

</head>


<body class="CaseGrise">

	<%@ include file="ouvreBase2.jsp"%>
	<%@ include file="accesmenuFicheAdministration.jspf"%>
	<%
		String numeroFiche = request.getParameter("numeroFiche");
		PreparedStatement pstmt = conn1.prepareStatement("select * from fiche where id = ?");
		pstmt.setString(1, numeroFiche);
		ResultSet rset = pstmt.executeQuery();
	%>
	<h2>Fiche</h2>
	<table border="1" width="800" class="Casebleu1">
		<tr>
			<th>Id</th>
			<th>Objet</th>
			<th>Description</th>
		</tr>
		<%
			if (rset.next()) {
		%>
		<tr>
			<td><%=rset.getString("id")%></td>
			<td><%=rset.getString("objet")%></td>
			<td><%=rset.getString("description")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<form action="gestionBaseReponse.jsp">
		<h2>Reponse</h2>
		<input name="numFiche" value="<%=numeroFiche%>" type="hidden">
		<textarea rows="5" cols="70" name="reponse" value="reponse"></textarea>
		<br>
		<button name="valider" value="valider" type="submit">Valider</button>
		<button name="abandonner" value="abandonner" type="button"
			onClick="self.location.href='gereDemandeCitoyen.jsp'" type="button">Abandonner</button>
	</form>
	<!-- 
* Sur une   ligne vous mettez le numero de la fiche et son objet.
*    Puis sa description
*    Puis un " TEXTAREA" pour ecrire la reponse.
*            Enfin deux boutons, un pour "validez" et l'autre pour "abandonner".
*     Le bouton "validez" appelle la page "gereBaseReponse" qui �crit tout simplement la r�ponse 
*           dans la table fiche de la base de donn�es.
*     Le bouton "abandonner" appelle la page reponseFicheCitoyenne.jsp
 
 	
 
 
  -->


</body>
</html>
