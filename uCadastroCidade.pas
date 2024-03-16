unit uCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Data.Win.ADODB,
  Vcl.Buttons;

type
  TfrmCadastroCidade = class(TfrmCadastroPadrao)
    dsCidade: TDataSource;
    qryCidade: TADOQuery;
    procInserirCidade: TADOStoredProc;
    procAlterarCidade: TADOStoredProc;
    Label3: TLabel;
    txtCodigo: TEdit;
    Label7: TLabel;
    txtNome: TEdit;
    Label8: TLabel;
    txtCepInicial: TEdit;
    Label9: TLabel;
    txtEstado: TEdit;
    Label11: TLabel;
    txtCepFinal: TEdit;
    qryCidadeCodigo_Cidade: TAutoIncField;
    qryCidadeNome: TStringField;
    qryCidadeEstado: TStringField;
    qryCidadeCep_Inicial: TBCDField;
    qryCidadeCep_Final: TBCDField;
    Label1: TLabel;
    txtCodigoEditar: TEdit;
    Label2: TLabel;
    txtNomeEditar: TEdit;
    Label4: TLabel;
    txtCepInicialEditar: TEdit;
    txtCepFinalEditar: TEdit;
    Label5: TLabel;
    txtEstadoEditar: TEdit;
    Label6: TLabel;
    procExcluirCidade: TADOStoredProc;
    procedure btnCancelarCadastrarClick(Sender: TObject);
    procedure btnSalvarCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgListaCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarEditarClick(Sender: TObject);
    procedure pagConteudoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AtualizaDados();
    procedure LimparCampos();
    procedure LimparCamposEditar();
    procedure AddParametrosProcInserirCidade();
    procedure AddParametrosProcAlterarCidade();
    procedure ApenasMaiusculas(Sender: TObject; var valor: Char);
    procedure ApenasNumeros(Sender: TObject; var valor: Char);
    function ValidarDados(): string;
    function ValidarDadosEditar(): string;
    var EstadoId: Integer;
    var Estado: string;
  public
    { Public declarations }
    procedure ObtemDadosEstado(Id: Integer; Descricao: string);
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

{$R *.dfm}

uses uPesquisaCidade;

procedure TfrmCadastroCidade.btnSalvarCadastrarClick(Sender: TObject);
begin
  inherited;

  var validarDados := ValidarDados();

  if ValidarDados <> '' then
  begin
    ShowMessage(ValidarDados);
    Exit;
  end;

  try
    AddParametrosProcInserirCidade();
    procInserirCidade.ExecProc;

    var resultado := procInserirCidade.Parameters.ParamByName('@STATUS').Value;

    case resultado of
      0: begin
        ShowMessage('Cidade cadastrada com sucesso!');
        LimparCampos();
        txtNome.SetFocus;
      end;
      1: begin
        ShowMessage('Cidade já cadastrada no banco de dados!');
        txtNome.SetFocus;
      end;
      else
        begin
          ShowMessage('Houve um erro, por favor, tente novamente!');
          txtNome.SetFocus;
        end;
    end;

    AtualizaDados;

  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
    end;

  end;
end;

procedure TfrmCadastroCidade.btnSalvarEditarClick(Sender: TObject);
begin
  inherited;

  var validarDadosEditar := ValidarDadosEditar();

  if validarDadosEditar <> '' then
  begin
    ShowMessage(validarDadosEditar);
    Exit;
  end;

  try
    AddParametrosProcAlterarCidade();
    procAlterarCidade.ExecProc;

    var resultado := procAlterarCidade.Parameters.ParamByName('@STATUS').Value;

      case resultado of
      0: begin
        ShowMessage('Cidade alterada com sucesso!');
        LimparCamposEditar();
        AtualizaDados;
        pagConteudo.ActivePageIndex := 2;
      end;
      2: begin
        ShowMessage('Cidade não localizada para alteração!');
        txtNomeEditar.SetFocus;
      end
      else
        begin
          ShowMessage('Houve um erro, por favor, tente novamente!');
          txtNome.SetFocus;
        end;
    end;

  except
    on E: Exception do
    begin
      var resultado := procAlterarCidade.Parameters.ParamByName('@STATUS').Value;

      if (resultado = 1) then
      begin
        ShowMessage('Cidade já cadastrada no banco de dados!');
      end
      else
        ShowMessage(E.Message);

      txtNomeEditar.SetFocus;
    end;

  end;
