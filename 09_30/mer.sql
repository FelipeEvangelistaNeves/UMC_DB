create database relacionamento;
use relacionamento;
create table carros(
    cod_carro int PRIMARY KEY auto_increment,
    nome_carro varchar(100),
    cod_marca int,
    cor varchar(50)
);
insert into carros(nome_carro, cod_marca, cor) values('Gol', 1, 'Preto');
create table marcas(
    cod_marca int PRIMARY KEY auto_increment,
    nome_marca varchar(100)
);
insert into marcas(nome_marca) values('Volkswagen');
select c.cod_carro, c.nome_carro, m.nome_marca, c.cor from carros as c, marcas as m where c.cod_marca = m.cod_marca;