MODULE c03ex03;

IMPORT Out, In;

VAR
  numero: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre um numero inteiro: ");
  In.Int(numero);

  IF (numero >= 20) & (numero <= 90) THEN
    Out.String("O numero esta na faixa de 20 a 90.")
  ELSE
    Out.String("O numero esta fora da faixa de 20 a 90.")
  END;
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex03.
