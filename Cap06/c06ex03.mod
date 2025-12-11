MODULE c06ex03;

IMPORT In, Out;

VAR
  A, B: INTEGER;
  pausa: CHAR;

PROCEDURE Troca;
VAR
  X: INTEGER;
BEGIN
  X := A;
  A := B;
  B := X;
END Troca;

BEGIN
  Out.String("Entre um valor para a variavel <A>: ");
  In.Int(A);

  Out.String("Entre um valor para a variavel <B>: ");
  In.Int(B);

  Troca;

  Out.Ln;
  Out.String("Variavel <A> com valor ");
  Out.Int(A, 0); 
  
  Out.Ln;
  Out.String("Variavel <B> com valor ");
  Out.Int(B, 0); 
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c06ex03.
