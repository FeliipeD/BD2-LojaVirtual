--
-- PostgreSQL database dump
--

\restrict gPdjm0GbFxPzUFRoOnIaMVq155aoi00YPTDipWOiSn7kGj3Fl3WM2gY90eKpklj

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-29 12:46:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16829)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16834)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 220
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- TOC entry 221 (class 1259 OID 16835)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    cpf character varying(14) NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16842)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 223 (class 1259 OID 16843)
-- Name: itens_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens_pedido (
    id_item integer NOT NULL,
    id_pedido integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade integer NOT NULL,
    preco_unitario numeric(10,2) NOT NULL,
    CONSTRAINT itens_pedido_quantidade_check CHECK ((quantidade > 0))
);


ALTER TABLE public.itens_pedido OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16852)
-- Name: itens_pedido_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itens_pedido_id_item_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itens_pedido_id_item_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 224
-- Name: itens_pedido_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itens_pedido_id_item_seq OWNED BY public.itens_pedido.id_item;


--
-- TOC entry 225 (class 1259 OID 16853)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    data_pedido timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total numeric(10,2) DEFAULT 0.00
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16860)
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;


--
-- TOC entry 227 (class 1259 OID 16861)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    id_categoria integer NOT NULL,
    nome character varying(100) NOT NULL,
    preco numeric(10,2) NOT NULL,
    estoque integer NOT NULL,
    CONSTRAINT produtos_estoque_check CHECK ((estoque >= 0)),
    CONSTRAINT produtos_preco_check CHECK ((preco > (0)::numeric))
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16871)
-- Name: produtos_id_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_produto_seq OWNER TO postgres;

--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 228
-- Name: produtos_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;


--
-- TOC entry 4876 (class 2604 OID 16872)
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 16873)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 16874)
-- Name: itens_pedido id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido ALTER COLUMN id_item SET DEFAULT nextval('public.itens_pedido_id_item_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16875)
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16876)
-- Name: produtos id_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);


--
-- TOC entry 5051 (class 0 OID 16829)
-- Dependencies: 219
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, nome) FROM stdin;
1	Eletrônicos
2	Informática
3	Acessórios
\.


--
-- TOC entry 5053 (class 0 OID 16835)
-- Dependencies: 221
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nome, email, cpf) FROM stdin;
1	Felipe da Costa Morais	felipe.morais@hotmail.com	111.111.111-11
2	Bruno dos Santos Moreira	bruno.moreira@hotmail.com	222.222.222-22
3	Alysson Pina	alysson.pina@hotmail.com	333.333.333-33
4	Silvia Rissino	silvia.rissino@hotmail.com	444.444.444-44
\.


--
-- TOC entry 5055 (class 0 OID 16843)
-- Dependencies: 223
-- Data for Name: itens_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario) FROM stdin;
1	1	1	1	1500.00
2	1	3	1	120.00
3	2	2	1	4500.00
4	3	3	1	120.00
5	4	2	1	4500.00
6	4	4	1	300.00
\.


--
-- TOC entry 5057 (class 0 OID 16853)
-- Dependencies: 225
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id_pedido, id_cliente, data_pedido, total) FROM stdin;
1	1	2026-06-29 11:33:21.775221	1620.00
2	2	2026-06-29 11:33:21.775221	4500.00
3	3	2026-06-29 11:33:21.775221	120.00
4	4	2026-06-29 11:33:21.775221	4800.00
\.


--
-- TOC entry 5059 (class 0 OID 16861)
-- Dependencies: 227
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id_produto, id_categoria, nome, preco, estoque) FROM stdin;
1	1	Smartphone XYZ	1500.00	50
2	2	Notebook Pro	4500.00	20
3	3	Mouse Sem Fio	120.00	100
4	1	Fone de Ouvido Bluetooth	300.00	75
\.


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 220
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 3, true);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 4, true);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 224
-- Name: itens_pedido_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itens_pedido_id_item_seq', 6, true);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 4, true);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 228
-- Name: produtos_id_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_produto_seq', 4, true);


--
-- TOC entry 4887 (class 2606 OID 16878)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4889 (class 2606 OID 16880)
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 4891 (class 2606 OID 16882)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 4893 (class 2606 OID 16884)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4895 (class 2606 OID 16886)
-- Name: itens_pedido itens_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id_item);


--
-- TOC entry 4897 (class 2606 OID 16888)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4899 (class 2606 OID 16890)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);


--
-- TOC entry 4900 (class 2606 OID 16891)
-- Name: itens_pedido itens_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE;


--
-- TOC entry 4901 (class 2606 OID 16896)
-- Name: itens_pedido itens_pedido_id_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produtos(id_produto) ON DELETE RESTRICT;


--
-- TOC entry 4902 (class 2606 OID 16901)
-- Name: pedidos pedidos_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE CASCADE;


--
-- TOC entry 4903 (class 2606 OID 16906)
-- Name: produtos produtos_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) ON DELETE RESTRICT;


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE categorias; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categorias TO role_admin;
GRANT SELECT ON TABLE public.categorias TO role_visitante;


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 220
-- Name: SEQUENCE categorias_id_categoria_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categorias_id_categoria_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.categorias_id_categoria_seq TO role_funcionario;


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.clientes TO role_admin;
GRANT SELECT ON TABLE public.clientes TO role_funcionario;


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE clientes_id_cliente_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.clientes_id_cliente_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.clientes_id_cliente_seq TO role_funcionario;


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE itens_pedido; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.itens_pedido TO role_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.itens_pedido TO role_funcionario;


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE itens_pedido_id_item_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.itens_pedido_id_item_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.itens_pedido_id_item_seq TO role_funcionario;


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE pedidos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pedidos TO role_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.pedidos TO role_funcionario;


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE pedidos_id_pedido_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pedidos_id_pedido_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.pedidos_id_pedido_seq TO role_funcionario;


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE produtos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.produtos TO role_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.produtos TO role_funcionario;
GRANT SELECT ON TABLE public.produtos TO role_visitante;


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE produtos_id_produto_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.produtos_id_produto_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.produtos_id_produto_seq TO role_funcionario;


-- Completed on 2026-06-29 12:46:10

--
-- PostgreSQL database dump complete
--

\unrestrict gPdjm0GbFxPzUFRoOnIaMVq155aoi00YPTDipWOiSn7kGj3Fl3WM2gY90eKpklj

