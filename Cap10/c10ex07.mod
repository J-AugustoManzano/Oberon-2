MODULE c10ex07;

IMPORT Out, In;

CONST
  LIMITE = 10;

VAR
  matriz: ARRAY (LIMITE + 1) OF INTEGER;
  topo, opcao: INTEGER;

PROCEDURE Vazia(): BOOLEAN;
BEGIN
  RETURN topo = 0
END Vazia;

PROCEDURE Cheia(): BOOLEAN;
BEGIN
  RETURN topo = LIMITE
END Cheia;

PROCEDURE Adicionar(elemento: INTEGER): BOOLEAN;
VAR
  resultado: BOOLEAN;
BEGIN
  IF (Cheia()) THEN
    resultado := FALSE
  ELSE
    INC(topo);
    matriz[topo] := elemento;
    resultado := TRUE
  END;
  RETURN resultado
END Adicionar;

PROCEDURE Retirar(VAR elemento: INTEGER): BOOLEAN;
VAR
  resultado: BOOLEAN;
BEGIN
  IF (Vazia()) THEN
    resultado := FALSE
  ELSE
    elemento := matriz[topo];
    matriz[topo] := 0;
    DEC(topo);
    resultado := TRUE
  END;
  RETURN resultado
END Retirar;

PROCEDURE Empilhar;
VAR
  x: INTEGER;
BEGIN
  Out.String("Entre com um elemento numerico: ");
  In.Int(x);
  Out.Ln;
  IF (Adicionar(x)) THEN
    Out.String("Elemento "); Out.Int(x, 0);
    Out.String(" inserido na posicao ");
    Out.Int(topo, 0); Out.String(".");
    Out.Ln
  ELSE
    Out.String("Impossivel adicionar ");
    Out.Int(x, 0);
    Out.String(" - pilha cheia.");
    Out.Ln
  END;
  Out.Ln
END Empilhar;

PROCEDURE Desempilhar;
VAR
  elemento: INTEGER;
BEGIN
  IF (Retirar(elemento)) THEN
    Out.String("Elemento ");
    Out.Int(elemento, 0);
    Out.String(" retirado do topo da pilha.");
    Out.Ln
  ELSE
    Out.String("Impossivel retirar elemento - pilha vazia.");
    Out.Ln
  END;
  Out.Ln
END Desempilhar;

PROCEDURE Mostrar;
VAR
  i: INTEGER;
BEGIN
  IF (~Vazia()) THEN
    FOR i := topo TO 1 BY -1 DO
      Out.String("Posicao: ");
      Out.Int(i, 2);
      Out.String(" = ");
      Out.Int(matriz[i], 0);
      Out.Ln
    END
  ELSE
    Out.String("Impossivel apresentar - pilha vazia.");
    Out.Ln
  END;
  Out.Ln
END Mostrar;

PROCEDURE Criar;
VAR
  i: INTEGER;
BEGIN
  topo := 0;
  FOR i := 1 TO LIMITE DO
    matriz[i] := 0
  END
END Criar;

BEGIN
  Criar;
  opcao := 0;

  WHILE opcao # 5 DO
    Out.String("PROGRAMA: PILHA"); Out.Ln;
    Out.Ln;
    Out.String("[1] - Empilhar"); Out.Ln;
    Out.String("[2] - Desempilhar"); Out.Ln;
    Out.String("[3] - Mostrar"); Out.Ln;
    Out.String("[4] - Criar pilha"); Out.Ln;
    Out.String("[5] - Sair"); Out.Ln;
    Out.Ln;
    Out.String("Escolha uma opcao: ");
    In.Int(opcao);
    Out.Ln;

    IF (opcao # 5) THEN
      IF (opcao >= 1) & (opcao <= 4) THEN
        CASE (opcao) OF
            1: Empilhar;
          | 2: Desempilhar;
          | 3: Mostrar;
          | 4: Criar
        END
      ELSE
        Out.String("Opcao invalida. Tente novamente.");
        Out.Ln;
        Out.Ln
      END
    END
  END
END c10ex07.