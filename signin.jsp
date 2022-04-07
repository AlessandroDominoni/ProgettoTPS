<html>
    <head>
        <title>
            Sign In - NOMEAPP
        </title>
    </head>
    <body>
	<p style="text-align: center;">CREA UN ACCOUNT</p>
	<form action="/progetto1/signinutente" method="post" style="text-align: center;">
		
		
		
		<label for="azienda">Seleziona il tipo di account:</label>

		<select name="azienda" id="azienda">
			<option value="si">Azienda</option>
			<option value="">Utente</option>
		</select><br>
		
		
		
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
		<input type="text" name="email" placeholder="Email"> <br>
        <input type="text" name="telefono" placeholder="Telefono"> <br>
		<input type="text" name="indirizzo" placeholder="Indirizzo"> <br>
        <input type="text" name="nome" placeholder="Nome"> <br>
		<%
		String tipo=request.getParameter("azienda");
		if(tipo!="si"){
			out.println("<input type='text' name='cognome' placeholder='Cognome'> <br>");
		}
		else{
			out.println("<input type='text' name='settore' placeholder='Settore'> <br>");
		}
		%>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<button type="submit">signin</button>
    </form>
    <a href="index.jsp">Hai già un account?</a>
</body>
</html>
