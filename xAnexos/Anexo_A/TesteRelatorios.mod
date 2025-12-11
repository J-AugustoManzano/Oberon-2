MODULE TesteRelatorios;

IMPORT Relatorios, Out, In;

VAR
  (* A referencia polimorfica para o relatorio selecionado *)
  relatorioParaExibir: Relatorios.RelatorioPtr;
  (* Instancias concretas dos relatorios que serao usadas no menu *)
  relatorioFin: Relatorios.RelatorioFinanceiroPtr;
  relatorioVnd: Relatorios.RelatorioVendasPtr;
  relatorioHR: Relatorios.RelatorioRHPtr;
  opcao: INTEGER;
  pausa: CHAR;

PROCEDURE ExibirMenu;
BEGIN
  Out.String("--- Menu de Relatorios ---"); Out.Ln;
  Out.String("[1] - Gerar Relatorio Financeiro"); Out.Ln;
  Out.String("[2] - Gerar Relatorio de Vendas"); Out.Ln;
  Out.String("[3] - Gerar Relatorio de RH"); Out.Ln;
  Out.String("[4] - Sair"); Out.Ln;
  Out.Ln;
  Out.String("Escolha uma opcao: ");
END ExibirMenu;

PROCEDURE GerarRelatorio (r: Relatorios.RelatorioPtr);
BEGIN
  IF (r # NIL) THEN
    r^.GerarCabecalho(r);
    r^.GerarConteudo(r);
    r^.GerarRodape(r);
  ELSE
    Out.String("Erro: Relatorio nao inicializado ou selecionado."); 
    Out.Ln;
  END;
END GerarRelatorio;

BEGIN
  (* Inicializa as instancias de relatorio uma unica vez *)
  NEW(relatorioFin);
  Relatorios.InitRelatorioFinanceiro
    (relatorioFin, "Analise Financeira Trimestral", 
    180000.0, 90000.0);

  NEW(relatorioVnd);
  Relatorios.InitRelatorioVendas
    (relatorioVnd, "Relatorio de Metas de Vendas", 35000.75, 6);

  NEW(relatorioHR);
  Relatorios.InitRelatorioRH
    (relatorioHR, "Resumo de RH Mensal", 125, 3);

  REPEAT (* Inicia o loop pos-teste *)
    ExibirMenu;
    In.Int(opcao);

    IF (opcao >= 1) & (opcao <= 4) THEN
      CASE (opcao) OF
         1:
           relatorioParaExibir := relatorioFin;
           GerarRelatorio(relatorioParaExibir);
       | 2:
           relatorioParaExibir := relatorioVnd;
           GerarRelatorio(relatorioParaExibir);
       | 3:
           relatorioParaExibir := relatorioHR;
           GerarRelatorio(relatorioParaExibir);
       | 4:
         Out.Ln;
         Out.String("Fim de execucao do programa. Ate mais! ");
      END;
    ELSE
      Out.Ln;
      Out.String("Opcao invalida. Por favor, escolha novamente."); 
      Out.Ln; Out.Ln;
    END;

    IF (opcao # 4) THEN
      Out.String("Tecle <Enter> para voltar ao menu... ");
      In.Char(pausa);
      Out.Ln;
    END;

  UNTIL (opcao = 4); 
  In.Char(pausa); Out.Ln; 

END TesteRelatorios.
