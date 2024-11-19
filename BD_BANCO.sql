DROP DATABASE TPIntegradorLaboratorio4;

CREATE DATABASE TPIntegradorLaboratorio4;

USE TPIntegradorLaboratorio4;

CREATE TABLE USUARIOS (
    IDUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(25) NOT NULL,
    Contrasenia VARCHAR(25) NOT NULL,
    TipoUsuario INT NOT NULL,
    Estado BIT NOT NULL
);


CREATE TABLE PROVINCIAS (
    IDProvincia INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL
);


CREATE TABLE LOCALIDADES (
    IDLocalidad INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    IDProvincia INT,
    FOREIGN KEY (IDProvincia) REFERENCES PROVINCIAS(IDProvincia)
);


CREATE TABLE DIRECCIONES (
    IDDireccion INT PRIMARY KEY AUTO_INCREMENT,
    IDLocalidad INT,
    CodigoPostal VARCHAR(15) NOT NULL,
    Calle VARCHAR(30) NOT NULL,
    Numero INT NOT NULL,
    FOREIGN KEY (IDLocalidad) REFERENCES LOCALIDADES (IDLocalidad)
);


CREATE TABLE CLIENTES (
    DNI INT PRIMARY KEY,
    CUIL VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Sexo VARCHAR(20) NOT NULL,
    Nacionalidad VARCHAR(25) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    IDDireccion INT,
    Email VARCHAR(45) NOT NULL,
    IDUsuario INT,
    ESTADO BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (IDUsuario) REFERENCES USUARIOS(IDUsuario)
);

CREATE TABLE TELEFONOS (
    IDTelefono INT PRIMARY KEY AUTO_INCREMENT,
    DNICliente INT,
    NumeroTelefonico VARCHAR(15) NOT NULL,
    FOREIGN KEY (DNICliente) REFERENCES CLIENTES(DNI)
);

CREATE TABLE TIPO_PRESTAMOS (
    IDTipoPrestamo INT PRIMARY KEY AUTO_INCREMENT,
	Tipo VARCHAR(50) NOT NULL,
    TNA int not null,
	CONSTRAINT chk_Tipo CHECK (Tipo NOT REGEXP '[^a-zA-Z]')
);

CREATE TABLE PRESTAMOS (
    IDPrestamo INT PRIMARY KEY AUTO_INCREMENT,
    IDTipoPrestamo int not null,
    DNICliente INT,
    MontoPedido DECIMAL(10,2) NOT NULL,
    ImporteAPagar DECIMAL(10,2) NOT NULL,
    Cuotas INT NOT NULL,
    Fecha DATE NOT NULL,
    Estado TINYINT NOT NULL,
    CONSTRAINT fk_Prestamos_Clientes FOREIGN KEY (DNICliente) REFERENCES CLIENTES(DNI),
	CONSTRAINT fk_PrestamoId FOREIGN KEY (IDTipoPrestamo) REFERENCES TIPO_PRESTAMOS(IDTipoPrestamo),
    CONSTRAINT chk_Monto CHECK (MontoPedido REGEXP '^[0-9]+(\\.[0-9]{1,2})?$'),
    CONSTRAINT chk_ImporteAPagar CHECK (ImporteAPagar REGEXP '^[0-9]+(\\.[0-9]{1,2})?$')
);

CREATE TABLE PLAZOS (
    IDPlazo INT PRIMARY KEY AUTO_INCREMENT,
    IDPrestamo INT,
    MesQuePaga VARCHAR(20) NOT NULL,
    NroCuota INT NOT NULL,
    ImporteAPagarCuotas DECIMAL(10,2) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT fk_Plazos_Prestamos FOREIGN KEY (IDPrestamo) REFERENCES PRESTAMOS(IDPrestamo),
    CONSTRAINT chk_Mes CHECK (MesQuePaga NOT REGEXP '[^a-zA-Z]'),
    CONSTRAINT chk_NroCuota CHECK (NroCuota REGEXP '^[0-9]+$')
);


CREATE TABLE TIPO_CUENTAS (
    IDTipoCuenta INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(50) NOT NULL
);

INSERT INTO TIPO_CUENTAS (Tipo) VALUES ('Caja de Ahorro');
INSERT INTO TIPO_CUENTAS (Tipo) VALUES ('Cuenta corriente');


