<%@ page isELIgnored="false"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Identification createur de fiche d'intervention</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">

</head>
<body>

	<img src="../image/logo.jpg" width="500">
	<h3>Service de relation avec les Citoyens</h3>
	<h3>Gestion des fiches citoyens</h3>
	<!--  
* avant l'identification on efface toutes les donnees des sessions precedentes
 -->

	<!-- 
****   Affichage d'un message si le parametre "erreur" est present
****   Affichage d'un message si le parametre "finsession" est present
-->
	<%
		String erreur = (String) request.getParameter("erreur");
		String finsession = (String) request.getParameter("finsession");
	%>

	<p style="color: red">
		<%=erreur == null ? "" : erreur%>		
	</p>

	<h2>Veuillez vous identifier ou creer un compte</h2>

	<form name="commande" method="get" action="identiteCitoyen.jsp">
		<table class="Casebleu1">

			<tr>
				<td>Pour une connexion remplissez les 2 premiers champs. Pour
					une nouvelle inscription remplissez les 4 champs</td>
			</tr>


			<!-- 
****   un  "input text" pour l'identifiant, mini  4 caracteres maxi 10 caracteres
         un "input password" pour le mot de passe
-->
			<tr>
				<td colspan="2"><input type="text" pattern=".{4,10}"
					title="de 4 a 10 caracteres" required placeholder="Identifiant"
					name="identifiant"> <br> <input type="password"
					required placeholder="Mot de passe" name="motPasse"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="connexion" type="submit" value="seconnecter"
						style="width: 120px">Se connecter</button>
				</td>
			</tr>
			<!-- 
****       un  "input text"  pour le nom   mini  4 caracteres maxi 10 caracteres
           un  "input email" un pour le mail, avec verification de la syntaxe
-->
			<tr>
				<td colspan="2"><input type="text" pattern=".{4,10}"
					title="de 4 a 10 caracteres" placeholder="Nom" name="nom">
					<br> <input type="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
					title="mail incorrect" placeholder="Mail" name="mail"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="sinscrire" type="submit" value="seconnecter"
						style="width: 240px">S'inscrire et se connecter</button>
				</td>
			</tr>

		</table>
	</form>

</body>
</html>
