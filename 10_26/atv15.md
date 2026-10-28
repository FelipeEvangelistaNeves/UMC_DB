<!-- -- Atividade - 15 Exercícios de Assimilação
-- Enviar todos os scripts em sql desta atividade para o meu e@mail -->

```sql
CREATE DATABASE laboratorio_mysql;

USE laboratorio_mysql;

CREATE TABLE alunos (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    curso VARCHAR(80) NOT NULL,

    idade INT,

    nota DECIMAL(4,2),

    mensalidade DECIMAL(10,2),

    status VARCHAR(20) DEFAULT 'Ativo'

);

INSERT INTO alunos (nome, curso, idade, nota, mensalidade, status)

VALUES

('Ana Souza', 'ADS', 20, 8.50, 650.00, 'Ativo'),

('Bruno Lima', 'ADS', 23, 5.50, 650.00, 'Ativo'),

('Carla Mendes', 'Publicidade', 21, 9.20, 580.00, 'Ativo'),

('Daniel Alves', 'Publicidade', 25, 4.00, 580.00, 'Inativo'),

('Eduarda Costa', 'Administração', 22, 7.00, 520.00, 'Ativo'),

('Felipe Santos', 'ADS', 19, 6.00, 650.00, 'Ativo'),

('Gabriela Rocha', 'Administração', 28, 8.00, 520.00, 'Inativo'),

('Henrique Melo', 'Publicidade', 24, 6.80, 580.00, 'Ativo'),

('Isabela Martins', 'ADS', 20, 9.50, 650.00, 'Ativo'),

('João Pedro', 'Administração', 26, 3.50, 520.00, 'Ativo');

SELECT \* FROM alunos;

-- Atividade utilizando IF

-- 1 — Situação acadêmica
-- Exiba o nome de cada aluno, sua nota e uma coluna chamada resultado. Se a nota for maior ou igual a 7, mostrar “Aprovado”; caso contrário, mostrar “Reprovado”.
select nome,nota, if(nota>=7,'Aprovado','Reprovado') as resultado from alunos;

-- 2 — Maioridade
-- Exiba o nome, a idade e uma coluna chamada faixa_etaria. Se o aluno tiver 18 anos ou mais, mostrar “Maior de idade”; caso contrário, “Menor de idade”.
select nome,idade, if(idade>=18,'Maior de idade','Menor de idade') as faixa_etaria from alunos;

-- 3 — Desconto na mensalidade
-- Exiba o nome, o curso, a mensalidade original e o valor final. Alunos com nota maior ou igual a 9 receberão 10% de desconto; os demais pagarão o valor integral.
select nome,curso,nota,mensalidade,if(nota>=9,mensalidade*0.90,mensalidade*1) as desconto from alunos;
-- 4 — Classificação de desempenho
-- Crie uma consulta que exiba nome, nota e uma coluna chamada desempenho. Se a nota for maior ou igual a 8, mostrar “Excelente”; caso contrário, “Regular”.

select nome,nota,if(nota>=8,'Excelente','Regular') as desempenho from alunos;
-- Atividade utilizando CASE

-- 5 — Classificação por nota
-- Exiba o nome e a nota dos alunos, classificando o desempenho da seguinte maneira:
-- Nota menor que 5: “Insuficiente”.
-- Nota maior ou igual a 5 e menor que 7: “Regular”.
-- Nota maior ou igual a 7 e menor que 9: “Bom”.
-- Nota maior ou igual a 9: “Excelente”.
select nome, nota,
case
    when nota < 5 then 'Insuficiente'
    when nota < 7 then 'Regular'
    when nota < 9 then 'Bom'
    else 'Excelente'
end as resultado
from alunos;
-- 6 — Classificação das mensalidades
-- Exiba o nome, o curso e a mensalidade de cada aluno, criando uma coluna chamada categoria_mensalidade:
-- Mensalidade abaixo de R$ 550,00: “Baixa”.
-- Mensalidade entre R$ 550,00 e R$ 600,00: “Média”.
-- Mensalidade maior que R$ 600,00: “Alta”.
select nome,curso,mensalidade,
case
  when mensalidade <550 then 'baixa'
  when mensalidade <=600 then 'media'
  else 'alta'
  end as resultado
  from alunos;
-- 7 — Situação cadastral
-- Crie uma consulta que exiba o nome e o status de cada aluno. Utilize CASE para apresentar:
-- Qualquer outro status: “Verificar cadastro”.
-- Status “Inativo”: “Matrícula suspensa”.
-- Status “Ativo”: “Matrícula regular”.
select nome,status,
case
when status="Inativo" then "matricula suspensa"
when status="Ativo" then "matricula regular"
else 'erro'
end as result
from alunos;
-- 8 — Indicadores acadêmicos
-- Desenvolva uma consulta que apresente, em um único resultado:
-- Utilize MAX(), MIN(), AVG() e COUNT().
-- A quantidade total de alunos cadastrados.
-- A média geral das notas.
-- A menor nota dos alunos.
-- A maior nota dos alunos.
select avg(nota) from alunos;
select min(nota) from alunos;
select max(nota) from alunos;
-- 9 — Análise por curso
-- Apresente um relatório agrupado por curso, contendo:
-- Utilize as funções de agregação em conjunto com GROUP BY.

-- Média das notas.
-- Menor nota.
-- Maior nota.
-- Quantidade de alunos.
-- Nome do curso.
select curso,avg(nota) as media, min(nota) as min_nota,max(nota) as nota_max,count(id) as contagem from alunos group by(curso);
-- 10 — Análise das mensalidades
-- Crie um relatório para cada curso que apresente:

-- Mensalidade média.
-- Menor mensalidade.
-- Maior mensalidade.
-- Quantidade de alunos matriculados.
select curso,avg(mensalidade) as media, min(mensalidade) as min_mensalidade,max(mensalidade) as mensalidade_max,count(id) as contagem from alunos group by(curso);
-- 11 — Consulta com WHERE
-- Liste todos os alunos do curso de ADS que tenham nota maior ou igual a 7.
select nome,nota from alunos where curso="ADS" and nota>=7;
-- 12 — Filtro por idade
-- Exiba nome, idade e curso dos alunos com idade entre 20 e 25 anos, incluindo os limites.
select nome,idade,curso from alunos where idade between 20 and 25;
-- 13 — Filtro combinado
-- Liste os alunos ativos do curso de Publicidade que tenham nota superior a 6.
select nome from alunos where curso="Publicidade" and nota>6;
-- 14 — Inserção de registro com INSERT
-- Cadastre um novo aluno com os seguintes dados:
insert into alunos(nome,curso,idade,nota,mensalidade,status) values("Lucas Ferreira","ADS",22,8.00,650.00,"Ativo");
-- 15 — Inserção de múltiplos registros
-- Utilize um único comando INSERT para cadastrar dois alunos:
insert into alunos(nome,curso,idade,nota,mensalidade,status) values
("Pedro Henrique","Publicidade",20,6.50,580.00,"Ativo"),
("Mariana Oliveira","Administração",23,7.50,520.00,"Ativo");
-- 16 — Atualização de nota com UPDATE
-- Atualize a nota do aluno Bruno Lima para 7,00. Utilize WHERE para garantir que somente o registro correto seja alterado.
update alunos set nota=7
where nome="Bruno Lima";
-- 17 — Atualização de mensalidade
-- A mensalidade do curso de ADS aumentou para R$ 680,00. Atualize a mensalidade de todos os alunos desse curso.
update alunos set mensalidade=680
where curso="ADS";
-- 18 — Atualização de status
-- Altere o status de todos os alunos inativos para “Ativo”, utilizando UPDATE e WHERE.
update alunos set status="Ativo"
where status="Inativo";
-- 19 — Exclusão com DELETE
-- Exclua o cadastro do aluno João Pedro. Utilize o identificador do aluno ou seu nome na condição WHERE para evitar excluir outros registros.
delete from alunos where id=10;
-- 20 — Exclusão com condição
-- Exclua os registros de alunos com nota inferior a 4,00. Antes de executar o comando, consulte os registros que serão afetados e confirme se a exclusão está de acordo com o enunciado.
-- Pedro Henrique, Publicidade, 20 anos, nota 6,50, mensalidade R$ 580,00, status Ativo.
-- Mariana Oliveira, Administração, 23 anos, nota 7,50, mensalidade R$ 520,00, status Ativo.
-- Status: Ativo.
-- Mensalidade: R$ 650,00.
-- Nota: 8,00.
-- Idade: 22 anos.
-- Curso: ADS.
-- Nome: Lucas Ferreira.
delete from alunos where nota<=4;
```
