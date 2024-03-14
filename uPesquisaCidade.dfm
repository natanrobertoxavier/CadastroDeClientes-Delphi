inherited frmPesquisaCidade: TfrmPesquisaCidade
  Caption = 'Pesquisar Cidade'
  ClientHeight = 424
  ClientWidth = 526
  OnShow = FormShow
  ExplicitWidth = 542
  ExplicitHeight = 463
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 358
    Width = 526
    ExplicitTop = 358
    ExplicitWidth = 526
    inherited btnSelecionar: TButton
      Left = 294
      OnClick = btnSelecionarClick
      ExplicitLeft = 294
    end
    inherited btnCancelar: TButton
      Left = 405
      ExplicitLeft = 405
    end
    inherited btnNovo: TButton
      OnClick = btnNovoClick
    end
  end
  inherited pnlConteudo: TPanel
    Width = 526
    Height = 358
    ExplicitWidth = 526
    ExplicitHeight = 358
    inherited dbGrid: TDBGrid
      Width = 528
      Height = 301
      DataSource = dsCidade
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo_Cidade'
          Title.Caption = 'Cod'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Caption = 'Cidade'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Estado'
          Title.Caption = 'UF'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cep_Inicial'
          Title.Caption = 'CEP Inicial'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cep_Final'
          Title.Caption = 'CEP Final'
          Width = 83
          Visible = True
        end>
    end
    inherited pnlPesquisar: TPanel
      Width = 528
      ExplicitWidth = 524
      inherited Label1: TLabel
        Left = 225
        ExplicitLeft = 225
      end
      inherited txtFiltrar: TEdit
        Left = 315
        ExplicitLeft = 315
      end
    end
  end
  object qryCidade: TADOQuery
    Active = True
    Connection = dmCadastros.adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [Codigo_Cidade]'
      '      ,[Nome]'
      '      ,[Estado]'
      '      ,[Cep_Inicial]'
      '      ,[Cep_Final]'
      '  FROM [sinqia].[dbo].[CIDADES]'
      'ORDER BY [Nome]')
    Left = 184
    Top = 8
    object qryCidadeCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
    object qryCidadeNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryCidadeEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryCidadeCep_Inicial: TBCDField
      FieldName = 'Cep_Inicial'
      Precision = 18
      Size = 0
    end
    object qryCidadeCep_Final: TBCDField
      FieldName = 'Cep_Final'
      Precision = 18
      Size = 0
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 248
    Top = 8
  end
end
