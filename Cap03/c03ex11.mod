MODULE c03ex11;

IMPORT In, Out;

VAR
  numero: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre um numero par: ");
  In.Int(numero);

  IF (~(ODD(numero)) = TRUE) THEN
    Out.String("O numero, somado com 5, equivale a ");
    Out.Int(numero + 5, 0);
    Out.Ln;
  ELSE
    Out.String("Entrada foi invalida");
    Out.Ln;
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c03ex11.
  
