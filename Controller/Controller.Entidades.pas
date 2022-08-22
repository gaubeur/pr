unit Controller.Entidades;

interface

uses
  Controller.Interfaces,
  Model.DAO.Interfaces,
  Model.DAO.Clientes,
  Model.Entidade.Clientes,
  Model.Entidade.Enderecos,
  Model.DAO.Enderecos;


type
  TControllerEntidades = class(TInterfacedObject, iControllerEntidades)
    private
      FClientes  : iDAOEntity<TClientes>;
      FEnderecos : iDAOEntity<TEnderecos>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerEntidades;
      function Clientes : iDAOEntity<TClientes>;
      function Enderecos : iDAOEntity<TEnderecos>;
  end;

implementation

constructor TControllerEntidades.Create;
begin
end;

destructor TControllerEntidades.Destroy;
begin
  inherited;
end;

function TControllerEntidades.Enderecos: iDAOEntity<TEnderecos>;
begin
  if not Assigned(FEnderecos) then
    FEnderecos := TDAOEnderecos.New;
  Result := FEnderecos;
end;

class function TControllerEntidades.New : iControllerEntidades;
begin
  Result := Self.Create;
end;

function TControllerEntidades.Clientes: iDAOEntity<TClientes>;
begin
  if not Assigned(FClientes) then
    FClientes := TDAOClientes.New;
  Result := FClientes;
end;

end.
