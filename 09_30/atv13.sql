create database locadora;
use locadora;
create table produto(
  cod_produto  int primary key auto_increment,
  nome_produto varchar(40) not null,
  qnt_prod varchar(40) not null,
  valor_unit int not null,
  cod_marca int not null
);
create table marca(
  cod_marca int primary key auto_increment,
  marca varchar(30) not null
);

ALTER TABLE `produto` ADD CONSTRAINT `produto_fk2` FOREIGN KEY (`cod_marca`) REFERENCES `marca`(`cod_marca`);
insert into marca(marca) values('Nestle'),
('Coca-Cola'),
('Pepsi'),
('Ambev'),
('Heineken'),
('Unilever'),
('Danone'),
('Mondelez'),
('Mars'),
('Kraft Heinz');
insert into produto(nome_produto, qnt_prod, valor_unit, cod_marca) values
('Leite', '1L', 5, 1),
('Refrigerante', '2L', 8, 2),
('Suco', '1L', 6, 3),
('Cerveja', '500ml', 4, 4),
('Água Mineral', '500ml', 2, 5),
('Sorvete', '1L', 10, 6),
('Iogurte', '500ml', 7, 7),
('Chocolate', '100g', 3, 8),
('Biscoito', '200g', 4, 9),
('Molho de Tomate', '340g', 5, 10);
--fazer calculo do produto mostrando os campos:
--nome_produto | qnt_prod | valor_unit | cod_marca | valor_total
select nome_produto,qnt_prod,valor_unit, (quantidade_produto*valor_unit) as valor_total