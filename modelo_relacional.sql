CREATE TABLE Professor (
    idProfessor int NOT NULL AUTO_INCREMENT,
	Nome varchar(45),
    professor_idDepartamento int,
	DataAdmissao date,
    PRIMARY KEY (idProfessor)
);

CREATE TABLE Departamento (
    idDepartamento int NOT NULL AUTO_INCREMENT,
	Nome varchar(45),
	Campus varchar(45),
    idProfessor_coordenador int,
    PRIMARY KEY (idDepartamento)
);

CREATE TABLE Curso (
    idCurso int NOT NULL AUTO_INCREMENT,
	Nome varchar(45),
    Departamento_idDepartamento int,
    PRIMARY KEY (idCurso)
);

CREATE TABLE Disciplina (
    idDisciplina int NOT NULL AUTO_INCREMENT,
	Nome varchar(45),
    Professor_idProfessor int,
    PRIMARY KEY (idDisciplina)
);

CREATE TABLE Aluno (
    idAluno int NOT NULL AUTO_INCREMENT,
	Nome varchar(45),
    PRIMARY KEY (idAluno)
);

CREATE TABLE Matriculado (
	idMatriculado int NOT NULL AUTO_INCREMENT,
    Aluno_idAluno int,
    Disciplina_idDisciplina int,
	DataMatricula date,
    PRIMARY KEY (idMatriculado)
);

CREATE TABLE Disciplina_Curso (
	idDisciplinaCurso int NOT NULL AUTO_INCREMENT,
    Disciplina_idDisciplina int,
    Curso_idCurso int,
    PRIMARY KEY (idDisciplinaCurso)
);

CREATE TABLE PreRequisitos (
    idPreRequisitos int NOT NULL AUTO_INCREMENT,
    Nome varchar(45),
    PRIMARY KEY (idPreRequisitos)
);


CREATE TABLE Disciplina_PreRequisitos (
    idDisciplinaPreRequisitos int NOT NULL AUTO_INCREMENT,
	Disciplina_idDisciplina int,
    Prerequisitos_idPreRequisitos int,
    PRIMARY KEY (idDisciplinaPreRequisitos)
);



ALTER TABLE Departamento
ADD FOREIGN KEY (idProfessor_coordenador) REFERENCES Professor(idProfessor);

ALTER TABLE Curso
ADD FOREIGN KEY (Departamento_idDepartamento) REFERENCES Departamento(idDepartamento);

ALTER TABLE Disciplina
ADD FOREIGN KEY (Professor_idProfessor) REFERENCES  Professor(idProfessor);

ALTER TABLE Matriculado
ADD FOREIGN KEY (Disciplina_idDisciplina) REFERENCES  Disciplina(idDisciplina);

ALTER TABLE Matriculado
ADD FOREIGN KEY (Aluno_idAluno) REFERENCES  Aluno(idAluno);

ALTER TABLE Disciplina_Curso
ADD FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina);

ALTER TABLE Disciplina_Curso
ADD FOREIGN KEY (Curso_idCurso) REFERENCES  Curso(idCurso);

ALTER TABLE Disciplina_PreRequisitos
ADD FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina);

ALTER TABLE Disciplina_PreRequisitos
ADD FOREIGN KEY (Prerequisitos_idPreRequisitos) REFERENCES  PreRequisitos(idPreRequisitos);


INSERT INTO Aluno (Nome) VALUES ('João');
INSERT INTO Aluno (Nome) VALUES  ('Mateus');
INSERT INTO Aluno (Nome) VALUES  ('Thiago');
INSERT INTO Aluno (Nome) VALUES  ('Marcos');

INSERT INTO Departamento (Nome, Campus) VALUES ('Desenvolvimento Web', 'Informática');
INSERT INTO Departamento (Nome, Campus) VALUES ('Desenvolvimento Mobile', 'Informática');

INSERT INTO Professor (Nome, professor_idDepartamento, DataAdmissao) VALUES ('Jean Michel', 1, '2024-01-02');
INSERT INTO Professor (Nome, professor_idDepartamento, DataAdmissao) VALUES ('Maria Joaquina', 1, '2024-03-02');

INSERT INTO Disciplina (Nome, Professor_idProfessor) VALUES ('Javascript', 1);
INSERT INTO Disciplina (Nome, Professor_idProfessor) VALUES ('Android', 2);

INSERT INTO Curso (Nome, Departamento_idDepartamento) VALUES ('Criação de Sites com React', 1);
INSERT INTO Curso (Nome, Departamento_idDepartamento) VALUES ('Criação de Aplicativos Android', 2);

INSERT INTO Matriculado (Aluno_idAluno,  Disciplina_idDisciplina, DataMatricula) VALUES (1, 1, '2024-03-01');
INSERT INTO Matriculado (Aluno_idAluno,  Disciplina_idDisciplina, DataMatricula) VALUES (2, 1, '2024-03-01');
INSERT INTO Matriculado (Aluno_idAluno,  Disciplina_idDisciplina, DataMatricula) VALUES (3, 2, '2024-03-01');
INSERT INTO Matriculado (Aluno_idAluno,  Disciplina_idDisciplina, DataMatricula) VALUES (4, 2, '2024-03-01');

INSERT INTO Disciplina_Curso ( Disciplina_idDisciplina,  Curso_idCurso) VALUES (1, 1);
INSERT INTO Disciplina_Curso ( Disciplina_idDisciplina,  Curso_idCurso) VALUES (2, 2);

INSERT INTO PreRequisitos (Nome) VALUES ('Lógica de Programação');
INSERT INTO PreRequisitos (Nome) VALUES ('Tipos de Dados');
INSERT INTO PreRequisitos (Nome) VALUES ('Variáveis');
INSERT INTO PreRequisitos (Nome) VALUES ('Operadores');


INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (1, 1);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (1, 2);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (1, 3);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (1, 4);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (2, 1);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (2, 2);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (2, 3);
INSERT INTO Disciplina_PreRequisitos (Disciplina_idDisciplina, Prerequisitos_idPreRequisitos) VALUES (2, 4);

