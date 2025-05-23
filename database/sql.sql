CREATE TABLE `mensagens` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `nome` varchar(53) NOT NULL,
                             `email` varchar(98) NOT NULL,
                             `comentario` varchar(251) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `id_UNIQUE` (`id`)
)