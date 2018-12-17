package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/formulaire")
public class FormulairesAcces extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// au prochain TP nous utiliserons des formulaires plus élaborés
	private void infoConnexionetInscription(PrintWriter out, String nom) {
		out.println("nom");
		out.println("<input type='text' size='20' name='nom' value='" + ((nom != null) ? nom : "") + "'  >  <br> ");
		out.println("mot de passe");
		out.println("<input type='password' size='20' name='motdepasse'> <br>");
	}

	private void infoInscription(PrintWriter out) {
		out.println("email");
		out.println("<input type='text' size='20' name='mail'> <br>");
		out.println("telephone");
		out.println("<input type='text' size='20' name='telephone'> <br>");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String demande, nomRecu, erreurInscription, erreurConnexion, inscriptionFaite;

		// ********************************************************************************************
		// initialisation des différents paramètres possibles
		// ********************************************************************************************

		// ********************************************************************************************
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// out.println("vous êtes dans la servlet FormulaireACCES, modifiez la");

		demande = request.getParameter("demande");
		// Les 2 méthodes infoInscription et infoConnexionetInscription sont à votre
		// disposition.

		// ********************************************************************************************
		// cas 1 inscription paramètre demande = "inscription"
		// Si le paramètre "erreurInscription" est présent, informez que les
		// informations transmises ne sont pas acceptables.
		// Demandez des informations (nom, mot de passe, email, téléphone) par un
		// formulaire
		// et rappel de la servlet "VerificationCompte" avec ces informations en
		// paramètre pour enregistrer ces valeurs
		// le paramètre inscrire est envoyé avec comme valeur inscrire (bouton submit)
		// ********************************************************************************************
		if (demande != null) {
			if (demande.equals("inscription")) {
				out.println(" <form action = \"voirCompte\" method = \"POST\">");
				this.infoConnexionetInscription(out, null);
				this.infoInscription(out);
				erreurInscription = request.getParameter("erreurInscription");
				if (erreurInscription != null) {
					this.printError(out, erreurInscription);
				}
				out.println("<input type='submit' name='inscrire' value='Submit'><br>");
				out.println("</form>");

				// ********************************************************************************************
				// cas 2 connection paramètre demande = "connexion"
				// Si le paramètre "erreurConnexion" est présent, informez que les informations
				// transmises ne sont pas acceptables,
				// et sortir la valeur de erreurConnexion
				// Si le paramètre inscriptionFaite est présent, il vient de s'inscrire, on
				// rajoute un message comme quoi
				// l'inscription s'est bien réalisée et dans le formulaire on initialise le nom
				// avec le nom reçu en paramètre.
				//
				// Demandez des informations (nom, mot de passe) par un formulaire
				// et rappel de la servlet VerificationCompte avec ces informations en
				// paramètres pour vérifier ces valeurs
				// le paramètre "connecter" est envoyé avec comme valeur "connecter" (bouton
				// submit)
				// ********************************************************************************************
			} else if (demande.equals("connexion")) {
				inscriptionFaite = request.getParameter("inscriptionFaite");
				if (inscriptionFaite != null && inscriptionFaite.equals("true")) {
					this.printSuccessInscriptionMessage(out);
				}
				out.println(" <form action = \"voirCompte\" method = \"POST\">");
				// prendre le nom si existe
				nomRecu = request.getParameter("nom");
				this.infoConnexionetInscription(out, nomRecu);
				erreurConnexion = request.getParameter("erreurConnextion");
				if (erreurConnexion != null) {
					this.printError(out, erreurConnexion);
				}
				out.println("<input type='submit' name='connecter' value='Connecter'><br>");
				out.println("</form>");
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}

	private void printError(PrintWriter out, String erreurMessage) {
		out.println("<p style=\"color:red;\">*" + erreurMessage + "</p>");
	}

	private void printSuccessInscriptionMessage(PrintWriter out) {
		out.println("<p style=\"color:green;\"><strong>" + "L'inscription s'est bien realisee." + "</strong></p>");
	}
}
