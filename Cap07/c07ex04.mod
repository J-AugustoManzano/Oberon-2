MODULE c07ex04;

IMPORT In, Out;

TYPE
  NomePtr = POINTER TO NomeRec;
  NomeRec = RECORD
    valor: ARRAY 80 OF CHAR;
  END;

VAR
  nomes: POINTER TO ARRAY OF NomePtr;
  entrada: ARRAY 80 OF CHAR;
  n, i, j: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre a quantidade de elementos da matriz: "); 
  In.Int(n); 
  Out.Ln;

  NEW(nomes, n);

  FOR i := 0 TO n - 1 DO
    Out.String("Entre o nome ");
    Out.Int(i + 1, 0); 
    Out.String(": ");
    In.Line(entrada);

    NEW(nomes[i]);
    
    j := 0;
    WHILE (entrada[j] # 0X) & (j < LEN(nomes[i]^.valor)) DO
      nomes[i]^.valor[j] := entrada[j];
      INC(j)
    END;
    nomes[i]^.valor[j] := 0X;  (* finaliza string *)
  END;

  Out.Ln;
  Out.String("Foram fornecidos os nomes:"); 
  Out.Ln; 
  Out.Ln;

  FOR i := 0 TO n - 1 BY 1 DO
    Out.String("Nome ");
    Out.Int(i + 1, 0);
    Out.String(" = ");
    Out.String(nomes[i]^.valor);
    Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex04.
