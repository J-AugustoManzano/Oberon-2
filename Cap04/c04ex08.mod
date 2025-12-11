MODULE c04ex08;

IMPORT Out, In;

VAR
  i: INTEGER;
  parar: BOOLEAN;
  pausa: CHAR;

BEGIN
  i := 1;
  parar := FALSE;

  WHILE (i <= 10) & (~parar) DO
    IF i = 6 THEN
      parar := TRUE
    ELSE
      Out.Int(i, 3);
      Out.Ln
    END;
    i := i + 1
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex08.
