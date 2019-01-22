package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class VerificationCompte extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomRecu, motPasseRecu;
		String inscrireClient, connecterClient;
		String nomCookie = null, motPasseCookie = null;
		Cookie[] cookies = null;

		// ********************************************************************************************
		// initialisation des diff�rents param�tres possibles
		// ********************************************************************************************
		String erreurMessage;

		inscrireClient = request.getParameter("inscrire");
		connecterClient = request.getParameter("connecter");

		// cas 1 param�tre inscrire pr�sent
		// Si les informations pass�es sont acceptables (nom et mot de passe > 4
		// caract�res)
		// un cookie est cr�� avec comme nom, le nom pass� et comme valeur, le mot de
		// passe pass�
		// puis appel � la servlet FormulairesAcces pour la connexion avec les
		// param�tres inscriptionFaite � true et le nom pass�
		// sinon appel � la servlet FormulairesAcces pour l'inscription avec le
		// param�tre erreurInscription = nonInscrit
		// ********************************************************************************************

		if (inscrireClient != null) {
			nomRecu = request.getParameter("nom");
			motPasseRecu = request.getParameter("motdepasse");
			// verifie la condition
			if (nomRecu == null || motPasseRecu == null || nomRecu.length() < 4 || motPasseRecu.length() < 4) {
				erreurMessage = "Nom ou mot de passe obligatoires et de plus de 4 caracteres.";
				response.sendRedirect("formulaire?demande=inscription&erreurInscription=" + erreurMessage);
			} else {
				Cookie cookie = new Cookie(nomRecu, motPasseRecu);
				cookie.setMaxAge(60000);
				response.addCookie(cookie);
				response.sendRedirect("formulaire?demande=connexion&inscriptionFaite=true&nom=" + nomRecu);
			}
		}

		// cas 2 param�tre connecter pr�sent
		// si le parametre nom est absent appel � la servlet FormulairesAcces avec
		// demande = connexion
		// autrement, on verifie que le nom et le mot de passe pass�s se trouvent dans
		// un cookie
		// en utilisant la m�thode "Util.rechercheValeurCookies" que vous devez
		// compl�ter
		//
		// si oui appel � la servlet EntreeMagasinDisque avec comme param�tre le nom
		// pass�
		// sinon appel � la servlet FormulairesAcces pour la connexion avec le param�tre
		// erreurInscription = mauvaiseIdentification
		// ********************************************************************************************

		else if (connecterClient != null) {
			nomRecu = request.getParameter("nom");
			motPasseRecu = request.getParameter("motdepasse");
			cookies = request.getCookies();
			nomCookie = nomRecu;
			if (cookies != null)
				motPasseCookie = Util.rechercheValeurCookies(cookies, nomCookie);

			if (motPasseCookie == null) {
				erreurMessage = "Nom est inconnu";
				response.sendRedirect("formulaire?demande=connexion&erreurConnexion=" + erreurMessage);
			} else {
				if (Util.identique(motPasseRecu, motPasseCookie)) {
					response.sendRedirect("entreClient?nom=" + nomRecu);
				} else {
					erreurMessage = "Mot de passe est incorrect";
					response.sendRedirect("formulaire?demande=connexion&erreurConnexion=" + erreurMessage);
				}
			}
		}
	}

	// doGet(HttpServletRequest

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}

}
