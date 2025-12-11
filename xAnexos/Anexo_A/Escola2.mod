MODULE Escola2;

IMPORT Out, Strings;

TYPE
  (* 1. Classe Base: Sala *)

  Sala* = RECORD
    numeroSala: INTEGER; 
  END;

  (* 2. Classe Aluno herdando de Sala *)

  Aluno* = RECORD (Sala) (* Aluno agora herda de Sala *)
    nome: ARRAY 64 OF CHAR; 
    media: REAL; 
  END;

(* Métodos para a classe Aluno *)

PROCEDURE PoeSala*(VAR s: Sala; numero: INTEGER);
BEGIN
  s.numeroSala := numero
END PoeSala;

PROCEDURE PegaSala*(s: Sala): INTEGER;
BEGIN
  RETURN s.numeroSala
END PegaSala;

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

END Escola2.