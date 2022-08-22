unit Model.Entidade.Clientes;

interface

uses SysUtils, Model.DAO.Interfaces;

type
  TClientes = class
  private
    FParent   : iDAOEntity<TClientes>;
    FCodigo   : String;
    FNome     : String;
    FCpf      : String;
    FRg       : String;
    FMae      : String;
    FPai      : String;
    FCep      : String;
    FEndereco : String;
    FNumero   : String;
    FCidade   : String;
    FEstado   : String;
  public
    constructor Create(Parent : iDAOEntity<TClientes>);
    destructor Destroy; override;
    function Codigo(Value : String) : TClientes; overload;
    function Codigo: String; overload;
    function Nome(Value : String) : TClientes; overload;
    function Nome: String; overload;
    function Cpf(Value : String) : TClientes; overload;
    function Cpf: String; overload;
    function Rg(Value : String) : TClientes; overload;
    function Rg: String; overload;
    function Mae(Value : String) : TClientes; overload;
    function Mae: String; overload;
    function Pai(Value : String) : TClientes; overload;
    function Pai: String; overload;
    function Cep(Value : String) : TClientes; overload;
    function Cep: String; overload;
    function Endereco(Value : String) : TClientes; overload;
    function Endereco: String; overload;
    function Numero(Value : String) : TClientes; overload;
    function Numero: String; overload;
    function Cidade(Value : String) : TClientes; overload;
    function Cidade: String; overload;
    function Estado(Value : String) : TClientes; overload;
    function Estado: String; overload;
    function &End : iDAOEntity<TClientes>;
  end;

implementation

{ TClientes }

constructor TClientes.Create(Parent: iDAOEntity<TClientes>);
begin
  FParent := Parent;
end;

destructor TClientes.Destroy;
begin
  inherited;
end;

function TClientes.&End: iDAOEntity<TClientes>;
begin
  Result := FParent;
end;

function TClientes.Endereco(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Endereço Inválido');

  Result := Self;
  FEndereco := Value;
end;

function TClientes.Endereco: String;
begin
  Result := FEndereco;
end;

function TClientes.Estado(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Estado Inválido');

  Result := Self;
  FEstado  := Value;
end;

function TClientes.Estado: String;
begin
  Result := FEstado;
end;

function TClientes.Nome(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Nome Inválido');

  Result := Self;
  FNome := Value;
end;

function TClientes.Nome: String;
begin
  Result := FNome;
end;

function TClientes.Numero(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Número do Endereço Inválido');

  Result := Self;
  FNumero := Value;
end;

function TClientes.Numero: String;
begin
  Result := FNumero;
end;

function TClientes.Codigo(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Código do Cliente Inválido');

  Result := Self;
  FCodigo := Value;
end;

function TClientes.Cep(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Número do CEP Inválido');

  Result := Self;
  FCep := Value;
end;

function TClientes.Cep: String;
begin
  Result := FCep;
end;

function TClientes.Cidade: String;
begin
  Result := FCidade;
end;

function TClientes.Cidade(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Cidade Inválido');

  Result := Self;
  FCidade := Value;
end;

function TClientes.Codigo: String;
begin
  Result := FCodigo;
end;

function TClientes.Cpf(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Número do CPF Inválido');

  Result := Self;
  FCpf := Value;
end;

function TClientes.Cpf: String;
begin
  Cpf := FCpf;
end;

function TClientes.Rg(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Número do RG Inválido');

  Result := Self;
  FRg := Value;
end;

function TClientes.Rg: String;
begin
  Rg := FRg;
end;

function TClientes.Mae(Value: String): TClientes;
begin
  if Trim(Value) = '' then
    raise Exception.Create('Nome da Mãe Inválido');

  Result := Self;
  FMae := Value;
end;

function TClientes.Mae: String;
begin
  Mae := FMae;
end;

function TClientes.Pai(Value: String): TClientes;
begin
  Result := Self;
  FPai := Value;
end;

function TClientes.Pai: String;
begin
  Pai := FPai;
end;


end.
