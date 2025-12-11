MODULE c05ex03;

IMPORT In, Out;

TYPE
  bimestre = ARRAY 4 OF REAL;

  Aluno = RECORD
    nome: ARRAY 30 OF CHAR;
    turma: CHAR;
    sala: INTEGER;
    notas: bimestre;
  END;

VAR
  aluno: ARRAY 8 OF Aluno;
  i, j: INTEGER;
  pausa: CHAR;

  PROCEDURE PadNome(nome: ARRAY OF CHAR);
  VAR i: INTEGER;
  BEGIN
    i := 0;
    WHILE (i < LEN(nome)) & (nome[i] # 0X) DO
      Out.Char(nome[i]);
      INC(i);
    END;
    WHILE (i < 30) DO
      Out.Char(" ");
      INC(i);
    END;
  END PadNome;

BEGIN
  Out.String("Escola de Computacao XPTO"); Out.Ln;
  Out.String("Cadastro Escolar de Aluno"); Out.Ln;
  Out.Ln;

  FOR i := 0 TO 7 DO
    Out.String("Aluno: "); Out.Int(i + 1, 0); Out.Ln;
    Out.Ln;

    Out.String("Nome ..............: ");
    In.Line(aluno[i].nome);

    Out.String("Turma .............: ");
    In.Char(aluno[i].turma); Out.Ln;

    Out.String("Sala ..............: ");
    In.Int(aluno[i].sala); Out.Ln;

    FOR j := 0 TO 3 DO
      Out.String("Entre a ");
      Out.Int(j + 1, 0);
      Out.String("a. nota ..: ");
      In.Real(aluno[i].notas[j]);
    END;

    Out.Ln;
  END;

  Out.String("Escola de Computacao XPTO"); Out.Ln;
  Out.String("Cadastro Escolar de Aluno"); Out.Ln;
  Out.Ln;
  Out.String("DADOS DOS ALUNOS"); Out.Ln;
  Out.Ln;

  Out.String("Aluno ");
  Out.String("Nome                           ");
  Out.String("Sala ");
  Out.String("Turma ");
  Out.String("Nota1 ");
  Out.String("Nota2 ");
  Out.String("Nota3 ");
  Out.String("Nota4 "); 
  Out.Ln;

  Out.String("----- ");
  Out.String("------------------------------ "); 
  Out.String("---- ");
  Out.String("----- ");
  Out.String("----- ");
  Out.String("----- ");
  Out.String("----- ");
  Out.String("----- "); 
  Out.Ln;

  FOR i := 0 TO 7 DO
    Out.Int(i + 1, 5); Out.Char(" ");
    PadNome(aluno[i].nome); Out.Char(" ");
    Out.Int(aluno[i].sala, 4); Out.String("     ");
    Out.Char(aluno[i].turma); Out.Char(" ");
    FOR j := 0 TO 3 DO
      Out.RealFix(aluno[i].notas[j], 5, 1); Out.Char(" ");
    END;
    Out.Ln;
  END;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c05ex03.
