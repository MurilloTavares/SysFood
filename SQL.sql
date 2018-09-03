-- Dados para a conexao correta com a aplicacao:
-- Database: sysFoodDB
-- Dono: postgres
-- Senha: 1234

-- Tabelas --
CREATE TABLE usuario(
  email varchar(50) NOT NULL,
  senha varchar(64) NOT NULL,
  nome varchar(100) NOT NULL,
  foto bytea NOT NULL,
  
  cep varchar(8) NOT NULL,
  rua varchar(100) NOT NULL,
  cidade varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  numero varchar(10) NOT NULL,
  
  sexo char(1),
  telefone varchar(9),
  profissao varchar(50),
  descricao varchar(200),
  
  CONSTRAINT usuario_pkey PRIMARY KEY (email)
);

CREATE TABLE estabelecimento(
  dono varchar(50) NOT NULL,
  
  nome varchar(100) NOT NULL,
  
  tipo varchar(50) NOT NULL,
  foto bytea NOT NULL,  
  telefone varchar(9),    
  nota numeric(2,1) NOT NULL,
  
  cep varchar(8) NOT NULL,
  rua varchar(100) NOT NULL,
  cidade varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  numero varchar(10) NOT NULL,
  
  CONSTRAINT estabelecimento_pkey PRIMARY KEY (nome),
  CONSTRAINT dono_fkey FOREIGN KEY (nome) REFERENCES usuario(email),
  
  CONSTRAINT nota_min_max CHECK (nota>=0 and nota<=5)
);

CREATE TABLE comida(
  estabelecimento varchar(100) NOT NULL,
  
  cod SERIAL NOT NULL,  
  
  nome varchar(100) NOT NULL,
  preco numeric(5,2) NOT NULL,
  descricao varchar(200) NOT NULL,  
  nota numeric(2,1) NOT NULL,
  
  CONSTRAINT comida_pkey PRIMARY KEY (cod),
  CONSTRAINT estabelecimento_fkey FOREIGN KEY (estabelecimento) REFERENCES estabelecimento(nome),

  CONSTRAINT nota_min_max CHECK (nota>=0 and nota<=5)
);

CREATE TABLE amizade( 
  usuario varchar(50) NOT NULL,
  amigo varchar(50) NOT NULL,
  
  CONSTRAINT amizade_pkey PRIMARY KEY (usuario, amigo),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario) REFERENCES usuario(email),
  CONSTRAINT amigo_fkey FOREIGN KEY (amigo) REFERENCES usuario(email),

  CONSTRAINT usuario_amigo CHECK (usuario<>amigo)
);

CREATE TABLE seguir( 
  usuario varchar(50) NOT NULL,
  seguido varchar(50) NOT NULL,
  
  CONSTRAINT seguir_pkey PRIMARY KEY (usuario, seguido),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario) REFERENCES usuario(email),
  CONSTRAINT seguido_fkey FOREIGN KEY (seguido) REFERENCES usuario(email),

  CONSTRAINT usuario_amigo CHECK (usuario<>seguido)
);

CREATE TABLE mensagem( 
  cod SERIAL,
  usuario varchar(50) NOT NULL,
  amigo varchar(50) NOT NULL,
  mensagem varchar(300) NOT NULL,
  datahorario timestamp NOT NULL,
  
  CONSTRAINT mensagem_pkey PRIMARY KEY (cod),
  CONSTRAINT amizade_fkey FOREIGN KEY (usuario, amigo) REFERENCES amizade(usuario, amigo)
);

CREATE TABLE presenca( 
  usuario varchar(50) NOT NULL,
  estabelecimento varchar(100) NOT NULL,
  dia date NOT NULL,
  horario time NOT NULL,  
  
  CONSTRAINT presenca_pkey PRIMARY KEY (usuario, dia, horario),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario) REFERENCES usuario(email),
  CONSTRAINT estabelecimento_fkey FOREIGN KEY (estabelecimento) REFERENCES estabelecimento(nome)
);

CREATE TABLE recomendacao( 
  cod SERIAL,
  usuario varchar(50) NOT NULL,
  amigo varchar(50) NOT NULL,
  comida int NOT NULL,
  
  CONSTRAINT recomendacao_pkey PRIMARY KEY (cod),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario, amigo) REFERENCES amizade(usuario, amigo),
  CONSTRAINT comida_fkey FOREIGN KEY (comida) REFERENCES comida(cod)
);

CREATE TABLE avaliacao_comida( 
  usuario varchar(50) NOT NULL,
  comida int NOT NULL,
  descricao varchar(200) NOT NULL,
  nota int NOT NULL,
  
  CONSTRAINT avaliacao_comida_pkey PRIMARY KEY (usuario, comida),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario) REFERENCES usuario(email),
  CONSTRAINT comida_fkey FOREIGN KEY (comida) REFERENCES comida(cod),

  CONSTRAINT nota_min_max CHECK (nota>=0 and nota<=5)
);

CREATE TABLE avaliacao_estabelecimento( 
  usuario varchar(50) NOT NULL,
  estabelecimento varchar(100) NOT NULL,
  descricao varchar(200) NOT NULL,
  nota int NOT NULL,
  
  CONSTRAINT avaliacao_estabelecimento_pkey PRIMARY KEY (usuario, estabelecimento),
  CONSTRAINT usuario_fkey FOREIGN KEY (usuario) REFERENCES usuario(email),
  CONSTRAINT estabelecimento_fkey FOREIGN KEY (estabelecimento) REFERENCES estabelecimento(nome),

  CONSTRAINT nota_min_max CHECK (nota>=0 and nota<=5)
)
