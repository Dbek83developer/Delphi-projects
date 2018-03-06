object TM_RET: TTM_RET
  Left = 256
  Top = 154
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042' '#1101#1090#1086#1081' '#1092#1086#1088#1084#1077' '#1074#1077#1076#1105#1090#1089#1103' '#1088#1072#1089#1095#1105#1090' '#1101#1082#1089#1087#1077#1088#1080#1084#1077#1085#1090#1072#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 435
  ClientWidth = 585
  Color = clSkyBlue
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 281
    Width = 167
    Height = 13
    Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1072' tm_ret'
    Visible = False
  end
  object Label2: TLabel
    Left = 14
    Top = 160
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1073#1083#1086#1082#1072
  end
  object Label3: TLabel
    Left = 130
    Top = 408
    Width = 125
    Height = 13
    Caption = 'All right !!! Let'#39's go ...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 248
    Top = 281
    Width = 15
    Height = 13
    Caption = #1076#1086
    Visible = False
  end
  object Label5: TLabel
    Left = 68
    Top = 211
    Width = 38
    Height = 13
    Caption = #1074#1088#1077#1084#1103
    Visible = False
  end
  object Label6: TLabel
    Left = 8
    Top = 104
    Width = 116
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1083#1086#1082#1086#1074
  end
  object Label7: TLabel
    Left = 29
    Top = 30
    Width = 313
    Height = 20
    Caption = #1042#1099#1073#1080#1088#1072#1077#1084' '#1086#1073#1098#1077#1082#1090' '#1080' '#1087#1086#1076#1089#1090#1072#1085#1094#1080#1102' -->'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    WordWrap = True
  end
  object bb_ok: TButton
    Left = 20
    Top = 358
    Width = 73
    Height = 25
    Caption = 'ok'
    TabOrder = 5
    OnClick = bb_okClick
  end
  object ed_time: TMaskEdit
    Left = 130
    Top = 208
    Width = 63
    Height = 21
    EditMask = '!90:00:00;1;'
    MaxLength = 8
    TabOrder = 3
    Text = '  :  :  '
    Visible = False
    OnChange = ed_timeChange
  end
  object ComboBox1: TComboBox
    Left = 184
    Top = 273
    Width = 49
    Height = 21
    DropDownCount = 14
    ItemHeight = 13
    TabOrder = 8
    Visible = False
    OnChange = ComboBox1Change
    Items.Strings = (
      ' 0'
      ' 1'
      ' 2'
      ' 3'
      ' 4'
      ' 5'
      ' 6'
      ' 7'
      ' 8'
      ' 9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27')
  end
  object Edit1: TEdit
    Left = 128
    Top = 157
    Width = 65
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object bb_clear: TButton
    Left = 248
    Top = 358
    Width = 73
    Height = 25
    Caption = 'Clear'
    TabOrder = 7
    OnClick = bb_clearClick
  end
  object ComboBox2: TComboBox
    Left = 272
    Top = 273
    Width = 49
    Height = 21
    DropDownCount = 14
    ItemHeight = 13
    TabOrder = 9
    Visible = False
    OnChange = ComboBox1Change
    Items.Strings = (
      ' 0'
      ' 1'
      ' 2'
      ' 3'
      ' 4'
      ' 5'
      ' 6'
      ' 7'
      ' 8'
      ' 9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27')
  end
  object Button1: TButton
    Left = 130
    Top = 358
    Width = 75
    Height = 25
    Caption = #1086#1090#1095#1077#1090
    TabOrder = 6
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 232
    Top = 102
    Width = 89
    Height = 21
    Date = 39386.000000000000000000
    Time = 39386.000000000000000000
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object MaskEdit1: TMaskEdit
    Left = 256
    Top = 208
    Width = 65
    Height = 21
    EditMask = '!90:00:00;1;'
    MaxLength = 8
    TabOrder = 4
    Text = '  :  :  '
    Visible = False
    OnChange = MaskEdit1Change
  end
  object kolblock: TSpinEdit
    Left = 130
    Top = 101
    Width = 65
    Height = 22
    MaxValue = 8000
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object Panel1: TPanel
    Left = 352
    Top = 0
    Width = 233
    Height = 435
    Align = alRight
    TabOrder = 10
    object ComboBox3: TComboBox
      Left = 40
      Top = 80
      Width = 145
      Height = 21
      ItemHeight = 0
      TabOrder = 0
      Visible = False
      OnChange = ComboBox3Change
    end
    object ComboBox4: TComboBox
      Left = 40
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 0
      TabOrder = 1
      OnChange = ComboBox4Change
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 103
      Width = 231
      Height = 331
      Align = alBottom
      Color = clGradientActiveCaption
      DataSource = dm2.Dstable
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'nom'
          Title.Caption = #1048#1050
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'znak'
          Title.Caption = #1087#1072#1088#1072#1084#1077#1090#1088
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'block'
          Title.Caption = #1053#1086#1084#1077#1088' '#1073#1083#1086#1082#1072
          Width = 84
          Visible = True
        end>
    end
  end
  object minus: TCheckBox
    Left = 256
    Top = 159
    Width = 63
    Height = 17
    Caption = 'manfiy'
    TabOrder = 11
  end
end
