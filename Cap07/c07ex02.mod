MODULE c07ex02;

IMPORT Out, In, SYSTEM;

TYPE
  Pessoa = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER;
    seguinte: POINTER TO Pessoa;
  END;

VAR
  p1, p2, p3: POINTER TO Pessoa;
  atual: POINTER TO Pessoa;
  pausa: CHAR;

PROCEDURE PrintPointer(p: POINTER TO Pessoa);
VAR
  endereco: INTEGER;
BEGIN
  endereco := SYSTEM.VAL(INTEGER, p);
  Out.String("0x");
  Out.Hex(endereco, 8); Out.Ln;
END PrintPointer;

BEGIN
  (* Alocação e atribuição dos nós *)
  NEW(p1); NEW(p2); NEW(p3);

  p1^.nome := "Ada Lovelace"; 
  p1^.idade := 36; 
  p1^.seguinte := p2;
  
  p2^.nome := "Grace Hopper"; 
  p2^.idade := 85; 
  p2^.seguinte := p3;

  p3^.nome := "Margaret Hamilton"; 
  p3^.idade := 38; 
  p3^.seguinte := NIL;

  (* Percorrer a lista e imprimir os dados *)
  atual := p1;

  WHILE (atual # NIL) DO
    Out.String("Nome ......: "); 
    Out.String(atual^.nome); Out.Ln;
    
    Out.String("Idade .....: "); 
    Out.Int(atual^.idade, 0); Out.Ln;
    
    Out.String("Endereco ..: ");
    PrintPointer(atual); Out.Ln;

    atual := atual^.seguinte;
  END;

  Out.Ln;
  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex02.
