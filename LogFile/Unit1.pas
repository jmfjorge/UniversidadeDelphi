unit Unit1;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls, Vcl.SvcMgr, jclDebug;

type
  TForm1 = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure AddErrorWindowsLog(sError: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unitLog;

{$R *.dfm}

procedure TForm1.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  oList  : TStringList;
begin
  GerarLogErro(Sender, E);


  try
    oList := TStringList.Create;
    JclLastExceptStackListToStrings(oList, True, True, True, False);
    if ParamStr(1).ToUpper='/DEBUG' then
      Showmessage(oList.Text);
    AddErrorWindowsLog(E.Message + #10#13 + oList.Text);
  finally
    oList.Free;
  end;



end;


procedure TForm1.AddErrorWindowsLog(sError : String);
begin
  with TEventLogger.Create('LogFile Application - Error') do
  begin
    try
      LogMessage(sError, 1);
    finally
      Free;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  StrToInt('a');
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  PInteger(0)^ := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  while (1=1) do
  begin

  end;
end;


initialization

  // Enable raw mode (default mode uses stack frames which aren't always generated by the compiler)
  Include(JclStackTrackingOptions, stRawMode);
  // Disable stack tracking in dynamically loaded modules (it makes stack tracking code a bit faster)
  Include(JclStackTrackingOptions, stStaticModuleList);
  // Initialize Exception tracking
  JclStartExceptionTracking;

finalization

  JclStopExceptionTracking;


end.