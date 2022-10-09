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

CREATE TABLE Departamento (
    Id NUMBER,
    Nome VARCHAR(32) NOT NULL UNIQUE,
    CONSTRAINT PK_Departamentos PRIMARY KEY (Id)
);

CREATE TABLE Filial (
    Id NUMBER,
    Nome VARCHAR(32) NOT NULL UNIQUE,
    CONSTRAINT PK_Filial PRIMARY KEY (Id)
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

CREATE TABLE Trabalha (
    CPF VARCHAR(11),
    DeptoId NUMBER NOT NULL,
    FilialId NUMBER NOT NULL,
    CONSTRAINT PK_Trabalha PRIMARY KEY (CPF),
    CONSTRAINT FK_TrabalhaDepartamento FOREIGN KEY (DeptoId)
        REFERENCES Departamento (Id),
    CONSTRAINT FK_TrabalhaFilial FOREIGN KEY (FilialId)
        REFERENCES Filial (Id),
    CONSTRAINT FK_TrabalhaFuncionario FOREIGN KEY (CPF)
        REFERENCES Funcionario (CPF)
);

CREATE SEQUENCE Categoria_Seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE EmbalagemPresente_Seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Depto_Seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Filial_Seq
START WITH 1
INCREMENT BY 1;


INSERT INTO Cliente VALUES ('20981209076', 'Carolina Ribeiro da Silva', 'carolrs@example.com', 'Rua 21, n. 213', 'Monte Azul', 'Renascença', 'PI', '39400265', NULL, '81999715334');
INSERT INTO Cliente VALUES ('80773763040', 'João Vitor Silveira', 'joaovs@example.com', 'Rua 713, n. 7', 'Campo Pequeno', 'Colombo', 'PR', '83404700', NULL, '81999717344');
INSERT INTO Cliente VALUES ('72728970076', 'Gustavo Henrique Monteiro', 'gugamonte@example.com', 'Rua Dezessete, n. 17', 'Barra Mansa', 'Salto Grande', 'SP', '17734160', NULL, '81999718334');
INSERT INTO Cliente VALUES ('94610096072', 'Joana Lopes', 'joanalopes@example.com', 'Rua do Sol, n. 162', 'Presidente Prudente', 'Casa Nova', 'SC', '77303201', NULL, '81999912334');
INSERT INTO Cliente VALUES ('64984467061', 'Jose Fernando da Cunha', 'zecunha@example.com', 'Rua 22, n. 313', 'Santa Cruz', 'Prudente', 'SP', '19034170', NULL, '81999712334');
INSERT INTO Cliente VALUES ('01665061090', 'Raquel da Cruz', 'raquelcruz@example.com', 'Rua do Sol, n. 277', 'Recife', 'Cordeiro', 'PE', '56321181', NULL, '81999722334');
INSERT INTO Cliente VALUES ('02329445040', 'Maria Eduarda Castro', 'dudacastro@example.com', 'Rua Curitiba, n. 123', 'Recife', 'Cordeiro', 'PE', '56321161', NULL, '81999742334');

INSERT INTO Funcionario VALUES ('94161558023', 'Pietra Ribeiro Camargo', 'pietracamargo@example.com', 'Rua do Sol, n. 43', 'Recife', 'Cordeiro', 'PE', '56321181', NULL, '81988123456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 3830.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('08953368049', 'Giovanna Mendes dos Santos', 'gisantos@example.com', 'Rua da Esmeralda, n. 57', 'Camaragibe', 'Aldeira', 'PE', '54789010', NULL, '81988223456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 4813.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('64749687022', 'Rodrigo Vieira da Silva', 'rodrigovieira@example.com', 'Rua das Palmeiras, n. 517', 'Camaragibe', 'Aldeira', 'PE', '54689011', NULL, '81988323456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, '08953368049', 'RAX12345789');
INSERT INTO Funcionario VALUES ('06605717066', 'Olivia Peixoto da Costa', 'oliviapeixoto@example.com', 'Rua Curitiba, n. 333', 'Recife', 'Cordeiro', 'PE', '56321161', NULL, '81988425346', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('47299667088', 'Rafaela Gomes de Carvalho', 'rafacarvalho@example.com', 'Rua Mar Vermelho, n. 51', 'Petrolina', 'Antonio Cassimiro', 'PE','57127503', NULL, '81988423456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('13914914084', 'Ana Beatriz da Silva Mota', 'anabeamota@example.com', 'Rua Mar Vermelho, n. 123', 'Petrolina', 'Antonio Cassimiro', 'PE', '57127503', NULL, '81988523456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('43488377083', 'João Felipe Silva', 'joaofelipes@example.com', 'Rua Mar Vermelho, n. 430', 'Petrolina', 'Antonio Cassimiro', 'PE', '55127404', NULL, '81988623456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, '08953368049', 'RAX12345788');
INSERT INTO Funcionario VALUES ('51748811045', 'Luiz Gustavo Martins', 'gugaluiz@example.com', 'Rua Cinco, n. 13', 'Olinda', 'Alto da Bondade', 'PE', '57136503', NULL, '81988723456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2712.00, '08953368049', 'RAX12345787');
INSERT INTO Funcionario VALUES ('77391195049', 'Davi Lucca Barbosa', 'davilucca@example.com', 'Rua Gibraltar, n. 23', 'Olinda', 'Alto da Maldade', 'PE', '57136504', NULL, '81988823456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2512.00, '08953368049', 'RAX12345786');
INSERT INTO Funcionario VALUES ('82156117020', 'Ana Clara dos Santos', 'anaclara@example.com', 'Rua Boa Volta, n. 213', 'Boa Viagem', 'Vila Holanda', 'PE', '59170720', NULL, '81988923456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, NULL, NULL);
INSERT INTO Funcionario VALUES ('58674398014', 'Nicole Caldeira', 'nicolecaldeira@example.com', 'Rua da Videira, n. 430', 'Recife', 'Cordeiro', 'PE', '57045107', NULL, '81988133456', TO_DATE('16/02/2022', 'DD/MM/YYYY'), 2812.00, NULL, NULL);

INSERT INTO Departamento VALUES (Depto_Seq.NextVal, 'TI');
INSERT INTO Departamento VALUES (Depto_Seq.NextVal, 'Almoxarifado');
INSERT INTO Departamento VALUES (Depto_Seq.NextVal, 'RH');

INSERT INTO Filial VALUES (Filial_Seq.NextVal, 'A');
INSERT INTO Filial VALUES (Filial_Seq.NextVal, 'B');
INSERT INTO Filial VALUES (Filial_Seq.NextVal, 'C');

INSERT INTO EmbalagemPresente VALUES (EmbalagemPresente_Seq.NextVal, 1, 50.00);
INSERT INTO EmbalagemPresente VALUES (EmbalagemPresente_Seq.NextVal, 2, 25.00);
INSERT INTO EmbalagemPresente VALUES (EmbalagemPresente_Seq.NextVal, 3, 30.00);

INSERT INTO Categoria VALUES (Categoria_Seq.NextVal, 'Programação');
INSERT INTO Categoria VALUES (Categoria_Seq.NextVal, 'Matemática');

INSERT INTO Livro VALUES ('978-85-123-1400-5', 'Modelagem de Banco de Dados', 2019, 1);
INSERT INTO Livro VALUES ('978-85-456-2400-6', 'Manual de Referencia do Python', 2022, 1);
INSERT INTO Livro VALUES ('978-85-789-3400-7', 'Princípios de Programação Funcional', 2022, 1);
INSERT INTO Livro VALUES ('978-85-321-4400-8', 'Orientação à Objetos Desmitificada', 2022, 1);
INSERT INTO Livro VALUES ('978-85-654-5400-9', 'GO: A linguagem do Google', 2017, 1);
INSERT INTO Livro VALUES ('978-85-987-6400-4', 'Programando em Rust', 2017, 1);
INSERT INTO Livro VALUES ('978-85-231-7400-2', 'Rust para Programadores C++', 2013, 1);
INSERT INTO Livro VALUES ('978-85-564-8400-5', 'C# para programadores Java', 2019, 1);
INSERT INTO Livro VALUES ('978-85-897-9400-3', 'Matemática Discreta: Uma abordagem simplificada', 2021, 2);

INSERT INTO Trabalha VALUES ('94161558023', 1, 1);
INSERT INTO Trabalha VALUES ('08953368049', 1, 1);
INSERT INTO Trabalha VALUES ('06605717066', 1, 1);
INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
INSERT INTO Trabalha VALUES ('77391195049', 1, 2);

-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);

-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);
-- INSERT INTO Trabalha VALUES ('82156117020', 1, 1);

INSERT INTO Pedido VALUES ('20981209076', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pedido VALUES ('64984467061', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pedido VALUES ('02329445040', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pedido VALUES ('01665061090', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pedido VALUES ('80773763040', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pedido VALUES ('94610096072', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Compra VALUES ('20981209076', '978-85-123-1400-5', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('20981209076', '978-85-456-2400-6', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('20981209076', '978-85-321-4400-8', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, 2);
INSERT INTO Compra VALUES ('64984467061', '978-85-231-7400-2', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('02329445040', '978-85-897-9400-3', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('02329445040', '978-85-987-6400-4', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('01665061090', '978-85-564-8400-5', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, 2);
INSERT INTO Compra VALUES ('01665061090', '978-85-123-1400-5', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('01665061090', '978-85-231-7400-2', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('01665061090', '978-85-987-6400-4', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('80773763040', '978-85-321-4400-8', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);
INSERT INTO Compra VALUES ('94610096072', '978-85-456-2400-6', TO_TIMESTAMP('2022-07-02 16:14:23', 'YYYY-MM-DD HH24:MI:SS'), 1, NULL);