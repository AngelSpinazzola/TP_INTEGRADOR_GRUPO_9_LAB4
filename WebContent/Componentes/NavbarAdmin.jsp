<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: "Poppins", sans-serif;
	}
	
	body {
		min-height: 100vh;
		background-color: #f4f4f4;
		font-family: "Roboto", sans-serif;
	}
	
	.navbar {
		background-color: #144A88;
		padding: 15px;
		display: flex;
		justify-content: flex-start; 
		align-items: center;
		color: white;
	}
	
	.navbar .menu-icon {
		font-size: 30px;
		cursor: pointer;
		margin-right: 250px; 
		margin-left: 15px; 
	}

	.navbar .brand-name {
		font-size: 24px;
		margin-left: 30px; 
	}
	
	.side-bar {
		background-color: #144A88; 
		width: 15%; 
		height: 100vh;
		position: fixed;
		top: 0;
		left: -100%; 
		transition: left 0.5s ease; 
		z-index: 100;
		overflow-y: auto;
	}
	
	.side-bar.open {
		left: 0;
	}
	
	.side-bar .menu {
		width: 100%;
		margin-top: 80px;
	}
	
	.side-bar .menu .item {
		position: relative;
		cursor: pointer;
	}
	
	.side-bar .menu .item a {
		color: #fff;
		font-size: 16px;
		text-decoration: none;
		display: block;
		padding: 15px 30px;
		line-height: 60px;
	}
	
	.side-bar .menu .item a:hover {
		background: #07886C;
		transition: 0.3s ease;
	}
	
	.side-bar .menu .item i {
		margin-right: 12px;
	}
	
	.side-bar .menu .item .sub-menu {
		background: rgba(255, 255, 255, 0.2);
		display: none;
	}
	
	.side-bar .menu .item .sub-menu a {
		padding-left: 50px;
	}
	
	.side-bar .menu .item a .dropdown {
		position: absolute;
		right: 0;
		margin: 20px;
		transition: 0.3 ease;
	}
	
	.rotate {
		transform: rotate(90deg);
	}
	
	.side-bar .close-btn {
		position: absolute;
		top: 20px;
		right: 20px;
		font-size: 25px;
		color: #fff;
		cursor: pointer;
	}
	
	.content {
		margin-left: 15%;
		padding: 20px;
	}
	.navbar .logout-btn {
   		margin-left: auto;  
    	margin-right: 10%; 
    	padding: 5px 35px;  
    	font-size: 20px;  
    	border-radius: 5px;  
    	height: auto; 
	}
	
</style>
<nav>
	<div class="navbar">
		<div class="menu-icon" onclick="toggleSidebar()">
			<i class="fas fa-bars"></i>
		</div>
		<div class="brand-name">Banco UTN</div>
		<%if (session.getAttribute("usuario") != null){ %>
			<a class="btn btn-success me-2 logout-btn" href="LogoutServlet">Salir</a>
		<%} %>
	</div>

	<div class="side-bar" id="sidebar">
		<div class="close-btn" onclick="closeSidebar()">
			<i class="fas fa-times"></i>
		</div>
		<div class="menu">
			<div class="item">
				<a href="AdminPanel.jsp"><i class="fas fa-home"></i>Inicio</a>
			</div>
			<div class="item">
				<a href="ServletGestionClientes?param=1"><i class="fa-solid fa-users"></i>Clientes</a>
			</div>
			<div class="item">
				<a class="sub-btn"><i class="fas fa-wallet"></i>Préstamos<i
					class="fas fa-angle-right dropdown"></i></a>
				<div class="sub-menu">
					<a href="AdminPrestamosRevision.jsp" class="sub-item"><i class="fas fa-hourglass-half"></i>Préstamos en revisión</a> 
					<a href="AdminPrestamosActivos.jsp"class="sub-item"><i class="fas fa-check-circle"></i>Préstamos activos</a> 
					<a href="AdminResumenPrestamos.jsp"class="sub-item"><i class="fas fa-list-alt"></i>Resumen de préstamos</a>
				</div>
			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
	$(document).ready(function() {
		$('.sub-btn').click(function() {
			$(this).next('.sub-menu').slideToggle();
			$(this).find('.dropdown').toggleClass('rotate');
		});
	});

	function toggleSidebar() {
		var sidebar = document.getElementById('sidebar');
		sidebar.classList.toggle('open');
	}

	function closeSidebar() {
		var sidebar = document.getElementById('sidebar');
		sidebar.classList.remove('open');
	}
</script>