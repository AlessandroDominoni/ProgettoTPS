<html>
    <head>
        <title>
            Crea Annuncio - NOMEAPP
        </title>
    </head>
    <body>
	<p style="text-align: center;">CREA ANNUNCIO</p>
	<form action="/progetto1/creazioneannuncio" method="post" style="text-align: center;">
		<%
		String username = (String) session.getAttribute("username");
    	out.println("<input name='username' type='text' value='"+username+"' readonly/> <br/>");
		%>
        <input name="desc" type="text" placeholder="Descrizione"/> <br/>
        <button type="submit">crea</button>
    </form>
    <a href="home.jsp">Home</a>
</body>
</html>