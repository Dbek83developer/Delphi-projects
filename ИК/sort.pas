unit sort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Spin, ExtCtrls, Grids, unit1, DBGrids,
  ValEdit,comobj, TeEngine, Series, TeeProcs, Chart, DbChart;

type
  Tforma = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button2: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit4: TSpinEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Button3: TButton;
    ValueListEditor1: TValueListEditor;
    tm: TSpinEdit;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure ADOConnection1AfterDisconnect(Sender: TObject);
    procedure ADOConnection1AfterConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  cstr = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False';
//  h:array[1..20]of double=(1.46,1.46,1.46,1.46,1.67,1.82,1.94,2.03,2.11,2.18,2.23,2.29,2.33,2.37,2.41,2.44,2.48,2.50,2.53,2.56);
    h:array[1..20]of double=(2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56,2.56);
  t=1.96;
var
  forma: Tforma;
   N, D: Integer;
  arr: array [1..5, 1..4, 1..22] of Double;
  A1, A2,Aur, MinFarq, MaxFarq: Double;
  dmas:array of double;

 implementation

uses datamoduleunit,  Math;

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
katta:=mas[i]+katta;
result:=katta;
end;

procedure Tforma.ADOConnection1AfterDisconnect(Sender: TObject);
begin
  GroupBox1.Enabled:=False;
end;

procedure Tforma.ADOConnection1AfterConnect(Sender: TObject);
begin
  GroupBox1.Enabled:=True;
end;

procedure Tforma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm2.del_jimm.ExecSQL;
TM_RET.Show;
end;


procedure Tforma.Button2Click(Sender: TObject);

var
  I,z,s,b: Integer;
  D, L, J: Integer;
  Sum_o,Sum_p,PZnach, TekFarq, OZnach, PredZnach: Double;
  tmpstr: TStrings;
  K,x,y,xp,xo,sko,qavs,u,ssp,Hv,dis:real;
  nij,verx:real;
  masn,masv,man,mbn,mcn,mav,mbv,mcv,qiymat:array of real;
 label 7,8,9,10,11;
