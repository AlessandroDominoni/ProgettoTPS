import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class SigninAzienda extends HttpServlet{
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
            String nomeazienda=req.getParameter("nome");
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            String indirizzo=req.getParameter("indirizzo");
            String telefono=req.getParameter("telefono");
           
            
           String query = "INSERT INTO Azienda (username, password, [nome azienda], email, [numero di telefono], indirizzo) VALUES('"+ username +"' , '"+ password +"' , '"+ nomeazienda +"' , '"+ email+"' , '"+ telefono+"' , '"+ indirizzo+"');";
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

