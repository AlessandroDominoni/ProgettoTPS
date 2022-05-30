
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class ModificaAnnuncio extends HttpServlet{
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
            
            String nomeazienda=req.getParameter("nomeazienda");
            String contratto=req.getParameter("contratto");
            String orario=req.getParameter("orario");
            String professione=req.getParameter("professione");
            String descrizione=req.getParameter("descrizione");
            
            String id = (String) session.getAttribute("id");
            
            String query = "UPDATE Annunci SET contratto='"+contratto+"', orario='"+orario+"', professione='"+professione+"', descrizione='"+descrizione+"' WHERE id='"+id+"';";
            Statement statement = connection.createStatement();
            
            if(nomeazienda != null){
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

