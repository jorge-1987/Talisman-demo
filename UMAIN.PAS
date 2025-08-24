unit Umain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls;

type
  TFrmMain = class(TForm)
    ImgBackground: TImage;
    MemTexto: TMemo;
    ImgPj1: TImage;
    ImgPj2: TImage;
    BtnAction1: TButton;
    BtnAction2: TButton;
    BtnAction3: TButton;
    LblName: TLabel;
    GbItems: TGroupBox;
    LblPlace: TLabel;
    MemEscena: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BtnAction1Click(Sender: TObject);
    procedure BtnAction2Click(Sender: TObject);
    procedure BtnAction3Click(Sender: TObject);

  private
    { Private declarations }
    IntIndice : integer;
    idx1 : integer;
    idx2 : integer;
    idx3 : integer;
    StrPj1 : string;
    StrPj2 : string;
    StrBack : string;
  public
    { Public declarations }
    procedure ChangeScene(idx : integer);
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.DFM}



procedure TFrmMain.FormShow(Sender: TObject);
begin
  MemEscena.Lines.LoadFromFile('escena2.txt');
  {Aca cargar la primer escena}
  IntIndice := 0;
  StrPj1 := '';
  StrPj2 := '';
  StrBack := '';
  {Llamar al procedimiento de carga}
  ChangeScene(IntIndice);
end;

procedure TFrmMain.ChangeScene(idx : integer);
begin
  if (MemEscena.Lines[(idx*14)+1] <> StrBack) then
  begin
    StrBack := MemEscena.Lines[(idx*14)+1];
    LblPlace.Caption := IntToStr((idx*14)+1);
    ImgBackground.Picture.LoadFromFile(StrBack);
  end;

  if (MemEscena.Lines[(idx*14)+2] <> StrPj1) then
  begin
    StrPj1 := MemEscena.Lines[(idx*14)+2];
    if (StrPj1 = '-') then
    begin
      ImgPj1.Visible := False;
    end else
    begin
      ImgPj1.Visible := True;
      ImgPj1.Picture.LoadFromFile(StrPj1);
    end;
  end;

  if (MemEscena.Lines[(idx*14)+3] <> StrPj2) then
  begin
    StrPj2 := MemEscena.Lines[(idx*14)+3];
    if (StrPj2 = '-') then
    begin
      ImgPj2.Visible := False;
    end else
    begin
      ImgPj2.Visible := True;
      ImgPj2.Picture.LoadFromFile(StrPj2);
    end;
  end;

  LblName.Caption := MemEscena.Lines[(idx*14)+10];
  MemTexto.Lines[0] := MemEscena.Lines[(idx*14)+11];
  MemTexto.Lines[1] := MemEscena.Lines[(idx*14)+12];
  MemTexto.Lines[2] := MemEscena.Lines[(idx*14)+13];

  if (MemEscena.Lines[(idx*14)+4] = '-') then
  begin
    BtnAction1.Visible := False;
  end else
  begin
    BtnAction1.Visible := True;
    BtnAction1.Caption := MemEscena.Lines[(idx*14)+4];
    idx1 := StrToInt(MemEscena.Lines[(idx*14)+5]);
  end;

  if (MemEscena.Lines[(idx*14)+6] = '-') then
  begin
    BtnAction2.Visible := False;
  end else
  begin
    BtnAction2.Visible := True;
    BtnAction2.Caption := MemEscena.Lines[(idx*14)+6];
    idx2 := StrToInt(MemEscena.Lines[(idx*14)+7]);
  end;

  if (MemEscena.Lines[(idx*14)+8] = '-') then
  begin
    BtnAction3.Visible := False;
  end else
  begin
    BtnAction3.Visible := True;
    BtnAction3.Caption := MemEscena.Lines[(idx*14)+8];
    idx3 := StrToInt(MemEscena.Lines[(idx*14)+9]);
  end;
end;

procedure TFrmMain.BtnAction1Click(Sender: TObject);
begin
  ChangeScene(idx1);
end;

procedure TFrmMain.BtnAction2Click(Sender: TObject);
begin
  ChangeScene(idx2);
end;

procedure TFrmMain.BtnAction3Click(Sender: TObject);
begin
  ChangeScene(idx3);
end;

end.
