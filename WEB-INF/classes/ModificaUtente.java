import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class ModificaUtente extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        Connection connection=null;
        HttpSession session = req.getSession(true);
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
            
            String query = "UPDATE Utenti SET password='"+password+"' WHERE username='"+username+"'";
            
            Statement statement = connection.createStatement();
            //ResultSet resultSet = statement.executeQuery(query);
            
            if(password != null){
                
                    statement.executeUpdate(query);
                    res.sendRedirect(req.getContextPath()+"/home.html");
                
            }
            else{
                printwriter.println("<p align='center'>Errore nella modifica del profilo</p> <br> <p><a href='profilo.html'>Torna indietro</a></p>");
            }
        } catch (Exception e) {
            System.out.println("Errore: Impossibile Connettersi al Database");
        }
        finally{
           if(connection!=null){
               try{
                   connection.close(); 
               }
               catch (Exception e){
                   System.out.println("Errore nella chiusura della connessione");
               }
           }
        }
    }
}
