MODULE c06ex11;

IMPORT In, Out;

VAR
  limite, i: INTEGER;
  pausa: CHAR;

PROCEDURE FibonacciBase(n, x, y: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) THEN
    resp := x
  ELSIF (n = 1) THEN
    resp := y
  ELSE
    resp := FibonacciBase(n - 1, y, x + y)
  END;
  RETURN resp
END FibonacciBase;

PROCEDURE Fibonacci(n: INTEGER): INTEGER;
BEGIN
  RETURN FibonacciBase(n, 0, 1)
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
  In.Char(pausa)
END c06ex11.
