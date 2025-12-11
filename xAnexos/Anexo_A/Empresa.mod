MODULE Empresa;

IMPORT Out, Strings;

TYPE
  FuncionarioPtr* = POINTER TO Funcionario;
  GerentePtr* = POINTER TO Gerente;

  Funcionario* = RECORD
    nome*: ARRAY 64 OF CHAR;
    salario*: REAL;
    calcularSalario*: PROCEDURE (f: FuncionarioPtr);
  END;

  Gerente* = RECORD (Funcionario)
    bonus: REAL;
  END;

PROCEDURE CalcularSalarioFuncionario (f: FuncionarioPtr);
BEGIN
  Out.String("Salario de "); Out.String(f^.nome);
  Out.String(": R$ "); Out.RealFix(f^.salario, 0, 2); Out.Ln;
END CalcularSalarioFuncionario;

PROCEDURE CalcularSalarioGerente (f: FuncionarioPtr);
VAR g: GerentePtr;
    salarioTotal: REAL;
BEGIN
  ASSERT(f IS GerentePtr);
  g := f(GerentePtr);
  salarioTotal := g^.salario + g^.bonus;
  Out.String("Salario de "); Out.String(g^.nome);
Out.String(" (Gerente): R$ "); 
  Out.RealFix(salarioTotal, 0, 2); Out.Ln;
END CalcularSalarioGerente;

(* Construtor para Funcionario *)
PROCEDURE InitFuncionario*(f: FuncionarioPtr; 
  nome: ARRAY OF CHAR; salario: REAL);
BEGIN
  Strings.Copy(nome, f^.nome);
  f^.salario := salario;
  f^.calcularSalario := CalcularSalarioFuncionario; 
END InitFuncionario;

(* Construtor para Gerente *)
PROCEDURE InitGerente*(g: GerentePtr; 
  nome: ARRAY OF CHAR; salario: REAL; bonus: REAL);
BEGIN
  InitFuncionario(g, nome, salario);
  g^.bonus := bonus;
  g^.calcularSalario := CalcularSalarioGerente;
END InitGerente;

END Empresa. 
