-- Saber quantos funcionários existem por seção com mais de 3 funcionarios
SELECT Nome, COUNT(*) FROM Secao S
    INNER JOIN Trabalha T ON S.Id = T.SecaoId
    GROUP BY Nome
    HAVING COUNT(*) > 3;