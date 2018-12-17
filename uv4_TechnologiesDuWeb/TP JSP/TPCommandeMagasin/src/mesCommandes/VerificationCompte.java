package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/voirCompte")
public class VerificationCompte extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomRecu, motPasseRecu;
		String inscrireClient, connecterClient;
		String nomCookie = null, motPasseCookie = null;
		Cookie[] cookies = null;

		// ********************************************************************************************
		// initialisation des différents paramètres possibles
		// ********************************************************************************************
		String erreurMessage;

		inscrireClient = request.getParameter("inscrire");
		connecterClient = request.getParameter("connecter");
		if (inscrireClient != null) {
			nomRecu = request.getParameter("nom");
			motPasseRecu = request.getParameter("motdepasse");
			// verifie la condition
			if (nomRecu == null || motPasseRecu == null || nomRecu.length() < 4 || motPasseRecu.length() < 4) {
				erreurMessage = "Nom ou mot de passe obligatoires et de plus de 4 caracteres.";
				response.sendRedirect("formulaire?demande=inscription&erreurInscription=" + erreurMessage);
			} else {
				response.sendRedirect("formulaire?demande=connextion&inscriptionFaite=true&nom=" + nomRecu);
			}
		} else if (connecterClient != null) {
			System.out.println("connecter");
		}

		// cas 1 paramètre inscrire présent
		// Si les informations passées sont acceptables (nom et mot de passe > 4
		// caractères)
		// un cookie est créé avec comme nom, le nom passé et comme valeur, le mot de
		// passe passé
		// puis appel à la servlet FormulairesAcces pour la connexion avec les
		// paramètres inscriptionFaite à true et le nom passé
		// sinon appel à la servlet FormulairesAcces pour l'inscription avec le
		// paramètre erreurInscription = nonInscrit
		// ********************************************************************************************

		// cas 2 paramètre connecter présent
		// si le parametre nom est absent appel à la servlet FormulairesAcces avec
		// demande = connexion
		// autrement, on verifie que le nom et le mot de passe passés se trouvent dans
		// un cookie
		// en utilisant la méthode "Util.rechercheValeurCookies" que vous devez
		// compléter
		//
		// si oui appel à la servlet EntreeMagasinDisque avec comme paramètre le nom
		// passé
		// sinon appel à la servlet FormulairesAcces pour la connexion avec le paramètre
		// erreurInscription = mauvaiseIdentification
		// ********************************************************************************************

	}

	// doGet(HttpServletRequest

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}

}
