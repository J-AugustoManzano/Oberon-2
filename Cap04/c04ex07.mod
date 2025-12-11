MODULE c04ex07;

IMPORT Out, In;

VAR
  i: INTEGER;
  parar: BOOLEAN;
  pausa: CHAR;
  
BEGIN
  parar := FALSE;

  FOR i := 1 TO 10 DO
    IF (~parar) THEN
      IF (i = 6) THEN
        parar := TRUE
      ELSE
        Out.Int(i, 3);
        Out.Ln
      END
    END
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex07.
