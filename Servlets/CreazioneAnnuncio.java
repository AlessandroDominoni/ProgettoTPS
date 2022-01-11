
import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CreazioneAnnuncio extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\" />");
        out.println("<title> Creazione Annuncio </title>");
        out.println("</head>");
        out.println("<body>L'annuncio è stato creato con successo");
        out.println("</body>");
        out.println("</html>");
    }
}