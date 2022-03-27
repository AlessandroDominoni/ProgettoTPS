import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class SigninUtente extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        Connection connection=null;
        PrintWriter printwriter = res.getWriter();

       
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Errore: Impossibile caricare il Driver");
        }
        try {
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + req.getServletContext().getRealPath("/") + "Database.accdb");
           
           
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            
           String query = "INSERT INTO Utenti (username, password) VALUES'"+ username +"' , '"+ password+"';";
           Statement statement = connection.createStatement();
           statement.executeUpdate(query);
           
           printwriter.println("<p align='center'>Registrazione effettuata</p> <br> <p>Torna alla schermata di <a href='index.jsp'>login</a></p>");
           
           
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
