<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE  HTML>
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzan�</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" >  
  </head>
  <body   class= "CaseGrise" >
  <%@ include file="accesmenuFiche.jspf" %>  
<% 
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee(); 
String dateDemandemysql = laDate.getAnnee()+ "/" + laDate.getMois() + "/" + laDate.getJour();

%>
<%@ include file="ligneIdentification.jspf" %> 


 <!--
*partie 1
* Vous   ajoutez une table comprenant un formulaire avec
*	un champ input texte "Objet"  (max 100 caract�res).
*	Un champ textArea  "Description" ( 100 colonnes, 15 lignes) 
*	Et deux boutons "valider" et "abandonner"
* Le bouton "valider" appelle la page gestionBasedemande.jsp avec le contenu du formulaire, 
* cette page enregistre cette fiche dans la table "fiche", avec une r�f�rence au citoyen qui l'�crit.
* Le bouton "abandonner" vous ram�ne � une page d'accueil, par exemple "mesInformationsPersonelles.jsp", ou une autre
* vous passez aussi en param�tre : dateDemande et dateDemandemysql

 -->


 <!--
*partie 2
* Rajoutez  dans le formulaire de la page deposerUneDemande.jsp un bouton suppl�mentaire  
  " validez en ajoutant un document",  de nom "ajoutdoc"
   il appelle aussi la page gestionBasedemande.jsp
   il permettra de savoir qu'il faut joindre un document 
  (pdf, word, excel, jpg, etc..) � la  fiche.
*
-->




<table  class="CaseGrise1" style= "width:800;" > 
<tr> <td class="Casebleu14">
 Si vous voulez illustrer vos propos par une photo, vous cliquez sur "valider en ajoutant une photo".
Attention sa taille doit �tre inf�rieure � 200 koctets, vous avez des logiciels pour r�duire la taille d'une image :
waibeImage, image resizer, light image resizer, etc.. Pour les documents, la limite est de 500 koctets.  
</td>
</tr>
 </table>   
  </body>
</html>

