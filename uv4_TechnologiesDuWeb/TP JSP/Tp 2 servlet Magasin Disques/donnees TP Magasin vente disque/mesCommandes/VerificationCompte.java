package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/verifCompte")
public class VerificationCompte extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String nomRecu, motPasseRecu;
         String inscrireClient, connecterClient;
         String nomCookie =null, motPasseCookie =null;
         Cookie[] cookies =null;

     //  ********************************************************************************************        
     //  initialisation des diff�rents param�tres possibles
     //  ********************************************************************************************    

         
              
       	//   cas 1    param�tre inscrire  pr�sent
         //    Si les informations pass�es sont acceptables (nom et mot de passe > 4 caract�res)
         //      un cookie est cr�� avec comme nom, le nom pass� et comme valeur, le mot de passe pass�
         //      puis appel � la servlet FormulairesAcces pour la connexion avec les param�tres inscriptionFaite � true et le nom pass�
         //    sinon appel � la servlet FormulairesAcces pour l'inscription avec le param�tre erreurInscription = nonInscrit
         //  ********************************************************************************************            
       
         //   cas 2    param�tre connecter  pr�sent
         //     si le parametre nom est absent appel � la servlet FormulairesAcces avec demande = connexion
         //     autrement, on verifie que le nom et le mot de passe pass�s se trouvent dans un cookie
         //    en utilisant la m�thode "Util.rechercheValeurCookies" que vous devez compl�ter
         //     
         //      si oui  appel � la servlet EntreeMagasinDisque avec comme param�tre  le nom pass�
         //      sinon appel � la servlet FormulairesAcces pour la connexion avec le param�tre erreurInscription = mauvaiseIdentification
         //  ********************************************************************************************            
            

        }       
  
     // doGet(HttpServletRequest
         
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
      { 
         doGet(request, response);
      }   

}
