unit uCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons,
  Data.Win.ADODB;

type
  TfrmCadastroClientes = class(TfrmCadastroPadrao)
    btnPesquisar: TBitBtn;
    txtCidade: TEdit;
    Label6: TLabel;
    txtEstado: TEdit;
    Label5: TLabel;
    txtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtBairro: TEdit;
    Label4: TLabel;
    txtCodigo: TEdit;
    Label7: TLabel;
    txtTelefone: TEdit;
    Label8: TLabel;
    txtCEP: TEdit;
    Label1: TLabel;
    txtCPF: TEdit;
    Label9: TLabel;
    txtEmail: TEdit;
    Label10: TLabel;
    txtEndereco: TEdit;
    Label11: TLabel;
    txtComplemento: TEdit;
    Label12: TLabel;
    txtCodigoEditar: TEdit;
    Label13: TLabel;
    txtNomeEditar: TEdit;
    Label14: TLabel;
    txtCPFEditar: TEdit;
    Label15: TLabel;
    txtEnderecoEditar: TEdit;
    Label16: TLabel;
    txtComplementoEditar: TEdit;
    Label17: TLabel;
    txtCidadeEditar: TEdit;
    Label18: TLabel;
    txtTelefoneEditar: TEdit;
    Label19: TLabel;
    txtEmailEditar: TEdit;
    Label20: TLabel;
    txtBairroEditar: TEdit;
    btnPesquisarEditar: TBitBtn;
    txtEstadoEditar: TEdit;
    txtCEPEditar: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    procInserirCliente: TADOStoredProc;
    dsCliente: TDataSource;
    qryCliente: TADOQuery;
    procExcluirCliente: TADOStoredProc;
    procAlterarCliente: TADOStoredProc;
    qryClienteCodigo_Cliente: TIntegerField;
    qryClienteCGC_CPF_Cliente: TStringField;
    qryClienteNome: TStringField;
    qryClienteTelefone: TWideStringField;
    qryClienteEndereco: TStringField;
    qryClienteBairro: TStringField;
    qryClienteComplemento: TStringField;
    qryClienteE_mail: TStringField;
    qryClienteCodigo_Cidade: TIntegerField;
    qryClienteCep: TBCDField;
    qryClienteNome_Cidade: TStringField;
    qryClienteEstado: TStringField;
    qryClienteCep_Inicial: TBCDField;
    qryClienteCep_Final: TBCDField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarCadastrarClick(Sender: TObject);
    procedure btnCancelarEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure pagConteudoChange(Sender: TObject);
    procedure dbgListaCellClick(Column: TColumn);
    procedure btnSalvarEditarClick(Sender: TObject);
    procedure btnPesquisarEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    var
      Codigo_Cidade: Integer;
      Cidade, Estado: String;
      CepInicial, CepFinal: Double;

    procedure AtualizaDados();
    procedure LimparCampos();
    procedure LimparCamposEditar();
    procedure AddParametrosProcInserirCliente();
    procedure AddParametrosProcAlterarCliente();
    function ValidarDados(): string;
    function ValidarDadosEditar(): string;
    procedure ApenasMaiusculas(Sender: TObject; var valor: Char);
    procedure ApenasNumeros(Sender: TObject; var valor: Char);
  public
    { Public declarations }
    procedure ObtemDadosCidade(Codigo_CidadeF: Integer; CidadeF, EstadoF: string; CepInicialF, CepFinalF: Double);
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

uses uPesquisaCidade;

procedure TfrmCadastroClientes.btnCancelarCadastrarClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TfrmCadastroClientes.btnCancelarEditarClick(Sender: TObject);
begin
  inherited;

  LimparCamposEditar();
  pagConteudo.ActivePageIndex := 2;
end;

procedure TfrmCadastroClientes.btnEditarClick(Sender: TObject);
begin
  inherited;

  if Trim(txtCodigoEditar.Text) = '' then
  begin
    ShowMessage('Selecione a cliente para editar!');
    Exit;
  end;

  pagConteudo.ActivePageIndex := 1;
  pnlBotoesEditar.Enabled     := True;
  tabEditar.Enabled           := True;
