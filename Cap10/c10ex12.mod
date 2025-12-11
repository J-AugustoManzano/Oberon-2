MODULE c10ex12;

IMPORT In, Out, Strings;

VAR
  palavra: ARRAY 128 OF CHAR;
  sub: ARRAY 128 OF CHAR;
  i, tamanhoPalavra: INTEGER;
  pausa, ch: CHAR;

BEGIN
  Out.String("Entre uma palavra: ");

  i := 0;
  REPEAT
    In.Char(ch);
    IF (ch # 0DX) & (ch # 0AX) & (i < LEN(palavra) - 1) THEN
      palavra[i] := ch;
      INC(i);
    END;
  UNTIL (ch = 0DX) OR (ch = 0AX);
  palavra[i] := 0X;

  Out.Ln;

  tamanhoPalavra := Strings.Length(palavra);

  FOR i := 0 TO tamanhoPalavra DO
    Strings.Extract(palavra, 0, i, sub);
    Out.String(sub);
    Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c10ex12.