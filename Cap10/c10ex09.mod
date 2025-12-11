MODULE c10ex09;

IMPORT Out, In;

VAR
  caractere: CHAR;
  valorAscii: INTEGER;
  pausa, buffer: CHAR;

PROCEDURE IsLetter(c: CHAR): BOOLEAN;
BEGIN
  RETURN ((c >= 'A') & (c <= 'Z')) OR ((c >= 'a') & (c <= 'z'))
END IsLetter;

PROCEDURE IsDigit(c: CHAR): BOOLEAN;
BEGIN
  RETURN (c >= '0') & (c <= '9')
END IsDigit;

PROCEDURE IsPunctuation(c: CHAR): BOOLEAN;
BEGIN
  (* Verifica um conjunto comum de caracteres de pontuacao *)
  RETURN (c = '.') OR (c = ',') OR (c = ';') OR (c = ':') OR
         (c = '!') OR (c = '?') OR (c = '-') OR (c = "'") OR
         (c = '"') OR (c = '(') OR (c = ')') OR (c = '[') OR
         (c = ']') OR (c = '{') OR (c = '}') OR (c = '/') OR
         (c = '\') OR (c = '@') OR (c = '#') OR (c = '$') OR
         (c = '%') OR (c = '^') OR (c = '&') OR (c = '*') OR
         (c = '_') OR (c = '+') OR (c = '=') OR (c = '<') OR
         (c = '>') OR (c = '|') OR (c = '~')
END IsPunctuation;

BEGIN
  Out.String("IDENTIFICADOR DE CARACTERE E ASCII"); Out.Ln;
  Out.Ln;

  Out.String("Entre um caractere: ");
  In.Char(caractere);
  REPEAT In.Char(buffer) UNTIL (buffer = 0AX);
  Out.Ln;

  valorAscii := ORD(caractere);

  Out.String("O caractere '"); 
  Out.Char(caractere); 
  Out.String("' e: ");

  IF IsDigit(caractere) THEN
    Out.String("um NUMERO"); Out.Ln
  ELSIF IsLetter(caractere) THEN
    Out.String("uma LETRA"); Out.Ln
  ELSIF IsPunctuation(caractere) THEN
    Out.String("uma PONTUACAO"); Out.Ln
  ELSE
    Out.String("OUTRO CARACTERE "); 
    Out.String("(ex: espaco, controle, simbolo nao listado)"); 
    Out.Ln
  END;

  Out.String("Valor ASCII ==> "); Out.Int(valorAscii, 0); 
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex09.
