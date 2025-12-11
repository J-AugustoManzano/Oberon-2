MODULE c04ex10;

IMPORT In, Out;

VAR
  i: INTEGER;
  pausa: CHAR;

BEGIN
  i := 1;
  WHILE (i <= 10) DO
    IF (~(i = 6)) THEN
      Out.Int(i, 3);
      Out.Ln
    END;
    i := i + 1
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex10.
