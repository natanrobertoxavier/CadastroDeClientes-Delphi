unit uRelatorioCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frxClass, frxDBSet,
  Data.DB, Data.Win.ADODB, frCoreClasses, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls;

type
  TfrmRelatorioCliente = class(TForm)
    pnlBotoes: TPanel;
    btnGerarRelatorio: TButton;
    dsCliente: TfrxDBDataset;
    relClientePorCidade: TfrxReport;
    qryCliente: TADOQuery;
    qryClienteCODIGO_CLIENTE: TIntegerField;
    qryClienteCGC_CPF_CLIENTE: TStringField;
    qryClienteNOME: TStringField;
    qryClienteTELEFONE: TStringField;
    qryClienteE_MAIL: TStringField;
    qryClienteCEP: TBCDField;
    qryClienteENDERECO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteCODIGO_CIDADE: TIntegerField;
    qryClienteNOME_CIDADE: TStringField;
    qryClienteESTADO: TStringField;
    btnSair: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    chkCodigoClienteInicial: TCheckBox;
    txtCodigoClienteInicial: TEdit;
    chkCodigoClienteFinal: TCheckBox;
    txtCodigoClienteFinal: TEdit;
    chkCidade: TCheckBox;
    qryNomeCidade: TADOQuery;
    dsComboCidade: TDataSource;
    qryNomeCidadeNOME: TStringField;
    cmbCidade: TDBLookupComboBox;
    qryEstado: TADOQuery;
    dsEstado: TDataSource;
    qryEstadoESTADO: TStringField;
    rdgAgruparPorCidade: TRadioGroup;
    chkEstado: TCheckBox;
    cmbEstado: TDBLookupComboBox;
    relCliente: TfrxReport;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure chkCodigoClienteInicialClick(Sender: TObject);
    procedure chkCodigoClienteFinalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkCidadeClick(Sender: TObject);
    procedure chkEstadoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ApenasNumeros(Sender: TObject; var valor: Char);
  public
    { Public declarations }
  end;

var
  frmRelatorioCliente: TfrmRelatorioCliente;

const
  sqlClientes: string = ' SELECT '
			+ '	[CODIGO_CLIENTE] '
			+ '	,[CGC_CPF_CLIENTE] '
			+ '	,[NOME] '
			+ '	,[TELEFONE] '
			+ '	,[E_MAIL] '
			+ '	,[CEP] '
			+ '	,[ENDERECO] '
			+ '	,[BAIRRO] '
			+ '	,[COMPLEMENTO] '
			+ '	,[CODIGO_CIDADE] '
			+ '	,[NOME_CIDADE] '
			+ '	,[ESTADO] '
			+ 'FROM [sinqia].[dbo].[VW_CLIENTES] '
			+ 'WHERE 1 = 1 ';

implementation


{$R *.dfm}

uses uDMCadastros;

procedure TfrmRelatorioCliente.btnGerarRelatorioClick(Sender: TObject);
var
  codInicialCliente,
  codFinalCliente,
  cidadeCliente,
  estadoCliente : string;
