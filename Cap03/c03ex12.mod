MODULE c03ex12;

IMPORT In, Out;

VAR
  numero, dobro: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre um numero positivo: ");
  In.Int(numero);

dobro := ABS(numero) * 2;

  Out.String("Resultado = ");
  Out.Int(dobro, 0); Out.Ln;

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c03ex12.
