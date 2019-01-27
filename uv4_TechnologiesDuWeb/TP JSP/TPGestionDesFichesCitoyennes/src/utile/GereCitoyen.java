package utile;

import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;

public class GereCitoyen {
	// les 4 propriétés
	private String nom, identifiant, mail, motPasse;

	static Connection connection, connectionPret = null;
	private ResultSet rset = null;
	private PreparedStatement pstmt;

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public void setMotPasse(String motPasse) {
		this.motPasse = motPasse;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNom() {
		return nom;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public String getMotPasse() {
		return motPasse;
	}

	public String getMail() {
		return mail;
	}

	public Connection getConnection() {
		return connection;
	}

	public ResultSet getRset() {
		return rset;
	}

	public Connection ouverture(String base) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + base, "root", "");
			connection.setAutoCommit(true);
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
		return connection;
	}

	// si la personne est trouvée, l'attibut rset contient ses caractéristiques
	public boolean recherchePersonne() {
		System.out.println(" recherchePersonne nom " + nom + " passe " + motPasse + " mail " + mail);
		String motPassebase = null;
		boolean trouve = false;
		try {
			pstmt = connection.prepareStatement("select * from personne where identifiant=?");
			pstmt.setString(1, identifiant);
			rset = pstmt.executeQuery();
			while (!trouve && rset.next()) {
				motPassebase = rset.getString("motPasse");
				if (BCrypt.checkpw(motPasse, motPassebase)) {
					trouve = true;
				}
			}
		} catch (Exception E) {
			System.out.println(" -------- probleme recherche " + E.getClass().getName());
			E.printStackTrace();
		}
		return trouve;

	}

	public void inscrireUtilisateur() {
		try {
			// algorihme de hashage et salage voir la classe BCrypt
			String MotPasseHash = BCrypt.hashpw(motPasse, BCrypt.gensalt());
			pstmt = connection
					.prepareStatement("insert into personne(nom, identifiant, motPasse, mail) VALUES (?,?,?,?)");
			pstmt.setString(1, nom);
			pstmt.setString(2, identifiant);
			pstmt.setString(3, MotPasseHash);
			pstmt.setString(4, mail);
			pstmt.executeUpdate();
		} catch (Exception E) {
			System.out.println(" -------- probleme inscrireUtilisateur " + E.getClass().getName());
			E.printStackTrace();
		}
	}

	// envoi d'un mail si smpt ne demande pas d'identification
	public static void envoieMail(String objet, String deLaPart, String pour, String contenu) {

		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.orange.fr");
			Session s = Session.getInstance(props, null);
			MimeMessage message = new MimeMessage(s);
			InternetAddress from = new InternetAddress(deLaPart);
			message.setFrom(from);
			InternetAddress to = new InternetAddress(pour);
			message.addRecipient(Message.RecipientType.TO, to);
			message.setSubject(objet);
			message.setContent(new String(contenu.getBytes(), "iso-8859-1"), "text/plain");
			Transport.send(message);
		} catch (Exception E) {
			System.out.println(" -------- probleme envoie message " + E.getClass().getName());
			E.printStackTrace();
		}
	}

	// envoi d'un mail avec smpt qui demande l'identification
	public static void envoieMailSecure(String objet, String deLaPart, String pour, String contenu, String motpasse) {

		try {
			System.out.println(
					"dans envoi mail passe |" + motpasse + "| pour  |" + pour + "| expediteur  |" + deLaPart + "|");
			Properties props = new Properties();
			// props.put("mail.smtp.host", "z.imt.fr");
			// props.put("mail.transport.protocol", "smtps");
			props.put("mail.transport.protocol", "smtps");
			props.put("mail.smtps.auth", "true");
			// props.put("mail.smtps.host", "z.telecom-bretagne.eu");
			props.put("mail.smtp.host", "smtp.orange.fr");
			props.put("mail.smtps.ssl.trust", "smtp.orange.fr");
			// props.put("mail.smtps.port", "587");
			props.put("mail.smtps.port", "465");
			Session s = Session.getInstance(props, null);
			MimeMessage message = new MimeMessage(s);
			InternetAddress from = new InternetAddress(deLaPart);
			message.setFrom(from);
			InternetAddress to = new InternetAddress(pour);
			message.addRecipient(Message.RecipientType.TO, to);
			message.setSubject(objet);
			Session mailSession = Session.getDefaultInstance(props, null);
			boolean sessionDebug = false;
			mailSession.setDebug(sessionDebug);
			message.setContent(new String(contenu.getBytes(), "iso-8859-1"), "text/plain");
			Transport transport = mailSession.getTransport("smtps");
			transport.send(message, deLaPart, motpasse);
		} catch (Exception E) {
			System.out.println(" -------- probleme envoie message " + E.getClass().getName());
			E.printStackTrace();
		}
	}
}