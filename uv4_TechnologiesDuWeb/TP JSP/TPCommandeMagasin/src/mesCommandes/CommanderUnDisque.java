package mesCommandes;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class CommanderUnDisque extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String nom = null;

		// *********************************************************
		// Si la personne dont le nom est dans la session, ne poss�de pas de caddie ,
		// son caddie est cr�� dans l�ensemble des caddies, "Magasin.lesCaddy"
		// C�est une nouvelle ArrayList qui est rajout�e dans la TreeMap "lesCaddy" de
		// la classe � Magasin �,
		// avec comme cl� le nom.
		//
		// **********************************************************
		HttpSession session = request.getSession();
		nom = (String)session.getAttribute("nomClient");
		// ***********************************************************
		ArrayList<String> leCaddie = Magasin.lesCaddy.get(nom);
		if (leCaddie == null) {
			leCaddie = new ArrayList<String>();
			Magasin.lesCaddy.put(nom, leCaddie);
		}

		// **********************************************************
		// Si le param�tre � ordre � est pr�sent est a comme valeur � ajouter �,
		// la r�f�rence du disque pass�e en param�tre est rajout�e dans le panier
		// (ArrayList<String>).
		//
		// ***********************************************************
		if (request.getParameter("ordre")!= null && request.getParameter("ordre").equals("ajouter")) {
			String code = request.getParameter("code");
			if (code != null) {
				leCaddie.add(code);
			}
		}
		// ****************************************************************
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title> Votre commande </title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' >");
		out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css\">");
		out.println("</head>");
		out.println("<body bgcolor=\"white\">");
		out.println("<div class='container'>");
		out.println("<hr>");
		out.println("<h1 class='title'> Super March� du disque </h1>");
		out.println("<h3 class='subtitle'>" + "Bonjour  " + nom.toUpperCase() + "  voici  votre commande" + "</h3>");
		// ************************************************************
		// affichage du contenu du caddie par la m�thode afficherContenuCaddy de �
		// Magasin � avec trois param�tres :
		// - le caddie
		// - le � PrintWriter � pour pouvoir rajouter ces disques dans la r�ponse HTML,
		// - le r�pertoire courant de votre application "request.getContextPath()"
		// *************************************************************
		Magasin.afficherContenuCaddy(leCaddie, out, request.getContextPath());
		// *************************************************************
		out.println(" </table>");
		out.println("<A HREF=afficheDisques> Vous ne pouvez commandez un autre disque </A><br> ");
		out.println("<A HREF=enregistreCommande> Vous pouvez enregistrer votre commande </A><br> ");
		out.println("<A HREF=facture> Fin de la commande et demande de la facture </A><br> ");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}

}
