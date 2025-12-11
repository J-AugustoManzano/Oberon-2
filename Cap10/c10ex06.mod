MODULE c10ex06;

IMPORT Out, In;

CONST
  NUMERO_ELEMENTOS = 10;

VAR
  numeros: ARRAY NUMERO_ELEMENTOS OF INTEGER;
  i, j, pesq, comeco, fim, meio, posicao: INTEGER;
  resp, buffer, pausa: CHAR;

PROCEDURE Troca(VAR a, b: INTEGER);
VAR x: INTEGER;
BEGIN
  x := a;
  a := b;
  b := x
END Troca;

PROCEDURE Particiona(VAR num: ARRAY OF INTEGER; 
  inicio, fim: INTEGER): INTEGER;
VAR pivo, k, j: INTEGER;
BEGIN
  pivo := num[fim];
  k := inicio - 1;
  FOR j := inicio TO fim - 1 DO
    IF (num[j] <= pivo) THEN
      INC(k);
      Troca(num[k], num[j])
    END
  END;
  Troca(num[k + 1], num[fim]);
  RETURN k + 1
END Particiona;

PROCEDURE QuickSort(VAR num: ARRAY OF INTEGER; 
  inicio, fim: INTEGER);
VAR indicePivo: INTEGER;
BEGIN
  IF (inicio < fim) THEN
    indicePivo := Particiona(num, inicio, fim);
    QuickSort(num, inicio, indicePivo - 1);
    QuickSort(num, indicePivo + 1, fim)
  END
END QuickSort;

PROCEDURE PesqBin(num: ARRAY OF INTEGER; 
  vlrPesq: INTEGER; VAR pos: INTEGER): BOOLEAN;
VAR comeco, fim, meio: INTEGER;
VAR acha: BOOLEAN;
BEGIN
  comeco := 0;
  fim := LEN(num) - 1;
  acha := FALSE;
  pos := -1;

  WHILE (comeco <= fim) & (acha = FALSE) DO
    meio := (comeco + fim) DIV 2;
    IF (vlrPesq = num[meio]) THEN
      acha := TRUE;
      pos := meio + 1
    ELSIF (vlrPesq < num[meio]) THEN
      fim := meio - 1
    ELSE
      comeco := meio + 1
    END
  END;
  RETURN acha
END PesqBin;

BEGIN
  Out.String("PESQUISA BINARIA DE NUMEROS"); 
  Out.Ln;
  Out.Ln;

  FOR i := 0 TO NUMERO_ELEMENTOS - 1 DO
    Out.String("Entre o "); Out.Int(i + 1, 2); 
    Out.String("o. numero: ");
    In.Int(numeros[i])
  END;

  QuickSort(numeros, 0, NUMERO_ELEMENTOS - 1);

  resp := 'S';
  WHILE (resp = 'S') OR (resp = 's') DO

    Out.Ln;
    Out.String("Entre o numero a ser pesquisado: ");
    In.Int(pesq);

    IF (PesqBin(numeros, pesq, posicao) = TRUE) THEN
      Out.Ln;
      Out.Int(pesq, 0); 
      Out.String(" foi localizado na posicao "); 
      Out.Int(posicao, 0); 
      Out.Ln
    ELSE
      Out.Ln;
      Out.Int(pesq, 0); Out.String(" nao foi localizado"); 
      Out.Ln
    END;

    Out.Ln;
    REPEAT
      Out.String("Deseja continuar? (S/N): ");
      In.Char(resp);
      REPEAT In.Char(buffer) UNTIL (buffer = 0AX);

      IF (resp # 'S') & (resp # 's') & 
        (resp # 'N') & (resp # 'n') THEN
        Out.String("Informe apenas S ou N."); Out.Ln; Out.Ln
      END
    UNTIL (resp = 'S') OR (resp = 's') OR 
          (resp = 'N') OR (resp = 'n')
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex06.
