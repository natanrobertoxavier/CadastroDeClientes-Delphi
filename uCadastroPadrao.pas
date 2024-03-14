unit uCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmCadastroPadrao = class(TForm)
    pnlConteudo: TPanel;
    pagConteudo: TPageControl;
    tabCadastro: TTabSheet;
    tabEditar: TTabSheet;
    tabLista: TTabSheet;
    pnlBotoesCadastrar: TPanel;
    btnSalvarCadastrar: TButton;
    btnCancelarCadastrar: TButton;
    pnlBotoesEditar: TPanel;
    btnSalvarEditar: TButton;
    btnCancelarEditar: TButton;
    dbgLista: TDBGrid;
    pnlBotoesExcluir: TPanel;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnCancelarCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnCancelarCadastrarClick(Sender: TObject);
begin
  Close;
end;

end.
