
   import java.io.*;
   import java.util.*;
   import javax.servlet.ServletException;
   import javax.servlet.ServletConfig;
   import javax.servlet.http.HttpServlet;
   import javax.servlet.http.HttpServletRequest;
   import javax.servlet.http.HttpServletResponse;
   import javax.servlet.ServletOutputStream;
   import javax.servlet.ServletContext;

   public class ServletDrapeau extends HttpServlet {
      private static final int CLE      = 0;
      private static final int NOMFICHIER    = 1;
      private static final int PAYS = 2;
 
  //*******************************************************************************************
  // Partie 1
  // Rajouter une ligne pour permettre la sortie texte de l'hymne des Etats unis : us    usa.txt
  //*******************************************************************************************  
     
      private String  tableTexte[][] = {            // contenu qui va etre  mis dans la Table de Hascode pour les textes
         {"uk",  "angleterre.txt",  "Angleterre"},  // la premiere valeur est la cle   :  nl
         {"fr",  "france.txt",  "France"},          // la deuxieme valeur est le nom du fichier  qui contient le texte  
         {"bzh",  "bretagne.txt",  "Bretagne"}      // la troisieme valeur est le type du fichier texte   

        }; 

   

  //*******************************************************************************************
  // Partie 1
  // Rajouter une ligne pour permettre la sortie du drapeau des Etats Unis : us    usa.gif
  //*******************************************************************************************
   
      private String tableDrapeaux[][] = {      // contenu qui va etre mis dans la Table de Hascode pour les images
         {"uk",  "gb.gif",  "Angleterre"},      // la premiere valeur est la cle   :  fr 
         {"fr",  "fr.jpg",  "France"},          // la deuxieme valeur est le nom du fichier qui contient le drapeau
         {"bzh",  "bzh.gif",  "Bretagne"}     // la troisième valeur est nom du pays  

      };
      
       private String tableCartes[][] = {         // contenu qui va etre mis dans la Table de Hascode pour les cartes
         {"uk",  "carte-uk.gif",  "Angleterre"},  // la premiere valeur est la cle   :  fr 
         {"fr",  "carte-fr.jpg",  "France"},      // la deuxieme valeur est le nom du fichier  qui contient la carte
         {"bzh",  "carte-bzh.jpg",  "Bretagne"} // la troisième valeur est nom du pays   
      };

   private String dirData= null;     
   			// un repertoire quelconque chez le serveur
   private String urlDrapeau = null ;
            // une adresse url ou se trouve les images des drapeaux 

   private String urlCarte = null ;
            // une adresse url ou se trouve les images des cartes 

    File repertoireTexte;
         // table de hashcode  pour trouver les images des drapeaux, indexee par le nom du pays
      Hashtable<String,String[]> drapeaux = new Hashtable<String,String[]>(); 
         // table de hashcode  pour trouver les cartes, indexee par le nom du pays
      Hashtable<String,String[]> cartes = new Hashtable<String,String[]>();    
         // table de hashcode  pour trouver les textes, indexee par le nom du pays
      Hashtable<String,String[]> textes = new Hashtable<String,String[]>();   
    
      private String drapeauParDefaut[] = {"bzh",  "bzh.gif",  "Bretagne"}; 
 
     
      public void init  (ServletConfig config) throws ServletException {
         super.init(config);
        // recherche du répertoire ou se trouve les fichiers contenant les drapeaux
          dirData= (this.getServletContext().getRealPath("") + "/" + "data"); 
          repertoireTexte = new File(dirData);
         if (!(repertoireTexte.exists() && repertoireTexte.isDirectory())) {
            log("le mauvais repertoire");
            throw new ServletException("On ne trouve pas votre repertoire" + dirData );
         }
      //	Création des tables de Hashcode
         for (int i = 0; i < tableDrapeaux.length; i++) {   // remplissage  de la table de Hascode
            drapeaux.put(tableDrapeaux[i][CLE], tableDrapeaux[i]);
           }
           
         for (int i = 0; i < tableCartes.length; i++) {   // remplissage  de la table de Hascode
            cartes.put(tableCartes[i][CLE], tableCartes[i]);
           }
         
         for (int i = 0; i < tableTexte.length; i++) {   // remplissage  de la table de Hascode
            textes.put(tableTexte[i][CLE], tableTexte[i]);
           }
      }
   
      public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
         String country = "";
         urlDrapeau = "../data/";
          
  //*******************************************************************************************
  // Partie 2
  //  Mettre l'adresse web du répertoire carte dans la variable urlCarte pour accéder aux cartes
  //*******************************************************************************************            

         try {
                  // Recherche du bon drapeau d'après la requete de type country 
            if (req.getParameter("country") != null) {
               country = req.getParameter("country");
            }
            else {
               country =tableDrapeaux[0][CLE];
            }
         
            String [] leDrapeau = (String [])(drapeaux.get(country));
            String [] laCarte =   (String [])(cartes.get(country));        
            String [] leTexte =   (String [])(textes.get(country));
            if (leDrapeau == null) {
               leDrapeau = drapeauParDefaut;
            }
            resp.setContentType("text/html");
            ServletOutputStream out = resp.getOutputStream();
            out.println("<HTML><HEAD><TITLE>");
            out.println("Page générée par une servlet");
            out.println("</TITLE></HEAD><BODY>");        
            out.println(" <H1>  Drapeau du pays  :  " + leDrapeau[PAYS] + "</H1>");
            out.print(" <IMG SRC=\"" + urlDrapeau + leDrapeau[NOMFICHIER] + "\" > ");          
            out.println(" <H1>  Carte du pays  :  " + laCarte[PAYS] + "</H1>");
            out.print(" <IMG   width='500'          SRC=\"" + urlCarte + laCarte[NOMFICHIER] + "\" > ");           
            out.println(" <H1> Hymne national du pays " + leDrapeau[PAYS] + " </H1>");
                     // lecture du fichier texte et écriture sur la page
            BufferedReader in = new BufferedReader(new FileReader(repertoireTexte + "/" +leTexte[NOMFICHIER]) );
            String laChaineLue;
            while((laChaineLue = in.readLine())!= null) {
               out.print(" <p>" );
               out.print(laChaineLue);
               out.println(" </p>" );
            }
            
            out.println("</BODY></HTML>");       
            in.close();
         }
            catch (IOException e) {
               throw new ServletException("Probleme dans l'écriture de la reponse" );
            }
            finally {
               resp.getOutputStream().close();
            }   
      }   
   }

