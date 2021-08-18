program CrudProdutos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {Form1},
  uFrmCadastrarProduto in 'view\uFrmCadastrarProduto.pas' {frmCadastrarProduto},
  uProdutoModel in 'model\uProdutoModel.pas',
  uProdutoController in 'controller\uProdutoController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmProduto in 'dao\uDmProduto.pas' {DmProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCadastrarProduto, frmCadastrarProduto);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmProduto, DmProduto);
  Application.Run;
end.
