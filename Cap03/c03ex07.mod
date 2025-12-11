MODULE c03ex07;

IMPORT Out, In;

VAR
  mes: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("Entre com um numero equivalente a um mes: ");
  In.Int(mes);

  IF (mes >= 1) & (mes <= 12) THEN
    CASE mes OF
         1: Out.String("Janeiro");
      |  2: Out.String("Fevereiro");
      |  3: Out.String("Marco");
      |  4: Out.String("Abril");
      |  5: Out.String("Maio");
      |  6: Out.String("Junho");
      |  7: Out.String("Julho");
      |  8: Out.String("Agosto");
      |  9: Out.String("Setembro");
      | 10: Out.String("Outubro");
      | 11: Out.String("Novembro");
      | 12: Out.String("Dezembro")
    END;
  ELSE
    Out.String("Mes invalido")
  END;

  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex07.