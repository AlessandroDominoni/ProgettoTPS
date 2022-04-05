import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class Login extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        Connection connection=null;
        HttpSession session = req.getSession();
        PrintWriter printwriter = res.getWriter();
       
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Errore: Impossibile caricare il Driver");
        }
        try {
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + req.getServletContext().getRealPath("/") + "Database.accdb");
           
            String u=req.getParameter("username");
            
            String password=req.getParameter("password");
            
            String query = "SELECT username FROM Utenti WHERE username= '"+ u +"' AND password= '"+ password +"'";
            String query1 = "SELECT azienda FROM Utenti WHERE username= '"+ u +"' AND password= '"+ password +"'";
            
            Statement statement = connection.createStatement();
            
            ResultSet resultSet = statement.executeQuery(query);
            ResultSet resultSet1 = statement.executeQuery(query1);
            
            String username=null;
            String azienda=null;
            
            while(resultSet.next()){
                username=resultSet.getString(1);
            }
            while(resultSet1.next()){
                azienda=resultSet1.getString(1);
            }
            if(username==null){
                printwriter.println("<p align='center'>Errore di login, credenziali errate</p> <br> <p>Torna alla schermata di <a href='index.jsp'>login</a></p>");
            }
            else{
                res.sendRedirect(req.getContextPath()+"/home.jsp");
                session.setAttribute("username", username);
                session.setAttribute("azienda", azienda);
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
