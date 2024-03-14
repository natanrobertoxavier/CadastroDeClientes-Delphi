unit uPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPesquisaPadrao = class(TForm)
    pnlBotoes: TPanel;
    pnlConteudo: TPanel;
    dbGrid: TDBGrid;
    pnlPesquisar: TPanel;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    btnNovo: TButton;
    Label1: TLabel;
    txtFiltrar: TEdit;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

procedure TfrmPesquisaPadrao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
