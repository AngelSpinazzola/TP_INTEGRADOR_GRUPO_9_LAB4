<%@ include file="Componentes/Head.jsp"%>
<body>
    <%@ include file="Componentes/Navbar.jsp"%>

    <!-- Contenedor del formulario de login -->
    <div class="form-wrapper" style="margin-top: 70px;">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h2 style="margin-top: 60px;">Ingresá a tu cuenta</h2>
            </div>
            <div class="container d-flex justify-content-center" style="margin-top: 30px;">
                <div class="form-container-custom mt-4">
                    <!-- Campo de Nombre de Usuario con ícono -->
                    <div class="mb-3">
                        <label for="txtNombreUsuario" class="form-label">Usuario</label>
                        <div class="input-icon-container">
                            <input type="text" class="form-control input-icon" placeholder="Nombre de usuario" id="txtNombreUsuario" required>
                            <label class="icon-label" for="txtNombreUsuario">
                                <img src="Images/Iconos/usuario.png" alt="User Icon">
                            </label>
                        </div>
                    </div>

                    <!-- Campo de Contraseña con ícono -->
                    <div class="mb-4">
                        <label for="txtPass" class="form-label">Contraseña</label>
                        <div class="input-icon-container">
                            <input type="password" class="form-control input-icon" placeholder="******" id="txtPass" required>
                            <label class="icon-label" for="txtPass">
                                <img src="Images/Iconos/cerrar.png" alt="Password Icon">
                            </label>
                        </div>
                    </div>
                    
                    <!-- Botón de Continuar -->
                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-customContinuar" style="margin-top: 30px;">Continuar</button>
                    </div>

                    <!-- Enlaces de Cancelar y Registro -->
                    <div class="d-flex justify-content-between">
                        <a href="Home.jsp">Cancelar</a>
                        <a href="Registro.jsp">No tengo cuenta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
