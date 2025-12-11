MODULE c02ex02;

IMPORT Out, In, Math;

VAR
  base, exponente, resultado: REAL;
  pausa: CHAR;

BEGIN
  Out.String("Entre a base ......: ");
  In.Real(base);

  Out.String("Entre o expoente ..: ");
  In.Real(exponente);

  resultado := Math.power(base, exponente);

  Out.String("Resultado = ");
  Out.Real(resultado, 2);
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c02ex02.
