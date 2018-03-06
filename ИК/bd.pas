unit bd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, jpeg, ExtCtrls, ComCtrls, Buttons;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses datamoduleunit, Uasos;

{$R *.dfm}



procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form2.Close;
main.show;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
ComboBox2.Text:='';
ComboBox2.Items.Clear;
dm2.surov1.Active:=false;
dm2.surov1.Parameters.ParamByName('obyekt').Value:=ComboBox1.Text;
dm2.surov1.ExecSQL;
dm2.surov1.Active:=true;

dm2.ADOQuery2.Active:=false;
 dm2.ADOQuery2.Parameters.ParamByName('linkkey1').Value:=dm2.surov1.Fields[0].Value;
 dm2.ADOQuery2.ExecSQL;
 dm2.ADOQuery2.Active:=true;
 dm2.ADOQuery2.First;
 
  while dm2.ADOQuery2.Eof<>true do
     begin
 ComboBox2.Items.Add(dm2.ADOQuery2.Fields[2].Value);
     dm2.ADOQuery2.Next;
     end;
 ComboBox2.Visible:=true;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
 dm2.surov2.Active:=false;
 dm2.surov2.Parameters.ParamByName('pods').Value:=ComboBox2.Text;
 dm2.surov2.ExecSQL;
 dm2.surov2.Active:=true;

 dm2.ADOQuery3.Active:=false;
 dm2.ADOQuery3.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery3.ExecSQL;
 dm2.ADOQuery3.Active:=true;

  dm2.dsener.Enabled:=false;
  dm2.dsener.Enabled:=true;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if dm2.book.Modified then dm2.book.Post;
close;
end;

end.
