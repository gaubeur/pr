unit Model.Entidade.Enderecos;

interface

uses SysUtils, Model.DAO.Interfaces;

type
  TEnderecos = class
  private
    FParent   : iDAOEntity<TEnderecos>;
    FCodigo   : Integer;
    FCliCodigo: String;
    FCep      : String;
    FEndereco : String;
    FNumero   : String;
    FCidade   : String;
    FEstado   : String;
  public
    constructor Create(Parent : iDAOEntity<TEnderecos>);
    destructor Destroy; override;
    function Codigo(Value : Integer) : TEnderecos; overload;
    function Codigo: Integer; overload;
    function CliCodigo(Value : String) : TEnderecos; overload;
    function CliCodigo: String; overload;
    function Cep(Value : String) : TEnderecos; overload;
    function Cep: String; overload;
    function Endereco(Value : String) : TEnderecos; overload;
    function Endereco: String; overload;
    function Numero(Value : String) : TEnderecos; overload;
    function Numero: String; overload;
    function Cidade(Value : String) : TEnderecos; overload;
    function Cidade: String; overload;
    function Estado(Value : String) : TEnderecos; overload;
    function Estado: String; overload;
    function &End : iDAOEntity<TEnderecos>;
  end;

implementation

{ TEnderecos }

function TEnderecos.Cep(Value: String): TEnderecos;
begin
  Result := Self;
  FCep := Value;
end;

function TEnderecos.Cep: String;
begin
  Result := FCep;
end;

function TEnderecos.Cidade(Value: String): TEnderecos;
begin
  Result := Self;
  FCidade := Value;
end;

function TEnderecos.Cidade: String;
begin
  Result := FCidade;
end;

function TEnderecos.CliCodigo: String;
begin
  Result := FCliCodigo;
end;

function TEnderecos.CliCodigo(Value: String): TEnderecos;
begin
  Result := Self;
  FCliCodigo := Value;
end;

function TEnderecos.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TEnderecos.Codigo(Value: Integer): TEnderecos;
begin
  Result := Self;
  FCodigo := Value;
end;

constructor TEnderecos.Create(Parent: iDAOEntity<TEnderecos>);
begin
  FParent := Parent;
end;

destructor TEnderecos.Destroy;
begin
  inherited;
end;

function TEnderecos.&End: iDAOEntity<TEnderecos>;
begin
  Result := FParent;
end;

function TEnderecos.Endereco(Value: String): TEnderecos;
begin
  Result := Self;
  FEndereco := Value;
end;

function TEnderecos.Endereco: String;
begin
  Result := FEndereco;
end;

function TEnderecos.Estado(Value: String): TEnderecos;
begin
  Result := Self;
  FEstado := Value;
end;

function TEnderecos.Estado: String;
begin
  Result := FEstado;
end;

function TEnderecos.Numero: String;
begin
  Result := FNumero;
end;

function TEnderecos.Numero(Value: String): TEnderecos;
begin
  Result := Self;
  FNumero := Value;
end;

end.
