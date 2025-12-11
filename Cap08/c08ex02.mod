MODULE c08ex02;

IMPORT
  G := Graph,
  M := Math;

VAR
  corFundo, corTexto: G.Color;
  largura, altura,
  x, y, cx, cy, raio: INTEGER;
  angulo: REAL;
  fonte: G.Font;

PROCEDURE DesenharFormas;
VAR
  largLinha, xLinhaInicio, xLinhaFim: INTEGER;
  espEntreFormas: INTEGER;
  baseY: INTEGER;
  quadX, triX, circX: INTEGER;
  largTotalFormas: INTEGER;
BEGIN
  G.MakeCol(corFundo, 0, 50, 0);
  G.FillRect(0, 0, largura, altura, corFundo);

  (* Espaçamento entre as formas *)
  espEntreFormas := 40;

  (* Linha branca centralizada *)
  largLinha := 590;
  xLinhaInicio := (largura - largLinha) DIV 2;
  xLinhaFim := xLinhaInicio + largLinha;
  G.MakeCol(corTexto, 255, 255, 255);
  G.Line(xLinhaInicio, 60, xLinhaFim, 60, corTexto);

  (* Definição da linha base para as formas *)
  baseY := 100;

  (* Calcular largura total para centralizar as formas *)
  largTotalFormas := 120 + 
  espEntreFormas + 120 + 
  espEntreFormas + 120;

  (* Quadrado amarelo *)
  quadX := (largura - largTotalFormas) DIV 2;
  G.MakeCol(corTexto, 255, 255, 0);
  G.Line(quadX, baseY, quadX + 120, baseY, corTexto);
  G.Line(quadX + 120, baseY, quadX + 120, 
  baseY + 120, corTexto);
  G.Line(quadX + 120, baseY + 120, quadX, 
  baseY + 120, corTexto);
  G.Line(quadX, baseY + 120, quadX, baseY, corTexto);

  (* Triângulo ciano *)
  triX := quadX + 120 + espEntreFormas;
  G.MakeCol(corTexto, 0, 255, 255);
  G.Line(triX + 60, baseY, triX + 120, baseY + 80, corTexto);
  G.Line(triX + 120, baseY + 80, triX, baseY + 80, corTexto);
  G.Line(triX, baseY + 80, triX + 60, baseY, corTexto);

  (* Circunferência magenta *)
  circX := triX + 120 + espEntreFormas + 60;
  G.MakeCol(corTexto, 255, 0, 255);
  cx := circX;
  cy := baseY + 60;
  raio := 60;
  angulo := 0.0;
  WHILE (angulo <= 2.0 * M.pi) DO
    x := cx + FLOOR(raio * M.cos(angulo));
    y := cy + FLOOR(raio * M.sin(angulo));
    G.PutPixel(x, y, corTexto);
    angulo := angulo + 0.01
  END;

  G.MakeCol(corFundo, 0, 50, 0);
  G.FillRect(8, altura - 40, 
  largura - 16, altura - 8, corFundo);

  G.MakeCol(corTexto, 255, 255, 255);
  G.DrawString("Tecle <Enter> para finalizar...", 
    10, altura - 32, fonte, corTexto);
END DesenharFormas;

BEGIN
  G.Init;
  fonte := G.LoadFont("/FreeOberon/Data/Fonts/Main");
  G.GetTargetSize(largura, altura);
  DesenharFormas;
  G.Flip;
  REPEAT UNTIL (G.KeyPressed()) & (G.ReadKey() = 0DX);
  G.Close;
END c08ex02.
