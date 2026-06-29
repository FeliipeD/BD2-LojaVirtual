-- Inserindo categorias
INSERT INTO categorias (nome) VALUES ('Eletrônicos'), ('Informática'), ('Acessórios');

-- Inserindo produtos
INSERT INTO produtos (id_categoria, nome, preco, estoque) VALUES 
(1, 'Smartphone XYZ', 1500.00, 50),
(2, 'Notebook Pro', 4500.00, 20),
(3, 'Mouse Sem Fio', 120.00, 100),
(1, 'Fone de Ouvido Bluetooth', 300.00, 75);

-- Inserindo clientes
INSERT INTO clientes (nome, email, cpf) VALUES 
('Felipe da Costa Morais', 'felipe.morais@hotmail.com', '111.111.111-11'),
('Bruno dos Santos Moreira', 'bruno.moreira@hotmail.com', '222.222.222-22'),
('Alysson Pina', 'alysson.pina@hotmail.com', '333.333.333-33'),
('Silvia Rissino', 'silvia.rissino@hotmail.com', '444.444.444-44');

-- Inserindo pedidos e itens
INSERT INTO pedidos (id_cliente, total) VALUES (1, 1620.00);
INSERT INTO pedidos (id_cliente, total) VALUES (2, 4500.00);
INSERT INTO pedidos (id_cliente, total) VALUES (3, 120.00);
INSERT INTO pedidos (id_cliente, total) VALUES (4, 4800.00);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 1, 1500.00), -- 1 Smartphone
(1, 3, 1, 120.00),  -- 1 Mouse
(2, 2, 1, 4500.00), -- 1 Notebook
(3, 3, 1, 120.00), -- 1 Mouse
(4, 2, 1, 4500.00), -- 1 Notebook
(4, 4, 1, 300.00); -- 1 Fone de Ouvido Bluetooth