MODULE c06ex09;

IMPORT In, Out;

VAR
  limite, i: INTEGER;
  pausa: CHAR;

PROCEDURE Fibonacci(n: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) OR (n = 1) THEN
    resp := n
  ELSE
    resp := Fibonacci(n - 1) + Fibonacci(n - 2)
  END;
  RETURN resp
END Fibonacci;

BEGIN
  Out.String("Qual termo da sequencia de Fibonacci: ");
  In.Int(limite);

  Out.String("Sequencia de Fibonacci ate o termo ");
  Out.Int(limite, 0);
  Out.String(": ");
  Out.Ln;

  i := 1;
  WHILE (i <= limite) DO
    Out.Int(Fibonacci(i), 0);
    Out.String(" ");
    i := i + 1
  END;
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c06ex09.
