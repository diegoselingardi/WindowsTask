object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 453
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 190
    Top = 11
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 8
    Top = 293
    Width = 71
    Height = 13
    Caption = 'Linha comando'
  end
  object Label4: TLabel
    Left = 20
    Top = 38
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tarefa'
  end
  object Label5: TLabel
    Left = 6
    Top = 65
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Programa'
  end
  object Label6: TLabel
    Left = 11
    Top = 92
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Agendar'
  end
  object Label7: TLabel
    Left = 267
    Top = 92
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hora Ini'
  end
  object MemLineCommand: TMemo
    Left = 8
    Top = 312
    Width = 385
    Height = 133
    ReadOnly = True
    TabOrder = 0
  end
  object EdtUser: TEdit
    Left = 58
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object EdtPassword: TEdit
    Left = 226
    Top = 8
    Width = 167
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object EdtTaskName: TEdit
    Left = 58
    Top = 35
    Width = 335
    Height = 21
    TabOrder = 3
  end
  object EdtTaskRun: TEdit
    Left = 58
    Top = 62
    Width = 335
    Height = 21
    TabOrder = 4
  end
  object CmbTypeTask: TComboBox
    Left = 58
    Top = 89
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    OnChange = CmbTypeTaskChange
    Items.Strings = (
      'Uma vez'
      'Diariamente'
      'Semanalmente'
      'Mensalmente')
  end
  object Button1: TButton
    Left = 258
    Top = 280
    Width = 135
    Height = 26
    Caption = 'Gerar linha de comando'
    TabOrder = 6
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 58
    Top = 116
    Width = 335
    Height = 158
    ActivePage = TabMonthly
    TabOrder = 7
    object TabOnce: TTabSheet
      Caption = 'Agendar uma vez'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label9: TLabel
        Left = 8
        Top = 20
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Executar em:'
      end
      object EdtOnceDate: TDateTimePicker
        Left = 80
        Top = 16
        Width = 83
        Height = 21
        Date = 41778.460886064810000000
        Time = 41778.460886064810000000
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object TabDaily: TTabSheet
      Caption = 'Diariamente'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 281
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 9
        Top = 20
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'A cada'
      end
      object Label10: TLabel
        Left = 101
        Top = 21
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'dia(s)'
      end
      object EdtEveryDaily: TSpinEdit
        Left = 48
        Top = 16
        Width = 47
        Height = 22
        MaxValue = 9999
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
    end
    object TabWeekly: TTabSheet
      Caption = 'Semanalmente'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label11: TLabel
        Left = 9
        Top = 20
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'A cada'
      end
      object Label12: TLabel
        Left = 101
        Top = 21
        Width = 85
        Height = 13
        Caption = 'semana(s) na/no:'
      end
      object EdtEveryWeekly: TSpinEdit
        Left = 48
        Top = 16
        Width = 47
        Height = 22
        MaxValue = 9999
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object ChkSeg: TCheckBox
        Left = 9
        Top = 52
        Width = 80
        Height = 17
        Caption = 'Segunda'
        TabOrder = 1
      end
      object ChkTer: TCheckBox
        Left = 15
        Top = 75
        Width = 80
        Height = 17
        Caption = 'Ter'#231'a'
        TabOrder = 2
      end
      object ChkQua: TCheckBox
        Left = 9
        Top = 98
        Width = 80
        Height = 17
        Caption = 'Quarta'
        TabOrder = 3
      end
      object ChkQui: TCheckBox
        Left = 101
        Top = 52
        Width = 80
        Height = 17
        Caption = 'Quinta'
        TabOrder = 4
      end
      object ChkSex: TCheckBox
        Left = 101
        Top = 75
        Width = 80
        Height = 17
        Caption = 'Sexta'
        TabOrder = 5
      end
      object ChkSab: TCheckBox
        Left = 101
        Top = 98
        Width = 80
        Height = 17
        Caption = 'S'#225'bado'
        TabOrder = 6
      end
      object ChkDom: TCheckBox
        Left = 187
        Top = 52
        Width = 80
        Height = 17
        Caption = 'Domingo'
        TabOrder = 7
      end
    end
    object TabMonthly: TTabSheet
      Caption = 'Mensalmente'
      ImageIndex = 3
      object LblMeses: TLabel
        Left = 110
        Top = 19
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'dos meses'
      end
      object RbDayOfMonth: TRadioButton
        Left = 3
        Top = 16
        Width = 46
        Height = 17
        Caption = 'Dia'
        TabOrder = 0
        OnClick = RbDayOfMonthClick
      end
      object RbDayOfWeek: TRadioButton
        Left = 3
        Top = 48
        Width = 46
        Height = 17
        Caption = 'A/O'
        TabOrder = 1
        OnClick = RbDayOfMonthClick
      end
      object EdtDayOfMonth: TSpinEdit
        Left = 56
        Top = 14
        Width = 47
        Height = 22
        MaxValue = 9999
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object CmbEveryMonth: TComboBox
        Left = 55
        Top = 46
        Width = 105
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Primeira(o)'
          'Segunda(o)'
          'Terceira(o)'
          'Quarta(o)'
          #218'ltimo')
      end
      object CmbDayOfWeekMonth: TComboBox
        Left = 166
        Top = 46
        Width = 147
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        Items.Strings = (
          'Segunda'
          'Ter'#231'a'
          'Quarta'
          'Quinta'
          'Sexta'
          'S'#225'bado'
          'Domingo')
      end
      object ChkJan: TCheckBox
        Left = 13
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Jan'
        TabOrder = 5
      end
      object ChkFev: TCheckBox
        Left = 13
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Fev'
        TabOrder = 6
      end
      object ChkAbr: TCheckBox
        Left = 64
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Abr'
        TabOrder = 7
      end
      object ChkMar: TCheckBox
        Left = 64
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Mar'
        TabOrder = 8
      end
      object ChkMaio: TCheckBox
        Left = 115
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Mai'
        TabOrder = 9
      end
      object ChkJun: TCheckBox
        Left = 115
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Jun'
        TabOrder = 10
      end
      object ChkAgo: TCheckBox
        Left = 166
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Ago'
        TabOrder = 11
      end
      object ChkJul: TCheckBox
        Left = 166
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Jul'
        TabOrder = 12
      end
      object ChkSet: TCheckBox
        Left = 217
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Set'
        TabOrder = 13
      end
      object ChkOut: TCheckBox
        Left = 217
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Out'
        TabOrder = 14
      end
      object ChkNov: TCheckBox
        Left = 268
        Top = 85
        Width = 45
        Height = 17
        Caption = 'Nov'
        TabOrder = 15
      end
      object ChkDez: TCheckBox
        Left = 268
        Top = 108
        Width = 45
        Height = 17
        Caption = 'Dez'
        TabOrder = 16
      end
    end
  end
  object EdtStartTime: TDateTimePicker
    Left = 311
    Top = 89
    Width = 83
    Height = 21
    Date = 41778.460886064810000000
    Time = 41778.460886064810000000
    Kind = dtkTime
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
  end
end
