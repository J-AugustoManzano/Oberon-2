MODULE c05ex01;

IMPORT In, Out;

VAR
  md: ARRAY 8 OF REAL;
  soma, media: REAL;
  i: INTEGER;
  pausa: CHAR;

BEGIN
  soma := 0.0;

  FOR i := 0 TO 7 DO
    Out.String("Entre a media do aluno ");
    Out.Int(i + 1, 0);
    Out.String(": ");
    In.Real(md[i]);

    soma := soma + md[i];
  END;

  media := soma / 8.0;

  Out.Ln;
  Out.String("Media geral: ");
  Out.RealFix(media, 5, 2);
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c05ex01.
