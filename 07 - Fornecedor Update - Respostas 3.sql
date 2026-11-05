DROP TABLE IF EXISTS Pacote;

CREATE TABLE Pacote (
    id          INT AUTO_INCREMENT,
    destino     VARCHAR(100) NOT NULL,
    preco       DECIMAL(10,2) NOT NULL,
    vagas       INT NOT NULL,
    ativo       BOOLEAN NOT NULL DEFAULT 1,  -- 1/TRUE = ativo, 0/FALSE = inativo
    PRIMARY KEY (id)
);

INSERT INTO Pacote (id, destino, preco, vagas, ativo) VALUES
(1, 'Rio de Janeiro - RJ',      1200.00, 10, 1),
(2, 'Fernando de Noronha - PE', 4500.00,  5, 1),
(3, 'Gramado - RS',              980.00, 15, 1),
(4, 'Foz do Iguacu - PR',       1350.00,  8, 1),
(5, 'Bonito - MS',              2100.00,  0, 1),
(6, 'Salvador - BA',            1100.00, 12, TRUE);

UPDATE Pacote
SET ativo = 0
WHERE destino = 'Bonito - MS';
-- ou: WHERE vagas = 0;

UPDATE Pacote
SET preco = preco * 1.10
WHERE vagas > 10;

UPDATE Pacote
SET preco = preco * 0.85
WHERE destino LIKE '%RS%'
OR destino LIKE '%PR%';

UPDATE Pacote
SET vagas = vagas - 1
ORDER BY preco ASC
LIMIT 1;

SELECT * FROM Pacote;