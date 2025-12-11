MODULE ExemploDinamico;

IMPORT Out, In, Heap;

TYPE
  Veiculo* = POINTER TO RECORD
    numSerie: INTEGER;
  END;

  Carro* = POINTER TO RECORD (Veiculo)
    numPortas: INTEGER;
  END;

  Caminhao* = POINTER TO RECORD (Veiculo)
    capacidadeCarga: REAL;
  END;

VAR
  v: Veiculo;
  c: Carro;
  x: Caminhao;
  pausa: CHAR;

PROCEDURE ProcessarVeiculo*(vBase: Veiculo);
BEGIN
  Out.String("Processando Veiculo com Num. Serie: "); 
  Out.Int(vBase.numSerie, 0); Out.Ln;

  IF (vBase IS Carro) THEN (* Teste de Tipo *)
    Out.String("  Este e' um Carro com ");
    (* Guarda de Tipo: Acessando campo de Carro *)
    Out.Int(vBase(Carro).numPortas, 0); 
    Out.String(" portas."); Out.Ln;
  ELSIF (vBase IS Caminhao) THEN (* Teste de Tipo *)
    Out.String("  Este e' um Caminhao com ");
    (* Guarda de Tipo: Acessando campo de Caminhao *)
    Out.RealFix(vBase(Caminhao).capacidadeCarga, 0, 2); 
    Out.String(" toneladas de carga."); Out.Ln;
  ELSE
    Out.String("  Tipo de Veiculo desconhecido ou generico."); 
  END;
END ProcessarVeiculo;

BEGIN
  NEW(c); (* Cria um novo objeto Carro *)
  c.numSerie := 1001;
  c.numPortas := 4;

  NEW(x); (* Cria um novo objeto Caminhao *)
  x.numSerie := 2002;
  x.capacidadeCarga := 15.5;

  v := c; (* v agora aponta para um objeto Carro *)
  ProcessarVeiculo(v); Out.Ln;

  v := x; (* v agora aponta para um objeto Caminhao *)
  ProcessarVeiculo(v); Out.Ln;

  NEW(v); (* v agora aponta para um objeto Veiculo genérico *)
  v.numSerie := 3003;
  ProcessarVeiculo(v); Out.Ln;

  (* 
    Tentativa de acesso inválido sem teste de tipo (causaria 
    erro em tempo de execução se não fosse um Carro
  *)
  
  (* 
    IF v IS Carro THEN END; 
    
    Se esta linha fosse omitida e tentasse v(Carro).numPortas, ]
    haveria um erro em runtime se v não fosse Carro 
  *)

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END ExemploDinamico.