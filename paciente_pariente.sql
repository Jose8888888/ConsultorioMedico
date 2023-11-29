CREATE TABLE consultorio.paciente_pariente (
	id_paciente int,
	constraint paciente_fk foreign key (id_paciente)
	references consultorio.paciente (id_paciente),
	id_pariente int,
	constraint pariente_fk foreign key (id_pariente)
	references consultorio.pariente (id_pariente),
	primary key (id_paciente, id_pariente)
	
);