MODULE c04ex04;

IMPORT In, Out;

VAR
  resp: CHAR;
  n, r: INTEGER;
  pausa: CHAR;

BEGIN
  REPEAT
    Out.String("Entre um valor numerico: ");
    In.Int(n);

    r := n * 3;

    Out.String("Resultado = ");
    Out.Int(r, 0);
    Out.Ln;
    Out.Ln;

    Out.String("Deseja continuar? (S/N): ");
    In.Char(resp);
    Out.Ln

  UNTIL (CAP(resp) # 'S');
  REPEAT In.Char(resp) UNTIL (resp = 0AX);

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c04ex04.
