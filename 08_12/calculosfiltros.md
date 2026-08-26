# Cálculos e filtros em SQL

## Vantagens de calcular no banco de dados

- O resultado é atualizado automaticamente sempre que os dados mudam.
- Isso evita cálculos repetidos na aplicação.
- Permite criar colunas virtuais com expressões.

## Operadores básicos

- `+` adição
- `-` subtração
- `*` multiplicação
- `/` divisão

## Exemplo de cálculo no SELECT

```sql
SELECT (campo1 - campo2) AS campo1_campo2
FROM nome_tabela;
```

## Uso de alias com `AS`

O `AS` permite nomear o resultado da expressão como um campo virtual:

```sql
SELECT campo1,
       (campo2 - campo3) AS campo_resultado
FROM nome_tabela;
```

Assim, em vez de aparecer o cálculo diretamente, o resultado aparece com um nome de campo.

## Criando filtros com `WHERE`

A cláusula `WHERE` é usada para filtrar linhas em consultas, `DELETE` e `UPDATE`.

```sql
SELECT *
FROM nome_tabela
WHERE campo_desejado = valor_processado;
```
