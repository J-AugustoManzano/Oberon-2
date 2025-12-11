MODULE c06ex06;

IMPORT In, Out;

VAR
  limite: INTEGER;
  pausa: CHAR;

PROCEDURE Fatorial(n: INTEGER): INTEGER;
  VAR
    fat, i: INTEGER;
BEGIN
  fat := 1;
  FOR i := 1 TO n DO
    fat := fat * i;
  END;
  RETURN fat
END Fatorial;

BEGIN
  Out.String("Qual fatorial: "); 
  In.Int(limite);

  Out.String("Fatorial = ");
  Out.Int(Fatorial(limite), 0);
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c06ex06.