end;

procedure TfrmCadastroClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;

  var resposta := MessageDlg('Atenção: Você está prestes a excluir permanentemente esse registro. Deseja continuar?',
    mtWarning, [mbYes, mbNo], 0);

  case Resposta of
    mrYes:
      begin
        try
          procExcluirCliente.Parameters.ParamByName('@CODIGO_CLIENTE').Value :=  dsCliente.Dataset.FieldByName('Codigo_Cliente').AsString;
          procExcluirCliente.ExecProc;

          ShowMessage('Cliente excluído com sucesso!');

          AtualizaDados;

        except
          on E: Exception do
          begin
            ShowMessage('Erro: ' + E.Message);
          end;

        end;
      end;
    mrNo: ShowMessage('Exclusão cancelada.');
  end;
end;

procedure TfrmCadastroClientes.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  frmPesquisaCidade.ShowModal;

  txtCidade.Text  := Cidade;
  txtEstado.Text  := Estado;
end;

procedure TfrmCadastroClientes.btnPesquisarEditarClick(Sender: TObject);
begin
  inherited;

  frmPesquisaCidade.ShowModal;

  txtCidadeEditar.Text  := Cidade;
  txtEstadoEditar.Text  := Estado;
end;

procedure TfrmCadastroClientes.btnSalvarCadastrarClick(Sender: TObject);
begin
  inherited;

  var validarDados := ValidarDados();

  if ValidarDados <> '' then
  begin
    ShowMessage(ValidarDados);
    Exit;
  end;

  try
    AddParametrosProcInserirCliente();
    procInserirCliente.ExecProc;

    var resultado := procInserirCliente.Parameters.ParamByName('@STATUS').Value;

    case resultado of
      0: begin
        ShowMessage('Cliente cadastrado com sucesso!');
        LimparCampos();
        txtNome.SetFocus;
      end;
      1: begin
        ShowMessage('Já existe um cliente com o CPF informado!');
        txtCPF.SetFocus;
      end;
      2: begin
        ShowMessage('Nenhuma cidade localizada com os dados informados!');
        btnPesquisar.SetFocus;
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

procedure TfrmCadastroClientes.btnSalvarEditarClick(Sender: TObject);
begin
  inherited;

  var validarDadosEditar := ValidarDadosEditar();

  if validarDadosEditar <> '' then
  begin
    ShowMessage(validarDadosEditar);
    Exit;
  end;

  try
    AddParametrosProcAlterarCliente();
    procAlterarCliente.ExecProc;

    var resultado := procAlterarCliente.Parameters.ParamByName('@STATUS').Value;

      case resultado of
      0: begin
        ShowMessage('Cliente alterado com sucesso!');
        LimparCamposEditar();
        AtualizaDados;
        pagConteudo.ActivePageIndex := 2;
      end;
      1: begin
        ShowMessage('Nenhuma cidade localizada com os dados informados!');
        btnPesquisarEditar.SetFocus;
      end;
      2: begin
        ShowMessage('Já existe um cliente com o CPF informado!');
        txtCPFEditar.SetFocus;
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
      ShowMessage(E.Message);
      txtNomeEditar.SetFocus;
    end;

  end;
end;

procedure TfrmCadastroClientes.dbgListaCellClick(Column: TColumn);
begin
  inherited;
  LimparCamposEditar();

  if Assigned(dsCliente.Dataset) then
  begin
    txtCodigoEditar.Text      := dsCliente.Dataset.FieldByName('Codigo_Cliente').AsString;
    txtCPFEditar.Text         := dsCliente.Dataset.FieldByName('CGC_CPF_Cliente').AsString;
    txtNomeEditar.Text        := dsCliente.Dataset.FieldByName('Nome').AsString;
    txtTelefoneEditar.Text    := dsCliente.Dataset.FieldByName('Telefone').AsString;
    txtEnderecoEditar.Text    := dsCliente.Dataset.FieldByName('Endereco').AsString;
    txtBairroEditar.Text      := dsCliente.Dataset.FieldByName('Bairro').AsString;
    txtComplementoEditar.Text := dsCliente.Dataset.FieldByName('Complemento').AsString;
    txtEmailEditar.Text       := dsCliente.Dataset.FieldByName('E_mail').AsString;
    txtCEPEditar.Text         := dsCliente.Dataset.FieldByName('Cep').AsString;
    txtCidadeEditar.Text      := dsCliente.Dataset.FieldByName('Nome_Cidade').AsString;
    txtEstadoEditar.Text      := dsCliente.Dataset.FieldByName('Estado').AsString;
    Codigo_Cidade             := dsCliente.Dataset.FieldByName('Codigo_Cidade').AsInteger;
    CepInicial                := dsCliente.Dataset.FieldByName('Cep_Inicial').AsInteger;
    CepFinal                  := dsCliente.Dataset.FieldByName('Cep_Final').AsInteger;
  end;

