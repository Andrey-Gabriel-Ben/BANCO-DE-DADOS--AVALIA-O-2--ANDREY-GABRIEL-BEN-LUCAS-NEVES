USE LOJA_INFORMATICA;

-- 1. CATEGORIA
INSERT INTO CATEGORIA (DESCRICAO) VALUES 
('Periféricos'), ('Hardware'), ('Armazenamento'), ('Acessórios Celular'), ('Serviços');

-- 2. Tabela FORNECEDOR 
INSERT INTO FORNECEDOR (CNPJ, EMAIL, TELEFONE) VALUES 
('12345678000101', 'vendas@blutechdistribuidora.com.br', '4733221010'), -- Blumenau (Polo de TI)
('98765432000102', 'contato@itajaiimport.com.br', '4733442020'),        -- Itajaí (Importação de peças)
('11222333000103', 'comercial@gasparpecas.com.br', '4733320000'),      -- Gaspar (Fornecedor local)
('44555666000104', 'suporte@valesupply.com.br', '4733510000'),          -- Brusque
('77888999000105', 'atendimento@santacatarinatech.com', '4832220000');  -- Florianópolis

-- 3. Tabela ENDERECO 
INSERT INTO ENDERECO (CEP, RUA, NUMERO) VALUES 
('89110001', 'Rua Coronel Aristiliano Ramos', 150), -- Centro, Gaspar
('89114442', 'Rua Itajaí', 1200),                   -- Sete de Setembro, Gaspar
('89010000', 'Rua XV de Novembro', 500),            -- Centro, Blumenau
('89112020', 'Rua Anfilóquio Nunes Pires', 88),     -- Figueira, Gaspar
('88350000', 'Avenida Cônsul Carlos Renaux', 10);    -- Centro, Brusque

-- 4. CLIENTE
INSERT INTO CLIENTE (NOME, TELEFONE, E_MAIL, CPF_CNPJ, TIPO) VALUES 
('Andrey', '47991234567', 'andrey@email.com', '12345678901', 'FÍSICA'),
('Empresa XYZ', '4733221100', 'financeiro@xyz.com.br', '10200300000199', 'JURÍDICA'),
('Maria Silva', '48988776655', 'maria.silva@web.com', '09876543210', 'FÍSICA'),
('Tech Solutions', '1133445566', 'contato@techsol.com', '50600700000188', 'JURÍDICA'),
('João Pereira', '47984433221', 'joao.p@gmail.com', '55566677788', 'FÍSICA');

-- 5. PAGAMENTO
INSERT INTO PAGAMENTO (CRIACAO, VENCIMENTO, TIPO, STATUS) VALUES -- Para casos reais de conversa do usuário com a aplicação e dela com banco usaríamos STR_TO_DATE(‘data/srtring/aqui, '%d/%m/%Y')
('2026-04-01', '2026-04-01', 'PIX', 'REALIZADO'),
('2026-04-10', '2026-05-10', 'CARTÃO', 'PENDENTE'),
('2026-04-15', '2026-04-15', 'DINHEIRO', 'REALIZADO'),
('2026-04-20', '2026-04-25', 'BOLETO', 'RECUSADO'),
('2026-04-28', '2026-04-28', 'DÉPOSITO', 'REALIZADO');

-- 6. PRODUTO
INSERT INTO PRODUTO (NOME, QTD_ESTOQUE, PRECO_VENDA, ID_CATEGORIA) VALUES 
('Mouse Gamer RGB', 15, 120.00, 1),
('SSD 480GB Kingston', 20, 250.00, 3),
('Memória RAM 8GB DDR4', 10, 180.00, 2),
('Cabo USB-C 2 metros', 50, 45.00, 4),
('Teclado Mecânico Switch Blue', 8, 350.00, 1);

-- 7. PEDIDO
INSERT INTO PEDIDO (VALOR_TOTAL, DATA, STATUS, NFE, ID_CLIENTE, ID_PAGAMENTO, ID_ENDERECO) VALUES 
(120.00, '2026-04-01', 'CONCLUIDO', '000001', 1, 1, 1),
(500.00, '2026-04-10', 'AGUARDANDO', '000002', 2, 2, 2),
(180.00, '2026-04-15', 'FINALIZADO', '000003', 3, 3, 3),
(350.00, '2026-04-20', 'NOVO', NULL, 4, 4, 4),
(45.00, '2026-04-28', 'CONCLUIDO', '000005', 5, 5, 5);

-- 8. ORDEM_DE_SERVICO
INSERT INTO ORDEM_DE_SERVICO (STATUS, DIAGNOSTICO_TECNICO, APARELHO, SERIAL_NUMBER, DESCRICAO_PROBLEMA, ENTRADA, SAIDA, VALOR_TOTAL, ID_CLIENTE, ID_PAGAMENTO) VALUES 
('CONCLUIDO', 'Limpeza interna e troca de pasta térmica', 'Notebook Dell Vostro', 'DELL12345', 'Superaquecimento', '2026-04-01', '2026-04-02', 150.00, 1, 1),
('AGUARDANDO', 'Aguardando chegada da tela frontal', 'iPhone 13', 'IPH998877', 'Tela quebrada', '2026-04-10', NULL, 850.00, 3, 2),
('NOVO', NULL, 'PC Desktop Gamer', 'DESK001122', 'Não liga', '2026-04-25', NULL, 0.00, 5, 4),
('CANCELADO', 'Cliente desistiu devido ao valor', 'Samsung S22', 'SAM554433', 'Conector de carga', '2026-04-12', '2026-04-13', 0.00, 3, 4),
('PENDENTE', 'Necessário trocar módulo de memória', 'MacBook Air', 'MAC776655', 'Lentidão extrema', '2026-04-27', NULL, 300.00, 4, 5);

-- 9. FORNECEDOR_PRODUTO
INSERT INTO FORNECEDOR_PRODUTO (ID_FORNECEDOR, ID_PRODUTO, TEMPO_MEDIO_ENTREGA, VALOR_DE_COMPRA) VALUES 
(1, 1, 5, 60.00),
(2, 2, 3, 150.00),
(3, 3, 7, 110.00),
(4, 4, 10, 15.00),
(5, 5, 4, 200.00);

-- 10. PRODUTO_PEDIDO
INSERT INTO PRODUTO_PEDIDO (ID_PRODUTO, ID_PEDIDO, QUANTIDADE, VALOR_COMPRA) VALUES 
(1, 1, 1, 120.00),
(2, 2, 2, 250.00),
(3, 3, 1, 180.00),
(5, 4, 1, 350.00),
(4, 5, 1, 45.00);

-- 11. SERVICO_PRODUTO
INSERT INTO SERVICO_PRODUTO (ID_SERVICO, ID_PRODUTO, QUANTIDADE, VALOR_COMPRA) VALUES 
(2, 4, 1, 45.00), -- Cabo usado no serviço do iPhone
(5, 3, 1, 180.00), -- Memória usada no MacBook
(1, 1, 1, 120.00), -- Mouse vendido junto com a limpeza do Dell
(2, 2, 1, 250.00), -- SSD instalado no serviço do iPhone
(3, 3, 2, 180.00); -- Peças orçadas para o Desktop

-- 12. CLIENTE_ENDERECO
INSERT INTO CLIENTE_ENDERECO (ID_CLIENTE, ID_ENDERECO) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);