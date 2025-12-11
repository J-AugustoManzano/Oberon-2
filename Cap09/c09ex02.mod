MODULE c09ex02;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  i, tamArq: INTEGER;
  mensagem: ARRAY 256 OF CHAR;
  pausa, caractere: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO1.TXT");

  IF (arq = NIL) THEN
    Out.String("Arquivo 'EXEMPLO1.TXT' nao encontrado."); 
    Out.Ln;
  ELSE
    tamArq := Files.Length(arq);
    Files.Set(cursorArq, arq, tamArq);

    Out.String("Informe uma mensagem:"); 
    Out.Ln;
    Out.String("--> ");

    i := 0;
    REPEAT
      In.Char(caractere); 
      IF (caractere # 0DX) & (caractere # 0AX) THEN
        IF (i < (LEN(mensagem) - 1)) THEN
          mensagem[i] := caractere;
          INC(i);
        END;
      END;
    UNTIL (caractere = 0DX) OR (caractere = 0AX);
    mensagem[i] := 0X; 

    IF (tamArq > 0) THEN
      Files.WriteChar(cursorArq, 0DX);
      Files.WriteChar(cursorArq, 0AX);
    END;

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
END c09ex02.
