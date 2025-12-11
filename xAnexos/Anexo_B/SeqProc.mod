MODULE SeqProc;

IMPORT Out, In, Heap;

TYPE
  (* Nó da lista encadeada *)
  No = POINTER TO RECORD
    elemento: REAL;
    prox: No;
  END;

  (* Tipo Lista/Sequência *)
  Lista = RECORD
    primeiro: No;
    cont: INTEGER;
  END;

  (* --- Tipos para Mapeamento, Filtragem e Redução --- *)

  MapFunc = PROCEDURE (elemento: REAL): REAL;
  FilterFunc = PROCEDURE (elemento: REAL): BOOLEAN;
  ReduceFunc = PROCEDURE (acumulador, elemento: REAL): REAL;

VAR
  minhaLista, resultadoLista: Lista;
  pausa: CHAR;
  valorFinal: REAL;

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

PROCEDURE LimpaLista(VAR l: Lista);
BEGIN
  l.primeiro := NIL;
  l.cont := 0;
END LimpaLista;

PROCEDURE InteiroDeReal(valor: REAL): INTEGER;
VAR
  inteiroParte: INTEGER;
BEGIN
  IF (valor >= 0.0) THEN
    inteiroParte := 0;
    WHILE ((inteiroParte + 1) <= valor) DO
      INC(inteiroParte)
    END
  ELSE
    inteiroParte := 0;
    WHILE ((inteiroParte - 1) >= valor) DO
      DEC(inteiroParte)
    END
  END;
  RETURN inteiroParte
END InteiroDeReal;

(* --- Mapeamento, Filtragem e Redução --- *)

(* 1. Mapeamento (Map) *)
PROCEDURE Map*
(VAR original: Lista; VAR resultado: Lista; transformacao: MapFunc);
VAR
  atualOriginal: No;
  novoNo: No;
  ultimoResultado: No;
BEGIN
  IniciaLista(resultado);
  atualOriginal := original.primeiro;
  ultimoResultado := NIL;

  WHILE (atualOriginal # NIL) DO
    NEW(novoNo);
    (* Aplica a função *)
    novoNo.elemento := transformacao(atualOriginal.elemento); 
    novoNo.prox := NIL;

    IF (resultado.primeiro = NIL) THEN
      resultado.primeiro := novoNo;
    ELSE
      ultimoResultado.prox := novoNo;
    END;
    ultimoResultado := novoNo;
    resultado.cont := resultado.cont + 1;
    atualOriginal := atualOriginal.prox;
  END;
END Map;

(* 2. Filtragem (Filter) *)
PROCEDURE Filter*
(VAR original: Lista; VAR resultado: Lista; condicao: FilterFunc);
VAR
  atualOriginal: No;
  novoNo: No;
  ultimoResultado: No;
BEGIN
  IniciaLista(resultado);
  atualOriginal := original.primeiro;
  ultimoResultado := NIL;

  WHILE (atualOriginal # NIL) DO
    (* Aplica a condição *)
    IF (condicao(atualOriginal.elemento)) THEN 
      NEW(novoNo);
      novoNo.elemento := atualOriginal.elemento;
      novoNo.prox := NIL;

      IF (resultado.primeiro = NIL) THEN
        resultado.primeiro := novoNo;
      ELSE
        ultimoResultado.prox := novoNo;
      END;
      ultimoResultado := novoNo;
      resultado.cont := resultado.cont + 1;
    END;
    atualOriginal := atualOriginal.prox;
  END;
END Filter;

(* 3. Redução (Reduce) *)
PROCEDURE Reduce*
(VAR l: Lista; combinador: ReduceFunc; valorInicial: REAL): REAL;
VAR
  atual: No;
  acumulador: REAL;
BEGIN
  acumulador := valorInicial;
  atual := l.primeiro;
  WHILE (atual # NIL) DO
    (* Aplica a função combinadora *)
    acumulador := combinador(acumulador, atual.elemento); 
    atual := atual.prox;
  END;
  RETURN acumulador
END Reduce;

(* --- Funções auxiliares para as operações --- *)

PROCEDURE Dobrar(x: REAL): REAL;
BEGIN
  RETURN x * 2.0
END Dobrar;

PROCEDURE EhPar(x: REAL): BOOLEAN;
VAR
  valInt: INTEGER;
BEGIN
  valInt := InteiroDeReal(x);
  RETURN (valInt MOD 2 = 0)
END EhPar;

PROCEDURE Somar(acum: REAL; elem: REAL): REAL;
BEGIN
  RETURN acum + elem
END Somar;

PROCEDURE Multiplicar(acum: REAL; elem: REAL): REAL;
BEGIN
  RETURN acum * elem
END Multiplicar;

BEGIN
  Out.String("--- DEMONSTRAÇÃO: MAP, FILTER, REDUCE ---"); 
  Out.Ln; Out.Ln;

  (* --- LISTA DE EXEMPLO --- *)
  IniciaLista(minhaLista);
  AdicElem(minhaLista, 5.0);
  AdicElem(minhaLista, 4.0);
  AdicElem(minhaLista, 3.0);
  AdicElem(minhaLista, 2.0);
  AdicElem(minhaLista, 1.0);
  (* Lista é [1.00, 2.00, 3.00, 4.00, 5.00] *)

  Out.String("LISTA DEFINIDA: "); 
  ImprimeLista(minhaLista); Out.Ln;
  Out.Ln;

  (* --- 1. MAPEAMENTO (MAP) --- *)
  Out.String("MAP: Dobrar elementos"); Out.Ln;
  Map(minhaLista, resultadoLista, Dobrar);
  Out.String("Resultado: "); 
  ImprimeLista(resultadoLista); Out.Ln;
  LimpaLista(resultadoLista); Out.Ln;

  (* --- 2. FILTRAGEM (FILTER) --- *)
  Out.String("FILTER: Elementos pares"); Out.Ln;
  Filter(minhaLista, resultadoLista, EhPar);
  Out.String("Resultado: "); 
  ImprimeLista(resultadoLista); Out.Ln;
  LimpaLista(resultadoLista); Out.Ln;

  (* --- 3. REDUÇÃO (REDUCE) --- *)
  Out.String("REDUCE: Soma dos elementos"); Out.Ln;
  valorFinal := Reduce(minhaLista, Somar, 0.0); 
  Out.String("Resultado: "); 
  Out.RealFix(valorFinal, 0, 2); Out.Ln;
  Out.Ln;

  Out.String("REDUCE: Multiplicacao dos elementos"); Out.Ln;
  valorFinal := Reduce(minhaLista, Multiplicar, 1.0); 
  Out.String("Resultado: "); 
  Out.RealFix(valorFinal, 0, 2); Out.Ln;

  LimpaLista(minhaLista);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END SeqProc.
