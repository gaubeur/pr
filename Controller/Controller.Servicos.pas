unit Controller.Servicos;

interface

uses
  Model.Servico.Cep, System.Classes;

type
  TControllerServicos = class
    private
      FServicosCep : TCep;
    public
      constructor Create;
      destructor Destroy; override;
      function ConsultaCep(aValue : String) : TStringList;
  end;

implementation

function TControllerServicos.ConsultaCep(aValue: String): TStringList;
begin
  if not Assigned(FServicosCep) then
    FServicosCep := TCep.Create;

  FServicosCep.ConsultarCep(aValue);

end;

constructor TControllerServicos.Create;
begin
end;

destructor TControllerServicos.Destroy;
begin
  inherited;
end;


end.
