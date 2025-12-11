MODULE c02ex06;

IMPORT Out, In;

VAR
  A, B, X: INTEGER;
  pausa: CHAR;

BEGIN
  (*
    Programa exemplo para operacoes de duas entradas
    com calculo de adcao e apresentacao do resultado. 
  *)

  (* Exibe o titulo do programa *)
  Out.String("ADICAO DE NUMEROS");
  Out.Ln();
  Out.Ln();

  (* Entrada de dados *)
  Out.String("Entre o 1o. valor numerico: ");
  In.Int(A);

  Out.String("Entre o 2o. valor numerico: ");
  In.Int(B);

  (* Processamento de dados *)
  X := A + B;  (* Calculo da adicao *)

  (* Saida de dados *)
  Out.String("Resultado = ");
  Out.Int(X, 0);
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c02ex06.
