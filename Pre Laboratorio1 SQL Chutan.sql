create database movies4; -- Crea una nueva base de datos llamada movies4
use movies4; -- Selecciona la base de datos movies4 para trabajar


create table direccion(-- Crear tabla direccion
	idDireccion int primary key, -- Identificador único de cada dirección
    Direccion varchar(45), -- Nombre de la calle o sector
    Ciudad varchar(45), -- Ciudad de la dirección
    Pais varchar(45) -- País de la dirección
);

-- Insertar datos en la tabla direccion
insert into direccion(idDireccion, Direccion, Ciudad, Pais)-- Insertar datos en la tabla direccion
values
(1,'Betania','Ciudad de Guatemala','Guatemala'), -- Dirección 1
(2,'Villa Nueva','Ciudad de Guatemala','Guatemala'), -- Dirección 2
(3,'Canalitos','Ciudad de Guatemala','Guatemala'), -- Dirección 3
(4,'Mixco','Ciudad de Guatemala','Guatemala'), -- Dirección 4
(5,'Amatitlan','Ciudad de Guatemala','Guatemala'); -- Dirección 5

select * from direccion; -- Ver todos los datos de la tabla direccion


create table cliente(-- Crear tabla cliente
	idCliente int primary key, -- Identificador único del cliente
    Nombre varchar(45), -- Nombre del cliente
    Apellido varchar(45), -- Apellido del cliente
    Edad int, -- Edad del cliente
    idCliente_fk int, -- Clave foránea que enlaza con direccion
    foreign key (idCliente_fk) references direccion(idDireccion) -- Define la relación con direccion
);


insert into cliente(idCliente, Nombre, Apellido, Edad, idCliente_fk)-- Insertar datos en la tabla cliente
values
(1,'Juliana','Del Valle',17,1), -- Cliente Juliana
(2,'Daniel','Hernández',32,2), -- Cliente Daniel
(3,'Welsin','Orellana',23,3), -- Cliente Welsin
(4,'Kevin','Catalan',19,4), -- Cliente Kevin
(5,'Marcos','Chutan',25,5); -- Cliente Marcos

select * from cliente; -- Ver todos los clientes
select * from cliente where Nombre = 'Juliana'; -- Buscar específicamente a Juliana


create table categoria(-- Crear tabla categoria
	idCategoria int primary key, -- Identificador único de categoría
    Nombre varchar(45) -- Nombre de la categoría
);


insert into categoria(idCategoria, Nombre)-- Insertar datos en la tabla categoria
values
(1,'Acción'), -- Categoría Acción
(2,'Romance'), -- Categoría Romance
(3,'Fantasía'), -- Categoría Fantasía
(4,'Comedia'), -- Categoría Comedia
(5,'Ciencia Ficción'); -- Categoría Ciencia Ficción

select * from categoria; -- Ver todas las categorías


create table peliculas(-- Crear tabla peliculas
	idPelicula int primary key, -- Identificador único de película
    Nombre varchar(45), -- Nombre de la película
    Duracion int, -- Duración en minutos
    Descripcion text, -- Descripción breve o género
    Año int, -- Año de estreno
    idCategoria_fk int, -- Clave foránea que enlaza con categoria
    foreign key (idCategoria_fk) references categoria(idCategoria) -- Relación con categoria
);


insert into peliculas(idPelicula, Nombre, Duracion, Descripcion, Año, idCategoria_fk)-- Insertar datos en la tabla peliculas
values
(1,'Avengers',131,'Acción',2013,1), -- Película Avengers
(2,'Escuadron Suicida',123,'Acción',2016,1), -- Película Escuadron Suicida
(3,'X-Men Apocalipse',132,'Acción',2018,1), -- Película X-Men Apocalipse
(4,'POKEMON1',96,'Ciencia Ficción',1998,5), -- Película POKEMON1
(5,'Milagro del cielo',120,'Fantasía',2010,3); -- Película Milagro del cielo

select * from peliculas order by Año desc; -- Ver todas las películas ordenadas por año descendente