begin
      D:=SpinEdit4.Value;
      A1:=dm2.ad_q.Fields[5].AsFloat;
      A2:=dm2.ad_q.Fields[6].AsFloat;

  dm2.nij_verx.Active:=false;
  dm2.nij_verx.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[3].AsString;
  dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.ad_q.Fields[12].AsString;
  dm2.nij_verx.ExecSQL;
  dm2.nij_verx.Active:=true;
      if (A1<0)and(A2<>0) then
      begin
      N:=11;
      Aur:=(A2-A1)/(N-1);
        MinFarq:=Abs((100-D)*Aur/100);
        MaxFarq:=Abs((100+D)*Aur/100);

    x:=A1;
    setlength(man,N);
    setlength(mav,N);
    setlength(mbn,N);
    setlength(mbv,N);
    setlength(mcn,N);
    setlength(mcv,N);

    SetLength(masn,N);
    SetLength(masv,N);
    SetLength(qiymat,39);
    for s:=1 to N do
       begin

     z:=1;
     xp:=0;
     xo:=0;
     qavs:=0;
     Sum_o:=0;
     Sum_p:=0;
      nij:=0;
      verx:=0;

     dm2.zapros_eks.Active:=false;
     dm2.zapros_eks.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[0].AsInteger;
     if s=1 then  begin
              K:=strtofloat(ValueListEditor1.Values[ValueListEditor1.Keys[s]])/strtofloat(ValueListEditor1.Keys[s]);
              x:=x*K;
              dm2.zapros_eks.Parameters.ParamByName('x').Value:=round((100-D)*x/100);
              dm2.zapros_eks.Parameters.ParamByName('y').Value:=round((100+D)*x/100);
                  end;
     if s=6 then begin
                   K:=1+strtofloat(ValueListEditor1.Values[ValueListEditor1.Keys[s]]);
                   x:=(A1+Aur*(s-1))*K;
                   dm2.zapros_eks.Parameters.ParamByName('x').Value:=round(x-Aur*0.01*D);
                   dm2.zapros_eks.Parameters.ParamByName('y').Value:=round(x+Aur*0.01*D);
                 end
      else if s<>1 then begin   // else*
     K:=strtofloat(ValueListEditor1.Values[ValueListEditor1.Keys[s]])/strtofloat(ValueListEditor1.Keys[s]);
     x:=(A1+Aur*(s-1))*K;
     dm2.zapros_eks.Parameters.ParamByName('x').Value:=round((100-D)*x/100);
     dm2.zapros_eks.Parameters.ParamByName('y').Value:=round((100+D)*x/100);
           end;// else *

     dm2.zapros_eks.ExecSQL;
     dm2.zapros_eks.Active:=true;

     if dm2.zapros_eks.RecordCount>=40 then
      begin
      dm2.zapros_eks.First;

     for i:=0 to 39 do
        begin            // for 2
      dm2.q_danniye.Active:=false;
      dm2.q_danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
      dm2.q_danniye.Parameters.ParamByName('tochka').Value:=x;
      dm2.q_danniye.Parameters.ParamByName('dznach').Value:=abs(x-dm2.zapros_eks.Fields[3].Value);
      qiymat[i]:=dm2.zapros_eks.Fields[3].Value;
      if z<11 then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/z;
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                          end
                                                   else begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                   qiymat[i]:=qiymat[i];
                                                   end;
                                                  xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                  end;

                   end;

      if (z>10)and(z<21) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                   //qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;
                                  end;
                   end;

      if (z>20)and(z<31) then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                               if u>h[z] then begin
                                                 if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                      end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                   //qiymat[i]:=qiymat[i-1];
                                                   //end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                  end;
                           end;
      if (z>30)and(z<41) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-20);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-20)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                          end
                                                  else // begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
          //                                         qiymat[i]:=qiymat[i-1];
            //                                       end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;
                                  end;
          end;


      dm2.q_danniye.ExecSQL;
      dm2.zapros_eks.Next;
       z:=z+1;
        end;// for 2
        end

        else
         begin
         dm2.zapros_eks.First;

       for i:=0 to 39 do     //for3

       begin
       if dm2.zapros_eks.Eof=true then dm2.zapros_eks.Prior;
       dm2.q_danniye.Active:=false;
      dm2.q_danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
      dm2.q_danniye.Parameters.ParamByName('tochka').Value:=x;

      dm2.q_danniye.Parameters.ParamByName('dznach').Value:=abs(x-dm2.zapros_eks.Fields[3].Value);
      qiymat[i]:=dm2.zapros_eks.Fields[3].Value;
      if z<11 then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/z;
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                //   qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                 end;
                  end;

      if (z>10)and(z<21) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                                 if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else// begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                              //     qiymat[i]:=qiymat[i-1];
                                                //   end;
                                                    xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;

                                end;
                   end;

      if (z>20)and(z<31) then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                                  if (i<>0)or(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                        end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                //   qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                    end;

                   end;
      if (z>30)and(z<41) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-20);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-20)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-20] then begin
                                                if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                 //  qiymat[i]:=qiymat[i-1];
                                                //   end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;
                                  end;

                   end;
       dm2.q_danniye.ExecSQL;
       dm2.zapros_eks.Next;
       z:=z+1;
        end;//for 3
        end;
       // end;// else
      dm2.danniye.Active:=false;
     dm2.danniye.Parameters.ParamByName('tochka').Value:=x;
     dm2.danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
      dm2.danniye.Active:=true;

      dm2.danniye.First;
      while not dm2.danniye.Eof do
      begin
             if dm2.danniye.RecNo<11 then begin
           PZnach:=dm2.danniye.Fields[3].Value-xp/20;
           Sum_p:=Sum_p+sqr(PZnach);
                     end;

      if (dm2.danniye.RecNo>10)and(dm2.danniye.RecNo<21) then begin
           OZnach:=dm2.danniye.Fields[3].Value-xo/20;
           Sum_o:=Sum_o+sqr(OZnach);
                     end;

      if (dm2.danniye.RecNo>20)and(dm2.danniye.RecNo<31) then begin
           PZnach:=dm2.danniye.Fields[3].Value-xp/20;
           Sum_p:=Sum_p+sqr(PZnach);
                     end;

      if (dm2.danniye.RecNo>30)and(dm2.danniye.RecNo<41) then begin
           OZnach:=dm2.danniye.Fields[3].Value-xo/20;
           Sum_o:=Sum_o+sqr(OZnach);
                     end;
    dm2.danniye.Next;
      end;

       ssp:=roundto((((xp/20-x)+(xo/20-x))/2),-5);
       Hv:=roundto((abs((xp-xo)/20)),-5);
       dis:=roundto(((Sum_o+Sum_p)/39),-5);
       If RadioButton1.Checked then
       begin
       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[19].AsFloat)+sqr(Hv)/12);
       man[s-1]:=roundto(nij,-5);
       verx:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[19].AsFloat)+sqr(Hv)/12);
       mav[s-1]:=roundto(verx,-5);

       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[20].AsFloat)+sqr(Hv)/12);
       mbn[s-1]:=roundto(nij,-5);
       nij:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[20].AsFloat)+sqr(Hv)/12);
       mbv[s-1]:=roundto(nij,-5);

       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[21].AsFloat)+sqr(Hv)/12);
       mcn[s-1]:=roundto(nij,-5);
       nij:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[21].AsFloat)+sqr(Hv)/12);
       mcv[s-1]:=roundto(nij,-5);

       nij:=ssp-t*sqrt(dis+sqr(Hv)/12);
       verx:=ssp+t*sqrt(dis+sqr(Hv)/12);

       masn[s-1]:=roundto(nij,-5);
       masv[s-1]:=roundto(verx,-5);
      end;
     If RadioButton2.Checked then
      begin
       nij:=ssp-t*sqrt(dis+sqr(Hv)/12);
       verx:=ssp+t*sqrt(dis+sqr(Hv)/12);

       masn[s-1]:=roundto(nij,-5);
       masv[s-1]:=roundto(verx,-5);
       man[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[19].AsFloat))),-5);
       mav[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[19].AsFloat))),-5);

       mbn[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[20].AsFloat))),-5);
       mbv[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[20].AsFloat))),-5);

       mcn[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[21].AsFloat))),-5);
       mcv[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[21].AsFloat))),-5);
      end;
       dm2.ins_tboed.Parameters.ParamByName('xd').Value:=x;
       dm2.ins_tboed.Parameters.ParamByName('xp').Value:=xp/20;
       dm2.ins_tboed.Parameters.ParamByName('xo').Value:=xo/20;
       dm2.ins_tboed.Parameters.ParamByName('ssp').Value:=ssp;
       dm2.ins_tboed.Parameters.ParamByName('dis').Value:=dis;
       dm2.ins_tboed.Parameters.ParamByName('dsko').Value:=sqrt(dis);
       dm2.ins_tboed.Parameters.ParamByName('Hv').Value:=Hv;
       dm2.ins_tboed.Parameters.ParamByName('nij').Value:=nij;
       dm2.ins_tboed.Parameters.ParamByName('verx').Value:=verx;
       dm2.ins_tboed.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
        dm2.ins_tboed.ExecSQL;
       end;  // for

       dm2.i_chegara.Active:=false;
       nij:=min(man,N);
       dm2.i_chegara.Parameters.ParamByName('a').Value:=nij;
       verx:=max(mav,N);
       dm2.i_chegara.Parameters.ParamByName('av').Value:=verx;
       nij:=min(mbn,N);
       dm2.i_chegara.Parameters.ParamByName('b').Value:=nij;
       verx:=max(mbv,N);
       dm2.i_chegara.Parameters.ParamByName('bv').Value:=verx;
       nij:=min(mcn,N);
       dm2.i_chegara.Parameters.ParamByName('c').Value:=nij;
       verx:=max(mcv,N);
       dm2.i_chegara.Parameters.ParamByName('cv').Value:=verx;

       nij:=min(masn,N);
       dm2.i_chegara.Parameters.ParamByName('nij').Value:=nij;
       verx:=max(masv,N);
       dm2.i_chegara.Parameters.ParamByName('verx').Value:=verx;


       dm2.i_chegara.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
       dm2.i_chegara.Parameters.ParamByName('linkps').Value:=dm2.ad_q.Fields[12].AsInteger;
       dm2.i_chegara.ExecSQL;
      end;  // if 1
   //end;
   if (A1>=0)or(A2=0) then       // расчет нереверсивних каналов
      begin
             N:=6;
     { if dm2.ad_q.Fields[2].Asstring='F' then begin
                                               A1:=A1*100;
                                               A2:=A2*100;
                                              end; }

      Aur:=abs(A2-A1)/(N-1);
        MinFarq:=Abs((100-D)*Aur/100);
        MaxFarq:=Abs((100+D)*Aur/100);

    x:=A1;
    setlength(man,N);
    setlength(mav,N);
    setlength(mbn,N);
    setlength(mbv,N);
    setlength(mcn,N);
    setlength(mcv,N);
    SetLength(qiymat,39);
    SetLength(masn,N);
    SetLength(masv,N);


   10: for s:=1 to N do
       begin
     dm2.zapros_eks.Active:=false;
     dm2.zapros_eks.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[0].AsInteger;
     z:=1;
     xp:=0;
     xo:=0;
     qavs:=0;
     Sum_o:=0;
     Sum_p:=0;
     nij:=0;
     verx:=0;
    if s=1 then  begin
              dm2.zapros_eks.Parameters.ParamByName('x').Value:=x-Aur*0.01*D;
              dm2.zapros_eks.Parameters.ParamByName('y').Value:=x+Aur*0.01*D;
               end

     else
     begin
     x:=(A1+Aur*(s-1));
     dm2.zapros_eks.Parameters.ParamByName('x').Value:=(100-D)*x/100;
     dm2.zapros_eks.Parameters.ParamByName('y').Value:=(100+D)*x/100;
      end;
      dm2.zapros_eks.ExecSQL;
      9:dm2.zapros_eks.Active:=true;

     if dm2.zapros_eks.RecordCount>=40 then
      begin
      dm2.zapros_eks.First;
      for i:=0 to 39 do             // for 2
        begin
     {   if dm2.ad_q.Fields[2].Asstring='F' then
         begin
         qiymat[i]:=dm2.zapros_eks.Fields[3].Value/100;
         dm2.q_danniye.Active:=false;
         dm2.q_danniye.Parameters.ParamByName('tochka').Value:=x/100;
         dm2.q_danniye.Parameters.ParamByName('dznach').Value:=abs(x-dm2.zapros_eks.Fields[3].Value)/100;
         end
        else
         begin   }
         qiymat[i]:=dm2.zapros_eks.Fields[3].Value;
         dm2.q_danniye.Active:=false;
         dm2.q_danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
         dm2.q_danniye.Parameters.ParamByName('tochka').Value:=x;
         dm2.q_danniye.Parameters.ParamByName('dznach').Value:=abs(x-dm2.zapros_eks.Fields[3].Value);
       //  end;
      if z<11 then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/z;
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                 if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                 //  qiymat[i]:=qiymat[i-1];
                                                //   end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                 end;
                  end;

      if (z>10)and(z<21) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else// begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                  // qiymat[i]:=qiymat[i-1];
                                                   //end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;

                                end;
                   end;

      if (z>20)and(z<31) then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                                  if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else// begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                 ///  qiymat[i]:=qiymat[i-1];
                                                 //  end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                    end;

                   end;
      if (z>30)and(z<41) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-20);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-20)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-20] then begin
                                                 if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else// begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                 ///  qiymat[i]:=qiymat[i-1];
                                                 //  end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;
                                  end;

                   end;
      dm2.q_danniye.ExecSQL;
      dm2.zapros_eks.Next;
       z:=z+1;
        end;// for 2
      end

      else
         begin
         dm2.zapros_eks.First;
       for i:=0 to 39 do     //for3

       begin
       if dm2.zapros_eks.Eof=true then dm2.zapros_eks.Prior;
       dm2.q_danniye.Active:=false;
      dm2.q_danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
      dm2.q_danniye.Parameters.ParamByName('tochka').Value:=x;

      dm2.q_danniye.Parameters.ParamByName('dznach').Value:=abs(x-dm2.zapros_eks.Fields[3].Value);
        qiymat[i]:=dm2.zapros_eks.Fields[3].Value;
      if z<11 then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/z;
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z] then begin
                                                 if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                        end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                  // qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                 end;
                  end;

      if (z>10)and(z<21) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                                if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                        end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                  // qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;

                                end;
                   end;

      if (z>20)and(z<31) then begin
                   xp:=(qiymat[i]+xp);
                   qavs:=qavs+qiymat[i]-xp/(z-10);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xp/z-10)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-10] then begin
                                              if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                      end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                   //qiymat[i]:=qiymat[i-1];
                                                   //end;
                                                   xp:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xp;
                                                 end;
                                    end;

                   end;
      if (z>30)and(z<41) then  begin
                    xo:=(qiymat[i]+xo);
                   qavs:=qavs+qiymat[i]-xo/(z-20);
                   sko:=sqrt(abs(qavs)/39);
                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                   if sko<>0 then begin
                                  u:=((xo/z-20)-dm2.zapros_eks.Fields[3].Value)/sko;
                                  if u>h[z-20] then begin
                                                if (i<>0)and(i<>1) then begin
                                                                         dm2.q_danniye.Parameters.ParamByName('znach').Value:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         qiymat[i]:=(qiymat[i-1]+qiymat[i-2])/2;
                                                                         end
                                                  else //begin
                                                   dm2.q_danniye.Parameters.ParamByName('znach').Value:=qiymat[i];
                                                 //  qiymat[i]:=qiymat[i-1];
                                                  // end;
                                                   xo:=qiymat[i]-dm2.zapros_eks.Fields[3].Value+xo;
                                                 end;
                                  end;

                   end;       dm2.q_danniye.ExecSQL;
       dm2.zapros_eks.Next;
       z:=z+1;
        end;//for 3
        end;// else

             dm2.danniye.Active:=false;
     dm2.danniye.Parameters.ParamByName('tochka').Value:=x;
     dm2.danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
      dm2.danniye.Active:=true;

      dm2.danniye.First;
      while not dm2.danniye.Eof do
      begin
             if dm2.danniye.RecNo<11 then begin
           PZnach:=dm2.danniye.Fields[3].Value-xp/20;
           Sum_p:=Sum_p+sqr(PZnach);
                     end;

      if (dm2.danniye.RecNo>10)and(dm2.danniye.RecNo<21) then begin
           OZnach:=dm2.danniye.Fields[3].Value-xo/20;
           Sum_o:=Sum_o+sqr(OZnach);
                     end;

      if (dm2.danniye.RecNo>20)and(dm2.danniye.RecNo<31) then begin
           PZnach:=dm2.danniye.Fields[3].Value-xp/20;
           Sum_p:=Sum_p+sqr(PZnach);
                     end;

      if (dm2.danniye.RecNo>30)and(dm2.danniye.RecNo<41) then begin
           OZnach:=dm2.danniye.Fields[3].Value-xo/20;
           Sum_o:=Sum_o+sqr(OZnach);
                     end;
    dm2.danniye.Next;
      end;

       ssp:=roundto((((xp/20-x)+(xo/20-x))/2),-5);
       Hv:=roundto((abs((xp-xo)/20)),-5);
       dis:=roundto(((Sum_o+Sum_p)/39),-5);

       If RadioButton1.Checked then
       begin
       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[19].AsFloat)+sqr(Hv)/12);
       man[s-1]:=roundto(nij,-5);
       verx:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[19].AsFloat)+sqr(Hv)/12);
       mav[s-1]:=roundto(verx,-5);

       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[20].AsFloat)+sqr(Hv)/12);
       mbn[s-1]:=roundto(nij,-5);
       nij:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[20].AsFloat)+sqr(Hv)/12);
       mbv[s-1]:=roundto(nij,-5);

       nij:=ssp-t*sqrt(dis+sqr(dm2.nij_verx.Fields[21].AsFloat)+sqr(Hv)/12);
       mcn[s-1]:=roundto(nij,-5);
       nij:=ssp+t*sqrt(dis+sqr(dm2.nij_verx.Fields[21].AsFloat)+sqr(Hv)/12);
       mcv[s-1]:=roundto(nij,-5);

       nij:=ssp-t*sqrt(dis+sqr(Hv)/12);
       verx:=ssp+t*sqrt(dis+sqr(Hv)/12);

       masn[s-1]:=roundto(nij,-5);
       masv[s-1]:=roundto(verx,-5);
      end;
     If RadioButton2.Checked then
      begin
       nij:=ssp-t*sqrt(dis+sqr(Hv)/12);
       verx:=ssp+t*sqrt(dis+sqr(Hv)/12);

       masn[s-1]:=roundto(nij,-5);
       masv[s-1]:=roundto(verx,-5);
       man[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[19].AsFloat))),-5);
       mav[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[19].AsFloat))),-5);

       mbn[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[20].AsFloat))),-5);
       mbv[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[20].AsFloat))),-5);

       mcn[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp-t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[21].AsFloat))),-5);
       mcv[s-1]:=roundto((-0.01*(dm2.ad_q.Fields[6].AsFloat-dm2.ad_q.Fields[5].AsFloat)*dm2.nij_verx.Fields[9].AsFloat+ssp+t*sqrt(dis+sqr(Hv)/12+sqr(dm2.nij_verx.Fields[21].AsFloat))),-5);
        end;
       dm2.ins_tboed.Parameters.ParamByName('xd').Value:=x;
       dm2.ins_tboed.Parameters.ParamByName('xp').Value:=xp/20;
       dm2.ins_tboed.Parameters.ParamByName('xo').Value:=xo/20;
       dm2.ins_tboed.Parameters.ParamByName('ssp').Value:=ssp;
       dm2.ins_tboed.Parameters.ParamByName('dis').Value:=dis;
       dm2.ins_tboed.Parameters.ParamByName('dsko').Value:=roundto((sqrt(dis)),-5);
       dm2.ins_tboed.Parameters.ParamByName('Hv').Value:=Hv;
       dm2.ins_tboed.Parameters.ParamByName('nij').Value:=nij;
       dm2.ins_tboed.Parameters.ParamByName('verx').Value:=verx;
       dm2.ins_tboed.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
       dm2.ins_tboed.ExecSQL;
       end;  // for

       dm2.i_chegara.Active:=false;
       nij:=min(man,N);
       dm2.i_chegara.Parameters.ParamByName('a').Value:=floattostr(nij);
       verx:=max(mav,N);
       dm2.i_chegara.Parameters.ParamByName('av').Value:=verx;
       nij:=min(mbn,N);
       dm2.i_chegara.Parameters.ParamByName('b').Value:=floattostr(nij);
       verx:=max(mbv,N);
       dm2.i_chegara.Parameters.ParamByName('bv').Value:=verx;
       nij:=min(mcn,N);
       dm2.i_chegara.Parameters.ParamByName('c').Value:=floattostr(nij);
       verx:=max(mcv,N);
       dm2.i_chegara.Parameters.ParamByName('cv').Value:=verx;

       nij:=min(masn,N);
       dm2.i_chegara.Parameters.ParamByName('nij').Value:=floattostr(nij);
       verx:=max(masv,N);
       dm2.i_chegara.Parameters.ParamByName('verx').Value:=verx;
       dm2.i_chegara.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
       dm2.i_chegara.Parameters.ParamByName('linkps').Value:=dm2.ad_q.Fields[12].AsInteger;
       dm2.i_chegara.ExecSQL;

    11:  end;   //end  расчет нереверсивних каналов    ShowMessage('Всё');

  ShowMessage('Всё');
 end;
