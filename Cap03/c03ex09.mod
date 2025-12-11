MODULE c03ex09;

IMPORT In, Out;

VAR
  intVal: INTEGER;
  realVal: REAL;
  pausa: CHAR;

BEGIN
  Out.String("--- Conversao de Inteiro para Real ---"); Out.Ln;
  Out.Ln;

  Out.String("Informe um numero inteiro: ");
  In.Int(intVal);
  Out.Ln;

  realVal := FLT(intVal);

  Out.String("O numero informado foi: "); Out.Int(intVal, 0); 
  Out.Ln;
  Out.String("Convertido para REAL (1 casa decimal): ");
  Out.RealFix(realVal, 0, 1); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c03ex09.