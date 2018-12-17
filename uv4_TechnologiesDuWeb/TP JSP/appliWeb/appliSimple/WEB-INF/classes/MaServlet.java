import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



	public class MaServlet extends HttpServlet  { 
        public void doGet (HttpServletRequest request,
                                      HttpServletResponse response)    throws ServletException, IOException  {
             PrintWriter         out;
             String              title = "Simple Servlet Output";
             response.setContentType("text/html");
             out = response.getWriter();
             out.println("<HTML><HEAD><TITLE>");
             out.println(title);
             out.println("</TITLE></HEAD><BODY>");
             out.println("<H1>" + title + "</H1>");
             out.println("<P>This is output from SimpleServlet.");
             out.println("</BODY></HTML>");
             out.close();
         }   }
