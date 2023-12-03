-- Tabla de las citas
CREATE TABLE consultorio.cita (
	num_sesion int not null,
	fecha date not null, 
	motivo varchar(100) not null,
	id_cita serial primary key,
	paciente int not null,
	constraint cita_paciente_fk foreign key (paciente)
	references consultorio.paciente (id_paciente)
);

-- Table de paciente
CREATE TABLE consultorio.paciente (
	nombres varchar (100) not null,
	edad int not null CHECK (edad > 0),
	foto varchar(100) not null,
	telefono int not null,
	religion varchar(10) not null,
	tratamiento varchar (100) not null,
	id_paciente serial primary key
);

-- Tabla del pariente del paciente, información de la re
CREATE TABLE consultorio.paciente_pariente (
	id_paciente int,
	constraint paciente_fk foreign key (id_paciente)
	references consultorio.paciente (id_paciente),
	id_pariente int,
	constraint pariente_fk foreign key (id_pariente)
	references consultorio.pariente (id_pariente),
	primary key (id_paciente, id_pariente)
);

-- Tabla de parientes
CREATE TABLE consultorio.pariente (
	nombre varchar (100) not null,
	telefono int not null,
	id_pariente serial primary key
);

-- Tabla del personal
CREATE TABLE if not exists consultorio.personal(
	id_personal serial primary key,
	nombre varchar(100) not null,
	edad int not null CHECK (edad > 24),
	especializacion varchar(100) not null,
	fecha date not null default current_date,
  	hora time not null default current_time,
  	paciente int not null,
  	constraint personal_paciente_FK foreign key(paciente) references consultorio.paciente(id_paciente)
);


-- Tabla medicamentos
CREATE TABLE consultorio.medicamentos (
	id_medicamento serial primary key,
 	nombre_medicamento varchar(100) not null,
	cantidad int not null,
	precio int not null,
	tratamiento varchar(100) not null
);
-- Registros de paciente_pariente
INSERT INTO consultorio.paciente_pariente (id_paciente,id_pariente )
VALUES (15,3);

INSERT INTO consultorio.paciente_pariente (id_paciente,id_pariente )
VALUES (16,4);

INSERT INTO consultorio.paciente_pariente (id_paciente,id_pariente )
VALUES (17,5);

INSERT INTO consultorio.paciente_pariente (id_paciente,id_pariente )
VALUES (18,7);

INSERT INTO consultorio.paciente_pariente (id_paciente,id_pariente )
VALUES (19,6);

-- Agregar registros a la tabla de pacientes
INSERT INTO consultorio.paciente (nombre, edad, foto, telefono, religion, tratamiento)
VALUES ('Juan Ricardo Martínez Pérez', 35, 'juan_martinez.jpg', 123456789, 'Católico', 'Consulta inicial');

INSERT INTO consultorio.paciente (nombre, edad, foto, telefono, religion, tratamiento)
VALUES ('Asahel Said Main Cerezo', 30, 'asahel_main.jpg', 551243646, 'Judio', 'Tratar infección');

INSERT INTO consultorio.paciente (nombre, edad, foto, telefono, religion, tratamiento)
VALUES ('Mario Manzano Mercado', 46, 'mario_manzano.jpg', 553489946, 'Católico', 'Terapia hormonal');

INSERT INTO consultorio.paciente (nombre, edad, foto, telefono, religion, tratamiento)
VALUES ('Martín Arsenio Raudry Loera', 29, 'martin_raudry.jpg', 554879639, 'ninguna', 'Tratar Cáncer');

INSERT INTO consultorio.paciente (nombre, edad, foto, telefono, religion, tratamiento)
VALUES ('Arturo Peñaloza Gonzalez', 29, 'arturo_penaloza.jpg', 554879639, 'ninguna', 'Tratar infección');

-- Agregar registros a la tabla de parientes
INSERT INTO consultorio.pariente (nombre, telefono)
VALUES ('María Pérez Gonzáles', 987654321);

INSERT INTO consultorio.pariente (nombre, telefono)
VALUES ('Esteban Andrés Main Cerezo', 55478321);

INSERT INTO consultorio.pariente (nombre, telefono)
VALUES ('Belem Cruz Olvera', 554764562);

INSERT INTO consultorio.pariente (nombre, telefono)
VALUES ('Elizabeth Peñaloza Gonzáles', 554879163);

INSERT INTO consultorio.pariente (nombre, telefono)
VALUES ('Eduardo Javier Loera Smith', 554789624);


-- Agregar registros a la tabla de citas5
INSERT INTO consultorio.cita (num_sesion, fecha, motivo, paciente)
VALUES (1, '2023-12-14', 'Consulta inicial', 15);

INSERT INTO consultorio.cita (num_sesion, fecha, motivo, paciente)
VALUES (3, '2024-01-04', 'Tratar infección', 16);

INSERT INTO consultorio.cita (num_sesion, fecha, motivo, paciente)
VALUES (2, '2023-12-27', 'Terapia hormonal', 17);

INSERT INTO consultorio.cita (num_sesion, fecha, motivo, paciente)
VALUES (2, '2024-01-04', 'Tratar cáncer', 18);

INSERT INTO consultorio.cita (num_sesion, fecha, motivo, paciente)
VALUES (1, '2024-01-16', 'Tratar infección', 19);

-- Agregar registros a la tabla de medicamentos
INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Ciprofloxacino', 450, 500,'Tratar infección');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Tamsulosina', 350, 0.4, 'Resección transuretral de la próstata');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Levofloxacino', 374, 100, 'Tratar infección');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Bicalutamida', 850, 50, 'Terapia hormonal');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Zytiga', 1700, 500, 'Tratar cáncer');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Leuprorelina', 60, 2000, 'Tratar cáncer');

INSERT INTO consultorio.medicamentos (nombre_medicamento, cantidad, precio, tratamiento)
VALUES ('Ertapenem', 1450, 1000, 'Tratar infección');

----- Agregar los registros de personal
INSERT INTO consultorio.personal (nombre, edad, especializacion, paciente)
VALUES ('Marcos Espejel García', 45, 'Urología', 1);
INSERT INTO consultorio.personal (nombre, edad, especializacion, paciente)
VALUES ('Gonzalo Esquivel Miramontes', 34, 'Urología', 2);
INSERT INTO consultorio.personal (nombre, edad, especializacion, paciente)
VALUES ('Sara Lorena Matute Cantón', 30, 'Oncología', 3);
INSERT INTO consultorio.personal (nombre, edad, especializacion, paciente)
VALUES ('Natalia Hernández Santos', 37, 'Oncología', 4);
INSERT INTO consultorio.personal (nombre, edad, especializacion, paciente)
VALUES ('Carlos Cruz Moreno', 41, 'Urología', 5);


-- Ver las tablas
select * from consultorio.personal;
select * from consultorio.cita;
select * from consultorio.paciente;
select * from consultorio.pariente;
select * from consultorio.paciente_pariente;
select * from consultorio.medicamentos;

