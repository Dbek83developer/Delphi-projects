unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, Grids, ExtCtrls,comobj, Spin;
const
   TCube :array [1..2,1..7] of string=(('0,1','0,2','0,5','1','3','3P','6P'),('5','10','20','40','0','120','240'));

type
  TForm2 = class(TForm)

    StringGrid1: TStringGrid;
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  vremya: array of string;
  war,watt:array of integer;
  Ua,temp,fhz:array of real;
  danniye:array[1..6,1..55]of string;
  metka,Kt,Kn:integer;
  klTT,klTN,klS:string;
  X,Y: Real;
implementation

uses Unit1,Math, Unit3;
procedure TT(k:Real;kl:string);
begin
 If kl='0,1' then begin
                   if k<=5 then begin
                                X:=0.1+(5-k)*0.4/5;
                                Y:=5+(5-k)*15/5;
                                end;
                   if (k>5)and(k<=20) then begin
                                 X:=0.1+(20-k)*0.2/15;
                                 Y:=5+(20-k)*7/15;
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=0.1+(100-k)*0.1/80;
                                  Y:=5+(100-k)*3/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=0.1+(120-k)*0.1/20;
                                  Y:=5+(120-k)*5/20;
                               end;
                   end;

If kl='0,2' then begin
                   if k<=5 then begin
                                X:=0.2+(5-k)*0.75/5;
                                Y:=10+(5-k)*30/5;
                                end;
                   if (k>5)and(k<=20) then begin
                                 X:=0.2+(20-k)*0.4/15;
                                 Y:=10+(20-k)*15/15;
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=0.2+(100-k)*0.15/80;
                                  Y:=10+(100-k)*5/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=0.2+(120-k)*0.2/20;
                                  Y:=10+(120-k)*10/20;
                               end;
                   end;

If kl='0,5' then begin
                   if k<=5 then begin
                                X:=0.5+(5-k)*1.5/5;
                                Y:=30+(5-k)*90/5;
                                end;
                   if (k>5)and(k<=20) then begin
                                 X:=0.5+(20-k)*0.75/15;
                                 Y:=30+(20-k)*45/15;
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=0.5+(100-k)*0.25/80;
                                  Y:=30+(100-k)*15/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=0.5+(120-k)*0.5/20;
                                  Y:=30+(120-k)*30/20;
                               end;
                   end;
If kl='1' then begin
                   if k<=5 then begin
                                X:=1+(5-k)*3/5;
                                Y:=60+(5-k)*180/5;
                                end;
                   if (k>5)and(k<=20) then begin
                                 X:=1+(20-k)*1.5/15;
                                 Y:=60+(20-k)*90/15;
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=1+(100-k)*0.5/80;
                                  Y:=60+(100-k)*30/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=1+(120-k)*1/20;
                                  Y:=60+(120-k)*60/20;
                               end;
                   end;
If kl='0,2S' then begin
                   if k<=1 then begin
                                X:=0.2+(1-k)*0.75;
                                Y:=10+(1-k)*30;
                                end;
                   if (k>1)and(k<=5) then begin
                                 X:=0.2+(5-k)*0.4/4;
                                 Y:=10+(5-k)*15/4;
                                 end;
                   if (k>5)and(k<=20) then begin
                                 X:=0.2+(20-k)*0.15/15;
                                 Y:=10+(20-k)*5/15;
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=0.2+(100-k)*0/80;
                                  Y:=10+(100-k)*0/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=0.2+(120-k)*0/20;
                                  Y:=10+(120-k)*0/20;
                               end;
                   end;
If kl='0,5S' then begin
                   if k<=1 then begin
                                X:=0.5+(1-k)*1.75;
                                Y:=30+(1-k)*90;
                                end;
                   if (k>1)and(k<=5) then begin
                                 X:=0.5+(5-k)*0.75/4;
                                 Y:=30+(5-k)*45/4;
                                 end;
                   if (k>5)and(k<=20) then begin
                                 X:=0.5+(20-k)*0.25/15;
                                 Y:=30+(20-k);
                                 end;
                   if (k>20)and(k<=100) then begin
                                  X:=0.5;//+(100-k)*0/80;
                                  Y:=30;//+(100-k)*0/80;
                               end;
                   if (k>100)and(k<=120) then begin
                                  X:=0.5;//+(120-k)*0/20;
                                  Y:=30;//+(120-k)*0/20;
                               end;
                   end;
end;


