unit sort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Grids, ValEdit,comobj, TeEngine, Series, TeeProcs, Chart;

type
  Tsetka = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    SpinEdit4: TSpinEdit;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    bb_ok: TButton;
    Label6: TLabel;
    Edit3: TEdit;
    procedure ADOConnection1AfterDisconnect(Sender: TObject);
    procedure ADOConnection1AfterConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
 // cstr = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False';
//  h:array[1..20]of double=(1.46,1.46,1.46,1.46,1.67,1.82,1.94,2.03,2.11,2.18,2.23,2.29,2.33,2.37,2.41,2.44,2.48,2.50,2.53,2.56);
    h:array[1..20]of double=(2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56);
  t=1.96;
var
  setka: Tsetka;
   N, D: Integer;
  arr: array [1..5, 1..4, 1..22] of Double;
  A1, A2,Aur, MinFarq, MaxFarq: Double;
  dmas:array of double;
  minim,maxs,znch:real;
  p,buf:string;
  danniye:array [1..22,1..20]of real;
  ArrayData, ArrayData1 :Variant;
  Sum_o,Sum_p,PZnach,  OZnach, A, B,summa: Double;
  x,xp,xo,sko,qavs,u,ssp,Hv,dis:real;
  nij,verx:real;
 implementation

uses datamoduleunit,  Math, Uasos;

{$R *.dfm}

function min(mas:array of real;n:integer):real;
var
i:integer;
kichik:real;
begin
kichik:=mas[0];
for i:=1 to n-1 do
if kichik>mas[i] then kichik:=mas[i];
result:=kichik;
end;

function max(mas:array of real;n:integer):real;
var
i:integer;
katta:real;
begin
katta:=mas[0];
for i:=1 to n-1 do
if katta<mas[i] then katta:=mas[i];
result:=katta;
end;

function sum(mas:array of real;n:integer):real;
var
i:integer;
katta:real;
begin
katta:=0;
for i:=0 to n-1 do
katta:=abs(mas[i])+katta;
result:=katta;
end;

procedure Tsetka.ADOConnection1AfterDisconnect(Sender: TObject);
begin
  GroupBox1.Enabled:=False;
end;

procedure Tsetka.bb_okClick(Sender: TObject);
var
s:string;
f:textfile;
i,qmt,q,ust:integer;

begin
   if dm2.OpenDialog1.Execute then
  begin
s:=dm2.OpenDialog1.FileName;
   AssignFile(f,s);
   try
       Reset(f);  // открыть для чтения
  Readln(f,buf);
  Readln(f,p);
  Readln(f,minim);
  Readln(f,maxs);
  Readln(f,N);
  SetLength(dmas,N);
  for i := 0 to N - 1 do
    Readln(f,dmas[i]);
 setka.Edit1.Text:=floattostr(minim);
 setka.Edit2.Text:=floattostr(maxs);
 setka.Edit3.Text:=floattostr(N);
 i:=1;
 ust:=1;
 qmt:=2*N*20;

 repeat

 q:=1;
 repeat
 readln(f,znch);
 danniye[q,ust]:=znch;      //zapis dannix v  Массив
 q:=q+1;
 i:=i+1;
   until q=2*N+1;
 ust:=ust+1;
 until i=qmt+1;
   except
        on EInOutError do
        begin
            ShowMessage('Ошибка доступа к файлу '+
                            s);
            exit;
        end;

   end;  CloseFile(f);
  end;

end;

procedure Tsetka.ADOConnection1AfterConnect(Sender: TObject);
begin
  GroupBox1.Enabled:=True;
end;

procedure Tsetka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//dm2.del_jimm.ExecSQL;
main.Show;
end;

procedure Tsetka.Button2Click(Sender: TObject);

var
  I,s,z,kz: Integer;
  D: Integer;
  masn,masv,man,mav,xpsred,xosred,qiymat,sum_n,sum_v,rezn,
  Sum_pN,Sum_oN,rezv,xizm,xd,dznach:array of real;
 label 7,8,9,10,11;
