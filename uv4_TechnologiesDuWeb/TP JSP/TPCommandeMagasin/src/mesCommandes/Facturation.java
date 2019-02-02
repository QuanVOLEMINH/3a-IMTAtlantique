package mesCommandes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Facturation
 */
public class Facturation extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection connexion = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		printPageContent(request, response);
		clearSession(request);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void printPageContent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String nom = (String) session.getAttribute("nomClient");

		OuvreBase();
		out.println("<html>");
		out.println("<head>");
		out.println("<title> Commande de disques </title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' >");
		out.println(
				"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css\">");
		out.println("</head>");
		out.println("<body bgcolor=\"white\">");
		out.println("<div class='container'>");
		out.println("<hr>");
		out.println("<h1 class='title'> Facturation </h1>");
		out.println("<h3 class='subtitle'>" + "Voici la facture de " + nom.toUpperCase() + "</h3>");
		printUserCommands(nom, out, request.getContextPath());
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void printUserCommands(String nom, PrintWriter out, String repertoire) {
		ResultSet rset = null;
		ResultSet rs = null;
		int cle = 0;
		try {

			// *********************************************************
			// affichez les disques que client a commandé dans la base de données. « table
			// commande »
			// vous pouvez utiliser "afficherDisquesDansBase" avec 3 parmètre :
			// - une instance de "Resulset" résultat de la recherche des disques du client
			// courant dans la base de données
			// - le « PrintWriter » pour pouvoir rajouter ces disques dans la page de la
			// réponse HTML,
			// - et le repertoire courant de votre application "request.getContextPath()"
			// **********************************************************
			pstmt = connexion.prepareStatement("select id from client where nom = ?");
			pstmt.setString(1, nom);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				cle = rset.getInt(1);
				pstmt = connexion.prepareStatement("select nomarticle from commande where client = ?");
				pstmt.setInt(1, cle);
				rs = pstmt.executeQuery();
				Magasin.afficherDisquesDansBase(rs, out, repertoire);
				Magasin.printTotalPrice(out);
			}

		} catch (Exception E) {
			out.println("erreur base");
			log(" - probeme ajoute " + E.getClass().getName());
			E.printStackTrace();
		}
	}

	private void clearSession(HttpServletRequest request) {
		request.getSession().invalidate();
	}

	private void OuvreBase() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			connexion = DriverManager.getConnection("jdbc:mysql://localhost/magasin", "root", "");
			connexion.setAutoCommit(true);
			stmt = connexion.createStatement();
		} catch (Exception E) {
			log(" -------- problème  " + E.getClass().getName());
			E.printStackTrace();
		}
	}

}
