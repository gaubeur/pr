unit Model.DAO.Interfaces;

interface

uses
  DB, DBClient;

type
  iDAOEntity<T> = interface
    function Inserir : iDAOEntity<T>;
    function Alterar( aValue : String ) : iDAOEntity<T>;
    function Consultar( aValue : String ) : boolean;
    function Excluir( aValue : String ) : boolean;
    function This : T;
  end;

implementation

end.
