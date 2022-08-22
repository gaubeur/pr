unit View.Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WideStrings, DB, SqlExpr, FMTBcd, ComCtrls,
  ToolWin, ExtCtrls, DBCtrls, Grids, DBGrids, Vcl.Buttons,
  Controller.Controller,
  Controller.Interfaces,
  Model.Servico.Cep, System.ImageList, Vcl.ImgList;
  //Controller.Servicos;

type
  TFrmCadCliente = class(TForm)
    LbledtCodigo: TLabeledEdit;
    LbledtNome: TLabeledEdit;
    LbledtCpf: TLabeledEdit;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnConsultar: TButton;
    BtnExcluir: TButton;
    BtnEncerrar: TButton;
    stabarprincipal: TStatusBar;
    lbledtrg: TLabeledEdit;
    lbledtnomemae: TLabeledEdit;
    lbledtnomepai: TLabeledEdit;
    lbledtnumerocep: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    lbledtendereco: TLabeledEdit;
    lbledtcidade: TLabeledEdit;
    lbledtestado: TLabeledEdit;
    lbledtnumeroend: TLabeledEdit;
    ImageList1: TImageList;
    procedure LbledtCodigoEnter(Sender: TObject);
    procedure LbledtCodigoExit(Sender: TObject);
    procedure LbledtNomeEnter(Sender: TObject);
    procedure LbledtNomeExit(Sender: TObject);
    procedure LbledtCpfEnter(Sender: TObject);
    procedure LbledtCpfExit(Sender: TObject);
    procedure BtnEncerrarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FServicoCep : TCep;

    procedure ganha_foco(Sender : TObject);
    procedure perde_foco(Sender : TObject);
    procedure view_cliente;
    procedure ativar_classes;
    procedure limpaFormulario;

  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;
  Indexador    : Integer;
  IndArray     : Integer;

implementation
{$R *.dfm}

procedure limpa_campo;
begin
  Indexador := 0;
  while Indexador < FrmCadCliente.ComponentCount do begin
    if (FrmCadCliente.Components[Indexador] is TLabeledEdit) then begin
      (FrmCadCliente.Components[Indexador] as TLabeledEdit).Clear;
    end;
    Indexador := Indexador + 1;
  end;
end;

procedure TFrmCadCliente.ativar_classes;
begin
end;

procedure TFrmCadCliente.BtnConsultarClick(Sender: TObject);
begin

  try
  // rotina consulta
    FController.Entidades.Clientes.Consultar(LbledtCodigo.Text);
  except
      exit;
  end;

end;

procedure TFrmCadCliente.BtnEncerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadCliente.BtnExcluirClick(Sender: TObject);
begin

  if FController.Entidades.Clientes.Excluir(LbledtCodigo.Text) then
    application.MessageBox(PChar('Cliente ' + LbledtCodigo.Text + ' Excluido com Sucesso'),'Cadastro Cliente',mb_ok+mb_iconexclamation);

  limpaFormulario;

end;

procedure TFrmCadCliente.BtnIncluirClick(Sender: TObject);
begin

  try
    FController
      .Entidades
        .Clientes.This
          .Codigo(LbledtCodigo.Text)
          .Nome(LbledtNome.Text)
          .Cpf(LbledtCpf.Text)
          .Rg(lbledtrg.Text)
          .Mae(lbledtnomemae.Text)
          .Pai(lbledtnomepai.Text)
          .Cep(lbledtnumerocep.Text)
          .Endereco(lbledtendereco.Text)
          .Numero(lbledtnumeroend.Text)
          .Cidade(lbledtcidade.Text)
          .Estado(lbledtestado.Text)
        .&End
      .Inserir;

  except
      exit;
  end;

  application.MessageBox(PChar('Cliente ' + LbledtCodigo.Text + ' Cadastrado com Sucesso'),'Cadastro Cliente',mb_ok+mb_iconexclamation);

  limpaFormulario;

end;

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TFrmCadCliente.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then begin
    perform(cm_dialogkey,vk_tab,0);
  end;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  ativar_classes;
  view_cliente;
  LbledtCodigo.SetFocus;
end;

procedure TFrmCadCliente.ganha_foco(Sender: TObject);
begin
  if (Sender is TLabeledEdit) then begin
    (Sender as TLabeledEdit).Color := clYellow;
  end;
end;

procedure TFrmCadCliente.LbledtCodigoEnter(Sender: TObject);
begin
  ganha_foco(Sender);
end;

procedure TFrmCadCliente.LbledtCodigoExit(Sender: TObject);
begin
  perde_foco(Sender);
end;

procedure TFrmCadCliente.LbledtNomeEnter(Sender: TObject);
begin
  ganha_foco(Sender);
end;

procedure TFrmCadCliente.LbledtNomeExit(Sender: TObject);
begin
  perde_foco(Sender);
end;

procedure TFrmCadCliente.limpaFormulario;
var
  iIndice : Integer;
begin

  for iIndice := 0 to FrmCadCliente.ComponentCount-1 do
    if FrmCadCliente.Components[iIndice] is TLabeledEdit then
      TLabeledEdit(FrmCadCliente.Components[iIndice]).Clear;

end;

procedure TFrmCadCliente.LbledtCpfEnter(Sender: TObject);
begin
  ganha_foco(Sender);
end;

procedure TFrmCadCliente.LbledtCpfExit(Sender: TObject);
begin
  perde_foco(Sender);
end;

procedure TFrmCadCliente.perde_foco(Sender: TObject);
begin
  if (Sender is TLabeledEdit) then begin
    (Sender as TLabeledEdit).Color := clWhite;
  end;
end;

procedure TFrmCadCliente.SpeedButton1Click(Sender: TObject);
var
  stlLista : TStringList;
begin

  FServicoCep := TCep.Create;

  stlLista := TStringList.Create;

  stlLista := FServicoCep.ConsultarCep(lbledtnumerocep.Text);

  lbledtendereco.Text := stlLista.Strings[0];
  lbledtcidade.Text   := stlLista.Strings[1];
  lbledtestado.Text   := stlLista.Strings[2];

  FServicoCep.Free;

end;

procedure TFrmCadCliente.view_cliente;
begin
{
// limpa a stringgrid da listagem do cliente
  with StrGrdCliente do
    for Indexador := 0 to RowCount -1 do
      Rows[Indexador].Clear;
  StrGrdCliente.Cells[0,0]  :=  'Código';
  StrGrdCliente.Cells[1,0]  :=  'Nome';
  StrGrdCliente.Cells[2,0]  :=  'Telefone';
//  Conexao  := TConexaoBanco.Create;
//  Controle := TControle.Create;
//  Cliente  := TClienteControle.Create(controle);
  Indexador := 0;
  if cliente.ConsultaCliente = True then begin
    IndArray  := 0;
    while Indarray < Length(Cliente.aCodigo) do begin
      Indexador := Indexador + 1;
      StrGrdCliente.Cells[0,Indexador]  := cliente.aCodigo[IndArray];
      StrGrdCliente.Cells[1,Indexador]  := cliente.aNome[IndArray];
      StrGrdCliente.Cells[2,Indexador]  := cliente.aTelefone[IndArray];
      IndArray := IndArray + 1;
    end;
  end;
}
end;

end.
