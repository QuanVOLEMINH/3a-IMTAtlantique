<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML>
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Document transférés par un citoyen</title>
   <link type="text/css" href="../style/deco.css" rel="stylesheet" >
  </head>
  <body   class= "CaseGrise" >
  <%@ include file="accesmenuFiche.jspf" %>  
  <%  
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = null;//laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();    
%>
<%@ include file="ligneIdentification.jspf" %>  




<!--  
* Donner la liste, des documents que la personne a téléchargés, un document par ligne.
*
* Sur cette ligne, vous mettez d'abord un icône donnant le type de document, par exemple pour le pdf : pdf.jpg ,
* pour une image une vignette de l'image (petite image), inutile de le faire pour tous les documents possibles.
* Puis le nom du fichier de ce document, associé à un lien html sur le fichier, 
* de façon qu'en cliquant dessus on puisse lire le document. 
-->













</body>
</html>
