import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class SigninUtente extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        Connection connection=null;
        PrintWriter out = res.getWriter();

       
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Errore: Impossibile caricare il Driver");
        }
        try {
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + req.getServletContext().getRealPath("/") + "Database.accdb");
           
           
            String tipo=req.getParameter("tipo");
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            String email=req.getParameter("email");
            String telefono=req.getParameter("telefono");
            String indirizzo=req.getParameter("indirizzo");
            String nome=req.getParameter("nome");
            String settore=req.getParameter("settore");
            String ndip=req.getParameter("ndip");
            String cognome=req.getParameter("cognome");
            String nascita=req.getParameter("nascita");
            String livstudio=req.getParameter("livstudio");
            String esperienze=req.getParameter("esperienze");
            
            String query="";
            
            if(tipo!=null){
                query = "INSERT INTO Utenti (azienda, username, password, email, telefono, indirizzo, nome, settore, ndip) VALUES 'si', '"+ username +"' , '"+ password+"' , '"+ email+"' , '"+ telefono+"' , '"+ indirizzo+"' , '"+ nome+"', '"+settore+"', '"+ndip+"';";
            }
            else{
                query = "INSERT INTO Utenti (azienda, username, password, email, telefono, indirizzo, nome, cognome, nascita, livstudio, esperienze) VALUES "+tipo+", '"+ username +"' , '"+ password+"' , '"+ email+"' , '"+ telefono+"' , '"+ indirizzo+"' , '"+ nome+"' , '"+ cognome+"' , '"+ nascita+"' , '"+livstudio+"' , '"+ esperienze+"';";
            }
            //out.println(tipo);
            //out.println(query);
            
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
           
            out.println("<p align='center'>Registrazione effettuata</p> <br> <p>Torna alla schermata di <a href='index.jsp'>login</a></p>");
           
           
        } catch (Exception e) {
            System.out.println("Errore: Impossibile Connettersi al Database");
        }
        finally
        {
           if(connection!=null)
           {
               try
               {
                   connection.close(); 
               }
               catch (Exception e)
               {
                   System.out.println("Errore nella chiusura della connessione");
               }
           }
        }
    }
}
