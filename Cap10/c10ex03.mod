MODULE c10ex03;

IMPORT Out, In;

VAR
  numeros: ARRAY 5 OF INTEGER;
  i, j, vlrAtual: INTEGER;
  pausa: CHAR;

PROCEDURE OrdenarNumeros(VAR arr: ARRAY OF INTEGER);
VAR
  idxI, idxJ, chave: INTEGER;
BEGIN
  FOR idxI := 1 TO LEN(arr) - 1 DO
    chave := arr[idxI];
    idxJ := idxI - 1;
    WHILE (idxJ >= 0) & (arr[idxJ] > chave) DO
      arr[idxJ + 1] := arr[idxJ];
      DEC(idxJ);
    END;
    arr[idxJ + 1] := chave;
  END;
END OrdenarNumeros;

BEGIN
  Out.String("CLASSIFICACAO DE NUMEROS (CRESCENTE)"); 
  Out.Ln;
  Out.Ln;

  FOR i := 0 TO 4 DO
    Out.String("Entre o "); Out.Int(i + 1, 0); 
    Out.String("o. numero: ");
    In.Int(numeros[i]);
  END;

  OrdenarNumeros(numeros);

  Out.Ln;
  FOR i := 0 TO 4 DO
    Out.Int(i + 1, 0); Out.String("o. numero: "); 
    Out.Int(numeros[i], 0); Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex03.
