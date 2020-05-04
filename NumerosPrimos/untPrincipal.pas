unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function IsNumeroPrimo(iNumero : Integer): Boolean;
var
  iAuxiliar , iContador: integer;
begin
  Result := False;
  iContador := 0;
  for iAuxiliar := 1 to iNumero do
  begin
    if (iNumero mod iAuxiliar) = 0 then
      Inc(iContador);
    if iContador>2 then
      Break;
  end;
  Result := iContador = 2 ;
end;


procedure TForm2.Button1Click(Sender: TObject);
var
  iNumero : Integer;
  iQuantNumeros : Integer;
begin
  iQuantNumeros:=0;
  ListBox1.Clear;
  for iNumero := 1 to 1000 do
  begin
    if IsNumeroPrimo(iNumero) then
    begin
      ListBox1.Items.Add(iNumero.ToString);
      Inc(iQuantNumeros);
    end;
  end;
  Label1.Caption:='Quantidade Números: '+  iQuantNumeros.ToString;
end;

end.
