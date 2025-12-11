MODULE c09ex07;

IMPORT Out, In, Files;

VAR
  arq: Files.File;
  cursorArq: Files.Rider;
  valor: REAL;
  pos, tamArq, tamReg, nrRegs: INTEGER; 
  resp, pausa: CHAR;

BEGIN
  arq := Files.Old("EXEMPLO3.BIN");

  IF (~(arq = NIL)) THEN
    tamArq := Files.Length(arq);
    tamReg := 4; 
    
    IF (tamReg = 0) THEN
      nrRegs := 0;
    ELSE
      nrRegs := tamArq DIV tamReg;
    END;

    Out.String("PESQUISA DIRETA DE VALORES"); Out.Ln;
    Out.Ln;

    IF (nrRegs = 0) THEN
      Out.String("O arquivo esta vazio."); Out.Ln;
    ELSE
      Out.String("O arquivo possui "); Out.Int(nrRegs, 0);
      IF (nrRegs = 1) THEN
        Out.String(" registro."); Out.Ln;
      ELSE
        Out.String(" registros."); Out.Ln;
      END;
    END;

    REPEAT
      Out.Ln;
      Out.String("Entre a posicao a ser pesquisada: ");
      In.Int(pos);

      Out.Ln;
      IF (pos >= 1) & (pos <= nrRegs) THEN
        Files.Set(cursorArq, arq, (pos - 1) * tamReg);
        Files.ReadReal(cursorArq, valor);
        Out.String("Valor "); Out.RealFix(valor, 0, 0); 
        Out.String(" na posicao "); Out.Int(pos, 0); 
        Out.Ln;
      ELSE
        Out.String("Posicao informada - invalida."); 
        Out.Ln;
      END;

      Out.Ln;
      Out.String("Deseja continuar? "); Out.Ln;
      Out.String("[S] Sim ");
      Out.String("[qualquer letra] Nao ");
      Out.String("--> ");
      In.Char(resp);

    UNTIL (resp # 'S') & (resp # 's');
    REPEAT In.Char(resp) UNTIL (resp = 0AX);

    Files.Close(arq);
  END;

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c09ex07.