procedure Tforma.Button3Click(Sender: TObject);
var
    ExcelApp,Sheet, Workbook, Range, Cell1, Cell2, ArrayData, ArrayData1  : Variant;
    S: String;
   BeginCol, BeginRow, i, j,k,z : integer;
   RowCount, ColCount : integer;
mas_o:array[1..20] of real;
f_a,f_c,f_b,ftn,delta:real;
tt,tn:integer;
dtt_a,dtt_c,dtt_b,dtn:real;
begin
 if dm2.OpenDialog1.Execute then S:=dm2.OpenDialog1.FileName;
 Cursor:=crHourGlass;
 dm2.ADOQuery1.Active:=false;
 dm2.ADOQuery1.Parameters.ParamByName('linkkey2').Value:=dm2.surov2.Fields[0].Value;
 dm2.ADOQuery1.Parameters.ParamByName('block').Value:=strtoint(TM_RET.Edit1.Text);
 dm2.ADOQuery1.ExecSQL;
 dm2.ADOQuery1.Active:=true;
 dm2.ad_q.Active:=false;

 dm2.ad_q.Parameters.ParamByName('nom').Value:=dm2.ADOQuery1.Fields[3].AsString;
 dm2.ad_q.Parameters.ParamByName('znak').Value:=dm2.ADOQuery1.Fields[2].AsString;

 dm2.ad_q.ExecSQL;
   dm2.ad_q.Active:=true;

     A1:=SpinEdit1.Value;
     A2:=SpinEdit2.Value;
  dtt_a:=0;
  dtt_c:=0;
  dtt_b:=0;
  f_a:=0;
  f_c:=0;
  f_b:=0;
  ftn:=0;
  dtn:=0;
   tn:=0;
