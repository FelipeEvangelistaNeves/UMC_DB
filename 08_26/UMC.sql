create table alunos( 
  cod int primary key auto_increment,
  rgm int,
  nome varchar(100),
  curso varchar(100)
);
insert into alunos(rgm, nome, curso)
 values
 (123456, 'João Silva', 'Engenharia'),
  (234567, 'Maria Oliveira', 'Medicina'),
  (345678, 'Carlos Souza', 'Direito'),
  (456789, 'Ana Costa', 'Arquitetura'),
  (567890, 'Pedro Lima', 'Administração');
  update alunos set curso = 'Engenharia de Software' where rgm = 123456;

update alunos set curso = "medicina" where cod in (2,3);