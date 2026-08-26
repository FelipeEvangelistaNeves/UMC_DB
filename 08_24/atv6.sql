CREATE DATABASE mercado;
use mercado;
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    produto VARCHAR(100),
    categoria VARCHAR(50),
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    desconto DECIMAL(10,2),
    vendedor VARCHAR(100)
);

insert into vendas (produto, categoria, quantidade, preco_unitario, desconto, vendedor) values

('Notebook', 'Informática', 2, 3500.00, 200.00, 'Carlos'),
('Mouse', 'Informática', 10, 80.00, 0.00, 'Ana'),
('Teclado', 'Informática', 5, 150.00, 20.00, 'Carlos'),
('Monitor', 'Informática', 3, 1200.00, 100.00, 'João'),
('Cadeira', 'Móveis', 4, 850.00, 50.00, 'Ana'),
('Mesa', 'Móveis', 2, 1500.00, 100.00, 'João'),
('Armário', 'Móveis', 3, 1800.00, 150.00, 'Carlos'),
('Impressora', 'Informática', 2, 900.00, 50.00, 'Ana'),
('Webcam', 'Informática', 6, 250.00, 0.00, 'João'),
('Headset', 'Informática', 8, 300.00, 30.00, 'Carlos');

-- 1. Liste todos os registros da tabela vendas.
select * from vendas;
-- 2. Mostre somente produto, quantidade e preco_unitario.
select produto, quantidade, preco_unitario from vendas;
-- 3. Liste somente os produtos pertencentes à categoria Informática.
select * from vendas where categoria = "Informática";
-- 4. Mostre todas as vendas cuja quantidade seja maior que 5 unidades.
select * from vendas where quantidade > 5;
-- 5. Liste todos os produtos ordenados pelo preco_unitario, do menor para o maior.
select * from vendas order by preco_unitario asc;
-- 6. Liste os produtos ordenados pelo preco_unitario, do maior para o menor.
select * from vendas order by preco_unitario desc;
-- 7. Cálculo entre duas colunas
-- Crie uma coluna chamada total_bruto, calculando: quantidade × preco_unitario
-- Exiba o produto, a quantidade, o preço unitário e o total bruto.
select produto,quantidade,preco_unitario, (quantidade * preco_unitario) as total_bruto from vendas;
-- 8. Cálculo considerando desconto
-- Crie uma coluna chamada total_liquido, calculando: (quantidade × preco_unitario) - desconto
-- Exiba o produto e o total líquido.
select produto, ((quantidade * preco_unitario)-desconto) as total_liquido from vendas;
-- 9. Calcule o valor total bruto de todas as vendas utilizando SUM().
select sum((quantidade * preco_unitario)) as total_bruto_geral from vendas;
-- 10. Calcule o valor total vendido considerando: (quantidade × preco_unitario) - desconto
-- O resultado deverá apresentar o total geral das vendas.
select sum((quantidade * preco_unitario)-desconto) as total_liquido_geral from vendas;
-- 11. Descubra qual é o maior preço unitário entre todos os produtos, mostrando o produto.
select *from venda where preco_unitario = (select max(preo_unitario)
	from vendas
);
-- 12. Descubra qual é o menor preço unitário entre todos os produtos, mostrando o produto.
select *from venda where preco_unitario = (select min(preo_unitario)
	from vendas
);
-- 13. Calcule o preço unitário médio dos produtos utilizando AVG().
select avg(preco_unitario) as preco_unitario_medio from vendas;
-- 14. Mostre somente os produtos da categoria Informática, calculando o total_bruto de cada venda e ordenando o resultado do maior total para o menor total.
select *, (quantidade * preco_unitario) as total_bruto from vendas where categoria="Informática" order by (quantidade * preco_unitario) desc;
-- 15. Desafio final – relatório completo
-- Crie um SELECT que apresente:
-- Produto
-- Categoria
-- Quantidade
-- Preço unitário
-- Desconto
-- Total bruto
-- Total líquido


 select produto, categoria, quantidade, preco_unitario, desconto, (quantidade * preco_unitario) as total_bruto ,(quantidade * preco_unitario)-desconto as total_liquido from vendas;