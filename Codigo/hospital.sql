CREATE DATABASE Hospitais;
USE Hospitais;

CREATE TABLE Hospital(
    Codigo_Hospital INT NOT NULL,
    Nome VARCHAR(40),
    Endereço VARCHAR(40),
    Cidade VARCHAR(40);
    Telefone VARCHAR(40),
    CONSTRAINT pk_Codigo_Hospital PRIMARY KEY(Codigo_Hospital)
)

CREATE TABLE Cidade(
    Nome VARCHAR(40),
    Unidade VARCHAR(40),
    Codigo_Hospital INT NOT NULL,
    Codigo_Cidade INT NOT NULL,
    CONSTRAINT pk_Codigo_Cidade PRIMARY KEY(Codigo_Cidade)
    CONSTRAINT fk_Codigo_Hospital FOREIGN KEY(Codigo_Hospital) REFERENCES Hospital(Codigo_Hospital)
)

CREATE TABLE Estado(
    Nome VARCHAR(40),
    Codigo_Hospital INT NOT NULL,
    Codigo_Estado INT NOT NULL,
    Codigo_Cidade INT NOT NULL,
    CONSTRAINT pk_Codigo_Estado PRIMARY KEY(Codigo_Estado)
    CONSTRAINT fk_Codigo_Cidade FOREIGN KEY(Codigo_Cidade) REFERENCES Cidade(Codigo_Cidade)
    CONSTRAINT fk_Codigo_Hospital FOREIGN KEY(Codigo_Hospital) REFERENCES Hospital(Codigo_Hospital)
)

CREATE TABLE Funcionario(
    Matricula_Funcionario INT NOT NULL,
    Nome VARCHAR(40),
    Endereço VARCHAR(40),
    Cidade VARCHAR(40),
    Telefone_Funcionario VARCHAR(40),
    CONSTRAINT pk_Matricula_Funcionario PRIMARY KEY(Matricula_Funcionario)
)

CREATE TABLE Medico(
    CRM INT NOT NULL,
    Matricula_Funcionario INT NOT NULL,
    CONSTRAINT pk_CRM PRIMARY KEY(CRM)
    CONSTRAINT fk_Matricula_Funcionario FOREIGN KEY(Matricula_Funcionario) REFERENCES Funcionario(Matricula_Funcionario)
)

CREATE TABLE Enfermeiro(
    Registro INT NOT NULL,
    Matricula_Funcionario INT NOT NULL,
    CONSTRAINT pk_Registro PRIMARY KEY(Registro)
    CONSTRAINT fk_Matricula_Funcionario FOREIGN KEY(Matricula_Funcionario) REFERENCES Funcionario(Matricula_Funcionario)
)

CREATE TABLE Paciente(
    CPF_Paciente INT NOT NULL,
    Codigo_Hospital INT NOT NULL,
    Nome VARCHAR(40),
    Endereço VARCHAR(40),
    Cidade VARCHAR(40),
    CONSTRAINT pk_CPF_Paciente PRIMARY KEY(CPF_Paciente)
    CONSTRAINT fk_Codigo_Hospital FOREIGN KEY(Codigo_Hospital) REFERENCES Hospital(Codigo_Hospital)
)

CREATE TABLE Plano(
    CPF_Paciente INT NOT NULL,
    Codigo_Plano INT NOT NULL,
    Validade VARCHAR(10),
    Cobertura VARCHAR(10),
    CONSTRAINT pk_Codigo_Plano PRIMARY KEY(Codigo_Plano)
    CONSTRAINT fk_CPF_Paciente FOREIGN KEY(CPF_Paciente) REFERENCES Paciente(CPF_Paciente)
)

CREATE TABLE Medicamento(
    Codigo_Medicamento INT NOT NULL,
    Contraindicacao VARCHAR(40),
    Preco VARCHAR(40),
    Tipo VARCHAR(10),
    CONSTRAINT pk_Codigo_Medicamento PRIMARY KEY(Codigo_Medicamento)
    CONSTRAINT fk_Codigo_Consulta FOREIGN KEY(Codigo_Consulta) REFERENCES Consulta(Codigo_Consulta)
)

CREATE TABLE Exame(
    Codigo_Exame INT NOT NULL,
    Valor INT NOT NULL,
    Descricao VARCHAR(100),
    CONSTRAINT pk_Codigo_Exame PRIMARY KEY(Codigo_Exame)
    CONSTRAINT fk_Codigo_Consulta FOREIGN KEY(Codigo_Consulta) REFERENCES Consulta(Codigo_Consulta)
)

CREATE TABLE Internacao(
    Codigo_Internacao INT NOT NULL,
    Data_hora VARCHAR(40),
    CONSTRAINT pk_Codigo_Internacao PRIMARY KEY(Codigo_Internacao)
    CONSTRAINT fk_Codigo_Hospital FOREIGN KEY(Codigo_Hospital) REFERENCES Hospital(Codigo_Hospital)
)

CREATE TABLE Consulta(
    Codigo_Consulta INT NOT NULL,
    CONSTRAINT pk_Codigo_Consulta PRIMARY KEY(Codigo_Consulta)
    CONSTRAINT fk_CPF_Paciente FOREIGN KEY(CPF_Paciente) REFERENCES Paciente(CPF_Paciente)
    CONSTRAINT fk_Codigo_Internacao FOREIGN KEY(Codigo_Internacao) REFERENCES Internacao(Codigo_Internacao)
    CONSTRAINT fk_CRM FOREIGN KEY(CRM) REFERENCES Medico(CRM)
    CONSTRAINT fk_Codigo_Medicamento FOREIGN KEY(Codigo_Medicamento) REFERENCES Medicamento(Codigo_Medicamento)
    CONSTRAINT fk_Codigo_Exame FOREIGN KEY(Codigo_Exame) REFERENCES Exame(Codigo_Exame)
)