unit uProdutoController;

interface

uses
  uProdutoModel, uDmProduto, System.SysUtils;

type
  TProdutoController =  class
    public
      constructor Create;
      destructor Destroy; override;
      procedure Pesquisar(sNome: string);
      procedure CarregarProduto(oProduto: TProduto; iCodigo: Integer);
      function Inserir(oProduto: TProduto; var sErro: string): Boolean;
      function Alterar(oProduto: TProduto; var sErro: string): Boolean;
      function Excluir(iCodigo: Integer; var sErro: string): Boolean;
  end;

implementation

{ TProdutoController }

function TProdutoController.Alterar(oProduto: TProduto;
  var sErro: string): Boolean;
  // recebe metodo alterar da camada dao
begin
  Result := DmProduto.Alterar(oProduto, sErro);
end;

procedure TProdutoController.CarregarProduto(oProduto: TProduto;
  iCodigo: Integer);
    // recebe metodo CarregarProduto da camada dao
begin
  DmProduto.CarregarProduto(oProduto, iCodigo);
end;

constructor TProdutoController.Create;
begin
  // DmProduto := TDmProduto.Create(nil);
end;

destructor TProdutoController.Destroy;
begin
  // FreeAndNil(DmProduto);
  inherited;
end;

function TProdutoController.Excluir(iCodigo: Integer;
  var sErro: string): Boolean;
  // recebe metodo excluir da camada dao
begin
  Result := DmProduto.Excluir(iCodigo, sErro);
end;

function TProdutoController.Inserir(oProduto: TProduto;
 var sErro: string): Boolean;
// recebe metodo inserir da camada dao
begin
  Result := DmProduto.Inserir(oProduto, sErro);
end;

procedure TProdutoController.Pesquisar(sNome: string);
  // recebe metodo pesquisar da camada dao
begin
  DmProduto.Pesquisar(sNome);
end;

end.
