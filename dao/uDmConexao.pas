unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  Data.DBXInterBase, Data.SqlExpr;

type
  TDmConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
