unit uPesquisaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPesquisaPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmPesquisaCidade = class(TfrmPesquisaPadrao)
    qryCidade: TADOQuery;
    dsCidade: TDataSource;
    qryCidadeCodigo_Cidade: TAutoIncField;
    qryCidadeNome: TStringField;
    qryCidadeEstado: TStringField;
    qryCidadeCep_Inicial: TBCDField;
    qryCidadeCep_Final: TBCDField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaDados();
  end;

var
  frmPesquisaCidade: TfrmPesquisaCidade;

implementation

{$R *.dfm}

uses uCadastroCidade, uCadastroCliente;

procedure TfrmPesquisaCidade.btnNovoClick(Sender: TObject);
begin
  inherited;

  frmCadastroCidade.ShowModal;
end;

procedure TfrmPesquisaCidade.AtualizaDados();
begin

  qryCidade.Active := False;
  qryCidade.Active := True;
end;

procedure TfrmPesquisaCidade.btnSelecionarClick(Sender: TObject);
var
  Codigo_Cidade: Integer;
  Cidade: String;
  Estado: String;
  CepInicial: Double;
  CepFinal: Double;
begin
  inherited;

  if Assigned(dsCidade.Dataset) then
  begin
    Codigo_Cidade := dsCidade.Dataset.FieldByName('Codigo_Cidade').AsInteger;
    Cidade        := dsCidade.Dataset.FieldByName('Nome').AsString;
    Estado        := dsCidade.Dataset.FieldByName('Estado').AsString;
    CepInicial    := StrToFloat(dsCidade.Dataset.FieldByName('Cep_inicial').AsString);
    CepFinal      := StrToFloat(dsCidade.Dataset.FieldByName('Cep_Final').AsString);

    frmCadastroClientes.ObtemDadosCidade(Codigo_Cidade, Cidade, Estado, CepInicial, CepFinal);
  end;

  close;
end;

procedure TfrmPesquisaCidade.FormShow(Sender: TObject);
begin
  inherited;

  AtualizaDados;
end;

end.
