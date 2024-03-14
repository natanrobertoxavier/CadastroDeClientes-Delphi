object frmPesquisaPadrao: TfrmPesquisaPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pesquisa PADRAO'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 376
    Width = 628
    Height = 66
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 375
    ExplicitWidth = 624
    object btnSelecionar: TButton
      Left = 394
      Top = 12
      Width = 105
      Height = 41
      Caption = 'Selecionar'
      DisabledImageName = 'btnSelecionar'
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 505
      Top = 12
      Width = 105
      Height = 41
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnNovo: TButton
      Left = 13
      Top = 12
      Width = 105
      Height = 41
      Caption = 'Novo '
      TabOrder = 2
    end
  end
  object pnlConteudo: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 376
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 624
    ExplicitHeight = 375
    object dbGrid: TDBGrid
      Left = 1
      Top = 57
      Width = 626
      Height = 318
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object pnlPesquisar: TPanel
      Left = 1
      Top = 1
      Width = 626
      Height = 56
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 622
      object Label1: TLabel
        Left = 326
        Top = 17
        Width = 72
        Height = 21
        Caption = 'Filtrar por:'
      end
      object txtFiltrar: TEdit
        Left = 416
        Top = 14
        Width = 193
        Height = 29
        TabOrder = 0
      end
    end
  end
end
