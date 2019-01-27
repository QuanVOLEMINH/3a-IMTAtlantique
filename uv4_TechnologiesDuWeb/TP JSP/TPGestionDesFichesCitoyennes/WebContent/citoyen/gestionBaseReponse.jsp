<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>

<%@ include file="ouvreBase2.jsp"%>
<%
	Statement stmt = conn1.createStatement();
	ResultSet rset = null;
	PreparedStatement pstmt = null;
	String mailCitoyen = null;
	String reponse = request.getParameter("reponse");
	String objet = null;
	String description = null;

	String valider = request.getParameter("valider");
	int id = ((Integer) (session.getAttribute("id"))).intValue();
	String mail = (String) session.getAttribute("mail");
	int numFiche = (request.getParameter("numFiche") != null)
			? Integer.parseInt(request.getParameter("numFiche"))
			: 0;
	int numDemande = (request.getParameter("numDemande") != null)
			? Integer.parseInt(request.getParameter("numDemande"))
			: 0;
	int num = 0, num2 = 0;

	// recherche de la fiche o� l'on doit rajouter la r�ponse
	pstmt = conn1.prepareStatement(
			"SELECT  mail, objet, description FROM personne , fiche  where fiche.demandeur = personne.id and fiche.id=?");
	pstmt.setInt(1, numFiche);
	rset = pstmt.executeQuery();
	if (rset.next()) {
		mailCitoyen = rset.getString("mail");
		objet = rset.getString("objet");
		description = rset.getString("description");
	}

	// envoi mail au citoyen 

	/*
	  utilisez  envoieMailSecure avec l'identifiant et le mot de passe
	*/

	// ajouter  la reponse dans la fiche, si les parametre "valider" et "reponse" sont pr�sents
%>



