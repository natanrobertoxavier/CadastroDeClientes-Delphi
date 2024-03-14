object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro Clientes'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 240
    Top = 72
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Cadastros1: TMenuItem
        Caption = 'Cadastros'
        object Clientes1: TMenuItem
          Caption = 'Clientes'
          OnClick = Clientes1Click
        end
        object Cidade1: TMenuItem
          Caption = 'Cidade'
          OnClick = Cidade1Click
        end
      end
    end
  end
end