CREATE TABLE CUENTAS (
    IDCuenta INT PRIMARY KEY AUTO_INCREMENT,
    DNICliente INT,
    FechaCreacion DATE NOT NULL,
    NumeroCuenta INT NOT NULL,
    CBU VARCHAR(50) NOT NULL,
    Saldo DECIMAL(18,2) NOT NULL,
    IDTipoCuenta INT NOT NULL,
    ESTADO BOOLEAN NOT NULL DEFAULT TRUE,
    
    CONSTRAINT fk_Cuentas_Tipo_Cuentas FOREIGN KEY (IDTipoCuenta) REFERENCES TIPO_CUENTAS(IDTipoCuenta),
    CONSTRAINT fk_Cuentas_Clientes FOREIGN KEY (DNICliente) REFERENCES CLIENTES(DNI),
    CONSTRAINT chk_CBU CHECK (CBU REGEXP '^[0-9]+$'),
    CONSTRAINT chk_Saldo CHECK (Saldo REGEXP '^[0-9]+(\\.[0-9]{1,6})?$')
);


CREATE TABLE TIPO_MOVIMIENTOS (
    IDTipoMovimiento INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

INSERT INTO TIPO_MOVIMIENTOS (Nombre) VALUES ('Alta de cuenta');
INSERT INTO TIPO_MOVIMIENTOS (Nombre) VALUES ('Alta de un préstamo');
INSERT INTO TIPO_MOVIMIENTOS (Nombre) VALUES ('Pago de préstamo');
INSERT INTO TIPO_MOVIMIENTOS (Nombre) VALUES ('Transferencia');


CREATE TABLE MOVIMIENTOS (
    IDMovimiento INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Detalle VARCHAR(100) NOT NULL,
    Importe DECIMAL(18,2) NOT NULL,
    IDCuentaEmisor INT,
    IDCuentaReceptor INT,
    IDTipoMovimiento INT NOT NULL,
    CONSTRAINT fk_Movimientos_Tipo_Movimientos FOREIGN KEY (IDTipoMovimiento) REFERENCES TIPO_MOVIMIENTOS(IDTipoMovimiento),
    CONSTRAINT chk_Importe CHECK (Importe REGEXP '^[0-9]+(\\.[0-9]{1,2})?$')
);

-- Trigger que genera cbu + numero de cuenta y registra la fecha actual del sistema al insertar una cuenta
-- Elimina el trigger si existe
DROP TRIGGER IF EXISTS before_insert_cuenta;

--

DELIMITER //

CREATE TRIGGER before_insert_cuenta
BEFORE INSERT ON CUENTAS
FOR EACH ROW
BEGIN

    DECLARE CBU_GENERADO VARCHAR(50);  
    DECLARE CBU_EXISTE INT;

    IF NEW.NumeroCuenta IS NULL THEN
        SET NEW.NumeroCuenta = (SELECT IFNULL(MAX(NumeroCuenta), 10000) + 1 FROM CUENTAS);
    END IF;

    IF NEW.CBU IS NULL THEN
        REPEAT
            SET CBU_GENERADO = CONCAT('4540900', LPAD(FLOOR(RAND() * 10000000), 7, '0'));  

            SET CBU_EXISTE = (SELECT COUNT(*) FROM CUENTAS WHERE CBU = CBU_GENERADO);
        UNTIL CBU_EXISTE = 0 END REPEAT;

        SET NEW.CBU = CBU_GENERADO;
    END IF;

    SET NEW.FechaCreacion = NOW();
END;
//

DELIMITER ;

-- Fin sección de triggers


-- Inserts para la tabla PROVINCIAS
INSERT INTO PROVINCIAS (Nombre) VALUES ('Buenos Aires');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Catamarca');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Chaco');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Chubut');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Córdoba');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Corrientes');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Entre Ríos');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Formosa');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Jujuy');
INSERT INTO PROVINCIAS (Nombre) VALUES ('La Pampa');
INSERT INTO PROVINCIAS (Nombre) VALUES ('La Rioja');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Mendoza');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Misiones');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Neuquén');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Río Negro');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Salta');
INSERT INTO PROVINCIAS (Nombre) VALUES ('San Juan');
INSERT INTO PROVINCIAS (Nombre) VALUES ('San Luis');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Santa Cruz');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Santa Fe');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Santiago del Estero');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Tierra del Fuego');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Tucumán');
INSERT INTO PROVINCIAS (Nombre) VALUES ('Ciudad Autónoma de Buenos Aires');

