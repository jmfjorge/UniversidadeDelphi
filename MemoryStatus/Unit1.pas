unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure UpdateMemInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  UpdateMemInfo;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  iTeste  : Integer;
begin
  for iTeste := 1 to 50 do
  begin
    with TForm2.Create(Self) do
    begin
      Parent:=Self;
      Position:=poDesigned;
      Top:=200;
      Left:=100;
      Name:='FormTest' + (TButton(Sender).Tag + iTeste).ToString;
      Visible:=True;
      if iTeste mod 5 = 0 then
        Application.ProcessMessages;
    end;
    Assert(GetGuiResources(GetCurrentProcess, 0)<9500, 'Recursos de GDI em nível perigoso!');
  end;
  TButton(Sender).Tag:=TButton(Sender).Tag+50;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.UpdateMemInfo;
const
  iBytesPorGb = 1024 * 1024 * 1024;
var
  M: TMemoryStatus;
begin
  M.dwLength := SizeOf(M);
  GlobalMemoryStatus(M);
  Memo1.Clear;
  with Memo1.Lines do begin
    Add(Format('Memória em uso: %d%%',
      [M.dwMemoryLoad]));
    Add(Format('Total de memória física: %f GB',
      [M.dwTotalPhys / iBytesPorGb]));
    Add(Format('Memória física disponível: %f GB',
      [M.dwAvailPhys / iBytesPorGb]));
    Add(Format('Tamanho máximo do arquivo de paginação: %f GB',
      [M.dwTotalPageFile / iBytesPorGb]));
    Add(Format('Disponível no arquivo de paginação: %f GB',
      [M.dwAvailPageFile / iBytesPorGb]));
    Add(Format('Total de memória virtual: %f GB',
      [M.dwTotalVirtual / iBytesPorGb]));
    Add(Format('Memória virtual disponível: %f GB',
      [M.dwAvailVirtual / iBytesPorGb]));
    //GDI
    Add(Format('Objetos GDI: %d',
      [GetGuiResources(GetCurrentProcess, 0)]));


  end;

end;

end.
