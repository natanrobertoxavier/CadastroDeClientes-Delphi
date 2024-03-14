unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Cidade1: TMenuItem;
    procedure Cidade1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses  uCadastroCliente, uCadastroCidade;


procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
  frmCadastroCidade.ShowModal;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadastroClientes.ShowModal;
end;

end.
