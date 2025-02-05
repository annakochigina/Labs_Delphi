unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Start: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Reaction(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    { Public declarations }
  end;

var
  Form1: TForm1;
  list: Tlist;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  list := TList.Create;
end;


procedure TForm1.StartClick(Sender: TObject);
var i: Integer;
    Obj: TShape;
begin
  Start.Enabled := False;
  Timer1.Enabled := True;
  for i := 0 to list.Count-1 do begin
    Obj:=list[i];
    Obj.Free;
  end;
end;

procedure TForm1.Reaction(Sender:TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Obj1,Obj : TShape;
    R,Rect3: TRect;
    flag: boolean;
    i,k: integer;
begin
  Obj:= Sender as TShape;
  k := list.IndexOf(Obj);
  R:= Rect(Obj.left, Obj.top, Obj.left+Obj.width, Obj.top+Obj.height);
  flag := true;
  for i := k+1 to list.Count-1 do begin
    Obj1:=list[i];
    if intersectrect(Rect3,R, Rect(Obj1.Left, Obj1.Top, Obj1.Left+Obj1.Width, Obj1.Top+Obj1.Height)) then
        flag := false;
  end;
  if flag then begin
      Obj.Free;
      list.Delete(k);
  end;
  if list.Count = 0 then begin
      Timer1.Enabled := false;
      Label1.Caption := '����������! �� ��������!';
      Start.Enabled := true;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var Pn: TShape;
    k: integer;
begin
  Pn := TShape.Create(Panel1);
  Pn.Parent:=Panel1;
  k := random(2);
  case k of
    0: begin
        Pn.Width:= 75;
        Pn.Height:=150;
        end;
    1: begin
        Pn.Width:= 150;
        Pn.Height:= 75;
        end;
  end;
  Pn.Left := random(Panel1.Width - Pn.Width);
  Pn.Top := random(Panel1.Height - Pn.Height);
  Pn.Brush.Color:= RGB(random(255),random(255),random(255));
  list.Add(Pn);
  Pn.OnMouseDown := Reaction;
end;
end.
