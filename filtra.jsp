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
		<table style="border-collapse: collapse; width: 100%; height: 154px;" border="1"><tbody>
			<tr style="height: 22px;">
				<td style="width: 100%; height: 22px;" colspan="3">NOME APP</td>
			</tr>
			<tr style="height: 22px;">
				<td style="width: 100%; height: 22px;" colspan="3">Filtra</td>
			</tr>
			<tr style="height: 22px;">
				<td style="width: 25%; height: 22px;"><a href="profilo.jsp">PROFILO</a></td>
				<td style="width: 50%; height: 22px;">
					<form action="filtra.jsp" method="post">
						<input name="nome" type="text" placeholder="Nome Azienda" style="width: 46.3%;"/>
						<input name="desc" type="text" placeholder="Descrizione" style="width: 46.3%;"/>
						<button type="submit">O</button>
					</form>
				</td>
				<td style="width: 25%; height: 22px;"><a href="home.jsp">HOME</a></td>
			</tr>
			<%
				String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
				Connection connection=null;
				
				String nome=request.getParameter("nome");
				String desc=request.getParameter("desc");
				
				try{
					Class.forName(DRIVER);
				}catch (ClassNotFoundException e) {
					out.println("Errore nel caricare il Driver Ucanaccess.");
				}
				try{
					connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Database.accdb");
					
					if(nome!=null || desc!=null){
						String query = "SELECT * FROM Annunci WHERE (Nome LIKE '"+nome+"%') OR (Descrizione LIKE '%"+desc+"%');"; 
						Statement st = connection.createStatement();
						ResultSet result = st.executeQuery(query);
					
						
						while(result.next()){
							out.println("<tr>");
							out.println("<td></td><td>Nome Azienda: "+result.getString(2)+"<br>Descrizione: <br>"+result.getString(3)+"</td></td><td>");
							out.println("</tr>");
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
