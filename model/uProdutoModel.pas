unit uProdutoModel;

interface

  uses
    System.SysUtils;

type
  TProduto = class
  private
    FPreco: Integer;
    FDescricao: string;
    FCodigo: Integer;
    FEstoque: Integer;
    FFornecedor: string;
    FNome: string;
    procedure SetNome(const Value: string);
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write SetNome;
    property Descricao: string read FDescricao write FDescricao;
    property preco: Integer read Fpreco write Fpreco;
    property Estoque: Integer read FEstoque write FEstoque;
    property Fornecedor: string read FFornecedor write FFornecedor;
  end;
implementation

{ TProduto }

procedure TProduto.SetNome(const Value: string);
begin
if Value = EmptyStr then
    raise Exception.Create('Preencha o campo');
  
  FNome := Value;
end;


end.
