object dbform: Tdbform
  Left = 73
  Top = 77
  Align = alCustom
  Caption = 'main'
  ClientHeight = 564
  ClientWidth = 886
  Color = clMoneyGreen
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object gridall: TDBGrid
    Left = 0
    Top = 356
    Width = 886
    Height = 208
    Align = alClient
    Color = clCream
    DataSource = dm2.dsener
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nom'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'znak'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Shkala'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Yed_izm'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TN'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UTM'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'block'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipTT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tzav_numA'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tzav_numB'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tzav_numC'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipTN'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nzav_numA'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nzav_numB'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nzav_numC'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'klass_TT'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'klass_TN'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ipzav_num'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'utmzav_num'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 886
    Height = 160
    Align = alTop
    Color = clMedGray
    TabOrder = 2
    object rd_tip: TRadioGroup
      Left = 224
      Top = 48
      Width = 57
      Height = 73
      Caption = #1058#1080#1087
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        #1048#1055
        #1059#1058#1052)
      TabOrder = 0
      OnClick = rd_tipClick
    end
    object vaqt: TDateTimePicker
      Left = 224
      Top = 8
      Width = 97
      Height = 21
      BevelKind = bkSoft
      Date = 39336.000000000000000000
      Time = 39336.000000000000000000
      TabOrder = 1
      OnCloseUp = vaqtCloseUp
    end
    object GroupBox2: TGroupBox
      Left = 345
      Top = 1
      Width = 540
      Height = 158
      Align = alRight
      Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1080#1089#1087#1099#1090#1072#1085#1080#1081':'
      TabOrder = 2
      object Label4: TLabel
        Left = 16
        Top = 24
        Width = 169
        Height = 13
        Caption = #1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1086#1082#1088#1091#1078#1072#1102#1097#1077#1081' '#1089#1088#1077#1076#1099
      end
      object Label5: TLabel
        Left = 16
        Top = 56
        Width = 134
        Height = 13
        Caption = #1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1074#1083#1072#1078#1085#1086#1089#1090#1100
      end
      object Label6: TLabel
        Left = 16
        Top = 88
        Width = 120
        Height = 13
        Caption = #1072#1090#1084#1086#1089#1092#1077#1088#1085#1086#1077' '#1076#1072#1074#1083#1077#1085#1080#1077
      end
      object Label7: TLabel
        Left = 211
        Top = 88
        Width = 19
        Height = 13
        Caption = 'kPa'
      end
      object Label8: TLabel
        Left = 240
        Top = 24
        Width = 11
        Height = 13
        Caption = '*C'
      end
      object Label9: TLabel
        Left = 211
        Top = 54
        Width = 8
        Height = 13
        Caption = '%'
      end
      object Label10: TLabel
        Left = 320
        Top = 16
        Width = 106
        Height = 13
        Caption = #1085#1072#1087#1088#1103#1078#1077#1085#1080#1103' '#1087#1080#1090#1072#1085#1080#1103
      end
      object Label11: TLabel
        Left = 320
        Top = 40
        Width = 117
        Height = 13
        Caption = #1085#1072#1087#1088#1103#1078#1077#1085#1080#1103' '#1080#1079#1084'. '#1094#1077#1087#1099
      end
      object Label12: TLabel
        Left = 320
        Top = 64
        Width = 83
        Height = 13
        Caption = #1095#1072#1089#1090#1086#1090#1072' '#1087#1080#1090#1072#1085#1080#1080
      end
      object Label13: TLabel
        Left = 320
        Top = 88
        Width = 94
        Height = 13
        Caption = #1095#1072#1089#1090#1086#1090#1072' '#1080#1079#1084'. '#1094#1077#1087#1099
      end
      object Label14: TLabel
        Left = 494
        Top = 14
        Width = 7
        Height = 13
        Caption = 'V'
      end
      object Label15: TLabel
        Left = 495
        Top = 39
        Width = 7
        Height = 13
        Caption = 'V'
      end
      object Label16: TLabel
        Left = 496
        Top = 61
        Width = 13
        Height = 13
        Caption = 'Hz'
      end
      object Label17: TLabel
        Left = 496
        Top = 85
        Width = 13
        Height = 13
        Caption = 'Hz'
      end
      object ed_davl: TEdit
        Left = 156
        Top = 82
        Width = 49
        Height = 21
        TabOrder = 2
        Text = '101'
      end
      object Button2: TButton
        Left = 440
        Top = 128
        Width = 57
        Height = 25
        Caption = 'ok'
        Enabled = False
        TabOrder = 7
        OnClick = Button2Click
      end
      object sp_t: TEdit
        Left = 190
        Top = 21
        Width = 48
        Height = 21
        TabOrder = 0
      end
      object sp_vpit: TEdit
        Left = 443
        Top = 11
        Width = 48
        Height = 21
        TabOrder = 3
      end
      object sp_vsep: TEdit
        Left = 443
        Top = 35
        Width = 48
        Height = 21
        TabOrder = 4
      end
      object sp_npit: TEdit
        Left = 443
        Top = 59
        Width = 48
        Height = 21
        TabOrder = 5
      end
      object sp_nsep: TEdit
        Left = 443
        Top = 83
        Width = 48
        Height = 21
        TabOrder = 6
      end
      object sp_vlaj: TEdit
        Left = 158
        Top = 53
        Width = 48
        Height = 21
        TabOrder = 1
      end
    end
    object gridps: TDBGrid
      Left = 1
      Top = 1
      Width = 201
      Height = 158
      Align = alLeft
      Color = clCream
      DataSource = dm2.zapros
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #1055#1057
          Visible = True
        end>
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 886
    Height = 105
    Align = alTop
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Color = clMedGray
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 32
      Width = 186
      Height = 13
      Caption = #1050#1083#1072#1089#1089' '#1090#1086#1095#1085#1086#1089#1090#1080' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093'  '#1058#1058
    end
    object Label2: TLabel
      Left = 520
      Top = 32
      Width = 24
      Height = 13
      Caption = #1080' '#1058#1053
    end
    object Label3: TLabel
      Left = 256
      Top = 64
      Width = 182
      Height = 13
      Caption = #1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1087#1086#1090#1077#1088#1103' '#1085#1072#1087#1088#1103#1078#1077#1085#1080#1103' '
    end
    object gridobyekt: TDBGrid
      Left = 8
      Top = 24
      Width = 225
      Height = 65
      Color = clCream
      DataSource = dm2.dbobyekt
      ReadOnly = True
      TabOrder = 8
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Obyekt'
          Title.Caption = #1054#1073#1098#1077#1082#1090
          Visible = True
        end>
    end
    object cb_tt: TComboBox
      Left = 448
      Top = 27
      Width = 59
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = '0'
      Items.Strings = (
        '0'
        '0,1'
        '0,2'
        '0,5'
        '1'
        '3'
        '5'
        '10')
    end
    object cb_tn: TComboBox
      Left = 548
      Top = 27
      Width = 59
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = '0'
      Items.Strings = (
        '0'
        '0,1'
        '0,2'
        '0,5'
        '1'
        '3'
        '3P'
        '6P')
    end
    object ed_poter: TEdit
      Left = 442
      Top = 59
      Width = 39
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Button1: TButton
      Left = 640
      Top = 48
      Width = 65
      Height = 25
      Caption = 'ok'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 792
      Top = 48
      Width = 57
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 6
      OnClick = Button3Click
    end
    object ed_poterc: TEdit
      Left = 549
      Top = 59
      Width = 39
      Height = 21
      TabOrder = 2
      Text = '0'
      Visible = False
    end
    object ed_poterb: TEdit
      Left = 496
      Top = 59
      Width = 39
      Height = 21
      TabOrder = 1
      Text = '0'
      Visible = False
    end
    object Button4: TButton
      Left = 720
      Top = 48
      Width = 57
      Height = 25
      Caption = #1086#1090#1095#1077#1090
      TabOrder = 7
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 265
    Width = 886
    Height = 91
    Align = alTop
    Color = clBackground
    TabOrder = 3
    object sg: TStringGrid
      Left = 1
      Top = 1
      Width = 884
      Height = 89
      Align = alClient
      ColCount = 15
      RowCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      Visible = False
      ColWidths = (
        64
        64
        64
        64
        65
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
  end
end
