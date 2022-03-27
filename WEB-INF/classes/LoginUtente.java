import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class LoginUtente extends HttpServlet{
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
            
            String query = "SELECT username FROM Utenti WHERE username= '"+ username +"' AND password= '"+ password +"'";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            String risultato=null;
            while(resultSet.next()){
                risultato=resultSet.getString(1);
            }
            if(risultato==null){
                printwriter.println("<p align='center'>Errore di login, credenziali errate</p> <br> <p>Torna alla schermata di <a href='index.jsp'>login</a></p>");
            }
            else{
                //res.sendRedirect(req.getContextPath()+"/home.jsp");
                res.sendRedirect(req.getContextPath()+"/home.jsp");
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