end;

procedure TfrmCadastroClientes.FormCreate(Sender: TObject);
begin
  inherited;

  txtNome.OnKeyPress        := ApenasMaiusculas;
  txtEmail.OnKeyPress       := ApenasMaiusculas;
  txtEndereco.OnKeyPress    := ApenasMaiusculas;
  txtBairro.OnKeyPress      := ApenasMaiusculas;
  txtComplemento.OnKeyPress := ApenasMaiusculas;
  txtCPF.OnKeyPress         := ApenasNumeros;
  txtTelefone.OnKeyPress    := ApenasNumeros;
  txtCEP.OnKeyPress         := ApenasNumeros;

  txtNomeEditar.OnKeyPress        := ApenasMaiusculas;
  txtEmailEditar.OnKeyPress       := ApenasMaiusculas;
  txtEnderecoEditar.OnKeyPress    := ApenasMaiusculas;
  txtBairroEditar.OnKeyPress      := ApenasMaiusculas;
  txtComplementoEditar.OnKeyPress := ApenasMaiusculas;
  txtCPFEditar.OnKeyPress         := ApenasNumeros;
  txtTelefoneEditar.OnKeyPress    := ApenasNumeros;
  txtCEPEditar.OnKeyPress         := ApenasNumeros;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  inherited;

  LimparCampos();
  LimparCamposEditar();
  AtualizaDados;

  pagConteudo.ActivePageIndex := 0;
  txtNome.SetFocus();
end;

procedure TfrmCadastroClientes.ApenasMaiusculas(Sender: TObject; var valor: Char);
begin
  valor := UpCase(valor);
end;

