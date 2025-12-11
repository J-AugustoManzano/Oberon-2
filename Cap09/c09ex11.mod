MODULE c09ex11;

IMPORT Out, In, Files;

CONST
  COMPRIMENTO_NOME = 64;

TYPE
  Pessoa = RECORD
    nome: ARRAY COMPRIMENTO_NOME OF CHAR;
    idade: INTEGER;
  END;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  regPessoa: Pessoa;
  i, tamNome: INTEGER;
  resp, pausa, caracter: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO07.BIN");

  IF (arq = NIL) THEN
    arq := Files.New("EXEMPLO07.BIN");
    IF (arq # NIL) THEN
      Files.Register(arq);
      arq := Files.Old("EXEMPLO07.BIN");
    END;
  END;

  IF (arq # NIL) THEN
    Files.Set(cursorArq, arq, Files.Length(arq));

    Out.String("CADASTRO DE REGISTRO DE DADOS PESSOAIS"); Out.Ln;

    REPEAT
      Out.Ln;
      Out.String("Entre nome ....: ");
      i := 0;
      REPEAT
        In.Char(caracter);
        IF (caracter # 0DX) & (caracter # 0AX) THEN
          IF (i < (LEN(regPessoa.nome) - 1)) THEN
            regPessoa.nome[i] := caracter;
            INC(i);
          END;
        END;
      UNTIL (caracter = 0DX) OR (caracter = 0AX);
      regPessoa.nome[i] := 0X;
      tamNome := i;

      Out.String("Entre idade ...: ");
      In.Int(regPessoa.idade);

      Files.WriteInt(cursorArq, tamNome);
      i := 0;
      WHILE (regPessoa.nome[i] # 0X) DO
        Files.WriteChar(cursorArq, regPessoa.nome[i]);
        INC(i);
      END;
      Files.WriteInt(cursorArq, regPessoa.idade);

      Out.Ln;
      Out.String("Deseja continuar? [S] Sim ");
      Out.String("[qualquer letra] Nao --> ");
      In.Char(resp);
      REPEAT In.Char(caracter) UNTIL (caracter = 0AX);

    UNTIL (resp # 'S') & (resp # 's');

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex11.
