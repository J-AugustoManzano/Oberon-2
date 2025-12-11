MODULE TesteAluno3;

IMPORT In, Out, Escola3, Strings;

VAR
  aluno: Escola3.Aluno;
  nomeLido: ARRAY 64 OF CHAR;
  mediaLida: REAL;
  salaLida: INTEGER;
  turmaLida: INTEGER;
  tempNomePtr: POINTER TO ARRAY OF CHAR;
  pausa: CHAR;

BEGIN
  Out.String("--- Teste de POO Oberon-07");
  Out.String(" (Composicao com Sala e Turma) ---"); Out.Ln;
  Out.Ln;

  (* Definindo dados do aluno *)
  Out.String("Definindo nome do aluno ..: Maria Conceicao"); 
  Out.Ln;
  Escola3.PoeNome(aluno, "Maria Conceicao");
  Out.String("Definindo media do aluno .: 92.0"); 
  Out.Ln;
  Escola3.PoeMedia(aluno, 92.0);

  (* Definindo dados da sala via composicao *)
  Out.String("Definindo sala do aluno ..: 203"); 
  Out.Ln;
  Escola3.PoeSala(aluno.dadosSala, 203);
  
  (* Definindo dados da turma via composicao *)
  Out.String("Definindo turma do aluno .: ID 5001"); 
  Out.Ln;
  Escola3.PoeTurma(aluno.dadosTurma, 5001);
  
  Out.Ln;

  (* Obtendo dados do aluno *)
  Out.String("Obtendo nome do aluno ....: ");
  tempNomePtr := Escola3.PegaNome(aluno);
  Strings.Copy(tempNomePtr^, nomeLido);
  Out.String(nomeLido); Out.Ln;

  Out.String("Obtendo media do aluno ...: ");
  mediaLida := Escola3.PegaMedia(aluno);
  Out.RealFix(mediaLida, 0, 1); Out.Ln;

  (* Obtendo dados da sala via composicao *)
  Out.String("Obtendo sala do aluno ....: ");
  salaLida := Escola3.PegaSala(aluno.dadosSala);
  Out.Int(salaLida, 0); Out.Ln;
  
  (* Obtendo dados da turma via composicao *)
  Out.String("Obtendo turma do aluno ...: ID ");
  turmaLida := Escola3.PegaTurma(aluno.dadosTurma);
  Out.Int(turmaLida, 0); Out.Ln;
  
  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END TesteAluno3.