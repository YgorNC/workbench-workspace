CREATE SCHEMA Escola;
USE escola;

CREATE TABLE ENDERECO (
CodigoEnd INT PRIMARY KEY,
LogradouroEnd VARCHAR(45) NOT NULL,
NumeroEnd VARCHAR(45) NOT NULL,
BairroEnd VARCHAR(45) NOT NULL,
CidadeEnd VARCHAR(45) NOT NULL,
EstadoEnd VARCHAR(45) NOT NULL
);

CREATE TABLE TELEFONE (
CodigoTel INT PRIMARY KEY NOT NULL,
NumeroTel VARCHAR(15) NOT NULL
);

CREATE TABLE Curso(
CodigoCurso INT PRIMARY KEY,
NomCurso VARCHAR(45) NOT NULL,
SiglaCurso VARCHAR(10) NOT NULL
);

CREATE TABLE Aluno (
MatriculaAluno INT PRIMARY KEY,
NomeAluno VARCHAR (45) NOT NULL,
FiliacaoAluno VARCHAR(45) NOT NULL,
DataNascAluno DATE NOT NULL,
CodigoTel INT NOT NULL,
CodigoCurso INT NOT NULL,
CodigoEnd INT,
FOREIGN KEY (CodigoCurso) REFERENCES Curso (CodigoCurso),
FOREIGN KEY (CodigoEnd) REFERENCES Endereco (CodigoEnd),
FOREIGN KEY (CodigoTel) REFERENCES TELEFONE (CodigoTel)
);

CREATE TABLE Departamento (
CodigoDepartamento INT PRIMARY KEY,
DenominacaoDepartamento VARCHAR(45) NOT NULL
);

CREATE TABLE Disciplina (
CodigoDisciplina INT PRIMARY KEY,
DenominacaoDisciplina VARCHAR(45) NOT NULL,
SiglaDisciplica CHAR(3) NOT NULL,
EmentaDisciplina VARCHAR(45) NOT NULL,
CodigoDepartamento INT NOT NULL,
FOREIGN KEY (CodigoDepartamento) REFERENCES Departamento (CodigoDepartamento)
);

CREATE TABLE Professor(
CodigoProfessor INT PRIMARY KEY,
NomeProfessor VARCHAR(45) NOT NULL,
FormacaoProfessor VARCHAR(45) NOT NULL,
CodigoDepartamento  INT NOT NULL,
CodigoEnd INT,
CodigoTel INT NOT NULL,
FOREIGN KEY (CodigoDepartamento ) REFERENCES Departamento (CodigoDepartamento),
FOREIGN KEY (CodigoEnd) REFERENCES Endereco (CodigoEnd),
FOREIGN KEY (CodigoTel) REFERENCES TELEFONE (CodigoTel)
);

CREATE TABLE PROFESSOR_LECIONA_DISCIPLINAS (
CodigoProfessor INT,
CodigoDisciplina INT,
primary key (CodigoProfessor,CodigoDisciplina),
FOREIGN KEY (CodigoProfessor) references Professor (CodigoProfessor),
FOREIGN KEY (CodigoDisciplina) references Disciplina (CodigoDisciplina)
);

CREATE TABLE DISCIPLINA_HAS_CURSO (
CodigoDisciplina INT,
CodigoCurso INT,
primary key (CodigoDisciplina,CodigoCurso),
FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina (CodigoDisciplina),
FOREIGN KEY (CodigoCurso) REFERENCES Curso (CodigoCurso)
);

