MODULE PegaTempo;

IMPORT
  Out, In, Platform, SYSTEM;

TYPE
  HUGEINT = SYSTEM.INT64;

VAR
 currentTime: HUGEINT;
 pausa: CHAR;

BEGIN
  Out.String("Obtendo o tempo do sistema..."); Out.Ln;

  (* Chama Platform.Time() para obter o tempo atual *)
  currentTime := Platform.Time();

  Out.String("Tempo atual do sistema ");
  Out.Int(currentTime, 0);
  Out.String(" em milissegundos).");
  Out.Ln;

  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END PegaTempo.