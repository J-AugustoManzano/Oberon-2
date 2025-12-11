MODULE TesteAluno2;

IMPORT In, Out, Escola2, Strings;

VAR
  aluno: Escola2.Aluno;
  nomeLido: ARRAY 64 OF CHAR;
  mediaLida: REAL;
  salaLida: INTEGER;
  tempNomePtr: POINTER TO ARRAY OF CHAR;
  pausa: CHAR;

BEGIN
  Out.String("--- Teste de POO Oberon-07");
  Out.String(" (Heranca com Sala) ---"); Out.Ln;
  Out.Ln;

  Out.String("Definindo nome do aluno ..: Joao Silva"); 
  Out.Ln;
  Escola2.PoeNome(aluno, "Joao Silva");
  Out.String("Definindo media do aluno .: 85.5"); 
  Out.Ln;
  Escola2.PoeMedia(aluno, 85.5);
  Out.String("Definindo sala do aluno ..: 101"); 
  Out.Ln;
  Escola2.PoeSala(aluno, 101);

  Out.Ln;

  Out.String("Obtendo nome do aluno ....: ");
  tempNomePtr := Escola2.PegaNome(aluno);
  Strings.Copy(tempNomePtr^, nomeLido);
  Out.String(nomeLido); Out.Ln;

  Out.String("Obtendo media do aluno ...: ");
  mediaLida := Escola2.PegaMedia(aluno);
  Out.RealFix(mediaLida, 0, 1); Out.Ln;
  
  Out.String("Obtendo sala do aluno ....: ");
  salaLida := Escola2.PegaSala(aluno);
  Out.Int(salaLida, 0); Out.Ln;
  
  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END TesteAluno2.