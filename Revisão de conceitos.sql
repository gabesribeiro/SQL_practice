/*Revis�o de todos os conceitos adquiridos e aplicados at� o momento.
	Neste c�digo iremos desde a cria��o da tabela at� subqueries e cl�sulas GROUP BY e HAVING.
	Tamb�m iremos, no c�digo, aplicar a indenta��o e coment�rios para boas pr�ticas.*/

/*Cria��o de tabela de uma equipe t�cnica de um clube de futebol*/

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
Adi��o posterior de nacionalidade com c�digo de estado de origem para os t�cnicos
Adicionado em 05 de Mar�o de 2023
*/
ALTER TABLE
	comissao_tec
ADD
	nacionalidade	varchar(100),
	UF_origem		varchar(2)

/*Cria��o de tabela para contrata��o, contendo informa��es da contrata��o do membro da comiss�o.
Aqui ser�o aplicados conceitos de chave estrangeira e CHECK*/

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

/*In�cio da inser��o de dados na tabela:
COMISS�O T�CNICA*/

--Uso de ALT+F1 para ter, de forma mais f�cil, as propriedades da tabela. Usamos isso ao selecionar o nome da mesma.

--Gabriel Ribeiro, T�cnico
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
	'T�cnico'
);

/*
Inser��o dos dados de nacionalidade e origem.

Adicionado em 05 de Mar�o de 2023
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

--Guilherme Ribeiro, Auxiliar do t�cnico
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
	'Auxiliar T�cnico'
);

/*
Inser��o dos dados de nacionalidade e origem.

Adicionado em 06 de Mar�o de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileiro',
	UF_origem= 'SP'
WHERE
	id_tec= 2

--Paulo Lopes, Segundo Auxiliar do T�cnico
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
	'Seg. Auxiliar T�cnico'
);

/*
Inser��o dos dados de nacionalidade e origem.

Adicionado em 06 de Mar�o de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileiro',
	UF_origem= 'PR'
WHERE
	id_tec= 3

--Nayara Louren�o, Preparadora F�sica
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
	'Louren�o',
	'2000-03-21',
	'Preparadora F�sica'
);

/*
Inser��o dos dados de nacionalidade e origem.

Adicionado em 05 de Mar�o de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Brasileira',
	UF_origem= 'SP'
WHERE
	id_tec= 4

--Jo�o Igor, Treinador de Goleiro
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
	'Jo�o',
	'Igor',
	'1998-07-26',
	'Treinador de Goleiro'
);

/*
Inser��o dos dados de nacionalidade e origem.

Adicionado em 05 de Mar�o de 2023
*/

UPDATE
	comissao_tec
SET
	nacionalidade= 'Portugu�s',
	UF_origem= 'XX'
WHERE
	id_tec= 5


/*Inser��o de dados na tabela:
T�CNICOS CONTRATADOS.*/
--Faremos uso, tamb�m, de ALT+F1 para obter as propriedades da tabela
--contratados_tec

--Gabriel Ribeiro, T�cnico
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

--Guilherme Ribeiro, Auxiliar do T�cnico
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

--Paulo Lopes, Segundo Auxiliar do T�cnico
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

--Nayara Louren�o, Preparadora F�sica
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


--Jo�o Igor, Treinador de Goleiro
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
	'Jo�o',
	'2020-06-27',
	'2024-06-26'
);


/*C�digo para consulta simples das informa��es da tabela*/

--Comiss�o t�cnica
SELECT
	*
FROM
	comissao_tec


--Contrato t�cnicos
SELECT
	*
FROM
	contratados_tec

--Consulta de t�cnicos estrangeiros

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
