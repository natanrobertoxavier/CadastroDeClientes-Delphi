inherited frmCadastroClientes: TfrmCadastroClientes
  Caption = 'frmCadastroClientes'
  ClientHeight = 425
  ClientWidth = 566
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 578
  ExplicitHeight = 463
  TextHeight = 15
  inherited pnlConteudo: TPanel
    Width = 566
    Height = 425
    ExplicitWidth = 896
    ExplicitHeight = 567
    inherited pagConteudo: TPageControl
      Width = 564
      Height = 423
      ActivePage = tabCadastro
      OnChange = pagConteudoChange
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 567
      ExplicitHeight = 427
      inherited tabCadastro: TTabSheet
        ExplicitWidth = 556
        ExplicitHeight = 387
        object Label6: TLabel [0]
          Left = 114
          Top = 239
          Width = 48
          Height = 21
          Caption = 'Cidade'
        end
        object Label5: TLabel [1]
          Left = 410
          Top = 240
          Width = 19
          Height = 21
          Caption = 'UF'
        end
        object Label2: TLabel [2]
          Left = 3
          Top = 61
          Width = 43
          Height = 21
          Caption = 'Nome'
        end
        object Label3: TLabel [3]
          Left = 342
          Top = 184
          Width = 42
          Height = 21
          Caption = 'Bairro'
        end
        object Label4: TLabel [4]
          Left = 3
          Top = 8
          Width = 102
          Height = 21
          Caption = 'C'#243'digo Cliente'
        end
        object Label7: TLabel [5]
          Left = 3
          Top = 120
          Width = 27
          Height = 21
          Caption = 'CPF'
        end
        object Label8: TLabel [6]
          Left = 454
          Top = 240
          Width = 27
          Height = 21
          Caption = 'CEP'
        end
        object Label1: TLabel [7]
          Left = 127
          Top = 120
          Width = 57
          Height = 21
          Caption = 'Telefone'
        end
        object Label9: TLabel [8]
          Left = 251
          Top = 119
          Width = 44
          Height = 21
          Caption = 'E-mail'
        end
        object Label10: TLabel [9]
          Left = 3
          Top = 183
          Width = 64
          Height = 21
          Caption = 'Endere'#231'o'
        end
        object Label11: TLabel [10]
          Left = 3
          Top = 240
          Width = 99
          Height = 21
          Caption = 'Complemento'
        end
        inherited pnlBotoesCadastrar: TPanel
          Top = 311
          Width = 556
          TabOrder = 9
          ExplicitTop = 453
          ExplicitWidth = 886
          inherited btnSalvarCadastrar: TButton
            Left = 324
            OnClick = btnSalvarCadastrarClick
            ExplicitLeft = 324
          end
          inherited btnCancelarCadastrar: TButton
            Left = 443
            ExplicitLeft = 443
          end
        end
        object btnPesquisar: TBitBtn
          Left = 375
          Top = 264
          Width = 29
          Height = 29
          Glyph.Data = {
            7E000000424D7E000000000000003E0000002800000010000000100000000100
            01000000000040000000C30E0000C30E0000020000000000000000000000FFFF
            FF00FFFF0000FFFF0000FFFB0000FFF70000F06F0000E79F0000CFDF0000DFEF
            0000DFEF0000DFEF0000DFEF0000CFCF0000E79F0000F03F0000FFFF0000FFFF
            0000}
          TabOrder = 7
          OnClick = btnPesquisarClick
        end
        object txtCidade: TEdit
          Left = 114
          Top = 264
          Width = 255
          Height = 29
          Enabled = False
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 10
        end
        object txtEstado: TEdit
          Left = 410
          Top = 264
          Width = 38
          Height = 29
          Enabled = False
          ImeName = 'Portuguese (Brazilian ABNT)'
          TabOrder = 11
        end
        object txtNome: TEdit
          Left = 3
          Top = 85
          Width = 545
          Height = 29
          MaxLength = 50
          TabOrder = 0
        end
        object txtBairro: TEdit
          Left = 342
          Top = 208
          Width = 206
          Height = 29
          MaxLength = 30
          TabOrder = 5
        end
        object txtCodigo: TEdit
          Left = 3
          Top = 32
          Width = 118
          Height = 29
          Enabled = False
          TabOrder = 12
        end
        object txtTelefone: TEdit
          Left = 127
          Top = 144
          Width = 118
          Height = 29
          MaxLength = 11
          TabOrder = 2
        end
        object txtCEP: TEdit
          Left = 454
          Top = 264
          Width = 94
          Height = 29
          MaxLength = 18
          TabOrder = 8
        end
        object txtCPF: TEdit
          Left = 3
          Top = 144
          Width = 118
          Height = 29
          MaxLength = 11
          TabOrder = 1
        end
        object txtEmail: TEdit
          Left = 251
          Top = 144
          Width = 297
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 3
        end
        object txtEndereco: TEdit
          Left = 3
          Top = 208
          Width = 333
          Height = 29
          ImeName = 'txtEndereco'
          MaxLength = 50
          TabOrder = 4
        end
        object txtComplemento: TEdit
          Left = 3
          Top = 264
          Width = 105
          Height = 29
          MaxLength = 15
          TabOrder = 6
        end
      end
      inherited tabEditar: TTabSheet
        ExplicitWidth = 556
        ExplicitHeight = 387
        object Label12: TLabel [0]
          Left = 3
          Top = 8
          Width = 102
          Height = 21
          Caption = 'C'#243'digo Cliente'
        end
        object Label13: TLabel [1]
          Left = 3
          Top = 61
          Width = 43
          Height = 21
          Caption = 'Nome'
        end
        object Label14: TLabel [2]
          Left = 3
          Top = 120
          Width = 27
          Height = 21
          Caption = 'CPF'
        end
        object Label15: TLabel [3]
          Left = 3
          Top = 183
          Width = 64
          Height = 21
          Caption = 'Endere'#231'o'
        end
        object Label16: TLabel [4]
          Left = 3
          Top = 240
          Width = 99
          Height = 21
          Caption = 'Complemento'
        end
        object Label17: TLabel [5]
          Left = 114
          Top = 240
          Width = 48
          Height = 21
          Caption = 'Cidade'
        end
        object Label18: TLabel [6]
          Left = 127
          Top = 120
          Width = 57
          Height = 21
          Caption = 'Telefone'
        end
        object Label19: TLabel [7]
          Left = 251
          Top = 120
          Width = 44
          Height = 21
          Caption = 'E-mail'
        end
        object Label20: TLabel [8]
          Left = 342
          Top = 183
          Width = 42
          Height = 21
          Caption = 'Bairro'
        end
        object Label21: TLabel [9]
          Left = 454
          Top = 240
          Width = 27
          Height = 21
          Caption = 'CEP'
        end
        object Label22: TLabel [10]
          Left = 410
          Top = 240
          Width = 19
          Height = 21
          Caption = 'UF'
        end
        inherited pnlBotoesEditar: TPanel
          Top = 311
          Width = 556
          TabOrder = 9
          inherited btnSalvarEditar: TButton
            Left = 324
            OnClick = btnSalvarEditarClick
            ExplicitLeft = 324
          end
          inherited btnCancelarEditar: TButton
            Left = 443
            OnClick = btnCancelarEditarClick
            ExplicitLeft = 443
          end
        end
        object txtCodigoEditar: TEdit
          Left = 3
          Top = 32
          Width = 118
          Height = 29
          Enabled = False
          TabOrder = 10
        end
        object txtNomeEditar: TEdit
          Left = 3
          Top = 85
          Width = 545
          Height = 29
          MaxLength = 50
          TabOrder = 0
        end
        object txtCPFEditar: TEdit
          Left = 3
          Top = 144
          Width = 118
          Height = 29
          MaxLength = 11
          TabOrder = 1
        end
        object txtEnderecoEditar: TEdit
          Left = 3
          Top = 208
          Width = 333
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 4
        end
        object txtComplementoEditar: TEdit
          Left = 3
          Top = 264
          Width = 105
          Height = 29
          MaxLength = 15
          TabOrder = 6
        end
        object txtCidadeEditar: TEdit
          Left = 114
          Top = 264
          Width = 255
          Height = 29
          Enabled = False
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 11
        end
        object txtTelefoneEditar: TEdit
          Left = 127
          Top = 144
          Width = 118
          Height = 29
          MaxLength = 11
          TabOrder = 2
        end
        object txtEmailEditar: TEdit
          Left = 251
          Top = 144
          Width = 297
          Height = 29
          ImeName = 'Portuguese (Brazilian ABNT)'
          MaxLength = 50
          TabOrder = 3
        end
        object txtBairroEditar: TEdit
          Left = 342
          Top = 208
          Width = 206
          Height = 29
          MaxLength = 30
          TabOrder = 5
        end
        object btnPesquisarEditar: TBitBtn
          Left = 375
          Top = 264
          Width = 29
          Height = 29
          Glyph.Data = {
            7E000000424D7E000000000000003E0000002800000010000000100000000100
            01000000000040000000C30E0000C30E0000020000000000000000000000FFFF
            FF00FFFF0000FFFF0000FFFB0000FFF70000F06F0000E79F0000CFDF0000DFEF
            0000DFEF0000DFEF0000DFEF0000CFCF0000E79F0000F03F0000FFFF0000FFFF
            0000}
          TabOrder = 7
          OnClick = btnPesquisarEditarClick
        end
        object txtEstadoEditar: TEdit
          Left = 410
          Top = 264
          Width = 38
          Height = 29
          Enabled = False
          TabOrder = 12
        end
        object txtCEPEditar: TEdit
          Left = 454
          Top = 264
          Width = 94
          Height = 29
          MaxLength = 18
          TabOrder = 8
        end
      end
      inherited tabLista: TTabSheet
        ExplicitWidth = 556
        ExplicitHeight = 387
        inherited dbgLista: TDBGrid
          Width = 556
          Height = 311
          DataSource = dsCliente
          OnCellClick = dbgListaCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo_Cliente'
              Title.Caption = 'Cod'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CGC_CPF_Cliente'
              Title.Caption = 'CPF'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Telefone'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'E_mail'
              Title.Caption = 'Email'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Endereco'
              Title.Caption = 'Endere'#231'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Bairro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Complemento'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cep'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Cidade'
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
              FieldName = 'Codigo_Cidade'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cep_Inicial'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cep_Final'
              Visible = False
            end>
        end
        inherited pnlBotoesExcluir: TPanel
          Top = 311
          Width = 556
          inherited btnEditar: TButton
            Left = 324
            OnClick = btnEditarClick
            ExplicitLeft = 324
          end
          inherited btnExcluir: TButton
            Left = 443
            OnClick = btnExcluirClick
            ExplicitLeft = 443
          end
        end
      end
    end
  end
  object procInserirCliente: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'InserirCliente;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@CGC_CPF_CLIENTE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 11
      end
      item
        Name = '@NOME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@TELEFONE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 11
      end
      item
        Name = '@ENDERECO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@BAIRRO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
      end
      item
        Name = '@COMPLEMENTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
      end
      item
        Name = '@EMAIL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@CODIGO_CIDADE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@CEP'
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
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 295
    Top = 168
  end
  object qryCliente: TADOQuery
    Active = True
    Connection = dmCadastros.adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [CLIENTES].[Codigo_Cliente]'
      '      ,[CLIENTES].[CGC_CPF_Cliente]'
      '      ,[CLIENTES].[Nome]'
      '      ,[CLIENTES].[Telefone]'
      '      ,[CLIENTES].[Endereco]'
      '      ,[CLIENTES].[Bairro]'
      '      ,[CLIENTES].[Complemento]'
      '      ,[CLIENTES].[E_mail]'
      '      ,[CLIENTES].[Codigo_Cidade]'
      '      ,[CLIENTES].[Cep]'
      #9'  ,[CIDADES].[NOME] AS Nome_Cidade'
      #9'  ,[CIDADES].[Estado]'
      #9'  ,[CIDADES].[Cep_Inicial]'
      #9'  ,[CIDADES].[Cep_Final]'
      '  FROM [sinqia].[dbo].[CLIENTES]'
      
        '  INNER JOIN [sinqia].[dbo].[CIDADES] ON CLIENTES.CODIGO_CIDADE ' +
        '= CIDADES.CODIGO_CIDADE')
    Left = 407
    Top = 192
    object qryClienteCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryClienteCGC_CPF_Cliente: TStringField
      FieldName = 'CGC_CPF_Cliente'
      Size = 11
    end
    object qryClienteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryClienteTelefone: TWideStringField
      FieldName = 'Telefone'
      FixedChar = True
      Size = 11
    end
    object qryClienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object qryClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 15
    end
    object qryClienteE_mail: TStringField
      FieldName = 'E_mail'
      Size = 50
    end
    object qryClienteCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qryClienteCep: TBCDField
      FieldName = 'Cep'
      Precision = 18
      Size = 0
    end
    object qryClienteNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
    object qryClienteEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClienteCep_Inicial: TBCDField
      FieldName = 'Cep_Inicial'
      Precision = 18
      Size = 0
    end
    object qryClienteCep_Final: TBCDField
      FieldName = 'Cep_Final'
      Precision = 18
      Size = 0
    end
  end
  object procExcluirCliente: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'ExcluirCliente;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@CODIGO_CLIENTE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Left = 285
    Top = 97
  end
  object procAlterarCliente: TADOStoredProc
    Connection = dmCadastros.adoConexao
    ProcedureName = 'AlterarCliente;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@CODIGO_CLIENTE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@CGC_CPF_CLIENTE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 11
      end
      item
        Name = '@NOME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@TELEFONE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 11
      end
      item
        Name = '@ENDERECO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@BAIRRO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
      end
      item
        Name = '@COMPLEMENTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
      end
      item
        Name = '@EMAIL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
      end
      item
        Name = '@CODIGO_CIDADE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@CEP'
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
    Left = 413
    Top = 89
  end
end
