MODULE c04ex11;

IMPORT In, Out;

VAR
  i, n, r: INTEGER;
  parar: BOOLEAN;
  pausa: CHAR;

BEGIN
  i := 1;

  parar := TRUE;
  WHILE (parar) DO
    Out.String("Entre um valor numerico: ");
    In.Int(n);

    r := n * 3;

    Out.String("Resultado = ");
    Out.Int(r, 0);
    Out.Ln;
    Out.Ln;

    IF (i > 4) THEN parar := FALSE END;

    i := i + 1
  END;

  Out.Ln;

  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex11.
