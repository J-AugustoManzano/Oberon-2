MODULE c06ex07;

IMPORT In, Out;

VAR
  x, y: INTEGER;
  pausa: CHAR;

PROCEDURE Igual(a, b: INTEGER): BOOLEAN;
BEGIN
  RETURN a = b
END Igual;

BEGIN
  Out.String("Informe o 1o. valor: "); In.Int(x);
  Out.String("Informe o 2o. valor: "); In.Int(y);

  IF (Igual(x, y)) THEN
    Out.String("Valores sao iguais");
  ELSE
    Out.String("Valores sao diferentes");
  END;
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... "); 
  In.Char(pausa);
END c06ex07.
