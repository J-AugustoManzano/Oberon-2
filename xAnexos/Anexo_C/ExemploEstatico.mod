MODULE ExemploEstatico;

IMPORT Out, In;

VAR
  contador: INTEGER;
  nome: ARRAY 10 OF CHAR;
  statusAtivo: BOOLEAN;
  pausa: CHAR;
  
PROCEDURE SomarInteiros(a, b: INTEGER): INTEGER;
BEGIN
  RETURN a + b
END SomarInteiros;

BEGIN
  contador := 100;
  (* 
    Erro de tipo em tempo de compilação: ARRAY OF CHAR 
    não pode ser atribuído a STRING diretamente sem 
    procedimento específico 
  *)
  nome := "Teste";
  (* 
    Erro de tipo em tempo de compilação: INTEGER não 
    pode ser atribuído a BOOLEAN 
  *)
  statusAtivo := 1; 
  (* Válido: ambos são INTEGER *)
  contador := SomarInteiros(5, 7); 
  (* Erro de tipo: REAL não é INTEGER *)
  contador := SomarInteiros(10, 3.5); 

  Out.Int(contador, 0); Out.Ln;

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END ExemploEstatico.
 
