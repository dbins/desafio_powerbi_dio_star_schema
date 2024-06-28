CREATE TABLE Fato_Professor	as
SELECT 
	P.idProfessor, P.professor_idDepartamento, P.DataAdmissao, D.idDisciplina, D.Nome as Disciplina
from Professor as P
INNER JOIN
Disciplina as D
ON P.idProfessor = D.Professor_idProfessor
INNER JOIN Departamento as DP
ON P.professor_idDepartamento =  DP.idDepartamento

CREATE TABLE Dimensao_Departamento as
SELECT C.idCurso, C.Nome AS NomeCurso, DP.idDepartamento,
DP.Nome as NomeDepartamento,
DP.Campus
FROM curso as C INNER JOIN Departamento as DP
ON C.Departamento_idDepartamento = DP.idDepartamento
INNER JOIN Professor as P
ON P.professor_idDepartamento = DP.idDepartamento
GROUP BY C.idCurso, C.Nome, DP.idDepartamento,
DP.Nome,
DP.Campus

CREATE TABLE Dimensao_Requisitos as
SELECT DP. Disciplina_idDisciplina,  P.Nome
FROM Disciplina_PreRequisitos as DP
INNER JOIN PreRequisitos AS P
ON DP.Prerequisitos_idPreRequisitos = P.idPreRequisitos

CREATE TABLE Dimensao_Calendario(
Data date NULL,
Dia int NULL,
Mes int NULL,
Ano int NULL,
DiaSemana int NULL,
NumeroSemana int NULL,
Trimestre int NULL,
DiaUtil bit NULL
)

DELIMITER //

CREATE PROCEDURE periodoCalendario(data_inicial DATE, data_final DATE) 

BEGIN

DECLARE data_atual DATE;

    SET data_atual = data_inicial;

    WHILE data_atual <= data_final DO

        INSERT INTO Dimensao_Calendario VALUES (data_atual, DAY(data_atual), MONTH(data_atual), YEAR(data_atual), DAYOFWEEK(data_atual), WEEKOFYEAR(data_atual), QUARTER(data_atual),CASE DAYOFWEEK(data_atual) WHEN 1 THEN 0 WHEN 7 then 0 ELSE 1 END);

        SET data_atual = ADDDATE(data_atual,INTERVAL 1 DAY);

    END WHILE;

END //

DELIMITER ;

CALL periodoCalendario('2024-01-01', '2024-12-31');

ALTER TABLE Fato_Professor
ADD PRIMARY KEY (idProfessor);

ALTER TABLE Dimensao_Calendario
ADD PRIMARY KEY (Data);

ALTER TABLE Dimensao_Departamento
ADD PRIMARY KEY (idDepartamento);

ALTER TABLE Fato_Professor
ADD FOREIGN KEY (DataAdmissao) REFERENCES  Dimensao_Calendario(Data);

ALTER TABLE Fato_Professor
ADD FOREIGN KEY (professor_idDepartamento) REFERENCES  Dimensao_Departamento(idDepartamento);

ALTER TABLE Dimensao_Requisitos
ADD FOREIGN KEY (Disciplina_idDisciplina) REFERENCES  Fato_Professor(idDisciplina);