if dm2.ad_q.Fields[8].AsString='1000/1' then tt:=1000;
if dm2.ad_q.Fields[8].AsString='1000/5'then tt:=1000;
if dm2.ad_q.Fields[8].AsString='1200/1'then tt:=1200;
if dm2.ad_q.Fields[8].AsString='1200/5' then tt:=1200;
if dm2.ad_q.Fields[8].AsString='1500/5' then tt:=1500;
if dm2.ad_q.Fields[8].AsString='2000/1' then tt:=2000;
if dm2.ad_q.Fields[8].AsString='2000/5' then tt:=2000;
if dm2.ad_q.Fields[8].AsString='500/1' then tt:=500;
if dm2.ad_q.Fields[8].AsString='600/1' then tt:=600;
if dm2.ad_q.Fields[8].AsString='600/5' then tt:=600;
if dm2.ad_q.Fields[8].AsString='750/5' then tt:=750;
if dm2.ad_q.Fields[8].AsString='375/1' then tt:=375;
if dm2.ad_q.Fields[8].AsString='150/5' then tt:=150;
if dm2.ad_q.Fields[8].AsString='150/1' then tt:=150;
if dm2.ad_q.Fields[8].AsString='300/5' then tt:=300;
if dm2.ad_q.Fields[8].AsString='300/1' then tt:=300;
if dm2.ad_q.Fields[8].AsString='200/5' then tt:=200;
if dm2.ad_q.Fields[8].AsString='200/1' then tt:=200;