begin
  qryCliente.Close;
  qryCliente.SQL.Text := '';
  qryCliente.SQL.Text := sqlClientes;


  if chkCodigoClienteInicial.Checked then
  begin

    if Trim(txtCodigoClienteInicial.Text) = '' then
    begin
      ShowMessage('É necessário informar o valor inicial do código de cliente!');
      txtCodigoClienteInicial.SetFocus;
      Exit;
    end;

    codInicialCliente := 'AND CODIGO_CLIENTE >= :CODINICIAL';
    qryCliente.SQL.Add(codInicialCliente);
    qryCliente.Parameters.ParamByName('CODINICIAL').value := txtCodigoClienteInicial.Text;
  end;

  if chkCodigoClienteFinal.Checked then
  begin

    if Trim(txtCodigoClienteFinal.Text) = '' then
    begin
      ShowMessage('É necessário informar o valor final do código de cliente!');
      txtCodigoClienteFinal.SetFocus;
      Exit;
    end;

    codFinalCliente := 'AND CODIGO_CLIENTE <= :CODFINAL';
    qryCliente.SQL.Add(codFinalCliente);
    qryCliente.Parameters.ParamByName('CODFINAL').value := txtCodigoClienteFinal.Text;
  end;

  if (chkCodigoClienteInicial.Checked and
     chkCodigoClienteFinal.Checked)   and
     (StrToInt(txtCodigoClienteInicial.Text) <
     StrToInt(txtCodigoClienteFinal.Text)) then
  begin
      ShowMessage('O código inicial deve ser menor que o código final!');
      txtCodigoClienteInicial.SetFocus;
      Exit;
  end;

  if chkCidade.Checked then
  begin

    if (cmbCidade.KeyValue = null) or (cmbCidade.KeyValue = '') then
    begin
      ShowMessage('É necessário informar a cidade!');
      cmbCidade.SetFocus;
      Exit;
    end;

    cidadeCliente := 'AND NOME_CIDADE = :NOMECIDADE';
    qryCliente.SQL.Add(cidadeCliente);
    qryCliente.Parameters.ParamByName('NOMECIDADE').value := cmbCidade.KeyValue;
  end;

  if chkEstado.Checked then
  begin

    if (cmbEstado.KeyValue = null) or (cmbEstado.KeyValue = '') then
    begin
      ShowMessage('É necessário informar o estado!');
      cmbEstado.SetFocus;
      Exit;
    end;

    estadoCliente := 'AND ESTADO = :ESTADO';
    qryCliente.SQL.Add(estadoCliente);
    qryCliente.Parameters.ParamByName('ESTADO').value := cmbEstado.KeyValue;
  end;

  if rdgAgruparPorCidade.ItemIndex = 0 then
  begin
    qryCliente.SQL.Add('ORDER BY [NOME_CIDADE], [NOME]');
    relClientePorCidade.ShowReport();
  end
  else
  begin
    qryCliente.SQL.Add('ORDER BY [NOME]');
    relCliente.ShowReport();
  end;

  qryCliente.Open();
end;

procedure TfrmRelatorioCliente.ApenasNumeros(Sender: TObject; var valor: Char);
begin
  if not (valor in ['0'..'9', #8]) then
    valor := #0;
end;

procedure TfrmRelatorioCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioCliente.chkCidadeClick(Sender: TObject);
begin
  cmbCidade.Enabled := chkCidade.Checked;

  if cmbCidade.Enabled then
  begin
    cmbCidade.SetFocus;
  end
  else
  begin
    cmbCidade.KeyValue := '';
  end;
end;

procedure TfrmRelatorioCliente.chkCodigoClienteFinalClick(Sender: TObject);
begin
  txtCodigoClienteFinal.Enabled := chkCodigoClienteFinal.Checked;

  if txtCodigoClienteFinal.Enabled then
  begin
    txtCodigoClienteFinal.SetFocus;
  end
  else
  begin
    txtCodigoClienteFinal.Text := '';
  end;
end;

procedure TfrmRelatorioCliente.chkCodigoClienteInicialClick(Sender: TObject);
begin
  txtCodigoClienteInicial.Enabled := chkCodigoClienteInicial.Checked;

  if txtCodigoClienteInicial.Enabled then
  begin
    txtCodigoClienteInicial.SetFocus;
  end
  else
  begin
    txtCodigoClienteInicial.Text := '';
  end;
end;

procedure TfrmRelatorioCliente.chkEstadoClick(Sender: TObject);
begin
  cmbEstado.Enabled := chkEstado.Checked;

  if cmbEstado.Enabled then
  begin
    cmbEstado.SetFocus;
  end
  else
  begin
    cmbEstado.KeyValue := '';
  end;
end;

procedure TfrmRelatorioCliente.FormCreate(Sender: TObject);
begin
  txtCodigoClienteInicial.OnKeyPress  := ApenasNumeros;
  txtCodigoClienteFinal.OnKeyPress    := ApenasNumeros;
end;

procedure TfrmRelatorioCliente.FormShow(Sender: TObject);
begin
  cmbCidade.Refresh;
  qryNomeCidade.Close;
  qryNomeCidade.Open;
  qryNomeCidade.Active := False;
  qryNomeCidade.Active := True;

  cmbEstado.Refresh;
  qryEstado.Close;
  qryEstado.Open;
  qryEstado.Active := False;
  qryEstado.Active := True;
end;

end.
