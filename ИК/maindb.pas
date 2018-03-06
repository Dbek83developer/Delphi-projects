unit maindb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, StdCtrls, DBCtrls, ExtCtrls, Spin,
  Buttons,Math,comobj;

type
  Tdbform = class(TForm)
    gridall: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    gridobyekt: TDBGrid;
    cb_tt: TComboBox;
    cb_tn: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_poter: TEdit;
    Label3: TLabel;
    Button1: TButton;
    rd_tip: TRadioGroup;
    vaqt: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ed_davl: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Button2: TButton;
    Button3: TButton;
    sp_t: TEdit;
    sp_vpit: TEdit;
    sp_vsep: TEdit;
    sp_npit: TEdit;
    sp_nsep: TEdit;
    sp_vlaj: TEdit;
    ed_poterc: TEdit;
    ed_poterb: TEdit;
    Button4: TButton;
    Panel2: TPanel;
    sg: TStringGrid;
    gridps: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure vaqtCloseUp(Sender: TObject);
    procedure rd_tipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
const koef=1.96;
var
  dbform: Tdbform;
  sko_utm,sko_utmru:real;

implementation

uses datamoduleunit, Uasos;
{$R *.dfm}

function pogr(s:string):real;
 var
 pog,p_sh:real;
res:real;
 begin
 //res:=0;
 p_sh:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
 dm2.sel_ip.Active:=false;
 dm2.sel_ip.Parameters.ParamByName('tip').Value:=s;
 dm2.sel_ip.ExecSQL;
 dm2.sel_ip.Active:=true;
  pog:=0.01*dm2.sel_ip.Fields[2].Value*p_sh;
  res:=roundto(pog/sqrt(3),-5);

  result:=res;
 end;
function Dop_pog(str:string):real;
 var
 sko,skoip:real;
 K,p,pog,pog_t,pog_vlaj,pog_vpit,pog_vsep,pog_npit,pog_nsep,pog_davl,p_sh:real;
res:real;
 begin
    res:=0;
   dm2.ip.Active:=true;
 dm2.ip.First;
 while not dm2.ip.Eof do
 begin
  p_sh:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
if  dm2.ipTip.Value=str then
       begin
       p:=0;
       pog:=0.01*dm2.ipOPrP.Value*p_sh;
       sko:=pog/sqrt(3);
       pog_t:=dm2.ipt.Value;
       pog_vlaj:=dm2.ipvl.Value;
       pog_vpit:=dm2.ipv_pit.Value;
       pog_davl:=dm2.ipdavl.Value;
       pog_vsep:=dm2.ipv_sep.Value;
       pog_npit:=dm2.ipn_pit.Value;
       pog_nsep:=dm2.ipn_sep.Value;

       K:=abs(dm2.iptemp.Value-20)/10;
       if  K*pog_t>=0.17*dm2.ipOPrP.Value then begin
                                               skoip:=K*p_sh*0.01*pog_t/sqrt(3);
                                               p:=sqr(skoip);

                                               end;
       if (dm2.ipv_do.Value-dm2.ipv_ot.Value)<>0 then
       K:=abs(dm2.ipv_do.Value-dm2.ippitnom.Value)/(dm2.ipv_do.Value-dm2.ippitnom.Value);
       if K*pog_vpit>=0.17*dm2.ipOPrP.Value then
                                              begin
                                              skoip:=K*p_sh*0.01*pog_vpit/sqrt(3);
                                              p:=sqr(skoip)+p;
                                              end;
       K:=abs(120-100)/40;
       if K*pog_vsep>=0.17*dm2.ipOPrP.Value then begin
                                                 skoip:=K*p_sh*0.01*pog_vsep/sqrt(3);
                                                 p:=sqr(skoip)+p;
                                                 end;
        if (dm2.ipn_do.Value-dm2.ipn_ot.Value)<>0 then
        begin
        K:=abs(dm2.ipn_do.Value-50)/(dm2.ipn_do.Value-dm2.ipn_ot.Value);
        if K*pog_nsep>=0.17*dm2.ipOPrP.Value then  begin
                                                   skoip:=K*p_sh*0.01*pog_nsep/sqrt(3);
                                                   p:=sqr(skoip)+p;
                                                   end;
        end;
        if (dm2.ipvl_do.Value-dm2.ipvl_ot.Value)<>0 then
       begin
        K:=abs(dm2.ipvl_do.Value-60)/(dm2.ipvl_do.Value-dm2.ipvl_ot.Value);
        if K*pog_vlaj>=0.17*dm2.ipOPrP.Value then begin
                                                skoip:=K*p_sh*0.01*pog_vlaj/sqrt(3);
                                                p:=sqr(skoip)+p;
                                                end;
       end;
       if (dm2.ipn_do.Value-dm2.ipn_ot.Value)<>0 then
       begin
       K:=abs(dm2.ipn_do.Value-50)/(dm2.ipn_do.Value-dm2.ipn_ot.Value);
       if K*pog_npit>=0.17*dm2.ipOPrP.Value then begin
                                                 skoip:=K*p_sh*0.01*pog_npit/sqrt(3);
                                                 p:=sqr(skoip)+p;
                                                 end;
       end;
       if (dm2.ipdavl_do.Value-dm2.ipdavl_ot.Value)<>0  then
       begin
       K:=abs(dm2.ipdavl_do.Value-101)/(dm2.ipdavl_do.Value-dm2.ipdavl_ot.Value);
       if K*pog_davl>=0.17*dm2.ipOPrP.Value then  begin
                                                 skoip:=K*p_sh*0.01*pog_davl/sqrt(3);
                                                 p:=sqr(skoip)+p;
                                                 end;
       end;

   res:=roundto(sqrt(sqr(sko)+p),-5);
       end;

      dm2.ip.Next;


  end; //while
  result:=res;
 end;

procedure readf(fName: String);  // имя файла
var
   f: TextFile;       // файл
   buf: String[80];   // буфер для чтения строк
   //sko_utm,sko_utmru:real;
begin

   AssignFile(f, fName);

   try
       Reset(f);  // открыть для чтения
   except
        on EInOutError do
        begin
            ShowMessage('Ошибка доступа к файлу '+
                            fName);
            exit;
        end;
   end;
    sko_utm:=0;
    sko_utmru:=0;
   // чтение из файла
   while not EOF(f) do
     begin
        readln(f, buf);       // прочитать строку из файла
      sko_utm:=sko_utm+sqr(pogr(buf));
      sko_utmru:=sko_utmru+sqr(Dop_pog(buf));
     end;
      sko_utm:=sqrt(sko_utm);
      sko_utmru:=sqrt(sko_utmru);
   CloseFile(f); // закрыть файл
end;

procedure Tdbform.Button1Click(Sender: TObject);
var
p_nom,p_sh,M_nu,dtt_a,dtt_c,dtt_b,dtn,K:real;
sko_ita,sko_itb,sko_itc,sko_ip,sko_ipru,sko_evm,f_a,f_c,f_b,ftn:real;
tt,tn:integer;
sko_ika,sko_ikb,sko_ikc:real;
p,pog,pog_t,pog_vlaj,pog_vpit,pog_vsep,pog_npit,pog_nsep,pog_davl:real;
doptta,dopttb,dopttc,ed_a,ed_b,ed_c,ed_potern,dftta,dfttb,dfttc:real;
s:string;
begin
 dm2.query_uslov.Active:=false;
 dm2.query_uslov.Parameters.ParamByName('vaqt').Value:= datetostr(vaqt.Date);
 dm2.query_uslov.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
 dm2.query_uslov.Active:=true;

tt:=1;
tn:=1;
dtn:=0;ftn:=0; f_b:=0;dtt_a:=0;dtt_b:=0;dtt_c:=0;f_c:=0;f_a:=0;doptta:=0;dopttb:=0;dopttc:=0;dftta:=0;dfttb:=0;dfttc:=0;
if dm2.bookTT.Text='1000/1' then tt:=1000;
if dm2.bookTT.Text='1000/5'then tt:=1000;
if dm2.bookTT.Text='1200/1'then tt:=1200;
if dm2.bookTT.Text='1200/5'then tt:=1200;
if dm2.bookTT.Text='1500/5'then tt:=1500;
if dm2.bookTT.Text='2000/1'then tt:=2000;
if dm2.bookTT.Text='2000/5'then tt:=2000;
if dm2.bookTT.Text='500/1'then tt:=500;
if dm2.bookTT.Text='600/1'then tt:=600;
if dm2.bookTT.Text='600/5'then tt:=600;
if dm2.bookTT.Text='300/1'then tt:=300;
if dm2.bookTT.Text='300/5'then tt:=300;
if dm2.bookTT.Text='200/1'then tt:=200;
if dm2.bookTT.Text='200/5'then tt:=200;
if dm2.bookTT.Text='750/5'then tt:=750;
if dm2.bookTT.Text='750/1'then tt:=750;
if dm2.bookTT.Text='375/1'then tt:=375;
if dm2.bookTT.Text='150/1'then tt:=150;
if dm2.bookTT.Text='150/5'then tt:=150;
if dm2.bookTN.Text='10000/100'then tn:=10000;
if dm2.bookTN.Text='110000/100'then tn:=110000;
if dm2.bookTN.Text='220000/100'then tn:=220000;
if dm2.bookTN.Text='500000/100'then tn:=500000;
 sko_utm:=0;
 sko_utmru:=0;
{sko UTM po struktere kanala raschet dlya vsego podstansii }
{  *******    otkrivayem fayl schitavayem kolichestva ************  }
{     *******  UTM i v sikle summiruyem        *************        }
 s:=inttostr(dm2.booklinkkey2.Value)+'.txt';
 readf(s); {prosedura gde rasschitivayetsya pogreshnosti UTMa}

