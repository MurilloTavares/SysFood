-- Dados para a conexao correta com a aplicacao:
-- Database: sysFoodDB
-- Dono: postgres
-- Senha: 1234

CREATE TABLE public.usuario
(
  email character varying(50) NOT NULL,
  senha character(60) NOT NULL,
  nome character varying(100) NOT NULL,
  foto bytea NOT NULL,
  
  cep character(8) NOT NULL,
  rua character varying(100) NOT NULL,
  cidade character varying(50) NOT NULL,
  estado character varying(50) NOT NULL,
  numero character varying(10) NOT NULL,
  
  sexo character(1),
  telefone character varying(11),
  profissao character varying(50),
  descricao character varying(200),
  
  CONSTRAINT usuario_pkey PRIMARY KEY (email)
)