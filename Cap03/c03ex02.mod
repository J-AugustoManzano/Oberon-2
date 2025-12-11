MODULE c03ex02;

IMPORT Out, In;

VAR
  a, b, x, r: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre o 1o. valor numerico: ");
  In.Int(a);

  Out.String("Entre o 2o. valor numerico: ");
  In.Int(b);

  x := a + b;

  IF (x >= 10) THEN
    r := x + 5
  ELSE
    r := x - 7
  END;

  Out.String("Resultado = ");
  Out.Int(r, 0);
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex02.
