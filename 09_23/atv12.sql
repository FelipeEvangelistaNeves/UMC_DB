

-- PARTE 1 — Criação do Banco e Tabelas
-- 1. Criar o banco de dados
-- Crie um banco de dados chamado locadora_veiculos.
create database locadora_veiculos;
-- 2. Criar a tabela clientes
-- Crie a tabela contendo, no mínimo, os seguintes campos:
-- id_cliente
-- nome
-- cpf
-- telefone
-- cidade
-- estado
-- Defina id_cliente como chave primária.
create table clientes(
    id_cliente int PRIMARY KEY auto_increment,
    nome varchar(100),
    cpf varchar(14),
    telefone varchar(20),
    cidade varchar(100),
    estado varchar(100)
);
-- 3. Criar a tabela veiculos
-- Crie a tabela contendo:
-- id_veiculo
-- marca
-- modelo
-- ano
-- categoria
-- valor_diaria
-- quilometragem
-- status
-- Defina id_veiculo como chave primária.
-- Utilize o campo status para indicar, por exemplo:
-- Disponível
-- Alugado
-- Manutenção
create table veiculos(
    id_veiculo int PRIMARY KEY auto_increment,
    marca varchar(100),
    modelo varchar(100),
    ano int,
    categoria varchar(50),
    valor_diaria decimal(10,2),
    quilometragem int,
    status varchar(20)
);

-- 4. Criar a tabela locacoes
-- Crie uma tabela contendo:
-- id_locacao
-- id_cliente
-- id_veiculo
-- data_locacao
-- data_devolucao
-- quantidade_dias
-- valor_diaria
-- valor_total
-- Defina id_locacao como chave primária.
-- Crie também as chaves estrangeiras relacionadas às tabelas clientes e veiculos.
create table locacoes(
    id_locacao int PRIMARY KEY auto_increment,
    id_client int,
    id_veicu int,
    data_locacao date,
    data_devolucao date,
    quantidade_dias int,
    valor_diaria decimal(10,2),
    valor_total decimal(10,2),
    quilometragem_inicial int,
    quilometragem_final int,
    FOREIGN KEY (id_client) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_veicu) REFERENCES veiculos(id_veiculo)
);
-- 5. Inserir clientes
-- Cadastre pelo menos 5 clientes na tabela clientes.
-- Os clientes devem possuir cidades e estados diferentes.

