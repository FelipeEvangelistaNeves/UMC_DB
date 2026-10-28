create database relacionamento;
use relacionamento;
CREATE TABLE IF NOT EXISTS `carros` (
	`cod_carro` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_carro` varchar(30) NOT NULL,
	`cod_marca` int NOT NULL,
	PRIMARY KEY (`cod_carro`)
);
CREATE TABLE IF NOT EXISTS `marcas` (
	`cod_marca` int AUTO_INCREMENT NOT NULL UNIQUE,
	`marca` varchar(30) NOT NULL,
	PRIMARY KEY (`cod_marca`)
);
ALTER TABLE `carros` ADD CONSTRAINT `carros_fk2` FOREIGN KEY (`cod_marca`) REFERENCES `marcas`(`cod_marca`);