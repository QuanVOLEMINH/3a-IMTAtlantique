<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>identification créateur de fiche d'intervention</title>
    <link type="text/css" href="../style/deco.css" rel="stylesheet" >
 
</head>
<body>

 <img src="../image/logo.jpg"  width="500">    
   <h3> Service de relation avec les Citoyens</h3>
    <h3> Gestion des fiches citoyens</h3>
<!--  
* avant l'identification on efface toutes les données des sessions précédentes
 -->
 
<!-- 
****   Affichage d'un message si le parametre "erreur" est présent
****   Affichage d'un message si le parametre "finsession" est présent
-->
 
 
 
  
  <h2> Veuillez vous identifier  ou créer un compte</h2>

  <form name="commande" method="get" action="identiteCitoyen.jsp">
<table  class="Casebleu1"> 

 <tr> 
  <td> Pour une connexion remplissez les 2 premiers champs.  Pour une nouvelle inscription  remplissez les 4  champs</td>
 </tr>

  
<!-- 
****   un  "input text" pour l'identifiant, mini  4 caractères maxi 10 caractères
         un "input password" pour le mot de passe
-->

 <tr> 
    <td colspan="2"> <button name ="connexion" type="submit" value="se connecter"style="width: 120px"> se connecter </button> </td> 
 </tr> 
<!-- 
****       un  "input text"  pour le nom   mini  4 caractères maxi 10 caractères
           un  "input email" un pour le mail, avec vérification de la syntaxe
-->
 <tr> 
    <td colspan="2"> <button name ="sinscrire" type="submit" 
             value="se connecter"style="width: 240px"> s'inscrire et se connecter </button> </td> 
  </tr>  
  
</table>
</form> 

</body>
</html>