-- Inserts para la tabla LOCALIDADES (asumiendo IDProvincia = 1 para todas las localidades de Buenos Aires)
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('La Plata', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Mar del Plata', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Bahía Blanca', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Tandil', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Nicolás de los Arroyos', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Junín', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Pergamino', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Chivilcoy', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Zárate', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Pedro', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Luján', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Antonio de Areco', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Necochea', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Azul', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Olavarría', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('La Matanza', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Tres de Febrero', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Morón', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Isidro', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Tigre', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Vicente López', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Berazategui', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Quilmes', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Avellaneda', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Fernando', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Escobar', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Merlo', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Moreno', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Lomas de Zamora', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Adrogué', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('San Miguel', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Ituzaingó', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Berisso', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Ensenada', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Campana', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Villa Gesell', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Pinamar', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Mar de Ajó', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Miramar', 1);
INSERT INTO LOCALIDADES (Nombre, IDProvincia) VALUES ('Cariló', 1);

-- Inserts para la tabla USUARIOS
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('admin', '123', 1, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario1', 'password1', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario2', 'password2', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario3', 'password3', 2, 0);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario4', 'password4', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario5', 'password5', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario6', 'password6', 2, 0);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario7', 'password7', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario8', 'password8', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario9', 'password9', 2, 0);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario10', 'password10', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario11', 'password11', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario12', 'password12', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario13', 'password13', 2, 1);
INSERT INTO USUARIOS (Usuario, Contrasenia, TipoUsuario, Estado) VALUES ('usuario14', 'password14', 2, 1);

-- Inserts para la tabla DIRECCIONES
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1001', 'Avenida del Libertador', 100);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (2, '1407', 'Calle Defensa', 250);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (3, '1425', 'Calle Anchorena', 500);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1043', 'Avenida Callao', 300);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1428', 'Calle Azcuénaga', 750);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1073', 'Avenida Las Heras', 450);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1056', 'Calle Suipacha', 850);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1089', 'Avenida 9 de Julio', 101);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1168', 'Calle Armenia', 700);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1181', 'Avenida San Juan', 320);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1230', 'Calle Cabrera', 680);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1333', 'Avenida Corrientes', 1200);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1400', 'Calle Armenia', 90);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1450', 'Avenida Santa Fe', 320);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1520', 'Calle Parera', 550);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1600', 'Avenida Córdoba', 250);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1702', 'Calle Juncal', 620);
INSERT INTO DIRECCIONES (IDLocalidad, CodigoPostal, Calle, Numero) VALUES (1, '1804', 'Avenida Alvear', 300);

-- Inserts para la tabla CLIENTES
INSERT INTO CLIENTES (DNI, CUIL, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, IDDireccion, Email, IDUsuario, ESTADO) 
VALUES 
(33333333, '20-33333333-3', 'Joaquín', 'Ramírez', 'Masculino', 'Argentino', '1993-01-15', 1, 'joaquin.ramirez@gmail.com', 1, true),
(55555555, '27-55555555-5', 'María', 'González', 'Femenino', 'Argentina', '1987-08-23', 2, 'maria.gonzalez@gmail.com', 2, true), 
(66666666, '20-66666666-6', 'Diego', 'Vega', 'Masculino', 'Argentino', '1992-10-30', 3, 'diego.vega@gmail.com', 3, true),
(77777777, '27-77777777-7', 'Natalia', 'Ortiz', 'Femenino', 'Argentina', '1995-07-04', 4, 'natalia.ortiz@gmail.com', 4, true),
(88888888, '20-88888888-8', 'Fernando', 'Luna', 'Masculino', 'Argentino', '1990-11-02', 5, 'fernando.luna@gmail.com', 5, true),
(99999999, '27-99999999-9', 'Valeria', 'Mendoza', 'Femenino', 'Argentina', '1989-03-12', 6, 'valeria.mendoza@gmail.com', 6, true),
(12345678, '20-12345678-1', 'Martín', 'Suárez', 'Masculino', 'Argentino', '1996-04-20', 7, 'martin.suarez@gmail.com', 7, true),
(23456789, '27-23456789-2', 'Lucía', 'Pérez', 'Femenino', 'Argentina', '1994-12-15', 8, 'lucia.perez@gmail.com', 8, true),
(34567890, '20-34567890-3', 'Andrés', 'García', 'Masculino', 'Argentino', '1991-05-25', 9, 'andres.garcia@gmail.com', 9, true),
(45678901, '27-45678901-4', 'Sofía', 'López', 'Femenino', 'Argentina', '1988-09-10', 10, 'sofia.lopez@gmail.com', 10, true),
(56789012, '20-56789012-5', 'Federico', 'Domínguez', 'Masculino', 'Argentino', '1997-06-18', 11, 'federico.dominguez@gmail.com', 11, true),
(67890123, '27-67890123-6', 'Camila', 'Martínez', 'Femenino', 'Argentina', '1993-03-08', 12, 'camila.martinez@gmail.com', 12, true),
(35632781, '27-35632781-4', 'Jose', 'Gonzales', 'Masculino', 'Argentina', '1989-10-15', 13, 'jose.gonzales@hotmail.com', 13, true),
(86784302, '20-86784302-5', 'Federico', 'Aguilar', 'Masculino', 'Argentino', '2001-06-18', 14, 'federico.aguilar@gmail.com', 14, true),
(57843223, '27-57843223-6', 'Tomas', 'Perez', 'Masculino', 'Argentina', '1999-05-15', 15, 'tomas_perez@gmail.com', 15, true);

