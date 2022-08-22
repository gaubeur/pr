unit Model.DAO.Clientes;

interface
uses
  SysUtils,
  DB,
  DBClient,
  Model.DAO.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Zeos, Model.Entidade.Clientes;
  //Model.Conexao.SqlServer;


type

  TDAOClientes = class(TInterfacedObject, iDAOEntity<TClientes>)
    private
      FClientes : TClientes;
      FConexao  : iModelConexaoGeral;
      FDataSet  : TDataSet;
      FClientDataSet : TClientDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TClientes>;
      function Inserir   : iDAOEntity<TClientes>;
      function Alterar( aValue : String ) : iDAOEntity<TClientes>;
      function Consultar( aValue : String ) : boolean;
      function Excluir( aValue : String ) : boolean;
      function This : TClientes;
  end;

implementation

function TDAOClientes.Alterar(aValue: String): iDAOEntity<TClientes>;
begin
  Result := Self;

  if Trim(aValue) = '' then
    raise Exception.Create('Informe o Código do Cliente para Consultar');

end;

function TDAOClientes.Consultar(aValue: String): boolean;
begin
  Result := False;

  if Trim(aValue) = '' then
  raise Exception.Create('Informe o Código do Cliente para Consultar');

  try
    FDataSet :=
    FConexao
      .SQL(' select * from  Clientes ' +
            ' inner join Enderecos on ( cli_clicodigo = endereco.clicodigo ) ' +
            ' where cli_clicodigo = :clicodigo ' )
      .Params('clicodigo' , aValue)
    .Open.DataSet;

    if FDataSet.RecordCount = 0 then
      raise Exception.Create('Código do Cliente Não Localizado');

    FClientes.Cpf(FDataSet.FieldByName('cli_cpf').asstring);
    FClientes.Rg(FDataSet.FieldByName('cli_rg').asstring);
    FClientes.Nome(FDataSet.FieldByName('cli_nome').asstring);
    FClientes.Pai(FDataSet.FieldByName('cli_pai').asstring);
    FClientes.Mae(FDataSet.FieldByName('cli_mae').asstring);
    FClientes.Cep(FDataSet.FieldByName('endereco_cep').asstring);
    FClientes.Endereco(FDataSet.FieldByName('endereco_endereco').asstring);
    FClientes.Numero(FDataSet.FieldByName('endereco_numero').asstring);
    FClientes.Cidade(FDataSet.FieldByName('endereco_cidade').asstring);
    FClientes.Estado(FDataSet.FieldByName('endereco_estado').asstring);

  except
    raise Exception.Create('Código do Cliente Não Localizado');
  end;


end;

constructor TDAOClientes.Create;
begin
  //FConexao  := TModelConexaoSqlServer.New;
  FConexao := TModelConexaoZeos.New;

  FClientes := TClientes.Create(Self);
end;

destructor TDAOClientes.Destroy;
begin
  inherited;
end;

function TDAOClientes.Excluir(aValue: String): boolean;
begin

  Result := False;

  if Trim(Avalue) = '' then
    raise Exception.Create('Informe o Código do Cliente para Exclusão');

  try
    FConexao
      .SQL(' delete from Clientes where cli_codigo = :clicodigo ' )
      .Params('clicodigo' , aValue)
    .ExecSQL;

    FConexao
      .SQL(' delete from Enderecos where endereco_clicodigo = :clicodigo ' )
      .Params('clicodigo' , aValue)
    .ExecSQL;

  except
    raise Exception.Create('Problema na Exclusão do Cliente');
  end;

  Result := True;

end;

function TDAOClientes.Inserir: iDAOEntity<TClientes>;
begin

  Result := Self;

  try
    FConexao
      .SQL('insert into Clientes (cli_codigo, cli_nome, cli_cpf, cli_rg, cli_mae, cli_pai) ' +
            ' values ( :codigo, :nome, :cpf, :rg, :mae, :pai ) ')
      .Params('codigo' , FClientes.codigo)
      .Params('nome'   , FClientes.Nome)
      .Params('cpf'    , FClientes.Cpf)
      .Params('rg'     , FClientes.Rg)
      .Params('mae'    , FClientes.Mae)
      .Params('pai'    , FClientes.Pai)
    .ExecSQL;

    FConexao
      .SQL('insert into Enderecos (endereco_clicodigo, endereco_cep, endereco_endereco, endereco_numero, endereco_cidade, endereco_estado) ' +
            ' values ( :clicodigo, :cep, :endereco, :numero, :cidade, :estado ) ')
      .Params('clicodigo' , FClientes.Codigo)
      .Params('cep' , FClientes.Cep)
      .Params('endereco'  , FClientes.Endereco)
      .Params('numero'   , FClientes.Numero)
      .Params('cidade'  , FClientes.Cidade)
      .Params('estado'  , FClientes.Estado)
    .ExecSQL;

  except on E : Exception do
    if pos('duplicate',lowercase(e.Message)) > 0 then
      raise Exception.Create('Código do Cliente Já Utilizado')
    else raise Exception.Create(e.Message);
  end;

end;

class function TDAOClientes.New : iDAOEntity<TClientes>;
begin
  Result := Self.Create;
end;

function TDAOClientes.This: TClientes;
begin
  Result := FClientes;
end;

end.
