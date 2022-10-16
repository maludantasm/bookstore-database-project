-- Saber quantos funcionários existem por seção com mais de 3 funcionarios
SELECT Nome, COUNT(*) FROM Secao S
    INNER JOIN Trabalha T ON S.Id = T.SecaoId
    GROUP BY Nome
    HAVING COUNT(*) > 3;

-- Saber, a partir do CPF, quais livros uma pessoa comprou
SELECT Titulo FROM Livro L WHERE ISBN IN (
    SELECT ISBN
    FROM Compra
    WHERE CPF = '20981209076'
);

-- Listar a quantidade de livros por categoria
SELECT C.Nome, COUNT(*) FROM Categoria C
    INNER JOIN Livro L
    ON C.Id = L.CategoriaId
    GROUP BY C.Nome;

-- Listar o ISBN dos livros que foram comprados
SELECT L.Titulo FROM Livro L WHERE L.ISBN IN (
    SELECT ISBN FROM Compra
);

SELECT L.Titulo FROM Livro L WHERE EXISTS (
    SELECT * FROM Compra C WHERE C.ISBN = L.ISBN
);

-- Listar o ISBN dos livros que não foram comprados
SELECT L.Titulo FROM Livro L WHERE L.ISBN NOT IN (
    SELECT ISBN FROM Compra
);

SELECT L.Titulo FROM Livro L WHERE NOT EXISTS (
    SELECT * FROM Compra C WHERE C.ISBN = L.ISBN
);