create table inventario(-- Crear tabla inventario
	idCopia_Peli int primary key, -- Identificador único de copia de película
    Disponible tinyint, -- Cantidad disponible para renta
    idPelicula_fk int, -- Clave foránea que enlaza con peliculas
    foreign key (idPelicula_fk) references peliculas(idPelicula) -- Relación con peliculas
);

insert into inventario(idCopia_Peli, Disponible, idPelicula_fk)-- Insertar datos en la tabla inventario
values
(1,16,1), -- 16 copias de Avengers
(2,11,2), -- 11 copias de Escuadron Suicida
(3,19,3), -- 19 copias de X-Men Apocalipse
(4,15,4), -- 15 copias de POKEMON1
(5,14,5); -- 14 copias de Milagro del cielo

select * from inventario; -- Ver todo el inventario


create table renta(-- Crear tabla renta
	idRenta int primary key, -- Identificador único de renta
    Fecha_Renta varchar(45), -- Fecha de la renta
    Fecha_Entrega varchar(45), -- Fecha de entrega
    idInventario_fk int, -- Clave foránea que enlaza con inventario
    idCliente_fk int, -- Clave foránea que enlaza con cliente
    foreign key (idInventario_fk) references inventario(idCopia_Peli), -- Relación con inventario
    foreign key (idCliente_fk) references cliente(idCliente) -- Relación con cliente
);


insert into renta(idRenta, Fecha_Renta, Fecha_Entrega, idInventario_fk, idCliente_fk)-- Insertar datos en la tabla renta
values
(1,'2025-04-20','2025-04-27',4,1), -- Renta por Juliana
(2,'2025-04-25','2025-05-02',1,2), -- Renta por Daniel
(3,'2025-04-20','2025-04-25',2,3), -- Renta por Welsin
(4,'2025-04-24','2025-05-01',3,4), -- Renta por Kevin
(5,'2025-04-26','2025-05-03',5,5); -- Renta por Marcos

select * from renta; -- Ver todas las rentas


create table clasificacion(-- Crear tabla clasificacion
	idClasificacion int primary key, -- Identificador único de clasificación
	Clasificacion text, -- Tipo de clasificación (G, PG, etc.)
    idPelicula_fk int, -- Clave foránea que enlaza con peliculas
    foreign key (idPelicula_fk) references peliculas(idPelicula) -- Relación con peliculas
);


insert into clasificacion(idClasificacion, Clasificacion, idPelicula_fk)-- Insertar datos en la tabla clasificacion
values
(1,'G',1), -- Clasificación de Avengers
(2,'PG',2), -- Clasificación de Escuadron Suicida
(3,'PG-13',3), -- Clasificación de X-Men Apocalipse
(4,'R',4), -- Clasificación de POKEMON1
(5,'NC-17',5); -- Clasificación de Milagro del cielo

select * from clasificacion; -- Ver todas las clasificaciones


create table pendientes(-- Crear tabla pendientes
	idPendientes int primary key, -- Identificador único de pendientes
    Nombre varchar(45), -- Nombre del cliente
    Apellido varchar(45), -- Apellido del cliente
    Pelicula varchar(45), -- Película rentada
    Fecha_Renta varchar(45), -- Fecha de la renta
    idRenta_fk int, -- Clave foránea que enlaza con renta
    foreign key (idRenta_fk) references renta(idRenta) -- Relación con renta
);


insert into pendientes(idPendientes, Nombre, Apellido, Pelicula, Fecha_Renta, idRenta_fk)-- Insertar datos en la tabla pendientes
values
(1,'Juliana','Del Valle','POKEMON1','2025-04-20',1), -- Pendiente de Juliana por POKEMON1
(2,'Antonio','Cuevas','Mi Villano Favorito','2025-01-18',2), -- Otro pendiente
(3,'Luis','Villatoro','Rápidos y Furiosos','2025-03-20',3), -- Otro pendiente
(4,'Hugo','Pérez','La gran aventura Lego','2025-03-07',4), -- Otro pendiente
(5,'Alex','Martínez','Los Vengadores','2025-04-04',5); -- Otro pendiente

select * from pendientes; -- Ver todos los pendientes