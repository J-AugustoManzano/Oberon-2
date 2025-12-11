MODULE c06ex01;

IMPORT In, Out;

VAR
  opcao: INTEGER;

PROCEDURE ROTSOMA;
VAR
  a1, b1, r1: REAL;
BEGIN
  Out.Ln;
  Out.String("Rotina de Adicao"); Out.Ln; Out.Ln;

  Out.String("Entre o 1o. valor: ");
  In.Real(a1);

  Out.String("Entre o 2o. valor: ");
  In.Real(b1);

  r1 := a1 + b1;

  Out.String("O resultado da operacao equivale a: ");
  Out.RealFix(r1, 0, 2); Out.Ln; Out.Ln;
END ROTSOMA;

PROCEDURE ROTSUBTRACAO;
VAR
  a2, b2, r2: REAL;
BEGIN
  Out.Ln;
  Out.String("Rotina de Subtracao"); Out.Ln; Out.Ln;

  Out.String("Entre o 1o. valor: ");
  In.Real(a2);

  Out.String("Entre o 2o. valor: ");
  In.Real(b2);

  r2 := a2 - b2;

  Out.String("O resultado da operacao equivale a: ");
  Out.RealFix(r2, 0, 2); Out.Ln; Out.Ln;
END ROTSUBTRACAO;

PROCEDURE ROTMULTIPLICACAO;
VAR
  a3, b3, r3: REAL;
BEGIN
  Out.Ln;
  Out.String("Rotina de Multiplicacao"); Out.Ln; Out.Ln;

  Out.String("Entre o 1o. valor: ");
  In.Real(a3);

  Out.String("Entre o 2o. valor: ");
  In.Real(b3);

  r3 := a3 * b3;

  Out.String("O resultado da operacao equivale a: ");
  Out.RealFix(r3, 0, 2); Out.Ln; Out.Ln;
END ROTMULTIPLICACAO;

PROCEDURE ROTDIVISAO;
VAR
  a4, b4, r4: REAL;
BEGIN
  Out.Ln;
  Out.String("Rotina de Divisao"); Out.Ln; Out.Ln;

  Out.String("Entre o 1o. valor: ");
  In.Real(a4);

  Out.String("Entre o 2o. valor: ");
  In.Real(b4);

  IF (b4 = 0.0) THEN
    Out.String("O resultado da operacao equivale a: ERRO"); 
    Out.Ln;
  ELSE
    r4 := a4 / b4;
    Out.String("O resultado da operacao equivale a: ");
    Out.RealFix(r4, 0, 2); Out.Ln;
  END;
  Out.Ln;
END ROTDIVISAO;

BEGIN
  opcao := 0;

  WHILE opcao # 5 DO
    Out.String("CALCULADORA - V1"); Out.Ln; Out.Ln;
    Out.String("[1] - Adicao"); Out.Ln;
    Out.String("[2] - Subtracao"); Out.Ln;
    Out.String("[3] - Multiplicacao"); Out.Ln;
    Out.String("[4] - Divisao"); Out.Ln;
    Out.String("[5] - Fim de Programa"); Out.Ln;
    Out.Ln;

    Out.String("Escolha uma opcao: ");
    In.Int(opcao);

    IF (opcao # 5) THEN
      IF (opcao >= 1) & (opcao <= 4) THEN
        CASE (opcao) OF
            1: ROTSOMA;
          | 2: ROTSUBTRACAO;
          | 3: ROTMULTIPLICACAO;
          | 4: ROTDIVISAO
        END;
      ELSE
        Out.Ln;
        Out.String("Opcao invalida - Tente novamente"); Out.Ln;
        Out.Ln;
      END;
    END;
  END;
END c06ex01.
