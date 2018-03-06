object setka: Tsetka
  Left = 256
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1072#1089#1095#1105#1090' '
  ClientHeight = 370
  ClientWidth = 413
  Color = clWhite
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 370
    Align = alClient
    TabOrder = 0
    object Label6: TLabel
      Left = 17
      Top = 287
      Width = 134
      Height = 16
      Caption = #1054#1090#1082#1088#1099#1074#1072#1077#1084' txt '#1092#1072#1081#1083
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 411
      Height = 272
      Align = alTop
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
        Top = 79
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
        Left = 232
        Top = 33
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
        Left = 231
        Top = 78
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
        Top = 176
        Width = 407
        Height = 94
        Align = alBottom
        AutoSize = False
        Caption = 
          #1047#1076#1077#1089#1100#13#10#13#10'  A1 - '#1064#1082#1072#1083#1072' '#1084#1080#1085'.'#13#10'  A2 - '#1064#1082#1072#1083#1072' '#1084#1072#1082#1089'.'#13#10'  N  - '#1050#1086#1083#1080#1095#1077#1089#1090#1074 +
          #1072'  '#1090#1086#1095#1077#1082#13#10'  D  - '#1055#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100
        Color = clTeal
        ParentColor = False
        ExplicitLeft = -64
        ExplicitTop = 188
        ExplicitWidth = 400
      end
      object Button2: TButton
        Left = 45
        Top = 136
        Width = 121
        Height = 25
        Caption = #1042#1099#1095#1080#1089#1083#1103#1090#1100
        TabOrder = 0
        OnClick = Button2Click
      end
      object SpinEdit4: TSpinEdit
        Left = 264
        Top = 80
        Width = 121
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 5
      end
      object Button3: TButton
        Left = 264
        Top = 136
        Width = 121
        Height = 25
        Caption = #1087#1088#1086#1090#1086#1082#1086#1083
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Edit1: TEdit
        Left = 45
        Top = 30
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 45
        Top = 80
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 264
        Top = 30
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object RadioButton1: TRadioButton
      Left = 17
      Top = 16
      Width = 113
      Height = 17
      Caption = '1 '#1092#1086#1088#1084#1091#1083#1072
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      Visible = False
    end
    object RadioButton2: TRadioButton
      Left = 273
      Top = 16
      Width = 113
      Height = 17
      Caption = '2 '#1092#1086#1088#1084#1091#1083#1072
      TabOrder = 2
      Visible = False
    end
    object bb_ok: TButton
      Left = 122
      Top = 321
      Width = 153
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      TabOrder = 3
      OnClick = bb_okClick
    end
  end
end