if dm2.ad_q.Fields[9].AsString='110000/100'then tn:=110000;
if dm2.ad_q.Fields[9].AsString='220000/100'then tn:=220000;
if dm2.ad_q.Fields[9].AsString='500000/100'then tn:=500000;


  dm2.ADOTable1.Active:=true;
  dm2.ADOTable1.First;
   while not dm2.ADOTable1.Eof do
  begin
 if (dm2.ADOTable1Klass.Value=floattostr(dm2.ad_q.Fields[22].AsFloat))and(dm2.ADOTable1faza.Value='A') then
 begin
 dtt_a:=dm2.ADOTable1osp.Value;
 f_a:=dm2.ADOTable1dup.Value;
  end;
  if (dm2.ADOTable1Klass.Value=FloatToStr(dm2.ad_q.Fields[22].AsFloat))and(dm2.ADOTable1faza.Value='B') then
 begin
 dtt_b:=dm2.ADOTable1osp.Value;
 f_b:=dm2.ADOTable1dup.Value;
  end
  else
  begin
    if (dm2.ADOTable1Klass.Value=FloatToStr(dm2.ad_q.Fields[22].AsFloat))and(dm2.ADOTable1faza.Value='C') then
        begin
        dtt_c:=dm2.ADOTable1osp.Value;
        f_c:=dm2.ADOTable1dup.Value;
        end; // if
  end;    //  if  else
  if (dm2.ADOTable1Klass.Value=FloatToStr(dm2.ad_q.Fields[23].AsFloat))and(dm2.ADOTable1Tipdatchika.Value='TH') then
        begin
         dtn:=dm2.ADOTable1osp.Value;
         ftn:=dm2.ADOTable1dup.Value;
        end;
  dm2.ADOTable1.Next;
         end;
   // end;
  if (A1<0)and(A2<>0) then
      begin
      try
      N:=11;
     dm2.book.Active:=true;
   // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

  // Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

  // Координаты левого верхнего угла области, в которую будем выводить данные
  BeginCol := 5;
  BeginRow := 20;

  // Размеры выводимого массива данных
  RowCount := 22;
  ColCount := 20;
  //  Создаем Книгу (Workbook)
  //  Если заполняем шаблон, то Workbook := ExcelApp.WorkBooks.Add('C:\MyTemplate.xls');
  Workbook := ExcelApp.WorkBooks.Add(s);
 // Workbook := ExcelApp.WorkBooks.Add;
   Sheet := Workbook.Sheets.Item[1];
  dm2.nij_verx.Active:=false;
    dm2.nij_verx.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[3].AsString;
  dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.ad_q.Fields[12].AsString;
  dm2.nij_verx.ExecSQL;
  dm2.nij_verx.Active:=true;

  dm2.qchegara.Active:=false;
  dm2.qchegara.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.qchegara.Parameters.ParamByName('linkps').Value:=dm2.ad_q.Fields[12].AsString;
  dm2.qchegara.ExecSQL;
  dm2.qchegara.Active:=true;
 Sheet.Cells[9,1]:=dm2.ad_q.Fields[3].AsString;
 Sheet.Cells[9,2]:=dm2.ad_q.Fields[4].AsString;
 //Sheet.Cells[10,2]:=dm2.ad_q.Fields[6].AsFloat;

 if    (dm2.ad_q.Fields[2].AsString='P')or(dm2.ad_q.Fields[2].AsString='Q')or(dm2.ad_q.Fields[2].AsString='I') then begin
       Sheet.Cells[9,4]:=dm2.qchegara.Fields[1].AsFloat;
       Sheet.Cells[10,4]:=dm2.qchegara.Fields[2].AsFloat;
Sheet.Cells[7,2]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,4]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,6]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,9]:=dm2.ad_q.Fields[7].AsString;

 Sheet.Cells[9,6]:=dm2.nij_verx.Fields[19].AsFloat;    //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,6]:=dm2.nij_verx.Fields[19].AsFloat; //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

 Sheet.Cells[9,7]:=dm2.nij_verx.Fields[20].AsFloat;    //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,7]:=dm2.nij_verx.Fields[20].AsFloat;  //.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

 Sheet.Cells[9,8]:=dm2.nij_verx.Fields[21].AsFloat;  //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,8]:=dm2.nij_verx.Fields[21].AsFloat;   //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

  delta:=dm2.qchegara.Fields[6].AsFloat;
 Sheet.Cells[9,9]:=delta;
 delta:=dm2.qchegara.Fields[9].AsFloat;
 Sheet.Cells[10,9]:=delta;

 delta:=dm2.qchegara.Fields[7].AsFloat;
 Sheet.Cells[9,10]:=delta;
 delta:=dm2.qchegara.Fields[10].AsFloat;
 Sheet.Cells[10,10]:=delta;

 delta:=dm2.qchegara.Fields[8].AsFloat;
 Sheet.Cells[9,11]:=delta;
 delta:=dm2.qchegara.Fields[11].AsFloat;
 Sheet.Cells[10,11]:=delta;

 Sheet := Workbook.Sheets.Item[2];
 Sheet.Cells[3,19]:=dm2.ad_q.Fields[7].AsString;
 Sheet.Cells[18,3]:='В единицах измеряемой величины, '+dm2.ad_q.Fields[7].AsString;
 Sheet.Cells[18,2]:='Задаваемый параметр, A';
 Sheet.Cells[3,22]:=dm2.ad_q.Fields[3].AsString;
 Sheet.Cells[3,15]:='от  '+dm2.ad_q.Fields[5].AsString;
 Sheet.Cells[3,17]:='до  '+dm2.ad_q.Fields[6].AsString;

 Sheet.Cells[5,8]:=dm2.ad_q.Fields[8].AsString;
 Sheet.Cells[8,8]:=dm2.ad_q.Fields[9].AsString;

 Sheet.Cells[5,4]:=dm2.ad_q.Fields[14].AsString;
 Sheet.Cells[5,16]:=dm2.ad_q.Fields[15].AsString;
 Sheet.Cells[6,16]:=dm2.ad_q.Fields[16].AsString;
 Sheet.Cells[7,16]:=dm2.ad_q.Fields[17].AsString;
 Sheet.Cells[8,4]:=dm2.ad_q.Fields[18].AsString;
 Sheet.Cells[8,16]:=dm2.ad_q.Fields[19].AsString;
 Sheet.Cells[9,16]:=dm2.ad_q.Fields[20].AsString;
 Sheet.Cells[10,16]:=dm2.ad_q.Fields[21].AsString;

 Sheet.Cells[5,13]:=dm2.ad_q.Fields[22].AsFloat;
 Sheet.Cells[8,13]:=dm2.ad_q.Fields[23].AsFloat;

 Sheet.Cells[11,15]:=dm2.nij_verx.Fields[9].AsFloat;
 Sheet.Cells[12,6]:=dm2.ad_q.Fields[24].Value;
 Sheet.Cells[15,6]:=dm2.ad_q.Fields[25].Value;

// Sheet.Cells[12,4].font.size:=8;
// Sheet.Cells[15,3].size:=8;    }
 Sheet.Cells[12,4]:=dm2.ad_q.Fields[10].AsString;
