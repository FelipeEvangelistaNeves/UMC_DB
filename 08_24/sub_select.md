# Subselect

Para obter o mesmo resultado, podemos utilizar um **subselect**: uma consulta `SELECT` dentro de outra consulta `SELECT`.

## Sintaxe

```sql
SELECT *
FROM nome_tabela
WHERE campo = (
	SELECT MAX(campo_desejado)
	FROM nome_tabela
);
```

Nesse exemplo, a consulta interna encontra o maior valor de `campo_desejado`. Em seguida, a consulta externa retorna os registros cujo `campo` corresponde a esse valor.

## Exemplo prático

Considere a tabela `vendas`:

| produto  | categoria   | preco_unitario |
| -------- | ----------- | -------------: |
| Mouse    | Informática |          80.00 |
| Teclado  | Informática |         150.00 |
| Notebook | Informática |        3500.00 |

Para descobrir qual produto possui o maior preço unitário, usamos um subselect:

```sql
SELECT produto, preco_unitario
FROM vendas
WHERE preco_unitario = (
	SELECT MAX(preco_unitario)
	FROM vendas
);
```

A consulta interna encontra o maior preço, `3500.00`. A consulta externa então retorna:

| produto  | preco_unitario |
| -------- | -------------: |
| Notebook |        3500.00 |
