unit Model.Conexao.Interfaces;

interface

uses
  Classes, DB;

type
  iModelConexaoGeral = interface
    ['{CFB8B8B0-959F-47BC-90A3-9D645AB2FB7F}']
    function Sql (Value : String) : iModelConexaoGeral;
    function Open : iModelConexaoGeral;
    function DataSource ( aValue : TDataSource ) : iModelConexaoGeral;
    function ExecSql : iModelConexaoGeral;
    function Params (Param : String; Value : Variant) : iModelConexaoGeral; overload;
    function DataSet(DataSource : TDataSource) : iModelConexaoGeral; overload;
    function DataSet : TDataSet; overload;
  end;

  iModelConexao = interface
    ['{FA5806A3-D5BA-49DD-9BCD-E3350DAA9F02}']
    function SqlServer : iModelConexaoGeral;
    function Zeos : iModelConexaoGeral;
  end;

implementation

end.
