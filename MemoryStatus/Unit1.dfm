object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Exemplo Memory'
  ClientHeight = 443
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    428
    443)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 412
    Height = 396
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 345
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Teste'
    TabOrder = 2
    OnClick = Button2Click
  end
end
