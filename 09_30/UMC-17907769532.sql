CREATE TABLE IF NOT EXISTS `produto` (
	`cod_produto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_produto` int NOT NULL,
	`qnt_prod` varchar(40) NOT NULL,
	`valor_unit` int NOT NULL,
	`cod_marca` int NOT NULL,
	PRIMARY KEY (`cod_produto`)
);
CREATE TABLE IF NOT EXISTS `marcas` (
	`cod_marca` int AUTO_INCREMENT NOT NULL UNIQUE,
	`marca` varchar(40) NOT NULL,
	PRIMARY KEY (`cod_marca`)
);
ALTER TABLE `produto` ADD CONSTRAINT `produto_fk4` FOREIGN KEY (`cod_marca`) REFERENCES `marcas`(`cod_marca`);