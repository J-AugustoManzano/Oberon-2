MODULE c03ex04;

IMPORT Out, In;

VAR
  transp, transpMaiusc: CHAR;
  pausa: CHAR;

BEGIN
  Out.String("Escolha o tipo de transporte:");
  Out.Ln();
  Out.Ln();
  Out.String("[M] - Motocicleta");
  Out.Ln();
  Out.String("[S] - Scooter");
  Out.Ln();
  Out.Ln();

  Out.String("==> ");
  In.Char(transp);
  Out.Ln();
  IF (transp >= 'a') & (transp <= 'z') THEN
    transpMaiusc := CHR(ORD(transp) - (ORD('a') - ORD('A')))
  ELSE
    transpMaiusc := transp
  END;
  REPEAT In.Char(transp) UNTIL (transp = 0AX);

  IF (transpMaiusc = 'M') OR (transpMaiusc = 'S') THEN
    Out.String("Transporte valido.")
  ELSE
    Out.String("Transporte invalido.")
  END;
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c03ex04.