-- Inserts para la tabla cuentas
INSERT INTO CUENTAS(DNICliente, Saldo, IDTipoCuenta, ESTADO) VALUES
(55555555, 10000, 1, 1),
(55555555, 150000, 1, 1),
(55555555, 25000, 2, 1),
(66666666, 10000, 1, 1),
(66666666, 20000, 2, 1),
(12345678, 30000, 1, 1),
(12345678, 35000, 2, 1),
(57843223, 50000, 1, 1),
(57843223, 15000, 1, 1),
(35632781, 10000, 1, 1),
(35632781, 10000, 1, 1),
(67890123, 15000, 2, 1),
(67890123, 19000, 2, 1),
(67890123, 15000, 2, 1),
(77777777, 19000, 1, 1);

-- Inserts para la tabla TELEFONOS vinculados con la tabla CLIENTES
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (33333333, '1122334455');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (55555555, '1122446688');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (66666666, '1122445648');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (77777777, '1177991122');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (88888888, '1188002233');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (99999999, '1199113344');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (23456789, '1100224455');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (57843223, '1111335566');
INSERT INTO TELEFONOS (DNICliente, NumeroTelefonico) VALUES (34567890, '1133557788');

-- Inserts para los TIPO de préstamos 
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Personal', 25); -- TNA 25%
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Hipotecario', 5); -- TNA 10%
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Automotriz', 10); -- TNA 15%
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Vacaciones', 15); -- TNA 20%
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Comercial', 20); -- TNA 5%
INSERT INTO TIPO_PRESTAMOS (Tipo, TNA) VALUES ('Agrícola', 18); -- TNA 10%

-- Inserts para la tabla préstamos
INSERT INTO PRESTAMOS (IDPrestamo, IDTipoPrestamo, DNICliente, MontoPedido, ImporteAPagar, Cuotas, Fecha, Estado) VALUES 
(1, 2, 55555555, 20000.00, 22000.00, 12, '2023-06-06', 0),   
(2, 3, 55555555, 15000.00, 17250.00, 24, '2022-02-05', 0),   
(3, 2, 55555555, 20000.00, 22000.00, 18, '2022-03-01', 0),   
(4, 2, 77777777, 25000.00, 27500.00, 36, '2022-04-04', 0),   
(5, 2, 77777777, 30000.00, 33000.00, 12, '2023-02-03', 0),   
(6, 1, 77777777, 35000.00, 43750.00, 24, '2023-02-01', 0),  
(7, 1, 88888888, 40000.00, 50000.00, 18, '2022-05-07', 0),  
(8, 4, 88888888, 45000.00, 54000.00, 36, '2023-08-01', 0),  
(9, 5, 99999999, 50000.00, 52500.00, 12, '2023-09-08', 0),  
(10, 1, 99999999, 55000.00, 68750.00, 24, '2023-10-01', 0), 
(11, 1, 23456789, 35000.00, 43750.00, 24, '2023-02-01', 0),  
(12, 1, 23456789, 40000.00, 50000.00, 18, '2022-05-07', 0),   
(13, 4, 67890123, 45000.00, 54000.00, 36, '2023-08-01', 0),   
(14, 5, 67890123, 50000.00, 52500.00, 12, '2023-09-08', 0),   
(15, 1, 45678901, 55000.00, 68750.00, 24, '2023-10-01', 0),
(16, 3, 55555555, 45000.00, 56250.00, 24, '2022-02-05', 0),   
(17, 2, 55555555, 30000.00, 58000.00, 18, '2022-03-01', 0);  

