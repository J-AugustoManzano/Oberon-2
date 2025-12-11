MODULE c08ex05;

IMPORT
  G := Graph,
  R := Random;

VAR
  x, y: INTEGER;
  larg, alt: INTEGER;
  corFundo, corObjeto: G.Color;
  mouse: G.Event;
  sair: BOOLEAN;

PROCEDURE RandomNonBlackColor(VAR c: G.Color);
VAR
  r, g, b: INTEGER;
BEGIN
  REPEAT
    r := R.Int(256);
    g := R.Int(256);
    b := R.Int(256);
  UNTIL (r # 0) & (g # 0) & (b # 0);  
  G.MakeCol(c, r, g, b);
END RandomNonBlackColor;

BEGIN
  G.Init;
  G.ShowMouse(FALSE);
  G.GetTargetSize(larg, alt);

  G.MakeCol(corFundo, 0, 0, 0);
  G.MakeCol(corObjeto, 255, 255, 255);

  x := larg DIV 2;
  y := alt DIV 2;
  sair := FALSE;

  REPEAT
    WHILE G.HasEvents() DO
      G.WaitEvent(mouse);
      IF (mouse.type = G.mouseMove) THEN
        x := mouse.x; y := mouse.y
      ELSIF (mouse.type = G.mouseDown) THEN
        IF (mouse.button = 1) THEN
          sair := TRUE
        ELSIF (mouse.button = 2) THEN
          RandomNonBlackColor(corObjeto)
        END
      END
    END;

    G.ClearToColor(corFundo);
    G.FillCircle(x, y, 16, corObjeto);
    G.Circle(x, y, 16, corObjeto);
    G.Flip;
    G.Delay(20);
  UNTIL sair;

  G.ShowMouse(TRUE);
  G.Close
END c08ex05.