insert into clientes(nome, cpf, telefone, cidade, estado) values
('João Silva', '123.456.789-00', '(11) 98765-4321', 'São Paulo', 'SP'),
('Maria Oliveira', '987.654.321-00', '(21) 91234-5678', 'Rio de Janeiro', 'RJ'),
('Carlos Santos', '456.789.123-00', '(31) 99876-5432', 'Belo Horizonte', 'MG'),
('Ana Costa', '321.654.987-00', '(41) 93456-7890', 'Curitiba', 'PR'),
('Pedro Lima', '654.321.987-00', '(51) 91234-5678', 'Porto Alegre', 'RS');
-- 6. Inserir veículos
-- Cadastre pelo menos 5 veículos, utilizando diferentes:
-- marcas;
-- modelos;
-- anos;
-- categorias;
-- valores de diária;
-- quilometragens;
-- status.
insert into veiculos ( marca, modelo, ano, categoria, valor_diaria, quilometragem, status) values
('Toyota', 'Corolla', 2022, 'Sedan', 180.00, 15000, 'Disponível'),
('Honda', 'Civic', 2021, 'Sedan', 170.00, 20000, 'Alugado'),
('Ford', 'EcoSport', 2020, 'SUV', 160.00, 25000, 'Disponível'),
('Chevrolet', 'Onix', 2023, 'Hatchback', 140.00, 10000, 'Manutenção'),
('Volkswagen', 'T-Cross', 2022, 'SUV', 190.00, 12000, 'Disponível');
-- 7. Inserir locações
-- Cadastre pelo menos 5 locações, relacionando clientes e veículos existentes.
-- Informe:
-- cliente;
-- veículo;
-- data da locação;
-- data da devolução;
-- quantidade de dias;
-- valor da diária;
-- valor total.
insert into locacoes (id_client, id_veicu, data_locacao, data_devolucao, quantidade_dias, valor_diaria, valor_total, quilometragem_inicial, quilometragem_final) values
(1, 2, '2024-06-01', '2024-06-05', 4, 180.00, 720.00, 15000, 15500),
(2, 3, '2024-06-02', '2024-06-04', 2, 170.00, 340.00, 20000, 20200),
(3, 4, '2024-06-03', '2024-06-07', 4, 160.00, 640.00, 25000, 25500),
(4, 5, '2024-06-04', '2024-06-08', 4, 140.00, 560.00, 10000, 10500),
(5, 1, '2024-06-05', '2024-06-09', 4, 190.00, 760.00, 12000, 12500);
-- 9. Listagem de veículos
-- Faça um SELECT apresentando todos os veículos cadastrados.
select * from veiculos;
-- 10. Veículos disponíveis
-- Faça uma consulta que apresente somente os veículos que estão com o status "Disponível".
select * from veiculos where status = 'Disponível';
-- 11. Veículos com diária superior a R$ 150,00
-- Liste os veículos cujo valor da diária seja superior a 150.
-- Apresente:
-- marca;
-- modelo;
-- categoria;
-- valor da diária.
select marca, modelo, categoria, valor_diaria from veiculos where valor_diaria > 150.00;
-- 12. Veículos disponíveis com diária inferior a R$ 150,00
-- Utilizando AND, apresente os veículos que atendam simultaneamente às seguintes condições:
-- estejam disponíveis;
-- possuam valor de diária menor que R$ 150,00.
select marca,modelo from veiculos where status = "Disponível" and valor_diaria < 150.00;

-- 13. Clientes de uma determinada cidade e estado
-- Utilizando AND, liste os clientes que sejam de uma determinada cidade e de um determinado estado. Usar exemplo Santos SP
select nome from clientes where cidade = "Santos" and estado = "SP";
-- 14. Veículos entre determinadas condições
-- Utilizando AND, liste os veículos que:
-- sejam do ano de 2022 ou superior;
-- tenham valor de diária superior a R$ 100,00;
select marca,modelo from veiculos where ano >= 2022 and valor_diaria > 100.00;
-- 15. Consulta utilizando IN
-- Utilizando IN, apresente os veículos pertencentes às categorias:Sedan, Hatch.
select marca,modelo from veiculos where categoria in ("Sedan","Hatchback");
-- 16. Atualizar o status de um veículo
-- Escolha um veículo que esteja disponível e altere s  eu status para:
-- Alugado
alter table veiculos set status = "Alugado" where id_veiculo = 1;

-- 17. Excluir um cliente
-- Exclua um cliente que não possua nenhuma locação cadastrada.
delete from clientes where id_client not in (select id_client from locacoes);
-- 18. Maior valor de diária
-- Utilize MAX() para descobrir qual é o maior valor de diária cadastrado na locadora.
-- O resultado deverá apresentar apenas o maior valor.
select MAX(valor_diaria) as "Maior Valor de Diária" from veiculos;
-- 19. Soma dos valores das locações
-- Utilize SUM() para calcular quanto a locadora arrecadou considerando o campo valor_total de todas as locações.
-- Apresente o resultado com um nome apropriado, por exemplo:
-- Total Arrecadado
select SUM(valor_total) as "Total Arrecadado" from locacoes;

-- 20. Calcular diferença de quilometragem
-- Considere que a tabela locacoes possui os campos:
-- quilometragem_inicial
-- quilometragem_final
select id_locacao, (quilometragem_final - quilometragem_inicial) as "Diferença de Quilometragem" from locacoes;