if (dm2.bookznak.Text='P')or(dm2.bookznak.Text='Q') then
begin
if (dm2.bookShkala_min.Value<0)and(dm2.bookShkala_max.Value<>0) then  p_sh:=roundto((sqrt(3)*tt*tn*2*0.001*0.001),-5)
else p_sh:=roundto((sqrt(3)*tt*tn*0.001*0.001),-5);
 ed_a:=StrToFloat(ed_poter.Text);
 ed_b:=StrToFloat(ed_poterb.Text);
 ed_c:=StrToFloat(ed_poterc.Text);
 ed_potern:=roundto((sqrt((sqr(ed_a)+sqr(ed_b)+sqr(ed_c))/3)),-5);
 M_nu:=-0.01*p_sh*ed_potern;

 dm2.ADOTable1.Active:=true;
 dm2.ADOTable1.First;
  while not dm2.ADOTable1.Eof do
    begin
  if (dm2.ADOTable1Klass.Value=dm2.bookklass_TT.Value)and(dm2.ADOTable1faza.Value='A')and(dm2.ADOTable1Tipdatchika.Value='TT') then
 begin
 dtt_a:=dm2.ADOTable1osp.Value;
 f_a:=dm2.ADOTable1dup.Value;
  end;
  if (dm2.ADOTable1Klass.Value=dm2.bookklass_TT.Value)and(dm2.ADOTable1faza.Value='B')and(dm2.ADOTable1Tipdatchika.Value='TT') then
 begin
 dtt_b:=dm2.ADOTable1osp.Value;
 f_b:=dm2.ADOTable1dup.Value;
  end
  else
  begin
    if (dm2.ADOTable1Klass.Value=dm2. bookklass_TT.Value)and(dm2.ADOTable1faza.Value='C')and(dm2.ADOTable1Tipdatchika.Value='TT') then
        begin
        dtt_c:=dm2.ADOTable1osp.Value;
        f_c:=dm2.ADOTable1dup.Value;
        end; // if
  end;    //  if  else

   if strtofloat(cb_tt.Text)<>0 then
   if (dm2.ADOTable1Klass.Value=cb_tt.Text)and(dm2.ADOTable1faza.Value='A')and(dm2.ADOTable1Tipdatchika.Value='TT') then
 begin
 doptta:=dm2.ADOTable1osp.Value;
 dftta:=dm2.ADOTable1dup.Value;
  end;
  if strtofloat(cb_tt.Text)<>0 then
  if (dm2.ADOTable1Klass.Value=cb_tt.Text)and(dm2.ADOTable1faza.Value='B')and(dm2.ADOTable1Tipdatchika.Value='TT') then
 begin
 dopttb:=dm2.ADOTable1osp.Value;
 dfttb:=dm2.ADOTable1dup.Value;
  end
  else
  begin
   if strtofloat(cb_tt.Text)<>0 then
    if (dm2.ADOTable1Klass.Value=cb_tt.Text)and(dm2.ADOTable1faza.Value='C')and(dm2.ADOTable1Tipdatchika.Value='TT') then
        begin
        dopttc:=dm2.ADOTable1osp.Value;
        dfttc:=dm2.ADOTable1dup.Value;
        end; // if
  end;    //  if  else

  if (dm2.ADOTable1Klass.Value=dm2. bookklass_TN.Value)and(dm2.ADOTable1Tipdatchika.Value='TH') then
        begin
         dtn:=dm2.ADOTable1osp.Value;
         ftn:=dm2.ADOTable1dup.Value;
        end;
  dm2.ADOTable1.Next;
  end;  //if
 if dm2.bookznak.Text='P'then K:=0.6 else K:=1.8;
 sko_ita:=roundto((0.01*sqrt((sqr(dtt_a)+sqr(doptta)+sqr(dtn)+K*(sqr(f_a)+sqr(dftta)+sqr(ftn)))/3)*p_sh),-5);
 sko_itb:=roundto((0.01*sqrt((sqr(dtt_b)+sqr(dopttb)+sqr(dtn)+K*(sqr(f_b)+sqr(dfttb)+sqr(ftn)))/3)*p_sh),-5);
 sko_itc:=roundto((0.01*sqrt((sqr(dtt_c)+sqr(dopttc)+sqr(dtn)+K*(sqr(f_c)+sqr(dfttc)+sqr(ftn)))/3)*p_sh),-5);

 sko_ip:=pogr(dm2.bookTIP.value);
 sko_ipru:=Dop_pog(dm2.bookTIP.Value);
 sko_evm:=roundto((abs((p_sh-(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value))/p_sh)*100),-5);

 sg.Cells[1,0]:='НУ;0-5%';
 sg.Cells[2,0]:='НУ;5-20%';
 sg.Cells[3,0]:='НУ;20-100%';
 sg.Cells[4,0]:='РУ;0-5%';
 sg.Cells[5,0]:='РУ;5-20%';
 sg.Cells[6,0]:='РУ;20-100%';

 sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 sko_ikb:=roundto((sqrt(sqr(sko_itb)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 sko_ikc:=roundto((sqrt(sqr(sko_itc)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);

 dm2.ins_granisa.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
 dm2.ins_granisa.Parameters.ParamByName('mat').Value:=M_nu;
 dm2.ins_granisa.Parameters.ParamByName('sko_ip').Value:=sko_ip;
 dm2.ins_granisa.Parameters.ParamByName('sko_utm').Value:=sko_utm;
 dm2.ins_granisa.Parameters.ParamByName('sko_ipru').Value:=sko_ipru;
 dm2.ins_granisa.Parameters.ParamByName('sko_utmru').Value:=sko_utmru;
 dm2.ins_granisa.Parameters.ParamByName('sko_suma').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumb').Value:=sko_ikb;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumc').Value:=sko_ikc;

 dm2.ins_granisa.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
 dm2.ins_granisa.Parameters.ParamByName('naimenovaniye').Value:=dm2.booknom.Value;
 dm2.ins_granisa.Parameters.ParamByName('obyekt').Value:=dm2.tablepsDSDesigner2.Value;
 dm2.ins_granisa.Parameters.ParamByName('sko_a').Value:=sko_ita;
 dm2.ins_granisa.Parameters.ParamByName('sko_b').Value:=sko_itb;
 dm2.ins_granisa.Parameters.ParamByName('sko_c').Value:=sko_itc;
 dm2.ins_granisa.Parameters.ParamByName('k_tt').Value:=strtofloat(cb_tt.Text);
 dm2.ins_granisa.Parameters.ParamByName('k_tn').Value:=strtofloat(cb_tn.Text);
 dm2.ins_granisa.Parameters.ParamByName('vremya').Value:=datetostr(vaqt.Date);
 p:=M_nu-koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('nnu_5').Value:=roundto(p,-5);
 sg.Cells[1,1]:=floattostr(roundto(p,-4));

 p:=M_nu+koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('vnu_5').Value:=roundto(p,-5);
 sg.Cells[1,2]:=floattostr(RoundTo(p,-4));

 p:=M_nu-koef*sko_ikb;
  dm2.ins_granisa.Parameters.ParamByName('nnu_20').Value:=roundto(p,-5);
 sg.Cells[2,1]:=floattostr(RoundTo(p,-4));

 p:=M_nu+koef*sko_ikb;
  dm2.ins_granisa.Parameters.ParamByName('vnu_20').Value:=roundto(p,-5);
 sg.Cells[2,2]:=floattostr(RoundTo(p,-4));

 p:=M_nu-koef*sko_ikc;
   dm2.ins_granisa.Parameters.ParamByName('nnu_100').Value:=roundto(p,-5);
 sg.Cells[3,1]:=floattostr(RoundTo(p,-4));

 p:=M_nu+koef*sko_ikc;
   dm2.ins_granisa.Parameters.ParamByName('vnu_100').Value:=roundto(p,-5);
 sg.Cells[3,2]:=floattostr(RoundTo(p,-4));

 {Расчёт нижней  Н и верхней  В границы интервала суммарной погрешности ИК в рабочих условиях эксплуатации.}

 sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ipru)+sqr(sko_utmru)+sqr(sko_evm))),-5);
 sko_ikb:=roundto((sqrt(sqr(sko_itb)+sqr(sko_ipru)+sqr(sko_utmru)+sqr(sko_evm))),-5);
 sko_ikc:=roundto((sqrt(sqr(sko_itc)+sqr(sko_ipru)+sqr(sko_utmru)+sqr(sko_evm))),-5);

 dm2.ins_granisa.Parameters.ParamByName('sko_sumaru').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumbru').Value:=sko_ikb;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumcru').Value:=sko_ikc;

   p:=M_nu-koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('nru_5').Value:=roundto(p,-5);
 sg.Cells[4,1]:=floattostr(roundto(p,-4));

 p:=M_nu+koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('vru_5').Value:=roundto(p,-5);
 sg.Cells[4,2]:=floattostr(RoundTo(p,-4));

 p:=M_nu-koef*sko_ikb;
    dm2.ins_granisa.Parameters.ParamByName('nru_20').Value:=roundto(p,-5);
 sg.Cells[5,1]:=floattostr(RoundTo(p,-4));

 p:=M_nu+koef*sko_ikb;
   dm2.ins_granisa.Parameters.ParamByName('vru_20').Value:=roundto(p,-5);
 sg.Cells[5,2]:=floattostr(RoundTo(p,-4));

 p:=M_nu-koef*sko_ikc;
 dm2.ins_granisa.Parameters.ParamByName('nru_100').Value:=roundto(p,-5);
 sg.Cells[6,1]:=floattostr(RoundTo(p,-4));

 p:=M_nu+koef*sko_ikc;
 dm2.ins_granisa.Parameters.ParamByName('vru_100').Value:=roundto(p,-5);
 sg.Cells[6,2]:=floattostr(RoundTo(p,-4));

 dm2.ins_granisa.Parameters.ParamByName('nexp').Value:=floattostr(ed_potern);
 dm2.ins_granisa.Parameters.ParamByName('vexp').Value:=floattostr(sko_evm);
 dm2.ins_granisa.ExecSQL;

 // sg.Cells

 end;
////////////////\\\\\\\\\\\\ {для напряжение U}   ///////////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\


 if dm2.bookznak.Text='U' then
begin
 p_sh:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
 ed_potern:=roundto((StrToFloat(ed_poter.Text)),-5);
 M_nu:=roundto((-0.01*p_sh*ed_potern),-5);

 dm2.ADOTable1.Active:=true;
 dm2.ADOTable1.First;

  while not dm2.ADOTable1.Eof do
  begin

  if (dm2.ADOTable1Klass.Value=dm2.bookklass_TN.Value)and(dm2.ADOTable1Tipdatchika.Value='TH') then
        begin
         dtn:=dm2.ADOTable1osp.Value;
