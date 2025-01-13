CREATE TABLE Evento (
  CP_id_evento SERIAL PRIMARY KEY,
  nome_evento VARCHAR(255) NOT NULL,
  dt_inicio DATE NOT NULL,
  dt_fim DATE NOT NULL,
  local_evento VARCHAR(19) NOT NULL
);

CREATE TABLE Atividade (
  CP_id_atv SERIAL PRIMARY KEY,
  nome_atv VARCHAR(255) NOT NULL,
  tipo_atv VARCHAR(9) NOT NULL,
  dt_atv TIMESTAMPTZ NOT NULL,
  cpci_max INT NOT NULL,
  ce_id_evento INT,
  CONSTRAINT fk_evento
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento) 
    ON DELETE CASCADE
);

CREATE TABLE Palestrante (
  CP_id_palestrante SERIAL PRIMARY KEY,
  nome_palest VARCHAR(100) NOT NULL,
  mini_bio_palest VARCHAR(255),
  contato_palest VARCHAR(50) NOT NULL
);

CREATE TABLE Participante (
  CP_id_participante SERIAL PRIMARY KEY,
  nome_particip VARCHAR(100) NOT NULL,
  contato_particip VARCHAR(50) NOT NULL
);

CREATE TABLE Inscricao_evento (
  CP_id_inscricao_evnt SERIAL PRIMARY KEY,
  stts_inscricao_evnt VARCHAR(9) NOT NULL,
  tipo_inscricao VARCHAR(12) NOT NULL,
  tipo_participacao VARCHAR(12) NOT NULL,
  ce_id_participante INT,
  ce_id_evento INT,
  CONSTRAINT fk_participante
    FOREIGN KEY (ce_id_participante) 
    REFERENCES Participante(CP_id_participante) 
    ON DELETE CASCADE,
  CONSTRAINT fk_evento_inscricao
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento) 
    ON DELETE CASCADE
);

CREATE TABLE Inscricao_atividade (
  CP_id_inscricao_atv SERIAL PRIMARY KEY,
  stts_inscricao_atv VARCHAR(9) NOT NULL,
  ce_id_evento INT,
  ce_id_participante INT,
  ce_id_atividade INT,
  CONSTRAINT fk_evento_atividade
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento) 
    ON DELETE CASCADE,
  CONSTRAINT fk_participante_atividade
    FOREIGN KEY (ce_id_participante) 
    REFERENCES Participante(CP_id_participante) 
    ON DELETE CASCADE,
  CONSTRAINT fk_atividade
    FOREIGN KEY (ce_id_atividade) 
    REFERENCES Atividade(CP_id_atv) 
    ON DELETE CASCADE
);

CREATE TABLE Patrocinador (
  CP_id_patrocinador SERIAL PRIMARY KEY,
  nome_ptr VARCHAR(100) NOT NULL,
  contato_ptr VARCHAR(50) NOT NULL
);

CREATE TABLE Evento_patrocinador (
  ce_id_evento INT,
  ce_id_patrocinador INT,
  PRIMARY KEY (ce_id_evento, ce_id_patrocinador),
  CONSTRAINT fk_evento_patrocinador
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento) 
    ON DELETE CASCADE,
  CONSTRAINT fk_patrocinador
    FOREIGN KEY (ce_id_patrocinador) 
    REFERENCES Patrocinador(CP_id_patrocinador) 
    ON DELETE CASCADE
);

CREATE TABLE Atividade_Palestrante (
  ce_id_atividade INT,
  ce_id_palestrante INT,
  PRIMARY KEY (ce_id_atividade, ce_id_palestrante),
  CONSTRAINT fk_atividade_palestrante
    FOREIGN KEY (ce_id_atividade) 
    REFERENCES Atividade(CP_id_atv) 
    ON DELETE CASCADE,
  CONSTRAINT fk_palestrante
    FOREIGN KEY (ce_id_palestrante) 
    REFERENCES Palestrante(CP_id_palestrante) 
    ON DELETE CASCADE
);
