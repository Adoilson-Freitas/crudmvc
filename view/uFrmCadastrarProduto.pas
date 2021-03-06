unit uFrmCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, uDmProduto;

type
  TOperacao = (opNovo, opAlterar, opNavegar);
  TfrmCadastrarProduto = class(TForm)
    pnlRodape: TPanel;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    pnlFiltro: TPanel;
    editPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    dsPesq: TDataSource;
    edtNome: TLabeledEdit;
    edtDescri??o: TLabeledEdit;
    edtPre?o: TLabeledEdit;
    edtEstoque: TLabeledEdit;
    edtFornecedor: TLabeledEdit;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtCodigo: TLabeledEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestry(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarProduto;
    Procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
  end;

var
  frmCadastrarProduto: TfrmCadastrarProduto;

implementation

{$R *.dfm}

uses uProdutoController, uProdutoModel;

procedure TfrmCadastrarProduto.Alterar;
var
  oProduto: TProduto;
  oProdutoController: TProdutoController;
  sErro: string;
begin
    oProduto := TProduto.Create;
    oProdutoController := TProdutoController.Create;
    try
       with oProduto do
       begin
         Codigo := StrToIntDef(edtCodigo.Text, 0);
         Nome := edtNome.Text;
         Descricao := edtDescri??o.Text;
         Estoque := StrToInt(edtEstoque.Text);
         Preco := StrToInt(edtPre?o.Text);
         Fornecedor := edtFornecedor.Text;
       end;
       if oProdutoController.Alterar(oProduto, sErro) = False then
        raise Exception.Create(sErro);
    finally
      FreeAndNil(oProdutoController);
      FreeAndNil(oProduto);
    end;
end;

procedure TfrmCadastrarProduto.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TfrmCadastrarProduto.btnCancelarClick(Sender: TObject);
begin
 HabilitarControles(opNavegar);
end;

procedure TfrmCadastrarProduto.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadastrarProduto.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmCadastrarProduto.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TfrmCadastrarProduto.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfrmCadastrarProduto.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TfrmCadastrarProduto.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCadastrarProduto.CarregarProduto;
var
  oProduto: TProduto;
  oProdutoController: TProdutoController;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.CarregarProduto(oProduto, dsPesq.DataSet.FieldByName('codigo').AsInteger);
    with oProduto do
    begin
      edtCodigo.Text := IntToStr(Codigo);
      edtNome.Text := Nome;
      edtDescri??o.Text := Descricao;
      edtEstoque.Text := IntToStr(Estoque);
      edtPre?o.Text := IntToStr(Preco);
      edtFornecedor.Text := Fornecedor;
    end;
  finally
  FreeAndNil(oProdutoController);
  FreeAndNil(oProduto);
  end;
end;

procedure TfrmCadastrarProduto.Configuracoes;
begin
  tbPesq.TabVisible := false;
  tbDados.TabVisible := false;
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TfrmCadastrarProduto.Detalhar;
begin
  CarregarProduto;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TfrmCadastrarProduto.Excluir;
var
  oProdutoController: TProdutoController;
  sErro: string;
begin
  oProdutoController := TProdutoController.Create;
  try
    if (DmProduto.cdsPesquisar.Active) and (DmProduto.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja excluir este produto?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        if oProdutoController.Excluir(DmProduto.cdsPesquisarCODIGO.AsInteger, sErro) = False then
          raise Exception.Create(sErro);
          oProdutoController.Pesquisar(editPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('n?o h? registro para ser excluido!');
  finally
    FreeAndNil(oProdutoController);
  end;
end;

procedure TfrmCadastrarProduto.FormCreate(Sender: TObject);
begin
  DmProduto:= TDmProduto.Create(nil);
end;

procedure TfrmCadastrarProduto.FormDblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadastrarProduto.FormDestry(Sender: TObject);
begin
 FreeAndNil(DmProduto);
end;

procedure TfrmCadastrarProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin;
    key := #0;
    perform(WM_NEXTDLGCTL, 0, 0)
  end;
end;

procedure TfrmCadastrarProduto.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmCadastrarProduto.Gravar;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
     case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
     end;
     oProdutoController.Pesquisar(editPesquisar.Text)
  finally
    FreeAndNil(oProdutoController);
  end;
end;

procedure TfrmCadastrarProduto.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
      begin
        edtNome.Enabled := True;
        edtDescri??o.Enabled := True;
        edtEstoque.Enabled := True;
        edtPre?o.Enabled := True;
        edtFornecedor.Enabled := True;
        btnListar.Enabled := False;
        btnAlterar.Enabled := False;
        btnGravar.Enabled := True;
        btnCancelar.Enabled := True;
      end;
    opNavegar:
    begin
        edtNome.Enabled := False;
        edtDescri??o.Enabled := False;
        edtEstoque.Enabled := False;
        edtPre?o.Enabled := False;
        edtFornecedor.Enabled := False;
        btnListar.Enabled := True;
        btnAlterar.Enabled := True;
        btnGravar.Enabled := False;
        btnCancelar.Enabled := False;
    end;
  end;

end;

procedure TfrmCadastrarProduto.Inserir;
var
  oProduto: TProduto;
  oProdutoController: TProdutoController;
  sErro: string;
begin
       oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try
    with oProduto do
    begin
      Codigo := 0;
      Nome := edtNome.Text;
      Descricao := edtDescri??o.Text;
      Estoque := StrToInt(edtEstoque.Text);
      Preco := StrToInt(edtPre?o.Text);
      Fornecedor := edtFornecedor.Text;
    end;
    if oProdutoController.Inserir(oProduto, sErro) = False then
      raise Exception.Create(sErro);
  finally
   FreeAndNil(oProdutoController);
   FreeAndNil(oProduto)
  end;
end;

procedure TfrmCadastrarProduto.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TfrmCadastrarProduto.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TfrmCadastrarProduto.Pesquisar;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.Pesquisar(editPesquisar.Text);
  finally
    FreeAndNil(oProdutoController);
  end;
end;

end.
