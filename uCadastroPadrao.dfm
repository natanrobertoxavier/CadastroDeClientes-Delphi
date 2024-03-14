object frmCadastroPadrao: TfrmCadastroPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 569
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object pnlConteudo: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 569
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 900
    ExplicitHeight = 568
    object pagConteudo: TPageControl
      Left = 1
      Top = 1
      Width = 902
      Height = 567
      ActivePage = tabLista
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tabCadastro: TTabSheet
        Caption = 'Cadastro'
        object pnlBotoesCadastrar: TPanel
          Left = 0
          Top = 455
          Width = 894
          Height = 76
          Align = alBottom
          TabOrder = 0
          object btnSalvarCadastrar: TButton
            Left = 665
            Top = 16
            Width = 105
            Height = 41
            Caption = 'Salvar'
            TabOrder = 0
          end
          object btnCancelarCadastrar: TButton
            Left = 784
            Top = 16
            Width = 105
            Height = 41
            Caption = 'Sair'
            TabOrder = 1
            OnClick = btnCancelarCadastrarClick
          end
        end
      end
      object tabEditar: TTabSheet
        Caption = 'Editar'
        ImageIndex = 1
        ImageName = 'tabEditar'
        object pnlBotoesEditar: TPanel
          Left = 0
          Top = 455
          Width = 894
          Height = 76
          Align = alBottom
          TabOrder = 0
          ExplicitTop = 454
          ExplicitWidth = 890
          object btnSalvarEditar: TButton
            Left = 665
            Top = 16
            Width = 105
            Height = 41
            Caption = 'Salvar'
            TabOrder = 0
          end
          object btnCancelarEditar: TButton
            Left = 784
            Top = 16
            Width = 105
            Height = 41
            Caption = 'Cancelar'
            TabOrder = 1
          end
        end
      end
      object tabLista: TTabSheet
        Caption = 'Lista'
        ImageIndex = 2
        object dbgLista: TDBGrid
          Left = 0
          Top = 0
          Width = 894
          Height = 455
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object pnlBotoesExcluir: TPanel
          Left = 0
          Top = 455
          Width = 894
          Height = 76
          Align = alBottom
          TabOrder = 1
          ExplicitTop = 454
          ExplicitWidth = 890
          object btnEditar: TButton
            Left = 665
            Top = 16
            Width = 105
            Height = 41
            Cancel = True
            Caption = 'Editar'
            TabOrder = 0
          end
          object btnExcluir: TButton
            Left = 784
            Top = 16
            Width = 105
            Height = 41
            Caption = 'Excluir'
            TabOrder = 1
          end
        end
      end
    end
  end
end
