MODULE Soma;

IMPORT Out, In;

VAR
  num1, num2, resultado: INTEGER;
  pausa: CHAR;

PROCEDURE Somar(a, b: INTEGER): INTEGER;
BEGIN
  RETURN a + b
END Somar;

BEGIN
  Out.String("--- Programa de Soma ---"); Out.Ln;
  Out.Ln;

  Out.String("Entre com o primeiro numero: ");
  In.Int(num1);
  Out.Ln;

  Out.String("Entre com o segundo numero: ");
  In.Int(num2);
  Out.Ln;

  resultado := Somar(num1, num2);

  Out.String("A soma de "); Out.Int(num1, 0);
  Out.String(" + "); Out.Int(num2, 0);
  Out.String(" = "); Out.Int(resultado, 0); Out.Ln;
  Out.Ln;

  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END Soma.