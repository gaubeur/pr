unit Model.Conexao.SqlServer;
interface

uses
  Model.Conexao.Interfaces,
  Classes,
  Data.DB,
  Data.SqlExpr,
  SysUtils,
  Forms;


type
  TModelConexaoSqlServer = class(TInterfacedObject, iModelConexaoGeral)
    private
      FConexaoBanco : TSQLConnection;
      FQuery : TSQLQuery;
      procedure ConfigConexao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelConexaoGeral;

      function Sql (Value : String) : iModelConexaoGeral;
      function Open : iModelConexaoGeral;
      function DataSource ( aValue : TDataSource ) : iModelConexaoGeral;
      function ExecSql : iModelConexaoGeral;
      function Params (Param : String; Value : Variant) : iModelConexaoGeral; overload;
      function DataSet(DataSource : TDataSource) : iModelConexaoGeral; overload;
      function DataSet : TDataSet; overload;

  end;

implementation

{ TModelConexaoSqlServer }

procedure TModelConexaoSqlServer.ConfigConexao;
var
  sArquivoConfig : String;
begin

      FConexaoBanco.Connected := False;
      FConexaoBanco.ConnectionName := 'PR';
      FConexaoBanco.Params.Clear;
      //sArquivoConfig := extractfilepath(application.exename) + 'config.ini';
      FConexaoBanco.LoadParamsFromIniFile(sArquivoConfig);
      FConexaoBanco.KeepConnection := False;
      FConexaoBanco.DriverName := 'MSSQL';
      FConexaoBanco.LibraryName := 'dbxmss.dll';
      FConexaoBanco.VendorLib := 'sqlncli.dll';
      FConexaoBanco.GetDriverFunc := 'getSQLDriverMSSQL';
      FConexaoBanco.LoginPrompt := False;
      FConexaoBanco.Connected := True;

end;

constructor TModelConexaoSqlServer.Create;
begin
  FConexaoBanco        := TSQLConnection.Create(nil);
  FQuery               := TSQLQuery.Create(nil);
  FQuery.SQLConnection := FConexaoBanco;
  ConfigConexao;
end;

function TModelConexaoSqlServer.DataSet(
  DataSource: TDataSource): iModelConexaoGeral;
begin

end;

function TModelConexaoSqlServer.DataSet: TDataSet;
begin

end;

function TModelConexaoSqlServer.DataSource(
  aValue: TDataSource): iModelConexaoGeral;
begin

end;

destructor TModelConexaoSqlServer.Destroy;
begin
  if assigned(FQuery) then FQuery.Free;
  if assigned(FConexaoBanco) then FConexaoBanco.Free;
  inherited;
end;


function TModelConexaoSqlServer.ExecSql: iModelConexaoGeral;
begin

end;

class function TModelConexaoSqlServer.New: iModelConexaoGeral;
begin
  Result := Self.Create;
end;

function TModelConexaoSqlServer.Open: iModelConexaoGeral;
begin
  Result := Self;
  FQuery.Open;
end;

function TModelConexaoSqlServer.Params(Param: String;
  Value: Variant): iModelConexaoGeral;
begin
  Result := Self;
  FQuery.ParamByName(Param).Value := Value;
end;

function TModelConexaoSqlServer.Sql(Value: String): iModelConexaoGeral;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.sql.Add(Value);
end;

end.
