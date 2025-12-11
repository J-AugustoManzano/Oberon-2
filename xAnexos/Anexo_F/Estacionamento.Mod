MODULE Estacionamento;

IMPORT In, Out, Hora;

VAR
  entrada, saida: ARRAY 9 OF CHAR;
  segEnt, segSai, difSegs, parteInt, parteDec: INTEGER;
  vlrPag, vlrTemp: REAL;
  i: BYTE;
  pausa, c: CHAR;

PROCEDURE Arred_Cima(x: REAL): REAL;
VAR
  parteInt: INTEGER;
  resultado: REAL;
BEGIN
  parteInt := FLOOR(x);
  IF (x > parteInt) THEN
    resultado := parteInt + 1.0
  ELSE
    resultado := x
  END;
  RETURN resultado
END Arred_Cima;

PROCEDURE CalcPgto(segs: INTEGER): REAL;
CONST
  SEGS_PRIMA_HR = 3600;
  VLR_PRIMA_HR = 5.00;
  VLR_HR_ADIC = 1.50;
VAR
  horasAdic: REAL;
  vlrCalc: REAL;
BEGIN
  IF (segs <= SEGS_PRIMA_HR) THEN
    vlrCalc := VLR_PRIMA_HR
  ELSE
    horasAdic := (segs - SEGS_PRIMA_HR) / 3600.0;
    vlrCalc := VLR_PRIMA_HR + Arred_Cima(horasAdic) * VLR_HR_ADIC
  END;
  RETURN vlrCalc
END CalcPgto;

BEGIN
  Out.String("Estacionamento XPTO-Park"); Out.Ln;
  Out.String("------------------------"); Out.Ln;
  Out.Ln;

  REPEAT
    Out.String("Informe hora de entrada (HH:MM:SS) .: ");
    i := 0;
    REPEAT
      In.Char(c);
      IF (c # 0DX) & (c # 0AX) & (i < LEN(entrada) - 1) THEN
        entrada[i] := c;
        INC(i);
      END;
    UNTIL (c = 0DX) OR (c = 0AX);
    entrada[i] := 0X;
UNTIL Hora.FormatoValido(entrada) & 
      Hora.EntradaEhValida(entrada);

  REPEAT
    REPEAT
      Out.String("Informe hora de saida   (HH:MM:SS) .: ");
      i := 0;
      REPEAT
        In.Char(c);
        IF (c # 0DX) & (c # 0AX) & (i < LEN(saida) - 1) THEN
          saida[i] := c;
          INC(i);
      END;
    UNTIL (c = 0DX) OR (c = 0AX);
      saida[i] := 0X;
    UNTIL Hora.FormatoValido(saida) & Hora.SaidaEhValida(saida);

    segEnt := Hora.SegundosDoDia(entrada);
    segSai := Hora.SegundosDoDia(saida);

    IF (segSai <= segEnt) THEN
      Out.String("Hora (saida) deve ser maior ");
      Out.String("que hora (entrada)"); Out.Ln;
    END;
  UNTIL segSai > segEnt;

  difSegs := segSai - segEnt;

  Out.String("Permanencia ........................: ");
  Hora.Relogio(difSegs); Out.Ln;

  vlrPag := CalcPgto(difSegs);
  Out.String("Valor cobrado ......................: R$ ");

  vlrTemp := vlrPag * 100.0 + 0.5;
  parteInt := FLOOR(vlrTemp) DIV 100;
  parteDec := FLOOR(vlrTemp) MOD 100;

  Out.Int(parteInt, 0); Out.Char('.');
  IF (parteDec < 10) THEN 
    Out.Char('0') 
  END;
  Out.Int(parteDec, 0);
  Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);

END Estacionamento.
