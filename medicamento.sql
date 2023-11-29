CREATE TABLE consultorio.medicamentos (
	id_medicamento serial primary key,
  nombre_medicamento varchar(100) not null,
  cantidad int not null,
  precio int not null,
  tratamiento varchar(100) not null
);
