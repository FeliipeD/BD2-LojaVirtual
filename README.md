# 🛒 Loja Virtual - Recuperação e Segurança de Banco de Dados

Este repositório contém os scripts de implementação e o relatório técnico do Trabalho Prático da disciplina de Banco de Dados. O tema central é a "Implementação de Estratégias de Segurança e Recuperação em um Sistema de Banco de Dados".

O SGBD escolhido para a realização do projeto foi o **PostgreSQL**. O sistema desenvolvido simula o funcionamento de uma **Loja Virtual**.

---

## 🎯 Objetivos do Projeto

O trabalho foi desenvolvido para cumprir os seguintes objetivos práticos e teóricos:
* Compreender os conceitos de segurança e recuperação em bancos de dados.
* Implementar mecanismos básicos de controle de acesso.
* Configurar usuários, papéis (*roles*) e privilégios.
* Aplicar políticas de backup e restauração.
* Simular falhas (exclusão acidental) e realizar procedimentos de recuperação.

---

## 📂 Estrutura do Repositório

O projeto possui 5 tabelas relacionadas contendo chaves primárias/estrangeiras e restrições de integridade, além de scripts específicos para segurança.

* 📁 `scripts/`
  * 📄 `schema.sql`: Script contendo o modelo lógico para criação das tabelas (Clientes, Categorias, Produtos, Pedidos, Itens_Pedido).
  * 📄 `seed.sql`: Script de inserção de dados de teste para simular o uso do sistema.
  * 📄 `security.sql`: Configuração de 3 usuários, 3 papéis e concessão/revogação de privilégios (`GRANT`/`REVOKE`).
* 📁 `backup/`
  * 📄 `backup_logico.sql`: Arquivo em formato de texto puro contendo todas as instruções SQL (`CREATE TABLE`, `INSERT`, etc.) necessárias para reconstruir o banco do zero.
  * 📄 `backup_completo.backup`: Arquivo gerado no formato customizado e compactado do PostgreSQL. Garante a integridade total do banco e permite a restauração limpa, apagando conflitos antes de recriar os dados.
* 📁 `docs/`
  * 📄 `Relatorio_Tecnico.pdf`: Relatório final nos padrões ABNT contendo a fundamentação teórica, diagrama do banco, dificuldades encontradas e resultados dos testes.

---

## 🔐 Controle de Acesso Implementado

Foram criados 3 níveis de acesso para simular o ambiente da loja virtual
1. **Administrador (`admin_user`):** Possui acesso total a todas as tabelas e operações do banco.
2. **Funcionário (`func_user`):** Possui permissão de leitura e inserção nos produtos e pedidos, mas é restrito para exclusões ou atualizações críticas de clientes.
3. **Visitante (`visit_user`):** Permissão de apenas leitura no catálogo de categorias e produtos, tendo acesso negado para qualquer tipo de alteração.

---

## 👥 Equipe

* Alysson Souza Pina Viana
* Bruno dos Santos Moreira
* Felipe da Costa Morais
