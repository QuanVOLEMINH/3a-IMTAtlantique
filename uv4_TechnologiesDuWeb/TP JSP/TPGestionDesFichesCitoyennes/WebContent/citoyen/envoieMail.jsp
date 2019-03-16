<%@ page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<h2>Envoie l'email</h2>
<hr>
<%
	/*
	Pour envoyer un mail, il faut en general disposer d'un operateur (serveur et port) qui dispose d'un serveur d'envoi de mail (serveur SMTP), 
	et d'un compte chez cet operateur.
	   Une exception est parfois permise, par exemple si vous etes sur un reseau local derriere une livebox (ou autre), 
	   dans ce cas vous avez la possibilite d'envoyer un mail sans vous identifier et sans donner l'operateur, en effet la livebox a son operateur, 
	   et si vous y etes connecte c'est que vous y avez un compte. Dans ce cas, utilisez   la methode  de GereCitoyen.envoieMail :
	
	public static void envoieMail( String objet, String deLaPart, String pour , String contenu) 
	   ici deLaPart  est une adresse mail correcte, que vous pouvez donner. 
	
	Dans le cas plus general, par exemple si vous voulez passez par le serveur SMTP de l'ecole c'est la methode de GereCitoyen.envoieMailSecure :
	
	    public static void envoieMailSecure( String objet, String deLaPart, String pour , String contenu, String motpasse, String host, String port) {
	
	   Dans ce cas pour pouvoir envoyer un mail on doit disposer de ces valeurs : 
	     - host et port designent le serveur smtp d'un operateur et le port associe
	     - deLaPart  et  motpasse designent une adresse mail et son mot de passe chez cet operateur;
	
	Dans cette page, au premier passage vous devrez donc donner ces indications, par l'intermediaire d'un formulaire, 
	et les noter dans des variables de session.
	
	Par la suite ces informations (deLaPart , motpasse, serveur, port) etant stockees dans des variables de session et il est donc inutile de les demander.
	
	Voici donc les trois parties de cette page :
	
	   1) Si a l'appel de la page,  les variables de session qui representent  l'adresse mail et le mot de passe de l'expediteur  ne sont pas connues 
	   et que ces informations ne sont pas en parametre  (envoyeurconnu = null) , un formulaire est envoye pour   demander 
	     l'adresse mail, le mot de passe, le serveur  et le port, ce formulaire a un bouton submit, de nom "envoyeurconnu", 
		 l'action de ce formulaire est cette meme page.
	   
	
	Attention, l'envoi d'un formulaire, c'est une autre requete, donc nouveaux parametres, or dans la premiere requete 
	il y avait selon le cas un parametre "nomDocument". 
	   Il faut donc faire suivre cette valeur ("partie "hidden")
	
	   2) Si a l'appel de la page,  les variables de session qui representent  l'adresse mail et le mot de passe de l'expediteur: ne sont pas connues,
	   mais que vous revenez du formulaire, (envoyeurconnu present) :
	Vous mettez les variables (adresseMail, motPasse, serveur, port) en session.
	      
	 3) Si les variables de session qui representent  l'adresse mail et le mot de passe de l'expediteur sont connues 
	    (vous venez de les creer ou vous les avez creees lors d'un autre appel), vous pouvez envoyer le mail.
	
	  Envoi du mail :
	Recherche dans la base de la derniere fiche de la personne connectee
	Recherche des caracteristiques de cette fiche et du mail de la personne connectee
	   et appel de  envoieMailSecure
	*/
	String expediteur = request.getParameter("expediteur");
	String motDePasse = request.getParameter("motDePasse");
	String pour = request.getParameter("pour");
	String serveur = request.getParameter("serveur");
	String porte = request.getParameter("porte");
	String envoyeurconnu = request.getParameter("envoyeurconnu");
	String expeSession = (String) session.getAttribute("expediteur");
	String mdpSession = (String) session.getAttribute("motDePasse");
	String pourSession = (String) session.getAttribute("pour");
	String svSession = (String) session.getAttribute("serveur");
	String pSession = (String) session.getAttribute("porte");
	String nomDocumentSession = (String) session.getAttribute("nomDocument");
	String objet = (String) session.getAttribute("objet");
	String description = (String) session.getAttribute("description");

	if (envoyeurconnu == null) {
		if (expeSession == null && mdpSession == null) {
%>
<form name="demande" method="get" action="envoieMail.jsp">
	<table class="Casebleu1">

		<tr>
			<td><input type="email" maxlength="100" placeholder="Expediteur"
				name="expediteur"></td>
		</tr>
		<tr>
			<td><input type="password" maxlength="100"
				placeholder="Mot De Passe" name="motDePasse"></td>
		</tr>
		<tr>
			<td><input type="email" maxlength="100" placeholder="Pour"
				name="pour"></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="100" placeholder="Serveur"
				name="serveur"></td>
		</tr>
		<tr>
			<td><input type="text" maxlength="100" placeholder="Porte"
				name="porte"></td>
		</tr>

		<tr>
			<td>
				<button name="envoyeurconnu" type="submit" value="envoyeurconnu"
					style="width: 240px">Envoyer</button>
			</td>
		</tr>

	</table>

</form>

<%
	} else {
			if (nomDocumentSession != null) {
				description += "\n Nom Doc: " + nomDocumentSession;
			}
			GereCitoyen.envoieMailSecure(objet, expeSession, pourSession, description, mdpSession, svSession,
					pSession);
%>
<p style="color: 'green'">
	<strong>Envoye avec succes</strong>
</p>
<button name="Retourner" type="button" value="Retourner"
	style="width: 240px"
	onClick="self.location.href='mesInformationsPersonnelles.jsp'">Retourner</button>
<%
	}

	} else {
		if (expeSession == null && mdpSession == null) {
			if (expediteur != null && motDePasse != null) {
				session.setAttribute("expediteur", expediteur);
				session.setAttribute("motDePasse", motDePasse);
				session.setAttribute("pour", pour);
				session.setAttribute("serveur", serveur);
				session.setAttribute("porte", porte);
				response.sendRedirect("envoieMail.jsp");
			}
		} else {
			if (nomDocumentSession != null) {
				description += "\n Nom Doc: " + nomDocumentSession;
			}
			GereCitoyen.envoieMailSecure(objet, expeSession, pourSession, description, mdpSession, svSession,
					pSession);
%>
<p style="color: 'green'">
	<strong>Envoye avec succes</strong>
</p>
<button name="Retourner" type="button" value="Retourner"
	style="width: 240px"
	onClick="self.location.href='mesInformationsPersonnelles.jsp'">Retourner</button>
<%
	}
	}
%>
