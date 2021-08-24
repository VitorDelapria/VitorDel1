CREATE DATABASE bdteste;

USE bdteste;

CREATE TABLE Secretaria Municipal (
	Id INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	endereço VARCHAR(50) NOT NULL,
	 PRIMARY KEY (id)
);

DESC Secretaria Municipal;

CREATE TABLE Licença(
	Id INTEGER NOT NULL,
	Endereço VARCHAR(50),
    PRIMARY KEY(Id, Endereço),
    FOREIGN KEY(Id) REFERENCES Secretaria Municipal(Id),
    FOREIGN KEY(Endereço) REFERENCES Academia (Endereço)
);

DESC Licença;

CREATE TABLE Academia (
	Endereço VARCHAR(50) NOT NULL,
	numero INTEGER NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	 PRIMARY KEY (Endereço)
);

DESC Academia;

CREATE TABLE Instrutor (
	Id-Ins INTEGER NOT NULL,
	Endereço VARCHAR(50) NOT NULL,
	numero INTEGER NOT NULL,
	Gênero VARCHAR(30),
	CPF INTEGER NOT NULL,
	 PRIMARY KEY (Id-Ins)
);

DESC Instrutor;

CREATE TABLE Luta (
	Id-Luta INTEGER NOT NULL,
	TipodeLuta VARCHAR(50) NOT NULL,
	profluta VARCHAR(50) NOT NULL,
	 PRIMARY KEY (Id-Ins)
);

DESC Luta;

CREATE TABLE Instrutor de Apoio (
	IdInsAp INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	CPF INTEGER NOT NULL,
	Endereço VARCHAR(50),
	Gênero VARCHAR(30),
	Id-Luta INTEGER,
	 PRIMARY KEY(dInsAp, Id-Luta),
    FOREIGN KEY(Id-Luta) REFERENCES Luta(Id-Luta),
);

DESC Instrutor de Apoio;

CREATE TABLE Aula(
	Endereço VARCHAR(50),
	IdInsAp INTEGER,
	Id-Ins INTEGER,
	Id-Luta INTEGER NOT NULL,
    PRIMARY KEY(Endereço, IdInsAp, Id-Ins, Id-Luta),
    FOREIGN KEY(Endereço) REFERENCES Academia (Endereço),
    FOREIGN KEY(IdInsAp) REFERENCES Instrutor de Apoio(IdInsAp),
    FOREIGN KEY(Id-Ins) REFERENCES Instrutor(Id-Ins),
    FOREIGN KEY(Id-Luta) REFERENCES Luta(Id-Luta)
);

DESC Aula;

CREATE TABLE Equipamentos (
	Id-equip INTEGER NOT NULL,
	TipoEquip VARCHAR(50) NOT NULL,
	peso INTEGER NOT NULL,
	 PRIMARY KEY (Id-equip)
);

DESC Equipamentos;

CREATE TABLE usar equip(
	Id-Ins INTEGER,
	Id-equip INTEGER,
    PRIMARY KEY(Id-Ins, Id-equip),
    FOREIGN KEY(Id-Ins) REFERENCES Instrutor Municipal(Id-Ins),
    FOREIGN KEY(Id-equip) REFERENCES Equipamentos (Id-equip)
);

DESC usar equip;

CREATE TABLE AcademiaEquipa(
	Endereço VARCHAR(50),
	Id-equip INTEGER,
    PRIMARY KEY(Endereço, Id-equip),
    FOREIGN KEY(Endereço) REFERENCES Academia (Endereço),
    FOREIGN KEY(Id-equip) REFERENCES Equipamentos (Id-equip)
);

DESC AcademiaEquipa;

CREATE TABLE Graduações (
	TipoCor VARCHAR(20) NOT NULL,
	graLuta VARCHAR(50) NOT NULL,
	graAluno VARCHAR(50) NOT NULL,
	 PRIMARY KEY (TipoCor)
);

DESC Graduações;

CREATE TABLE Graduação/Luta(
	Id-Luta INTEGER,
	TipoCor VARCHAR(20),
    PRIMARY KEY(Id-Luta, TipoCor),
    FOREIGN KEY(Id-Luta) REFERENCES Luta(Id-Luta),
    FOREIGN KEY(TipoCor) REFERENCES Graduações (TipoCor)
);

DESC Graduação/Luta;

CREATE TABLE Alunos(
	Id-Aluno INTEGER NOT NULL,
	Endereço VARCHAR(50) NOT NULL,
	numero INTEGER NOT NULL,
	Gênero VARCHAR(30),
	CPF INTEGER NOT NULL,
	Idade INTEGER NOT NULL,
	 PRIMARY KEY (Id-Aluno)
);

DESC Alunos;

CREATE TABLE Graduação/Aluno(
	Id-Luta INTEGER,
	Id-Aluno INTEGER,
    PRIMARY KEY(Id-Luta, Id-Aluno),
    FOREIGN KEY(Id-Luta) REFERENCES Luta(Id-Luta),
    FOREIGN KEY(Id-Aluno) REFERENCES Alunos(Id-Aluno)
);

DESC Graduação/Aluno;

CREATE TABLE Matricula(
	Id-Matricula INTEGER NOT NULL,
	DataMatri VARCHAR(50) NOT NULL,
	NMatricula INTEGER NOT NULL,
	 PRIMARY KEY (Id-Matricula)
);

DESC Matricula;

CREATE TABLE Alunos/Turma(
	Id-Matricula INTEGER,
	Id-Aluno INTEGER,
    PRIMARY KEY(Id-Matricula, Id-Aluno),
    FOREIGN KEY(Id-Matricula) REFERENCES Matricula(Id-Matricula),
    FOREIGN KEY(Id-Aluno) REFERENCES Alunos(Id-Aluno)
);

DESC Alunos/Turma;

CREATE TABLE Turma(
	Id-Turma INTEGER NOT NULL,
	Sala VARCHAR(50) NOT NULL,
	andar INTEGER NOT NULL,
	 PRIMARY KEY (Id-Turma)
);

DESC Turma;

CREATE TABLE Turma/Matricula(
	Id-Matricula INTEGER,
	Id-Turma INTEGER,
    PRIMARY KEY(Id-Matricula, Id-Aluno),
    FOREIGN KEY(Id-Matricula) REFERENCES Matricula(Id-Matricula),
    FOREIGN KEY(Id-Turma) REFERENCES Turma(Id-Turma)
);

DESC Turma/Matricula;

CREATE TABLE Turma/Instrutor(
	Id-Ins INTEGER,
	Id-Turma INTEGER,
    PRIMARY KEY(Id-Ins, Id-Aluno),
    FOREIGN KEY(Id-Ins) REFERENCES Instrutor(Id-Ins),
    FOREIGN KEY(Id-Turma) REFERENCES Turma(Id-Turma)
);

DESC Turma/Instrutor;
