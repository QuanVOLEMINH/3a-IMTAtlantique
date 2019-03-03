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
<title>Demande Citoyenne Mairie Loc-Maria-Plouzan��</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
	<%@ include file="accesmenuFiche.jspf"%>
	<%
		int numFiche = Integer.parseInt(request.getParameter("numeroDemande"));
		String nom = (String) session.getAttribute("nom");
		String identifiant = (String) session.getAttribute("identifiant");
		String mail = (String) session.getAttribute("mail");
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<%@ include file="ouvreBase2.jsp"%>




	<!-- 
*  recherche des caract�ristiques de la fiche dans la base 
-->











	<table style="width: 400;" class="Casebleu">
		<tr>
			<td width="100" class="Casebleu1">
				<p>
					<b> Objet : </b>
				</p>
			</td>
			<!-- 
*              affichage  objet
-->
		</tr>
	</table>
	<p>D�tail de votre demande</p>
	<table style="width: 400;" class="Casebleu">
		<tr>


			<!-- 
* et affichage  description et reponse
-->





		</tr>
	</table>
</body>
</html>
