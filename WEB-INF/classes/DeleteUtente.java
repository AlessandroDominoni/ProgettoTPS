import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class DeleteUtente extends HttpServlet{
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
           
            String password=req.getParameter("password");
            String username = (String) session.getAttribute("username");
            
            String query = "DELETE FROM Utenti WHERE username='"+username+"';";
            String query1= "DELETE FROM Annunci WHERE nomeazienda='"+username+"';";
            Statement statement = connection.createStatement();
            Statement statement1 = connection.createStatement();
            //printwriter.println(password);
            if(password.equals("CONFERMA") || password.equals("conferma")){
                statement.executeUpdate(query);
                statement1.executeUpdate(query1);
                res.sendRedirect(req.getContextPath()+"/index.jsp");
            }
            else{
                printwriter.println("<p align='center'>Errore nell'eliminazione</p> <br> <p><a href='profilo.jsp'>Torna Indietro</a></p>");
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
