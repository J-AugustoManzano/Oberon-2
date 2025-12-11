MODULE c06ex05;

IMPORT In, Out;

VAR
  resp, limite: INTEGER;
  pausa: CHAR;

PROCEDURE fatorial(n: INTEGER; VAR fat: INTEGER);
VAR
  i: INTEGER;
BEGIN
  fat := 1;
  FOR i := 1 TO n DO
    fat := fat * i;
  END;
END fatorial;

BEGIN
  resp := 1;

  Out.String("Qual fatorial: ");
  In.Int(limite); Out.Ln;

  fatorial(limite, resp);

  Out.String("Fatorial = ");
  Out.Int(resp, 0);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c06ex05.
