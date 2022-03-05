<%@page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

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
				<td style="width: 33.3333%; height: 22px;"><a href="profilo.html">PROFILO</a></td>
				<td style="width: 33.3333%; height: 22px;">CERCA</td>
				<td style="width: 33.3333%; height: 22px;">FILTRA</td>
			</tr>
			<%
				int[] arrayAnnunci = new int[5];
				Random r = new Random(); 
				for(int i=0; i<5; i++){
					int annuncio = r.nextInt (5);
					arrayAnnunci [i] = annuncio;
				}
				String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
				Connection connection=null;
	
				try{
					Class.forName(DRIVER);
				}catch (ClassNotFoundException e) {
					out.println("Errore nel caricare il Driver Ucanaccess.");
				}
				try{
					connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Database.accdb");
					String query = "SELECT * FROM Annunci;"; 
				
					Statement st = connection.createStatement();
					ResultSet result = st.executeQuery(query);
			
					while(result.next()){
						out.println("<tr>");
						out.println("<td></td><td>Nome Azienda: "+result.getString(2)+"<br>Descrizione: <br>"+result.getString(3)+"</td></td><td>");
						out.println("</tr>");
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