MODULE Relatorios;

IMPORT Out, Strings;

TYPE
  RelatorioPtr* = POINTER TO Relatorio;

  Relatorio* = RECORD
    titulo*: ARRAY 64 OF CHAR;
    GerarCabecalho*: PROCEDURE (r: RelatorioPtr);
    GerarRodape*: PROCEDURE (r: RelatorioPtr);
    GerarConteudo*: PROCEDURE (r: RelatorioPtr);
  END;

  RelatorioFinanceiroPtr* = POINTER TO RelatorioFinanceiro;
  RelatorioFinanceiro* = RECORD (Relatorio)
    saldoAtual*: REAL;
    despesasMensais*: REAL;
  END;

  RelatorioVendasPtr* = POINTER TO RelatorioVendas;
  RelatorioVendas* = RECORD (Relatorio)
    totalVendas*: REAL;
    mesReferencia*: INTEGER;
  END;

  RelatorioRHPtr* = POINTER TO RelatorioRH;
  RelatorioRH* = RECORD (Relatorio)
    totalFuncionarios*: INTEGER;
    novasContratacoesMes*: INTEGER;
  END;

(* Implementacoes dos metodos comuns *)

PROCEDURE GerarCabecalhoImpl (r: RelatorioPtr);
BEGIN
  Out.Ln; (* Linha em branco antes de cada cabecalho *)
  Out.String("--- Relatorio: "); 
  Out.String(r^.titulo); Out.String(" ---"); Out.Ln;
  Out.String("Data de Geracao: 26/06/2025"); Out.Ln;
  Out.String("----------------------------------"); Out.Ln;
END GerarCabecalhoImpl;

PROCEDURE GerarRodapeImpl (r: RelatorioPtr);
BEGIN
  Out.String("----------------------------------"); Out.Ln;
  Out.String("Fim do Relatorio "); 
  Out.String(r^.titulo); Out.Ln;
  Out.String("Analista Responsavel: Equipe BI"); Out.Ln;
  Out.Ln; (* Linha em branco apos cada rodape *)
END GerarRodapeImpl;

(* 
   Implementacoes dos metodos "abstratos" 
   concretizados nas classes derivadas
*)

PROCEDURE GerarConteudoFinanceiro (r: RelatorioPtr);
VAR 
  rf: RelatorioFinanceiroPtr;
BEGIN
  ASSERT(r IS RelatorioFinanceiroPtr);
  rf := r(RelatorioFinanceiroPtr);
  Out.String("Conteudo Financeiro:"); Out.Ln;
  Out.String("  Saldo Atual .......: R$ "); 
  Out.RealFix(rf^.saldoAtual, 10, 2); Out.Ln;
  Out.String("  Despesas Mensais ..: R$ "); 
  Out.RealFix(rf^.despesasMensais, 10, 2); Out.Ln;
  Out.String("  Lucro Estimado ....: R$ "); 
  Out.RealFix(rf^.saldoAtual - rf^.despesasMensais, 10, 2); 
  Out.Ln;
END GerarConteudoFinanceiro;

PROCEDURE GerarConteudoVendas (r: RelatorioPtr);
VAR 
  rv: RelatorioVendasPtr;
BEGIN
  ASSERT(r IS RelatorioVendasPtr);
  rv := r(RelatorioVendasPtr);
  Out.String("Conteudo de Vendas:"); Out.Ln;
  Out.String("  Total de Vendas no Mes "); 
  Out.Int(rv^.mesReferencia, 0); 
Out.String(": R$ "); Out.RealFix(rv^.totalVendas, 0, 2); 
  Out.Ln;
END GerarConteudoVendas;

PROCEDURE GerarConteudoRH (r: RelatorioPtr);
VAR 
  rrh: RelatorioRHPtr;
BEGIN
  ASSERT(r IS RelatorioRHPtr);
  rrh := r(RelatorioRHPtr);
  Out.String("Conteudo de Recursos Humanos:"); Out.Ln;
  Out.String("  Total de Funcionarios .....: "); 
  Out.Int(rrh^.totalFuncionarios, 0); Out.Ln;
  Out.String("  Novas Contratacoes (Mes) ..: "); 
  Out.Int(rrh^.novasContratacoesMes, 0); Out.Ln;
END GerarConteudoRH;

(* "Construtores" *)

PROCEDURE InitRelatorio*
  (r: RelatorioPtr; titulo: ARRAY OF CHAR);
BEGIN
  Strings.Copy(titulo, r^.titulo);
  r^.GerarCabecalho := GerarCabecalhoImpl;
r^.GerarRodape := GerarRodapeImpl;
  (* Metodo abstrato, sem implementacao padrao *)
  r^.GerarConteudo := NIL; 
END InitRelatorio;

PROCEDURE InitRelatorioFinanceiro*
  (rf: RelatorioFinanceiroPtr; titulo: ARRAY OF CHAR; 
   saldo: REAL; despesas: REAL
  );
BEGIN
  InitRelatorio(rf, titulo);
  rf^.saldoAtual := saldo;
  rf^.despesasMensais := despesas;
  rf^.GerarConteudo := GerarConteudoFinanceiro;
END InitRelatorioFinanceiro;

PROCEDURE InitRelatorioVendas*
  (rv: RelatorioVendasPtr; titulo: ARRAY OF CHAR; 
   vendas: REAL; mes: INTEGER
  );
BEGIN
  InitRelatorio(rv, titulo);
  rv^.totalVendas := vendas;
  rv^.mesReferencia := mes;
  rv^.GerarConteudo := GerarConteudoVendas;
END InitRelatorioVendas;

PROCEDURE InitRelatorioRH*
  (rrh: RelatorioRHPtr; titulo: ARRAY OF CHAR; 
   totalFunc: INTEGER; novasCont: INTEGER
  );
BEGIN
  InitRelatorio(rrh, titulo);
  rrh^.totalFuncionarios := totalFunc;
  rrh^.novasContratacoesMes := novasCont;
  rrh^.GerarConteudo := GerarConteudoRH;
END InitRelatorioRH;

END Relatorios.
