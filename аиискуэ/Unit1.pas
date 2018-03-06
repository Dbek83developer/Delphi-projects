unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
//    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
begin
 Form1.hide;
 form2.Show;
 Form2.StringGrid1.Cells[0,1]:='t';
 Form2.StringGrid1.Cells[0,3]:='Wp';
 Form2.StringGrid1.Cells[0,2]:='Wa';
 Form2.StringGrid1.Cells[0,4]:='Ua';
 Form2.StringGrid1.Cells[0,5]:='T';
 Form2.StringGrid1.Cells[0,6]:='f';
 Form2.StringGrid1.Cells[1,0]:='1';
 Form2.StringGrid1.Cells[2,0]:='2';
 Form2.StringGrid1.Cells[3,0]:='3';
 Form2.StringGrid1.Cells[4,0]:='4';
 Form2.StringGrid1.Cells[5,0]:='5';
 Form2.StringGrid1.Cells[6,0]:='6';  
end;

end.
