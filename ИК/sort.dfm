object forma: Tforma
  Left = 21
  Top = 128
  Caption = 'Okno'
  ClientHeight = 689
  ClientWidth = 986
  Color = clWhite
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 689
    Align = alLeft
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 394
      Width = 183
      Height = 294
      Align = alBottom
      Caption = #1042#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      Color = clTeal
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 33
        Width = 23
        Height = 20
        Caption = 'A1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 65
        Width = 23
        Height = 20
        Caption = 'A2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 103
        Width = 13
        Height = 20
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 145
        Width = 14
        Height = 20
        Caption = 'D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 2
        Top = 201
        Width = 179
        Height = 91
        Align = alBottom
        AutoSize = False
        Caption = 
          #1047#1076#1077#1089#1100#13#10#13#10'  A1 - '#1064#1082#1072#1083#1072' '#1084#1080#1085'.'#13#10'  A2 - '#1064#1082#1072#1083#1072' '#1084#1072#1082#1089'.'#13#10'  N  - '#1064#1072#1075' '#13#10'  D' +
          '  - '#1055#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100
        Color = clTeal
        ParentColor = False
      end
      object Button2: TButton
        Left = 24
        Top = 176
        Width = 153
        Height = 25
        Caption = #1042#1099#1095#1080#1089#1083#1103#1090#1100
        TabOrder = 0
        OnClick = Button2Click
      end
      object SpinEdit1: TSpinEdit
        Left = 48
        Top = 32
        Width = 121
        Height = 22
        MaxValue = 5000
        MinValue = -2000
        TabOrder = 1
        Value = -381
      end
      object SpinEdit2: TSpinEdit
        Left = 48
        Top = 64
        Width = 121
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 381
      end
      object SpinEdit4: TSpinEdit
        Left = 48
        Top = 144
        Width = 121
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 10
      end
      object RadioGroup1: TRadioGroup
        Left = 48
        Top = 96
        Width = 121
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '11'
          '6')
        TabOrder = 4
      end
      object Button3: TButton
        Left = 96
        Top = 208
        Width = 75
        Height = 25
        Caption = #1086#1090#1095#1077#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button3Click
      end
    end
    object ValueListEditor1: TValueListEditor
      Left = 2
      Top = 6
      Width = 177
      Height = 236
      Color = clActiveBorder
      DropDownRows = 11
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing, goThumbTracking]
      Strings.Strings = (
        '-5=-5'
        '-4=-4'
        '-3=-3'
        '-2=-2'
        '-1=-1'
        '0=0'
        '1=1'
        '2=2'
        '3=3'
        '4=4'
        '5=5')
      TabOrder = 1
      ColWidths = (
        87
        84)
    end
    object tm: TSpinEdit
      Left = 48
      Top = 336
      Width = 121
      Height = 22
      MaxValue = 1000000
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 248
      Width = 113
      Height = 17
      Caption = '1 '#1092#1086#1088#1084#1091#1083#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object RadioButton2: TRadioButton
      Left = 24
      Top = 280
      Width = 113
      Height = 17
      Caption = '2 '#1092#1086#1088#1084#1091#1083#1072
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 185
    Top = 0
    Width = 801
    Height = 689
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 799
      Height = 687
      Align = alClient
      Color = clGradientInactiveCaption
      DataSource = dm2.DSjimm
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
end
