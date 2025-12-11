MODULE c09ex03;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  caractere: CHAR;
  pausa: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO1.TXT");

  IF (arq = NIL) THEN
    Out.String("Arquivo 'EXEMPLO1.TXT' nao encontrado."); 
    Out.Ln;
  ELSE
    Files.Set(cursorArq, arq, 0);

    WHILE (cursorArq.eof # TRUE) DO
      Files.ReadChar(cursorArq, caractere);
      IF (cursorArq.eof # TRUE) THEN
        Out.Char(caractere);
      END;
    END;
    Out.Ln();

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex03.
