unit uDMCadastros;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmCadastros = class(TDataModule)
    adoConexao: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadastros: TdmCadastros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
