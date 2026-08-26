# Funções de resultados finais

As funções de resultados finais, também conhecidas como funções de agregação, são usadas para resumir os dados de uma coluna e retornar um único valor final.

Essas funções são muito úteis quando queremos saber:

- a soma total de valores;
- o maior valor da coluna;
- o menor valor da coluna;
- a média dos dados;
- quantos registros existem.

---

## 1. Função SUM

A função SUM serve para somar os valores de uma coluna.

### Sintaxe

```sql
SELECT SUM(campo_desejado)
FROM nome_tabela;
```

### Exemplo

```sql
SELECT SUM(valor)
FROM produtos;
```

---

## 2. Função MAX

A função MAX serve para retornar o maior valor encontrado na coluna.

### Sintaxe

```sql
SELECT MAX(campo_desejado)
FROM nome_tabela;
```

### Exemplo

```sql
SELECT MAX(valor)
FROM produtos;
```

---

## 3. Função MIN

A função MIN serve para retornar o menor valor encontrado na coluna.

### Sintaxe

```sql
SELECT MIN(campo_desejado)
FROM nome_tabela;
```

### Exemplo

```sql
SELECT MIN(valor)
FROM produtos;
```

---

## 4. Função AVG

A função AVG serve para retornar a média dos dados de uma coluna.

### Sintaxe

```sql
SELECT AVG(campo_desejado)
FROM nome_tabela;
```

### Exemplo

```sql
SELECT AVG(valor)
FROM produtos;
```

---

## 5. Função COUNT

A função COUNT serve para contar o número de registros em uma coluna.

### Sintaxe

```sql
SELECT COUNT(campo_desejado)
FROM nome_tabela;
```

### Exemplo

```sql
SELECT COUNT(valor)
FROM produtos;
```
