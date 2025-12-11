MODULE c02ex05;

IMPORT Out, In;

VAR
  nome: ARRAY 50 OF CHAR;
  pausa: CHAR;

BEGIN
  Out.String("Entre seu nome: ");
  In.Line(nome);

  Out.String("Ola, ");
  Out.String(nome);
  Out.String("! Bem-vindo ao estudo de Oberon.");
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c02ex05.
