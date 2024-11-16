<%@page import="entidad.Usuario"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
	<%@ include file="Componentes/Head.jsp"%>
</head>

<body>
	<%@ include file="Componentes/NavbarAdmin.jsp"%>
	<div class="container mt-4">
		<div class="row">
			<div class="col-12">
				<h2 class="mb-4">Bienvenido/a, Admin</h2>
				<p class="text-muted">Aquí está el resumen de hoy</p>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h6 class="card-subtitle mb-2 text-muted">Fondos totales</h6>
						<h4 class="card-title">$25.620.000,00</h4>
						<p class="card-text text-success">
							<i class="fas fa-arrow-up"></i> 12% vs mes anterior
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h6 class="card-subtitle mb-2 text-muted">Deuda clientes</h6>
						<h4 class="card-title">$1.560.000,00</h4>
						<p class="card-text text-danger">
							<i class="fas fa-arrow-down"></i> 10% vs mes anterior
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h6 class="card-subtitle mb-2 text-muted">Total cuentas</h6>
						<h4 class="card-title">4240</h4>
						<p class="card-text text-success">
							<i class="fas fa-arrow-up"></i> 25% vs mes anterior
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h6 class="card-subtitle mb-2 text-muted">Préstamos activos</h6>
						<h4 class="card-title">130</h4>
						<p class="card-text text-danger">
							<i class="fas fa-arrow-down"></i> 3% vs mes anterior
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h5 class="card-title">Período 01/01/2021 - 01/01/2022</h5>
					<button class="btn btn-general">Aplicar filtro</button>
				</div>
				<canvas id="statsChart"></canvas>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
	<script>
		const ctx = document.getElementById('statsChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
						'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre',
						'Noviembre', 'Diciembre' ],
				datasets : [
						{
							label : 'Transferencias realizadas',
							data : [ 2500, 2000, 2000, 3000, 2000, 2000, 2000,
									2000, 2000, 4000, 3000, 3000 ],
							backgroundColor : '#8884d8'
						},
						{
							label : 'Préstamos otorgados',
							data : [ 3200, 1800, 1500, 1800, 2800, 3800, 3500,
									3500, 3200, 3200, 3500, 3800 ],
							backgroundColor : '#ffa726'
						} ]
			},
			options : {
				responsive : true,
				scales : {
					y : {
						beginAtZero : true,
						max : 5000,
						ticks : {
							stepSize : 1000
						}
					}
				},
				plugins : {
					legend : {
						position : 'bottom'
					}
				}
			}
		});
	</script>
</body>
</html>


