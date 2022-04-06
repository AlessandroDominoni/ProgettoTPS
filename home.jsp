<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
	<head>
  		<title>NOMEAPP</title>
	</head>
	<body>
		<table>
			<tr>
				<td style="width:100%;">NOME APP</td>
				<td><a href="logout.jsp">Logout</a></td>
			</tr>
		</table>
				<%
					String username = (String) session.getAttribute("username");
					String azienda = (String) session.getAttribute("azienda");
					out.println("<p>Benvenuto "+username+"</p>");
				%>
		<table style="border-collapse: collapse; width: 100%; height: 154px;" border="1"><tbody>
			<tr style="height: 22px;">
				<td style="width: 20%; height: 22px;"><a href="profilo.jsp">PROFILO</a></td>
				<td style="width: 60%; height: 22px;" colspan="2">
					<form action="home.jsp" method="post">
						<input name="cerca" type="text" placeholder="Cerca" style="width: 90%;"/>
						<button type="submit"  style="width: 9%;">O</button>
					</form>
				</td>
				<%
					if(azienda!=null){
						out.println("<td style='width: 25%; height: 22px;'><a href='create.jsp'>CREA ANNUNCIO</a></td>");
					}
					else{
						out.println("<td style='width: 25%; height: 22px;'><a href='filtra.jsp'>FILTRA</a></td>");
					}
				%>
			</tr>
			<%
				
				String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
				Connection connection=null;
				
				String c=request.getParameter("cerca");
				
				try{
					Class.forName(DRIVER);
				}catch (ClassNotFoundException e) {
					out.println("Errore nel caricare il Driver Ucanaccess.");
				}
				try{
					connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Database.accdb");
				
					if(azienda!=null){
						String query = "SELECT * FROM Annunci WHERE nomeazienda='"+username+"';"; 
						Statement st = connection.createStatement();
						ResultSet result = st.executeQuery(query);
						
						while(result.next()){
							out.println("<tr>");
							out.println("<td><td style='width: 50%; height: 22px;'>Nome Azienda: "+result.getString(2)+"<br>Descrizione: <br>"+result.getString(3)+"</td>");
							out.println("<td><button onclick='location.href='modann.jsp'>MODIFICA</button><br>");
							out.println("<form action='/progetto1/deleteannuncio' method='post'><button type='submit'>ELIMINA</button></form></td></td>");
							out.println("</tr>");
							String id=result.getString(1);
							session.setAttribute("id", id);
						}
					}
					else{
						if(c==null){
							String query = "SELECT * FROM Annunci;"; 
							Statement st = connection.createStatement();
							ResultSet result = st.executeQuery(query);
						
							while(result.next()){
								out.println("<tr>");
								out.println("<td></td><td>Nome Azienda: "+result.getString(2)+"<br>Descrizione: <br>"+result.getString(3)+"</td></td><td>");
								out.println("</tr>");
							}
						}
						if(c!=null){
							String query = "SELECT * FROM Annunci WHERE nomeazienda LIKE '"+c+"%';"; 
							Statement st = connection.createStatement();
							ResultSet result = st.executeQuery(query);
					
							
							while(result.next()){
								out.println("<tr>");
								out.println("<td></td><td>Nome Azienda: "+result.getString(2)+"<br>Descrizione: <br>"+result.getString(3)+"</td></td><td>");
								out.println("</tr>");
							}
						}
					}
				}catch(Exception e){
					out.println(e);
				}
			
				finally{
					if(connection != null){
						try{
							connection.close();
						}catch(Exception e){out.println("La connessione non è stata chiusa correttamente...");}
					}
				}
			%>
			
		</tbody></table>
	</body>
</html>
