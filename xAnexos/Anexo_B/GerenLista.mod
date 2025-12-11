MODULE GerenLista;

IMPORT Out, In, Heap;

TYPE
  (* Nó da lista encadeada que armazena um elemento *)
  No = POINTER TO RECORD
    elemento: REAL;
    prox: No;
  END;

  (* Tipo Lista/Conjunto *)
  Lista = RECORD
    primeiro: No;
    cont: INTEGER;
  END;

VAR
  minhaLista, novaLista: Lista;
  pausa: CHAR;

(* --- Funções e Procedimentos Auxiliares --- *)

PROCEDURE IniciaLista(VAR l: Lista);
BEGIN
  l.primeiro := NIL;
  l.cont := 0;
END IniciaLista;

PROCEDURE AdicElem(VAR l: Lista; elem: REAL);
VAR
  novoNo: No;
BEGIN
  NEW(novoNo);
  novoNo.elemento := elem;
  novoNo.prox := l.primeiro;
  l.primeiro := novoNo;
  l.cont := l.cont + 1;
END AdicElem;

PROCEDURE ImprimeLista(VAR l: Lista);
VAR
  atual: No;
BEGIN
  Out.Char('[');
  atual := l.primeiro;
  WHILE (atual # NIL) DO
    Out.RealFix(atual.elemento, 0, 2);
    atual := atual.prox;
    IF (atual # NIL) THEN
      Out.String(", ");
    END;
  END;
  Out.Char(']');
END ImprimeLista;

PROCEDURE CopiaLista(VAR original: Lista; VAR copia: Lista);
VAR
  atualOriginal: No;
  novoNo: No;
  ultimoCopia: No;
BEGIN
  IniciaLista(copia);
  atualOriginal := original.primeiro;
  ultimoCopia := NIL;

  WHILE (atualOriginal # NIL) DO
    NEW(novoNo);
    novoNo.elemento := atualOriginal.elemento;
    novoNo.prox := NIL;

    IF (copia.primeiro = NIL) THEN (* Primeiro elemento da cópia *)
      copia.primeiro := novoNo;
    ELSE
      ultimoCopia.prox := novoNo;
    END;
    ultimoCopia := novoNo;
    copia.cont := copia.cont + 1;
    atualOriginal := atualOriginal.prox;
  END;
END CopiaLista;

PROCEDURE LimpaLista(VAR l: Lista);
BEGIN
  l.primeiro := NIL; )
  l.cont := 0;
END LimpaLista;

(* --- Operações de Programação Funcional --- *)

(* Retorna a cabeça da lista *)
PROCEDURE Head*(VAR l: Lista): REAL;
VAR
  valorRetorno: REAL;
BEGIN
  IF (l.primeiro # NIL) THEN
    valorRetorno := l.primeiro.elemento
  ELSE
    valorRetorno := 0.0 
  END;
  RETURN valorRetorno
END Head;

(* Retorna a cauda da lista *)
PROCEDURE Tail*(VAR l: Lista; VAR res: Lista);
BEGIN
  IniciaLista(res);
  IF (l.primeiro # NIL) THEN
    CopiaLista(l, res);
    res.primeiro := res.primeiro.prox;
    res.cont := res.cont - 1;
  END;
END Tail;

(* Retorna o último elemento da lista *)
PROCEDURE Last*(VAR l: Lista): REAL;
VAR
  atual: No;
  valorRetorno: REAL;
BEGIN
  IF (l.primeiro = NIL) THEN
    valorRetorno := 0.0
  ELSE
    atual := l.primeiro;
    WHILE (atual.prox # NIL) DO
      atual := atual.prox;
    END;
    valorRetorno := atual.elemento
  END;
  RETURN valorRetorno
END Last;

(* Retorna todos os elementos, excerto o último *)
PROCEDURE Init*(VAR l: Lista; VAR res: Lista);
VAR
  atual: No;
  novoNo: No;
  ultimoCopia: No;
BEGIN
  IniciaLista(res);

  IF (l.primeiro # NIL) & (l.primeiro.prox # NIL) THEN 
    atual := l.primeiro;
    ultimoCopia := NIL;
    WHILE (atual.prox # NIL) DO
      NEW(novoNo);
      novoNo.elemento := atual.elemento;
      novoNo.prox := NIL;

      IF (res.primeiro = NIL) THEN
        res.primeiro := novoNo;
      ELSE
        ultimoCopia.prox := novoNo;
      END;
      ultimoCopia := novoNo;
      res.cont := res.cont + 1;
      atual := atual.prox;
    END;
  END;
END Init;

BEGIN
  Out.String("--- OPERAÇÕES EM LISTAS ---"); 
  Out.Ln; Out.Ln;

  (* --- LISTA DE EXEMPLO --- *)
  IniciaLista(minhaLista);
  AdicElem(minhaLista, 10.0);
  AdicElem(minhaLista, 20.0);
  AdicElem(minhaLista, 30.0);
  AdicElem(minhaLista, 40.0);
  AdicElem(minhaLista, 50.0);

  Out.String("LISTA: "); 
  ImprimeLista(minhaLista); 
  Out.Ln; Out.Ln;

  (* --- OPERAÇÕES --- *)
  Out.String("Head: ");
  Out.RealFix(Head(minhaLista), 0, 2); Out.Ln;

  Tail(minhaLista, novaLista);
  Out.String("Tail: "); 
  ImprimeLista(novaLista); Out.Ln;
  LimpaLista(novaLista);

  Out.String("Last: "); 
  Out.RealFix(Last(minhaLista), 0, 2); Out.Ln;

  Init(minhaLista, novaLista);
  Out.String("Init: "); 
  ImprimeLista(novaLista); Out.Ln;
  LimpaLista(novaLista);

  LimpaLista(minhaLista);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END GerenLista.
