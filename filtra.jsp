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
		Filtra Annunci
		<form action="home.jsp" method="post" style="text-align: center;" id="filtra">
			Nome Azienda: <input type="text" name="nome" placeholder="Nome Azienda"> <br>
			Minimo Stipendio: <input type="range" min="500" max="5000" value="1500" class="slider" name="minstip" id="minstip" step="250" onchange="outmin.value=value+'€'">
			<output id="outmin" for="minstip">1500€</output><br>
			Orario: <input type="text" name="orario" placeholder="00:00-00:00"> <br>
			Professione: <input type="text" name="professione" placeholder="Professione"> <br>
			<%
				session.setAttribute("f", "si");
			%>
			<button type="submit" onclick=>filtra</button>
		</form>
	</body>
</html>
