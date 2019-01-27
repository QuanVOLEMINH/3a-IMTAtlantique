<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"  scope="session" />

 
<!--- 
  ****  les  4 propriétés du bean nom, identifiant, mail, motPasse doivent être initialisées par la page
-->


 <%!
	ResultSet rset = null;
 %>

 <!--  definition de la base dans le bean et recherche du Citoyen  dans la base par le bean -->
 <%
 	gerelesCitoyen.ouverture("demandecitoyen");
 /*
 **  Cas de l'inscrption, si le bonton "s'inscrire et se connecter" a été cliqué
 **
 **      si oui et que le mail ou le nom ne sont pas présents
 **                         appel à la page d'inscription "index.jsp"avec un paramètre "erreur"
 **      si oui   et que le mail et le nom sont présents
 **                         inscription méthode inscrireUtilisateur()
 */             
 

 
 /*
 ** Arrivé ici, on sait que la personne est inscrite, ou pense l'être, 
 **    on recherche ses caractéristiques par recherchePersonne()
 ** la méthode utile.GereCitoyen.getRset donne un ResulSet sur le tuple de la base de donnée de la  personne
 ** et on les met en variables de session, (gardez les mêmes noms pour la suite)
 **              id, nom, prenom, mobile, fixe, rue, ville, identifiant, mail, fonction
 */
 
 


/*
** si c'est un administrateur : appel à la page  "gereDemandeCitoyen.jsp"
** si c'est un citoyen appel à la page  mesInformationsPersonnelles.jsp
*/

/*
 **      si n'est pas inscrit 
 **                appel à la page d'inscription "index.jsp"avec un paramètre "erreur" qui signale l'erreur d'identification
*/

 	
    %>



