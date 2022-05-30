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
            String azienda = (String) session.getAttribute("azienda");
            
            String query="";
            
            if(azienda!=null){
                query = "UPDATE Utenti SET password='"+password+"', email='"+email+"', telefono='"+telefono+"', indirizzo='"+indirizzo+"', nome='"+nome+"', settore='"+settore+"', ndip='"+ndip+"' WHERE username='"+username+"';";
            }
            else{
                query = "UPDATE Utenti SET password='"+password+"', email='"+email+"', telefono='"+telefono+"', indirizzo='"+indirizzo+"', nome='"+nome+"', cognome='"+cognome+"', nascita='"+nascita+"', livstudio='"+livstudio+"', esperienze='"+esperienze+"'  WHERE username='"+username+"';";
            }
            Statement statement = connection.createStatement();
            
            if(password != null){
                    statement.executeUpdate(query);
                    res.sendRedirect(req.getContextPath()+"/home.jsp");
            }
            else{
                printwriter.println("<p align='center'>Errore nella modifica del profilo</p> <br> <p><a href='profilo.jsp'>Torna indietro</a></p>");
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

