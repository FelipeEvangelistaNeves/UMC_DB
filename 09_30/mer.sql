create database relacionamento;
use relacionamento;
create table carros(
    id_carro int PRIMARY KEY auto_increment,
    nome_carro varchar(100),
    cod_marca int,
    cor varchar(50)
);
insert into carros(nome_carro, cod_marca, cor) values('Gol', 1, 'Preto');