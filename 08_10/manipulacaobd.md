# Script SQL do Banco de Dados 10_08

```sql
create database 10_08;
use 10_08;

create table tbalunos (
  rgm int not null primary key auto_increment,
  nome varchar(50) not null,
  curso varchar(30) not null
);

insert into tbalunos (nome, curso)
values ("Manuela", "engenharia de software");

create table tbprodutos (
  cod_prod int primary key auto_increment,
  nome_produto varchar(90),
  quantidade int,
  valor_unit float
);

insert into tbprodutos (nome_produto, quantidade, valor_unit)
values
  ("cachorroo", 4, 2.22),
  ("miojo", 5, 3.12),
  ("pastasdedente", 3, 7.10),
  ("banana", 12, 10.19);
```
