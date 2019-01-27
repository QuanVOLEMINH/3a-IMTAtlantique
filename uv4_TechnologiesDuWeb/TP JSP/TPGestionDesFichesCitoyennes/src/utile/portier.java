package utile;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class portier implements Filter {

	private FilterConfig filterConfig = null;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		 
		
	} 
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	throws IOException, ServletException { 
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
	   HttpSession session = hrequest.getSession(true);
	   // si l'attribut de sesion nom n'est pas présent
	   //            retour vers l'inscription : index.jsp
	   //            autrement suite normale
	   {
		  chain.doFilter(request, response); }
	
	}
	

	public void destroy() {
		this.filterConfig = null;
		
	}
	
	
}
