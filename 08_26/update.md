-- Comando UPDATE

O comando `UPDATE` permite alterar o valor de uma ou mais colunas de uma
tabela. A cláusula `WHERE` define quais registros serão modificados.

## Sintaxe

```sql
UPDATE nome_da_tabela
SET campo1 = valor1,
		campo2 = valor2
WHERE condição;
```

O `WHERE` é importante porque, sem ele, todos os registros da tabela serão
atualizados. Essa operação é chamada de atualização em lote.

## Exemplos

Antes de atualizar, consulte os registros que serão alterados:

```sql
SELECT * FROM tbalunos WHERE rgm = 2;
```

Atualizando o curso de um aluno:

```sql
UPDATE tbalunos
SET curso = 'engenharia de pesca'
WHERE rgm = 2;
```

Atualizando duas colunas no mesmo comando:

```sql
UPDATE tbalunos
SET nome = 'Manuela Silva',
		curso = 'engenharia de software'
WHERE rgm = 2;
```

Atualizando vários produtos de uma só vez:

```sql
UPDATE tbprodutos
SET valor_unit = valor_unit * 1.10
WHERE quantidade < 5;
```

Nesse exemplo, o preço dos produtos com menos de cinco unidades aumenta em
10%. Para atualizar todos os produtos, o `WHERE` pode ser omitido, mas isso
deve ser feito somente quando essa for realmente a intenção:

```sql
UPDATE tbprodutos
SET valor_unit = valor_unit * 1.05;
```

Depois da alteração, confira o resultado:

```sql
SELECT * FROM tbprodutos WHERE quantidade < 5;
```

## Cuidados com UPDATE

- Use uma condição com uma coluna identificadora, como `rgm` ou `cod_prod`,
  quando a alteração for de um único registro.
- Execute um `SELECT` com o mesmo `WHERE` antes do `UPDATE`.
- Confira se o tipo do valor corresponde ao tipo da coluna.
- Em alterações importantes, use uma transação quando o banco oferecer esse
  recurso:

```sql
START TRANSACTION;

UPDATE tbalunos
SET curso = 'engenharia de pesca'
WHERE rgm = 2;

COMMIT;
-- Use ROLLBACK no lugar de COMMIT para desfazer antes da confirmação.
```

## Por que usar VARCHAR em vez de CHAR?

`CHAR(30)` armazena textos com tamanho fixo de até 30 caracteres. Mesmo que o
texto seja menor, o espaço reservado é tratado como um campo de tamanho fixo.
É útil para valores que sempre têm o mesmo tamanho, como códigos ou siglas.

`VARCHAR(30)` armazena textos de tamanho variável, com limite de 30
caracteres. Por isso, costuma ser mais adequado para nomes, cursos e outros
textos cujo tamanho varia. No exemplo da tabela de alunos, `nome VARCHAR(50)`
e `curso VARCHAR(30)` são escolhas apropriadas.

`TEXT` é usado para textos maiores e não deve ser escolhido apenas para
substituir um `VARCHAR` curto. `TEXT(30)` não representa um texto de tamanho
variável limitado a 30 caracteres como `VARCHAR(30)`; para esse caso, use:

```sql
VARCHAR(30)
```

### Resumo

```text
CHAR(30)    texto de tamanho fixo
VARCHAR(30) texto de tamanho variável, com limite de 30 caracteres
TEXT        textos longos, sem o mesmo limite curto do VARCHAR
```
