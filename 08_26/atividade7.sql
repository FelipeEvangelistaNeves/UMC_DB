create database cursinho;
use cursinho;
create table alunos (
  rgm int primary key auto_increment,
  nome varchar(100) not null,
  n1 float not null,
  n2 float not null,
  disciplina varchar(100) not null
);
insert into alunos (nome, n1, n2, disciplina) values
( 'ANA', 6, 7.5, 'MKT'),
( 'RITA', 7, 8.5, 'MKT'),
( 'FLAVIA', 8.5, 9, 'MKT'),
( 'BIANCA', 7, 10.0, 'RH'),
( 'IGOR', 5, 6, 'RH'),
( 'PEDRO', 8, 7, 'ADS'),
( 'PEDRO', 8, 6, 'ADS'),
( 'IVAN', 4, 1.5, 'RH');
select * , (n1+n2)/2 as media from alunos;
update alunos set disciplina = "eng software" where disciplina = "RH";
delete from alunos where disciplina = "MKT";
update alunos set nome = "Paulo Cesar Bontempo" where rgm = 7;
update alunos set nome ="Pedro Bontempo" where rgm = 8 ; 
select nome,n2 from alunos where n2=(select max(n2) from alunos);