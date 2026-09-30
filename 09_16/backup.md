# Comandos no CMD/PowerShell

## Salvando backup no banco de dados

O backup do banco deve ser realizado pelo DBA. Para uma cópia completa do banco
MySQL, utilize o programa `mysqldump` no terminal:

```powershell
mysqldump -u usuario -p nome_banco > backup_nome_banco.sql
```

O parâmetro `-p` fará o MySQL solicitar a senha no terminal. Para informar o
servidor e a porta, use:

```powershell
mysqldump -h localhost -P 3306 -u usuario -p nome_banco > backup_nome_banco.sql
```

Para incluir todos os bancos do servidor:

```powershell
mysqldump -h localhost -P 3306 -u usuario -p --all-databases > backup_completo.sql
```

Se o terminal informar que `mysqldump` não foi encontrado, instale o MySQL
Client e adicione a pasta `bin` do MySQL ao `PATH` do Windows.

## Restaurando um backup pelo terminal

Para restaurar um arquivo `.sql` no banco, crie o banco de destino se
necessário e execute no terminal:

```powershell
mysql -h localhost -P 3306 -u usuario -p nome_banco < backup_nome_banco.sql
```

Para restaurar um arquivo que contém todos os bancos, omita o nome do banco:

```powershell
mysql -h localhost -P 3306 -u usuario -p < backup_completo.sql
```

# Comandos SQL nas tabelas

## Backup de uma tabela dentro do banco

Também é possível criar uma cópia de uma tabela usando SQL, embora isso não
substitua o backup completo do `mysqldump`:

```sql
CREATE TABLE tabela_backup AS
SELECT * FROM tabela_original;
```

## Exemplo real com a tabela `tbprodutos`

A tabela original possui os campos `cod_prod`, `nome_produto`, `quantidade` e
`valor_unit`. Primeiro, crie uma tabela de backup com a mesma estrutura e copie
os registros:

```sql
CREATE TABLE tbprodutos_backup LIKE tbprodutos;

INSERT INTO tbprodutos_backup
	(cod_prod, nome_produto, quantidade, valor_unit)
SELECT
	cod_prod, nome_produto, quantidade, valor_unit
FROM tbprodutos;
```

Para conferir a cópia:

```sql
SELECT * FROM tbprodutos_backup;
```

Para restaurar os dados na tabela original, depois de esvaziá-la:

```sql
TRUNCATE TABLE tbprodutos;

INSERT INTO tbprodutos
	(cod_prod, nome_produto, quantidade, valor_unit)
SELECT
	cod_prod, nome_produto, quantidade, valor_unit
FROM tbprodutos_backup;
```

```sql
INSERT INTO tbprodutos
	(cod_prod, nome_produto, quantidade, valor_unit)
SELECT
	cod_prod, nome_produto, quantidade, valor_unit
FROM tbprodutos_backup where quantidade>8;
```
