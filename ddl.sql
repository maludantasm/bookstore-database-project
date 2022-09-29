CREATE TABLE Cliente (
    CPF VARCHAR(11),
    Nome VARCHAR(32) NOT NULL,
    Email UNIQUE NOT NULL,
    EndRua VARCHAR(256),
    EndNumero NUMBER,
    EndBairro VARCHAR(32),
    EndEstado CHAR(2),
    CEP CHAR(8),
    DDD1 CHAR(2),
    DD2 CHAR(2),
    Telefone1 NUMBER(9),
    Telefone2 NUMBER(9),
    CONSTRAINT PK_Clientes PRIMARY KEY (CPF),
);

CREATE TABLE Funcionario (
    CPF VARCHAR(11),
    Nome VARCHAR(32) NOT NULL,
    Email UNIQUE NOT NULL,
    EndRua VARCHAR(256),
    EndNumero NUMBER,
    EndBairro VARCHAR(32),
    EndEstado CHAR(2),
    CEP CHAR(8),
    DDD1 CHAR(2),
    DD2 CHAR(2),
    Telefone1 NUMBER(9),
    Telefone2 NUMBER(9),
    Salario NUMBER(6,2),
    Admissao DATE,
    CONSTRAINT PK_Clientes PRIMARY KEY (CPF),
);

CREATE TABLE Envio (
    Codigo NUMBER(12),
    Situacao NUMBER(1) DEFAULT 1,
    Frete NUMBER(6,2),
    CPF VARCHAR(11),
    Numero NUMBER,
    CONSTRAINT PK_Envios PRIMARY KEY (Codigo),
    CONSTRAINT FK_Clientes FOREIGN KEY (Cliente)
        REFERENCES Cliente (CPF),
    CONSTRAINT FK_Compras FOREIGN KEY (Numero)
        REFERENCES Compra (Numero),
);

CREATE TABLE Livro (
    ISBN NUMBER(13),
    Titulo VARCHAR(256) NOT NULL,
    Descricao VARCHAR(256),
    Categoria VARCHAR(32),
    Ano NUMBER(4),
    Preco NUMBER(6,2) NOT NULL,
    CONSTRAINT PK_Livros PRIMARY KEY (ISBN)
);

CREATE TABLE Autor (
    Id NUMBER,
    Nome VARCHAR(32) NOT NULL,
    Biografia VARCHAR(256),
    CONSTRAINT PK_Autores PRIMARY KEY (Id)
);

CREATE TABLE Editora (
    Id NUMBER,
    Nome VARCHAR(32) NOT NULL,
    CONSTRAINT PK_Editoras PRIMARY KEY (Id)
);

CREATE TABLE Avaliacao (
    CPF VARCHAR(11),
    ISBN VARCHAR(13),
    Score NUMBER(1) NOT NULL DEFAULT 1,
    CONSTRAINT PK_Avaliacoes PRIMARY KEY (CPF, ISBN),
    CONSTRAINT FK_Clientes FOREIGN KEY (CPF)
        REFERENCES Cliente (CPF),
    CONSTRAINT FK_Livros FOREIGN KEY (ISBN)
        REFERENCES Livro (ISBN),
);

CREATE TABLE Compra (
    CPF VARCHAR(11),
    ISBN NUMBER(13),
    Numero NUMBER NOT NULL,
    Situacao NUMBER(1),
    DataCompra DATA NOT NULL,
    CONSTRAINT PK_Avaliacoes PRIMARY KEY (CPF, ISBN),
    CONSTRAINT FK_Clientes FOREIGN KEY (CPF)
        REFERENCES Cliente (CPF),
    CONSTRAINT FK_Livros FOREIGN KEY (ISBN)
        REFERENCES Livro (ISBN),
);

CREATE TABLE Cataloga (
    CPF VARCHAR(11),
    ISBN NUMBER(13),
    Id NUMBER,
    CONSTRAINT PK_Avaliacoes PRIMARY KEY (CPF, ISBN, Id),
    CONSTRAINT FK_Livros FOREIGN KEY (ISBN)
        REFERENCES Livro (ISBN),
    CONSTRAINT FK_Autores FOREIGN KEY (Id)
        REFERENCES Autor (Id),
    CONSTRAINT FK_Editoras FOREIGN KEY (CPF)
        REFERENCES Editora (Id),
);

CREATE TABLE Supervisiona (
    CPF_1 VARCHAR(11),
    CPF_2 VARCHAR(11),
    CONSTRAINT PK_Supervisores PRIMARY KEY (CPF_1),
    CONSTRAINT FK_Funcionarios FOREIGN KEY (CPF_1)
        REFERENCES Funcionario (CPF),
    CONSTRAINT FK_Funcionarios FOREIGN KEY (CPF_2)
        REFERENCES Funcionario (CPF),
);