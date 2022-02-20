unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TForm1 = class(TForm)
    BtStart: TButton;
    BtReaction: TButton;
    Ed: TEdit;
    LBNumber: TListBox;
    LBBull: TListBox;
    LBCow: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LbAns: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    procedure BtStartClick(Sender: TObject);
    procedure BtReactionClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x,bull,cow: integer;
  s,number: string;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  LBNumber.Clear;
  LBBull.Clear;
  LBCow.Clear;
  BtStart.Enabled := True;
  Ed.Enabled := False;
  BtReaction.Enabled := False;
  Ed.Text:='';
  Form2.Show;
  Form1.Hide;
end;

procedure TForm1.BtReactionClick(Sender: TObject);
var i,j: Integer;
begin
  number := Ed.Text;
  if number = s then begin
    LbAns.Enabled := True;
    LbAns.Caption := '����������! �� ������� �����!';
    BtStart.Enabled := True;
    Ed.Enabled := False;
    BtReaction.Enabled := False;
  end
  else begin
    bull := 0;
    cow := 0;
    for i := 1 to 4 do
      for j := 1 to 4 do
        if s[i] = number[j] then
          if i=j then
            inc(bull)
          else inc(cow);
    LBNumber.Items.Add(number);
    LBBull.Items.Add(IntToStr(bull));
    LBCow.Items.Add(IntToStr(cow));
    Ed.Text:='';
  end;
end;

procedure TForm1.BtStartClick(Sender: TObject);
begin
  BtStart.Enabled := False;
  Ed.Enabled := true;
  BtReaction.Enabled := True;
  LbAns.Enabled := False;
  LbAns.Caption := '';
  LBNumber.Clear;
  LBBull.Clear;
  LBCow.Clear;
  Ed.Text:='';
  repeat
    x := random(8643)+1234;
    s := IntToStr(x)
  until (s[1]<>s[2]) and (s[1]<>s[3]) and (s[1]<>s[4]) and (s[2]<>s[3]) and (s[2]<>s[4]) and (s[3]<>s[4]);
end;


end.
