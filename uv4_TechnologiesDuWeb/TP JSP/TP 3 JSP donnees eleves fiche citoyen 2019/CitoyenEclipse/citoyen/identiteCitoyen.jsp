<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"  scope="session" />

 
<!--- 
  ****  les  4 propri�t�s du bean nom, identifiant, mail, motPasse doivent �tre initialis�es par la page
-->


 <%!
	ResultSet rset = null;
 %>

 <!--  definition de la base dans le bean et recherche du Citoyen  dans la base par le bean -->
 <%
 	gerelesCitoyen.ouverture("demandecitoyen");
 /*
 **  Cas de l'inscrption, si le bonton "s'inscrire et se connecter" a �t� cliqu�
 **
 **      si oui et que le mail ou le nom ne sont pas pr�sents
 **                         appel � la page d'inscription "index.jsp"avec un param�tre "erreur"
 **      si oui   et que le mail et le nom sont pr�sents
 **                         inscription m�thode inscrireUtilisateur()
 */             
 

 
 /*
 ** Arriv� ici, on sait que la personne est inscrite, ou pense l'�tre, 
 **    on recherche ses caract�ristiques par recherchePersonne()
 ** la m�thode utile.GereCitoyen.getRset donne un ResulSet sur le tuple de la base de donn�e de la  personne
 ** et on les met en variables de session, (gardez les m�mes noms pour la suite)
 **              id, nom, prenom, mobile, fixe, rue, ville, identifiant, mail, fonction
 */
 
 


/*
** si c'est un administrateur : appel � la page  "gereDemandeCitoyen.jsp"
** si c'est un citoyen appel � la page  mesInformationsPersonnelles.jsp
*/

/*
 **      si n'est pas inscrit 
 **                appel � la page d'inscription "index.jsp"avec un param�tre "erreur" qui signale l'erreur d'identification
*/

 	
    %>