end;

procedure TfrmCadastroCidade.dbgListaCellClick(Column: TColumn);
begin
  inherited;

  LimparCamposEditar();

  if Assigned(dsCidade.Dataset) then
  begin
    txtCodigoEditar.Text      := dsCidade.Dataset.FieldByName('Codigo_Cidade').AsString;
    txtNomeEditar.Text        := dsCidade.Dataset.FieldByName('Nome').AsString;
    txtEstadoEditar.Text      := dsCidade.Dataset.FieldByName('Estado').AsString;
    txtCepInicialEditar.Text  := dsCidade.Dataset.FieldByName('Cep_Inicial').AsString;
    txtCepFinalEditar.Text    := dsCidade.Dataset.FieldByName('Cep_Final').AsString;
  end;

end;

procedure TfrmCadastroCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if Assigned(frmPesquisaCidade) then
  begin
    frmPesquisaCidade.AtualizaDados;
  end;

end;

procedure TfrmCadastroCidade.FormCreate(Sender: TObject);
begin
  inherited;

  txtNome.OnKeyPress        := ApenasMaiusculas;
  txtEstado.OnKeyPress      := ApenasMaiusculas;
  txtCepInicial.OnKeyPress  := ApenasNumeros;
  txtCepFinal.OnKeyPress    := ApenasNumeros;

  txtNomeEditar.OnKeyPress        := ApenasMaiusculas;
  txtEstadoEditar.OnKeyPress      := ApenasMaiusculas;
  txtCepInicialEditar.OnKeyPress  := ApenasNumeros;
  txtCepFinalEditar.OnKeyPress    := ApenasNumeros;
end;

procedure TfrmCadastroCidade.FormShow(Sender: TObject);
begin
  inherited;

  LimparCampos();
  LimparCamposEditar();
  AtualizaDados;

  pagConteudo.ActivePageIndex := 0;
  txtNome.SetFocus();
end;

procedure TfrmCadastroCidade.btnCancelarCadastrarClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TfrmCadastroCidade.btnCancelarEditarClick(Sender: TObject);
begin
  inherited;

  LimparCamposEditar();
  pagConteudo.ActivePageIndex := 2;
end;

procedure TfrmCadastroCidade.btnEditarClick(Sender: TObject);
begin
  inherited;

  if Trim(txtCodigoEditar.Text) = '' then
  begin
    ShowMessage('Selecione a cidade para editar!');
    Exit;
  end;

  pagConteudo.ActivePageIndex := 1;
  pnlBotoesEditar.Enabled     := True;
  tabEditar.Enabled           := True;
end;

procedure TfrmCadastroCidade.btnExcluirClick(Sender: TObject);
begin
  inherited;

  var resposta := MessageDlg('Atenção: Você está prestes a excluir permanentemente esse registro. Deseja continuar?',
    mtWarning, [mbYes, mbNo], 0);

  case Resposta of
    mrYes:
      begin
        procExcluirCidade.Parameters.ParamByName('@CODIGO_CIDADE').Value :=  dsCidade.Dataset.FieldByName('Codigo_Cidade').AsString;
        procExcluirCidade.ExecProc;

        var resultado := procExcluirCidade.Parameters.ParamByName('@STATUS').Value;

        case resultado of
          0: begin
            ShowMessage('Cidade excluída com sucesso!');
          end;
          1: begin
            ShowMessage('Cidade cadastrada para clientes, exclusão não permitida!');
          end;
          else
            begin
              ShowMessage('Houve um erro, por favor, tente novamente!');
            end;
          end;

          AtualizaDados;
      end;
    mrNo: ShowMessage('Exclusão cancelada.');
  end;
end;

procedure TfrmCadastroCidade.ObtemDadosEstado(Id: Integer; Descricao: string);
begin
  inherited;

  EstadoId := Id;
  Estado := Descricao;
end;

procedure TfrmCadastroCidade.pagConteudoChange(Sender: TObject);
begin
  inherited;

  if (pagConteudo.ActivePageIndex = 1) and (txtCodigoEditar.Text = '') then
  begin
    pnlBotoesEditar.Enabled := False;
    tabEditar.Enabled       := False;
  end;
end;

