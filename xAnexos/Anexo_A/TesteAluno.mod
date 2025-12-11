MODULE TesteAluno;

IMPORT In, Out, Escola, Strings;

VAR
  aluno: Escola.Aluno;
  nomeLido: ARRAY 64 OF CHAR;
  mediaLida: REAL;
  tempNomePtr: POINTER TO ARRAY OF CHAR;
  pausa: CHAR;

BEGIN
  Out.String("--- Teste de POO Oberon-07 ---"); Out.Ln;
  Out.Ln;

  Out.String("Definindo nome do aluno ..: Joao Silva"); Out.Ln;
  Escola.PoeNome(aluno, "Joao Silva");
  Out.String("Definindo media do aluno .: 85.5"); Out.Ln;
  Escola.PoeMedia(aluno, 85.5);
  
  Out.Ln;

  Out.String("Obtendo nome do aluno ....: ");
  tempNomePtr := Escola.PegaNome(aluno);
  Strings.Copy(tempNomePtr^, nomeLido);
  Out.String(nomeLido); Out.Ln;

  Out.String("Obtendo media do aluno ...: ");
  mediaLida := Escola.PegaMedia(aluno);
  Out.RealFix(mediaLida, 0, 1); Out.Ln;
  
  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END TesteAluno.