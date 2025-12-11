MODULE c09ex10;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  mensagem: ARRAY 256 OF CHAR;
  i, tamMsg: INTEGER;
  pausa, caractere: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO6.BIN");

  IF (~(arq = NIL)) THEN
    Files.Set(cursorArq, arq, 0);

    WHILE (cursorArq.eof # TRUE) DO
      Files.ReadInt(cursorArq, tamMsg);

      IF (cursorArq.eof # TRUE) THEN
        FOR i := 0 TO tamMsg - 1 DO
          IF (cursorArq.eof # TRUE) THEN
            Files.ReadChar(cursorArq, caractere);
            IF (i < (LEN(mensagem) - 1)) THEN
              mensagem[i] := caractere;
            END;
          END;
        END;
        
        IF (tamMsg < LEN(mensagem)) THEN
          mensagem[tamMsg] := 0X;
        ELSE
          mensagem[LEN(mensagem) - 1] := 0X;
        END;

        Out.String("Mensagem: "); Out.String(mensagem); Out.Ln;
      END;
    END;

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex10.
