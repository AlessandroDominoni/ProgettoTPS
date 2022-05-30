<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head>
		<title>Modifica Annuncio - NOMEAPP</title>
	</head>
	<body>
		<p style="text-align: center;">Modifica Annuncio</p>
		<form action="/progetto1/modificaannuncio" method="post" style="text-align: center;" id="modifica">
		<%
			String username = (String) session.getAttribute("username");
			String id = (String) session.getAttribute("id");
			
			String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
			Connection connection=null;
				
			try{
				Class.forName(DRIVER);
			}catch (ClassNotFoundException e) {
				out.println("Errore nel caricare il Driver Ucanaccess.");
			}
			try{
				connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Database.accdb");
				String query = "SELECT * FROM Annunci WHERE nomeazienda='"+username+"' AND id='"+id+"';"; 
				Statement st = connection.createStatement();
				ResultSet result = st.executeQuery(query);
				while(result.next()){
					out.println("Nome Azienda: <input type='text' name='nomeazienda' value="+result.getString(2)+" readonly> <br>");
					out.println("Stipendio: <input type='text' name='contratto' placeholder="+result.getString(3)+" > <br>");
					out.println("Orario: <input type='text' name='orario' placeholder="+result.getString(4)+"> <br>");
					out.println("Professione: <input type='text' name='professione' placeholder="+result.getString(5)+"> <br>");
					out.println("Descrizione: <input type='text' name='descrizione' placeholder="+result.getString(6)+"> <br>");
					
				}
				
			}catch(Exception e){
				out.println(e);
			}
			
			
			
			finally{
				if(connection != null){
					try{
						connection.close();
					}catch(Exception e){
						out.println("La connessione non è stata chiusa correttamente...");
					}
				}
			}
		%>
		
		<button type="submit">Modifica</button><br>
		</form>
	</body>
</html>	