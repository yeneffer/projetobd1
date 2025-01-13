-- Inserir dados na tabela Evento
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Evento (nome_evento, dt_inicio, dt_fim, local_evento) 
    VALUES (
      'Evento ' || i, 
      CURRENT_DATE + (i % 30), 
      CURRENT_DATE + (i % 30) + INTERVAL '1 day', 
      CASE WHEN i % 2 = 0 THEN 'Presencial' ELSE 'Online' END
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Atividade
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Atividade (nome_atv, tipo_atv, dt_atv, cpci_max, ce_id_evento) 
    VALUES (
      'Atividade ' || i, 
      CASE WHEN i % 3 = 0 THEN 'palestra' WHEN i % 3 = 1 THEN 'workshop' ELSE 'painel' END,
      CURRENT_DATE + (i % 30) + INTERVAL '2 hour',
      100 + (i % 50), 
      i
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Palestrante
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Palestrante (nome_palest, mini_bio_palest, contato_palest) 
    VALUES (
      'Palestrante ' || i, 
      'Mini bio do palestrante ' || i, 
      'palestrante' || i || '@exemplo.com'
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Participante
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Participante (nome_particip, contato_particip) 
    VALUES (
      'Participante ' || i, 
      'participante' || i || '@exemplo.com'
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Inscricao_evento
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Inscricao_evento (stts_inscricao_evnt, tipo_inscricao, tipo_participacao, ce_id_participante, ce_id_evento) 
    VALUES (
      CASE WHEN i % 4 = 0 THEN 'aprovada' WHEN i % 4 = 1 THEN 'recusada' WHEN i % 4 = 2 THEN 'pendente' ELSE 'cancelada' END, 
      CASE WHEN i % 3 = 0 THEN 'estudante' WHEN i % 3 = 1 THEN 'profissional' ELSE 'VIP' END,
      CASE WHEN i % 2 = 0 THEN 'online' ELSE 'presencial' END,
      i, 
      i
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Inscricao_atividade
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Inscricao_atividade (stts_inscricao_atv, ce_id_evento, ce_id_participante, ce_id_atividade) 
    VALUES (
      CASE WHEN i % 4 = 0 THEN 'aprovada' WHEN i % 4 = 1 THEN 'recusada' WHEN i % 4 = 2 THEN 'pendente' ELSE 'cancelada' END, 
      i, 
      i, 
      i
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Patrocinador
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Patrocinador (nome_ptr, contato_ptr) 
    VALUES (
      'Patrocinador ' || i, 
      'patrocinador' || i || '@exemplo.com'
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Evento_patrocinador
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Evento_patrocinador (ce_id_evento, ce_id_patrocinador) 
    VALUES (
      i, 
      i
    );
  END LOOP;
END $$;

-- Inserir dados na tabela Atividade_Palestrante
DO $$ 
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO Atividade_Palestrante (ce_id_atividade, ce_id_palestrante) 
    VALUES (
      i, 
      i
    );
  END LOOP;
END $$;
