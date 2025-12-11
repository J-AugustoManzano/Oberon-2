MODULE c04ex13;

IMPORT Out, In;

VAR
  contador: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("--- Contagem de 1 a 10 com INC de 2 em 2 ---"); Out.Ln;
  Out.Ln;

  contador := 1;

  WHILE contador <= 10 DO
    Out.Int(contador, 2);
    Out.Ln;
    INC(contador, 2);
  END;

  Out.Ln;
  Out.String("Pressione <Enter> para encerrar... ");
  In.Char(pausa);
END c04ex13.