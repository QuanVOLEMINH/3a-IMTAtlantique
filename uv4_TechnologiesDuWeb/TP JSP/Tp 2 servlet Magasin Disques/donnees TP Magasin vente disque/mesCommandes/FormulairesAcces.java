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
	private void infoConnexionetInscription (PrintWriter out, String nom)
	{
	    out.println("nom");
	    out.println("<input type='text' size='20' name='nom' value='" +((nom!=null)?nom:"") + "'  >  <br> ");
	    out.println("mot de passe");
	    out.println("<input type='password' size='20' name='motdepasse'> <br>");
	}

	private void infoInscription (PrintWriter out)
	{
	    out.println("email");
	    out.println("<input type='text' size='20' name='mail'> <br>");
	    out.println("telephone");
	    out.println("<input type='text' size='20' name='telephone'> <br>");
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String demande, nomRecu, erreurInscription, erreurConnexion, inscriptionFaite;


     //  ********************************************************************************************        
     //  initialisation des différents paramètres possibles
     //  ********************************************************************************************    



     //  ********************************************************************************************           
         response.setContentType("text/html");
         PrintWriter out = response.getWriter();
         out.println("vous êtes dans la servlet  FormulaireACCES, modifiez la");
         
        // Les 2 méthodes  infoInscription et infoConnexionetInscription sont à votre disposition.
         
        //  ********************************************************************************************            		 
        //   cas 1   inscription       paramètre demande = "inscription"        
        //       Si le paramètre "erreurInscription" est présent, informez que les informations transmises ne sont pas acceptables.
      	//   Demandez des informations (nom, mot de passe, email, téléphone) par un formulaire
      	//   et rappel de la  servlet   "VerificationCompte" avec ces informations en paramètre pour enregistrer ces valeurs
        //   le paramètre inscrire est envoyé avec comme valeur inscrire (bouton submit)
        //  ********************************************************************************************       
         
         
         //  ********************************************************************************************            		 
         //   cas 2   connection     paramètre demande = "connexion"        
         //       Si le paramètre "erreurConnexion" est présent, informez que les informations transmises ne sont pas acceptables,
         //     et sortir la valeur de erreurConnexion
         //       Si le paramètre inscriptionFaite est présent, il vient de s'inscrire, on rajoute un message comme quoi 
         //    l'inscription  s'est bien réalisée et dans le formulaire on initialise le nom avec le nom reçu en paramètre.
         //        
         //   Demandez des informations (nom, mot de passe) par un formulaire
         //   et rappel de la  servlet   VerificationCompte avec ces informations en paramètres pour vérifier ces valeurs
         //   le paramètre "connecter" est envoyé avec comme valeur "connecter" (bouton submit)
         //  ********************************************************************************************         

   }  // doGet(HttpServletRequest
         
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
      { 
         doGet(request, response);
      }  














}
