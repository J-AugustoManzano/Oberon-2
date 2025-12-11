MODULE Casamento;

IMPORT Out, In, Strings;

VAR
  numeroEntrada: INTEGER;
  resultadoCategoria: ARRAY 32 OF CHAR;
  resultadoAnalise: ARRAY 32 OF CHAR;
  pausa: CHAR;

PROCEDURE ObterCategoriaNumero
  (valor: INTEGER; VAR saida: ARRAY OF CHAR);
BEGIN
  Strings.Copy("Fora do Alcance", saida);

  CASE valor OF
       1..10: Strings.Copy("Baixa", saida);
    | 11..20: Strings.Copy("Media", saida);
    | 21..30: Strings.Copy("Alta", saida);
  END;
END ObterCategoriaNumero;

PROCEDURE AnalisarNumero
  (valor: INTEGER; VAR saida: ARRAY OF CHAR);
BEGIN
  IF (valor < 0) THEN
    Strings.Copy("Numero Negativo", saida);
  ELSIF (valor = 0) THEN
    Strings.Copy("Zero Exato", saida);
  ELSIF (ODD(valor)) THEN
    Strings.Copy("Positivo Impar", saida);
  ELSE 
    Strings.Copy("Positivo Par", saida);
  END;
END AnalisarNumero;

BEGIN
  Out.String("--- Casamento de Padroes e Decisao ---"); 
  Out.Ln;
  Out.Ln;

  Out.String("Entre com um numero inteiro para analise: ");
  In.Int(numeroEntrada);
  Out.Ln;

  ObterCategoriaNumero(numeroEntrada, resultadoCategoria);
  Out.String("Resultado da Categoria (usando CASE) ....: "); 
  Out.String(resultadoCategoria); Out.Ln;

  AnalisarNumero(numeroEntrada, resultadoAnalise);
  Out.String("Resultado da Analise (usando IF-ELSIF) ..: "); 
  Out.String(resultadoAnalise); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END Casamento.
