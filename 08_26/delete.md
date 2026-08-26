-- Comando DELETE

O comando `DELETE` exclui fisicamente um ou mais registros do banco de dados,
mantendo a estrutura da tabela. Depois da exclusão, os dados removidos não
ficam disponíveis para consulta normalmente.

O `DELETE` tem um comportamento semelhante ao `UPDATE`: a cláusula `WHERE`
define quais registros serão afetados. Sem `WHERE`, todos os registros da
tabela serão excluídos.

## Sintaxe

```sql
DELETE FROM nome_da_tabela
WHERE condição;
```

## Exemplos

Antes de excluir, consulte o registro usando a mesma condição:

```sql
SELECT * FROM tbalunos WHERE rgm = 2;
```

Excluindo um aluno específico:

```sql
DELETE FROM tbalunos
WHERE rgm = 2;
```

Excluindo um produto específico:

```sql
DELETE FROM tbprodutos
WHERE cod_prod = 5;
```

Excluindo vários produtos que atendem a uma condição:

```sql
DELETE FROM tbprodutos
WHERE quantidade = 0;
```

## Cuidados importantes

- Sempre confira os registros com `SELECT` antes de executar o `DELETE`.
- Use uma coluna identificadora, como `rgm` ou `cod_prod`, quando quiser
  excluir apenas um registro.
- Nunca execute um `DELETE` sem `WHERE` se a intenção não for esvaziar a
  tabela.
- `DELETE FROM tabela;` remove os registros, mas não remove a tabela nem suas
  colunas.
- A exclusão pode falhar quando o registro é referenciado por outra tabela
  por meio de uma chave estrangeira.

## Usando transação

Quando o banco oferecer suporte a transações, é possível conferir a
alteração antes de confirmá-la:

```sql
START TRANSACTION;

DELETE FROM tbprodutos
WHERE cod_prod = 5;

-- Confira o resultado antes de confirmar.
SELECT * FROM tbprodutos WHERE cod_prod = 5;

ROLLBACK;
COMMIT;
-- Use ROLLBACK no lugar de COMMIT para desfazer antes da confirmação.
```

## Exclusão de todos os registros

Este comando remove todos os registros, mas preserva a estrutura da tabela:

```sql
DELETE FROM tbprodutos;
```

Por ser uma operação perigosa, ele só deve ser usado quando essa for
realmente a intenção. Para apagar todos os registros e reiniciar o contador
`AUTO_INCREMENT` em bancos que oferecem esse recurso, também existe o
`TRUNCATE TABLE`, mas ele possui comportamento transacional diferente:

```sql
TRUNCATE TABLE tbprodutos;
```
