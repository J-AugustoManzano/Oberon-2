MODULE c06ex08;

IMPORT In, Out;

VAR
  limite: INTEGER;
  pausa: CHAR;

PROCEDURE Fatorial(n: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) THEN
    resp := 1
  ELSE
    resp := n * Fatorial(n - 1)
  END;
  RETURN resp
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
END c06ex08.
