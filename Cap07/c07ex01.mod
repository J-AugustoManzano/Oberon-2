MODULE c07ex01;

IMPORT In, Out, SYSTEM;

TYPE
  Pessoa = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER;
  END;

VAR
  pessoa: POINTER TO Pessoa;
  pausa: CHAR;

PROCEDURE PrintPointer(p: POINTER TO Pessoa);
VAR
  endereco: INTEGER;
BEGIN
  endereco := SYSTEM.VAL(INTEGER, p);
  Out.String("0x");
  Out.Hex(endereco, 8);  (* imprime com 8 dígitos hex *)
  Out.Ln;
END PrintPointer;

BEGIN
  NEW(pessoa);

  (* Atribuição de dados ao registro *)
  pessoa^.nome := "Ada Lovelace";
  pessoa^.idade := 36;

  (* Exibição dos dados *)
  Out.String("Nome ..................: "); 
  Out.String(pessoa^.nome); Out.Ln;
  Out.String("Idade .................: "); 
  Out.Int(pessoa^.idade, 0); Out.Ln;

  (* Exibição do endereço *)
  Out.Ln;
  Out.String("Endereco do registro ..: ");
  PrintPointer(pessoa);

  Out.Ln;
  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex01.
