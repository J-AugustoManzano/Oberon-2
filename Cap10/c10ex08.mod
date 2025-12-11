MODULE c10ex08;

IMPORT Out, In;

CONST
  FIM = 10;

VAR
  matriz: ARRAY (FIM + 1) OF INTEGER;
  inicio, opcao: INTEGER;

PROCEDURE Vazia(): BOOLEAN;
BEGIN
  RETURN inicio = 0
END Vazia;

PROCEDURE Cheia(): BOOLEAN;
BEGIN
  RETURN inicio = FIM
END Cheia;

PROCEDURE Adicionar(elemento: INTEGER): BOOLEAN;
VAR
  resultado: BOOLEAN;
BEGIN
  IF (Cheia()) THEN
    resultado := FALSE
  ELSE
    INC(inicio);
    matriz[inicio] := elemento;
    resultado := TRUE
  END;
  RETURN resultado
END Adicionar;

PROCEDURE Retirar(VAR elemento: INTEGER): BOOLEAN;
VAR
  i: INTEGER;
  resultado: BOOLEAN;
BEGIN
  IF (Vazia()) THEN
    resultado := FALSE
  ELSE
    elemento := matriz[1];
    FOR i := 1 TO inicio - 1 DO
      matriz[i] := matriz[i + 1]
    END;
    DEC(inicio);
    resultado := TRUE
  END;
  RETURN resultado
END Retirar;

PROCEDURE Entrada;
VAR
  x: INTEGER;
BEGIN
  Out.String("Entre com um elemento numerico: ");
  In.Int(x);
  Out.Ln;
  IF (Adicionar(x)) THEN
    Out.String("Elemento "); Out.Int(x, 0);
    Out.String(" inserido na posicao ");
    Out.Int(inicio, 0); Out.String(".");
    Out.Ln
  ELSE
    Out.String("Impossivel adicionar ");
    Out.Int(x, 0);
    Out.String(" - fila lotada.");
    Out.Ln
  END;
  Out.Ln
END Entrada;

PROCEDURE Saida;
VAR
  elemento: INTEGER;
BEGIN
  IF (Retirar(elemento)) THEN
    Out.String("Elemento ");
    Out.Int(elemento, 0);
    Out.String(" retirado do inicio da fila.");
    Out.Ln
  ELSE
    Out.String("Impossivel retirar elemento - fila vazia.");
    Out.Ln
  END;
  Out.Ln
END Saida;

PROCEDURE Atual;
BEGIN
  IF (~Vazia()) THEN
    Out.Int(matriz[1], 0); 
    Out.String(" - primeiro elemento da fila.");
    Out.Ln
  ELSE
    Out.String("Impossivel apresentar - fila vazia.");
    Out.Ln
  END;
  Out.Ln
END Atual;

PROCEDURE Exibicao;
VAR
  i: INTEGER;
BEGIN
  IF (~Vazia()) THEN
    FOR i := 1 TO inicio DO
      Out.String("Posicao: ");
      Out.Int(i, 2);
      Out.String(" = ");
      Out.Int(matriz[i], 0);
      Out.Ln
    END
  ELSE
    Out.String("Impossivel apresentar - fila vazia.");
    Out.Ln
  END;
  Out.Ln
END Exibicao;

PROCEDURE Criar;
VAR
  i: INTEGER;
BEGIN
  inicio := 0;
  FOR i := 1 TO FIM DO
    matriz[i] := 0
  END
END Criar;

BEGIN
  Criar;
  opcao := 0;

  WHILE opcao # 6 DO
    Out.String("PROGRAMA: FILA"); Out.Ln;
    Out.Ln;
    Out.String("[1] - Entrada"); Out.Ln;
    Out.String("[2] - Saida"); Out.Ln;
    Out.String("[3] - Apresentar 1o. da fila"); Out.Ln;
    Out.String("[4] - Apresentar a fila"); Out.Ln;
    Out.String("[5] - Nova fila"); Out.Ln;
    Out.String("[6] - Sair"); Out.Ln;
    Out.Ln;
    Out.String("Escolha uma opcao: ");
    In.Int(opcao);
    Out.Ln;

    IF (opcao # 6) THEN
      IF (opcao >= 1) & (opcao <= 5) THEN
        CASE (opcao) OF
            1: Entrada;
          | 2: Saida;
          | 3: Atual;
          | 4: Exibicao;
          | 5: Criar
        END
      ELSE
        Out.String("Opcao invalida. Tente novamente.");
        Out.Ln;
        Out.Ln
      END
    END
  END;
END c10ex08.