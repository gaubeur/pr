unit Controller.Interfaces;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidade.Clientes,
  Model.Entidade.Enderecos;


type
  iControllerEntidades = interface;

  iController = interface
    function Entidades : iControllerEntidades;
  end;

  iControllerEntidades = interface
    function Clientes : iDAOEntity<TClientes>;
    function Enderecos : iDAOEntity<TEnderecos>;
  end;

implementation
end.