procedure TfrmCadastroCidade.LimparCampos();
begin
  inherited;

  txtNome.Text        := '';
  txtEstado.Text      := '';
  txtCepInicial.Text  := '';
  txtCepFinal.Text    := '';
end;

procedure TfrmCadastroCidade.LimparCamposEditar();
begin
  inherited;

  txtCodigoEditar.Text      := '';
  txtNomeEditar.Text        := '';
  txtEstadoEditar.Text      := '';
  txtCepInicialEditar.Text  := '';
  txtCepFinalEditar.Text    := '';
end;

function TfrmCadastroCidade.ValidarDados: string;
begin
  if Trim(txtNome.Text) = '' then
  begin
    txtNome.SetFocus;
    Result := 'Informe o nome da cidade!';
    Exit;
  end;

  if Trim(txtEstado.Text) = '' then
  begin
    txtEstado.SetFocus;
    Result := 'Informe o estado!';
    Exit;
  end;

  if Trim(txtCepInicial.Text) = '' then
  begin
    txtCepInicial.SetFocus;
    Result := 'Informe o CEP inicial!';
    Exit;
  end;

  if Trim(txtCepFinal.Text) = '' then
  begin
    txtCepFinal.SetFocus;
    Result := 'Informe o CEP final!';
    Exit;
  end;

  if StrToInt(txtCepInicial.Text) >= StrToInt(txtCepFinal.Text) then
  begin
    txtCepInicial.SetFocus;
    Result := 'CEP inicial deve ser menor que o final!';
    Exit;
  end;

  Result := '';
end;

function TfrmCadastroCidade.ValidarDadosEditar: string;
begin
  if Trim(txtNomeEditar.Text) = '' then
  begin
    txtNomeEditar.SetFocus;
    Result := 'Informe o nome da cidade!';
    Exit;
  end;

  if Trim(txtEstadoEditar.Text) = '' then
  begin
    txtEstadoEditar.SetFocus;
    Result := 'Informe o estado!';
    Exit;
  end;

  if Trim(txtCepInicialEditar.Text) = '' then
  begin
    txtCepInicialEditar.SetFocus;
    Result := 'Informe o cep inicial!';
    Exit;
  end;

  if Trim(txtCepFinalEditar.Text) = '' then
  begin
    txtCepFinalEditar.SetFocus;
    Result := 'Informe o cep final!';
    Exit;
  end;

  if StrToInt(txtCepInicialEditar.Text) >= StrToInt(txtCepFinalEditar.Text) then
  begin
    txtCepInicialEditar.SetFocus;
    Result := 'CEP inicial deve ser menor que o final!';
    Exit;
  end;

  Result := '';
end;

procedure TfrmCadastroCidade.AddParametrosProcInserirCidade();
begin
  procInserirCidade.Parameters.ParamByName('@NOME').Value       := UpperCase(txtNome.Text);
  procInserirCidade.Parameters.ParamByName('@ESTADO').Value     := UpperCase(txtEstado.Text);
  procInserirCidade.Parameters.ParamByName('@CEPINICIAL').Value := txtCepInicial.Text;
  procInserirCidade.Parameters.ParamByName('@CEPFINAL').Value   := txtCepFinal.Text;
end;

procedure TfrmCadastroCidade.AddParametrosProcAlterarCidade();
begin
  procAlterarCidade.Parameters.ParamByName('@CODIGO_CIDADE').Value  := txtCodigoEditar.Text;
  procAlterarCidade.Parameters.ParamByName('@NOME').Value           := UpperCase(txtNomeEditar.Text);
  procAlterarCidade.Parameters.ParamByName('@ESTADO').Value         := UpperCase(txtEstadoEditar.Text);
  procAlterarCidade.Parameters.ParamByName('@CEPINICIAL').Value     := txtCepInicialEditar.Text;
  procAlterarCidade.Parameters.ParamByName('@CEPFINAL').Value       := txtCepFinalEditar.Text;
end;

procedure TfrmCadastroCidade.ApenasMaiusculas(Sender: TObject; var valor: Char);
begin
  valor := UpCase(valor);
end;

procedure TfrmCadastroCidade.ApenasNumeros(Sender: TObject; var valor: Char);
begin
  if not (valor in ['0'..'9', #8]) then
    valor := #0;
end;

procedure TfrmCadastroCidade.AtualizaDados();
begin
  qryCidade.Active   := False;
  qryCidade.Active   := True;
end;

end.
