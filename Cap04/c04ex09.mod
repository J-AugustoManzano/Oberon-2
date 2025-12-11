MODULE c04ex09;

IMPORT In, Out;

VAR
  i: INTEGER;
  pausa: CHAR;
  
BEGIN
  FOR i := 1 TO 10 DO
    IF (~(i = 6)) THEN
      Out.Int(i, 3);
      Out.Ln
    END
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex09.
