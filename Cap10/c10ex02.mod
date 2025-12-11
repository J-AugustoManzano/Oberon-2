MODULE c10ex02;

IMPORT Out, In;

VAR
  numero: ARRAY 256 OF CHAR;
  pausa: CHAR;
  entValida: BOOLEAN;

PROCEDURE ReadLine(VAR s: ARRAY OF CHAR);
VAR
  i: INTEGER;
  caracter: CHAR;
BEGIN
  i := 0;
  REPEAT
    In.Char(caracter);
    IF (caracter # 0DX) & (caracter # 0AX) THEN
      IF (i < (LEN(s) - 1)) THEN
        s[i] := caracter;
        INC(i);
      END;
    END;
  UNTIL (caracter = 0DX) OR (caracter = 0AX);
  s[i] := 0X;
END ReadLine;

PROCEDURE ValidaNumero(s: ARRAY OF CHAR): BOOLEAN;
VAR
  i: INTEGER;
  contaPonto: INTEGER;
  valido: BOOLEAN;
BEGIN
  contaPonto := 0;
  valido := TRUE;
  i := 0;

  IF (s[0] = 0X) THEN
    valido := FALSE;
  ELSE
    WHILE (s[i] # 0X) & valido DO
      IF (s[i] = '.') THEN
        INC(contaPonto);
        IF (contaPonto > 1) THEN
          valido := FALSE;
        END;
      ELSIF (s[i] < '0') OR (s[i] > '9') THEN
        valido := FALSE;
      END;
      INC(i);
    END;
  END;
  RETURN valido
END ValidaNumero;

BEGIN
  REPEAT
    Out.String("Entre um valor numerico: ");
    ReadLine(numero);
    Out.Ln;

    IF (numero[0] = 0X) THEN
      Out.String("Erro: Tecla <Enter> acionada acidentalmente."); 
      Out.Ln;
      Out.Ln;
      entValida := FALSE;
    ELSIF (~(ValidaNumero(numero))) THEN
      Out.String("Erro: Entre um numero valido."); Out.Ln;
      Out.Ln;
      entValida := FALSE;
    ELSE
      entValida := TRUE;
    END;
  UNTIL entValida;

  Out.String("Entrada valida fornecida: "); 
  Out.String(numero); 
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c10ex02.
