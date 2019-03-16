<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Document transferes par un citoyen</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
</head>
<body class="CaseGrise">
	<%@ include file="accesmenuFiche.jspf"%>
	<%
		String nom = (String) session.getAttribute("nom");
		String id = (String) session.getAttribute("id");
		String identifiant = (String) session.getAttribute("identifiant");
		String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
		String rootFolder = "C:\\Users\\wazza\\Documents\\3a-IMTAtlantique\\uv4_TechnologiesDuWeb\\TP JSP\\TPGestionDesFichesCitoyennes\\WebContent\\images\\";
	%>
	<%@ include file="ligneIdentification.jspf"%>
	<h2>Vos documents</h2>
	<sql:query var="result" dataSource="DonneesBase">
             SELECT * FROM document WHERE proprietaire = ?
            <sql:param value="${id}" />
	</sql:query>

	<table class="Casebleu1">
		<tr>
			<th>Id</th>
			<th>Type</th>
			<th>Nom</th>
		</tr>

		<c:forEach items="${result.rows}" var="item">
			<tr>
				<td><c:out value="${item.id}" /></td>
				<td><c:if
						test="${fn:endsWith(fn:toLowerCase(item.nom), '.pdf')}">
						<img alt="" src="../image/pdf.jpg" width="40px">
					</c:if> <c:if
						test="${fn:endsWith(fn:toLowerCase(item.nom), '.jpg') || fn:endsWith(fn:toLowerCase(item.nom), '.jpeg') || fn:endsWith(fn:toLowerCase(item.nom), '.png')}">
						<img alt="" src="../image/imageFile.png" width="40px">
					</c:if></td>
				<td><a href="<c:url value = "../images/${item.nom}" />"
					target="_blank"><c:out value="${item.nom}" /> </a></td>
			</tr>
		</c:forEach>

	</table>



	<!--  
* Donner la liste, des documents que la personne a t�l�charg�s, un document par ligne.
*
* Sur cette ligne, vous mettez d'abord un ic�ne donnant le type de document, par exemple pour le pdf : pdf.jpg ,
* pour une image une vignette de l'image (petite image), inutile de le faire pour tous les documents possibles.
* Puis le nom du fichier de ce document, associ� � un lien html sur le fichier, 
* de fa�on qu'en cliquant dessus on puisse lire le document. 
-->













</body>
</html>
