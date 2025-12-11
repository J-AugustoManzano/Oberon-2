MODULE c03ex08;

IMPORT In, Out;

VAR
  n, r4, r5: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre um numero inteiro: ");
  In.Int(n);

  r4 := n MOD 4;
  r5 := n MOD 5;

  IF (r4 = 0) & (r5 = 0) THEN
    Out.String("Resultado = "); Out.Int(n, 0)
  ELSE
    Out.String("Valor nao e divisivel por 4 e 5")
  END;
  Out.Ln; 

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex08.
