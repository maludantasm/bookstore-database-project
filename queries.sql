-- Saber quantos funcionários existem por filial com mais de 3 funcionarios
SELECT Nome, COUNT(*) FROM Filial F
    INNER JOIN Trabalha T ON F.Id = T.FilialId
    GROUP BY Nome
    HAVING COUNT(*) > 3;