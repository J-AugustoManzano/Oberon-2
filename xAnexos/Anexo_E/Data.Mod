MODULE Data;

IMPORT Out;

CONST
  FEVEREIRO = 2;
  JULHO = 7;

TYPE
  Data* = RECORD
    dia, mes: BYTE;
    ano: INTEGER;
    dataOk: BOOLEAN;
  END;

PROCEDURE Init* (VAR d: Data);
BEGIN
  d.dia := 0;
  d.mes := 0;
  d.ano := 0;
  d.dataOk := FALSE;
END Init;

PROCEDURE AnoBissexto*(VAR d: Data): BOOLEAN;
BEGIN
  RETURN 
  (
    (d.ano MOD 400 = 0) OR (
    (d.ano MOD 4 = 0) & (d.ano MOD 100 # 0))
  )
END AnoBissexto;

PROCEDURE UltimoDiaNoMes*(VAR d: Data): BYTE;
VAR
  ultimoDia: BYTE;
BEGIN
  IF (d.mes = FEVEREIRO) THEN
    IF (AnoBissexto(d)) THEN
      ultimoDia := 29;
    ELSE
      ultimoDia := 28;
    END;
  ELSIF (d.mes <= JULHO) THEN
    IF (d.mes MOD 2 # 0) THEN
      ultimoDia := 31;
    ELSE
      ultimoDia := 30;
    END;
  ELSE
    IF (d.mes MOD 2 # 0) THEN
      ultimoDia := 30;
    ELSE
      ultimoDia := 31;
    END;
  END;
  RETURN ultimoDia
END UltimoDiaNoMes;

PROCEDURE ValidaData*(VAR d: Data);
BEGIN
  d.dataOk := (d.ano >=    1) &
              (d.ano <= 9999) &
              (d.mes >=    1) &
              (d.mes <=   12) &
              (d.dia >=    1) &
              (d.dia <= UltimoDiaNoMes(d)) &
            ~((d.ano =  1582) &
              (d.mes =    10) &
              (d.dia >=    5) &
              (d.dia <=   14));
END ValidaData;

PROCEDURE AlteraData*
  (VAR d: Data; dia, mes: BYTE; ano:INTEGER);
BEGIN
  d.dia := dia;
  d.mes := mes;
  d.ano := ano;
  ValidaData(d);
END AlteraData;

PROCEDURE MostraData*(VAR d: Data);
BEGIN
  IF (d.dataOk) THEN
    IF (d.dia < 10) THEN
      Out.Char('0');
    END;
    Out.Int(d.dia, 0); 
    Out.Char('/');

    IF (d.mes < 10) THEN
      Out.Char('0');
    END;
    Out.Int(d.mes, 0); 
    Out.Char('/');

    IF (d.ano < 10) THEN
      Out.String("000");
    ELSIF (d.ano < 100) THEN
      Out.String("00");
    ELSIF (d.ano < 1000) THEN
      Out.Char('0');
    END;
    Out.Int(d.ano, 0);
    Out.Ln;
  ELSE
    Out.String("**/**/****"); Out.Ln;
  END;
END MostraData;

END Data.