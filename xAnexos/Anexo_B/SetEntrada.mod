MODULE SetEntrada;

IMPORT Out, In;

VAR
  set1, set2, setResult: SET;
  element: INTEGER;
  pausa: CHAR;

PROCEDURE PrintSet(s: SET);
  VAR i: INTEGER;
BEGIN
  Out.Char('{');
  FOR i := 0 TO 31 DO
    IF i IN s THEN
      Out.Int(i, 0);
      IF (i < 31) THEN
        IF ({i+1..31} * s # {}) THEN
          Out.String(", ");
        END;
      END;
    END;
  END;
  Out.Char('}');
END PrintSet;

PROCEDURE Uniao(s1, s2: SET): SET;
BEGIN
  RETURN s1 + s2
END Uniao;

BEGIN
  Out.String("--- Uniao de Conjuntos com Entrada ---"); Out.Ln;
  Out.Ln;

  set1 := {};
  set2 := {};

  (* Entrada do Primeiro Conjunto usando REPEAT-UNTIL *)
  Out.String("Entre os elementos do PRIMEIRO CONJUNTO (0-31).");
   Out.String(" Entre -1 para terminar:"); Out.Ln; Out.Ln;
  REPEAT
    Out.String("Elemento para o Conjunto 1: "); 
    In.Int(element); 
    IF (element >= 0) & (element <= 31) THEN
      set1 := set1 + {element} 
    ELSIF element # -1 THEN 
      Out.String("Aviso: Elemento fora da faixa permitida ");
      Out.String("(0-31). Entrada ignorada."); Out.Ln;
    END;
  UNTIL (element = -1);
  Out.Ln;

  (* Entrada do Segundo Conjunto usando REPEAT-UNTIL *)
  Out.String("Entre os elementos do SEGUNDO CONJUNTO (0-31).");
  Out.String(" Entre -1 para terminar:"); Out.Ln; Out.Ln;
  REPEAT
    Out.String("Elemento para o Conjunto 2: "); 
    In.Int(element); 
    IF (element >= 0) & (element <= 31) THEN
      set2 := set2 + {element}
    ELSIF element # -1 THEN 
      Out.String("Aviso: Elemento fora da faixa permitida ");
      Out.String("(0-31). Entrada ignorada."); Out.Ln;
    END;
  UNTIL (element = -1);
  Out.Ln;

  Out.String("Primeiro Conjunto (Set1) ...........: "); 
  PrintSet(set1); Out.Ln;
  Out.String("Segundo Conjunto (Set2) ............: "); 
  PrintSet(set2); Out.Ln;
  Out.Ln;

  setResult := Uniao(set1, set2);
  Out.String("Uniao dos Conjuntos (Set1 + Set2) ..: "); 
  PrintSet(setResult); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END SetEntrada.
