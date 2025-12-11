MODULE c03ex10;

IMPORT In, Out;

VAR
  intVal: INTEGER;
  realVal: REAL;
  pausa: CHAR;

BEGIN
  Out.String("--- Conversao de Real para Inteiro ---"); Out.Ln;
  Out.Ln;

  Out.String("Informe um numero real: ");
  In.Real(realVal);
  Out.Ln;

  IF (realVal >= 0.0) THEN
    intVal := FLOOR(realVal)
  ELSE
    intVal := FLOOR(realVal) + 1
  END;

  Out.String("O numero informado foi: "); 
  Out.RealFix(realVal, 0, 1); Out.Ln;
  Out.String("Convertido para INTEGER: ");
  Out.Int(intVal, 0); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c03ex10.