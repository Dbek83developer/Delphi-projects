unit datamoduleunit;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  Tdm2 = class(TDataModule)
    insert: TADOQuery;
    exp: TADOTable;
    query_uslov: TADOQuery;
    expDSDesigner: TAutoIncField;
    expdata: TIntegerField;
    expenergobyekt: TWideStringField;
    expznach: TBCDField;
    dsener: TDataSource;
    book: TADOTable;
    sort: TADOQuery;
    zapros: TDataSource;
    surov1: TADOQuery;
    ins_usloviya: TADOQuery;
    q: TADOQuery;
    dbobyekt: TDataSource;
    tableobyekt: TADOTable;
    tableps: TADOTable;
    tablepsDSDesigner: TAutoIncField;
    tablepslinkkey1: TIntegerField;
    tablepsDSDesigner2: TWideStringField;
    ADOConnection1: TADOConnection;
    OpenDialog1: TOpenDialog;
    ad_q: TADOQuery;
    ADOTable1: TADOTable;
    ADOTable1DSDesigner: TAutoIncField;
    ADOTable1Tipdatchika: TWideStringField;
    ADOTable1Klass: TWideStringField;
    ADOTable1Nominal: TIntegerField;
    ADOTable1Pervnominal: TWideStringField;
    ADOTable1osp: TBCDField;
    ADOTable1dup: TBCDField;
    ADOTable1faza: TWideStringField;
    ip: TADOTable;
    ipDSDesigner: TAutoIncField;
    ipTip: TWideStringField;
    ipparametr: TWideStringField;
    ipOPrP: TBCDField;
    ipt: TBCDField;
    ipvl: TBCDField;
    ipdavl: TBCDField;
    ipv_pit: TBCDField;
    ipv_sep: TBCDField;
    ipn_pit: TBCDField;
    ipn_sep: TBCDField;
    delete: TADOQuery;
    DataSource1: TDataSource;
    zapros_eks: TADOQuery;
    q_danniye: TADOQuery;
    ADOQuery1: TADOQuery;
    ins_tboed: TADOQuery;
    danniye: TADOQuery;
    tb_oed: TADOQuery;
    ins_granisa: TADOQuery;
    qgranisa: TADOQuery;
    minmax: TADOQuery;
    ipv_ot: TIntegerField;
    ipv_do: TIntegerField;
    ipn_ot: TIntegerField;
    ipn_do: TIntegerField;
    iptemp: TIntegerField;
    ipvl_ot: TIntegerField;
    ipvl_do: TIntegerField;
    ipdavl_ot: TBCDField;
    ipdavl_do: TBCDField;
    ins_jimm: TADOQuery;
    DSjimm: TDataSource;
    jimm: TADOTable;
    del_jimm: TADOQuery;
    free: TADOQuery;
    ADOQuery2: TADOQuery;
    Dsps: TDataSource;
    ADOQuery3: TADOQuery;
    Dstable: TDataSource;
    surov2: TADOQuery;
    del_granisa: TADOQuery;
    nij_verx: TADOQuery;
    i_chegara: TADOQuery;
    query_uslovkey: TIntegerField;
    query_uslovtipdat: TWideStringField;
    query_uslovvaqt: TDateTimeField;
    query_uslovvlaj: TSmallintField;
    query_uslovt: TBCDField;
    query_uslovdavl: TBCDField;
    query_uslovv_pit: TBCDField;
    query_uslovv_sep: TBCDField;
    query_uslovn_pit: TBCDField;
    query_uslovn_sep: TBCDField;
    query_uslovlinkkey: TIntegerField;
    usloviya: TADOQuery;
    del_chegara: TADOQuery;
    qchegara: TADOQuery;
    clear_eks: TADOQuery;
    ipoter: TADOQuery;
    sel_ip: TADOQuery;
    sel_granisa: TADOQuery;
    usloviyav: TADOQuery;
    tableobyektkey1: TAutoIncField;
    tableobyektObyekt: TWideStringField;
    ipvx_ot: TIntegerField;
    ipvx_do: TIntegerField;
    ippitnom: TIntegerField;
    delta: TADOQuery;
    qip: TADOQuery;
    bookDSDesigner: TAutoIncField;
    bookEnergoobyekt: TWideStringField;
    bookznak: TWideStringField;
    booknom: TWideStringField;
    bookShkala: TWideStringField;
    bookYed_izm: TWideStringField;
    bookTT: TWideStringField;
    bookTN: TWideStringField;
    bookTIP: TWideStringField;
    bookUTM: TWideStringField;
    booklinkkey2: TIntegerField;
    bookblock: TIntegerField;
    bookTipTT: TWideStringField;
    bookTzav_numA: TWideStringField;
    bookTzav_numB: TWideStringField;
    bookTzav_numC: TWideStringField;
    bookTipTN: TWideStringField;
    bookNzav_numA: TWideStringField;
    bookNzav_numB: TWideStringField;
    bookNzav_numC: TWideStringField;
    bookklass_TT: TWideStringField;
    bookklass_TN: TWideStringField;
    bookipzav_num: TWideStringField;
    bookutmzav_num: TWideStringField;
    ADOQuery4: TADOQuery;
    bookShkala_max: TBCDField;
    bookShkala_min: TBCDField;
  
// = arAll;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 const
  cstr = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False';

var
  dm2: Tdm2;

implementation

{$R *.dfm}







end.
