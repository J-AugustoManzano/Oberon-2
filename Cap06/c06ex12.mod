MODULE c06ex12;

IMPORT In, Out, Math2;

VAR
  i: INTEGER;
  r: REAL;
  pausa: CHAR;

BEGIN
  (* Demonstração da função abs *)
  Out.String("abs(-10) = "); 
  Out.Int(Math2.abs(-10), 0); Out.Ln;

  (* Demonstração da função int *)
  r := 5.7;
  Out.String("int(5.7) = "); 
  Out.Int(Math2.int(r), 0); Out.Ln;

  r := -4.3;
  Out.String("int(-4.3) = "); 
  Out.Int(Math2.int(r), 0); Out.Ln;

  (* Demonstração da função ceil *)
  r := 3.2;
  Out.String("ceil(3.2) = "); 
  Out.Int(Math2.ceil(r), 0); Out.Ln;

  r := -2.7;
  Out.String("ceil(-2.7) = "); 
  Out.Int(Math2.ceil(r), 0); Out.Ln;

  (* Demonstração da função floor *)
  r := 6.8;
  Out.String("floor(6.8) = "); 
  Out.Int(Math2.floor(r), 0); Out.Ln;

  r := -3.1;
  Out.String("floor(-3.1) = "); 
  Out.Int(Math2.floor(r), 0); Out.Ln;

  (* Demonstração da função factorial *)
  i := 5;
  Out.String("factorial(5) = "); 
  Out.Int(Math2.factorial(i), 0); Out.Ln;

  (* Demonstração da função fibonacci *)
  i := 8;
  Out.String("fibonacci(8) = "); 
  Out.Int(Math2.fibonacci(i), 0); Out.Ln;

  (* Demonstração da função summary *)
  i := 5;
  Out.String("summary(5) = "); 
  Out.Int(Math2.summary(i), 0); Out.Ln;

  (* Demonstração das constantes PI e E *)
  Out.String("Constante PI = "); 
  Out.Real(Math2.PI, 10); Out.Ln;
  
  Out.String("Constante E  = "); 
  Out.Real(Math2.E, 10); Out.Ln;

  Out.Ln();
  Out.String("Tecle algo para encerrar... "); 
  In.Char(pausa)
END c06ex12.
