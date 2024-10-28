# 🏦 TP Integrador - LAB4 2C 2024

## Universidad Tecnológica Nacional - Facultad Regional General Pacheco
### Tecnicatura Universitaria en Programación  
#### Laboratorio IV - Trabajo Práctico Integrador

## 📋 Descripción del Proyecto
Este proyecto consiste en un sistema de gestión para un banco, desarrollado en **Java** y enfocado en:
- **JDBC**
- **JSP**
- **Servlets**
- **Sessions**

El sistema maneja dos tipos de usuarios:
- **Administrador del banco**: gestiona clientes, cuentas y préstamos.
- **Clientes**: pueden realizar operaciones como transferencias, solicitudes de préstamos y pagos de cuotas.

## ⚙️ Funcionalidades principales

### 👤 Administrador
1. **ABML de Clientes**: 
   - Gestión de clientes con asignación de usuario y contraseña.
2. **ABML de Cuentas**: 
   - Asignación de hasta tres cuentas por cliente, con un monto inicial de $10,000.
3. **Autorización de Préstamos**: 
   - Aprobación o rechazo de solicitudes de préstamos, con generación automática de cuotas.
4. **Reportes y Estadísticas**: 
   - Visualización de informes para el administrador.

### 👥 Cliente
1. **Visualización de Movimientos**: 
   - Historial de movimientos por cuenta.
2. **Transferencias**: 
   - Entre cuentas propias o a terceros mediante CBU, sujeto a saldo disponible.
3. **Solicitud de Préstamos**: 
   - Solicitud de préstamos con elección de cuotas y cuenta de depósito.
4. **Pago de Cuotas**: 
   - Visualización y pago de cuotas pendientes.
5. **Información Personal**: 
   - Acceso a datos personales sin posibilidad de edición.

## 🔐 Autenticación y Acceso
- **Login**: El sistema incluye un mecanismo de login que permite a los usuarios autenticarse con su nombre de usuario y contraseña.
- **Roles de Usuario**: Una vez autenticados, se determina si el usuario es un **Administrador** o un **Cliente** para proporcionar el acceso adecuado a cada funcionalidad.
- **Sesiones**: El sistema gestiona las sesiones activas para asegurar que solo los usuarios logueados puedan acceder a las funcionalidades del banco.

## 🛠️ Requisitos Técnicos
- **Lenguajes y Tecnologías**: Java, JSP, Servlets, JDBC, Manejo de Sesiones.
- **Base de Datos**: MySQL.
- **Servidor**: Apache Tomcat.
- **Arquitectura**: Programación en tres capas (Presentación, Negocio y Acceso a Datos).
- **Controlador Centralizado**: Implementado con Servlets para la validación y el control de acceso.
- **Manejo de Errores**: Excepciones personalizadas y validaciones de formularios para evitar datos incompletos.

---