//         ftn:=dm2.ADOTable1dup.Value;
        end;
  dm2.ADOTable1.Next;
  end;  //if
  sko_ita:=roundto((0.01*sqrt(((sqr(dtn))/3))*tn*0.001),-5);

 sko_ip:=pogr(dm2.bookTIP.value);
 sko_ipru:=Dop_pog(dm2.bookTIP.Value);
 sko_evm:=0;

 sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 dm2.ins_granisa.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
 dm2.ins_granisa.Parameters.ParamByName('mat').Value:=M_nu;
 dm2.ins_granisa.Parameters.ParamByName('sko_ip').Value:=sko_ip;
 dm2.ins_granisa.Parameters.ParamByName('sko_utm').Value:=sko_utm;
 dm2.ins_granisa.Parameters.ParamByName('sko_ipru').Value:=sko_ipru;
 dm2.ins_granisa.Parameters.ParamByName('sko_utmru').Value:=sko_utmru;
 dm2.ins_granisa.Parameters.ParamByName('sko_suma').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumb').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumc').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
 dm2.ins_granisa.Parameters.ParamByName('naimenovaniye').Value:=dm2.booknom.Value;
 dm2.ins_granisa.Parameters.ParamByName('obyekt').Value:=dm2.tablepsDSDesigner2.Value;
 dm2.ins_granisa.Parameters.ParamByName('sko_a').Value:=sko_ita;
 dm2.ins_granisa.Parameters.ParamByName('sko_b').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_c').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('k_tt').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('k_tn').Value:=strtofloat(cb_tn.Text);
 dm2.ins_granisa.Parameters.ParamByName('vremya').Value:=DateToStr(vaqt.Date);

 sg.Cells[1,0]:='НУ;';
 sg.Cells[4,0]:='';
 sg.Cells[3,0]:='';
 sg.Cells[2,0]:='РУ;';
 sg.Cells[5,0]:='';
 sg.Cells[6,0]:='';

  p:=M_nu-koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('nnu_5').Value:=roundto(p,-5);
  sg.Cells[1,1]:=floattostr(roundto(p,-4));

  p:=M_nu+koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('vnu_5').Value:=roundto(p,-5);
  sg.Cells[1,2]:=floattostr(RoundTo(p,-4));
 sg.Cells[4,1]:='';
 sg.Cells[4,2]:='';
 sg.Cells[3,1]:='';
 sg.Cells[3,2]:='';

 {Расчёт нижней  Н и верхней  В границы интервала суммарной погрешности ИК в рабочих условиях эксплуатации.}

  sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ipru)+sqr(sko_utmru))),-5);
 dm2.ins_granisa.Parameters.ParamByName('sko_sumaru').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumbru').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumcru').Value:=0;


  p:=M_nu-koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('nru_5').Value:=roundto(p,-5);
  sg.Cells[2,1]:=floattostr(roundto(p,-4));

  p:=M_nu+koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('vru_5').Value:=roundto(p,-5);
  sg.Cells[2,2]:=floattostr(RoundTo(p,-4));
 sg.Cells[5,1]:='';
 sg.Cells[5,2]:='';
 sg.Cells[6,1]:='';
 sg.Cells[6,2]:='';

  dm2.ins_granisa.Parameters.ParamByName('nnu_20').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('vnu_20').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('nnu_100').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('vnu_100').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('nru_20').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('vru_20').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('nru_100').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('vru_100').Value:=0;

  dm2.ins_granisa.Parameters.ParamByName('nexp').Value:=floattostr(ed_potern);
 dm2.ins_granisa.Parameters.ParamByName('vexp').Value:=floattostr(sko_evm);
  dm2.ins_granisa.ExecSQL;

 // sg.Cells

 end;

 if dm2.bookznak.Text='I' then
