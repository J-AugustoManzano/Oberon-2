MODULE Conjuntos;

IMPORT Out, In;

VAR
  setA, setB, setResult: SET;
  isEqual, isIncluded: BOOLEAN;
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

PROCEDURE Intersecao(s1, s2: SET): SET;
BEGIN
  RETURN s1 * s2
END Intersecao;

PROCEDURE Diferenca(s1, s2: SET): SET;
BEGIN
  RETURN s1 - s2
END Diferenca;

PROCEDURE Igualdade(s1, s2: SET): BOOLEAN;
BEGIN
  RETURN s1 = s2
END Igualdade;

PROCEDURE Inclusao(s1, s2: SET): BOOLEAN;
BEGIN
  RETURN s1 - s2 = {}
END Inclusao;

BEGIN
  Out.String("--- Operações de Conjunto em Oberon ---"); 
  Out.Ln; Out.Ln;

  (* Inicialização de Conjuntos *)
  setA := {1, 2, 3, 4};
  setB := {3, 4, 5, 6};
  setResult := {}; 

  Out.String("Conjunto A: "); PrintSet(setA); Out.Ln;
  Out.String("Conjunto B: "); PrintSet(setB); Out.Ln;
  Out.Ln;

  (* 1. União de Conjuntos *)
  Out.String("1. Operacao de Uniao:"); Out.Ln;
  setResult := Uniao(setA, setB);
  Out.String("   A + B : "); PrintSet(setResult); Out.Ln;
  Out.Ln;

  (* 2. Interseção de Conjuntos *)
  Out.String("2. Operacao de Intersecao:"); Out.Ln;
  setResult := Intersecao(setA, setB);
  Out.String("   A * B : "); PrintSet(setResult); Out.Ln;
  Out.Ln;

  (* 3. Diferença de Conjuntos *)
  Out.String("3. Operacao de Diferenca:"); Out.Ln;
  setResult := Diferenca(setA, setB);
  Out.String("   A - B : "); PrintSet(setResult); Out.Ln;
setResult := Diferenca(setB, setA); 
  (* Demonstrar B - A também *)
  Out.String("   B - A : "); PrintSet(setResult); Out.Ln;
  Out.Ln;

  (* 4. Igualdade de Conjuntos *)
  Out.String("4. Operacao de Igualdade:"); Out.Ln;
  isEqual := Igualdade(setA, setB);
  Out.String("   A = B : ");
  IF (isEqual) THEN 
    Out.String("TRUE") 
  ELSE 
    Out.String("FALSE") 
  END;
  Out.Ln;

  (* Testar igualdade verdadeira *)
  isEqual := Igualdade(setA, {1, 2, 3, 4}); 
  Out.String("   A = {1,2,3,4} : ");
  IF (isEqual) THEN 
    Out.String("TRUE") 
  ELSE 
    Out.String("FALSE") 
  END;
  Out.Ln;

  Out.Ln;

  (* 5. Inclusão de Conjuntos (Subconjunto ou Igual) *)
  Out.String("5. Operacao de Inclusao (subconjunto ou igual):"); 
  Out.Ln;
  isIncluded := Inclusao(setA, setB);
  Out.String("   A <= B : ");
  IF (isIncluded) THEN 
    Out.String("TRUE") 
  ELSE 
    Out.String("FALSE") 
  END;
  Out.Ln;

  (* Testar inclusão verdadeira *)
  isIncluded := Inclusao({1, 2}, setA); 
  Out.String("   {1,2} <= A : ");
  IF (isIncluded) THEN 
    Out.String("TRUE") 
  ELSE 
    Out.String("FALSE") 
  END;
  Out.Ln;

  (* Testar inclusão verdadeira *)
  isIncluded := Inclusao(setA, {1, 2, 3, 4, 5}); 
  Out.String("   A <= {1,2,3,4,5} : ");
  IF (isIncluded) THEN 
    Out.String("TRUE") 
  ELSE 
    Out.String("FALSE") 
  END;
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END Conjuntos.
