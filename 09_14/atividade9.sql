create database cursinho;
use cursinho;
CREATE TABLE alunos (
    id INT,
    nome VARCHAR(50),
    idade INT,
    nota DECIMAL(4,2),
    curso VARCHAR(50)
);

-- 1. Insira um aluno chamado Ana, idade 20, nota 8.5, curso Informática.
insert into alunos (id, nome, idade, nota, curso) values (1, 'Ana', 20, 8.5, 'Informatica');
-- 2. Insira um aluno chamado Carlos, idade 22, nota 7.0, curso Administração.
insert into alunos (id, nome, idade, nota, curso) values (2, 'Carlos', 22, 7.0, 'Administracao');
-- 3. Insira três novos alunos de cursos diferentes.
insert into alunos (id, nome, idade, nota, curso) values (3, 'Mariana', 19, 9.0, 'Engenharia'), (4, 'Lucas', 21, 6.5, 'Matematica'), 
(5, 'Beatriz', 23, 8.0, 'Fisica' );
-- 4. Liste todos os alunos cuja idade seja maior que 20.
select * from alunos where idade > 20;
-- 5. Liste os alunos cuja nota seja menor que 6.
select * from alunos where nota < 6;
-- 6. Mostre os alunos cuja idade seja maior ou igual a 18.
select * from alunos where idade >=18;
-- 7. Liste os alunos cuja nota seja menor ou igual a 7.
select * from alunos where nota <= 7;
-- 8. Mostre os alunos cujo curso seja igual a "Informática".
select * from alunos where curso = "Informatica";
-- 9. Liste os alunos cujo curso seja diferente de "Administração".
select * from alunos where curso != "Administracao";
-- 10. Mostre a maior nota da tabela.
select max(nota) from alunos;
-- 11. Mostre a menor nota da tabela.
select min(nota) from alunos;
-- 12. Mostre a soma de todas as notas.
select sum(nota) from alunos;
-- 13. Conte quantos alunos existem na tabela.
select count(*) from alunos;
-- 14. Conte quantos alunos têm nota maior que 7.
select count(*) from alunos where nota > 7;
-- 15. Mostre a maior idade dos alunos.
select max(idade) from alunos;
-- 16. Mostre a menor nota entre alunos do curso Informática.
select min(nota) from alunos where curso = "Informatica";
-- 17. Mostre a soma das notas dos alunos com idade maior que 20.
select sum(nota) from alunos where idade > 20;
-- 18. Delete os alunos cuja nota seja menor que 5.
delete from alunos where nota < 5;
-- 19. Delete os alunos cujo curso seja igual a Administração.
delete from alunos where curso = "Administracao";
-- 20. Apague completamente a tabela alunos.
drop table alunos;
-- 21. Insira um aluno chamado Mariana, idade 19, nota 9.0, curso Engenharia.
insert into alunos (id, nome, idade, nota, curso) values (6, 'Mariana', 19, 9.0, 'Engenharia');
-- 22. Insira dois novos alunos no curso Informática com notas diferentes.
insert into alunos (id, nome, idade, nota, curso) values (7, 'Pedro', 20, 8.0, 'Informatica'), (8, 'Juliana', 22, 7.5, 'Informatica');
-- 23. Liste os alunos cuja idade seja menor que 21.
select * from alunos where idade < 21;
-- 24. Mostre os alunos cuja nota seja maior ou igual a 8.
select * from alunos where nota >= 8;
-- 25. Liste os alunos cuja idade seja diferente de 20.
select * from alunos where idade != 20;
-- 26. Mostre a quantidade de alunos com idade maior que 18.
select count(*) from alunos where idade > 18;
-- 27. Mostre a soma das notas dos alunos com nota maior que 7.
select sum(nota) from alunos where nota > 7;
-- 28. Mostre a maior idade entre os alunos do curso Engenharia.
select max(idade) from alunos where curso = "Engenharia";
-- 29. Mostre a menor idade entre todos os alunos cadastrados.
select min(idade) from alunos;
-- 30. Delete os alunos cuja idade seja menor que 18.
delete from alunos where idade < 18;
 