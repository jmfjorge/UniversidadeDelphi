unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure SendDebug(Sender: TObject; sValue: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SendDebug(Sender, 'Click');
end;

procedure TForm1.SendDebug(Sender : TObject; sValue : String);
begin
  if TetheringManager1.RemoteProfiles.Count>0  then
    TetheringAppProfile1.SendString(TetheringManager1.RemoteProfiles.First,
                                    TComponent(Sender).Name,
                                    sValue);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  SendDebug(Sender, SpinEdit1.Value.ToString);
end;

procedure TForm1.TetheringManager1RequestManagerPassword(const Sender: TObject;
  const ARemoteIdentifier: string; var Password: string);
begin
  Password:='1234'
end;

end.
