-- 1. Papéis (Roles)
CREATE ROLE role_admin;
CREATE ROLE role_funcionario;
CREATE ROLE role_visitante;

-- 2. Privilégios
-- Administrador: Acesso total
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO role_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO role_admin;

-- Funcionário: Leitura e Inserção
GRANT SELECT, INSERT, UPDATE ON produtos, pedidos, itens_pedido TO role_funcionario;
GRANT SELECT ON clientes TO role_funcionario; -- Apenas visualiza clientes
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO role_funcionario;

-- Visitante: Apenas leitura de catálogo
GRANT SELECT ON produtos, categorias TO role_visitante;

-- 3. Criação de Usuários
CREATE USER admin_user WITH PASSWORD 'senha_admin123';
CREATE USER func_user WITH PASSWORD 'senha_func123';
CREATE USER visit_user WITH PASSWORD 'senha_visit123';

-- 4. Associação de Usuários aos Papéis
GRANT role_admin TO admin_user;
GRANT role_funcionario TO func_user;
GRANT role_visitante TO visit_user;

-- 5. Restrição para garantir a regra do funcionário
REVOKE DELETE ON produtos FROM role_funcionario;
REVOKE UPDATE, DELETE ON clientes FROM role_funcionario;