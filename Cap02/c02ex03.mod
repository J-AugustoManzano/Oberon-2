MODULE c02ex03;

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
  Out.RealFix(resultado, 2, 1);
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c02ex03.
