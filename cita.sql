CREATE TABLE consultorio.cita (
	num_sesion int not null,
	fecha date not null, 
	motivo varchar(100) not null,
	id_cita serial primary key,
	paciente int not null,
	constraint cita_paciente_fk foreign key (paciente)
	references consultorio.paciente (id_paciente)
);