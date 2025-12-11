MODULE c09ex04;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  num: ARRAY 5 OF REAL;
  i: INTEGER;
  pausa: CHAR; 
  arquivoPronto: BOOLEAN;

BEGIN
  arq := Files.New("EXEMPLO2.BIN");
  arquivoPronto := FALSE;

  IF (arq = NIL) THEN
    Out.String("Arquivo 'EXEMPLO2.BIN' nao foi criado. ");
    Out.String("Verifique permissoes de acesso."); 
    Out.Ln;
  ELSE
    Files.Register(arq);
    Out.String("Arquivo 'EXEMPLO2.BIN' criado com sucesso."); 
    Out.Ln;

    arq := Files.Old("EXEMPLO2.BIN");

    IF (arq = NIL) THEN
      Out.String("Erro FATAL: "); 
      Out.String("Nao foi possivel reabrir o ");
      Out.String("arquivo 'EXEMPLO2.BIN' "); 
      Out.String("apos criacao."); 
      Out.Ln;
    ELSE
      arquivoPronto := TRUE;
    END;
  END;

  IF (arquivoPronto) THEN
    Files.Set(cursorArq, arq, 0);

    Out.Ln;
    Out.String("Informe 5 valores reais:"); Out.Ln;
    Out.Ln;
    FOR i := 0 TO 4 DO
      Out.String("Valor "); Out.Int(i + 1, 0); 
      Out.String(" --> ");
      In.Real(num[i]);
    END;

    FOR i := 0 TO 4 DO
      Files.WriteReal(cursorArq, num[i]);
    END;

    Files.Close(arq);

    Out.Ln;
    Out.String("Valores gravados no arquivo 'EXEMPLO2.BIN'."); 
    Out.Ln;
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex04.
