MODULE Math2;

CONST
  PI* = 3.1415926535;
  E*  = 2.7182818284;

(* Converte REAL para INTEGER (truncamento) *)
PROCEDURE int*(x: REAL): INTEGER;
VAR
  i: INTEGER;
  r: REAL;
BEGIN
  i := 0;
  r := 0.0;
  IF (x >= 0.0) THEN
    WHILE (r + 1.0 <= x) DO
      i := i + 1;
      r := r + 1.0
    END
  ELSE
    WHILE (r - 1.0 >= x) DO
      i := i - 1;
      r := r - 1.0
    END
  END;
  RETURN i
END int;

(* Verifica se x > n *)
PROCEDURE greaterThanInt(x: REAL; n: INTEGER): BOOLEAN;
VAR
  r: REAL;
  i: INTEGER;
BEGIN
  r := 0.0;
  IF (n >= 0) THEN
    FOR i := 1 TO n DO r := r + 1.0 END
  ELSE
    FOR i := n TO -1 BY 1 DO r := r - 1.0 END
  END;
  RETURN (x > r)
END greaterThanInt;

(* Verifica se x < n *)
PROCEDURE lessThanInt(x: REAL; n: INTEGER): BOOLEAN;
VAR
  r: REAL;
  i: INTEGER;
BEGIN
  r := 0.0;
  IF (n >= 0) THEN
    FOR i := 1 TO n DO r := r + 1.0 END
  ELSE
    FOR i := n TO -1 BY 1 DO r := r - 1.0 END
  END;
  RETURN (x < r)
END lessThanInt;

(* Função para valor absoluto *)
PROCEDURE abs*(x: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (x < 0) THEN
    resp := -x
  ELSE
    resp := x
  END;
  RETURN resp
END abs;

(* Arredondamento para cima *)
PROCEDURE ceil*(x: REAL): INTEGER;
VAR
  resp, n: INTEGER;
BEGIN
  n := int(x);
  IF (greaterThanInt(x, n)) THEN
    resp := n + 1
  ELSE
    resp := n
  END;
  RETURN resp
END ceil;

(* Arredondamento para baixo *)
PROCEDURE floor*(x: REAL): INTEGER;
VAR
  resp, n: INTEGER;
BEGIN
  n := int(x);
  IF (lessThanInt(x, n)) THEN
    resp := n - 1
  ELSE
    resp := n
  END;
  RETURN resp
END floor;

(* Fibonacci com recursão de cauda *)
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

PROCEDURE fibonacci*(n: INTEGER): INTEGER;
BEGIN
  RETURN FibonacciBase(n, 0, 1)
END fibonacci;

(* Fatorial com recursão de cauda *)
PROCEDURE FactorialBase(n, acc: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) THEN
    resp := acc
  ELSE
    resp := FactorialBase(n - 1, n * acc)
  END;
  RETURN resp
END FactorialBase;

PROCEDURE factorial*(n: INTEGER): INTEGER;
BEGIN
  RETURN FactorialBase(n, 1)
END factorial;

(* Soma acumulada de 1 até n com recursão de cauda *)
PROCEDURE SummaryBase(n, acc: INTEGER): INTEGER;
VAR
  resp: INTEGER;
BEGIN
  IF (n = 0) THEN
    resp := acc
  ELSE
    resp := SummaryBase(n - 1, acc + n)
  END;
  RETURN resp
END SummaryBase;

PROCEDURE summary*(n: INTEGER): INTEGER;
BEGIN
  RETURN SummaryBase(n, 0)
END summary;

END Math2.
