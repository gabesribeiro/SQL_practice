/*Revisão de todos os conceitos adquiridos e aplicados até o momento.
	Neste código iremos desde a criação da tabela até subqueries e clásulas GROUP BY e HAVING.
	Também iremos, no código, aplicar a indentação e comentários para boas práticas.*/

/*Criação de tabela de uma equipe técnica de um clube de futebol*/

CREATE TABLE
	comissao_tec
	(
		id_tec		numeric(10,0) NOT NULL,
		prim_nome	varchar(100) NOT NULL,
		ult_nome	varchar(100),
		data_nasc	date,
		cargo		varchar(100) NOT NULL,
		CONSTRAINT
			pk_comissao_tec
		PRIMARY KEY
		(
			id_tec
		)
	);

/*
Adição posterior de nacionalidade com código de estado de origem para os técnicos
Adicionado em 05 de Março de 2023
*/
ALTER TABLE
	comissao_tec
ADD
	nacionalidade	varchar(100),
	UF_origem		varchar(2)

/*Criação de tabela para contratação, contendo informações da contratação do membro da comissão.
Aqui serão aplicados conceitos de chave estrangeira e CHECK*/

CREATE TABLE
	contratados_tec
	(
		id_tec				numeric(10,0) NOT NULL,
		prim_nome			varchar(100) NOT NULL,
		inicio_contrato		date NOT NULL,
		fim_contrato		date NOT NULL,
		CONSTRAINT
			pk_contratados_tec
		PRIMARY KEY
		(
			id_tec,
			inicio_contrato
		),
		CONSTRAINT
			fk_contratados_tec_ref_comissao_tec
		FOREIGN KEY
		(
			id_tec
		)
		REFERENCES
			comissao_tec
			(
				id_tec
			),
		CONSTRAINT
			ck_contratados_tec
		CHECK
			(fim_contrato>inicio_contrato)
	);

/*Início da inserção de dados na tabela:
COMISSÃO TÉCNICA*/

--Uso de ALT+F1 para ter, de forma mais fácil, as propriedades da tabela. Usamos isso ao selecionar o nome da mesma.

--Gabriel Ribeiro, Técnico
INSERT INTO
	comissao_tec
	(
		id_tec,
		prim_nome,
		ult_nome,
		data_nasc,
		cargo
	)
VALUES
(
	1,
	'Gabriel',
	'Ribeiro',
	'1999-12-08',
	'Técnico'
);

/*
Inserção dos dados de nacionalidade e origem.

Adicionado em 05 de Março de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade='Brasileiro',
	UF_origem= 'SP'
WHERE
	id_tec=1

SELECT
	*
FROM
	comissao_tec

--Guilherme Ribeiro, Auxiliar do técnico
INSERT INTO
	comissao_tec
	(
		id_tec,
		prim_nome,
		ult_nome,
		data_nasc,
		cargo
	)
VALUES
(
	2,
	'Guilherme',
	'Ribeiro',
	'2004-05-05',
	'Auxiliar Técnico'
);

/*
Inserção dos dados de nacionalidade e origem.

Adicionado em 06 de Março de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileiro',
	UF_origem= 'SP'
WHERE
	id_tec= 2

--Paulo Lopes, Segundo Auxiliar do Técnico
INSERT INTO
	comissao_tec
	(
		id_tec,
		prim_nome,
		ult_nome,
		data_nasc,
		cargo
	)
VALUES
(
	3,
	'Paulo',
	'Lopes',
	'1997-09-14',
	'Seg. Auxiliar Técnico'
);

/*
Inserção dos dados de nacionalidade e origem.

Adicionado em 06 de Março de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileiro',
	UF_origem= 'PR'
WHERE
	id_tec= 3

--Nayara Lourenço, Preparadora Física
INSERT INTO
	comissao_tec
	(
		id_tec,
		prim_nome,
		ult_nome,
		data_nasc,
		cargo
	)
VALUES
(
	4,
	'Nayara',
	'Lourenço',
	'2000-03-21',
	'Preparadora Física'
);

/*
Inserção dos dados de nacionalidade e origem.

Adicionado em 05 de Março de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileira',
	UF_origem= 'SP'
WHERE
	id_tec= 4

--João Igor, Treinador de Goleiro
INSERT INTO
	comissao_tec
	(
		id_tec,
		prim_nome,
		ult_nome,
		data_nasc,
		cargo
	)
VALUES
(
	5,
	'João',
	'Igor',
	'1998-07-26',
	'Treinador de Goleiro'
);

/*
Inserção dos dados de nacionalidade e origem.

Adicionado em 05 de Março de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Português',
	UF_origem= 'XX'
WHERE
	id_tec= 5


/*Inserção de dados na tabela:
TÉCNICOS CONTRATADOS.*/
--Faremos uso, também, de ALT+F1 para obter as propriedades da tabela
--contratados_tec

--Gabriel Ribeiro, Técnico
INSERT INTO
	contratados_tec
	(
		id_tec,
		prim_nome,
		inicio_contrato,
		fim_contrato
	)
VALUES
(
	1,
	'Gabriel',
	'2023-01-09',
	'2026-01-10'
);

--Guilherme Ribeiro, Auxiliar do Técnico
INSERT INTO
	contratados_tec
	(
		id_tec,
		prim_nome,
		inicio_contrato,
		fim_contrato
	)
VALUES
(
	2,
	'Guilherme',
	'2023-01-09',
	'2026-01-10'
);

--Paulo Lopes, Segundo Auxiliar do Técnico
INSERT INTO
	contratados_tec
	(
		id_tec,
		prim_nome,
		inicio_contrato,
		fim_contrato
	)
VALUES
(
	3,
	'Paulo',
	'2023-01-09',
	'2023-01-10'
);

--Nayara Lourenço, Preparadora Física
INSERT INTO
	contratados_tec
	(
		id_tec,
		prim_nome,
		inicio_contrato,
		fim_contrato
	)
VALUES
(
	4,
	'Nayara',
	'2021-04-15',
	'2025-04-14'
);


--João Igor, Treinador de Goleiro
INSERT INTO
	contratados_tec
	(
		id_tec,
		prim_nome,
		inicio_contrato,
		fim_contrato
	)
VALUES
(
	5,
	'João',
	'2020-06-27',
	'2024-06-26'
);


/*Código para consulta simples das informações da tabela*/

--Comissão técnica
SELECT
	*
FROM
	comissao_tec


--Contrato técnicos
SELECT
	*
FROM
	contratados_tec

--Consulta de técnicos estrangeiros

SELECT
	id_tec,
	prim_nome,
	cargo,
	nacionalidade
FROM
	comissao_tec
WHERE
	nacionalidade
	NOT IN
	(
		'Brasileiro',
		'Brasileira'
	)
