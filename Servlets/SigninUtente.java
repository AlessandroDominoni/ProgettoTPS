import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class SigninUtente extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        Connection connection=null;
        PrintWriter printwriter = res.getWriter();
        res.setContentType("text/html");

       
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Errore: Impossibile caricare il Driver");
        }
        try {
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + req.getServletContext().getRealPath("/") + "Database1.accdb");
           
           
            String username=req.getParameter("username");
            String nome=req.getParameter("nome");
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            String indirizzo=req.getParameter("indirizzo");
            String telefono=req.getParameter("telefono");
            String cognome=req.getParameter("cognome");
            String nascita=req.getParameter("datadinascita");
            String livstudio=req.getParameter("studio");
            String esperienza=req.getParameter("esperienza");
            
           String query = "INSERT INTO Utente (username, password, [nome], cognome, indirizzo, [data di nascita], email, [numero di telefono], [livello di studio], [anni di esperienza]) VALUES('"+ username +"' , '"+ password +"' , '"+ nome +"' , '"+ cognome+"' , '"+ indirizzo+"' , '"+ nascita+ "' , '"+ email+ "' , '"+ telefono+ "' , '"+ livstudio+ "' , '"+ esperienza+ "');";
           Statement statement = connection.createStatement();
           statement.executeUpdate(query);
           
           printwriter.println("<p align='center'>Registrazione effettuata</p> <br> <p>Torna alla schermata di <a href='index.html'>login</a></p>");
           
           
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
