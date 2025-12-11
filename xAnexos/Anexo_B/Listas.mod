MODULE Listas;

IMPORT Out, In, Heap;

TYPE
  (* Nó da lista encadeada que armazena um elemento do conjunto *)
  NoConj = POINTER TO RECORD
    elemento: REAL;
    prox: NoConj;
  END;

  (* Tipo Conjunto (dinâmico) *)
  Conj = RECORD
    primeiro: NoConj;
    cont: INTEGER;
  END;

VAR
  conjA, conjB, resultado: Conj;
  ehVerdade: BOOLEAN;
  pausa: CHAR;

(* --- Funções e Procedimentos para Conjuntos Dinâmicos --- *)

(* Inicializa um conjunto dinâmico como vazio *)
PROCEDURE IniciaConj(VAR c: Conj);
BEGIN
  c.primeiro := NIL;
  c.cont := 0;
END IniciaConj;

(* Imprime um conjunto dinâmico *)
PROCEDURE ImprimeConj(VAR c: Conj);
VAR
  atual: NoConj;
BEGIN
  Out.Char('{');
  atual := c.primeiro;
  WHILE (atual # NIL) DO
    Out.RealFix(atual.elemento, 0, 2);
    atual := atual.prox;
    IF (atual # NIL) THEN
      Out.String(", ");
    END;
  END;
  Out.Char('}');
END ImprimeConj;

(* Verifica se elemento já existe *)
PROCEDURE Contem(VAR c: Conj; elem: REAL): BOOLEAN;
VAR
  atual: NoConj;
BEGIN
  atual := c.primeiro;
  WHILE (atual # NIL) & (atual.elemento # elem) DO
    atual := atual.prox;
  END;
  (* Retorna TRUE se encontrou o elemento *)
  RETURN (atual # NIL)
END Contem;

(* Adiciona um elemento, garante unicidade. *)
PROCEDURE AdicElem(VAR c: Conj; elem: REAL);
VAR
  novoNo: NoConj;
BEGIN
  (* Só adiciona se o elemento não estiver presente *)
  IF (~(Contem(c, elem))) THEN
    (* Aloca um novo nó na memória *)
    NEW(novoNo);
    novoNo.elemento := elem;
    novoNo.prox := c.primeiro;
    c.primeiro := novoNo;
    c.cont := c.cont + 1;
  END;
END AdicElem;

(* Remove um elemento do Conjunto. *)
PROCEDURE RemoveElem(VAR c: Conj; elem: REAL);
VAR
  atual, anterior: NoConj;
BEGIN
  atual := c.primeiro;
  anterior := NIL;

  WHILE (atual # NIL) & (atual.elemento # elem) DO
    anterior := atual;
    atual := atual.prox;
  END;

  IF (atual # NIL) THEN (* Elemento encontrado *)
    IF (anterior = NIL) THEN (* É o primeiro elemento *)
      c.primeiro := atual.prox;
    ELSE (* Não é o primeiro elemento *)
      anterior.prox := atual.prox;
    END;
    c.cont := c.cont - 1;
  END;
END RemoveElem;

(*
  Procedimento auxiliar para ordenar um conjunto (lista encadeada)
  usando um algoritmo de inserção.
*)
PROCEDURE OrdenaConj(VAR c: Conj);
VAR
  listaOrdenada: NoConj; 
  atualOriginal: NoConj; 
  proximoOriginal: NoConj; 
  posInsercao: NoConj; 
  anteriorInsercao: NoConj; 
BEGIN
  listaOrdenada := NIL;
  atualOriginal := c.primeiro;

  WHILE (atualOriginal # NIL) DO
    proximoOriginal := atualOriginal.prox; 

    (* Encontra o ponto de inserção na lista ordenada *)
    anteriorInsercao := NIL;
    posInsercao := listaOrdenada;
    WHILE (posInsercao # NIL) & 
      (atualOriginal.elemento > posInsercao.elemento) DO
      anteriorInsercao := posInsercao;
      posInsercao := posInsercao.prox;
    END;

    (* Insere o nó atual na lista ordenada *)
    IF (anteriorInsercao = NIL) THEN
      atualOriginal.prox := listaOrdenada;
      listaOrdenada := atualOriginal;
    ELSE (* Insere no meio ou no fim *)
      atualOriginal.prox := posInsercao;
      anteriorInsercao.prox := atualOriginal;
    END;

    atualOriginal := proximoOriginal; 
  END;

  c.primeiro := listaOrdenada; 
END OrdenaConj;

(* União de Conjuntos *)
PROCEDURE Uniao(VAR c1, c2: Conj; VAR res: Conj);
VAR
  atual: NoConj;
BEGIN
  IniciaConj(res);

  (* Adiciona todos os elementos de c1 ao resultado *)
  atual := c1.primeiro;
  WHILE (atual # NIL) DO
    AdicElem(res, atual.elemento);
    atual := atual.prox;
  END;

  (* Adiciona todos os elementos de c2 ao resultado *)
  atual := c2.primeiro;
  WHILE (atual # NIL) DO
    AdicElem(res, atual.elemento);
    atual := atual.prox;
  END;

  (* Ordena o conjunto resultado após a união *)
  OrdenaConj(res);
END Uniao;

(* Interseção de Conjuntos *)
PROCEDURE Intersecao(VAR c1, c2: Conj; VAR res: Conj);
VAR
  atual: NoConj;
BEGIN
  IniciaConj(res);

  (* Para cada elemento em c1, verifica se também está em c2. *)
  (* Se sim, adiciona ao resultado. *)
  atual := c1.primeiro;
  WHILE (atual # NIL) DO
    IF (Contem(c2, atual.elemento)) THEN
      AdicElem(res, atual.elemento);
    END;
    atual := atual.prox;
  END;
END Intersecao;

(* Diferença de Conjuntos *)
PROCEDURE Diferenca(VAR c1, c2: Conj; VAR res: Conj);
VAR
  atual: NoConj;
BEGIN
  IniciaConj(res);

  (* Para cada elemento em c1, se não estiver em c2, *)
  (* adiciona ao resultado. *)
  atual := c1.primeiro;
  WHILE (atual # NIL) DO
    IF (~(Contem(c2, atual.elemento))) THEN
      AdicElem(res, atual.elemento);
    END;
    atual := atual.prox;
  END;
END Diferenca;

(* Inclusão/Subconjunto de Conjuntos *)
PROCEDURE Inclusao(VAR c1, c2: Conj): BOOLEAN;
VAR
  atual: NoConj;
  ehSubconj: BOOLEAN;
BEGIN
  ehSubconj := TRUE;
  atual := c1.primeiro;
  WHILE (atual # NIL) & (ehSubconj) DO
    IF (~(Contem(c2, atual.elemento))) THEN
      ehSubconj := FALSE;
    END;
    atual := atual.prox;
  END;
  RETURN ehSubconj
END Inclusao;

(* Igualdade de Conjuntos *)
PROCEDURE Igualdade(VAR c1, c2: Conj): BOOLEAN;
BEGIN
  (* Para serem iguais, os conjuntos precisam ter *)
  (* o mesmo número de elementos e um ser *)
  (* subconjunto do outro. *)
  RETURN (c1.cont = c2.cont) & (Inclusao(c1, c2))
END Igualdade;

PROCEDURE LimpaConj(VAR c: Conj);
BEGIN
  (* Remove a referência para a lista *)
  c.primeiro := NIL;
  c.cont := 0;
END LimpaConj;

BEGIN
  Out.String("--- Manipulacao de Conjuntos Dinamicos ---");
  Out.Ln; Out.Ln;

  (* Inicialização de conjuntos *)
  IniciaConj(conjA);
  IniciaConj(conjB);
  IniciaConj(resultado);

  (* Preenchendo conjA *)
  AdicElem(conjA, 1.5);
  AdicElem(conjA, 2.0);
  AdicElem(conjA, 3.5);
  AdicElem(conjA, 4.0);
  AdicElem(conjA, 5.5);

  (* Preenchendo conjB *)
  AdicElem(conjB, 3.5);
  AdicElem(conjB, 5.5);
  AdicElem(conjB, 6.0);
  AdicElem(conjB, 7.5);

  Out.String("Conjunto A: "); ImprimeConj(conjA); Out.Ln;
  Out.String("Conjunto B: "); ImprimeConj(conjB); Out.Ln;
  Out.Ln;

  (* Demonstrando União *)
  Out.String("1. Uniao (A U B): ");
  Uniao(conjA, conjB, resultado);
  ImprimeConj(resultado); Out.Ln;
  Out.Ln;

  (* Demonstrando Interseção *)
  Out.String("2. Intersecao (A ^ B): ");
  Intersecao(conjA, conjB, resultado);
  ImprimeConj(resultado); Out.Ln;
  Out.Ln;

  (* Demonstrando Diferença *)
  Out.String("3. Diferenca (A - B): ");
  Diferenca(conjA, conjB, resultado);
  ImprimeConj(resultado); Out.Ln;
  Out.String("   Diferenca (B - A): ");
  Diferenca(conjB, conjA, resultado);
  ImprimeConj(resultado); Out.Ln;
  Out.Ln;

  (* Demonstrando Igualdade *)
  ehVerdade := Igualdade(conjA, conjB);
  Out.String("4. Igualdade (A = B): ");
  IF (ehVerdade) THEN
    Out.String("TRUE")
  ELSE
    Out.String("FALSE")
  END;
  Out.Ln;

  (* Criar um conjunto para validar igualdade *)
  LimpaConj(resultado);
  AdicElem(resultado, 1.5);
  AdicElem(resultado, 2.0);
  AdicElem(resultado, 3.5);
  AdicElem(resultado, 4.0);
  AdicElem(resultado, 5.5);
  Out.String("   Comparando A com ");
  ImprimeConj(resultado); Out.String(": ");
  ehVerdade := Igualdade(conjA, resultado);
  IF (ehVerdade) THEN
    Out.String("TRUE")
  ELSE
    Out.String("FALSE")
  END;
  Out.Ln;

  (* Demonstrando Inclusão *)
  Out.Ln;
  ehVerdade := Inclusao(conjA, conjB);
  Out.String("5. Inclusao (A <= B): ");
  IF (ehVerdade) THEN
    Out.String("TRUE")
  ELSE
    Out.String("FALSE")
  END;
  Out.Ln;

  (* Subconjunto de A para teste *)
  LimpaConj(resultado);
  AdicElem(resultado, 2.0);
  AdicElem(resultado, 4.0);
  Out.String("   Inclusao (");
  ImprimeConj(resultado); Out.String(" <= A): ");
  ehVerdade := Inclusao(resultado, conjA);
  IF (ehVerdade) THEN
    Out.String("TRUE")
  ELSE
    Out.String("FALSE")
  END;
  Out.Ln;

  LimpaConj(conjA);
  LimpaConj(conjB);
  LimpaConj(resultado);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END Listas.
