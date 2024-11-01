CREATE DATABASE TPIntegradorLaboratorio4;

USE TPIntegradorLaboratorio4;

CREATE TABLE USUARIOS (
    IDUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(25) NOT NULL,
    Contraseña VARCHAR(25) NOT NULL,
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
    Email VARCHAR(25) NOT NULL,
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
    Estado BIT NOT NULL,
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
    CONSTRAINT chk_CBU CHECK (CBU REGEXP '^[0-9.,]+$'),
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