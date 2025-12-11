MODULE c03ex01;

IMPORT Out, In;

VAR
  a, b, x: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre o 1o. valor numerico: ");
  In.Int(a);

  Out.String("Entre o 2o. valor numerico: ");
  In.Int(b);

  IF (a > b) THEN
    x := a;
    a := b;
    b := x
  END;

  Out.String("Os valores sao: ");
  Out.Int(a, 0);
  Out.String(" e ");
  Out.Int(b, 0);
  Out.String(".");
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex01.
