unit Model.Servico.Interfaces;

interface

uses
  DB, DBClient;

type
  iServico<T> = interface
    function ConsultarCep : iServico<T>;
    function This : T;
  end;

implementation

end.
