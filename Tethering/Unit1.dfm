object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbConexao: TLabel
    Left = 11
    Top = 38
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 6
    Top = 57
    Width = 328
    Height = 360
    TabOrder = 1
  end
  object TetheringManager1: TTetheringManager
    OnPairedToRemote = TetheringManager1PairedToRemote
    OnRequestManagerPassword = TetheringManager1RequestManagerPassword
    Password = '1234'
    Text = 'TetheringManager1'
    AllowedAdapters = 'Network_V4'
    Left = 280
    Top = 16
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Group = 'Teste'
    Actions = <
      item
        Name = 'Teste'
        IsPublic = True
        NotifyUpdates = True
      end>
    Resources = <
      item
        Name = 'DebugInfo'
        IsPublic = True
      end>
    OnResourceReceived = TetheringAppProfile1ResourceReceived
    Left = 280
    Top = 80
  end
end
