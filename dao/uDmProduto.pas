unit uDmProduto;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uDmConexao, uProdutoModel;

type
  TDmProduto = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    sqlInserir: TSQLDataSet;
    sqlAlterar: TSQLDataSet;
    sqlExcluir: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarFORNECEDOR: TStringField;

  public
    function GerarCodigo: Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarProduto(oProduto: TProduto; iCodigo: Integer);
    function Inserir(oProduto: TProduto; out sErro: string) : Boolean;
    function Alterar(oProduto: TProduto; out sErro: string) : Boolean;
    function Excluir(iCodigo: integer; out sErro: string) : Boolean;
  end;

var
  DmProduto: TDmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


function TDmProduto.Alterar(oProduto: TProduto; out sErro: string): Boolean;
// Editando dados do produto
begin
   with sqlAlterar, oProduto do
   begin
    Params[0].AsString := Nome;
    Params[1].AsString := Descricao;
    Params[2].AsInteger := Preco;
    Params[3].AsInteger := Estoque;
    Params[4].AsString := Fornecedor;
    Params[5].AsInteger := Codigo;
    try
     ExecSQL();
     Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar o produto: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
   end;
end;

procedure TDmProduto.CarregarProduto(oProduto: TProduto; iCodigo: Integer);
// Mostrar todas informações dos produtos
  var
    sqlProduto: TSQLDataSet;
begin
   sqlProduto := TSQLDataSet.Create(nil);
   try
     with sqlProduto do
     begin
       SQLConnection := DmConexao.SQLConexao;
       CommandText := 'select * from produtos where (codigo = ' + IntToStr(iCodigo) + ')';
       Open;
       with oProduto do
       begin
         Codigo := FieldByName('codigo').AsInteger;
         Nome := FieldByName('nome').AsString;
         Descricao := FieldByName('descricao').AsString;
         Preco := FieldByName('preco').AsInteger;
         Estoque := FieldByName('estoque').AsInteger;
         Fornecedor := FieldByName('fornecedor').AsString;
       end;
     end;
   finally
      FreeAndNil(sqlProduto);
   end;
end;

function TDmProduto.Excluir(iCodigo: integer; out sErro: string): Boolean;
// Excluir produto
begin
    with sqlExcluir do
    begin
      Params[0].AsInteger := iCodigo;
      try
     ExecSQL();
     Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir o produto: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
    end;
end;

function TDmProduto.GerarCodigo: Integer;
//Função para gerar codigo
var
  sqlSequencia: TSQLDataSet;
begin
  sqlSequencia := TSQLDataSet.Create(nil);
  try
    with sqlSequencia do
    begin
      SQLConnection := DmConexao.SQLConexao;
      CommandText := 'select coalesce(max(codigo), 0) + 1 as seq from produtos' ;
      Open;
      Result := sqlSequencia.FieldByName('seq').AsInteger;
    end;

  finally
    FreeAndNil(sqlSequencia);
  end;
end;


function TDmProduto.Inserir(oProduto: TProduto; out sErro: string): Boolean;
 // Inserir novo produto
begin
  with sqlInserir, oProduto do
  begin
    Params[0].AsInteger := GerarCodigo;
    Params[1].AsString := Nome;
    Params[2].AsString := Descricao;
    Params[3].AsInteger := Preco;
    Params[4].AsInteger := Estoque;
    Params[5].AsString := Fornecedor;
    try
     ExecSQL();
     Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir o produto: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;

  end;
end;

procedure TDmProduto.Pesquisar(sNome: string);
// Implementando metodo de pesquisa com filtro de codigo, nome e fornecedor
begin
   if cdsPesquisar.Active then
    cdsPesquisar.Close;
   cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
   cdsPesquisar.Open;
   cdsPesquisar.First;
end;

end.
