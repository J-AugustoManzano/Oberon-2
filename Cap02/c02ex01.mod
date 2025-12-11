MODULE c02ex01;

IMPORT Out, In;

VAR
  pausa: CHAR;

BEGIN
  (* Operadores binários *)

  Out.Int(5 + 3, 0); Out.Ln;
  Out.Int(10 - 4, 0); Out.Ln;
  Out.Int(2 * 6, 0); Out.Ln;
  Out.Real(10.0 / 3.0, 6); Out.Ln;
  Out.Int(10 DIV 3, 0); Out.Ln;
  Out.Int(10 MOD 3, 0); Out.Ln;

  (* Operadores unários *)

  Out.Int(+5, 0); Out.Ln;
  Out.Int(-8, 0); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c02ex01.
