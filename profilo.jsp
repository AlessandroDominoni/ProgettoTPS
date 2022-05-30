<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head>
		<title>Profilo - NOMEAPP</title>
	</head>
	<body>
		<p style="text-align: center;">PROFILO</p>
		<form action="/progetto1/modificautente" method="post" style="text-align: center;" id="modifica">
		<%
			String username = (String) session.getAttribute("username");
			String azienda = (String) session.getAttribute("azienda");
			
			String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
			Connection connection=null;
				
			try{
				Class.forName(DRIVER);
			}catch (ClassNotFoundException e) {
				out.println("Errore nel caricare il Driver Ucanaccess.");
			}
			try{
				connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Database.accdb");
				String query = "SELECT * FROM Utenti WHERE username='"+username+"';"; 
				Statement st = connection.createStatement();
				ResultSet result = st.executeQuery(query);
				while(result.next()){
					out.println("<input type='text' name='username' value="+result.getString(3)+" readonly> <br>");
					out.println("<input type='text' name='password' placeholder="+result.getString(4)+" > <br>");
					out.println("<input type='text' name='email' placeholder="+result.getString(5)+"> <br>");
					out.println("<input type='text' name='telefono' placeholder="+result.getString(6)+"> <br>");
					out.println("<input type='text' name='indirizzo' placeholder="+result.getString(7)+"> <br>");
					out.println("<input type='text' name='nome' placeholder="+result.getString(8)+"> <br>");
					if(azienda!=null){
						out.println("<input type='text' name='settore' placeholder="+result.getString(13)+"> <br>");
						out.println("<input type='text' name='ndip' placeholder="+result.getString(14)+" > <br>");
					}
					else{
						out.println("<input type='text' name='cognome' placeholder="+result.getString(9)+"> <br>");
						out.println("<input type='text' name='nascita' placeholder="+result.getString(10)+" > <br>");
						out.println("<input type='text' name='livstudio' placeholder="+result.getString(11)+"><br>");
						out.println("<input type='text' name='esperienze' placeholder="+result.getString(12)+" > <br>");
					}
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
		
		<p>Inserire la parola "CONFERMA" per cancellare il profilo</p>
		<form action="/progetto1/deleteutente" method="post" style="text-align: center;" id="elimina">
        <input type="text" name="password"> <br>
		<button type="submit">CONFERMA</button>
		</form>
		</form>
	</body>
</html>	
