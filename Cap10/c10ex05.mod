MODULE c10ex05;

IMPORT Out, In;

CONST
  COMPRIMENTO_NOME = 64;
  NUMERO_NOMES = 10;

TYPE
  IDENT = ARRAY COMPRIMENTO_NOME OF CHAR;

VAR
  nomes: ARRAY NUMERO_NOMES OF IDENT;
  tempSim, pesqNome, resp, segue: IDENT;
  i: INTEGER;
  acha: BOOLEAN;
  pausa: CHAR;

PROCEDURE CopiaNomes(VAR orig, dest: ARRAY OF CHAR);
VAR
  k: INTEGER;
BEGIN
  k := 0;
  WHILE (orig[k] # 0X) & (k < LEN(dest) - 1) DO
    dest[k] := orig[k];
    INC(k);
  END;
  dest[k] := 0X;
END CopiaNomes;

PROCEDURE ReadLine(VAR s: ARRAY OF CHAR);
VAR
  k: INTEGER;
  caractere: CHAR;
BEGIN
  k := 0;
  REPEAT
    In.Char(caractere);
    IF (caractere # 0DX) & (caractere # 0AX) THEN
      IF (k < (LEN(s) - 1)) THEN
        s[k] := caractere;
        INC(k);
      END;
    END;
  UNTIL (caractere = 0DX) OR (caractere = 0AX);
  s[k] := 0X;
END ReadLine;

PROCEDURE CompareNomes(s1, s2: ARRAY OF CHAR): INTEGER;
VAR
  i: INTEGER;
  resultado: INTEGER;
BEGIN
  i := 0;
  resultado := 0;
  WHILE (s1[i] # 0X) & (s2[i] # 0X) & (resultado = 0) DO
    IF (s1[i] < s2[i]) THEN
      resultado := -1;
    ELSIF (s1[i] > s2[i]) THEN
      resultado := 1;
    END;
    INC(i);
  END;
  IF (resultado = 0) THEN
    IF (s1[i] = 0X) & (s2[i] # 0X) THEN
      resultado := -1;
    ELSIF (s1[i] # 0X) & (s2[i] = 0X) THEN
      resultado := 1;
    END;
  END;
  RETURN resultado
END CompareNomes;

PROCEDURE Maiusculo(VAR s: ARRAY OF CHAR);
VAR
  k: INTEGER;
  ch: CHAR;
BEGIN
  k := 0;
  WHILE (s[k] # 0X) DO
    ch := s[k];
    IF (ch >= 'a') & (ch <= 'z') THEN
      s[k] := CHR(ORD(ch) - (ORD('a') - ORD('A')));
    END;
    INC(k);
  END;
END Maiusculo;

BEGIN
  Out.String("PESQUISA SEQUENCIAL DE NOMES"); Out.Ln;
  Out.Ln;

  FOR i := 0 TO NUMERO_NOMES - 1 DO
    Out.String("Entre o "); 
    Out.Int(i + 1, 2); Out.String("o. nome: ");
    ReadLine(nomes[i]);
  END;

  tempSim := "SIM";
  CopiaNomes(tempSim, segue);

  WHILE (CompareNomes(segue, "SIM") = 0) DO
    Out.Ln;
    Out.String("Entre o nome a ser pesquisado: ");
    ReadLine(pesqNome);
    
    i := 0;
    acha := FALSE;

    WHILE (i < NUMERO_NOMES) & (acha = FALSE) DO
      IF (CompareNomes(pesqNome, nomes[i]) = 0) THEN
        acha := TRUE;
      ELSE
        INC(i);
      END;
    END;

    IF (acha = TRUE) THEN
      Out.Ln;
      Out.String(pesqNome); 
      Out.String(" foi localizado na posicao "); 
      Out.Int(i + 1, 0); Out.Ln;
    ELSE
      Out.Ln;
      Out.String(pesqNome); 
      Out.String(" nao foi localizado"); Out.Ln;
    END;

    Out.Ln;
    REPEAT
      Out.String("Deseja seguer? (SIM/NAO): ");
      ReadLine(resp);
      Maiusculo(resp);
      CopiaNomes(resp, segue);

      IF (CompareNomes(segue, "SIM") # 0) & 
        (CompareNomes(segue, "NAO") # 0) THEN
        Out.String("Informe apenas SIM ou NAO."); Out.Ln;
        Out.Ln;
      END;
    UNTIL (CompareNomes(segue, "SIM") = 0) OR 
          (CompareNomes(segue, "NAO") = 0);
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex05.
