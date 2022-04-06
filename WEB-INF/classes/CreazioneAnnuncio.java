import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class CreazioneAnnuncio extends HttpServlet{
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
            String desc=req.getParameter("desc");
            
            String query = "INSERT INTO Annunci (nomeazienda, descrizione) VALUES'"+ username +"' , '"+ desc+"';";
            Statement statement = connection.createStatement();
           
           
            if(username!=null && desc!=null){
                statement.executeUpdate(query);
                res.sendRedirect(req.getContextPath()+"/home.jsp");
            }
            else{
                printwriter.println("<p align='center'>Errore nella creazione dell'annuncio</p> <br> <p><a href='create.jsp'>Riprova</a></p>");
            }
           
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