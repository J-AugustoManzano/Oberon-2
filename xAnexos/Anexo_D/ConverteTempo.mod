MODULE ConverteTempo;

IMPORT
  Out, Platform, In, SYSTEM;

TYPE
  HUGEINT = SYSTEM.INT64;

VAR
  tempoCorrenteMs: HUGEINT;
  
  anosCalculados: HUGEINT;
  diasCalculados: HUGEINT;
  horasCalculadas: HUGEINT;
  minutosCalculados: HUGEINT;
  segundosCalculados: HUGEINT;
  milissegundosRestantes: HUGEINT; 

  totalMs: ARRAY 24 OF CHAR;
  pausa: CHAR;

(* --- Converte HUGEINT (SYSTEM.INT64) para cadeia --- *)
PROCEDURE HG_EmTexto(num: HUGEINT; VAR texto: ARRAY OF CHAR);
VAR
  i, j: INTEGER;
  digito: CHAR;
  ehNegativo: BOOLEAN;
  tempNum: HUGEINT;
BEGIN
  i := 0;
  ehNegativo := FALSE;
  IF (num < 0) THEN
    ehNegativo := TRUE;
    num := -num;
  END;

  IF (num = 0) THEN
    texto[0] := '0';
    texto[1] := 0X;
  ELSE 
    tempNum := num;
    WHILE (tempNum) > 0 DO
      digito := CHR(ORD('0') + SYSTEM.VAL(INTEGER, tempNum MOD 10));
      texto[i] := digito;
      INC(i);
      tempNum := tempNum DIV 10;
    END;

    IF (ehNegativo) THEN
      texto[i] := '-';
      INC(i);
    END;

    texto[i] := 0X;

    j := 0;
    DEC(i);
    WHILE (j < i) DO
      digito := texto[j];
      texto[j] := texto[i];
      texto[i] := digito;
      INC(j);
      DEC(i);
    END;
  END; 
END HG_EmTexto;

(* --- Calcula o tamanho real da cadeia terminada em 0X --- *)
PROCEDURE tamTexto(VAR s: ARRAY OF CHAR; tamMax: INTEGER): INTEGER;
VAR
  i: INTEGER;
BEGIN
  i := 0;
  WHILE (i < tamMax) & (s[i] # 0X) DO
    INC(i);
  END;
  RETURN i
END tamTexto;

(* --- Imprime números com zeros à esquerda (ex: 05, 09) --- *)
PROCEDURE EscreveZeros(num: HUGEINT; largura: INTEGER);
VAR
  s: ARRAY 20 OF CHAR; 
  tamanho: INTEGER;
  i, desloc: INTEGER;
BEGIN
  HG_EmTexto(num, s);
  tamanho := tamTexto(s, 20); 
  desloc := largura - tamanho;
  FOR i := 1 TO desloc DO
    Out.Char('0');
  END;
  Out.String(s);
END EscreveZeros;


BEGIN
  tempoCorrenteMs := Platform.Time();

  Out.String("Tempo do sistema em milissegundos ..: ");
  HG_EmTexto(tempoCorrenteMs, totalMs);
  Out.String(totalMs); Out.Ln;

  (* 1. Extrair os milissegundos restantes *)
  milissegundosRestantes := tempoCorrenteMs MOD 1000;
  
  (* 2. Converter o total de milissegundos para segundos *)
  tempoCorrenteMs := tempoCorrenteMs DIV 1000; 

  (* 3. Extrair os segundos (0-59) *)
  segundosCalculados := tempoCorrenteMs MOD 60;
  tempoCorrenteMs := tempoCorrenteMs DIV 60; 

  (* 4. Extrair os minutos (0-59) *)
  minutosCalculados := tempoCorrenteMs MOD 60;
  tempoCorrenteMs := tempoCorrenteMs DIV 60; 

  (* 5. Extrair as horas (0-23) *)
  horasCalculadas := tempoCorrenteMs MOD 24;
  tempoCorrenteMs := tempoCorrenteMs DIV 24; 

  (* 6. Extrair os dias (0-364, ou o que restar antes do ano) *)
  diasCalculados := tempoCorrenteMs MOD 365; 
  tempoCorrenteMs := tempoCorrenteMs DIV 365;

  (* 7. Anos restantes *)
  anosCalculados := tempoCorrenteMs;

  Out.String("Tempo convertido ...................: ");
  IF (anosCalculados > 0) THEN
    EscreveZeros(anosCalculados, 0); Out.String("a "); 
  END;
  IF (diasCalculados > 0) THEN
    EscreveZeros(diasCalculados, 0); Out.String("d "); 
  END;
  EscreveZeros(horasCalculadas, 2); Out.Char(':');
  EscreveZeros(minutosCalculados, 2); Out.Char(':');
  EscreveZeros(segundosCalculados, 2); Out.Char('.');
  EscreveZeros(milissegundosRestantes, 3); Out.Ln;

  Out.Ln;
  Out.String("Pressione <Enter> para sair... ");
  In.Char(pausa);
END ConverteTempo.