begin
      x:=0;
      D:=SpinEdit4.Value;
      A1:=StrToFloat(edit1.text);
      A2:=StrToFloat(edit2.text);

   if (A1>=0)or(A2=0)or(A1<0) then       // расчет нереверсивних каналов
      begin
      Aur:=abs(A2-A1)/(N-1);
        MinFarq:=Abs((100-D)*Aur/100);
        MaxFarq:=Abs((100+D)*Aur/100);
  // Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, 2*N, 1, 20], varVariant);
   ArrayData1 := VarArrayCreate([1, 11, 1,10], varVariant);
    x:=dmas[0];
    setlength(man,N);
    setlength(mav,N);
    setlength(xd,N);
    setlength(xpsred,N);
    setlength(xosred,N);
    setlength(Sum_pN,N);
    setlength(Sum_oN,N);
    SetLength(qiymat,39);
    SetLength(masn,N);
    SetLength(masv,N);
    SetLength(rezn,N);
    SetLength(rezv,N);
    SetLength(sum_n,N);
    SetLength(sum_v,N);
    SetLength(xizm,N);
    SetLength(dznach,19);

   for s:=1 to N do
       begin
     xp:=0;
     qavs:=0;
     Sum_p:=0;
        for i:=1 to 20 do             // for 2
        begin
         qiymat[i]:=danniye[s,i];
         ArrayData[2*s-1, i] :=qiymat[i];
         dznach[i]:=abs(x-qiymat[i]);
         xp:=(qiymat[i]+xp);
            qavs:=qavs+qiymat[i]-xp/i;
            sko:=sqrt(abs(qavs)/19);
                   if sko<>0 then begin
                          u:=((xp/i)-qiymat[i])/sko;
                          if u>h[i] then begin
                                     if (i<>0)and(i<>1) then qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2
                                                                                   else //begin
                                                     qiymat[i]:=xp/20;
                                          end;
                                  end;

        end; // for 2
             xd[s-1]:=x;
             xpsred[s-1]:=xp/20;
             x:=dmas[s];
//      end;

           for I := 1 to 20 do     //for 3
                            begin
                            PZnach:=qiymat[i]-xpsred[s-1];
                            Sum_p:=Sum_p+sqr(PZnach);
                            end;          //for 3
                     Sum_pN[s-1]:=Sum_p;
      end;   //for
//      s:=0;
      s:=2*N;
      kz:=1;
      z:=1;
      xo:=0;
      qavs:=0;
      Sum_o:=0;
        repeat
      xo:=0;
      qavs:=0;
      Sum_o:=0;
        x:=xd[kz-1];
        kz:=kz+1;
        for i:=1 to 20 do             // for 4      obratniy xod
        begin
         qiymat[i]:=danniye[s,i];
         ArrayData[2*(kz-1), i] :=qiymat[i];
         dznach[i]:=abs(x-qiymat[i]);
         xo:=(qiymat[i]+xo);
            qavs:=qavs+qiymat[i]-xo/i;
            sko:=sqrt(abs(qavs)/19);
                   if sko<>0 then begin
                          u:=((xo/i)-qiymat[i])/sko;
                          if u>h[i] then begin
                                     if (i<>0)and(i<>1) then qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2
                                                                                   else //begin
                                                     qiymat[i]:=xo/20;
                                          end;
                                  end;
        end; // for 4
         xosred[z-1]:=xo/20;
           for I := 1 to 20 do     //for 5
                            begin
                            OZnach:=qiymat[i]-xosred[z-1];
                            Sum_o:=Sum_o+sqr(OZnach);
                            end;          //for 5
        

         Sum_oN[z-1]:=Sum_o;
         s:=s-1;
        z:=z+1;
        until s=N;

     // z:=1;

      for z := 1 to N do        // for 6
      begin
     nij:=0;
     verx:=0;

       {xp/20 i xo/20 sredne arifmeticheskoye }
       xizm[z-1]:=(xpsred[z-1]+xosred[z-1])/2;
       ssp:=roundto((((xpsred[z-1]-xd[z-1])+(xosred[z-1]-xd[z-1]))/2),-5);
       Hv:=roundto(abs(xpsred[z-1]-xosred[z-1]),-5);
       dis:=roundto(((Sum_oN[z-1]+Sum_pN[z-1])/39),-5);

       If RadioButton1.Checked then
       begin
       nij:=ssp-t*sqrt(dis+sqr(Hv)/12);
       verx:=ssp+t*sqrt(dis+sqr(Hv)/12);

       masn[z-1]:=roundto(nij,-5);
       masv[z-1]:=roundto(verx,-5);
   ArrayData1[z,1]:=xd[z-1];
   ArrayData1[z,2]:=xpsred[z-1];
   ArrayData1[z,3]:=xosred[z-1];
   ArrayData1[z,4]:=ssp;
   ArrayData1[z,5]:=dis;
   ArrayData1[z,6]:=roundto((sqrt(dis)),-5);
   ArrayData1[z,7]:=Hv;
   ArrayData1[z,8]:=sqr(Hv)/12;
   ArrayData1[z,9]:=nij;
   ArrayData1[z,10]:=verx;
