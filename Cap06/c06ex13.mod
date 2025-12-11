MODULE c06ex13;

IMPORT Out, In;

TYPE
  FuncaoInteiro = PROCEDURE (n: INTEGER): INTEGER;

VAR
  entra: INTEGER;
  resposta: FuncaoInteiro;
  pausa: CHAR;

PROCEDURE Somatorio(n: INTEGER): INTEGER;
VAR
  i, soma: INTEGER;
BEGIN
  soma := 0;
  FOR i := 1 TO n DO
    soma := soma + i
  END;
  RETURN soma
END Somatorio;

PROCEDURE Fatorial(n: INTEGER): INTEGER;
VAR
  i, fat: INTEGER;
BEGIN
  fat := 1;
  FOR i := 1 TO n DO
    fat := fat * i
  END;
  RETURN fat
END Fatorial;

BEGIN
  Out.String("Entre com um numero inteiro: ");
  In.Int(entra);
  Out.Ln;

  resposta := Somatorio;
  Out.String("Somatorio ...: "); 
  Out.Int(resposta(entra), 5); 
  Out.Ln;

  resposta := Fatorial;
  Out.String("Fatorial ....: "); 
  Out.Int(resposta(entra), 5); 
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c06ex13.
