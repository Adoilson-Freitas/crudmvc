unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnProdutos: TButton;
    procedure btnProdutosClick(Sender: TObject);
  private
    procedure AbrirProduto;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uFrmCadastrarProduto;

procedure TForm1.AbrirProduto;
begin
  frmCadastrarProduto :=  TfrmCadastrarProduto.Create(nil);
  try
    frmCadastrarProduto.ShowModal;
  finally
    FreeAndNil(frmCadastrarProduto);
  end;
end;

procedure TForm1.btnProdutosClick(Sender: TObject);
begin
   AbrirProduto;
end;

end.