procedure TfrmCadastroClientes.ApenasNumeros(Sender: TObject; var valor: Char);
begin
  if not (valor in ['0'..'9', #8]) then
    valor := #0;
end;

procedure TfrmCadastroClientes.AtualizaDados();
begin
  qryCliente.Active := False;
  qryCliente.Active := True;
end;

procedure TfrmCadastroClientes.LimparCampos();
begin
  inherited;

  txtCodigo.Text      := '';
  txtNome.Text        := '';
  txtCPF.Text         := '';
  txtTelefone.Text    := '';
  txtEmail.Text       := '';
  txtEndereco.Text    := '';
  txtBairro.Text      := '';
  txtComplemento.Text := '';
  txtCidade.Text      := '';
  txtEstado.Text      := '';
  txtCEP.Text         := '';
  Cidade              := '';
  Estado              := '';
  Codigo_Cidade       :=  0;
  CepInicial          :=  0;
  CepFinal            :=  0;
end;

procedure TfrmCadastroClientes.LimparCamposEditar();
begin
  inherited;

  txtCodigoEditar.Text      := '';
  txtNomeEditar.Text        := '';
  txtCPFEditar.Text         := '';
  txtTelefoneEditar.Text    := '';
  txtEmailEditar.Text       := '';
  txtEnderecoEditar.Text    := '';
  txtBairroEditar.Text      := '';
  txtComplementoEditar.Text := '';
  txtCidadeEditar.Text      := '';
  txtEstadoEditar.Text      := '';
  txtCEPEditar.Text         := '';
  Cidade                    := '';
  Estado                    := '';
  Codigo_Cidade             :=  0;
  CepInicial                :=  0;
  CepFinal                  :=  0;
end;

function TfrmCadastroClientes.ValidarDados: string;
begin
  if Trim(txtNome.Text) = '' then
  begin
    txtNome.SetFocus;
    Result := 'Informe o nome do cliente!';
    Exit;
  end;

  if Trim(txtCPF.Text) = '' then
  begin
    txtCPF.SetFocus;
    Result := 'Informe o CPF do cliente!';
    Exit;
  end;

  if Length(txtCPF.Text) < 11 then
  begin
    txtCPF.SetFocus;
    Result := 'Informe o CPF do cliente!';
    Exit;
  end;

  if Trim(txtTelefone.Text) = '' then
  begin
    txtTelefone.SetFocus;
    Result := 'Informe o telefone do cliente!';
    Exit;
  end;

  if Length(txtTelefone.Text) < 11 then
  begin
    txtTelefone.SetFocus;
    Result := 'O telefone deve conter 11 dígitos!';
    Exit;
  end;

  if Trim(txtEmail.Text) = '' then
  begin
    txtEmail.SetFocus;
    Result := 'Informe o e-mail do cliente!';
    Exit;
  end;

  if Trim(txtEndereco.Text) = '' then
  begin
    txtEndereco.SetFocus;
    Result := 'Informe o endereço do cliente!';
    Exit;
  end;

  if Trim(txtBairro.Text) = '' then
  begin
    txtBairro.SetFocus;
    Result := 'Informe o bairro do cliente!';
    Exit;
  end;

  if Trim(txtCidade.Text) = '' then
  begin
    btnPesquisar.SetFocus;
    Result := 'Selecione a cidade do cliente!';
    Exit;
  end;

  if Trim(txtEstado.Text) = '' then
  begin
    btnPesquisar.SetFocus;
    Result := 'É necessário selecionar a cidade para obter o CEP!';
    Exit;
  end;

  if Trim(txtCEP.Text) = '' then
  begin
    txtCEP.SetFocus;
    Result := 'Informe o CEP do cliente!';
    Exit;
  end;

  if (StrToFloat(txtCep.Text) < CepInicial) or
     (StrToFloat(txtCep.Text) > CepFinal) then
  begin
    txtCEP.SetFocus;
    Result := 'O CEP informado está fora dos parâmetros estabelecidos pela cidade ' + Cidade + '!';
    Exit;
  end;

  Result := '';
end;

function TfrmCadastroClientes.ValidarDadosEditar: string;
begin
  if Trim(txtNomeEditar.Text) = '' then
  begin
    txtNomeEditar.SetFocus;
    Result := 'Informe o nome do cliente!';
    Exit;
  end;

  if Trim(txtCPFEditar.Text) = '' then
  begin
    txtCPFEditar.SetFocus;
    Result := 'Informe o CPF do cliente!';
    Exit;
  end;

  if Length(txtCPFEditar.Text) < 11 then
  begin
    txtCPFEditar.SetFocus;
    Result := 'Informe o CPF do cliente!';
    Exit;
  end;

  if Trim(txtTelefoneEditar.Text) = '' then
  begin
    txtTelefoneEditar.SetFocus;
    Result := 'Informe o telefone do cliente!';
    Exit;
  end;

  if Length(txtTelefoneEditar.Text) < 11 then
  begin
    txtTelefoneEditar.SetFocus;
    Result := 'O telefone deve conter 11 dígitos!';
    Exit;
  end;

  if Trim(txtEmailEditar.Text) = '' then
  begin
    txtEmailEditar.SetFocus;
    Result := 'Informe o e-mail do cliente!';
    Exit;
  end;

  if Trim(txtEnderecoEditar.Text) = '' then
  begin
    txtEnderecoEditar.SetFocus;
    Result := 'Informe o endereço do cliente!';
    Exit;
  end;

  if Trim(txtBairroEditar.Text) = '' then
  begin
    txtBairroEditar.SetFocus;
    Result := 'Informe o bairro do cliente!';
    Exit;
  end;

  if Trim(txtCidadeEditar.Text) = '' then
  begin
    btnPesquisarEditar.SetFocus;
    Result := 'Selecione a cidade do cliente!';
    Exit;
  end;

  if Trim(txtEstadoEditar.Text) = '' then
  begin
    btnPesquisarEditar.SetFocus;
    Result := 'É necessário selecionar a cidade para obter o CEP!';
    Exit;
  end;

  if Trim(txtCEPEditar.Text) = '' then
  begin
    txtCEPEditar.SetFocus;
    Result := 'Informe o CEP do cliente!';
    Exit;
  end;

  if (StrToFloat(txtCEPEditar.Text) < CepInicial) or
     (StrToFloat(txtCEPEditar.Text) > CepFinal) then
  begin
    txtCEPEditar.SetFocus;
    Result := 'O CEP informado está fora dos parâmetros estabelecidos pela cidade ' + Cidade + '!';
    Exit;
  end;

  Result := '';
end;

procedure TfrmCadastroClientes.AddParametrosProcInserirCliente();
begin
  procInserirCliente.Parameters.ParamByName('@CGC_CPF_CLIENTE').Value := txtCPF.Text;
  procInserirCliente.Parameters.ParamByName('@NOME').Value            := UpperCase(txtNome.Text);
  procInserirCliente.Parameters.ParamByName('@TELEFONE').Value        := txtTelefone.Text;
  procInserirCliente.Parameters.ParamByName('@ENDERECO').Value        := UpperCase(txtEndereco.Text);
  procInserirCliente.Parameters.ParamByName('@BAIRRO').Value          := UpperCase(txtBairro.Text);
  procInserirCliente.Parameters.ParamByName('@COMPLEMENTO').Value     := UpperCase(txtComplemento.Text);
  procInserirCliente.Parameters.ParamByName('@EMAIL').Value           := UpperCase(txtEmail.Text);
  procInserirCliente.Parameters.ParamByName('@CEP').Value             := txtCEP.Text;
  procInserirCliente.Parameters.ParamByName('@CODIGO_CIDADE').Value   := Codigo_Cidade;
end;

procedure TfrmCadastroClientes.ObtemDadosCidade(Codigo_CidadeF: Integer;
                                                CidadeF, EstadoF: string;
                                                CepInicialF, CepFinalF: Double);
begin
  Codigo_Cidade := Codigo_CidadeF;
  Cidade        := CidadeF;
  Estado        := EstadoF;
  CepInicial    := CepInicialF;
  CepFinal      := CepFinalF;
end;

procedure TfrmCadastroClientes.pagConteudoChange(Sender: TObject);
begin
  inherited;

  if (pagConteudo.ActivePageIndex = 1) and (txtCodigoEditar.Text = '') then
  begin
    pnlBotoesEditar.Enabled := False;
    tabEditar.Enabled       := False;
  end;
end;

procedure TfrmCadastroClientes.AddParametrosProcAlterarCliente();
begin
  procAlterarCliente.Parameters.ParamByName('@CODIGO_CLIENTE').Value  := txtCodigoEditar.Text;
  procAlterarCliente.Parameters.ParamByName('@CGC_CPF_CLIENTE').Value := txtCPFEditar.Text;
  procAlterarCliente.Parameters.ParamByName('@NOME').Value            := UpperCase(txtNomeEditar.Text);
  procAlterarCliente.Parameters.ParamByName('@TELEFONE').Value        := txtTelefoneEditar.Text;
  procAlterarCliente.Parameters.ParamByName('@ENDERECO').Value        := UpperCase(txtEnderecoEditar.Text);
  procAlterarCliente.Parameters.ParamByName('@BAIRRO').Value          := UpperCase(txtBairroEditar.Text);
  procAlterarCliente.Parameters.ParamByName('@COMPLEMENTO').Value     := UpperCase(txtComplementoEditar.Text);
  procAlterarCliente.Parameters.ParamByName('@EMAIL').Value           := UpperCase(txtEmailEditar.Text);
  procAlterarCliente.Parameters.ParamByName('@CEP').Value             := txtCEPEditar.Text;
  procAlterarCliente.Parameters.ParamByName('@CODIGO_CIDADE').Value   := Codigo_Cidade;
end;

end.
