MODULE Hora;

IMPORT In, Out;

PROCEDURE ConvertInteiro
  (VAR cadeia: ARRAY OF CHAR; posicao, tamanho: BYTE): INTEGER;
VAR
  valor: INTEGER;
  i: BYTE;
BEGIN
  valor := 0;
  FOR i := 0 TO tamanho - 1 DO
valor := valor * 10 + 
         (ORD(cadeia[posicao + i]) - ORD('0'));
  END;
  RETURN valor
END ConvertInteiro;

PROCEDURE SegundosDoDia* 
  (VAR horaTexto: ARRAY OF CHAR): INTEGER;
VAR
  h, m, s: INTEGER;
BEGIN
  h := ConvertInteiro(horaTexto, 0, 2);
  m := ConvertInteiro(horaTexto, 3, 2);
  s := ConvertInteiro(horaTexto, 6, 2);
  RETURN h * 3600 + m * 60 + s
END SegundosDoDia;

PROCEDURE Relogio* 
  (segundos: INTEGER);
VAR
  h, m, s: INTEGER;
BEGIN
  h := segundos DIV 3600;
  m := (segundos MOD 3600) DIV 60;
  s := segundos MOD 60;

  IF (h < 10) THEN Out.Char('0') END;
  Out.Int(h, 0); Out.Char(':');
  IF (m < 10) THEN Out.Char('0') END;
  Out.Int(m, 0); Out.Char(':');
  IF (s < 10) THEN Out.Char('0') END;
  Out.Int(s, 0)
END Relogio;

PROCEDURE FormatoValido* 
  (VAR horaTexto: ARRAY OF CHAR): BOOLEAN;
VAR
  i: INTEGER;
  comprimentoReal: INTEGER;
  valido: BOOLEAN;
BEGIN
  valido := TRUE;
  comprimentoReal := 0;
WHILE (comprimentoReal < LEN(horaTexto)) &
      (horaTexto[comprimentoReal] # 0X) DO
    INC(comprimentoReal);
  END;

  IF (comprimentoReal # 8) THEN
    valido := FALSE;
  END;

IF (valido) & ((horaTexto[2] # ':') OR 
   (horaTexto[5] # ':')) THEN
    valido := FALSE;
  END;

  IF (valido) THEN
    FOR i := 0 TO 7 DO
      IF (i # 2) & (i # 5) THEN
        IF (~((ORD(horaTexto[i]) >= ORD('0'))) & 
            (ORD(horaTexto[i]) <= ORD('9'))) THEN
          valido := FALSE;
        END
      END
    END;
  END;
  RETURN valido
END FormatoValido;

PROCEDURE EntradaEhValida* 
  (VAR horaTexto: ARRAY OF CHAR): BOOLEAN;
VAR
  h, m, s: INTEGER;
BEGIN
  h := ConvertInteiro(horaTexto, 0, 2);
  m := ConvertInteiro(horaTexto, 3, 2);
  s := ConvertInteiro(horaTexto, 6, 2);

  RETURN (h >= 8)  & (h <= 22) & (
         (h # 22) OR ((m = 0) & (s = 0))) &
         (m >= 0)  & (m <= 59) &
         (s >= 0)  & (s <= 59)
END EntradaEhValida;

PROCEDURE SaidaEhValida* 
  (VAR horaTexto: ARRAY OF CHAR): BOOLEAN;
VAR
  h, m, s: INTEGER;
BEGIN
  h := ConvertInteiro(horaTexto, 0, 2);
  m := ConvertInteiro(horaTexto, 3, 2);
  s := ConvertInteiro(horaTexto, 6, 2);

  RETURN ((h >= 8) & (h < 23)) OR
         ((h = 23) & (m = 0) & (s = 0))
END SaidaEhValida;

END Hora.
