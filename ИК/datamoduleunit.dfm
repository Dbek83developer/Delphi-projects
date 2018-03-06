object dm2: Tdm2
  OldCreateOrder = False
  Height = 505
  Width = 665
  object insert: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'data'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'energobyekt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'znach'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into ekspriment(data,energobyekt,znach)'
      'values(:data,:energobyekt,:znach);')
    Left = 344
    Top = 16
  end
  object exp: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'ekspriment'
    Left = 408
    Top = 400
    object expDSDesigner: TAutoIncField
      FieldName = #1050#1086#1076
      ReadOnly = True
    end
    object expdata: TIntegerField
      FieldName = 'data'
    end
    object expenergobyekt: TWideStringField
      FieldName = 'energobyekt'
      Size = 50
    end
    object expznach: TBCDField
      FieldName = 'znach'
      Precision = 18
      Size = 0
    end
  end
  object query_uslov: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vaqt'
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = 0d
      end
      item
        Name = 'linkkey'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'tipdat'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from usloviya '
      'where vaqt =:vaqt and linkkey=:linkkey and tipdat=:tipdat;')
    Left = 224
    Top = 280
    object query_uslovkey: TIntegerField
      FieldName = 'key'
    end
    object query_uslovtipdat: TWideStringField
      FieldName = 'tipdat'
      Size = 255
    end
    object query_uslovvaqt: TDateTimeField
      FieldName = 'vaqt'
    end
    object query_uslovvlaj: TSmallintField
      FieldName = 'vlaj'
    end
    object query_uslovt: TBCDField
      FieldName = 't'
      Precision = 18
      Size = 5
    end
    object query_uslovdavl: TBCDField
      FieldName = 'davl'
      Precision = 18
      Size = 5
    end
    object query_uslovv_pit: TBCDField
      FieldName = 'v_pit'
      Precision = 18
      Size = 5
    end
    object query_uslovv_sep: TBCDField
      FieldName = 'v_sep'
      Precision = 18
      Size = 5
    end
    object query_uslovn_pit: TBCDField
      FieldName = 'n_pit'
      Precision = 18
      Size = 5
    end
    object query_uslovn_sep: TBCDField
      FieldName = 'n_sep'
      Precision = 18
      Size = 5
    end
    object query_uslovlinkkey: TIntegerField
      FieldName = 'linkkey'
    end
  end
  object dsener: TDataSource
    DataSet = book
    Left = 20
    Top = 56
  end
  object book: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'linkkey2'
    MasterFields = #1050#1086#1076
    MasterSource = zapros
    TableName = 'Energoobyekt'
    Left = 96
    Top = 400
    object bookDSDesigner: TAutoIncField
      FieldName = #1050#1086#1076
      ReadOnly = True
    end
    object bookEnergoobyekt: TWideStringField
      FieldName = 'Energoobyekt'
      Size = 50
    end
    object bookznak: TWideStringField
      FieldName = 'znak'
      Size = 5
    end
    object booknom: TWideStringField
      FieldName = 'nom'
      Size = 30
    end
    object bookShkala: TWideStringField
      FieldName = 'Shkala'
    end
    object bookYed_izm: TWideStringField
      FieldName = 'Yed_izm'
      Size = 10
    end
    object bookTT: TWideStringField
      FieldName = 'TT'
      Size = 30
    end
    object bookTN: TWideStringField
      FieldName = 'TN'
      Size = 30
    end
    object bookTIP: TWideStringField
      FieldName = 'TIP'
      Size = 30
    end
    object bookUTM: TWideStringField
      FieldName = 'UTM'
      Size = 25
    end
    object booklinkkey2: TIntegerField
      FieldName = 'linkkey2'
    end
    object bookblock: TIntegerField
      FieldName = 'block'
    end
    object bookTipTT: TWideStringField
      FieldName = 'TipTT'
      Size = 15
    end
    object bookTzav_numA: TWideStringField
      FieldName = 'Tzav_numA'
      Size = 10
    end
    object bookTzav_numB: TWideStringField
      FieldName = 'Tzav_numB'
      Size = 10
    end
    object bookTzav_numC: TWideStringField
      FieldName = 'Tzav_numC'
      Size = 10
    end
    object bookTipTN: TWideStringField
      FieldName = 'TipTN'
      Size = 15
    end
    object bookNzav_numA: TWideStringField
      FieldName = 'Nzav_numA'
      Size = 10
    end
    object bookNzav_numB: TWideStringField
      FieldName = 'Nzav_numB'
      Size = 10
    end
    object bookNzav_numC: TWideStringField
      FieldName = 'Nzav_numC'
      Size = 10
    end
    object bookklass_TT: TWideStringField
      FieldName = 'klass_TT'
      Size = 50
    end
    object bookklass_TN: TWideStringField
      FieldName = 'klass_TN'
      Size = 50
    end
    object bookipzav_num: TWideStringField
      FieldName = 'ipzav_num'
      Size = 10
    end
    object bookutmzav_num: TWideStringField
      FieldName = 'utmzav_num'
      Size = 10
    end
    object bookShkala_max: TBCDField
      FieldName = 'Shkala_max'
      Precision = 18
      Size = 2
    end
    object bookShkala_min: TBCDField
      FieldName = 'Shkala_min'
      Precision = 18
      Size = 0
    end
  end
  object sort: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'klass'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'faza'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from t'
      'where klasss=:klass and faza=:faza;')
    Left = 224
    Top = 8
  end
  object zapros: TDataSource
    DataSet = tableps
    Left = 16
    Top = 168
  end
  object surov1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'obyekt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from obyekt'
      'where obyekt=:obyekt;')
    Left = 272
    Top = 16
  end
  object ins_usloviya: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tipdat'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'vaqt'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 't'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vlaj'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'davl'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'v_pit'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'v_sep'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'n_pit'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'n_sep'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'linkkey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into usloviya(tipdat,vaqt,t,vlaj,davl,v_pit,v_sep,n_pit,n' +
        '_sep,linkkey)'
      
        'values(:tipdat,:vaqt,:t,:vlaj,:davl,:v_pit,:v_sep,:n_pit,:n_sep,' +
        ':linkkey);')
    Left = 176
    Top = 256
  end
  object q: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'klass'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'faza'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'tip'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  *  from t'
      'where klasss=:klass and faza=:faza and tipdatchika=:tip;')
    Left = 432
    Top = 16
  end
  object dbobyekt: TDataSource
    DataSet = tableobyekt
    Left = 16
    Top = 224
  end
  object tableobyekt: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'obyekt'
    Left = 24
    Top = 400
    object tableobyektkey1: TAutoIncField
      FieldName = 'key1'
      ReadOnly = True
    end
    object tableobyektObyekt: TWideStringField
      FieldName = 'Obyekt'
      Size = 50
    end
  end
  object tableps: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'linkkey1'
    MasterFields = 'key1'
    MasterSource = dbobyekt
    TableName = 'ps'
    Left = 160
    Top = 400
    object tablepsDSDesigner: TAutoIncField
      FieldName = #1050#1086#1076
      ReadOnly = True
    end
    object tablepslinkkey1: TIntegerField
      FieldName = 'linkkey1'
    end
    object tablepsDSDesigner2: TWideStringField
      FieldName = #1055#1057
      Size = 30
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\DAMINOV\'#1052#1040' '#1054#1048#1050' '#1040 +
      #1057#1044#1059'\arxiv\Database.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'mdb'
    Filter = 'mdb|*.mdb|xls|*.xls'
    Left = 96
    Top = 8
  end
  object ad_q: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'nom'
        Size = -1
        Value = Null
      end
      item
        Name = 'znak'
        Size = -1
        Value = Null
      end
      item
        Name = 'k'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from energoobyekt'
      'where nom =:nom and znak=:znak and linkkey2=:k;')
    Left = 392
    Top = 16
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 't'
    Left = 296
    Top = 400
    object ADOTable1DSDesigner: TAutoIncField
      FieldName = #1050#1086#1076
      ReadOnly = True
    end
    object ADOTable1Tipdatchika: TWideStringField
      FieldName = 'Tipdatchika'
      Size = 2
    end
    object ADOTable1Klass: TWideStringField
      FieldName = 'Klasss'
      Size = 5
    end
    object ADOTable1Nominal: TIntegerField
      FieldName = 'Nominal'
    end
    object ADOTable1Pervnominal: TWideStringField
      FieldName = 'Perv nominal'
      Size = 10
    end
    object ADOTable1osp: TBCDField
      FieldName = 'osp'
      Precision = 18
      Size = 5
    end
    object ADOTable1dup: TBCDField
      FieldName = 'dup'
      Precision = 18
      Size = 5
    end
    object ADOTable1faza: TWideStringField
      FieldName = 'faza'
      Size = 1
    end
  end
  object ip: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'ip'
    Left = 352
    Top = 400
    object ipDSDesigner: TAutoIncField
      FieldName = #1050#1086#1076
      ReadOnly = True
    end
    object ipTip: TWideStringField
      FieldName = 'Tip'
      Size = 50
    end
    object ipparametr: TWideStringField
      FieldName = 'parametr'
      Size = 5
    end
    object ipOPrP: TBCDField
      FieldName = 'OPrP'
      Precision = 18
      Size = 5
    end
    object ipt: TBCDField
      FieldName = 't'
      Precision = 18
      Size = 5
    end
    object ipvl: TBCDField
      FieldName = 'vl'
      Precision = 18
      Size = 5
    end
    object ipdavl: TBCDField
      FieldName = 'davl'
      Precision = 18
      Size = 5
    end
    object ipv_pit: TBCDField
      FieldName = 'v_pit'
      Precision = 18
      Size = 5
    end
    object ipv_sep: TBCDField
      FieldName = 'v_sep'
      Precision = 18
      Size = 5
    end
    object ipn_pit: TBCDField
      FieldName = 'n_pit'
      Precision = 18
      Size = 5
    end
    object ipn_sep: TBCDField
      FieldName = 'n_sep'
      Precision = 18
      Size = 5
    end
    object ipv_ot: TIntegerField
      FieldName = 'v_ot'
    end
    object ipv_do: TIntegerField
      FieldName = 'v_do'
    end
    object ipn_ot: TIntegerField
      FieldName = 'n_ot'
    end
    object ipn_do: TIntegerField
      FieldName = 'n_do'
    end
    object iptemp: TIntegerField
      FieldName = 'temp'
    end
    object ipvl_ot: TIntegerField
      FieldName = 'vl_ot'
    end
    object ipvl_do: TIntegerField
      FieldName = 'vl_do'
    end
    object ipdavl_ot: TBCDField
      FieldName = 'davl_ot'
      Precision = 18
      Size = 2
    end
    object ipdavl_do: TBCDField
      FieldName = 'davl_do'
      Precision = 18
      Size = 2
    end
    object ipvx_ot: TIntegerField
      FieldName = 'vx_ot'
    end
    object ipvx_do: TIntegerField
      FieldName = 'vx_do'
    end
    object ippitnom: TIntegerField
      FieldName = 'pitnom'
    end
  end
  object delete: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'energobyekt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'delete * from ekspriment'
      'where energobyekt=:energobyekt;')
    Left = 184
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = exp
    Left = 96
    Top = 112
  end
  object zapros_eks: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'n'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'x'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'y'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from ekspriment'
      'where energobyekt=:n and znach between :x and :y; ')
    Left = 552
    Top = 256
  end
  object q_danniye: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'keylink'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'tochka'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'znach'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dznach'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into danniye(keylink,tochka,znach,dznach)'
      'values(:keylink,:tochka,:znach,:dznach);')
    Left = 184
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'linkkey2'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'block'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from energoobyekt'
      'where (linkkey2=:linkkey2)and(block=:block);')
    Left = 336
    Top = 160
  end
  object ins_tboed: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'xd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'xp'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'xo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ssp'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dis'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dsko'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Hv'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nij'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'verx'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'keyenergo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into tb_oed(xd,xp,xo,ssp,dis,dsko,Hv,nij,verx,keyenergo)'
      'values(:xd,:xp,:xo,:ssp,:dis,:dsko,:Hv,:nij,:verx,:keyenergo);')
    Left = 408
    Top = 88
  end
  object danniye: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'tochka'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'keylink'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from danniye'
      'where tochka=:tochka and keylink=:keylink;')
    Left = 232
    Top = 72
  end
  object tb_oed: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'keyenergo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_oed'
      'where keyenergo=:keyenergo;')
    Left = 464
    Top = 80
  end
  object ins_granisa: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ps'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'naimenovaniye'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nnu_5'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nnu_20'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nnu_100'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vnu_5'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vnu_20'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vnu_100'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nru_5'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nru_20'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nru_100'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vru_5'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vru_20'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vru_100'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_a'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_b'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_c'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'k_tt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'k_tn'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vremya'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'obyekt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nexp'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vexp'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_ip'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_utm'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_ipru'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_utmru'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_suma'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_sumb'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_sumc'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_sumaru'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_sumbru'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sko_sumcru'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'son'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'mat'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into granisa(ps,naimenovaniye,nnu_5,nnu_20,nnu_100,vnu_5,' +
        'vnu_20,vnu_100,nru_5,nru_20,nru_100,vru_5,vru_20,vru_100,sko_a,s' +
        'ko_b,sko_c,k_tt,k_tn,vremya,obyekt,nexp,vexp,sko_ip,sko_utm,sko_' +
        'ipru,sko_utmru,sko_suma,sko_sumb,sko_sumc,sko_sumaru,sko_sumbru,' +
        'sko_sumcru,son,mat)'
      
        'values(:ps,:naimenovaniye,:nnu_5,:nnu_20,:nnu_100,:vnu_5,:vnu_20' +
        ',:vnu_100,:nru_5,:nru_20,:nru_100,:vru_5,:vru_20,:vru_100,:sko_a' +
        ',:sko_b,:sko_c,:k_tt,:k_tn,:vremya,:obyekt,:nexp,:vexp,:sko_ip,:' +
        'sko_utm,:sko_ipru,:sko_utmru,:sko_suma,:sko_sumb,:sko_sumc,:sko_' +
        'sumaru,:sko_sumbru,:sko_sumcru,:son,:mat); ')
    Left = 472
    Top = 184
  end
  object qgranisa: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'n'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ps'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'vremya'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'son'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from granisa'
      
        'where (naimenovaniye=:n)and(ps=:ps)and(vremya=:vremya)and(son=:s' +
        'on);'
      '')
    Left = 408
    Top = 176
  end
  object minmax: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'keyenergo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select min(nij),max(verx) from tb_oed'
      'where keyenergo=:keyenergo;')
    Left = 176
    Top = 184
  end
  object ins_jimm: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'data'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'energobyekt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'znach'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into jimm(data,energobyekt,znach)'
      'values(:data,:energobyekt,:znach);')
    Left = 88
    Top = 312
  end
  object DSjimm: TDataSource
    DataSet = jimm
    Left = 16
    Top = 296
  end
  object jimm: TADOTable
    Connection = ADOConnection1
    TableName = 'jimm'
    Left = 448
    Top = 400
  end
  object del_jimm: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'delete * from jimm')
    Left = 88
    Top = 256
  end
  object free: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'keyenergo'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'delete * from tb_oed '
      'where keyenergo=:keyenergo;')
    Left = 176
    Top = 144
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'linkkey1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from ps'
      'where linkkey1=:linkkey1;')
    Left = 288
    Top = 208
  end
  object Dsps: TDataSource
    DataSet = ADOQuery3
    Left = 96
    Top = 192
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'linkkey2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select  *  from energoobyekt'
      'where linkkey2=:linkkey2; ')
    Left = 272
    Top = 160
  end
  object Dstable: TDataSource
    DataSet = ADOQuery4
    Left = 16
    Top = 352
  end
  object surov2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pods'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from ps'
      'where '#1055#1057'=:pods;')
    Left = 304
    Top = 72
  end
  object del_granisa: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'n'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'ps'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'son'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'delete * from granisa'
      'where (naimenovaniye=:n)and(ps=:ps)and(son=:son);')
    Left = 440
    Top = 240
  end
  object nij_verx: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'n'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'ps'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'son'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from granisa'
      'where (naimenovaniye=:n)and(ps=:ps)and(son=:son);'
      ''
      '')
    Left = 304
    Top = 288
  end
  object i_chegara: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'nij'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'verx'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'son'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'linkps'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'a'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'b'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'c'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'av'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'bv'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'cv'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into chegara(nij,verx,son,linkps,a,b,c,av,bv,cv)'
      'values(:nij,:verx,:son,:linkps,:a,:b,:c,:av,:bv,:cv); ')
    Left = 480
    Top = 344
  end
  object usloviya: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'linkkey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'tipdat'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'vaqt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from usloviya '
      'where  linkkey=:linkkey and tipdat=:tipdat and vaqt=:vaqt;')
    Left = 168
    Top = 304
  end
  object del_chegara: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'son'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'linkps'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'delete * from chegara'
      'where (son=:son)and(linkps=:linkps);')
    Left = 488
    Top = 296
  end
  object qchegara: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'son'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'linkps'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from chegara'
      'where son=:son and linkps=:linkps;')
    Left = 424
    Top = 312
  end
  object clear_eks: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'n'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'delete * from ekspriment'
      'where energobyekt=:n;')
    Left = 344
    Top = 344
  end
  object ipoter: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'poter'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      'insert into energoobyekt(poter)'
      'values(:poter);'
      '')
    Left = 544
    Top = 16
  end
  object sel_ip: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'tip'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from ip'
      'where  tip=:tip;')
    Left = 560
    Top = 96
  end
  object sel_granisa: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'n'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ps'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from granisa'
      'where naimenovaniye=:n and ps=:ps;')
    Left = 560
    Top = 168
  end
  object usloviyav: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'linkkey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'tipdat'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from usloviya '
      'where  linkkey=:linkkey and tipdat=:tipdat;')
    Left = 224
    Top = 344
  end
  object delta: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'klass'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'tip'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  *  from t'
      'where (Klasss=:klass)and(Tipdatchika=:tip);')
    Left = 592
    Top = 360
  end
  object qip: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'tip'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  *  from ip'
      'where tip=:tip;')
    Left = 560
    Top = 408
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'linkkey2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select  nom, znak, block from energoobyekt'
      'where linkkey2=:linkkey2; ')
    Left = 360
    Top = 232
  end
end
