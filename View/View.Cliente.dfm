object FrmCadCliente: TFrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 478
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 135
    Top = 289
    Width = 33
    Height = 30
    OnClick = SpeedButton1Click
  end
  object LbledtCodigo: TLabeledEdit
    Left = 8
    Top = 73
    Width = 121
    Height = 21
    EditLabel.Width = 126
    EditLabel.Height = 19
    EditLabel.Caption = 'C'#243'digo do Cliente'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 0
    OnEnter = LbledtCodigoEnter
    OnExit = LbledtCodigoExit
  end
  object LbledtNome: TLabeledEdit
    Left = 8
    Top = 129
    Width = 553
    Height = 21
    EditLabel.Width = 118
    EditLabel.Height = 19
    EditLabel.Caption = 'Nome do Cliente'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 3
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object LbledtCpf: TLabeledEdit
    Left = 197
    Top = 73
    Width = 156
    Height = 21
    EditLabel.Width = 112
    EditLabel.Height = 19
    EditLabel.Caption = 'N'#250'mero do CPF'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 1
    OnEnter = LbledtCpfEnter
    OnExit = LbledtCpfExit
  end
  object BtnIncluir: TButton
    Left = 33
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 11
    OnClick = BtnIncluirClick
  end
  object BtnAlterar: TButton
    Left = 114
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 12
  end
  object BtnConsultar: TButton
    Left = 208
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 13
    OnClick = BtnConsultarClick
  end
  object BtnExcluir: TButton
    Left = 299
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 14
    OnClick = BtnExcluirClick
  end
  object BtnEncerrar: TButton
    Left = 388
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Encerrar'
    TabOrder = 15
    OnClick = BtnEncerrarClick
  end
  object stabarprincipal: TStatusBar
    Left = 0
    Top = 459
    Width = 588
    Height = 19
    Color = clRed
    Panels = <
      item
        Width = 50
      end>
    SizeGrip = False
  end
  object lbledtrg: TLabeledEdit
    Left = 402
    Top = 73
    Width = 159
    Height = 21
    EditLabel.Width = 106
    EditLabel.Height = 19
    EditLabel.Caption = 'N'#250'mero do RG'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 2
    OnEnter = LbledtCpfEnter
    OnExit = LbledtCpfExit
  end
  object lbledtnomemae: TLabeledEdit
    Left = 8
    Top = 185
    Width = 553
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 19
    EditLabel.Caption = 'Nome do M'#227'e'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 4
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object lbledtnomepai: TLabeledEdit
    Left = 8
    Top = 241
    Width = 553
    Height = 21
    EditLabel.Width = 91
    EditLabel.Height = 19
    EditLabel.Caption = 'Nome do Pai'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 5
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object lbledtnumerocep: TLabeledEdit
    Left = 8
    Top = 298
    Width = 121
    Height = 21
    EditLabel.Width = 113
    EditLabel.Height = 19
    EditLabel.Caption = 'N'#250'mero do CEP'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 6
    OnEnter = LbledtCpfEnter
    OnExit = LbledtCpfExit
  end
  object lbledtendereco: TLabeledEdit
    Left = 8
    Top = 353
    Width = 419
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 19
    EditLabel.Caption = 'Endere'#231'o'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 7
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object lbledtcidade: TLabeledEdit
    Left = 8
    Top = 409
    Width = 337
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 19
    EditLabel.Caption = 'Cidade'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 9
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object lbledtestado: TLabeledEdit
    Left = 360
    Top = 409
    Width = 201
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 19
    EditLabel.Caption = 'Estado'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 10
    OnEnter = LbledtNomeEnter
    OnExit = LbledtNomeExit
  end
  object lbledtnumeroend: TLabeledEdit
    Left = 440
    Top = 353
    Width = 121
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 19
    EditLabel.Caption = 'N'#250'mero'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    TabOrder = 8
    OnEnter = LbledtCpfEnter
    OnExit = LbledtCpfExit
  end
  object ImageList1: TImageList
    Left = 384
    Top = 280
  end
end
