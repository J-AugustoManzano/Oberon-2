MODULE c01ex01;
IMPORT Out, In;

VAR
  pausa: CHAR;

BEGIN
  Out.String("Alo, mundo!"); 
  Out.Ln();
  Out.String("Tecla <Enter> para finalizar...");
  In.Char(pausa)
END c01ex01.
