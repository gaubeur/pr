unit Model.DAO.Enderecos;

interface
uses
  SysUtils,
  DB,
  DBClient,
  Model.DAO.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Zeos,
  Model.Entidade.Enderecos;
  //Model.Conexao.SqlServer;
type

  TDAOEnderecos = class(TInterfacedObject, iDAOEntity<TEnderecos>)
    private
      FEnderecos : TEnderecos;
      FConexao  : iModelConexaoGeral;
      FDataSet  : TDataSet;
      FClientDataSet : TClientDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TEnderecos>;
      function Inserir   : iDAOEntity<TEnderecos>;
      function Alterar( aValue : string ) : iDAOEntity<TEnderecos>;
      function Consultar( aValue : string ) : boolean;
      function Excluir( aValue : string ) : boolean;
      function This : TEnderecos;
  end;

implementation

function TDAOEnderecos.Alterar(aValue: string): iDAOEntity<TEnderecos>;
begin
  Result := Self;
end;

function TDAOEnderecos.Consultar(aValue: string): boolean;
begin
  Result := False;
end;

constructor TDAOEnderecos.Create;
begin
  //FConexao  := TModelConexaoSqlServer.New;
  FConexao := TModelConexaoZeos.New;
  FEnderecos := TEnderecos.Create(Self);
end;

destructor TDAOEnderecos.Destroy;
begin
  inherited;
end;

function TDAOEnderecos.Excluir(aValue: string): boolean;
begin
  Result := False;
end;

function TDAOEnderecos.Inserir: iDAOEntity<TEnderecos>;
begin

  Result := Self;

  try
    FConexao
      .SQL('insert into Enderecos (endereco_clicodigo, endereco_cep, endereco_endereco, endereco_numero, endereco_cidade, endereco_estado) ' +
            ' values ( :clicodigo, :cep, :endereco, :numero, :cidade, :estado ) ')
      .Params('clicodigo' , FEnderecos.CliCodigo)
      .Params('cep' , FEnderecos.Cep)
      .Params('endereco'  , FEnderecos.Endereco)
      .Params('numero'   , FEnderecos.Numero)
      .Params('cidade'  , FEnderecos.Cidade)
      .Params('estado'  , FEnderecos.Estado)
    .ExecSQL;
  except
    raise Exception.Create('Problema na Gravação do Endereço do Cliente');
  end;

end;

class function TDAOEnderecos.New : iDAOEntity<TEnderecos>;
begin
  Result := Self.Create;
end;

function TDAOEnderecos.This: TEnderecos;
begin
  Result := FEnderecos;
end;

end.
