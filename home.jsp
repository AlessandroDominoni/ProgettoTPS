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
		<table style="border-collapse: collapse; width: 100%; max-width:100%; height: 154px;" border="1"><tbody>
			<tr style="height: 22px;">
				<td style="width: 15%; height: 22px;"><a href="profilo.jsp">PROFILO</a></td>
				<td style="width: 70%; height: 22px;" colspan="2">
				<%
					if(azienda!=null){
						out.println("<form action='home.jsp' method='post'>");
							out.println("<button type='submit'  style='width: 99%;'>Visualizza Candidature</button>");
						out.println("</form>");
					}
					else{
						out.println("<form action='home.jsp' method='post'>");
							out.println("<input name='cerca' type='text' placeholder='Nome Azienda o Professione' style='width: 90%;'/>");
							out.println("<button type='submit'  style='width: 9%;'>--></button>");
						out.println("</form>");
					}
					
				%>
				</td>
				<%
					if(azienda!=null){
						out.println("<td style='width: 15%; height: 22px;'><a href='create.jsp'>CREA ANNUNCIO</a></td>");
					}
					else{
						out.println("<td style='width: 15%; height: 22px;'><a href='filtra.jsp'>FILTRA</a></td>");
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
							out.println("<td></td>");
							session.setAttribute("id", result.getString(1)); 
							out.println("<td style=' max-width: 62%; ' >Nome Azienda: "+result.getString(2)+"<br>Paga: "+result.getString(3)+"<br>Orario: "+result.getString(4)+"<br>Professione: "+result.getString(5)+"<br>Descrizione: <br>aaaaaaaaaaaaa</td>");
							out.println("<td style='width: 8%; height: 22px;'><button><a href='modann.jsp'  style='text-decoration: none'>MODIFICA</a></button><br>");
							out.println("<form action='/progetto1/deleteannuncio' method='post'><button type='submit'>ELIMINA</button></form></td>");
							out.println("<td></td>");
							out.println("</tr>");
						}
					}
					else{
						String operazioni="<td style='width:8%;'><button>Contatta</button><button>Aggiungi ai preferiti</button></td>";
						String f=null;
						f = (String) session.getAttribute("f");
						if(f==null){
							if(c==null){
								String query = "SELECT * FROM Annunci;"; 
								Statement st = connection.createStatement();
								ResultSet result = st.executeQuery(query);
							
								while(result.next()){
									out.println("<tr>");
									out.println("<td></td>");
									out.println("<td style=' max-width: 62%;'>Nome Azienda: "+result.getString(2)+"<br>Paga: "+result.getString(3)+"<br>Orario: "+result.getString(4)+"<br>Professione: "+result.getString(5)+"<br>Descrizione: <br>aaaaaaaaaaaaa</td>");
									out.println(operazioni);
									out.println("</tr>");
								}
							}
							if(c!=null){
								String query = "SELECT * FROM Annunci WHERE nomeazienda LIKE '"+c+"%';"; 
								Statement st = connection.createStatement();
								ResultSet result = st.executeQuery(query);
						
								
								while(result.next()){
									out.println("<tr>");
									out.println("<td></td>");
									out.println("<td style=' max-width: 62%; '>Nome Azienda: "+result.getString(2)+"<br>Paga: "+result.getString(3)+"<br>Orario: "+result.getString(4)+"<br>Professione: "+result.getString(5)+"<br>Descrizione: <br>aaaaaaaaaaaaa</td>");
									out.println(operazioni);
									out.println("</tr>");
								}
							}
						}
						else{
							String n=request.getParameter("nome");
							String minstip=request.getParameter("minstip");
							String orario=request.getParameter("orario");
							String professione=request.getParameter("professione");
							
							String query = "SELECT * FROM Annunci WHERE (nomeazienda LIKE '"+n+"%') AND (contratto >= '"+minstip+"') AND (orario LIKE '"+orario+"%') AND (professione LIKE '"+professione+"%') ;"; 
							Statement st = connection.createStatement();
							ResultSet result = st.executeQuery(query);
							
							while(result.next()){
								out.println("<tr>");
								out.println("<td></td>");
								out.println("<td style=' max-width: 62%;'>Nome Azienda: "+result.getString(2)+"<br>Paga: "+result.getString(3)+"<br>Orario: "+result.getString(4)+"<br>Professione: "+result.getString(5)+"<br>Descrizione: <br>aaaaaaaaaaaaa</td>");
								out.println(operazioni);
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
						}catch(Exception e){
							out.println("La connessione non è stata chiusa correttamente...");
						}
					}
				}
			%>
			
		</tbody></table>
	</body>
</html>
