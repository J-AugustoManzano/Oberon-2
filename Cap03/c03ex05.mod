MODULE c03ex05;

IMPORT In, Out;

VAR
  p1, p2: INTEGER;
  pausa: CHAR;
  xorCond: BOOLEAN;

BEGIN
  Out.String("Classificacao esportiva");
  Out.Ln(); Out.Ln();

  Out.String("Entre '1' se atleta pontuou na 1a. prova");
  Out.Ln();
  Out.String("Entre '1' se atleta pontuou na 2a. prova");
  Out.Ln();
  Out.String("Qualquer outro valor se nao pontuou nas provas");
  Out.Ln(); Out.Ln();

  Out.String("Prova 1: ");
  In.Int(p1);

  Out.String("Prova 2: ");
  In.Int(p2);

  (* simulação do XOR lógico: verdadeiro se apenas um for 1 *)
  xorCond := ((p1 = 1) & (p2 # 1)) OR ((p1 # 1) & (p2 = 1));

  Out.Ln();
  IF (xorCond) THEN
    Out.String("Atleta participa da terceira prova.")
  ELSE
    Out.String("Atleta nao participa da terceira prova.");
    Out.Ln();
    IF (p1 = 1) & (p2 = 1) THEN
      Out.String("Classificado para a final.")
    ELSE
      Out.String("Desclassificado da competicao.")
    END
  END;
  Out.Ln(); 

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c03ex05. 
