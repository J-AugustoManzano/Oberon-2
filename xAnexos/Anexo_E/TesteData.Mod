MODULE TesteData;

IMPORT In, Out, Data;

VAR
  data: Data.Data;
  dataTexto: ARRAY 11 OF CHAR;
  dia, mes: BYTE;
  ano: INTEGER;
  caractere: CHAR;
  i: BYTE;
  pausa: CHAR;

PROCEDURE ConvertInteiro
  (VAR texto: ARRAY OF CHAR; pos, tamanho: BYTE): INTEGER;
VAR
  valor: INTEGER;
  ind: BYTE;
BEGIN
  valor := 0;
  FOR ind := 0 TO tamanho - 1 DO
    valor := valor * 10 + (ORD(texto[pos + ind]) - ORD('0'));
  END;
  RETURN valor
END ConvertInteiro;

BEGIN
  Out.String("Entre uma data no formato DD/MM/AAAA: ");

  i := 0;
  REPEAT
    In.Char(caractere);
IF (caractere # 0DX) & 
   (caractere # 0AX) & (i < LEN(dataTexto) - 1) THEN
      dataTexto[i] := caractere;
      INC(i);
    END;
  UNTIL (caractere = 0DX) OR (caractere = 0AX);
  dataTexto[i] := 0X;

  dia := ConvertInteiro(dataTexto, 0, 2);
  mes := ConvertInteiro(dataTexto, 3, 2);
  ano := ConvertInteiro(dataTexto, 6, 4);

  Data.AlteraData(data, dia, mes, ano);
  Data.MostraData(data);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);

END TesteData.
