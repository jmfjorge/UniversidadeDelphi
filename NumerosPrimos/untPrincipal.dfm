object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 406
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 151
    Top = 37
    Width = 121
    Height = 13
    Caption = 'Quantidade N'#250'meros: -   '
  end
  object Button1: TButton
    Left = 16
    Top = 32
    Width = 113
    Height = 25
    Caption = 'N'#250'meros Primos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 72
    Width = 385
    Height = 297
    ItemHeight = 13
    TabOrder = 1
  end
end
