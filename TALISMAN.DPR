program Talisman;

uses
  Forms,
  Umain in 'UMAIN.PAS' {FrmMain};

{$R *.RES}

begin
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
