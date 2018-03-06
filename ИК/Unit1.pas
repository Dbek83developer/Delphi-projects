unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls, ComCtrls,Grids, DBGrids,comobj, Mask, Spin;

type
  TTM_RET = class(TForm)
    bb_ok: TButton;
    ed_time: TMaskEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    bb_clear: TButton;
    ComboBox2: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    MaskEdit1: TMaskEdit;
    kolblock: TSpinEdit;
    Label6: TLabel;
    Panel1: TPanel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    minus: TCheckBox;
    procedure bb_okClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure bb_clearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ed_timeChange(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TM_RET: TTM_RET;
  sd:TStringList;
  UntypedFile: File;
  fcopy:TextFile;
  dbuffer:array[0..6] of byte;
  buffer:array[0..3] of single;
  mas2,mas65:array of  single;
  //vremya:array of string;
  dmas:array of integer;
  BytesRead,BytesWritten,TotalRead,NumrecsRead:integer;
  FSize,bosh,oxiri:Integer;
  implementation

uses DateUtils, ConvUtils, datamoduleunit, Uasos, Math, TypInfo,sort, DB;

{$R *.dfm}

procedure TTM_RET.bb_okClick(Sender: TObject);
var
i,k,k8,b2,b,e,day:integer;
mas:array[1..2160]of integer;
s:string;
da:boolean;
//kvant:real;
begin
forma.RadioButton2.Checked:=true;
i:=0;
k:=0;
 if bosh<=21590 then i:=0;
 if (bosh>21590)and(bosh<=43190) then i:=1;
 if (bosh>43190)and(bosh<=64790) then i:=2;
 if (bosh>64790)and(bosh<=86390) then i:=3;
 if oxiri<=21590 then k:=3;
 if (oxiri>21590)and(oxiri<=43190) then k:=2;
 if (oxiri>43190)and(oxiri<=64790) then k:=1;
 if (oxiri>64790)and(oxiri<=86390) then k:=0;
   day:=DayOfWeek(DateTimePicker1.Date);
   ComboBox1.ItemIndex:=day*4-4+i;
   ComboBox2.ItemIndex:=day*4-1-k;
   ComboBox1.Visible:=true;
   ComboBox2.Visible:=true;
     try
    Cursor:=crHourglass;
    da:=false;
    dm2.ADOQuery1.Active:=false;
    dm2.ADOQuery1.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
    dm2.ADOQuery1.Parameters.ParamByName('block').Value:=strtoint(Edit1.Text);
    dm2.ADOQuery1.ExecSQL;
    dm2.ADOQuery1.Active:=true;
    dm2.ad_q.Active:=false;
    dm2.ad_q.Parameters.ParamByName('k').Value:=dm2.surov2.Fields[0].Value;
    dm2.ad_q.Parameters.ParamByName('nom').Value:=dm2.ADOQuery1.Fields[3].AsString;
    dm2.ad_q.Parameters.ParamByName('znak').Value:=dm2.ADOQuery1.Fields[2].AsString;
    dm2.ad_q.ExecSQL;
    dm2.ad_q.Active:=true;

    if dm2.ad_q.Fields[2].AsString='P' then forma.Caption:='Активной мощности электрического тока';
    if dm2.ad_q.Fields[2].AsString='Q' then forma.Caption:='Реактивной мощности электрического тока';
    if dm2.ad_q.Fields[2].AsString='I' then forma.Caption:='Силы электрического тока';
    if dm2.ad_q.Fields[2].AsString='F' then forma.Caption:='Частоты электрического тока';
    if dm2.ad_q.Fields[2].AsString='U' then forma.Caption:='Напряжения электрического тока';


 if strtoint(ComboBox1.Text)<=strtoint(ComboBox2.Text) then
 if ComboBox1.ItemIndex<>ComboBox2.ItemIndex then
 begin
 b:=ComboBox1.ItemIndex;
 e:=ComboBox2.ItemIndex;
 for k:=b to e do
  begin
  ComboBox1.ItemIndex:=k;
  s:=ComboBox1.Text;
  AssignFile(UntypedFile, 'TM_RET'+s+'.DAT');
  Reset(UntypedFile,1);
//  kvant:=1;
  TotalRead:=0;
  FSize:=filesize(UntypedFile);
  b2:=0;
  k8:=StrToInt(Edit1.Text);
  SetLength(dmas,7*FSize div ((kolblock.Value+1)*7));
  SetLength(mas2,FSize div (kolblock.Value*7+7));
 repeat
 Seek(UntypedFile,b2*(kolblock.Value*7+7));
 BlockRead(UntypedFile,dBuffer,7,BytesRead);
 i:=0;
 if  dbuffer[i+5]<>0 then
 begin
 dmas[b2]:=dbuffer[i]*3600+dbuffer[i+1]*60+dbuffer[i+2];//+(dbuffer[i+3]-1)*360*24;//+DaysInAYear(dbuffer[i+4]-1)*24*360;
 end;
  Seek(UntypedFile,k8*7+b2*(kolblock.Value*7+7));
 BlockRead(UntypedFile,Buffer,sizeof(buffer),BytesRead);
 { if dm2.ad_q.Fields[11].AsString='TM-512' then kvant:=(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].asfloat)/250;
  if dm2.ad_q.Fields[11].AsString='МКТ-1' then kvant:=(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)/125;
 {if ((buffer[i]/kvant)-round(buffer[i]/kvant))=0 then}
 if not minus.Checked then  mas2[b2]:=buffer[i]
 else mas2[b2]:=buffer[i]*(-1);
  Cursor:=crsqlwait;
  if dmas[b2]>=bosh then da:=true;
  if dmas[b2]>=oxiri then da:=false;


  if da then begin
       if dmas[b2]<>0 then begin
                             dm2.insert.Parameters.ParamByName('data').Value:=dmas[b2];
                             dm2.insert.Parameters.ParamByName('energobyekt').Value:=dm2.ad_q.Fields[0].AsInteger;
                             if dm2.ad_q.Fields[2].AsString='F' then dm2.insert.Parameters.ParamByName('znach').Value:=mas2[b2]/100
                             else  dm2.insert.Parameters.ParamByName('znach').Value:=mas2[b2];
                             dm2.insert.ExecSQL;
                           end;


         if mas2[b2]<>mas2[b2-1] then
                          begin
                             mas[b2]:=dmas[b2];
                             dm2.ins_jimm.Parameters.ParamByName('data').Value:=dmas[b2];
                             dm2.ins_jimm.Parameters.ParamByName('energobyekt').Value:=dm2.ad_q.Fields[0].AsInteger;
                             if dm2.ad_q.Fields[2].AsString='F' then dm2.ins_jimm.Parameters.ParamByName('znach').Value:=mas2[b2]/100
                             else dm2.ins_jimm.Parameters.ParamByName('znach').Value:=mas2[b2];                             dm2.ins_jimm.ExecSQL;
                          end;


             end;
     b2:=b2+1;
    until b2=2160;
   end;
  end

  else
    begin
 s:=ComboBox1.Text;
AssignFile(UntypedFile, 'TM_RET'+s+'.DAT');
Reset(UntypedFile,1);

 TotalRead:=0;
 FSize:=filesize(UntypedFile);
 b2:=0;k8:=StrToInt(Edit1.Text);
 SetLength(dmas,7*FSize div (kolblock.Value*7+7));
 SetLength(mas2,FSize div (kolblock.Value*7+7));
 repeat
 Seek(UntypedFile,b2*(kolblock.Value*7+7));
 BlockRead(UntypedFile,dBuffer,7,BytesRead);
 i:=0;
 if  dbuffer[i+5]<>0 then
 dmas[b2]:=dbuffer[i]*3600+dbuffer[i+1]*60+dbuffer[i+2];//+(dbuffer[i+3]-1)*360*24;//+DaysInAYear(dbuffer[i+4]-1)*24*360;

 Seek(UntypedFile,k8*7+b2*(kolblock.Value*7+7));
 BlockRead(UntypedFile,Buffer,sizeof(buffer),BytesRead);
 i:=0;
 if not minus.Checked then  mas2[b2]:=buffer[i]
 else mas2[b2]:=buffer[i]*(-1);
   Cursor:=crsqlwait;
  if dmas[b2]>=bosh then da:=true;
  if dmas[b2]>=oxiri then da:=false;


  if da then begin
  if dmas[b2]<>0 then begin
                      dm2.insert.Parameters.ParamByName('data').Value:=dmas[b2];
                      dm2.insert.Parameters.ParamByName('energobyekt').Value:=dm2.ad_q.Fields[0].AsInteger;
                      if dm2.ad_q.Fields[2].AsString='F' then dm2.insert.Parameters.ParamByName('znach').Value:=mas2[b2]/100
                      else  dm2.insert.Parameters.ParamByName('znach').Value:=mas2[b2];
                      dm2.insert.ExecSQL;
                      end;


  if mas2[b2]<>mas2[b2-1] then
                          begin
                      mas[i]:=dmas[i];
                      dm2.ins_jimm.Parameters.ParamByName('data').Value:=dmas[b2];
                      dm2.ins_jimm.Parameters.ParamByName('energobyekt').Value:=dm2.ad_q.Fields[0].AsInteger;
                      if dm2.ad_q.Fields[2].AsString='F' then dm2.ins_jimm.Parameters.ParamByName('znach').Value:=mas2[b2]/100
                      else dm2.ins_jimm.Parameters.ParamByName('znach').Value:=mas2[b2];
                      dm2.ins_jimm.ExecSQL;
                           end;
              end;// if da
    b2:=b2+1;
 until b2=2160;

     end;
 finally
 CloseFile(UntypedFile);
 Label3.Visible:=true;


  Cursor:=crDefault;
 dm2.exp.Active:=true;
 forma.SpinEdit1.Value:=dm2.ad_q.Fields[5].AsInteger;
 forma.SpinEdit2.Value:=dm2.ad_q.Fields[6].AsInteger;
 if (dm2.ad_q.Fields[5].AsInteger>=0)and(dm2.ad_q.Fields[6].AsInteger<>0) then begin
                                          forma.ValueListEditor1.Refresh;
                                          forma.ValueListEditor1.Row:=7;
                                          forma.ValueListEditor1.Cells[0,1]:='0';
                                          forma.ValueListEditor1.Cells[0,2]:='1';
                                          forma.ValueListEditor1.Cells[0,3]:='2';
                                          forma.ValueListEditor1.Cells[0,4]:='3';
                                          forma.ValueListEditor1.Cells[0,5]:='4';
                                          forma.ValueListEditor1.Cells[0,6]:='5';
                                          forma.ValueListEditor1.Cells[1,1]:='0';
                                          forma.ValueListEditor1.Cells[1,2]:='1';
                                          forma.ValueListEditor1.Cells[1,3]:='2';
                                          forma.ValueListEditor1.Cells[1,4]:='3';
                                          forma.ValueListEditor1.Cells[1,5]:='4';
                                          forma.ValueListEditor1.Cells[1,6]:='5';
                                         end
                                         else
                                          begin
                                          forma.ValueListEditor1.Refresh;
                                          forma.ValueListEditor1.Row:=7;
                                          forma.ValueListEditor1.Cells[0,1]:='-5';
                                          forma.ValueListEditor1.Cells[0,2]:='-4';
                                          forma.ValueListEditor1.Cells[0,3]:='-3';
                                          forma.ValueListEditor1.Cells[0,4]:='-2';
                                          forma.ValueListEditor1.Cells[0,5]:='-1';
                                          forma.ValueListEditor1.Cells[0,6]:='0';
                                          forma.ValueListEditor1.Cells[1,1]:='-5';
                                          forma.ValueListEditor1.Cells[1,2]:='-4';
                                          forma.ValueListEditor1.Cells[1,3]:='-3';
                                          forma.ValueListEditor1.Cells[1,4]:='-2';
                                          forma.ValueListEditor1.Cells[1,5]:='-1';
                                          forma.ValueListEditor1.Cells[1,6]:='0';
                                          end;
  forma.Button2.Enabled:=true;
  dm2.jimm.Close;
  dm2.jimm.Open;
  dm2.jimm.Active:=true;
  TM_RET.Hide;
  forma.ShowModal;

 end;
end;

procedure TTM_RET.ComboBox1Change(Sender: TObject);
begin
Label3.Visible:=false;
bb_ok.Enabled:=true;
end;

procedure TTM_RET.ComboBox3Change(Sender: TObject);
begin
 dm2.surov2.Active:=false;
 dm2.surov2.Parameters.ParamByName('pods').Value:=ComboBox3.Text;
 dm2.surov2.ExecSQL;
 dm2.surov2.Active:=true;

 dm2.ADOQuery4.Active:=false;
 dm2.ADOQuery4.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery4.ExecSQL;
 dm2.ADOQuery4.Active:=true;
end;

procedure TTM_RET.ComboBox4Change(Sender: TObject);
begin
ComboBox3.Text:='';
ComboBox3.Items.Clear;
dm2.surov1.Active:=false;
dm2.surov1.Parameters.ParamByName('obyekt').Value:=ComboBox4.Text;
dm2.surov1.ExecSQL;
dm2.surov1.Active:=true;

dm2.ADOQuery2.Active:=false;
 dm2.ADOQuery2.Parameters.ParamByName('linkkey1').Value:=dm2.surov1.Fields[0].Value;
 dm2.ADOQuery2.ExecSQL;
 dm2.ADOQuery2.Active:=true;
 dm2.ADOQuery2.First;
 
  while dm2.ADOQuery2.Eof<>true do
     begin
 ComboBox3.Items.Add(dm2.ADOQuery2.Fields[2].Value);
     dm2.ADOQuery2.Next;
     end;
  dm2.surov2.Active:=false;
 dm2.surov2.Parameters.ParamByName('pods').Value:=ComboBox3.Text;
 dm2.surov2.ExecSQL;
 dm2.surov2.Active:=true;

 dm2.ADOQuery4.Active:=false;
 dm2.ADOQuery4.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery4.ExecSQL;
 dm2.ADOQuery4.Active:=true;
 ComboBox3.Visible:=true;
end;

procedure TTM_RET.bb_clearClick(Sender: TObject);

begin
try
ShowMessage('Are you sure? You want to delete');
 finally
  begin
  Cursor:=crsqlwait;
   dm2.exp.Open;
   dm2.delete.Parameters.ParamByName('energobyekt').Value:=Edit1.Text;
   dm2.delete.ExecSQL;
   dm2.exp.Close;
   {удаление данных с таблицы tb_oed}
 dm2.ADOQuery1.Active:=false;
 dm2.ADOQuery1.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery1.Parameters.ParamByName('block').Value:=strtoint(Edit1.Text);
 dm2.ADOQuery1.ExecSQL;
 dm2.ADOQuery1.Active:=true;
 dm2.ad_q.Parameters.ParamByName('k').Value:=dm2.surov2.Fields[0].Value;
 dm2.ad_q.Parameters.ParamByName('nom').Value:=dm2.ADOQuery1.Fields[3].AsString;
 dm2.ad_q.Parameters.ParamByName('znak').Value:=dm2.ADOQuery1.Fields[2].AsString;
  dm2.ad_q.ExecSQL;
   dm2.ad_q.Active:=true;
 dm2.free.SQL.Clear;
   dm2.free.SQL.Text:='delete * from tb_oed where keyenergo=:keyenergo;';
   dm2.free.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.free.ExecSQL;

    dm2.free.SQL.Clear;
   dm2.free.SQL.Text:='delete * from danniye where keylink=:keylink;';
   dm2.free.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.free.ExecSQL;

   dm2.del_chegara.Active:=false;
   dm2.del_chegara.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.del_chegara.Parameters.ParamByName('linkps').Value:=dm2.surov2.Fields[0].Value;
   dm2.del_chegara.ExecSQL;
   dm2.clear_eks.Active:=false;
   dm2.clear_eks.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.clear_eks.ExecSQL;
  Cursor:=crDefault;
  bb_ok.Enabled:=true;
  end;
  end;
 end;


procedure TTM_RET.Button1Click(Sender: TObject);
begin
 dm2.ADOQuery1.Active:=false;
 dm2.ADOQuery1.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery1.Parameters.ParamByName('block').Value:=strtoint(Edit1.Text);
 dm2.ADOQuery1.ExecSQL;
 dm2.ADOQuery1.Active:=true;
 dm2.ad_q.Active:=false;
  dm2.ad_q.Parameters.ParamByName('k').Value:=dm2.surov2.Fields[0].Value;
 dm2.ad_q.Parameters.ParamByName('nom').Value:=dm2.ADOQuery1.Fields[3].AsString;
 dm2.ad_q.Parameters.ParamByName('znak').Value:=dm2.ADOQuery1.Fields[2].AsString;

 dm2.ad_q.ExecSQL;
   dm2.ad_q.Active:=true;

 dm2.exp.Active:=true;

 forma.SpinEdit1.Value:=dm2.ad_q.Fields[5].AsInteger;
 forma.SpinEdit2.Value:=dm2.ad_q.Fields[6].AsInteger;
 if dm2.ad_q.Fields[5].AsInteger>=0 then begin
                                          forma.ValueListEditor1.Refresh;
                                          forma.ValueListEditor1.Row:=7;
                                          forma.ValueListEditor1.Cells[0,1]:='0';
                                          forma.ValueListEditor1.Cells[0,2]:='1';
                                          forma.ValueListEditor1.Cells[0,3]:='2';
                                          forma.ValueListEditor1.Cells[0,4]:='3';
                                          forma.ValueListEditor1.Cells[0,5]:='4';
                                          forma.ValueListEditor1.Cells[0,6]:='5';
                                          forma.ValueListEditor1.Cells[1,1]:='0';
                                          forma.ValueListEditor1.Cells[1,2]:='1';
                                          forma.ValueListEditor1.Cells[1,3]:='2';
                                          forma.ValueListEditor1.Cells[1,4]:='3';
                                          forma.ValueListEditor1.Cells[1,5]:='4';
                                          forma.ValueListEditor1.Cells[1,6]:='5';
                                          end
                                          else
                                          begin
                                          forma.ValueListEditor1.Refresh;
                                          forma.ValueListEditor1.Row:=7;
                                          forma.ValueListEditor1.Cells[0,1]:='-5';
                                          forma.ValueListEditor1.Cells[0,2]:='-4';
                                          forma.ValueListEditor1.Cells[0,3]:='-3';
                                          forma.ValueListEditor1.Cells[0,4]:='-2';
                                          forma.ValueListEditor1.Cells[0,5]:='-1';
                                          forma.ValueListEditor1.Cells[0,6]:='0';
                                          forma.ValueListEditor1.Cells[1,1]:='-5';
                                          forma.ValueListEditor1.Cells[1,2]:='-4';
                                          forma.ValueListEditor1.Cells[1,3]:='-3';
                                          forma.ValueListEditor1.Cells[1,4]:='-2';
                                          forma.ValueListEditor1.Cells[1,5]:='-1';
                                          forma.ValueListEditor1.Cells[1,6]:='0';
                                          end;
  dm2.jimm.Close;
  dm2.jimm.Open;
  dm2.jimm.Active:=true;
  TM_RET.Hide;
 forma.ShowModal;
end;

procedure TTM_RET.Edit1Change(Sender: TObject);
begin
 dm2.ADOQuery1.Active:=false;
 dm2.ADOQuery1.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery1.Parameters.ParamByName('block').Value:=strtoint(Edit1.Text);
 dm2.ADOQuery1.ExecSQL;
 dm2.ADOQuery1.Active:=true;
 dm2.ad_q.Active:=false;
 dm2.ad_q.Parameters.ParamByName('k').Value:=dm2.surov2.Fields[0].Value; 
 dm2.ad_q.Parameters.ParamByName('nom').Value:=dm2.ADOQuery1.Fields[3].AsString;
 dm2.ad_q.Parameters.ParamByName('znak').Value:=dm2.ADOQuery1.Fields[2].AsString;
  dm2.ad_q.ExecSQL;
   dm2.ad_q.Active:=true;
 dm2.tb_oed.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
 dm2.tb_oed.ExecSQL;
 dm2.tb_oed.Active:=true;
 if dm2.tb_oed.RecordCount<>0 then bb_ok.Enabled:=false;
end;

procedure TTM_RET.FormClose(Sender: TObject; var Action: TCloseAction);
begin
main.Show;
end;



procedure TTM_RET.MonthCalendar1Click(Sender: TObject);
begin
 //s:=DayOfWeek(MonthCalendar1.Date);
 //ed_time.Visible:=true;
end;

procedure TTM_RET.DateTimePicker1Change(Sender: TObject);
begin
 ed_time.Visible:=true;
 MaskEdit1.Visible:=true;
 Label5.Visible:=true;
end;

procedure TTM_RET.ed_timeChange(Sender: TObject);
var
secs:integer;
begin
 secs:=0;
 if sd=nil then sd:=TStringList.Create;
 sd.Delimiter:=':';
 sd.DelimitedText:=ed_time.Text;
 if sd.Count=3 then
 secs:=StrToIntDef(sd[0],0)*3600+StrToIntDef(sd[1],0)*60+StrToIntDef(sd[2],0);
  bosh:=secs;
end;

procedure TTM_RET.MaskEdit1Change(Sender: TObject);
var
secs:integer;
begin
 secs:=0;
 if sd=nil then sd:=TStringList.Create;
 sd.Delimiter:=':';
 sd.DelimitedText:=MaskEdit1.Text;
 if sd.Count=3 then
 secs:=StrToIntDef(sd[0],0)*3600+StrToIntDef(sd[1],0)*60+StrToIntDef(sd[2],0);
  oxiri:=secs;
end;

end.

