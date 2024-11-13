<%@page import="entidad.Usuario"%>
<style>

.navbar .navbar-nav {
    justify-content: right;
    margin-right: 20px;
    flex-grow: 1;
}

</style>

<nav class="navbar navbar-expand-lg navbar-dark text-white">
<div class="container-fluid">
		<a class="navbar-brand text-white fw-bold titulo-navbar"
			href="Home.jsp">Banco UTN</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>			
			<div class="navbar-nav">
			<label class="label-usuario" for="usuario">NombreUsuario</label>
			</div>			
			<div class="ms-auto">
				<a class="navbar-btn navbar-btn-right" href="Home.jsp">Salir</a>
			</div>
		</div>
</nav>




