unit Model.Conexao;

interface

uses
     Model.Conexao.Interfaces,
     Model.Conexao.SqlServer,
     Model.Conexao.Zeos;

type

  TModelConexao = class(TInterfacedObject, iModelConexao)
    private
      FSqlServer : iModelConexaoGeral;
      FZeos : iModelConexaoGeral;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexao;
      function SqlServer : iModelConexaoGeral;
      function Zeos : iModelConexaoGeral;
  end;

implementation

{ TModelConexao }

constructor TModelConexao.Create;
begin
end;

destructor TModelConexao.Destroy;
begin
  inherited;
end;

class function TModelConexao.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexao.SqlServer: iModelConexaoGeral;
begin
  if not assigned(FSqlServer) then
    FSqlServer :=  TModelConexaoSqlServer.New;
  Result := FSqlServer;
end;

function TModelConexao.Zeos: iModelConexaoGeral;
begin
  if not assigned(FZeos) then
    FZeos :=  TModelConexaoZeos.New;
  Result := FSqlServer;
end;

end.
