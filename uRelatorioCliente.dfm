object frmRelatorioCliente: TfrmRelatorioCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Clientes'
  ClientHeight = 305
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 21
  object pnlBotoes: TPanel
    Left = 0
    Top = 231
    Width = 405
    Height = 74
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 367
    ExplicitWidth = 624
    object btnGerarRelatorio: TButton
      Left = 159
      Top = 16
      Width = 105
      Height = 41
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btnGerarRelatorioClick
    end
    object btnSair: TButton
      Left = 278
      Top = 16
      Width = 105
      Height = 41
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 231
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitWidth = 628
    ExplicitHeight = 368
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 403
      Height = 168
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = -1
        Width = 72
        Height = 21
        Caption = 'Filtrar por:'
      end
      object chkCodigoClienteInicial: TCheckBox
        Left = 7
        Top = 26
        Width = 218
        Height = 17
        Caption = 'Clientes a partir do c'#243'digo:'
        TabOrder = 0
        OnClick = chkCodigoClienteInicialClick
      end
      object txtCodigoClienteInicial: TEdit
        Left = 237
        Top = 20
        Width = 145
        Height = 29
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
      end
      object chkCodigoClienteFinal: TCheckBox
        Left = 7
        Top = 61
        Width = 218
        Height = 17
        Caption = 'Clientes at'#233' o c'#243'digo:'
        TabOrder = 2
        OnClick = chkCodigoClienteFinalClick
      end
      object txtCodigoClienteFinal: TEdit
        Left = 237
        Top = 55
        Width = 145
        Height = 29
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 3
      end
      object chkCidade: TCheckBox
        Left = 7
        Top = 96
        Width = 234
        Height = 17
        Caption = 'Clientes que sejam da cidade:'
        TabOrder = 4
        OnClick = chkCidadeClick
      end
      object cmbCidade: TDBLookupComboBox
        Left = 237
        Top = 90
        Width = 145
        Height = 29
        Enabled = False
        KeyField = 'NOME'
        ListField = 'NOME'
        ListSource = dsComboCidade
        TabOrder = 5
      end
      object chkEstado: TCheckBox
        Left = 8
        Top = 132
        Width = 234
        Height = 17
        Caption = 'Clientes que sejam do estado:'
        TabOrder = 6
        OnClick = chkEstadoClick
      end
      object cmbEstado: TDBLookupComboBox
        Left = 238
        Top = 126
        Width = 145
        Height = 29
        Enabled = False
        KeyField = 'ESTADO'
        ListField = 'ESTADO'
        ListSource = dsEstado
        TabOrder = 7
      end
    end
    object rdgAgruparPorCidade: TRadioGroup
      Left = 1
      Top = 169
      Width = 403
      Height = 61
      Align = alBottom
      BiDiMode = bdLeftToRight
      Caption = 'Agrupar por:'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cidades'
        'N'#227'o agrupar')
      ParentBiDiMode = False
      TabOrder = 1
      ExplicitTop = 240
      ExplicitWidth = 401
    end
  end
  object dsCliente: TfrxDBDataset
    UserName = 'dsCliente'
    CloseDataSource = False
    DataSet = qryCliente
    BCDToCurrency = False
    DataSetOptions = []
    Left = 552
    Top = 0
    FieldDefs = <
      item
        FieldName = 'CODIGO_CLIENTE'
      end
      item
        FieldName = 'CGC_CPF_CLIENTE'
        FieldType = fftString
        Size = 11
      end
      item
        FieldName = 'NOME'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'TELEFONE'
        FieldType = fftString
        Size = 11
      end
      item
        FieldName = 'E_MAIL'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CEP'
      end
      item
        FieldName = 'ENDERECO'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'BAIRRO'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'COMPLEMENTO'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'CODIGO_CIDADE'
      end
      item
        FieldName = 'NOME_CIDADE'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'ESTADO'
        FieldType = fftString
      end>
  end
  object relClientePorCidade: TfrxReport
    Version = '2024.1.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45367.647578703700000000
    ReportOptions.LastChange = 45367.647578703700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 40
    Top = 168
    Datasets = <
      item
        DataSet = dsCliente
        DataSetName = 'dsCliente'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Clientes por cidade')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        Condition = 'dsCliente."NOME_CIDADE"'
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 60.472476440000000000
          Width = 657.638241333437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[dsCliente."CODIGO_CIDADE"] - [dsCliente."NOME_CIDADE"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 50.188930000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 50.188930000000000000
          Top = 22.677180000000000000
          Width = 579.874150000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 633.842610000000000000
          Top = 22.677180000000000000
          Width = 85.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Top = 1.779523880000000000
          Width = 60.472476440000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = dsCliente
        DataSetName = 'dsCliente'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 50.188930000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CODIGO_CLIENTE'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCliente."CODIGO_CLIENTE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 50.188930000000000000
          Width = 583.653680000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 633.842610000000000000
          Width = 85.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TELEFONE'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."TELEFONE"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060100000000000
          Top = 3.779538150000000000
          Width = 702.992575650000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo12: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object qryCliente: TADOQuery
    Active = True
    Connection = dmCadastros.adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      #9'[CODIGO_CLIENTE]'
      '      ,[CGC_CPF_CLIENTE]'
      '      ,[NOME]'
      '      ,[TELEFONE]'
      '      ,[E_MAIL]'
      '      ,[CEP]'
      '      ,[ENDERECO]'
      '      ,[BAIRRO]'
      '      ,[COMPLEMENTO]'
      '      ,[CODIGO_CIDADE]'
      '      ,[NOME_CIDADE]'
      '      ,[ESTADO]'
      '  FROM [sinqia].[dbo].[VW_CLIENTES]'
      
        '--A CONDI'#199#195'O ABAIXO '#201' UMA FORMA PARA ADICIONAR MAIS PARAMETROS D' +
        'E BUSCA DURANTE O TEMPO DE EXECU'#199#195'O SEM PRECISAR CRIAR DIVERSOS ' +
        'IF ALINHADOS'
      'WHERE 1 = 1  '
      '')
    Left = 632
    Top = 8
    object qryClienteCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
    end
    object qryClienteCGC_CPF_CLIENTE: TStringField
      FieldName = 'CGC_CPF_CLIENTE'
      Size = 11
    end
    object qryClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qryClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
    object qryClienteE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 50
    end
    object qryClienteCEP: TBCDField
      FieldName = 'CEP'
      Precision = 18
      Size = 0
    end
    object qryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qryClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 15
    end
    object qryClienteCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
    end
    object qryClienteNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object qryClienteESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
  end
  object qryNomeCidade: TADOQuery
    Connection = dmCadastros.adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'NOME'
      'FROM CIDADES'
      'ORDER BY NOME')
    Left = 473
    Top = 97
    object qryNomeCidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object dsComboCidade: TDataSource
    DataSet = qryNomeCidade
    Left = 585
    Top = 89
  end
  object qryEstado: TADOQuery
    Connection = dmCadastros.adoConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'ESTADO'
      'FROM CIDADES'
      'GROUP BY ESTADO'
      'ORDER BY ESTADO')
    Left = 473
    Top = 169
    object qryEstadoESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
  end
  object dsEstado: TDataSource
    DataSet = qryEstado
    Left = 593
    Top = 169
  end
  object relCliente: TfrxReport
    Version = '2024.1.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45367.747631435200000000
    ReportOptions.LastChange = 45367.751575312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 144
    Top = 168
    Datasets = <
      item
        DataSet = dsCliente
        DataSetName = 'dsCliente'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 38.850340000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cod')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 42.629870000000000000
          Width = 288.735612420000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 331.365482420000000000
          Width = 110.277870560000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 441.643352990000000000
          Width = 238.124025170000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 679.767378150000000000
          Width = 38.342858070000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = dsCliente
        DataSetName = 'dsCliente'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Width = 38.850340000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'CODIGO_CLIENTE'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."CODIGO_CLIENTE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 42.629870000000000000
          Width = 288.735612420000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 331.365482420000000000
          Width = 110.277870560000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TELEFONE'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."TELEFONE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 441.643352990000000000
          Width = 238.124025170000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME_CIDADE'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."NOME_CIDADE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 679.767378150000000000
          Width = 38.342858070000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ESTADO'
          DataSet = dsCliente
          DataSetName = 'dsCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsCliente."ESTADO"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
