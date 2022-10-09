CREATE TABLE Cliente (
    CPF VARCHAR(11),
    Nome VARCHAR(32) NOT NULL,
    Email VARCHAR(256) UNIQUE NOT NULL,
    Logradouro VARCHAR(256) NOT NULL,
    Cidade VARCHAR(32) NOT NULL,
    Bairro VARCHAR(32) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    ContatoTelefone CHAR(10),
    ContatoCelular CHAR(11) NOT NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY (CPF)
);

CREATE TABLE Funcionario (
    CPF VARCHAR(11),
    Nome VARCHAR(32) NOT NULL,
    Email VARCHAR(256) UNIQUE NOT NULL,
    Logradouro VARCHAR(256) NOT NULL,
    Cidade VARCHAR(32) NOT NULL,
    Bairro VARCHAR(32) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    ContatoTelefone CHAR(10),
    ContatoCelular CHAR(11) NOT NULL,
    Admissao DATE NOT NULL,
    Salario NUMBER NOT NULL,
    SupervisorCPF VARCHAR(11),
    SerialEquipamento VARCHAR(32) UNIQUE,
    CONSTRAINT PK_Funcionarios PRIMARY KEY (CPF),
    CONSTRAINT FK_Supervisor FOREIGN KEY (SupervisorCPF)
        REFERENCES Funcionario (CPF)
);

CREATE TABLE Categoria (
    Id NUMBER,
    Nome VARCHAR(32) NOT NULL,
    CONSTRAINT PK_Categorias PRIMARY KEY (Id)
);

CREATE TABLE Livro (
    ISBN VARCHAR(17),
    Titulo VARCHAR(256) NOT NULL,
    Ano NUMBER(4),
    CategoriaId NUMBER,
    CONSTRAINT PK_Livros PRIMARY KEY (ISBN),
    CONSTRAINT FK_CategoriaLivro FOREIGN KEY (CategoriaId)
        REFERENCES Categoria (Id)
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

CREATE TABLE EmbalagemPresente (
    Id NUMBER,
    Tipo NUMBER NOT NULL,
    Valor NUMBER NOT NULL,
    CONSTRAINT PK_EmbalagemPresente PRIMARY KEY (Id)
);

CREATE TABLE Pedido (
    CPF VARCHAR(11),
    Horario TIMESTAMP,
    CONSTRAINT PK_Pedidos PRIMARY KEY (CPF, Horario),
    CONSTRAINT FK_Clientes FOREIGN KEY (CPF)
        REFERENCES Cliente (CPF)
);

CREATE TABLE Compra (
    CPF VARCHAR(11),
    ISBN VARCHAR(17),
    Horario TIMESTAMP,
    Quantidade NUMBER NOT NULL,
    EmbalagemPresenteId NUMBER,
    CONSTRAINT PK_Compras PRIMARY KEY (CPF, ISBN, Horario),
    CONSTRAINT FK_CompraPedidos FOREIGN KEY (CPF, Horario)
        REFERENCES Pedido (CPF, Horario),
    CONSTRAINT FK_CompraLivros FOREIGN KEY (ISBN)
        REFERENCES Livro (ISBN),
    CONSTRAINT FK_PedidoEmbalagemPresente FOREIGN KEY (EmbalagemPresenteId)
        REFERENCES EmbalagemPresente (Id)
);

CREATE TABLE Cataloga (
    ISBN VARCHAR(17),
    AutorId NUMBER,
    EditoraId NUMBER,
    Preco NUMBER NOT NULL,
    Unidades NUMBER NOT NULL,
    CONSTRAINT PK_Catalogo PRIMARY KEY (ISBN, AutorId, EditoraId),
    CONSTRAINT FK_CatalogoLivros FOREIGN KEY (ISBN)
        REFERENCES Livro (ISBN),
    CONSTRAINT FK_CatalogoAutores FOREIGN KEY (AutorId)
        REFERENCES Autor (Id),
    CONSTRAINT FK_CatalogoEditoras FOREIGN KEY (EditoraId)
        REFERENCES Editora (Id)
);

CREATE SEQUENCE Categoria_Seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE EmbalagemPresente_Seq
START WITH 1
INCREMENT BY 1;