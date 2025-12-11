MODULE c09ex09;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  mensagem: ARRAY 256 OF CHAR;
  tamMsg: INTEGER;
  i: INTEGER;
  caractere, pausa: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO6.BIN");

  IF (arq = NIL) THEN
    arq := Files.New("EXEMPLO6.BIN");
    IF (arq # NIL) THEN
      Files.Register(arq);
      arq := Files.Old("EXEMPLO6.BIN");
    END;
  END;

  IF (arq # NIL) THEN
    Files.Set(cursorArq, arq, Files.Length(arq));

    Out.String("GRAVACAO BINARIA DE MENSAGENS"); Out.Ln;
    Out.Ln;

    Out.String("Informe uma mensagem (max 255 caracteres):"); Out.Ln;
    Out.String("--> ");

    i := 0;
    REPEAT
      In.Char(caractere);
      IF (caractere # 0DX) & (caractere # 0AX) THEN
        IF i < (LEN(mensagem) - 1) THEN
          mensagem[i] := caractere;
          INC(i);
        END;
      END;
    UNTIL (caractere = 0DX) OR (caractere = 0AX);
    mensagem[i] := 0X;
    
    tamMsg := i;

    Files.WriteInt(cursorArq, tamMsg);

    i := 0;
    WHILE (mensagem[i] # 0X) DO
      Files.WriteChar(cursorArq, mensagem[i]);
      INC(i);
    END;

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex09.
