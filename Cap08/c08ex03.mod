MODULE c08ex03;

IMPORT
  G := Graph,
  M := Math;

VAR
  largura, altura: INTEGER;
  corFundo, corEixos, corGrafico: G.Color;
  fonte: G.Font;

PROCEDURE Truncar(x: REAL): INTEGER;
BEGIN
  RETURN FLOOR(x)
END Truncar;

PROCEDURE DesenharEixos;
VAR
  i, px, py: INTEGER;
  margemX, margemY: INTEGER;
  xInicio, xFim, yInicio, yFim: INTEGER;
BEGIN
  G.MakeCol(corEixos, 255, 255, 255);

  margemX := 40;
  margemY := 40;

  xInicio := margemX;
  xFim := largura - margemX;
  yInicio := margemY;
  yFim := altura - margemY;

G.Line(xInicio, altura DIV 2, xFim, 
    altura DIV 2, corEixos);
  G.Line(largura DIV 2, yInicio, 
    largura DIV 2, yFim, corEixos);

  (* Marcas de escala *)
  FOR i := -(largura DIV 2 - margemX) TO 
    (largura DIV 2 - margemX) BY 20 DO
    px := (largura DIV 2) + i;
    py := altura DIV 2;

    IF (px >= xInicio) & (px <= xFim) THEN
      G.Line(px, py - 3, px, py + 3, corEixos);
    END;

    IF (py + i >= yInicio) & (py + i <= yFim) THEN
      G.Line(largura DIV 2 - 3, py + i, 
        largura DIV 2 + 3, py + i, corEixos);
    END;
  END;
END DesenharEixos;

PROCEDURE DesenharParabola(a, b, c: INTEGER);
VAR
  x, y: INTEGER;
  px, py: INTEGER;
  cor: G.Color;
  margemX, margemY: INTEGER;
  xMin, xMax: INTEGER;
BEGIN
  G.MakeCol(cor, 255, 0, 255);  (* Magenta *)

  margemX := 40;
  margemY := 40;

  xMin := - (largura DIV 2 - margemX);
  xMax := (largura DIV 2 - margemX);

  x := xMin;
  WHILE (x <= xMax) DO
    (* y = (a*x²)/100 + b*x + c - cálculo inteiro *)
    y := (a * x * x) DIV 100 + b * x + c;

    px := x + (largura DIV 2);
    py := (altura DIV 2) - y;

    IF (px >= margemX) & (px < largura - margemX) & 
      (py >= margemY) & (py < altura - margemY) THEN
      G.PutPixel(px, py, cor)
    END;

    INC(x);
  END;
END DesenharParabola;

PROCEDURE MostrarMensagem;
BEGIN
  G.MakeCol(corFundo, 0, 0, 0);
G.FillRect(8, altura - 40, largura - 16, 
    altura - 8, corFundo);

  G.MakeCol(corEixos, 255, 255, 255);
  G.DrawString("Tecle <Enter> para finalizar...", 
    10, altura - 32, fonte, corEixos);
END MostrarMensagem;

PROCEDURE Executar;
BEGIN
  G.Init;
  G.GetTargetSize(largura, altura);

  G.MakeCol(corFundo, 0, 0, 0);
  G.FillRect(0, 0, largura, altura, corFundo);

  fonte := G.LoadFont("/FreeOberon/Data/Fonts/Main");

  DesenharEixos;
  DesenharParabola(1, 0, -100);

  G.MakeCol(corEixos, 255, 255, 255);
  G.DrawString("y = ax² + bx + c", 10, 10, 
    fonte, corEixos);

  MostrarMensagem;

  G.Flip;

  REPEAT UNTIL (G.KeyPressed()) & (G.ReadKey() = 0DX);

  G.Close;
END Executar;

BEGIN
  Executar
END c08ex03.
