unit Uasos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, XPMan, jpeg;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    a1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Help1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;

implementation

uses Unit1, maindb, datamoduleunit,  bd;

{$R *.dfm}

procedure Tmain.N4Click(Sender: TObject);
begin
close;
end;

procedure Tmain.Button1Click(Sender: TObject);
begin
   if dm2.OpenDialog1.Execute then
  begin
    dm2.ADOConnection1.Close;
    dm2.ADOConnection1.ConnectionString:=Format(cstr, [dm2.OpenDialog1.FileName]);
    dm2.ADOConnection1.Open;
  end;
 Button2.Enabled:=true;
 Button3.Enabled:=true;
 Button4.Enabled:=true;
 dm2.tableobyekt.Active:=true;
 dm2.tableps.Active:=true;
 dm2.book.active:=true;


 end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm2.ADOConnection1.Close;
end;

procedure Tmain.Button2Click(Sender: TObject);
begin
 dm2.tableobyekt.First;
 TM_RET.ComboBox4.Items.Clear;
 while dm2.tableobyekt.Eof<>true do
     begin
     TM_RET.ComboBox4.Items.Add(dm2.tableobyekt.Fields[1].value);
     dm2.tableobyekt.Next;
     end;
     dm2.tableobyekt.First;

 main.Hide;
 TM_RET.DateTimePicker1.Date:=date;
 TM_RET.showmodal;
end;

procedure Tmain.Button3Click(Sender: TObject);
begin
 dbform.vaqt.Date:=date;
main.Hide;
dbform.showmodal;
end;

procedure Tmain.Button4Click(Sender: TObject);
begin
dm2.tableobyekt.First;
Form2.ComboBox1.Items.Clear;
 while dm2.tableobyekt.Eof<>true do
     begin
     Form2.ComboBox1.Items.Add(dm2.tableobyekt.Fields[1].value);
     dm2.tableobyekt.Next;
     end;
  dm2.dsener.Enabled:=false;
  dm2.dsener.Enabled:=true;
 main.Hide;
form2.showmodal;
end;

end.
