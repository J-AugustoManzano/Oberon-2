MODULE c09ex06;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  valor: REAL;
  resp, pausa: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO3.BIN");

  IF (arq = NIL) THEN
    arq := Files.New("EXEMPLO3.BIN");
    IF (arq # NIL) THEN
      Files.Register(arq);
      arq := Files.Old("EXEMPLO3.BIN");
    END;
  END;

  IF (arq # NIL) THEN
    Files.Set(cursorArq, arq, Files.Length(arq));

    Out.String("CADASTRO SEQUENCIAL DE VALORES"); Out.Ln;

    REPEAT
      Out.Ln;
      Out.String("Entre um valor: ");
      In.Real(valor);
      
      Files.WriteReal(cursorArq, valor);

      Out.Ln;
      Out.String("Deseja continuar? "); Out.Ln;
      Out.String("[S] Sim ");
      Out.String("[qualquer letra] Nao ");
      Out.String("--> ");
      In.Char(resp);

    UNTIL (resp # 'S') & (resp # 's');

    Files.Close(arq);
  ELSE
    Out.String("Arquivo 'EXEMPLO3.BIN'nao pode ser abeto. ");
    Out.String("Verifique permissoes."); Out.Ln;
  END;
  REPEAT In.Char(resp) UNTIL (resp = 0AX);

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex06.
