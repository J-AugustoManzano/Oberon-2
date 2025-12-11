MODULE c10ex11;

IMPORT In, Out, Strings;

VAR
  verbo: ARRAY 64 OF CHAR;
  raiz: ARRAY 64 OF CHAR;
  terminacao: ARRAY 3 OF CHAR;
  i, tamanhoVerbo: INTEGER;
  pausa, ch: CHAR;

BEGIN
  Out.String("Entre um verbo regular (terminado em 'ar'): ");

  i := 0;
  REPEAT
    In.Char(ch);
    IF (ch # 0DX) & (ch # 0AX) & (i < LEN(verbo) - 1) THEN
      verbo[i] := ch;
      INC(i);
    END;
  UNTIL (ch = 0DX) OR (ch = 0AX);
  verbo[i] := 0X;

  Out.Ln;

  tamanhoVerbo := Strings.Length(verbo);

  IF (tamanhoVerbo >= 2) THEN
    Strings.Extract(verbo, 0, tamanhoVerbo - 2, raiz);

    terminacao[0] := verbo[tamanhoVerbo - 2];
    terminacao[1] := verbo[tamanhoVerbo - 1];
    terminacao[2] := 0X;
  ELSE
    raiz[0] := 0X;
    terminacao[0] := 0X;
  END;

  IF (tamanhoVerbo >= 2) & (terminacao[0] = 'a') &
     (terminacao[1] = 'r') & (terminacao[2] = 0X) THEN

    Out.String("Eu ");   Out.String(raiz); Out.String("o"); 
    Out.Ln;
    Out.String("Tu ");   Out.String(raiz); Out.String("as"); 
    Out.Ln;
    Out.String("Ele ");  Out.String(raiz); Out.String("a"); 
    Out.Ln;
    Out.String("Nos ");  Out.String(raiz); Out.String("amos"); 
    Out.Ln;
    Out.String("Vos ");  Out.String(raiz); Out.String("ais"); 
    Out.Ln;
    Out.String("Eles "); Out.String(raiz); Out.String("am"); 
    Out.Ln;
  ELSE
    Out.String("O verbo fornecido nao e valido."); Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c10ex11.