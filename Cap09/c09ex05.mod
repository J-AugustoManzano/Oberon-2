MODULE c09ex05;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  num: ARRAY 5 OF REAL;
  i: INTEGER;
  pausa: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO2.BIN");

  IF (arq = NIL) THEN
    Out.String("Arquivo 'EXEMPLO2.BIN' nao encontrado."); 
    Out.Ln;
  ELSE
    Out.String("Arquivo 'EXEMPLO2.BIN' aberto para leitura."); 
    Out.Ln; Out.Ln;

    Files.Set(cursorArq, arq, 0);

    Out.String("O arquivo 'EXEMPLO2.BIN' possui os valores: "); 
    Out.Ln; Out.Ln;

    FOR i := 0 TO 4 DO
      Files.ReadReal(cursorArq, num[i]);
      Out.String("Valor "); Out.Int(i + 1, 0); Out.String(": "); 
      Out.RealFix(num[i], 3, 2); 
      Out.Ln;
    END;

    Files.Close(arq);

    Out.Ln;
    Out.String("Leitura dos valores concluida."); Out.Ln;
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex05.
