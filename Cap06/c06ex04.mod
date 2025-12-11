MODULE c06ex04;

IMPORT In, Out;

VAR
  limite: INTEGER;
  pausa: CHAR;

PROCEDURE fatorial(n: INTEGER);
VAR
  fat, i: INTEGER;
BEGIN
  fat := 1;
  FOR i := 1 TO n DO
    fat := fat * i;
  END;
  Out.String("Fatorial = ");
  Out.Int(fat, 0); Out.Ln;
END fatorial;

BEGIN
  Out.String("Qual fatorial: ");
  In.Int(limite);

  fatorial(limite);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c06ex04.
