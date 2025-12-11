MODULE c10ex09;

IMPORT Out, In;

VAR
  i: INTEGER;
  pausa: CHAR;

PROCEDURE PutHex3(val: INTEGER);
BEGIN
  IF (val < 16) THEN
    Out.String("  ");
  ELSIF (val < 256) THEN
    Out.Char(' ');
  END;
  Out.Hex(val, 0);
END PutHex3;

PROCEDURE PutChar3(val: INTEGER);
VAR
  caractereImprimivel: CHAR;
BEGIN
  IF (val < 32) OR (val = 127) THEN
    caractereImprimivel := '.';
  ELSE
    caractereImprimivel := CHR(val);
  END;
  Out.Char(' ');
  Out.Char(caractereImprimivel);
  Out.Char(' ');
END PutChar3;

BEGIN
  Out.String("TABELA ASCII (0 a 255) - PADRAO IBM-PC"); 
  Out.Ln;

  Out.Ln;
  Out.String("DEC  HEX  CAR   DEC  HEX  CAR   ");
  Out.String("DEC  HEX  CAR   DEC  HEX  CAR"); 
  Out.Ln;
  Out.String("---  ---  ---   ---  ---  ---   ");
  Out.String("---  ---  ---   ---  ---  ---"); 
  Out.Ln;

  FOR i := 0 TO 255 DO
    Out.Int(i, 3);
    Out.String("  ");

    PutHex3(i);
    Out.String("  ");

    PutChar3(i);

    IF (i MOD 4 = 0) OR (i MOD 4 = 1) OR (i MOD 4 = 2) THEN
      Out.String("   ");
    END;

    IF (i MOD 4 = 3) THEN
      Out.Ln;
    END;
  END;

  Out.Ln;
  Out.String("Legenda:"); Out.Ln;
  Out.Ln;
  Out.String("[.] = caractere de controle ou nao-imprimivel."); 
  Out.Ln;
  Out.String("      Caracteres de 128 a 255 podem ");
  Out.String("variar de acordo com o terminal/fonte."); 
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c10ex09.
