unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    InputNum: TEdit;
    NumLb: TLabel;
    AnsLb: TLabel;
    PopLb: TLabel;
    TimLb: TLabel;
    Lb: TLabel;
    Dia1Ed: TEdit;
    Dia2Ed: TEdit;
    NewBt: TButton;
    ReactBt: TButton;
    PopLab: TLabel;
    OtvLb: TLabel;
    Timer1: TTimer;
    Tim: TLabel;
    procedure NewBtClick(Sender: TObject);
    procedure ReactBtClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  p,number,i,t:integer;
implementation

{$R *.dfm}


procedure TMainForm.NewBtClick(Sender: TObject);
var a,b:integer;
begin
  OtvLb.Caption:='';
  randomize;
  a:=StrToInt(Dia1Ed.Text);
  b:=StrToInt(Dia2Ed.Text);
  number:=random(b-a+1)+a;
  p:=b-a;
  i:=0;
  while p > 0 do begin
    inc(i);
    p:=p div 2;
  end;
  ReactBt.Enabled:=true;
  InputNum.Enabled:=true;
  Dia1Ed.Enabled:=false;
  Dia2Ed.Enabled:=false;
  NewBt.Enabled:=false;
  Timer1.Enabled:=true;
  PopLab.Caption:=IntToStr(i);
  t:=10;
  Tim.Caption:=IntToStr(t);
end;

procedure TMainForm.ReactBtClick(Sender: TObject);
var ch:integer;
begin
  ch:=StrToInt(InputNum.Text);
  if ch = number then begin
    OtvLb.Caption:='�������!';
    ReactBt.Enabled:=false;
    InputNum.Enabled:=false;
    Dia1Ed.Enabled:=true;
    Dia2Ed.Enabled:=true;
    NewBt.Enabled:=true;
    Timer1.Enabled:=false;
    InputNum.Clear;
    PopLab.Caption:='';
    Tim.Caption:=''
  end
  else begin
    if ch > number then
      OtvLb.Caption:='���������� ����� ������'
      else
        OtvLb.Caption:='���������� ����� ������';
    InputNum.Clear;
    dec(i);
    PopLab.Caption:=IntToStr(i);
    t:=10;
    Tim.Caption:=IntToStr(t);
    if i = 0 then begin
        OtvLb.Caption:='���������!';
        ReactBt.Enabled:=false;
        InputNum.Enabled:=false;
        Dia1Ed.Enabled:=true;
        Dia2Ed.Enabled:=true;
        NewBt.Enabled:=true;
        Timer1.Enabled:=false;
        InputNum.Clear;
        PopLab.Caption:='';
        Tim.Caption:=''
    end;
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  t:=t-1;
  Tim.Caption:=IntToStr(t);
  if t=0 then begin
    dec(i);
    PopLab.Caption:=IntToStr(i);
    t:=10;
    Tim.Caption:=IntToStr(t);
  end;
  if i=0 then begin
        OtvLb.Caption:='���������!';
        ReactBt.Enabled:=false;
        InputNum.Enabled:=false;
        Dia1Ed.Enabled:=true;
        Dia2Ed.Enabled:=true;
        NewBt.Enabled:=true;
        Timer1.Enabled:=false;
        InputNum.Clear;
        PopLab.Caption:='';
        Tim.Caption:='';
  end;
end;

end.

