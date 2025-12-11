MODULE c08ex01;

IMPORT G := Graph, Out;

VAR
  fundo, plano: G.Color;
  larg, alt: INTEGER;
  fonte: G.Font;

BEGIN
  G.Init;
  fonte := G.LoadFont('/FreeOberon/Data/Fonts/Main');

  G.GetTargetSize(larg, alt);
  G.MakeCol(fundo, 0, 30, 80);
  G.MakeCol(plano, 255, 255, 255);

  G.ClearToColor(fundo);
  G.DrawString('Alô, Mundo!', 
    larg DIV 2 - 50, alt DIV 2, fonte, plano);
  G.DrawString('Pressione <Enter> para finalizar...', 
    10, alt - 20, fonte, plano);
  G.Flip;

  (* Aguarda até que o usuário pressione Enter *)
  REPEAT UNTIL G.KeyPressed() & (G.ReadKey() = 0DX);

  G.Close;
END c08ex01.
