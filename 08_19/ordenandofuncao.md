# Ordenando a visualização dos dados

Organizar a visualização dos dados é muito importante, pois ajuda o usuário a manter um padrão de leitura e facilita a localização das informações.

## Ordem crescente e decrescente

- Crescente: A...Z
- Crescente: 1...N
- Decrescente: Z...A
- Decrescente: N...1

A ordenação pode ser aplicada em uma coluna específica da tabela, deixando os registros em uma sequência mais organizada.

## Sintaxe

```sql
SELECT *
FROM tabela
ORDER BY campo_desejado ASC|DESC;
```

Exemplo:

```sql
SELECT * FROM aluno ORDER BY nome_aluno ASC;
```

```sql
SELECT * FROM aluno ORDER BY nome_aluno DESC;
```

```sql
SELECT *
FROM aluno
ORDER BY codigo_aluno ASC;
```

```sql
SELECT *
FROM aluno
ORDER BY codigo_aluno DESC;
```
