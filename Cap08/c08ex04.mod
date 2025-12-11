MODULE c08ex04;

IMPORT
  G := Graph,
  M := Math,
  R := Random;

VAR
  x, y: INTEGER;
  dx, dy: INTEGER;
  largura, altura: INTEGER;
  raio: INTEGER;
  corFundo, corBola: G.Color;

PROCEDURE DesenharCirculo(cx, cy, r: INTEGER; cor: G.Color);
VAR
  angulo: REAL;
  px, py: INTEGER;
BEGIN
  angulo := 0.0;
  WHILE angulo <= 2.0 * M.pi DO
    px := cx + FLOOR(r * M.cos(angulo));
    py := cy + FLOOR(r * M.sin(angulo));
    IF (px >= 0) & (px < largura) & 
      (py >= 0) & (py < altura) THEN
      G.PutPixel(px, py, cor)
    END;
    angulo := angulo + 0.01;
  END;
END DesenharCirculo;

BEGIN
  G.Init;
  G.GetTargetSize(largura, altura);

  G.MakeCol(corFundo, 0, 0, 0);      (* Preto *)
  G.MakeCol(corBola, 255, 255, 255); (* Branco *)
  raio := 15;

  (* Posição inicial aleatória dentro dos limites *)
  x := raio + R.Int(largura - 2 * raio);
  y := raio + R.Int(altura - 2 * raio);

  (* Velocidade aleatória para ambos os eixos *)
  dx := R.Int(4) + 2;
  dy := R.Int(4) + 2;

  REPEAT
    G.FillRect(0, 0, largura, altura, corFundo);
    DesenharCirculo(x, y, raio, corBola);

    x := x + dx;
    y := y + dy;

    IF (x + raio >= largura) OR 
      (x - raio <= 0) THEN dx := -dx END;
    IF (y + raio >= altura) OR 
      (y - raio <= 0) THEN dy := -dy END;

    G.Flip;
    G.Delay(15);
  UNTIL G.KeyPressed();

  G.Close;
END c08ex04.
