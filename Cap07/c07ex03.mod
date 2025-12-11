MODULE c07ex03;

IMPORT Pessoas, In, Out;

VAR
  pausa: CHAR;

BEGIN
  Pessoas.Novo("Margaret Hamilton (Cruz Vermelha)", 38);
  Pessoas.Novo("Grace Hopper (Primeiro compilador)", 85);
  Pessoas.Novo("Ada Lovelace (Primeiro codigo de computador)", 36);

  Pessoas.Exibir;

  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex03.
