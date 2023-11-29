CREATE TABLE if not exists consultorio.personal(
	id_personal serial primary key,
	nombre varchar(100) not null,
	edad int not null,
	especializacion varchar(100) not null,
	fecha date not null default current_date,
  constraint personal_fecha_FK foreign key(fecha) references consultorio.personal(fecha),
  hora time not null default current_time,
  constraint personal_hora_FK foreign key(hora) references consultorio.personal(hora),
  paciente int not null,
  constraint personal_paciente_FK foreign key(paciente) references consultorio.paciente(id_paciente)
);
/*Duda: es posible hacer que la fecha y la cita sea clave foránea para que los datos coincidan con los de paciente en la tabla paciente.*/