begin
 dm2.ADOTable1.Active:=true;
 dm2.ADOTable1.First;
  while not dm2.ADOTable1.Eof do
  begin
 if (dm2.ADOTable1Klass.Value=dm2. bookklass_TT.Value)and(dm2.ADOTable1faza.Value='A') then
 begin
 dtt_a:=dm2.ADOTable1osp.Value;
  end;
  if (dm2.ADOTable1Klass.Value=dm2. bookklass_TT.Value)and(dm2.ADOTable1faza.Value='B') then
 begin
 dtt_b:=dm2.ADOTable1osp.Value;
  end
  else
  begin
    if (dm2.ADOTable1Klass.Value=dm2. bookklass_TT.Value)and(dm2.ADOTable1faza.Value='C') then
        begin
        dtt_c:=dm2.ADOTable1osp.Value;
        end; // if
  end;    //  if  else
  dm2.ADOTable1.Next;
  end;  //if


 sko_ita:=roundto((0.01*sqrt((sqr(dtt_a)+sqr(doptta))/3)*tt),-5);

 sko_itb:=roundto((0.01*sqrt((sqr(dtt_b)+sqr(dopttb))/3)*tt),-5);

 sko_itc:=roundto((0.01*sqrt((sqr(dtt_c)+sqr(dopttc))/3)*tt),-5);


 sko_ip:=pogr(dm2.bookTIP.value);
 sko_ipru:=Dop_pog(dm2.bookTIP.Value);
 sko_evm:=0;

 sg.Cells[1,0]:='НУ;0-5%';
 sg.Cells[2,0]:='НУ;5-20%';
 sg.Cells[3,0]:='НУ;20-100%';
 sg.Cells[4,0]:='РУ;0-5%';
 sg.Cells[5,0]:='РУ 5-20%';
 sg.Cells[6,0]:='РУ 20-100%';

 sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 sko_ikb:=roundto((sqrt(sqr(sko_itb)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 sko_ikc:=roundto((sqrt(sqr(sko_itc)+sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);
 dm2.ins_granisa.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
 dm2.ins_granisa.Parameters.ParamByName('mat').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_ip').Value:=sko_ip;
 dm2.ins_granisa.Parameters.ParamByName('sko_utm').Value:=sko_utm;
 dm2.ins_granisa.Parameters.ParamByName('sko_ipru').Value:=sko_ipru;
 dm2.ins_granisa.Parameters.ParamByName('sko_utmru').Value:=sko_utmru;
 dm2.ins_granisa.Parameters.ParamByName('sko_suma').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumb').Value:=sko_ikb;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumc').Value:=sko_ikc;

 dm2.ins_granisa.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
 dm2.ins_granisa.Parameters.ParamByName('naimenovaniye').Value:=dm2.booknom.Value;
 dm2.ins_granisa.Parameters.ParamByName('obyekt').Value:=dm2.tablepsDSDesigner2.Value;
 dm2.ins_granisa.Parameters.ParamByName('sko_a').Value:=sko_ita;
 dm2.ins_granisa.Parameters.ParamByName('sko_b').Value:=sko_itb;
 dm2.ins_granisa.Parameters.ParamByName('sko_c').Value:=sko_itc ;

  dm2.ins_granisa.Parameters.ParamByName('k_tt').Value:=strtofloat(cb_tt.Text);
 dm2.ins_granisa.Parameters.ParamByName('k_tn').Value:=0;//strtofloat(cb_tn.Text);
   dm2.ins_granisa.Parameters.ParamByName('vremya').Value:=DateToStr(vaqt.Date);
 p:=-koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('nnu_5').Value:=roundto(p,-5);
 sg.Cells[1,1]:=floattostr(roundto(p,-4));

 p:=koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('vnu_5').Value:=roundto(p,-5);
 sg.Cells[1,2]:=floattostr(RoundTo(p,-4));

 p:=-koef*sko_ikb;
  dm2.ins_granisa.Parameters.ParamByName('nnu_20').Value:=roundto(p,-5);
 sg.Cells[2,1]:=floattostr(RoundTo(p,-4));

 p:=koef*sko_ikb;
  dm2.ins_granisa.Parameters.ParamByName('vnu_20').Value:=roundto(p,-5);
 sg.Cells[2,2]:=floattostr(RoundTo(p,-4));

 p:=-koef*sko_ikc;
   dm2.ins_granisa.Parameters.ParamByName('nnu_100').Value:=roundto(p,-5);
 sg.Cells[3,1]:=floattostr(RoundTo(p,-4));

 p:=koef*sko_ikc;
   dm2.ins_granisa.Parameters.ParamByName('vnu_100').Value:=roundto(p,-5);
 sg.Cells[3,2]:=floattostr(RoundTo(p,-4));

 {Расчёт нижней  Н и верхней  В границы интервала суммарной погрешности ИК в рабочих условиях эксплуатации.}

 sko_ika:=roundto((sqrt(sqr(sko_ita)+sqr(sko_ipru)+sqr(sko_utmru))),-5);
 sko_ikb:=roundto((sqrt(sqr(sko_itb)+sqr(sko_ipru)+sqr(sko_utmru))),-5);
 sko_ikc:=roundto((sqrt(sqr(sko_itc)+sqr(sko_ipru)+sqr(sko_utmru))),-5);

 dm2.ins_granisa.Parameters.ParamByName('sko_sumaru').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumbru').Value:=sko_ikb;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumcru').Value:=sko_ikc;

   p:=-koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('nru_5').Value:=roundto(p,-5);
 sg.Cells[4,1]:=floattostr(roundto(p,-4));

 p:=koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('vru_5').Value:=roundto(p,-5);
 sg.Cells[4,2]:=floattostr(RoundTo(p,-4));

 p:=-koef*sko_ikb;
    dm2.ins_granisa.Parameters.ParamByName('nru_20').Value:=roundto(p,-5);
 sg.Cells[5,1]:=floattostr(RoundTo(p,-4));

 p:=koef*sko_ikb;
   dm2.ins_granisa.Parameters.ParamByName('vru_20').Value:=roundto(p,-5);
 sg.Cells[5,2]:=floattostr(RoundTo(p,-4));

 p:=-koef*sko_ikc;
 dm2.ins_granisa.Parameters.ParamByName('nru_100').Value:=roundto(p,-5);
 sg.Cells[6,1]:=floattostr(RoundTo(p,-4));

 p:=koef*sko_ikc;
 dm2.ins_granisa.Parameters.ParamByName('vru_100').Value:=roundto(p,-5);
 sg.Cells[6,2]:=floattostr(RoundTo(p,-4));

 dm2.ins_granisa.Parameters.ParamByName('nexp').Value:='0';
 dm2.ins_granisa.Parameters.ParamByName('vexp').Value:=floattostr(sko_evm);
 dm2.ins_granisa.ExecSQL;

 // sg.Cells

 end;
 //////////////////////////////////////частота F\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  if dm2.bookznak.Text='F' then
begin


   sko_ip:=pogr(dm2.bookTIP.value);
   sko_ipru:=Dop_pog(dm2.bookTIP.Value);
   sko_evm:=0;

 sg.Cells[1,0]:='НУ';
 sg.Cells[2,0]:='РУ';

 sko_ika:=roundto((sqrt(sqr(sko_ip)+sqr(sko_utm)+sqr(sko_evm))),-5);

 dm2.ins_granisa.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
 dm2.ins_granisa.Parameters.ParamByName('mat').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_ip').Value:=sko_ip;
 dm2.ins_granisa.Parameters.ParamByName('sko_utm').Value:=sko_utm;
 dm2.ins_granisa.Parameters.ParamByName('sko_ipru').Value:=sko_ipru;
 dm2.ins_granisa.Parameters.ParamByName('sko_utmru').Value:=sko_utmru;
 dm2.ins_granisa.Parameters.ParamByName('sko_suma').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumb').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumc').Value:=0;

 dm2.ins_granisa.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
 dm2.ins_granisa.Parameters.ParamByName('naimenovaniye').Value:=dm2.booknom.Value;
 dm2.ins_granisa.Parameters.ParamByName('obyekt').Value:=dm2.tablepsDSDesigner2.Value;
 dm2.ins_granisa.Parameters.ParamByName('sko_a').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_b').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_c').Value:=0;
  dm2.ins_granisa.Parameters.ParamByName('k_tt').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('k_tn').Value:=0;
dm2.ins_granisa.Parameters.ParamByName('vremya').Value:=DateToStr(vaqt.Date);
 p:=-koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('nnu_5').Value:=roundto(p,-5);
 sg.Cells[1,1]:=floattostr(roundto(p,-4));

 p:=koef*sko_ika;
  dm2.ins_granisa.Parameters.ParamByName('vnu_5').Value:=roundto(p,-5);
 sg.Cells[1,2]:=floattostr(RoundTo(p,-4));


 {Расчёт нижней  Н и верхней  В границы интервала суммарной погрешности ИК в рабочих условиях эксплуатации.}

 sko_ika:=roundto((sqrt(sqr(sko_ipru)+sqr(sko_utmru))),-5);

 dm2.ins_granisa.Parameters.ParamByName('sko_sumaru').Value:=sko_ika;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumbru').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('sko_sumcru').Value:=0;

   p:=-koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('nru_5').Value:=roundto(p,-5);
 sg.Cells[2,1]:=floattostr(roundto(p,-4));

 p:=koef*sko_ika;
   dm2.ins_granisa.Parameters.ParamByName('vru_5').Value:=roundto(p,-5);
 sg.Cells[2,2]:=floattostr(RoundTo(p,-4));
 sg.Cells[2,1]:='';
 sg.Cells[2,2]:='';
 sg.Cells[3,1]:='';
 sg.Cells[3,2]:='';
 sg.Cells[5,1]:='';
 sg.Cells[5,2]:='';
 sg.Cells[6,1]:='';
 sg.Cells[6,2]:='';
 dm2.ins_granisa.Parameters.ParamByName('nexp').Value:=0;
 dm2.ins_granisa.Parameters.ParamByName('vexp').Value:=floattostr(sko_evm);
 dm2.ins_granisa.ExecSQL;

 // sg.Cells

 end;


 sg.Cells[0,1]:='D нижняя';
 sg.Cells[0,2]:='D верхняя';
end;

procedure Tdbform.Button2Click(Sender: TObject);
begin
 dm2.ins_usloviya.Parameters.ParamByName('vaqt').Value:=vaqt.Date;
 case rd_tip.ItemIndex of
  0:begin
     dm2.ins_usloviya.Parameters.ParamByName('tipdat').Value:=dm2.bookTIP.Value;
     dm2.ins_usloviya.Parameters.ParamByName('t').Value:=strtofloat(sp_t.Text);
     dm2.ins_usloviya.Parameters.ParamByName('vlaj').Value:=strtofloat(sp_vlaj.Text);
     dm2.ins_usloviya.Parameters.ParamByName('davl').Value:=strtofloat(ed_davl.Text);
     dm2.ins_usloviya.Parameters.ParamByName('v_pit').Value:=strtofloat(sp_vpit.Text);
     dm2.ins_usloviya.Parameters.ParamByName('v_sep').Value:=strtofloat(sp_vsep.Text);
     dm2.ins_usloviya.Parameters.ParamByName('n_pit').Value:=strtofloat(sp_npit.Text);
     dm2.ins_usloviya.Parameters.ParamByName('n_sep').Value:=strtofloat(sp_nsep.Text);
     dm2.ins_usloviya.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
     dm2.ins_usloviya.ExecSQL;
    // dm2.ins_usloviya.Active:=false;
    end;
  1: begin
     dm2.ins_usloviya.Parameters.ParamByName('tipdat').Value:=dm2.bookUTM.Value;
     dm2.ins_usloviya.Parameters.ParamByName('t').Value:=strtofloat(sp_t.Text);
     dm2.ins_usloviya.Parameters.ParamByName('vlaj').Value:=strtofloat(sp_vlaj.Text);
     dm2.ins_usloviya.Parameters.ParamByName('davl').Value:=strtofloat(ed_davl.Text);
     dm2.ins_usloviya.Parameters.ParamByName('v_pit').Value:=strtofloat(sp_vpit.Text);
     dm2.ins_usloviya.Parameters.ParamByName('v_sep').Value:=strtofloat(sp_vsep.Text);
     dm2.ins_usloviya.Parameters.ParamByName('n_pit').Value:=strtofloat(sp_npit.Text);
     dm2.ins_usloviya.Parameters.ParamByName('n_sep').Value:=strtofloat(sp_nsep.Text);
     dm2.ins_usloviya.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
     dm2.ins_usloviya.ExecSQL;
    end;
end;
 ShowMessage('поехали!!!');
end;


procedure Tdbform.vaqtCloseUp(Sender: TObject);
var
da:boolean;
begin
sg.Visible:=true;
rd_tip.Enabled:=true;
rd_tip.ItemIndex:=0;
Button2.Enabled:=true;
 dm2.query_uslov.Active:=false;
 dm2.query_uslov.Parameters.ParamByName('vaqt').Value:=vaqt.Date;
 dm2.query_uslov.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;

case rd_tip.ItemIndex of
  0:begin
     dm2.query_uslov.Parameters.ParamByName('tipdat').Value:=dm2.bookTIP.Value;
     dm2.query_uslov.ExecSQL;
     dm2.query_uslov.Active:=true;
     dm2.query_uslov.First;
     if dm2.query_uslov.RecordCount<1 then da:=false
      else  da:=true;
     while dm2.query_uslov.Eof<>true do
   if dm2.query_uslovtipdat.Value=dm2.bookTIP.Value then begin
                                                              sp_t.text:=floattostr(dm2.query_uslovt.Value);
                                                              ed_davl.Text:=floattostr(dm2.query_uslovdavl.Value);
                                                              sp_vlaj.Text:=floattostr(dm2.query_uslovvlaj.Value);
                                                              sp_vpit.Text:=floattostr(dm2.query_uslovv_pit.Value);
                                                              sp_vsep.Text:=floattostr(dm2.query_uslovv_sep.Value);
                                                              sp_npit.Text:=floattostr(dm2.query_uslovn_pit.Value);
                                                              sp_nsep.Text:=floattostr(dm2.query_uslovn_sep.Value);
                                                              dm2.query_uslov.Next;
                                                              da:=true;
                                                             end
                                                             else dm2.query_uslov.Next;
  if not da then begin
                 ShowMessage('Для ИП этого канала не введен "Условия проведения испытаний:"');
                sp_t.Text:='0';
                ed_davl.Text:='101';
                sp_vlaj.Text:='0';
                sp_vpit.Text:='0';
                sp_vsep.Text:='0';
                sp_npit.Text:='0';
                sp_nsep.Text:='0';
                 end;
   end;
  1: begin
     dm2.query_uslov.Parameters.ParamByName('tipdat').Value:=dm2.bookUTM.Value;
     dm2.query_uslov.ExecSQL;
     dm2.query_uslov.Active:=true;
     dm2.query_uslov.First;
     if dm2.query_uslov.RecordCount<1 then da:=false
      else  da:=true;
     while dm2.query_uslov.Eof<>true do

     if dm2.query_uslovtipdat.Value=dm2.bookUTM.Value then begin
                                                              sp_t.text:=floattostr(dm2.query_uslovt.Value);
                                                              ed_davl.Text:=floattostr(dm2.query_uslovdavl.Value);
                                                              sp_vlaj.Text:=floattostr(dm2.query_uslovvlaj.Value);
                                                              sp_vpit.Text:=floattostr(dm2.query_uslovv_pit.Value);
                                                              sp_vsep.Text:=floattostr(dm2.query_uslovv_sep.Value);
                                                              sp_npit.Text:=floattostr(dm2.query_uslovn_pit.Value);
                                                              sp_nsep.Text:=floattostr(dm2.query_uslovn_sep.Value);
                                                              dm2.query_uslov.Next;
                                                              da:=true;
                                                             end

                                                             else dm2.query_uslov.Next;

  if not da then begin
                 ShowMessage('Для УТМ этого канала не введен "Условия проведения испытаний:"');
                sp_t.Text:='0';
                ed_davl.Text:='101';
                sp_vlaj.Text:='0';
                sp_vpit.Text:='0';
                sp_vsep.Text:='0';
                sp_npit.Text:='0';
                sp_nsep.Text:='0';
                 end;
      end;//while

end;
 if (dm2.bookznak.Text='P')or(dm2.bookznak.Text='Q')or(dm2.bookznak.Text='U') then
begin
Label3.Visible:=true;
ed_poter.Visible:=True;
ed_poterb.visible:=true;
ed_poterc.Visible:=true;
end;
if (dm2.bookznak.Text='I')or(dm2.bookznak.Text='F') then
begin
Label3.Visible:=false;
ed_poter.Visible:=false;
ed_poterb.visible:=false;
ed_poterc.Visible:=false;
end;

end;

procedure Tdbform.rd_tipClick(Sender: TObject);
var
da:boolean;
begin
sg.Visible:=true;
rd_tip.Enabled:=true;
//rd_tip.ItemIndex:=0;
Button2.Enabled:=true;
 dm2.query_uslov.Active:=false;
 dm2.query_uslov.Parameters.ParamByName('vaqt').Value:=vaqt.Date;
 dm2.query_uslov.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;


case rd_tip.ItemIndex of
  0:begin
  dm2.query_uslov.Parameters.ParamByName('tipdat').Value:=dm2.bookTIP.Value;
  dm2.query_uslov.ExecSQL;
  dm2.query_uslov.Active:=true;
  if dm2.query_uslov.RecordCount<1 then da:=false
   else  da:=true;
  dm2.query_uslov.First;
   while dm2.query_uslov.Eof<>true do
   if (dm2.query_uslovlinkkey.Value=dm2.bookDSDesigner.Value)and(dm2.query_uslovtipdat.Value=dm2.bookTIP.Value) then begin
                                                              sp_t.text:=floattostr(dm2.query_uslovt.Value);
                                                              ed_davl.Text:=floattostr(dm2.query_uslovdavl.Value);
                                                              sp_vlaj.Text:=floattostr(dm2.query_uslovvlaj.Value);
                                                              sp_vpit.Text:=floattostr(dm2.query_uslovv_pit.Value);
                                                              sp_vsep.Text:=floattostr(dm2.query_uslovv_sep.Value);
                                                              sp_npit.Text:=floattostr(dm2.query_uslovn_pit.Value);
                                                              sp_nsep.Text:=floattostr(dm2.query_uslovn_sep.Value);
                                                              dm2.query_uslov.Next;
                                                              da:=true;
                                                            end
                                                             else dm2.query_uslov.Next;
  if not da then begin
                 ShowMessage('Для ИП этого канала не введен "Условия проведения испытаний:"');
                sp_t.Text:='0';
                ed_davl.Text:='101';
                sp_vlaj.Text:='0';
                sp_vpit.Text:='0';
                sp_vsep.Text:='0';
                sp_npit.Text:='0';
                sp_nsep.Text:='0';
                 end;
   end;
  1: begin
     dm2.query_uslov.Parameters.ParamByName('tipdat').Value:=dm2.bookUTM.Value;
     dm2.query_uslov.ExecSQL;
     dm2.query_uslov.Active:=true;
     dm2.query_uslov.First;
     if dm2.query_uslov.RecordCount<1 then da:=false
      else  da:=true;
     while dm2.query_uslov.Eof<>true do

     if (dm2.query_uslovlinkkey.Value=dm2.bookDSDesigner.Value)and(dm2.query_uslovtipdat.Value=dm2.bookUTM.Value) then begin
                                                              sp_t.text:=floattostr(dm2.query_uslovt.Value);
                                                              ed_davl.Text:=floattostr(dm2.query_uslovdavl.Value);
                                                              sp_vlaj.Text:=floattostr(dm2.query_uslovvlaj.Value);
                                                              sp_vpit.Text:=floattostr(dm2.query_uslovv_pit.Value);
                                                              sp_vsep.Text:=floattostr(dm2.query_uslovv_sep.Value);
                                                              sp_npit.Text:=floattostr(dm2.query_uslovn_pit.Value);
                                                              sp_nsep.Text:=floattostr(dm2.query_uslovn_sep.Value);
                                                              dm2.query_uslov.Next;
                                                              da:=true;
                                                              end

                                                             else dm2.query_uslov.Next;

  if not da then begin
                 ShowMessage('Для УТМ этого канала не введен "Условия проведения испытаний:"');
                sp_t.Text:='0';
                ed_davl.Text:='101';
                sp_vlaj.Text:='0';
                sp_vpit.Text:='0';
                sp_vsep.Text:='0';
                sp_npit.Text:='0';
                sp_nsep.Text:='0';
                 end;
      end;//while

end;
end;


procedure Tdbform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Main.show;
end;

procedure Tdbform.Button4Click(Sender: TObject);
var
    ExcelApp,Sheet, Workbook{, Range, Cell1, Cell2, ArrayData, ArrayData1 } : Variant;
    S: String;
   i,i1,i2,t,k : integer;
   f_a,f_b,f_c,f_av,f_bv,f_cv,delta_na,delta_nb,delta_nc,delta_va,delta_vb,delta_vc:real;

shkala:real;
str1,str2:string;

begin
 if dm2.OpenDialog1.Execute then S:=dm2.OpenDialog1.FileName;
 try
   // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');

  // Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;
  //  Создаем Книгу (Workbook)
  //  Если заполняем шаблон, то Workbook := ExcelApp.WorkBooks.Add('C:\MyTemplate.xls');
  Workbook := ExcelApp.WorkBooks.Add(s);
 // Workbook := ExcelApp.WorkBooks.Add;

  i:=0;
  i1:=1;
  i2:=0;
  t:=1;
  Sheet := Workbook.Sheets.Item[1];
  Sheet.Cells[1,1]:='Расчёты предельно допустимой погрешности ИК системы ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;
  Sheet := Workbook.Sheets.Item[2];
  Sheet.Cells[1,1]:='Расчёты предельно допустимой погрешности ИК системы ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;
  Sheet := Workbook.Sheets.Item[3];
  Sheet.Cells[1,1]:='Расчёты предельно допустимой погрешности ИК системы ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;
  Sheet := Workbook.Sheets.Item[4];
  Sheet.Cells[1,1]:='Замер внешних условий и влияющих величин ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;
  Sheet := Workbook.Sheets.Item[6];
  Sheet.Cells[1,1]:='Таблица внешних условий и влияющих факторов';
  Sheet := Workbook.Sheets.Item[7];
  Sheet.Cells[1,1]:='Расчёты предельно допустимой погрешности ИК системы ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;
  Sheet := Workbook.Sheets.Item[8];
  Sheet.Cells[1,1]:='Расчёты предельно допустимой погрешности ИК системы ОИК АСДУ ГАК "Узбекэнерго" по '+dm2.tablepsDSDesigner2.Value;

  dm2.book.First;
  while dm2.book.Eof<>true do
      begin
       i:=i+1;
    if    (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q')or(dm2.bookznak.Value='I') then
             begin
             i2:=i2+1;
               dm2.nij_verx.Active:=false;
               dm2.nij_verx.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
               dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.booknom.Value;
               dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
               dm2.nij_verx.ExecSQL;
               dm2.nij_verx.Active:=true;

               dm2.qchegara.Active:=false;
               dm2.qchegara.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
               dm2.qchegara.Parameters.ParamByName('linkps').Value:=dm2.booklinkkey2.Value;
               dm2.qchegara.ExecSQL;
               dm2.qchegara.Active:=true;
               if i2<15 then begin
               Sheet := Workbook.Sheets.Item[1];
               Sheet.Cells[6+2*i2,1]:=i2;
               Sheet.Cells[6+2*i2,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i2,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i2,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               shkala:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
               Sheet.Cells[6+2*i2,6]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[6+2*i2,7]:=abs(dm2.nij_verx.Fields[3].AsFloat)*100/shkala;
               Sheet.Cells[7+2*i2,6]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[7+2*i2,7]:=abs(dm2.nij_verx.Fields[6].AsFloat*100)/shkala;



               Sheet.Cells[6+2*i2,8]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[6+2*i2,9]:=abs(dm2.nij_verx.Fields[4].AsFloat)*100/shkala;
               Sheet.Cells[7+2*i2,8]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[7+2*i2,9]:=abs(dm2.nij_verx.Fields[7].AsFloat)*100/shkala;

               Sheet.Cells[6+2*i2,10]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[6+2*i2,11]:=abs(dm2.nij_verx.Fields[5].AsFloat*100)/shkala;
               Sheet.Cells[7+2*i2,10]:=dm2.nij_verx.Fields[8].AsFloat;
               Sheet.Cells[7+2*i2,11]:=abs(dm2.nij_verx.Fields[8].AsFloat*100)/shkala;

               f_a:=dm2.qchegara.Fields[6].AsFloat;
               Sheet.Cells[6+2*i2,18]:=f_a;
               Sheet.Cells[6+2*i2,19]:=abs(f_a)*100/shkala;
               f_av:=dm2.qchegara.Fields[9].AsFloat;
               Sheet.Cells[7+2*i2,18]:=f_av;
               Sheet.Cells[7+2*i2,19]:=abs(f_av)*100/shkala;

               f_b:=dm2.qchegara.Fields[7].AsFloat;
               Sheet.Cells[6+2*i2,20]:=f_b;
               Sheet.Cells[6+2*i2,21]:=abs(f_b)*100/shkala;
               f_bv:=dm2.qchegara.Fields[10].AsFloat;
               Sheet.Cells[7+2*i2,20]:=f_bv;
               Sheet.Cells[7+2*i2,21]:=abs(f_bv)*100/shkala;

               f_c:=dm2.qchegara.Fields[8].AsFloat;
               Sheet.Cells[6+2*i2,22]:=f_c;
               Sheet.Cells[6+2*i2,23]:=abs(f_c)*100/shkala;
               f_cv:=dm2.qchegara.Fields[11].AsFloat;
               Sheet.Cells[7+2*i2,22]:=f_cv;
               Sheet.Cells[7+2*i2,23]:=abs(f_cv)*100/shkala;

               delta_na:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[6+2*i2,12]:=delta_na;
               Sheet.Cells[6+2*i2,13]:=abs(delta_na)*100/shkala;
               delta_va:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[7+2*i2,12]:=delta_va;
               Sheet.Cells[7+2*i2,13]:=abs(delta_va)*100/shkala;

               delta_nb:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[6+2*i2,14]:=delta_nb;
               Sheet.Cells[6+2*i2,15]:=abs(delta_nb)*100/shkala;
               delta_vb:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[7+2*i2,14]:=delta_vb;
               Sheet.Cells[7+2*i2,15]:=abs(delta_vb)*100/shkala;
               delta_nc:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[6+2*i2,16]:=delta_nc;
               Sheet.Cells[6+2*i2,17]:=abs(delta_nc)*100/shkala;
               delta_vc:=dm2.nij_verx.Fields[16].AsFloat;
               Sheet.Cells[7+2*i2,16]:=delta_vc;
               Sheet.Cells[7+2*i2,17]:=abs(delta_vc)*100/shkala;

               if (delta_na>=f_a)or(delta_va<=f_av)or(delta_nb>=f_b)or(delta_vb<=f_bv)or(delta_nc>=f_c)or(delta_vc<=f_cv) then Sheet.Cells[6+2*i2,24]:='превышает расчетные погрешности'
                else Sheet.Cells[6+2*i2,24]:='не превышает расчетные погрешности';
                 end // end if
          else
            begin
               Sheet := Workbook.Sheets.Item[1];
               Sheet.Cells[7+2*i2,1]:=i2;
               Sheet.Cells[7+2*i2,2]:=dm2.booknom.Value;
               Sheet.Cells[7+2*i2,3]:=dm2.bookznak.Value;
               Sheet.Cells[7+2*i2,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               shkala:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
               Sheet.Cells[7+2*i2,6]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[7+2*i2,7]:=abs(dm2.nij_verx.Fields[3].AsFloat)*100/shkala;
               Sheet.Cells[8+2*i2,6]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[8+2*i2,7]:=abs(dm2.nij_verx.Fields[6].AsFloat*100)/shkala;



               Sheet.Cells[7+2*i2,8]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[7+2*i2,9]:=abs(dm2.nij_verx.Fields[4].AsFloat)*100/shkala;
               Sheet.Cells[8+2*i2,8]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[8+2*i2,9]:=abs(dm2.nij_verx.Fields[7].AsFloat)*100/shkala;

               Sheet.Cells[7+2*i2,10]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[7+2*i2,11]:=abs(dm2.nij_verx.Fields[5].AsFloat*100)/shkala;
               Sheet.Cells[8+2*i2,10]:=dm2.nij_verx.Fields[8].AsFloat;
               Sheet.Cells[8+2*i2,11]:=abs(dm2.nij_verx.Fields[8].AsFloat*100)/shkala;

               f_a:=dm2.qchegara.Fields[6].AsFloat;
               Sheet.Cells[7+2*i2,18]:=f_a;
               Sheet.Cells[7+2*i2,19]:=abs(f_a)*100/shkala;
               f_av:=dm2.qchegara.Fields[9].AsFloat;
               Sheet.Cells[8+2*i2,18]:=f_av;
               Sheet.Cells[8+2*i2,19]:=abs(f_av)*100/shkala;

               f_b:=dm2.qchegara.Fields[7].AsFloat;
               Sheet.Cells[7+2*i2,20]:=f_b;
               Sheet.Cells[7+2*i2,21]:=abs(f_b)*100/shkala;
               f_bv:=dm2.qchegara.Fields[10].AsFloat;
               Sheet.Cells[8+2*i2,20]:=f_bv;
               Sheet.Cells[8+2*i2,21]:=abs(f_bv)*100/shkala;

               f_c:=dm2.qchegara.Fields[8].AsFloat;
               Sheet.Cells[7+2*i2,22]:=f_c;
               Sheet.Cells[7+2*i2,23]:=abs(f_c)*100/shkala;
               f_cv:=dm2.qchegara.Fields[11].AsFloat;
               Sheet.Cells[8+2*i2,22]:=f_cv;
               Sheet.Cells[8+2*i2,23]:=abs(f_cv)*100/shkala;

               delta_na:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[7+2*i2,12]:=delta_na;
               Sheet.Cells[7+2*i2,13]:=abs(delta_na)*100/shkala;
               delta_va:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[8+2*i2,12]:=delta_va;
               Sheet.Cells[8+2*i2,13]:=abs(delta_va)*100/shkala;

               delta_nb:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[7+2*i2,14]:=delta_nb;
               Sheet.Cells[7+2*i2,15]:=abs(delta_nb)*100/shkala;
               delta_vb:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[8+2*i2,14]:=delta_vb;
               Sheet.Cells[8+2*i2,15]:=abs(delta_vb)*100/shkala;
               delta_nc:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[7+2*i2,16]:=delta_nc;
               Sheet.Cells[7+2*i2,17]:=abs(delta_nc)*100/shkala;
               delta_vc:=dm2.nij_verx.Fields[16].AsFloat;
               Sheet.Cells[8+2*i2,16]:=delta_vc;
               Sheet.Cells[8+2*i2,17]:=abs(delta_vc)*100/shkala;

               if (delta_na>=f_a)or(delta_va<=f_av)or(delta_nb>=f_b)or(delta_vb<=f_bv)or(delta_nc>=f_c)or(delta_vc<=f_cv) then Sheet.Cells[7+2*i2,24]:='превышает расчетные погрешности'
                else Sheet.Cells[7+2*i2,24]:='не превышает расчетные погрешности';

            end;
             end;
   if    (dm2.bookznak.Value='U')or(dm2.bookznak.Value='F') then
         begin
               Sheet := Workbook.Sheets.Item[2];
               dm2.nij_verx.Active:=false;
               dm2.nij_verx.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
               dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.booknom.Value;
               dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
               dm2.nij_verx.ExecSQL;
               dm2.nij_verx.Active:=true;

               dm2.qchegara.Active:=false;
               dm2.qchegara.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
               dm2.qchegara.Parameters.ParamByName('linkps').Value:=dm2.booklinkkey2.Value;
               dm2.qchegara.ExecSQL;
               dm2.qchegara.Active:=true;
               if i1<17 then
               begin
               Sheet.Cells[6+2*i1,1]:=i1;
               Sheet.Cells[6+2*i1,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i1,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i1,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;

               Sheet.Cells[6+2*i1,6]:=dm2.nij_verx.Fields[3].AsFloat;
               f_a:=abs(dm2.nij_verx.Fields[3].AsFloat)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;
               Sheet.Cells[6+2*i1,7]:=abs(dm2.nij_verx.Fields[3].AsFloat)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;
               Sheet.Cells[7+2*i1,6]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[7+2*i1,7]:=abs(dm2.nij_verx.Fields[6].AsFloat)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;

               f_a:=dm2.qchegara.Fields[6].AsFloat;
               Sheet.Cells[6+2*i1,10]:=f_a;
               Sheet.Cells[6+2*i1,11]:=abs(f_a)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;
               f_av:=dm2.qchegara.Fields[9].AsFloat;
               Sheet.Cells[7+2*i1,10]:=f_av;
               Sheet.Cells[7+2*i1,11]:=abs(f_av)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;

               delta_na:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[6+2*i1,8]:=delta_na;
               Sheet.Cells[6+2*i1,9]:=abs(delta_na)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;
               delta_va:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[7+2*i1,8]:=delta_va;
               Sheet.Cells[7+2*i1,9]:=abs(delta_va)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value)*10000;

                if (delta_na>=f_a)or(delta_va<=f_av) then Sheet.Cells[6+2*i1,12]:='превышает расчетные погрешности'
                else Sheet.Cells[6+2*i1,12]:='не превышает расчетные погрешности';
                end // end if
              else
               begin
               Sheet.Cells[6+1+2*i1,1]:=i1;
               Sheet.Cells[6+1+2*i1,2]:=dm2.booknom.Value;
               Sheet.Cells[6+1+2*i1,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+1+2*i1,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;

               Sheet.Cells[6+1+2*i1,6]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[6+1+2*i1,7]:=abs(dm2.nij_verx.Fields[3].AsFloat)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);
               Sheet.Cells[7+1+2*i1,6]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[7+1+2*i1,7]:=abs(dm2.nij_verx.Fields[6].AsFloat)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);

               f_a:=dm2.qchegara.Fields[6].AsFloat;
               Sheet.Cells[6+1+2*i1,10]:=f_a;
               Sheet.Cells[6+1+2*i1,11]:=abs(f_a)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);
               f_av:=dm2.qchegara.Fields[9].AsFloat;
               Sheet.Cells[7+1+2*i1,10]:=f_av;
               Sheet.Cells[7+1+2*i1,11]:=abs(f_av)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);

               delta_na:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[6+1+2*i1,8]:=delta_na;
               Sheet.Cells[6+1+2*i1,9]:=abs(delta_na)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);
               delta_va:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[7+1+2*i1,8]:=delta_va;
               Sheet.Cells[7+1+2*i1,9]:=abs(delta_va)*100/(dm2.bookShkala_max.Value-dm2.bookShkala_min.Value);

                if (delta_na>=f_a)or(delta_va<=f_av) then Sheet.Cells[6+1+2*i1,12]:='превышает расчетные погрешности'
                else Sheet.Cells[6+1+2*i1,12]:='не превышает расчетные погрешности';

               end;

                i1:=i1+1;

         end;

               if i<27 then t:=6;
               if (i>26)and(i<56) then t:=7;
              
               Sheet := Workbook.Sheets.Item[3];
               Sheet.Cells[t+2*i-1,1]:=i;
               Sheet.Cells[t+2*i-1,2]:=dm2.booknom.Value;
               Sheet.Cells[t+2*i-1,3]:=dm2.bookznak.Value;
               Sheet.Cells[t+2*i-1,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               shkala:=dm2.bookShkala_max.Value-dm2.bookShkala_min.Value;
               if abs(dm2.qchegara.Fields[1].AsFloat)*100/shkala<abs(dm2.qchegara.Fields[2].AsFloat)*100/shkala then Sheet.Cells[t+2*i-1,5]:=abs(dm2.qchegara.Fields[2].AsFloat)*100/shkala
               else Sheet.Cells[t+2*i-1,5]:=abs(dm2.qchegara.Fields[1].AsFloat)*100/shkala;

                if    (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q')or(dm2.bookznak.Value='I') then
                 begin
                 f_a:=abs(dm2.qchegara.Fields[6].AsFloat)*100/shkala;
                 f_b:=abs(dm2.qchegara.Fields[9].AsFloat)*100/shkala;
                 if f_a>f_b then Sheet.Cells[t+2*i-1,6]:=f_a
                 else Sheet.Cells[t+2*i-1,6]:=f_b;

                 f_a:=abs(dm2.qchegara.Fields[7].AsFloat)*100/shkala;
                 f_b:=abs(dm2.qchegara.Fields[10].AsFloat)*100/shkala;
                 if f_a>f_b then Sheet.Cells[t+2*i-1,7]:=f_a
                 else Sheet.Cells[t+2*i-1,7]:=f_b;

                 f_a:=abs(dm2.qchegara.Fields[8].AsFloat)*100/shkala;
                 f_b:=abs(dm2.qchegara.Fields[11].AsFloat)*100/shkala;
                 if f_a>f_b then Sheet.Cells[t+2*i-1,8]:=f_a
                 else Sheet.Cells[t+2*i-1,8]:=f_b;
                end;
                if    (dm2.bookznak.Value='U')or(dm2.bookznak.Value='F') then
                 begin
                 f_a:=abs(dm2.qchegara.Fields[6].AsFloat)*100/shkala;
                 f_b:=abs(dm2.qchegara.Fields[9].AsFloat)*100/shkala;
                 if f_a>f_b then Sheet.Cells[t+2*i-1,6]:=f_a
                 else Sheet.Cells[t+2*i-1,6]:=f_b;
                 end;
             if i<16 then
                begin
               Sheet := Workbook.Sheets.Item[4];
               Sheet.Cells[6+2*i-1,1]:=i;
               Sheet.Cells[6+2*i-1,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i-1,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i-1,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[6+2*i-1,5]:=dm2.bookTIP.Value;
               Sheet.Cells[6+2*i,5]:=dm2.bookUTM.Value;

                DM2.usloviyav.Active:=false;
                dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
                dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.bookTIP.Value;
                dm2.usloviyav.ExecSQL;
                dm2.usloviyav.Active:=true;
                if dm2.usloviyav.Fields[2].Value=0 then Sheet.Cells[6+2*i-1,6]:='00.00.00'
                else Sheet.Cells[6+2*i-1,6]:=dm2.usloviyav.Fields[2].AsDateTime;
               Sheet.Cells[6+2*i-1,7]:=dm2.usloviyav.Fields[3].AsFloat;
               Sheet.Cells[6+2*i-1,8]:=dm2.usloviyav.Fields[4].AsFloat;
               Sheet.Cells[6+2*i-1,9]:=dm2.usloviyav.Fields[5].AsFloat;
               Sheet.Cells[6+2*i-1,10]:=dm2.usloviyav.Fields[6].AsFloat;
               Sheet.Cells[6+2*i-1,11]:=dm2.usloviyav.Fields[7].AsFloat;
               Sheet.Cells[6+2*i-1,12]:=dm2.usloviyav.Fields[8].AsFloat;
               Sheet.Cells[6+2*i-1,13]:=dm2.usloviyav.Fields[9].AsFloat;

                DM2.usloviyav.Active:=false;
                dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
                dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.bookUTM.Value;
                dm2.usloviyav.ExecSQL;
                dm2.usloviyav.Active:=true;
                if dm2.usloviyav.Fields[2].Value=0 then Sheet.Cells[6+2*i,6]:='00.00.00'
                else Sheet.Cells[6+2*i,6]:=dm2.usloviyav.Fields[2].AsDateTime;
               Sheet.Cells[6+2*i,7]:=dm2.usloviyav.Fields[3].AsFloat;
               Sheet.Cells[6+2*i,8]:=dm2.usloviyav.Fields[4].AsFloat;
               Sheet.Cells[6+2*i,9]:=dm2.usloviyav.Fields[5].AsFloat;
               Sheet.Cells[6+2*i,10]:=dm2.usloviyav.Fields[6].AsFloat;
               Sheet.Cells[6+2*i,11]:=dm2.usloviyav.Fields[7].AsFloat;
               Sheet.Cells[6+2*i,12]:=dm2.usloviyav.Fields[8].AsFloat;
               Sheet.Cells[6+2*i,13]:=dm2.usloviyav.Fields[9].AsFloat;
               end // end if
               else
                begin

               Sheet := Workbook.Sheets.Item[4];
               Sheet.Cells[6+2*i,1]:=i;
               Sheet.Cells[6+2*i,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[6+2*i,5]:=dm2.bookTIP.Value;
               Sheet.Cells[6+2*i+1,5]:=dm2.bookUTM.Value;

                DM2.usloviyav.Active:=false;
                dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
                dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.bookTIP.Value;
                dm2.usloviyav.ExecSQL;
                dm2.usloviyav.Active:=true;
                if dm2.usloviyav.Fields[2].Value=null then Sheet.Cells[6+2*i-1,6]:='00.00.00'
                else Sheet.Cells[6+2*i,6]:=dm2.usloviyav.Fields[2].AsDateTime;
               Sheet.Cells[6+2*i,7]:=dm2.usloviyav.Fields[3].AsFloat;
               Sheet.Cells[6+2*i,8]:=dm2.usloviyav.Fields[4].AsFloat;
               Sheet.Cells[6+2*i,9]:=dm2.usloviyav.Fields[5].AsFloat;
               Sheet.Cells[6+2*i,10]:=dm2.usloviyav.Fields[6].AsFloat;
               Sheet.Cells[6+2*i,11]:=dm2.usloviyav.Fields[7].AsFloat;
               Sheet.Cells[6+2*i,12]:=dm2.usloviyav.Fields[8].AsFloat;
               Sheet.Cells[6+2*i,13]:=dm2.usloviyav.Fields[9].AsFloat;

                DM2.usloviyav.Active:=false;
                dm2.usloviyav.Parameters.ParamByName('linkkey').Value:=dm2.bookDSDesigner.Value;
                dm2.usloviyav.Parameters.ParamByName('tipdat').Value:=dm2.bookUTM.Value;
                dm2.usloviyav.ExecSQL;
                dm2.usloviyav.Active:=true;
                if dm2.usloviyav.Fields[2].Value=null then Sheet.Cells[6+2*i-1,6]:='00.00.00'
                else Sheet.Cells[6+2*i+1,6]:=dm2.usloviyav.Fields[2].AsDateTime;
               Sheet.Cells[6+2*i+1,7]:=dm2.usloviyav.Fields[3].AsFloat;
               Sheet.Cells[6+2*i+1,8]:=dm2.usloviyav.Fields[4].AsFloat;
               Sheet.Cells[6+2*i+1,9]:=dm2.usloviyav.Fields[5].AsFloat;
               Sheet.Cells[6+2*i+1,10]:=dm2.usloviyav.Fields[6].AsFloat;
               Sheet.Cells[6+2*i+1,11]:=dm2.usloviyav.Fields[7].AsFloat;
               Sheet.Cells[6+2*i+1,12]:=dm2.usloviyav.Fields[8].AsFloat;
               Sheet.Cells[6+2*i+1,13]:=dm2.usloviyav.Fields[9].AsFloat;

                end;

       if    (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q')or(dm2.bookznak.Value='I')or(dm2.bookznak.Value='U')or(dm2.bookznak.Value='F') then
             begin
               dm2.nij_verx.Active:=false;
               dm2.nij_verx.Parameters.ParamByName('n').Value:=dm2.booknom.Value;
               dm2.nij_verx.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
               dm2.nij_verx.ExecSQL;
               dm2.nij_verx.Active:=true;

               dm2.qchegara.Active:=false;
               dm2.qchegara.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
               dm2.qchegara.Parameters.ParamByName('linkps').Value:=dm2.booklinkkey2.Value;
               dm2.qchegara.ExecSQL;
               dm2.qchegara.Active:=true;
               if i<15 then begin
               Sheet := Workbook.Sheets.Item[7];
               Sheet.Cells[6+2*i,1]:=i;
               Sheet.Cells[6+2*i,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[6+2*i,5]:=dm2.nij_verx.Fields[35].AsFloat;
               Sheet.Cells[6+2*i,6]:=dm2.nij_verx.Fields[17].AsFloat;
               Sheet.Cells[6+2*i,7]:=dm2.nij_verx.Fields[18].AsFloat;

               if dm2.bookznak.Value='I' then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,9]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,10]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[6+2*i,11]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[6+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[6+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[6+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[6+2*i,21]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[6+2*i,22]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[6+2*i,23]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[8].AsFloat;
               end;
               if (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q') then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,12]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,13]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[6+2*i,14]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[6+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[6+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[6+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[6+2*i,21]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[6+2*i,22]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[6+2*i,23]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[8].AsFloat;
               end;
               if dm2.bookznak.Value='U' then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,15]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,19]:=dm2.nij_verx.Fields[28].AsFloat;

               Sheet.Cells[6+2*i,24]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[6].AsFloat;
               end;
               if dm2.bookznak.Value='F' then
               begin
               Sheet.Cells[6+2*i,19]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,24]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[6].AsFloat;
               end;
                    {РАБОЧЫЙ}
               Sheet := Workbook.Sheets.Item[8];
               Sheet.Cells[6+2*i,1]:=i;
               Sheet.Cells[6+2*i,2]:=dm2.booknom.Value;
               Sheet.Cells[6+2*i,3]:=dm2.bookznak.Value;
               Sheet.Cells[6+2*i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[6+2*i,5]:=dm2.nij_verx.Fields[35].AsFloat;
               Sheet.Cells[6+2*i,6]:=dm2.nij_verx.Fields[26].AsFloat;
               Sheet.Cells[6+2*i,7]:=dm2.nij_verx.Fields[27].AsFloat;

               if dm2.bookznak.Value='I' then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,9]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,10]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[6+2*i,11]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[6+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[6+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[6+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[6+2*i,21]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[6+2*i,22]:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[6+2*i,23]:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[16].AsFloat;
               end;
               if (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q') then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,12]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,13]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[6+2*i,14]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[6+2*i,16]:=dm2.nij_verx.Fields[31].AsFloat;
               Sheet.Cells[6+2*i,17]:=dm2.nij_verx.Fields[32].AsFloat;
               Sheet.Cells[6+2*i,18]:=dm2.nij_verx.Fields[33].AsFloat;

               Sheet.Cells[6+2*i,21]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[6+2*i,22]:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[6+2*i,23]:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[16].AsFloat;
               end;
               if dm2.bookznak.Value='U' then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,15]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[6+2*i,19]:=dm2.nij_verx.Fields[31].AsFloat;

               Sheet.Cells[6+2*i,24]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[14].AsFloat;
               end;
               if dm2.bookznak.Value='F' then
               begin
               Sheet.Cells[6+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[6+2*i,19]:=dm2.nij_verx.Fields[31].AsFloat;

               Sheet.Cells[6+2*i,24]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[14].AsFloat;
             end;

            end  // end if i<15
            else
            begin
               Sheet := Workbook.Sheets.Item[7];
               Sheet.Cells[7+2*i,1]:=i;
               Sheet.Cells[7+2*i,2]:=dm2.booknom.Value;
               Sheet.Cells[7+2*i,3]:=dm2.bookznak.Value;
               Sheet.Cells[7+2*i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[7+2*i,5]:=dm2.nij_verx.Fields[35].AsFloat;
               Sheet.Cells[7+2*i,6]:=dm2.nij_verx.Fields[17].AsFloat;
               Sheet.Cells[7+2*i,7]:=dm2.nij_verx.Fields[18].AsFloat;

               if dm2.bookznak.Value='I' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,9]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,10]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[7+2*i,11]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[7+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[7+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[7+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[8+2*i,21]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[8+2*i,22]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[8+2*i,23]:=dm2.nij_verx.Fields[8].AsFloat;
               end;
               if (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q') then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,12]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,13]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[7+2*i,14]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[7+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[7+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[7+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[4].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[5].AsFloat;
               Sheet.Cells[8+2*i,21]:=dm2.nij_verx.Fields[6].AsFloat;
               Sheet.Cells[8+2*i,22]:=dm2.nij_verx.Fields[7].AsFloat;
               Sheet.Cells[8+2*i,23]:=dm2.nij_verx.Fields[8].AsFloat;
               end;
               if dm2.bookznak.Value='U' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,15]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,19]:=dm2.nij_verx.Fields[28].AsFloat;

               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[8+2*i,24]:=dm2.nij_verx.Fields[6].AsFloat;
               end;

               if dm2.bookznak.Value='F' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,19]:=dm2.nij_verx.Fields[28].AsFloat;

               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[3].AsFloat;
               Sheet.Cells[8+2*i,24]:=dm2.nij_verx.Fields[6].AsFloat;
               end;
                    {РАБОЧЫЙ}
            //   if i<15 then begin

               Sheet := Workbook.Sheets.Item[8];
               Sheet.Cells[7+2*i,1]:=i;
               Sheet.Cells[7+2*i,2]:=dm2.booknom.Value;
               Sheet.Cells[7+2*i,3]:=dm2.bookznak.Value;
               Sheet.Cells[7+2*i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.Value;
               Sheet.Cells[7+2*i,5]:=dm2.nij_verx.Fields[35].AsFloat;
               Sheet.Cells[7+2*i,6]:=dm2.nij_verx.Fields[26].AsFloat;
               Sheet.Cells[7+2*i,7]:=dm2.nij_verx.Fields[27].AsFloat;

               if dm2.bookznak.Value='I' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,9]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,10]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[7+2*i,11]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[7+2*i,16]:=dm2.nij_verx.Fields[28].AsFloat;
               Sheet.Cells[7+2*i,17]:=dm2.nij_verx.Fields[29].AsFloat;
               Sheet.Cells[7+2*i,18]:=dm2.nij_verx.Fields[30].AsFloat;

               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[8+2*i,21]:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[8+2*i,22]:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[8+2*i,23]:=dm2.nij_verx.Fields[16].AsFloat;
               end;
               if (dm2.bookznak.Value='P')or(dm2.bookznak.Value='Q') then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,12]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,13]:=dm2.nij_verx.Fields[20].AsFloat;
               Sheet.Cells[7+2*i,14]:=dm2.nij_verx.Fields[21].AsFloat;
               Sheet.Cells[7+2*i,16]:=dm2.nij_verx.Fields[31].AsFloat;
               Sheet.Cells[7+2*i,17]:=dm2.nij_verx.Fields[32].AsFloat;
               Sheet.Cells[7+2*i,18]:=dm2.nij_verx.Fields[33].AsFloat;

               Sheet.Cells[7+2*i,21]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[7+2*i,22]:=dm2.nij_verx.Fields[12].AsFloat;
               Sheet.Cells[7+2*i,23]:=dm2.nij_verx.Fields[13].AsFloat;
               Sheet.Cells[8+2*i,21]:=dm2.nij_verx.Fields[14].AsFloat;
               Sheet.Cells[8+2*i,22]:=dm2.nij_verx.Fields[15].AsFloat;
               Sheet.Cells[8+2*i,23]:=dm2.nij_verx.Fields[16].AsFloat;
               end;
               if dm2.bookznak.Value='U' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,15]:=dm2.nij_verx.Fields[19].AsFloat;
               Sheet.Cells[7+2*i,19]:=dm2.nij_verx.Fields[31].AsFloat;

               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[8+2*i,24]:=dm2.nij_verx.Fields[14].AsFloat;
             end;
               if dm2.bookznak.Value='F' then
               begin
               Sheet.Cells[7+2*i,8]:=dm2.nij_verx.Fields[10].AsFloat;
               Sheet.Cells[7+2*i,19]:=dm2.nij_verx.Fields[31].AsFloat;

               Sheet.Cells[7+2*i,24]:=dm2.nij_verx.Fields[11].AsFloat;
               Sheet.Cells[8+2*i,24]:=dm2.nij_verx.Fields[14].AsFloat;
             end;
            end;
             Sheet := Workbook.Sheets.Item[6];
               t:=0;
               if i<9 then begin
                           t:=5;
                           k:=6;
                           end;
               if (i>8)and(i<24) then begin
                                      t:=6;
                                      k:=15;
                                      end;
               if (i>23)and(i<38) then begin
                                       t:=7;
                                       k:=31;
                                       end;

               Sheet.Cells[k,33]:=dm2.bookUTM.Value;
               dm2.qip.Active:=false;
               dm2.qip.Parameters.ParamByName('tip').Value:=dm2.bookUTM.Value;
               dm2.qip.ExecSQL;
               dm2.qip.Active:=true;
               Sheet.Cells[k,34]:=dm2.qip.Fields[2].AsFloat;
               Sheet.Cells[k,35]:=' -30 до +'+dm2.qip.Fields[15].AsString;
               Sheet.Cells[k,36]:=dm2.qip.Fields[3].AsFloat;
               Sheet.Cells[k,37]:='от 20±5';

               Sheet.Cells[k,38]:='от '+dm2.qip.Fields[22].AsString+' до '+dm2.qip.Fields[10].AsString+' или до '+dm2.qip.Fields[11].AsString;
               Sheet.Cells[k,39]:=dm2.qip.Fields[6].AsFloat;
               Sheet.Cells[k,40]:=dm2.qip.Fields[22].AsString+'±5';


               dm2.delta.Active:=false;
               dm2.delta.Parameters.ParamByName('klass').Value:=dm2.bookklass_TT.Value;
               dm2.delta.Parameters.ParamByName('tip').Value:='TT';
               dm2.delta.ExecSQL;
               dm2.delta.Active:=true;
               dm2.delta.First;
               str1:='';
               str2:='';
               while dm2.delta.Eof<>true do
               begin
                str1:=str1+'±'+dm2.delta.Fields[5].AsString+';';
                str2:=str2+'±'+dm2.delta.Fields[6].AsString+';';
                dm2.delta.Next;
               end;
               Sheet.Cells[t+i,7]:=str1;
               Sheet.Cells[t+i,8]:=str2;
               str1:='';
               str2:='';
               dm2.delta.Active:=false;
               dm2.delta.Parameters.ParamByName('klass').Value:=dm2.bookklass_TN.Value;
               dm2.delta.Parameters.ParamByName('tip').Value:='TH';
               dm2.delta.ExecSQL;
               dm2.delta.Active:=true;
               dm2.delta.First;
                str1:='±'+dm2.delta.Fields[5].AsString+';';
                str2:='±'+dm2.delta.Fields[6].AsString+';';
               Sheet.Cells[t+i,11]:=str1;
               Sheet.Cells[t+i,12]:=str2;

               Sheet.Cells[t+i,1]:=i;
               Sheet.Cells[t+i,2]:=dm2.booknom.Value;
               Sheet.Cells[t+i,3]:=dm2.bookznak.Value;
               Sheet.Cells[t+i,4]:=dm2.bookShkala.Value+' '+dm2.bookYed_izm.AsString;
               if dm2.bookTipTT.AsString='' then Sheet.Cells[t+i,5]:='' else Sheet.Cells[t+i,5]:=dm2.bookTipTT.AsString;
               Sheet.Cells[t+i,6]:=dm2.bookklass_TT.AsString;
              { if (dm2.bookznak.Value<>'I')or(dm2.bookznak.Value<>'F') then} Sheet.Cells[t+i,9]:=dm2.bookTipTN.AsString;
               Sheet.Cells[t+i,10]:=dm2.bookklass_TN.AsString;

               Sheet.Cells[t+i,13]:=dm2.bookTIP.Value;
               dm2.qip.Active:=false;
               dm2.qip.Parameters.ParamByName('tip').Value:=dm2.bookTIP.Value;
               dm2.qip.ExecSQL;
               dm2.qip.Active:=true;
               Sheet.Cells[t+i,14]:=dm2.qip.Fields[2].AsString;

               Sheet.Cells[t+i,15]:=' -30 до +'+dm2.qip.Fields[15].AsString;
               Sheet.Cells[t+i,16]:=dm2.qip.Fields[3].AsFloat;
               Sheet.Cells[t+i,17]:='от 20±5';

               Sheet.Cells[t+i,18]:=dm2.qip.Fields[16].AsString+'-'+dm2.qip.Fields[17].AsString;
               Sheet.Cells[t+i,19]:=dm2.qip.Fields[4].AsFloat;
               Sheet.Cells[t+i,20]:='60%';

               Sheet.Cells[t+i,21]:='от '+dm2.qip.Fields[22].AsString+' до '+dm2.qip.Fields[10].AsString+' или до '+dm2.qip.Fields[11].AsString;
               Sheet.Cells[t+i,22]:=dm2.qip.Fields[6].AsFloat;
               if dm2.qip.Fields[22].Value<220 then Sheet.Cells[t+i,23]:=dm2.qip.Fields[22].AsString+'±2'
               else Sheet.Cells[t+i,23]:=dm2.qip.Fields[22].AsString+'±5';

               Sheet.Cells[t+i,24]:='80-120';
               Sheet.Cells[t+i,25]:=dm2.qip.Fields[7].AsFloat;
               Sheet.Cells[t+i,26]:='100±2';

               Sheet.Cells[t+i,27]:=dm2.qip.Fields[12].AsString+'-'+dm2.qip.Fields[13].AsString;
               Sheet.Cells[t+i,28]:=dm2.qip.Fields[8].AsFloat;
               Sheet.Cells[t+i,29]:='50±0,5';

               Sheet.Cells[t+i,30]:=dm2.qip.Fields[12].AsString+'-'+dm2.qip.Fields[13].AsString;
               Sheet.Cells[t+i,31]:=dm2.qip.Fields[9].AsFloat;
               Sheet.Cells[t+i,32]:='50±0,5';
          
          end; // end if


    dm2.book.Next;
  end;
   ////////////////////////////////////////////////////////////////////////////////////////////////
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

procedure Tdbform.Button3Click(Sender: TObject);
begin
dm2.del_granisa.Active:=false;
dm2.del_granisa.Parameters.ParamByName('son').Value:=dm2.bookDSDesigner.Value;
dm2.del_granisa.Parameters.ParamByName('n').Value:=dm2.booknom.Value;
dm2.del_granisa.Parameters.ParamByName('ps').Value:=dm2.booklinkkey2.Value;
dm2.del_granisa.ExecSQL;
end;



end.
