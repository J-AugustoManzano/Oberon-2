MODULE c10ex04;

IMPORT Out, In;

CONST
  COMPRIMENTO_NOME = 64;
  NUMERO_NOMES = 5;

TYPE
  IDENT = ARRAY COMPRIMENTO_NOME OF CHAR;

VAR
  nomes: ARRAY NUMERO_NOMES OF IDENT;
  i, j: INTEGER;
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

PROCEDURE ComparNomes(s1, s2: ARRAY OF CHAR): INTEGER;
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
END ComparNomes;

PROCEDURE ClassifNomes(VAR arr: ARRAY OF IDENT; o: BOOLEAN);
VAR
  indiceI, indiceJ: INTEGER;
  chave: IDENT;
BEGIN
  FOR indiceI := 1 TO LEN(arr) - 1 DO
    CopiaNomes(arr[indiceI], chave);
    indiceJ := indiceI - 1;
    IF (o = TRUE) THEN
      WHILE (indiceJ >= 0) & 
        (ComparNomes(arr[indiceJ], chave) > 0) DO
        CopiaNomes(arr[indiceJ], arr[indiceJ + 1]);
        DEC(indiceJ);
      END;
    ELSE
      WHILE (indiceJ >= 0) & 
        (ComparNomes(arr[indiceJ], chave) < 0) DO
        CopiaNomes(arr[indiceJ], arr[indiceJ + 1]);
        DEC(indiceJ);
      END;
    END;
    CopiaNomes(chave, arr[indiceJ + 1]);
  END;
END ClassifNomes;

BEGIN
Out.String("CLASSIFICACAO DE NOMES (DECRESCENTE)"); 
  Out.Ln;
  Out.Ln;

  FOR i := 0 TO NUMERO_NOMES - 1 DO
    Out.String("Entre o "); Out.Int(i + 1, 0); 
    Out.String("o. nome: ");
    ReadLine(nomes[i]);
  END;

  ClassifNomes(nomes, FALSE);

  Out.Ln;
  FOR i := 0 TO NUMERO_NOMES - 1 DO
    Out.Int(i + 1, 0); Out.String("o. nome: "); 
    Out.String(nomes[i]); Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex04.
