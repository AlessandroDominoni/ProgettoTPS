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
		
		<form action="/progetto1/deleteutente" method="post" style="text-align: center;" id="elimina">
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
		<button type="submit">Elimina</button>
		</form>
	</body>
</html>	