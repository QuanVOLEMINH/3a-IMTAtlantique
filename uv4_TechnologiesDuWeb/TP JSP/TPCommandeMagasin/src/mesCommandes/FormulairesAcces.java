package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class FormulairesAcces extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// au prochain TP nous utiliserons des formulaires plus �labor�s
	private void infoConnexionetInscription(PrintWriter out, String nom) {
		out.println("Nom");
		out.println("<input type='text' class='input' size='20' name='nom' value='" + ((nom != null) ? nom : "")
				+ "'  >  <br> ");
		out.println("Mot de passe");
		out.println("<input type='password' class='input' size='20' name='motdepasse'> <br>");
	}

	private void infoInscription(PrintWriter out) {
		out.println("Email");
		out.println("<input type='email' class='input' size='20' name='mail'> <br>");
		out.println("Telephone");
		out.println("<input type='number' class='input' size='20' name='telephone'> <br>");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String demande, nomRecu, erreurInscription, erreurConnexion, inscriptionFaite;

		// ********************************************************************************************
		// initialisation des diff�rents param�tres possibles
		// ********************************************************************************************

		// ********************************************************************************************
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.printOpenHtml(out);

		demande = request.getParameter("demande");
		// Les 2 m�thodes infoInscription et infoConnexionetInscription sont � votre
		// disposition.

		// ********************************************************************************************
		// cas 1 inscription param�tre demande = "inscription"
		// Si le param�tre "erreurInscription" est pr�sent, informez que les
		// informations transmises ne sont pas acceptables.
		// Demandez des informations (nom, mot de passe, email, t�l�phone) par un
		// formulaire
		// et rappel de la servlet "VerificationCompte" avec ces informations en
		// param�tre pour enregistrer ces valeurs
		// le param�tre inscrire est envoy� avec comme valeur inscrire (bouton submit)
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
				out.println("<hr><input type='submit' name='inscrire' value='Inscrire' class='button is-primary'><br>");
				out.println("</form>");

				// ********************************************************************************************
				// cas 2 connection param�tre demande = "connexion"
				// Si le param�tre "erreurConnexion" est pr�sent, informez que les informations
				// transmises ne sont pas acceptables,
				// et sortir la valeur de erreurConnexion
				// Si le param�tre inscriptionFaite est pr�sent, il vient de s'inscrire, on
				// rajoute un message comme quoi
				// l'inscription s'est bien r�alis�e et dans le formulaire on initialise le nom
				// avec le nom re�u en param�tre.
				//
				// Demandez des informations (nom, mot de passe) par un formulaire
				// et rappel de la servlet VerificationCompte avec ces informations en
				// param�tres pour v�rifier ces valeurs
				// le param�tre "connecter" est envoy� avec comme valeur "connecter" (bouton
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
				erreurConnexion = request.getParameter("erreurConnexion");
				if (erreurConnexion != null) {
					this.printError(out, erreurConnexion);
				}
				out.println(
						"<hr><input type='submit' name='connecter' value='Connecter' class='button is-primary'><br>");
				out.println("</form>");
			}
		}

		this.printCloseHtml(out);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}

	private void printError(PrintWriter out, String erreurMessage) {
		out.println("<p style=\"color:red;\">*" + erreurMessage + "</p>");
	}

	private void printSuccessInscriptionMessage(PrintWriter out) {
//		out.println("<p style=\"color:green;\"><strong>" + "L'inscription s'est bien realisee." + "</strong></p>");
		out.println("<div class=\"notification is-primary\">" + "<strong>L'inscription s'est bien realisee.</strong>"
				+ "</div>");
	}

	private void printOpenHtml(PrintWriter out) {
		out.println("<!DOCTYPE html><html><head><meta charset=\"ISO-8859-1\">" + "<title>Super March� du disque</title>"
				+ "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css\">"
				+ "</head><body><div class=\"container\"><hr><div class=\"columns\"><div class=\"column is-one-third\">");
	}

	private void printCloseHtml(PrintWriter out) {
		out.println("</div></div></div></body></html>");
	}
}