{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.close;
end;



procedure TForm2.BitBtn1Click(Sender: TObject);
var
v:real;
begin
metka:=metka+1;
//MaskEdit1.Text:=MaskEdit1.Text+'00:30';
StringGrid1.Cells[metka,1]:=MaskEdit1.Text;
StringGrid1.Cells[metka,2]:=SpinEdit1.Text;
StringGrid1.Cells[metka,3]:=SpinEdit2.Text;
v:=strtofloat(Edit1.Text);
StringGrid1.Cells[metka,4]:=FloatToStr(v);
v:=strtofloat(Edit2.Text);
StringGrid1.Cells[metka,5]:=FloatToStr(v);
v:=strtofloat(Edit3.Text);
StringGrid1.Cells[metka,6]:=FloatToStr(v);
end;

procedure TForm2.Button1Click(Sender: TObject);
var
i,j:integer;
begin
 for i:=1 to metka do
  for j:=1 to 6 do
 StringGrid1.Cells[i,j]:='';
metka:=0;
end;



procedure TForm2.Button2Click(Sender: TObject);
var
i,j,w,v:integer;
f3,f4,f10,f11,f12,ugltn,tg,tok,dT,n,m,s,tb9,dU,dK,delta,f16,dop,dW,Wa,f18,f19,f20,dWp,Wp:real;
cs,sinis:real;
begin
SetLength(vremya,metka);
SetLength(watt,metka);
SetLength(war,metka);
SetLength(Ua,metka);
SetLength(temp,metka);
SetLength(fhz,metka);
ugltn:=0;
s:=0;
tb9:=0;
Kt:=SpinEdit3.Value;
Kn:=SpinEdit4.Value;
klTT:=Edit4.Text;
klTN:=Edit5.text;
klS:=Edit6.text;

for i:=1 to 7 do
if klTN=tcube[1,i] then ugltn:=StrToFloat(tcube[2,i]);
for i:=0 to metka-1 do    //for1
 begin
  vremya[i]:=StringGrid1.Cells[i+1,1];
  danniye[i+1,1]:=StringGrid1.Cells[i+1,1];
  watt[i]:=StrToInt(StringGrid1.Cells[i+1,2]);
  danniye[i+1,2]:=StringGrid1.Cells[i+1,2];
  war[i]:=StrToInt(StringGrid1.Cells[i+1,3]);
  danniye[i+1,3]:=StringGrid1.Cells[i+1,3];
  Ua[i]:=StrToFloat(StringGrid1.Cells[i+1,4]);
  danniye[i+1,8]:=StringGrid1.Cells[i+1,4];
  temp[i]:=StrToFloat(StringGrid1.Cells[i+1,5]);
  danniye[i+1,9]:=StringGrid1.Cells[i+1,5];
  fhz[i]:=StrToFloat(StringGrid1.Cells[i+1,6]);
  danniye[i+1,10]:=StringGrid1.Cells[i+1,6];
 end; //end for1
 Wa:=0;
 dW:=0;
 dWp:=0;

for i:=1 to metka-1 do   //for2
 begin
 tg:=0;
 dK:=0;
 dop:=0;
  w:=watt[i]-watt[i-1];
  f3:=RoundTo(w*(1-0.01*0.25),-2);
  danniye[i,4]:=IntToStr(w);
  danniye[i,6]:=FloatToStr(f3);
  Wa:=Wa+f3;
  v:=war[i]-war[i-1];
  f4:=RoundTo(v*(1-0.01*0.25),-2);
  Wp:=Wp+f4;
  danniye[i,5]:=IntToStr(v);
  danniye[i,7]:=FloatToStr(f4);
 if w<>0 then tg:=RoundTo(v/w,-3);
  danniye[i,11]:=FloatToStr(tg);
  cs:=RoundTo(cos(ArcTan(tg)),-2);
  danniye[i,12]:=FloatToStr(cs);
  sinis:=roundto(Sin(ArcTan(tg)),-2);
  danniye[i,13]:=FloatToStr(sinis);
  dT:=0.5;
  danniye[i,14]:=floattostr(dT);
  tok:=roundto(1000*w/Ua[i-1]/cs/dT/Kt/Kn/3,-3);
  danniye[i,15]:=floattostr(tok);
  n:=100*tok/1;
  danniye[i,16]:=floattostr(n);
  m:=RoundTo(Ua[i-1]*tok*sinis/57.7/1,-3);
  danniye[i,17]:=floattostr(m);
  TT(n,klTT);
  danniye[i,18]:=floattostr(RoundTo(X,-3));
  danniye[i,19]:=floattostr(RoundTo(Y,-3));
  danniye[i,20]:=klTN;
  danniye[i,21]:=floattostr(ugltn);
  f10:=RoundTo(0.029*sqrt(Power(Y,2)+Power(ugltn,2))*tg,-2);
  danniye[i,22]:=floattostr(f10);
  f11:=RoundTo(0.029*sqrt(Power(Y,2)+Power(ugltn,2))/tg,-2);
  danniye[i,23]:=floattostr(f11);
  if (n>=1)and(n<5) then begin
                          if (klS='0,1')or(klS='0,2')or(klS='0,2S') then s:=0.4;
                          if (klS='0,5')or(klS='0,5S') then s:=1;
                         end;
  if (n>=5) then begin
                  if (klS='0,2')or(klS='0,2S') then s:=0.2;
                  if (klS='0,5')or(klS='0,5S') then s:=0.5;
                 end;
  if (n>=2)and(n<10) then begin
                          if (klS='0,1')or(klS='0,2')or(klS='0,2S') then tb9:=0.2+(0.5-s)*(1-cs)/0.5;
                          if (klS='0,5')or(klS='0,5S') then tb9:=0.5+(1-s)*(1-cs)/0.5;
                          end;
  if (n>=10) then begin
                          if (klS='0,1')or(klS='0,2')or(klS='0,2S') then tb9:=0.2+0.1*(1-cs)/0.5;
                          if (klS='0,5')or(klS='0,5S') then tb9:=0.5+0.1*(1-cs)/0.5;
                          end;
  danniye[i,24]:=floattostr(RoundTo(tb9,-3));
  f12:=RoundTo((StrToFloat(klS)*(0.9+0.02/m)),-3);
  danniye[i,25]:=floattostr(f12);
  {напряжение}
  dU:=roundto(100*abs(Ua[i-1]/57.7-1),-3);
   if (klS='0,1')or(klS='0,2')or(klS='0,2S') then dK:=RoundTo(0.1*(0.2+0.1*(1-cs)/0.5),-3);
   if (klS='0,5')or(klS='0,5S') then dK:=RoundTo(0.2*(0.5+0.2*(1-cs)/0.5),-3);
  delta:=RoundTo(dU*dK,-3);
  dop:=sqr(delta)+dop;
  danniye[i,26]:=floattostr(dU);
  danniye[i,27]:=floattostr(dK);
  danniye[i,28]:=floattostr(delta);
  {частота}
  dU:=RoundTo(100*abs(fhz[i-1]/50-1),-3);
   if (klS='0,1')or(klS='0,2')or(klS='0,2S') then dK:=RoundTo(0.1*(0.2+0.1*(1-cs)/0.5),-3);
   if (klS='0,5')or(klS='0,5S') then dK:=RoundTo(0.2*(0.5+0.2*(1-cs)/0.5),-3);
  delta:=RoundTo(dU*dK,-4);
  dop:=sqr(delta)+dop;
  danniye[i,29]:=floattostr(dU);
  danniye[i,30]:=floattostr(dK);
  danniye[i,31]:=floattostr(delta);
  {температура}
  dU:=abs(temp[i-1]-20);
   if (klS='0,1')or(klS='0,2')or(klS='0,2S') then dK:=RoundTo(0.01+0.01*(1-cs)/0.5,-3);
   if (klS='0,5')or(klS='0,5S') then dK:=RoundTo(0.03+0.02*(1-cs)/0.5,-3);
  delta:=RoundTo(dU*dK,-3);
  dop:=sqr(delta)+dop;

  f18:=RoundTo(0.05*f12*dU,-3);
  f19:=RoundTo(0.05*f12,-3);
  danniye[i,39]:=floattostr(f18);
  danniye[i,40]:=floattostr(f19);

  danniye[i,32]:=floattostr(dU);
  danniye[i,33]:=floattostr(dK);
  danniye[i,34]:=floattostr(delta);
  danniye[i,35]:=Edit7.Text;
  f16:=RoundTo(1.1*sqrt(sqr(X)+sqr(StrToFloat(klTN))+sqr(f10)+sqr(tb9)+dop+sqr(StrToFloat(Edit7.Text))),-2);
  danniye[i,36]:=floattostr(f16);
  danniye[i,37]:=floattostr(0.006);
  f20:=RoundTo(1.1*sqrt(sqr(X)+sqr(StrToFloat(klTN))+sqr(f11)+sqr(f12)+sqr(f18)+sqr(f19)+sqr(StrToFloat(Edit7.Text))),-2);
  danniye[i,41]:=floattostr(f20);
danniye[i,43]:=floattostr(f3);
danniye[i,44]:=floattostr(f4);
danniye[i,45]:=floattostr(2*f3);
danniye[i,46]:=floattostr(2*f4);
danniye[i,47]:=floattostr(0.006);
danniye[i,48]:=floattostr(f16);
danniye[i,49]:=floattostr(f20);
delta:=RoundTo(1.1*sqrt(sqr(f16)+sqr(0.006)),-2);
danniye[i,50]:=floattostr(delta);
delta:=RoundTo(1.1*sqrt(sqr(f20)+sqr(0.006)),-2);
danniye[i,51]:=floattostr(delta);
  dW:=f16*f3+dW;
  dWp:=f20*f4+dWp;
 end; //end for2
delta:=RoundTo(110*sqrt(sqr(0.01*dW/(Wa*1.1))+sqr(0.01*0.006)),-2);
danniye[6,38]:=floattostr(delta);
danniye[6,54]:=floattostr(delta);
delta:=RoundTo(110*sqrt(sqr(0.01*dWp/(Wp*1.1))+sqr(0.01*0.006)),-2);
danniye[6,42]:=floattostr(delta);
danniye[6,55]:=floattostr(delta);
delta:=RoundTo(Wa/2.5,-3);
danniye[6,52]:=floattostr(delta);
delta:=RoundTo(Wp/2.5,-3);
danniye[6,53]:=floattostr(delta);

Form2.Hide;
for i:=1 to 6 do
 for j:=1 to 55 do
Form3.StringGrid1.Cells[i,j]:=danniye[i,j];
form3.ShowModal;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
    ExcelApp,Sheet, Workbook, Range, Cell1, Cell2, ArrayData, ArrayData1  : Variant;
    S: String;
   BeginCol, BeginRow, i, j : integer;
   RowCount, ColCount : integer;
begin
     if OpenDialog1.Execute then S:=OpenDialog1.FileName;
     Cursor:=crHourGlass;

////////////////////////////////////////
   {S имя файла}
     try
  // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

  // Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

  //  Создаем Книгу (Workbook)
  //  Если заполняем шаблон, то Workbook := ExcelApp.WorkBooks.Add('C:\MyTemplate.xls');

  Workbook := ExcelApp.WorkBooks.Add(s);
 // Workbook := ExcelApp.WorkBooks.Add;

  Sheet := Workbook.Sheets.Item[2];
  Sheet.Cells[7,10]:=klTT;
  Sheet.Cells[12,10]:=klTN;
  Sheet.Cells[18,24]:=Edit7.Text;
  Sheet.Cells[26,20]:=klS;
      // Координаты левого верхнего угла области, в которую будем выводить данные
  BeginCol := 4;
  BeginRow := 5;

  // Размеры выводимого массива данных
  RowCount := 42;
  ColCount := 6;

////////////////////////{3 лист}//////////////////////////////
 Sheet := Workbook.Sheets.Item[3];
  // Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
  // ArrayData1 := VarArrayCreate([1, 11, 1,10], varVariant);
  Cursor:=crHourGlass;

  // Заполняем массив

 for i:=1 to 6 do
 for j:=1 to 42 do
ArrayData[J, I] :=danniye[i,j];

 // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[3].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[3].Cells[BeginRow  + RowCount - 1, BeginCol +
ColCount - 1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[3].Range[Cell1, Cell2];

  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения

  Range.Value := ArrayData;
   //////*******************{4 лист}*************//////////
   Sheet := Workbook.Sheets.Item[4];
   BeginCol:=4;
  BeginRow:=7;
  RowCount:=13;
  ColCount:=6;
   ArrayData1 := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
    // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[4].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[4].Cells[BeginRow  + RowCount - 1, BeginCol +
ColCount - 1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[4].Range[Cell1, Cell2];
  for i:=1 to 6 do
  Sheet.Cells[6,i+3]:= danniye[i,1];
  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения
   for i:=1 to 6 do
 for j:=43 to 55 do
ArrayData1[J-42,I] :=danniye[i,j];
  Range.Value := ArrayData1;

  //Sheet := Workbook.Sheets.Item[3];
//  Sheet.Cells[6,1]:=dm2.ad_q.Fields[7].AsString;  }


      // Делаем Excel видимым
        beep;
    // ExcelApp.Visible := true;
     except
   on Exception do
     begin
     Cursor:=crDefault;
     ExcelApp.quit;// := CloseOleObject('Excel.Application');
     ShowMessage('Ошибка!!!');
       end
       else
       ExcelApp.Visible := true;
     end;

  ExcelApp.Visible := true;
end;


///////////////////////////////////////









end.

