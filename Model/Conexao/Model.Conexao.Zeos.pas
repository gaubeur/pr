unit Model.Conexao.Zeos;

interface

uses
  Model.Conexao.Interfaces,
  Classes, DB,
  // lib zeos para conexão com o mysql
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset;

type
  TModelConexaoZeos = class(TInterfacedObject, iModelConexaoGeral)
    private
      ZConnection1: TZConnection;
      FQuery: TZQuery;
      procedure ConfigConexao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelConexaoGeral;
      function Open : iModelConexaoGeral;
      function DataSource ( aValue : TDataSource ) : iModelConexaoGeral;
      function ExecSql : iModelConexaoGeral;
      function Sql (Value : String) : iModelConexaoGeral;
      function Params (Param : String; Value : Variant) : iModelConexaoGeral; overload;
      function DataSet(DataSource : TDataSource) : iModelConexaoGeral; overload;
      function DataSet : TDataSet; overload;
  end;

implementation

{ TModelConexaoZeos }

procedure TModelConexaoZeos.ConfigConexao;
begin
  // poderia ter vindo de um arquivo de configuração
  ZConnection1.Database := 'stark316_pr';
  ZConnection1.HostName := '192.185.210.34'; // 'localhost'
  ZConnection1.Protocol := 'mysql-5';
  ZConnection1.User     := 'stark316_pr';
  ZConnection1.Password := 'pr12345';
//ZConnection1.LibraryLocation := 'C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\lib\zeoslib7\LIB\mysql\libmySQL50.dll';
  ZConnection1.LibraryLocation := 'libmySQL50.dll';
end;

constructor TModelConexaoZeos.Create;
begin
  ZConnection1       := TZConnection.Create(nil);
  FQuery             := TZQuery.Create(nil);
  FQuery.Connection := ZConnection1;
  ConfigConexao;
end;

function TModelConexaoZeos.DataSet(DataSource: TDataSource): iModelConexaoGeral;
begin
end;

function TModelConexaoZeos.DataSet: TDataSet;
begin
  Result := FQuery;
end;

function TModelConexaoZeos.DataSource(aValue: TDataSource): iModelConexaoGeral;
begin
  Result := Self;
  aValue.DataSet := FQuery;
end;

destructor TModelConexaoZeos.Destroy;
begin
  FQuery.Free;
  ZConnection1.Free;
  inherited;
end;

function TModelConexaoZeos.ExecSql: iModelConexaoGeral;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TModelConexaoZeos.New: iModelConexaoGeral;
begin
  Result := Self.Create;
end;

function TModelConexaoZeos.Open: iModelConexaoGeral;
begin
  Result := Self;
  FQuery.Open;
end;

function TModelConexaoZeos.Params(Param: String;
  Value: Variant): iModelConexaoGeral;
begin
  Result := Self;
  FQuery.ParamByName(Param).Value := Value;
end;

function TModelConexaoZeos.Sql(Value: String): iModelConexaoGeral;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
