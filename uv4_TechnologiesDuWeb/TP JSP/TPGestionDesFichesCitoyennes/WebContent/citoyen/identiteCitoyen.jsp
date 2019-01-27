<%@ page isELIgnored="false"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"
	scope="session" />
<jsp:setProperty name="gerelesCitoyen" property="nom"></jsp:setProperty>
<jsp:setProperty name="gerelesCitoyen" property="motPasse"></jsp:setProperty>
<jsp:setProperty name="gerelesCitoyen" property="identifiant"></jsp:setProperty>
<jsp:setProperty name="gerelesCitoyen" property="mail"></jsp:setProperty>
<!--- 
  ****  les  4 proprietes du bean nom, identifiant, mail, motPasse doivent etre initialisees par la page
-->
<%!ResultSet rset = null;
	String erreurMessage = null;%>

<!--  definition de la base dans le bean et recherche du Citoyen  dans la base par le bean -->
<%
	gerelesCitoyen.ouverture("demandecitoyen");
	/*
	**  Cas de l'inscription, si le bonton "s'inscrire et se connecter" a ete clique
	**
	**      si oui et que le mail ou le nom ne sont pas presents
	**                         appel e la page d'inscription "index.jsp"avec un parametre "erreur"
	**      si oui   et que le mail et le nom sont presents
	**                         inscription methode inscrireUtilisateur()
	*/
	String sinscrire = (String) request.getParameter("sinscrire");
	String connexion = (String) request.getParameter("connexion");
	if (sinscrire != null && sinscrire.equals("seconnecter")) {
		String paramNom = (String) request.getParameter("nom");
		String paramMail = (String) request.getParameter("mail");
		if (paramNom == null || paramNom.equals("") || paramMail == null || paramMail.equals("")) {
			erreurMessage = "nom et mail obligatoires pour vous inscrire";
			response.sendRedirect("index.jsp?erreur=" + erreurMessage);
		} else {
			gerelesCitoyen.inscrireUtilisateur();
		}
	} else if (connexion != null && connexion.equals("seconnecter")) {
		if (gerelesCitoyen.recherchePersonne()) {
			rset = gerelesCitoyen.getRset();
			String fonction = rset.getString("fonction");

			// set session var
			session.setAttribute("id", rset.getString("id"));
			session.setAttribute("nom", rset.getString("nom"));
			session.setAttribute("prenom", rset.getString("prenom"));
			session.setAttribute("identifiant", rset.getString("identifiant"));
			session.setAttribute("fixe", rset.getString("fixe"));
			session.setAttribute("mobile", rset.getString("mobile"));
			session.setAttribute("mail", rset.getString("mail"));
			session.setAttribute("rue", rset.getString("rue"));
			session.setAttribute("ville", rset.getString("ville"));
			session.setAttribute("fonction", fonction);

			if (fonction.equals("citoyen")) {
				response.sendRedirect("mesInformationsPersonnelles.jsp");
			} else if (fonction.equals("administrateur")) {
				response.sendRedirect("gereDemandeCitoyen.jsp");
			}
		} else {
			erreurMessage = "erreur d'authentification";
			response.sendRedirect("index.jsp?erreur=" + erreurMessage);
		}
	}
	/*
	** Arrive ici, on sait que la personne est inscrite, ou pense l'etre, 
	**    on recherche ses caracteristiques par recherchePersonne()
	** la methode utile.GereCitoyen.getRset donne un ResulSet sur le tuple de la base de donnee de la  personne
	** et on les met en variables de session, (gardez les memes noms pour la suite)
	**              id, nom, prenom, mobile, fixe, rue, ville, identifiant, mail, fonction
	*/

	/*
	** si c'est un administrateur : appel e la page  "gereDemandeCitoyen.jsp"
	** si c'est un citoyen appel e la page  mesInformationsPersonnelles.jsp
	*/

	/*
	 **      si n'est pas inscrit 
	 **                appel e la page d'inscription "index.jsp"avec un parametre "erreur" qui signale l'erreur d'identification
	*/
%>



