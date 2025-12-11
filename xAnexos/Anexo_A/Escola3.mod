MODULE Escola3;

IMPORT Out, Strings;

TYPE
  (* Classe Sala *)
  Sala* = RECORD
    numeroSala: INTEGER;
  END;

  (* Classe Turma *)
  Turma* = RECORD
    codigoTurma: INTEGER;
  END;

  (* Classe Aluno com COMPOSIÇÃO de Sala e Turma *)
  Aluno* = RECORD
    nome*: ARRAY 64 OF CHAR;
    media*: REAL;
    dadosSala*: Sala;   (* Composição: Aluno "tem" Sala *)
    dadosTurma*: Turma; (* Composição: Aluno "tem" Turma *)
  END;

(* Métodos para a classe Sala *)

PROCEDURE PoeSala*(VAR s: Sala; numero: INTEGER);
BEGIN
  s.numeroSala := numero
END PoeSala;

PROCEDURE PegaSala*(s: Sala): INTEGER;
BEGIN
  RETURN s.numeroSala
END PegaSala;

(* Métodos para a classe Turma *)

PROCEDURE PoeTurma*(VAR t: Turma; codigo: INTEGER);
BEGIN
  t.codigoTurma := codigo
END PoeTurma;

PROCEDURE PegaTurma*(t: Turma): INTEGER;
BEGIN
  RETURN t.codigoTurma
END PegaTurma;

(* Métodos para a classe Aluno *)

PROCEDURE PoeNome*(VAR a: Aluno; novoNome: ARRAY OF CHAR);
BEGIN
  Strings.Copy(novoNome, a.nome)
END PoeNome;

PROCEDURE PegaNome*(a: Aluno): POINTER TO ARRAY OF CHAR;
  VAR
    res: POINTER TO ARRAY OF CHAR;
BEGIN
  NEW(res, Strings.Length(a.nome) + 1);
  Strings.Copy(a.nome, res^);
  RETURN res
END PegaNome;

PROCEDURE PoeMedia*(VAR a: Aluno; novaMedia: REAL);
BEGIN
  a.media := novaMedia
END PoeMedia;

PROCEDURE PegaMedia*(a: Aluno): REAL;
BEGIN
  RETURN a.media
END PegaMedia;

END Escola3.
