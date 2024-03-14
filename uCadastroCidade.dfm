inherited frmCadastroCidade: TfrmCadastroCidade
  Caption = 'Cidade'
  ClientHeight = 313
  ClientWidth = 541
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 553
  ExplicitHeight = 351
  TextHeight = 15
  inherited pnlConteudo: TPanel
    Width = 541
    Height = 313
    ExplicitWidth = 497
    ExplicitHeight = 327
    inherited pagConteudo: TPageControl
      Width = 539
      Height = 311
      ActivePage = tabCadastro
      OnChange = pagConteudoChange
      ExplicitWidth = 495
      ExplicitHeight = 325
      inherited tabCadastro: TTabSheet
        ExplicitWidth = 531
        ExplicitHeight = 275
        object Label3: TLabel [0]
          Left = 11
          Top = 4
          Width = 102
          Height = 21
          Caption = 'C'#243'digo Cidade'
        end
        object Label7: TLabel [1]
          Left = 11
          Top = 68
          Width = 43
          Height = 21
          Caption = 'Nome'
        end
        object Label8: TLabel [2]
          Left = 11
          Top = 135
          Width = 71
          Height = 21
          Caption = 'CEP Inicial'
        end
        object Label9: TLabel [3]
          Left = 471
          Top = 68
          Width = 19
          Height = 21
          Caption = 'UF'
        end
        object Label11: TLabel [4]
          Left = 97
          Top = 135
          Width = 64
          Height = 21
          Caption = 'CEP Final'
        end
        inherited pnlBotoesCadastrar: TPanel
          Top = 199
          Width = 531
          TabOrder = 4
          ExplicitTop = 213
          ExplicitWidth = 487
          inherited btnSalvarCadastrar: TButton
            Left = 293
            OnClick = btnSalvarCadastrarClick
            ExplicitLeft = 293
          end
          inherited btnCancelarCadastrar: TButton
            Left = 412
            ExplicitLeft = 412
          end
        end
        object txtCodigo: TEdit
          Left = 11
          Top = 31
          Width = 118
          Height = 29
          Enabled = False
          ImeName = 'txtCodigo'
          MaxLength = 30
          TabOrder = 5
        end
        object txtNome: TEdit
          Left = 11
          Top = 95
          Width = 454
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 0
        end
        object txtCepInicial: TEdit
          Left = 11
          Top = 162
          Width = 80
          Height = 29
          Alignment = taRightJustify
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 8
          CanUndoSelText = True
          TabOrder = 2
        end
        object txtEstado: TEdit
          Left = 471
          Top = 95
          Width = 46
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 2
          TabOrder = 1
        end
        object txtCepFinal: TEdit
          Left = 97
          Top = 162
          Width = 80
          Height = 29
          Alignment = taRightJustify
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 8
          TabOrder = 3
        end
      end
      inherited tabEditar: TTabSheet
        ExplicitWidth = 531
        ExplicitHeight = 275
        object Label1: TLabel [0]
          Left = 11
          Top = 4
          Width = 102
          Height = 21
          Caption = 'C'#243'digo Cidade'
        end
        object Label2: TLabel [1]
          Left = 11
          Top = 68
          Width = 43
          Height = 21
          Caption = 'Nome'
        end
        object Label4: TLabel [2]
          Left = 11
          Top = 135
          Width = 71
          Height = 21
          Caption = 'CEP Inicial'
        end
        object Label5: TLabel [3]
          Left = 97
          Top = 135
          Width = 64
          Height = 21
          Caption = 'CEP Final'
        end
        object Label6: TLabel [4]
          Left = 471
          Top = 68
          Width = 19
          Height = 21
          Caption = 'UF'
        end
        inherited pnlBotoesEditar: TPanel
          Top = 199
          Width = 531
          TabOrder = 4
          ExplicitTop = 606
          ExplicitWidth = 934
          inherited btnSalvarEditar: TButton
            Left = 293
            ExplicitLeft = 293
          end
          inherited btnCancelarEditar: TButton
            Left = 412
            OnClick = btnCancelarEditarClick
            ExplicitLeft = 412
          end
        end
        object txtCodigoEditar: TEdit
          Left = 11
          Top = 31
          Width = 118
          Height = 29
          Enabled = False
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 30
          TabOrder = 5
        end
        object txtNomeEditar: TEdit
          Left = 11
          Top = 95
          Width = 454
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 0
        end
        object txtCepInicialEditar: TEdit
          Left = 11
          Top = 162
          Width = 80
          Height = 29
          Alignment = taRightJustify
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 8
          CanUndoSelText = True
          TabOrder = 2
        end
        object txtCepFinalEditar: TEdit
          Left = 97
          Top = 162
          Width = 80
          Height = 29
          Alignment = taRightJustify
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 8
          TabOrder = 3
        end
        object txtEstadoEditar: TEdit
          Left = 471
          Top = 95
          Width = 46
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 2
          TabOrder = 1
        end
      end
      inherited tabLista: TTabSheet
        ExplicitWidth = 531
        ExplicitHeight = 275
        inherited dbgLista: TDBGrid
          Width = 531
          Height = 199
          DataSource = dsCidade
          OnCellClick = dbgListaCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo_Cidade'
              Title.Caption = 'Cod'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Estado'
              Title.Caption = 'UF'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cep_Inicial'
              Title.Caption = 'CEP Inicial'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cep_Final'
              Title.Caption = 'CEP Final'
              Width = 80
              Visible = True
            end>
        end
        inherited pnlBotoesExcluir: TPanel
          Top = 199
          Width = 531
          ExplicitTop = 606
          ExplicitWidth = 934
          inherited btnEditar: TButton
            Left = 293
            OnClick = btnEditarClick
            ExplicitLeft = 293
          end
          inherited btnExcluir: TButton
            Left = 412
            OnClick = btnExcluirClick
            ExplicitLeft = 412
          end
        end
      end
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 327
    Top = 168
  end
  object qryCidade: TADOQuery
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
    Left = 407
    Top = 168
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
  object procInserirCidade: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'InserirCidade;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@NOME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@ESTADO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
      end
      item
        Name = '@CEPINICIAL'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@CEPFINAL'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@STATUS'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Prepared = True
    Left = 205
    Top = 241
  end
  object procAlterarCidade: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'AlterarCidade;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@CODIGO_CIDADE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@NOME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@ESTADO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
      end
      item
        Name = '@CEPINICIAL'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@CEPFINAL'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@STATUS'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Left = 437
    Top = 41
  end
  object procExcluirCidade: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'ExcluirCidade;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@CODIGO_CIDADE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@STATUS'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Left = 293
    Top = 81
  end
end
