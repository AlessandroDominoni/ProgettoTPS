<html>
    <head>
        <title>
            Sign In - NOMEAPP
        </title>
    </head>
    <body>
	<p style="text-align: center;">CREATE AN ACCOUNT</p>
    <p style="text-align: center;">UTENTE</p>
	<form action="/progetto1/signinutente" method="post" style="text-align: center;">
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
		<button type="submit">signin</button>
    </form>
	<!--
	<p style="text-align: center;">AZIENDA</p>
    <form action="/progetto/signinazienda" method="post" style="text-align: center;">
		<input type="text" name="username" placeholder="Username"> <br>
        <input type="text" name="password" placeholder="Password"> <br>
		<button type="submit">signin</button>
    </form><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	-->
    <a href="index.jsp">Already have an account?</a>
</body>
</html>