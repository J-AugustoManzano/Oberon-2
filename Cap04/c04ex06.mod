MODULE c04ex06;

IMPORT In, Out;

VAR
  i: INTEGER;
  pausa: CHAR;

BEGIN
  FOR i := 1 TO 10 BY 2 DO
    Out.Int(i, 0);
    Out.Ln
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex06.
