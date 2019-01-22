package mesCommandes;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class FiltreSortie implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String nom = null;
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpSession session = hrequest.getSession();

		// ************************************************************
		// ce filtre doit s'executer après la servlet
		// il vide le caddy du client en cours
		// ************************************************************
		chain.doFilter(request, response);

		nom = (String) session.getAttribute("nomClient");
		if (nom != null) {
			Magasin.lesCaddy.get(nom).clear();
		}
		System.out.println("sortie avec succes");
	}
	// ************************************************************
}
