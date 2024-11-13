<%@page import="entidad.Usuario"%>
<nav class="navbar navbar-expand-lg navbar-dark text-white">
	<div class="container-fluid">
		<!-- Botón de menú hamburguesa -->
		<button class="navbar-toggler border-0" type="button"
			data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Logo -->
		<a class="navbar-brand text-white fw-bold titulo-navbar"
			href="Home.jsp">Banco UTN</a>

		<!-- Botones de la derecha -->
		<div class="ms-auto">
			<a class="navbar-btn btn-red" href="LogoutServlet">Salir</a>
		</div>
	</div>
</nav>

<!-- Menú lateral -->
<div class="collapse navbar-collapse sidebar" id="sidebarMenu">
    <div class="sidebar-content">
        <div class="sidebar-menu">
            <a href="Inicio.jsp" class="menu-item">
                <i class="fas fa-home"></i>
                <span>Inicio</span>
            </a>
            <a href="Clientes.jsp" class="menu-item">
                <i class="fas fa-users"></i>
                <span>Clientes</span>
            </a>
            <div class="menu-item submenu">
                <a href="#prestamosSubmenu" class="d-flex align-items-center" data-bs-toggle="collapse">
                    <i class="fas fa-chevron-right"></i>
                    <span>Préstamos</span>
                </a>
                <!-- Se ajusta el submenu para desplegarse hacia abajo -->
                <div class="collapse" id="prestamosSubmenu">
                    <a href="PrestamosAdmin.jsp" class="submenu-item">
                        <i class="fas fa-list"></i>
                        <span>Préstamos</span>
                    </a>
                    <a href="PrestamosRevision.jsp" class="submenu-item">
                        <i class="fas fa-clock"></i>
                        <span>Préstamos en revisión</span>
                    </a>
                    <a href="HistorialPrestamos.jsp" class="submenu-item">
                        <i class="fas fa-history"></i>
                        <span>Historial de préstamos</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Overlay para cerrar el menú en móviles -->
<div class="sidebar-overlay" data-bs-toggle="collapse"
	data-bs-target="#sidebarMenu"></div>

<style>
:root {
    --primary-color: #07886C;
    --secondary-color: #056A54;
    --navbar-bg-color: #104489;
    --navbar-btn-green: #2ECC71;
    --navbar-btn-red: #E74C3C;
}

.navbar {
    background-color: var(--navbar-bg-color);
    padding: 15px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    z-index: 1050;
}

.titulo-navbar {
    margin-left: 10px;
    font-size: 24px;
}

/* Botones del navbar */
.navbar-btn {
    padding: 8px 16px;
    border-radius: 4px;
    color: white;
    text-decoration: none;
    font-size: 14px;
    transition: opacity 0.3s;
}

.navbar-btn:hover {
    opacity: 0.9;
    color: white;
}

.btn-green {
    background-color: var(--navbar-btn-green);
}

.btn-red {
    background-color: var(--navbar-btn-red);
}

/* Sidebar */
.sidebar {
    position: fixed;
    top: 62px;
    left: 0;
    bottom: 0;
    width: 250px;
    background: white;
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    z-index: 1040;
    transform: translateX(-100%);
    transition: transform 0.3s ease-in-out;
}

.sidebar.show {
    transform: translateX(0);
}

.sidebar-content {
    height: 100%;
    overflow-y: auto;
}

/* Ajuste de espaciado entre opciones del menú */
.sidebar-menu a {
    margin-top: 15px; /* Añadir un espacio entre las opciones */
}

/* Estilos de los items del menú */
.menu-item {
    display: flex;
    align-items: center;
    padding: 20px 25px;
    color: #333;
    font-size: 18px;
    text-decoration: none;
    transition: background-color 0.2s, padding-left 0.2s;
}

.menu-item:hover {
    background-color: #f0f0f0;
    color: var(--primary-color);
    text-decoration: none;
    padding-left: 30px;
}

.menu-item i {
    width: 20px;
    margin-right: 15px;
}

/* Submenú que se despliega hacia abajo */
.collapse {
    display: none;
    transition: height 0.3s ease;
}

.collapse.show {
    display: block;
    height: auto;
}

/* Opcional: Añadir espacio entre los elementos del submenú */
.submenu-item {
    padding: 15px 25px;
    display: flex;
    align-items: center;
    color: #333;
    font-size: 16px;
    text-decoration: none;
    transition: background-color 0.2s;
}

.submenu-item:hover {
    background-color: #f0f0f0;
    color: var(--primary-color);
    text-decoration: none;
}

/* Overlay */
.sidebar-overlay {
    display: none;
    position: fixed;
    top: 62px;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0,0,0,0.5);
    z-index: 1030;
}

.sidebar.show + .sidebar-overlay {
    display: block;
}

/* Responsive */
@media (min-width: 992px) {
    .navbar-toggler {
        display: block !important;
    }
}

</style>


<script>
document.addEventListener('DOMContentLoaded', function() {
    // Cerrar menú al hacer clic en un enlace
    const menuItems = document.querySelectorAll('.menu-item:not(.submenu), .submenu-item');
    menuItems.forEach(item => {
        item.addEventListener('click', () => {
            const sidebar = document.getElementById('sidebarMenu');
            const bsCollapse = bootstrap.Collapse.getInstance(sidebar);
            if (bsCollapse) {
                bsCollapse.hide();
            }
        });
    });

    // Cambiar la dirección de la flecha al hacer clic en un submenú
    const submenuToggles = document.querySelectorAll('.submenu > a');
    submenuToggles.forEach(toggle => {
        toggle.addEventListener('click', function() {
            const icon = toggle.querySelector('i');
            const submenu = toggle.nextElementSibling; // Div con el submenú

            if (submenu.classList.contains('collapse')) {
                // Mostrar el submenú
                submenu.classList.remove('collapse');
                icon.classList.toggle('fa-chevron-right');
                icon.classList.toggle('fa-chevron-down');
                toggle.querySelector('i').classList.add('d-none');
                toggle.querySelector('.fas.fa-chevron-down').classList.remove('d-none');
            } else {
                // Ocultar el submenú
                submenu.classList.add('collapse');
                icon.classList.toggle('fa-chevron-right');
                icon.classList.toggle('fa-chevron-down');
                toggle.querySelector('i').classList.remove('d-none');
                toggle.querySelector('.fas.fa-chevron-down').classList.add('d-none');
            }
        });
    });
});


</script>
