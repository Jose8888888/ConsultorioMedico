CREATE TABLE consultorio.paciente (
	nombre varchar (100) not null,
	edad int not null,
	foto varchar(100) not null,
	telefono int not null,
	religion varchar(10) not null,
	tratamiento varchar (100) not null,
	id_paciente serial primary key
);