MODULE c05ex02;

IMPORT In, Out;

VAR
  notas: ARRAY 8, 4 OF REAL;
  i, j: INTEGER;
  pausa: CHAR;

BEGIN
  FOR i := 0 TO 7 DO
    Out.String("Entre as notas do aluno ");
    Out.Int(i + 1, 0);  (* Exibição de 1 a 8 *)
    Out.Ln;

    FOR j := 0 TO 3 DO
      Out.String("Nota ");
      Out.Int(j + 1, 0);  (* Exibição de 1 a 4 *)
      Out.String(": ");
      In.Real(notas[i][j])
    END;

    Out.Ln;
  END;

  Out.Ln;
  Out.String("RELATORIO DE NOTAS"); Out.Ln;
  Out.String("Aluno Nota1 Nota2 Nota3 Nota4"); Out.Ln;
  Out.String("----- ----- ----- ----- -----"); Out.Ln;

  FOR i := 0 TO 7 DO
    Out.Int(i + 1, 5);
    FOR j := 0 TO 3 DO
      Out.Char(' ');
      Out.RealFix(notas[i][j], 5, 1)
    END;
    Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c05ex02.
