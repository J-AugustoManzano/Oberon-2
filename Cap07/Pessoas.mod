MODULE Pessoas;

IMPORT Out, SYSTEM;

TYPE
  Pessoa* = POINTER TO PessoaDesc;
  PessoaDesc = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER;
    seguinte: Pessoa;
  END;

VAR
  inicio: Pessoa;

(* 
  Compara duas strings: retorna negativo se 
  a < b, 0 se igual, positivo se a > b 
*)
PROCEDURE CompareStrings(a, b: ARRAY OF CHAR): INTEGER;
VAR i: INTEGER;
BEGIN
  i := 0;
  WHILE (a[i] = b[i]) & (a[i] # 0X) DO
    INC(i)
  END;
  RETURN ORD(a[i]) - ORD(b[i])
END CompareStrings;

PROCEDURE Novo*(nome: ARRAY OF CHAR; idade: INTEGER);
VAR
  nova, atual, anterior: Pessoa;
BEGIN
  NEW(nova);
  nova^.nome := nome;
  nova^.idade := idade;
  nova^.seguinte := NIL;

  IF (inicio = NIL) OR (CompareStrings(nome, inicio^.nome) < 0) THEN
    nova^.seguinte := inicio;
    inicio := nova
  ELSE
    anterior := inicio;
    atual := inicio^.seguinte;

    WHILE (atual # NIL) & (CompareStrings(nome, atual^.nome) > 0) DO
      anterior := atual;
      atual := atual^.seguinte
    END;

    nova^.seguinte := atual;
    anterior^.seguinte := nova
  END
END Novo;

PROCEDURE Exibir*;
VAR
  atual: Pessoa;
  endereco: INTEGER;
BEGIN
  atual := inicio;
  WHILE (atual # NIL) DO
    Out.String("Nome .......: "); 
    Out.String(atual^.nome); Out.Ln;

    Out.String("Idade ......: "); 
    Out.Int(atual^.idade, 0); Out.Ln;

    endereco := SYSTEM.VAL(INTEGER, atual);
    Out.String("Endereco ...: 0x"); 
    Out.Hex(endereco, 8); Out.Ln;
    Out.Ln;

    atual := atual^.seguinte
  END
END Exibir;

END Pessoas.
