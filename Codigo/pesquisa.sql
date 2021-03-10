SELECT CPF_Paciente FROM Paciente

INSERT INTO Paciente(nome) FROM VALUES ('Pedro')

INSERT INTO Paciente(nome) FROM VALUES ('Raí')

INSERT INTO Funcionario(nome) FROM VALUES ('Diego')

INSERT INTO Funcionario(matricula) FROM VALUES ('123000')

SELECT * FROM Paciente
DELETE Paciente WHERE CPF_Paciente = '3'

SELECT * FROM Hospital
DELETE Hospital WHERE Codigo_Hospital = '1'

DROP TABLE Funcionario

DROP TABLE Internacoes

DROP DATABASE database_Hospitais