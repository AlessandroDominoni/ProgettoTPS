<html>
    <head>
        <title>
            Sign In - NOMEAPP
        </title>
    </head>
    <body>
	<p style="text-align: center;">CREA UN ACCOUNT</p>
	
	
	<form method="get" action="signin.jsp">
		Seleziona il tipo di account:
		<input type="radio" name="tipo" value="" onchange='this.form.submit();'>Utente</input>
		<input type="radio" name="tipo" value="si" onchange='this.form.submit();'>Azienda</input>
	</form>
	<br>
	
	<form action="/progetto1/signinutente" method="post" style="text-align: center;">
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
		<input type="text" name="email" placeholder="Email"> <br>
        <input type="text" name="telefono" placeholder="Telefono"> <br>
		<input type="text" name="indirizzo" placeholder="Indirizzo"> <br>
        <input type="text" name="nome" placeholder="Nome"> <br>
		<%
		String tipo=request.getParameter("tipo");
		if(tipo!=""){
			out.println("<input type='text' name='settore' placeholder='Settore'> <br>");
			out.println("<input type='text' name='ndip' placeholder='Numero Dipendenti' > <br>");
		}
		if(tipo==""){
			out.println("<input type='text' name='cognome' placeholder='Cognome'> <br>");
			out.println("<input type='text' name='nascita' placeholder='Data di Nascita' > <br>");
			out.println("<input type='text' name='livstudio' placeholder='Livello di Studio'><br>");
			out.println("<input type='text' name='esperienze' placeholder='Esperienze Lavorative' > <br>");
		}
		%>
		<button type="submit">signin</button>
    </form>
    <a href="index.jsp">Hai già un account?</a>
</body>
</html>
