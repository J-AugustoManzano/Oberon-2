MODULE c06ex10;

IMPORT In, Out;

VAR
  limite: INTEGER;
  pausa: CHAR;

PROCEDURE FatorialBase(n, p: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) THEN
    resp := p;
  ELSE
    resp := FatorialBase(n - 1, n * p);
  END;
  RETURN resp
END FatorialBase;

PROCEDURE Fatorial(n: INTEGER): INTEGER;
BEGIN
  RETURN FatorialBase(n, 1)
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
END c06ex10.
