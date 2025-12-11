MODULE c09ex12;

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
  sair: BOOLEAN;
  pausa, caracter: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO07.BIN");

  IF (~(arq = NIL)) THEN
    Out.String("RELATORIO DE REGISTROS DE DADOS PESSOAIS"); Out.Ln;
    Out.Ln;

    Out.String("Nome");
    Out.String("                                     ");
    Out.String("Idade"); Out.Ln;
    Out.Ln;

    Files.Set(cursorArq, arq, 0);

    WHILE (cursorArq.eof # TRUE) DO
      sair := FALSE;
      Files.ReadInt(cursorArq, tamNome);

      IF (cursorArq.eof # TRUE) THEN
        FOR i := 0 TO tamNome - 1 DO
          IF (cursorArq.eof # TRUE) THEN
            Files.ReadChar(cursorArq, caracter);
            IF (i < (LEN(regPessoa.nome) - 1)) THEN
              regPessoa.nome[i] := caracter;
            END;
          ELSE
            sair := TRUE; 
          END;
        END;
        
        IF (sair = FALSE) THEN 
          IF (tamNome < LEN(regPessoa.nome)) THEN
            regPessoa.nome[tamNome] := 0X;
          ELSE
            regPessoa.nome[LEN(regPessoa.nome) - 1] := 0X;
          END;

          Files.ReadInt(cursorArq, regPessoa.idade);
          IF (cursorArq.eof # TRUE) THEN
            Out.String(regPessoa.nome);
            FOR i := 0 TO (41 - tamNome) - 1 DO 
              Out.Char(' '); 
            END;
            Out.Int(regPessoa.idade, 5); Out.Ln;
          END;
        END;
      END;
    END;

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex12.
