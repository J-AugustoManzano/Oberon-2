MODULE c06ex02;

IMPORT In, Out;

VAR
  a, b, x: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre um valor para a variavel <A>: ");
  In.Int(a);

  Out.String("Entre um valor para a variavel <B>: ");
  In.Int(b);

  x := a;
  a := b;
  b := x;

  Out.Ln;
  Out.String("Variavel <A> com valor ");
  Out.Int(a, 0);

  Out.Ln;
  Out.String("Variavel <B> com valor ");
  Out.Int(b, 0);
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c06ex02.
