MODULE TesteFunc;

IMPORT Empresa, Out, In;

VAR
  func1: Empresa.FuncionarioPtr;
  func2: Empresa.GerentePtr;

  ref1: Empresa.FuncionarioPtr;
  ref2: Empresa.FuncionarioPtr;

  pausa: CHAR;

BEGIN
  NEW(func1);
  Empresa.InitFuncionario(func1, "Alice", 4000.0); 

  NEW(func2);
  Empresa.InitGerente(func2, "Bob", 6000.0, 2000.0);

  ref1 := func1; 
  ref2 := func2; 

  ref1^.calcularSalario(ref1); 
  ref2^.calcularSalario(ref2); 

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);

END TesteFunc.
