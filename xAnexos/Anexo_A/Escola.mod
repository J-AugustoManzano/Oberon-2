MODULE Escola;

IMPORT Out, Strings;

TYPE
  Aluno* = RECORD 
    nome: ARRAY 64 OF CHAR; (* Campo-membro 'nome' *)
    media: REAL;            (* Campo-membro 'media' *)
  END;

(* --- Getters (Procedimentos para obter valores) --- *)

PROCEDURE PegaNome*(a: Aluno): POINTER TO ARRAY OF CHAR; 
VAR
  res: POINTER TO ARRAY OF CHAR;
BEGIN
  NEW(res, Strings.Length(a.nome) + 1);
  Strings.Copy(a.nome, res^);
  RETURN res
END PegaNome;

PROCEDURE PegaMedia*(a: Aluno): REAL; 
BEGIN
  RETURN a.media
END PegaMedia;

(* --- Setters (Procedimentos para definir valores) --- *)

PROCEDURE PoeNome*(VAR a: Aluno; novoNome: ARRAY OF CHAR); 
BEGIN
  Strings.Copy(novoNome, a.nome)
END PoeNome;

PROCEDURE PoeMedia*(VAR a: Aluno; novaMedia: REAL); 
BEGIN
  a.media := novaMedia
END PoeMedia;

END Escola.
