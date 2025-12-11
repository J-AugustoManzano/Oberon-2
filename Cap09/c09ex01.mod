MODULE c09ex01;

IMPORT Out, In, Files, Texts;

VAR
  arq: Files.File;
  pausa: CHAR;

BEGIN
  arq := Files.New("EXEMPLO1.TXT");

  IF (arq = NIL) THEN
    Out.String("Erro ao criar o arquivo.");
    Out.Ln;
  ELSE
    Out.String("Arquivo criado com sucesso.");
    Out.Ln;
    Files.Register(arq);
  END;

  Files.Close(arq);

  Out.Ln();
  Out.String("Tecla <Enter> para finalizar... ");
  In.Char(pausa)
END c09ex01.
