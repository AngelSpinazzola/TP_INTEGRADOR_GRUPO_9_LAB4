<%@page import="entidad.Usuario"%>
<nav class="navbar navbar-expand-lg bg-white"> 
    <div class="container-fluid">
        <a class="navbar-brand text-dark" href="Home.jsp">Prestify</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="navbar-nav ms-auto">
            	<% if (session.getAttribute("sessionLogin") == null) { %>
                <!-- Si no hay usuario en sesión (no logueado) -->
                <a class="btn navbar-btn btn-client-banca me-3" href="#">Quiero ser Cliente</a> 
                <a class="btn navbar-btn btn-client-banca me-3" href="Login.jsp"> Banca Online</a>
            	<% }  %>
            </div>
        </div>
    </div>
</nav>