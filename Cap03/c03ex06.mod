MODULE c03ex06;

IMPORT In, Out;

VAR
  a, b, x, c: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre valor para a variavel <a>: ");
  In.Int(a);
  
  Out.String("Entre valor para a variavel <b>: ");
  In.Int(b);
  
  Out.String("Entre valor para a variavel <x>: ");
  In.Int(x);
  
  IF (~(x > 5)) THEN
    c := a + b
  ELSE
    c := a - b
  END;
  
  Out.Ln;
  Out.String("Resultado = "); Out.Int(c, 0);
  Out.Ln(); 

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex06.
