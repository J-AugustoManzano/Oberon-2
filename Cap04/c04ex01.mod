MODULE c04ex01;

IMPORT In, Out;

VAR
  i, n, r: INTEGER;
  pausa: CHAR;

BEGIN
  i := 1;
  WHILE (i <= 5) DO
    Out.String("Entre um valor numerico: ");
    In.Int(n);

    r := n * 3;

    Out.String("Resultado = ");
    Out.Int(r, 0);
    Out.Ln;
    Out.Ln;

    i := i + 1
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex01.
