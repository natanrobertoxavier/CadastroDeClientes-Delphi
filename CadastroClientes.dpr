program CadastroClientes;

uses
  Vcl.Forms,
  uCadastroPadrao in 'uCadastroPadrao.pas' {frmCadastroPadrao},
  uDMCadastros in 'uDMCadastros.pas' {dmCadastros: TDataModule},
  uCadastroCidade in 'uCadastroCidade.pas' {frmCadastroCidade},
  uPesquisaPadrao in 'uPesquisaPadrao.pas' {frmPesquisaPadrao},
  uPesquisaCidade in 'uPesquisaCidade.pas' {frmPesquisaCidade},
  uCadastroCliente in 'uCadastroCliente.pas' {frmCadastroClientes},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCadastros, dmCadastros);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  Application.CreateForm(TfrmPesquisaPadrao, frmPesquisaPadrao);
  Application.CreateForm(TfrmPesquisaCidade, frmPesquisaCidade);
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.Run;
end.
