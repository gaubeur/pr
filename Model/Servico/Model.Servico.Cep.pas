unit Model.Servico.Cep;

interface

uses
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope, System.SysUtils,
  System.Json, System.Classes;

type
  TCep = class
    private
      FStringList : TStringList;
      FCep : String;
      FEndereco : String;
      FCidade : String;
      FEstado : String;
      FRestClient : TRESTClient;
      FRestRequest : TRESTRequest;
      FRestResponse : TRESTResponse;

      procedure SetCep(const Value: String);
      procedure SetCidade(const Value: String);
      procedure SetEndereco(const Value: String);
      procedure SetEstado(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;

      property Cep: String read FCep write SetCep;
      property Endereco : String read FEndereco write SetEndereco;
      property Cidade : String read FCidade write SetCidade;
      property Estado : String read FEstado write SetEstado;

      function ConsultarCep( aValue : String ): TStringList;

  end;

implementation

{ TCep }

function TCep.ConsultarCep(aValue: String): TStringList;
var
  sCep, sUrl, sErro : String;
  JSONObject : TJSONObject;
  JSONValue  : TJSONValue;
begin

  if Trim(aValue) = '' then
    raise Exception.Create('Informe o Número do Cep');

  sCep := StringReplace(aValue,'-','',[rfReplaceAll]);

  sUrl := 'http://viacep.com.br/ws/' + sCep + '/json';

  FRestClient.BaseURL := sUrl;

  try
    FRestRequest.Execute;
  except
    raise Exception.Create('Problema na Consulta ao Cep via WebService');
  end;

  JSONObject := FRestResponse.JSONValue as TJSONObject;

  Try
    FEndereco  := JSONObject.Get('logradouro').JsonValue.Value;
    FCidade    := JSONObject.Get('localidade').JsonValue.Value;
    FEstado    := JSONObject.Get('uf').JsonValue.Value;
  except
    FEndereco  := ''
  End;

  if Trim(FEndereco) = '' then
    raise Exception.Create('Cep Não Localizado');

  JSONObject.Free;

  FStringList := TStringList.Create;

  FStringList.Add(FEndereco);
  FStringList.Add(FCidade);
  FStringList.Add(FEstado);

  Result := FStringList;

end;

constructor TCep.Create;
begin
  FRestClient           := TRESTClient.Create(nil);
  FRestRequest          := TRESTRequest.Create(nil);
  FRestResponse         := TRESTResponse.Create(nil);
  FRestRequest.Client   := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

destructor TCep.Destroy;
begin
  inherited;
  if assigned(FRestRequest) then FRestRequest.Free;
  if assigned(FRestClient) then FRestClient.Free;
  if assigned(FStringList) then FStringList.Free;
end;

procedure TCep.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCep.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCep.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TCep.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

end.