// Sheet.Cells[15,4].font.size:=8;
 Sheet.Cells[15,4]:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[10].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[12,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[15,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[10].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[13,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[13,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[13,9]:=dm2.usloviyav.Fields[5].AsFloat;
 Sheet.Cells[42,4]:=dm2.usloviyav.Fields[2].AsDateTime;
 DM2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[11].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[16,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[16,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[16,9]:=dm2.usloviyav.Fields[5].AsFloat;
if dm2.ad_q.Fields[2].AsString='P' then  Sheet.Cells[3,7]:='Активной мощности электрического тока';
if dm2.ad_q.Fields[2].AsString='Q' then  Sheet.Cells[3,7]:='Реактивной мощности электрического тока';
if dm2.ad_q.Fields[2].AsString='I' then  Sheet.Cells[3,7]:='Силы электрического тока';


 Sheet.Cells[6,20]:='±'+floattostr(dtt_a);
 Sheet.Cells[6,21]:='±'+floattostr(dtt_b);
 Sheet.Cells[6,22]:='±'+FloatToStr(dtt_c);
 Sheet.Cells[7,20]:='±'+FloatToStr(f_a);
 Sheet.Cells[7,21]:='±'+FloatToStr(f_b);
 Sheet.Cells[7,22]:='±'+FloatToStr(f_c);
  if dm2.ad_q.Fields[2].AsString<>'I' then begin
                                         Sheet.Cells[6,24]:='±'+FloatToStr(dtn);
                                         Sheet.Cells[7,24]:='±'+FloatToStr(ftn);
                                          end;
                                    end;


  // Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
  ArrayData1 := VarArrayCreate([1, 11, 1,10], varVariant);

  Cursor:=crHourGlass;

  i:=1;
  z:=1;
  // Заполняем массив
  dm2.tb_oed.Active:=false;
  dm2.tb_oed.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.tb_oed.ExecSQL;
  dm2.tb_oed.Active:=true;

  dm2.tb_oed.First;
  //  dm2.tb_oed.RecNo;
  while dm2.tb_oed.Eof<>true do begin
  dm2.danniye.Active:=false;
   dm2.danniye.Parameters.ParamByName('tochka').Value:=dm2.tb_oed.Fields[1].AsFloat;
   dm2.danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.danniye.ExecSQL;
   dm2.danniye.Active:=true;
   dm2.danniye.First;
  j:=1;
  k:=1;
   repeat
     ArrayData[I, J] :=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      j:=j+1;
   until j=11;

   repeat
     mas_o[k]:=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      k:=k+1;
   until k=11;

    repeat
     ArrayData[I, J] :=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      j:=j+1;
    until j=21;

    repeat
     mas_o[k]:=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      k:=k+1;
    until k=21;
    i:=i+1;
    j:=1;
   repeat
     ArrayData[i,j]:=mas_o[j];
     DM2.danniye.Next;
      j:=j+1;
   until j=21;
   ArrayData1[z,1]:=dm2.tb_oed.Fields[1].AsFloat;
   ArrayData1[z,2]:=dm2.tb_oed.Fields[2].AsFloat;
   ArrayData1[z,3]:=dm2.tb_oed.Fields[3].AsFloat;
   ArrayData1[z,4]:=dm2.tb_oed.Fields[4].AsFloat;
   ArrayData1[z,5]:=dm2.tb_oed.Fields[5].AsFloat;
   ArrayData1[z,6]:=dm2.tb_oed.Fields[6].AsFloat;
   ArrayData1[z,7]:=dm2.tb_oed.Fields[7].AsFloat;
   ArrayData1[z,8]:=sqr(dm2.tb_oed.Fields[7].AsFloat)/12;
   ArrayData1[z,9]:=dm2.tb_oed.Fields[8].AsFloat;
   ArrayData1[z,10]:=dm2.tb_oed.Fields[9].AsFloat;
  // Sheet := Workbook.Sheets.Item[2];
   Sheet.Cells[18+2*z,3]:=dm2.tb_oed.Fields[1].AsFloat;

   z:=z+1;
   i:=i+1;
   dm2.tb_oed.Next;
     end;
  // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[2].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[2].Cells[BeginRow  + RowCount - 1, BeginCol +
ColCount - 1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[2].Range[Cell1, Cell2];

  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения

  Range.Value := ArrayData;


  BeginCol:=1;
  BeginRow:=7;
  RowCount:=11;
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
  Sheet := Workbook.Sheets.Item[3];
  Sheet.Cells[6,1]:=dm2.ad_q.Fields[7].AsString;
  except
   on Exception do
      begin
     Cursor:=crDefault;
     ExcelApp.quit;//:= CloseOleObject('Excel.Application');

     ShowMessage('Ошибка!!!');
     end
     else
     ExcelApp.Visible := true;
     end;
   end
   else
         begin
      N:=6;
      try
     dm2.book.Active:=true;
  // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

  // Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

  //  Создаем Книгу (Workbook)
  //  Если заполняем шаблон, то Workbook := ExcelApp.WorkBooks.Add('C:\MyTemplate.xls');
  Workbook := ExcelApp.WorkBooks.Add(s);
 // Workbook := ExcelApp.WorkBooks.Add;

  dm2.nij_verx.Active:=false;
  dm2.nij_verx.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.ad_q.Fields[3].AsString;
  dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.ad_q.Fields[12].AsString;
  dm2.nij_verx.ExecSQL;
  dm2.nij_verx.Active:=true;

  dm2.qchegara.Active:=false;
  dm2.qchegara.Parameters.ParamByName('son').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.qchegara.Parameters.ParamByName('linkps').Value:=dm2.ad_q.Fields[12].AsString;
  dm2.qchegara.ExecSQL;
  dm2.qchegara.Active:=true;

  Sheet := Workbook.Sheets.Item[1];
  Sheet.Cells[9,1]:=dm2.ad_q.Fields[3].AsString;
  Sheet.Cells[9,2]:=dm2.ad_q.Fields[4].AsString;
//  Sheet.Cells[10,2]:=dm2.ad_q.Fields[6].AsFloat;

 if    (dm2.ad_q.Fields[2].AsString='P')or(dm2.ad_q.Fields[2].AsString='Q')or(dm2.ad_q.Fields[2].AsString='I') then begin
      // Координаты левого верхнего угла области, в которую будем выводить данные
  BeginCol := 5;
  BeginRow := 21;

  // Размеры выводимого массива данных
  RowCount := 12;
  ColCount := 20;

Sheet.Cells[9,4]:=dm2.qchegara.Fields[1].AsFloat;
Sheet.Cells[10,4]:=dm2.qchegara.Fields[2].AsFloat;
Sheet.Cells[7,2]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,4]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,6]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,9]:=dm2.ad_q.Fields[7].AsString;

 Sheet.Cells[9,6]:=dm2.nij_verx.Fields[19].AsFloat;    //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,6]:=dm2.nij_verx.Fields[19].AsFloat; //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

 Sheet.Cells[9,7]:=dm2.nij_verx.Fields[20].AsFloat;    //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,7]:=dm2.nij_verx.Fields[20].AsFloat;  //.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

 Sheet.Cells[9,8]:=dm2.nij_verx.Fields[21].AsFloat;  //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;
 Sheet.Cells[10,8]:=dm2.nij_verx.Fields[21].AsFloat;   //0.01*sqrt((sqr(dm2.sort.Fields[5].AsFloat)+sqr(dm2.sort.Fields[6].AsFloat))/3)*dm2.sort.Fields[3].AsInteger;

  delta:=dm2.qchegara.Fields[6].AsFloat;
 Sheet.Cells[9,9]:=delta;
 delta:=dm2.qchegara.Fields[9].AsFloat;
 Sheet.Cells[10,9]:=delta;

 delta:=dm2.qchegara.Fields[7].AsFloat;
 Sheet.Cells[9,10]:=delta;
 delta:=dm2.qchegara.Fields[10].AsFloat;
 Sheet.Cells[10,10]:=delta;

 delta:=dm2.qchegara.Fields[8].AsFloat;
 Sheet.Cells[9,11]:=delta;
 delta:=dm2.qchegara.Fields[11].AsFloat;
 Sheet.Cells[10,11]:=delta;

 Sheet := Workbook.Sheets.Item[2];
 Sheet.Cells[3,19]:=dm2.ad_q.Fields[7].AsString;
 Sheet.Cells[19,3]:='В единицах измеряемой величины, '+dm2.ad_q.Fields[7].AsString;
 Sheet.Cells[19,2]:='Задаваемый параметр, A';
 Sheet.Cells[3,22]:=dm2.ad_q.Fields[3].AsString;
 Sheet.Cells[3,15]:='от  '+dm2.ad_q.Fields[5].AsString;
 Sheet.Cells[3,17]:='до  '+dm2.ad_q.Fields[6].AsString;

 Sheet.Cells[5,8]:=dm2.ad_q.Fields[8].AsString;
 Sheet.Cells[8,8]:=dm2.ad_q.Fields[9].AsString;

 Sheet.Cells[5,4]:=dm2.ad_q.Fields[14].AsString;
 Sheet.Cells[5,16]:=dm2.ad_q.Fields[15].AsString;
 Sheet.Cells[6,16]:=dm2.ad_q.Fields[16].AsString;
 Sheet.Cells[7,16]:=dm2.ad_q.Fields[17].AsString;
 Sheet.Cells[8,4]:=dm2.ad_q.Fields[18].AsString;
 Sheet.Cells[8,16]:=dm2.ad_q.Fields[19].Value;
 Sheet.Cells[9,16]:=dm2.ad_q.Fields[20].Value;
 Sheet.Cells[10,16]:=dm2.ad_q.Fields[21].Value;

 Sheet.Cells[5,13]:=dm2.ad_q.Fields[22].AsFloat;
 Sheet.Cells[8,13]:=dm2.ad_q.Fields[23].AsFloat;

 Sheet.Cells[12,15]:=dm2.nij_verx.Fields[9].AsFloat;
 Sheet.Cells[13,6]:=dm2.ad_q.Fields[24].Value;
 Sheet.Cells[16,6]:=dm2.ad_q.Fields[25].Value;

 //Sheet.Cells[13,3].font.size:=8;
 Sheet.Cells[13,4]:=dm2.ad_q.Fields[10].AsString;
 //Sheet.Cells[16,3].font.size:=8;
 Sheet.Cells[16,4]:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[10].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[13,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[16,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[10].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[14,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[14,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[14,9]:=dm2.usloviyav.Fields[5].AsFloat;
 Sheet.Cells[34,4]:=dm2.usloviyav.Fields[2].AsDateTime;
 DM2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[11].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[17,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[17,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[17,9]:=dm2.usloviyav.Fields[5].AsFloat;
if dm2.ad_q.Fields[2].AsString='P' then  Sheet.Cells[3,7]:='Активной мощности электрического тока';
if dm2.ad_q.Fields[2].AsString='Q' then  Sheet.Cells[3,7]:='Реактивной мощности электрического тока';
if dm2.ad_q.Fields[2].AsString='I' then  Sheet.Cells[3,7]:='Силы электрического тока';


 Sheet.Cells[6,20]:='±'+floattostr(dtt_a);
 Sheet.Cells[6,21]:='±'+floattostr(dtt_b);
 Sheet.Cells[6,22]:='±'+FloatToStr(dtt_c);
 Sheet.Cells[7,20]:='±'+FloatToStr(f_a);
 Sheet.Cells[7,21]:='±'+FloatToStr(f_b);
 Sheet.Cells[7,22]:='±'+FloatToStr(f_c);
  if dm2.ad_q.Fields[2].AsString<>'I' then begin
                                         Sheet.Cells[6,24]:='±'+FloatToStr(dtn);
                                         Sheet.Cells[7,24]:='±'+FloatToStr(ftn);
                                          end;
                                    end;
if    (dm2.ad_q.Fields[2].AsString='U')or(dm2.ad_q.Fields[2].AsString='F') then begin
 if dm2.ad_q.Fields[2].AsString='U' then begin
    Sheet.Cells[9,4]:=dm2.qchegara.Fields[1].AsFloat;
    Sheet.Cells[10,4]:=dm2.qchegara.Fields[2].AsFloat;
    Sheet.Cells[9,6]:=dm2.nij_verx.Fields[19].AsFloat;
    Sheet.Cells[10,6]:=dm2.nij_verx.Fields[19].AsFloat;
Sheet.Cells[7,2]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,4]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,6]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[7,7]:=dm2.ad_q.Fields[7].AsString;

  delta:=dm2.qchegara.Fields[6].AsFloat;
  Sheet.Cells[9,7]:=delta;
  delta:=dm2.qchegara.Fields[9].AsFloat;
  Sheet.Cells[10,7]:=delta;
    end;

 if    dm2.ad_q.Fields[2].AsString='F' then begin
  delta:=dm2.qchegara.Fields[6].AsFloat;
 Sheet.Cells[9,4]:=delta;
 delta:=dm2.qchegara.Fields[9].AsFloat;
 Sheet.Cells[10,4]:=delta;
 Sheet.Cells[8,2]:=dm2.ad_q.Fields[7].AsString;
Sheet.Cells[8,4]:=dm2.ad_q.Fields[7].AsString;
//Sheet.Cells[8,5]:=dm2.ad_q.Fields[7].AsString;
    end;

  // Координаты левого верхнего угла области, в которую будем выводить данные
  BeginCol := 5;
  BeginRow := 21;

  // Размеры выводимого массива данных
  RowCount := 12;
  ColCount := 20;

 Sheet := Workbook.Sheets.Item[2];
     if dm2.ad_q.Fields[5].AsFloat>0 then Sheet.Cells[21,2]:=75;
Sheet.Cells[3,22]:=dm2.ad_q.Fields[3].AsString;
 Sheet.Cells[3,15]:='от  '+dm2.ad_q.Fields[5].AsString;
 Sheet.Cells[3,17]:='до  '+dm2.ad_q.Fields[6].AsString;

 Sheet.Cells[5,8]:=dm2.ad_q.Fields[8].AsString;
 Sheet.Cells[8,8]:=dm2.ad_q.Fields[9].AsString;

 Sheet.Cells[5,4]:=dm2.ad_q.Fields[14].AsString;
 Sheet.Cells[5,16]:=dm2.ad_q.Fields[15].Value;
 Sheet.Cells[6,16]:=dm2.ad_q.Fields[16].Value;
 Sheet.Cells[7,16]:=dm2.ad_q.Fields[17].Value;
 Sheet.Cells[8,4]:=dm2.ad_q.Fields[18].AsString;
 Sheet.Cells[8,16]:=dm2.ad_q.Fields[19].AsString;
 Sheet.Cells[9,16]:=dm2.ad_q.Fields[20].AsString;
 Sheet.Cells[10,16]:=dm2.ad_q.Fields[21].AsString;

 Sheet.Cells[5,13]:=dm2.ad_q.Fields[22].AsFloat;
 Sheet.Cells[8,13]:=dm2.ad_q.Fields[23].AsFloat;

 Sheet.Cells[12,15]:=dm2.nij_verx.Fields[9].AsFloat;
 Sheet.Cells[13,6]:=dm2.ad_q.Fields[24].Value;
 Sheet.Cells[16,6]:=dm2.ad_q.Fields[25].Value;

if dm2.ad_q.Fields[2].AsString='F' then  Sheet.Cells[3,7]:='Частоты электрического тока';
 if dm2.ad_q.Fields[2].AsString='U' then
 begin
 Sheet.Cells[6,24]:='±'+FloatToStr(dtn);
 Sheet.Cells[7,24]:='±'+FloatToStr(ftn);
 Sheet.Cells[3,7]:='Напряжения электрического тока';
 end;

 //Sheet.Cells[13,3].font.size:=8;
 Sheet.Cells[13,4]:=dm2.ad_q.Fields[10].AsString;
 //Sheet.Cells[16,3].font.size:=8;
 Sheet.Cells[16,4]:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[10].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[13,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=dm2.ad_q.Fields[11].AsString;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
 Sheet.Cells[16,10]:=dm2.sel_ip.Fields[2].AsFloat;
 dm2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[10].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[14,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[14,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[14,9]:=dm2.usloviyav.Fields[5].AsFloat;
  Sheet.Cells[34,4]:=dm2.usloviyav.Fields[2].AsDateTime;
 DM2.usloviyav.Active:=false;
 dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.ad_q.Fields[0].Value;
 dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.ad_q.Fields[11].Value;
 dm2.usloviyav.ExecSQL;
 dm2.usloviyav.Active:=true;
 Sheet.Cells[17,17]:=dm2.usloviyav.Fields[4].AsFloat;
 Sheet.Cells[17,23]:=dm2.usloviyav.Fields[3].AsFloat;
 Sheet.Cells[17,9]:=dm2.usloviyav.Fields[5].AsFloat;
  end;
  // Создаем Вариантный Массив, который заполним выходными данными
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
   ArrayData1 := VarArrayCreate([1, 11, 1,10], varVariant);
  Cursor:=crHourGlass;
  i:=1;
  z:=1;
  // Заполняем массив
    dm2.tb_oed.Active:=false;
    dm2.tb_oed.Parameters.ParamByName('keyenergo').Value:=dm2.ad_q.Fields[0].AsInteger;
  dm2.tb_oed.ExecSQL;
  dm2.tb_oed.Active:=true;


  //dm2.tb_oed.First;


  while dm2.tb_oed.Eof<>true do begin
   dm2.danniye.active:=false;
   dm2.danniye.Parameters.ParamByName('tochka').Value:=dm2.tb_oed.Fields[1].AsFloat;
   dm2.danniye.Parameters.ParamByName('keylink').Value:=dm2.ad_q.Fields[0].AsInteger;
   dm2.danniye.ExecSQL;
    dm2.danniye.Active:=true;
    j:=1;
    k:=1;
   repeat
     ArrayData[I, J] :=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      j:=j+1;
   until j=11;

   repeat
     mas_o[k]:=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      k:=k+1;
   until k=11;

    repeat
     ArrayData[I, J] :=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      j:=j+1;
    until j=21;

    repeat
     mas_o[k]:=dm2.danniye.Fields[3].AsFloat;
     DM2.danniye.Next;
      k:=k+1;
    until k=21;
    i:=i+1;
    j:=1;
   repeat
     ArrayData[i,j]:=mas_o[j];
     DM2.danniye.Next;
      j:=j+1;
   until j=21;

   ArrayData1[z,1]:=dm2.tb_oed.Fields[1].AsFloat;
   ArrayData1[z,2]:=dm2.tb_oed.Fields[2].AsFloat;
   ArrayData1[z,3]:=dm2.tb_oed.Fields[3].AsFloat;
   ArrayData1[z,4]:=dm2.tb_oed.Fields[4].AsFloat;
   ArrayData1[z,5]:=dm2.tb_oed.Fields[5].AsFloat;
   ArrayData1[z,6]:=dm2.tb_oed.Fields[6].AsFloat;
   ArrayData1[z,7]:=dm2.tb_oed.Fields[7].AsFloat;
   ArrayData1[z,8]:=sqr(dm2.tb_oed.Fields[7].AsFloat)/12;
   ArrayData1[z,9]:=dm2.tb_oed.Fields[8].AsFloat;
   ArrayData1[z,10]:=dm2.tb_oed.Fields[9].AsFloat;
   Sheet.Cells[19+2*z,3]:=dm2.tb_oed.Fields[1].AsFloat;
   z:=z+1;

   i:=i+1;
   dm2.tb_oed.Next;
   if i=12 then dm2.tb_oed.Last;
        end;
  // Левая верхняя ячейка области, в которую будем выводить данные
  Cell1 := WorkBook.WorkSheets[2].Cells[BeginRow, BeginCol];
  // Правая нижняя ячейка области, в которую будем выводить данные
  Cell2 := WorkBook.WorkSheets[2].Cells[BeginRow  + RowCount - 1, BeginCol +
ColCount - 1];

  // Область, в которую будем выводить данные
  Range := WorkBook.WorkSheets[2].Range[Cell1, Cell2];

  // А вот и сам вывод данных
  // Намного быстрее поячеечного присвоения

  Range.Value := ArrayData;

   BeginCol:=1;
  BeginRow:=7;
  RowCount:=6;
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

  Sheet := Workbook.Sheets.Item[3];
  Sheet.Cells[6,1]:=dm2.ad_q.Fields[7].AsString;


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
end;
  ExcelApp.Visible := true;

end;

end.


