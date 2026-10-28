criando condições de analise no banco de dados
ja sabemos que o banco de dados e um repositorio que permite armazenar dados e quando processamos estes dados se tornam uma informação.
mas na obtenção dos resultados podemos avaliar os dados e criar uma função condicional
sinais condicionais

```sql
> maior
> < menor
> = igual
> <> igualdade
> <= menor igual
> = maior igual
> para aplicar esta análise de dados vamos utilizar if
> sua sintaxe e select campo1,campo2
> if (campodesejado sintaxe condicional valor desejado, 'resultado verdadeiro ''resultado falso' as resultado from nometabela)

select nome,disciplina,media, if(media<5,'didnt pass','passed') as result from alunos;
select nome,disciplina,media, if(media<=4.5,'Reprovado',if(media>4.5 and media<=5,'Recuperacao','Aprovado')) as resultado from alunos;
create table view_alunos (
select nome,disciplina,media, if(media<=4.5,'Reprovado',if(media>4.5 and media<=5,'Recuperacao','Aprovado')) as resultado from alunos);
-- ------------------------------------
create table funcionarios(
  id_func int primary key auto_increment,
  nome_func varchar(50) not null,
  cargo_func varchar(50) not null,
  valor_hora decimal(10,2) not null,
  horas_por_dia int not null
);
truncate table funcionarios;
alter table funcionarios add status_func int not null;
  insert into funcionarios(nome_func,cargo_func,valor_hora,horas_por_dia,status_func) values
  ('joao','programador',45.00,8,2),
  ('maria','analista',35.00,8,1),
  ('pedro','gerente',70.00,8,1),
  ('ana','diretora',120.00,8,3),
  ('carlos','programador',45.00,8,1),
  ('fernando','diretor',120.00,8,1);
select nome_func,cargo_func,valor_hora*horas_por_dia as salario_diario from funcionarios;

select nome_func,cargo_func,valor_hora*horas_por_dia as salario_diario,if(valor_hora*horas_por_dia>=350.00,'salarioalto','salarioabaixodamedia') as resultado from funcionarios;
select nome_func,cargo_func,valor_hora*horas_por_dia as salario_diario,if(valor_hora*horas_por_dia>350.00,'salarioalto','salarioabaixodamedia') as resultado from funcionarios where valor_hora*horas_por_dia>=350;
select nome_func,cargo_func,valor_hora*horas_por_dia as salario_diario from funcionarios where valor_hora*horas_por_dia=(select max(valor_hora*horas_por_dia) from funcionarios);
-- -----------------------------------------------------------------------------------
select nome,status_func,case status_func
when 1 then 'ativo'
when 2 then 'inativo'
when 3 then 'pendente'
else 'desconhecido'
end as resultado from funcionarios;
```
