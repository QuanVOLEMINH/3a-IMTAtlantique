package mesCommandes;

import javax.servlet.http.*;

class Util {

	static public String rechercheValeurCookies(Cookie[] lescookies, String nom) {
		String reponse = null;

		// ********************************************************************************************
		// recherche si dans le tableau de cookies il en existe un avec le nom donn�.
		// si oui la valeur de ce cookie est donn�e en r�sultat
		// Cette m�thode sera appel�e par d�autres classes aussi elle est � public �
		// et � static � pour pouvoir l�appeler directement par la classe
		// "Util.rechercheCookies(..)"
		// ********************************************************************************************
		for (int i = 0; i < lescookies.length; i++) {
			Cookie cookie = lescookies[i];
			if (cookie.getName().equals(nom)) {
				reponse = cookie.getValue();
			}
		}

		// ********************************************************************************************
		return reponse;
	}

	static boolean identique(String recu, String cookie) {
		return ((cookie != null) && (recu.equals(cookie)));

	}
}