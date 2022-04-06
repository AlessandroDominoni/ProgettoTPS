<html>
	<head>
		<title>Profilo - NOMEAPP</title>
	</head>
	<body>
		<p style="text-align: center;">PROFILO</p>
		<form action="/progetto1/modificautente" method="post" style="text-align: center;" id="modifica">
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
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
