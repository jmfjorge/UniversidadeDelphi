object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o Teste'
  ClientHeight = 351
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpinEdit1: TSpinEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
    OnChange = SpinEdit1Change
  end
  object Button1: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object TetheringManager1: TTetheringManager
    OnRequestManagerPassword = TetheringManager1RequestManagerPassword
    Password = '1234'
    Text = 'ExampleApplication'
    AllowedAdapters = 'Network_V4'
    Left = 264
    Top = 16
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'ExampleApplication'
    Group = 'Teste'
    Actions = <>
    Resources = <
      item
        Name = 'DebugInfo'
        IsPublic = True
      end>
    Left = 264
    Top = 80
  end
end