//   z:=z+1;
      end;
      //{ summa:=summa+x;
       sum_n[z-1]:=roundto(xd[z-1]*nij,-5);
       sum_v[z-1]:=roundto(xd[z-1]*verx,-5);

       end;  // for 6
      {MNK yesli SKO to etu chast ubrat nado}

    {   A:=(sum(sum_n,N)-sum(masn,N)*sum(xd,N)/N)/(sum(xd,N)*sum(xd,N)/N);
       B:=(sum(masn,N)-sum(xd,N)*A)/N;
       for s := 0 to N - 1 do
          rezn[s]:=B+A*xizm[s];
       A:=(sum(sum_v,N)-sum(masv,N)*sum(xd,N)/N)/(sum(xd,N)*sum(xd,N)/N);
       B:=(sum(masv,N)-sum(xd,N)*A)/N;
       for s := 0 to N - 1 do
          rezv[s]:=B+A*xizm[s];   // MNK     }

 //      dm2.i_chegara.Active:=false;
  {     nij:=min(man,N);
       verx:=max(mav,N); }
       nij:=min(rezn,N);
       verx:=max(rezv,N);
      //end;
     // end;

     end;   //end  расчет нереверсивних каналов    ShowMessage('Всё');

  ShowMessage('Всё');
 end;
procedure Tsetka.Button3Click(Sender: TObject);
var
    ExcelApp,Sheet, Workbook, Range, Cell1, Cell2 : Variant;
    S: String;
   BeginCol, BeginRow{, i, z }: integer;
   RowCount, ColCount : integer;
begin

      if dm2.OpenDialog1.Execute then S:=dm2.OpenDialog1.FileName;
 Cursor:=crHourGlass;
      A1:=StrToFloat(edit1.text);
      A2:=StrToFloat(edit2.text);

            {if RadioGroup1.Buttons[0].Checked then N:=5;
              if RadioGroup1.Buttons[1].Checked then N:=6;    }
      try
   //  dm2.book.Active:=true;
  // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

  // Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

  //  Создаем Книгу (Workbook)
  //  Если заполняем шаблон, то Workbook := ExcelApp.WorkBooks.Add('C:\MyTemplate.xls');
  Workbook := ExcelApp.WorkBooks.Add(s);
 // Workbook := ExcelApp.WorkBooks.Add;


  Sheet := Workbook.Sheets.Item[1];
  Sheet.Cells[10,2]:=buf;//dm2.ad_q.Fields[3].AsString;
  Sheet.Cells[10,3]:=floattostr(minim)+':'+floattostr(maxs);//dm2.ad_q.Fields[4].AsString;
      // Координаты левого верхнего угла области, в которую будем выводить данные
  BeginCol := 6;
  BeginRow := 16;

  // Размеры выводимого массива данных
  RowCount := 2*N;
  ColCount := 20;

Sheet.Cells[10,5]:=nij;
Sheet.Cells[11,5]:=verx;
Sheet.Cells[10,9]:=nij*100/(maxs-minim);
Sheet.Cells[11,9]:=verx*100/(maxs-minim);

 Sheet := Workbook.Sheets.Item[2];
 Sheet.Cells[3,17]:=floattostr(minim)+':'+floattostr(maxs);
 Sheet.Cells[3,2]:='Измерительный канал: '+buf;
 Sheet.Cells[3,24]:=p;

  Cursor:=crHourGlass;
  // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[2].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[2].Cells[BeginRow  + RowCount-1, BeginCol +
ColCount-1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[2].Range[Cell1, Cell2];

  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения

  Range.Value := ArrayData;

   BeginCol:=2;
  BeginRow:=7;
  RowCount:=N;
  ColCount:=10;

    // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[3].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[3].Cells[BeginRow  + RowCount - 1, BeginCol +
ColCount - 1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[3].Range[Cell1, Cell2];

  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения

  Range.Value := ArrayData1;

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

end.


