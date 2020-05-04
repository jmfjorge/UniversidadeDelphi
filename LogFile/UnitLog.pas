unit UnitLog;

interface

uses System.SysUtils, Vcl.Forms, Vcl.Graphics, Winapi.Windows, Jpeg;

procedure GerarLogErro(Sender : TObject; E: Exception);

implementation


function GetUsuarioSO : string;
var
  Size: dword;
begin
  // retorna o login do usuário do sistema operacional
  Size := 1024;
  SetLength(result, Size);
  GetUserName(PChar(result), Size);
  SetLength(result, Size - 1);
end;


function GetLogFileName : string;
begin
   Result := ExtractFileName(ChangeFileExt(ExtractFileName(Application.ExeName),'.log'));
end;

function GetImageFileName : string;
begin
   Result := 'Exception_' + FormatDateTime('yyyy_mm_dd_hh_nn_ss_zz', Now)+ '.jpg';
end;


function GetAppDataPath: string;
var
  Path: array[0..MAX_PATH+1] of Char;
begin
  if ExpandEnvironmentStrings('%APPDATA%', Path, Length(Path)) > 1 then
    Result := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(Path) + ChangeFileExt(ExtractFileName(Application.ExeName),''))
  else
    Result := '';
end;

procedure GravarImagemForm(const sNomeArquivo: string; oForm : TForm);
var
  Bitmap: Vcl.Graphics.TBitmap;
  JPEG: TJpegImage;
begin
  JPEG := TJpegImage.Create;
  try
    Bitmap := oForm.GetFormImage;
    JPEG.Assign(Bitmap);
    JPEG.SaveToFile(sNomeArquivo);
  finally
    JPEG.Free;
    Bitmap.Free;
  end;
end;

function ObterVersaoWindows: string;
begin
  case System.SysUtils.Win32MajorVersion of
    5:
      case System.SysUtils.Win32MinorVersion of
        1: result := 'Windows XP';
      end;
    6:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows Vista';
        1: result := 'Windows 7';
        2: result := 'Windows 8';
        3: result := 'Windows 8.1';
      end;
    10:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows 10';
      end;
  end;
end;

procedure AdicionarErroLog(sArquivoLog : String; Sender : TObject; E: Exception);
var
  sCaminhoArquivoLog: string;
  oArquivoLog: TextFile;
begin


  // Associa o arquivo à variável "ArquivoLog"
  AssignFile(oArquivoLog, sArquivoLog);

  // Se o arquivo existir, abre para edição,
  // Caso contrário, cria o arquivo
  if FileExists(sArquivoLog) then
    Append(oArquivoLog)
  else
    ReWrite(oArquivoLog);

  // Escreve os dados no arquivo de log
  WriteLn(oArquivoLog, '');
  WriteLn(oArquivoLog, StringOfChar('-', 80));
  WriteLn(oArquivoLog, '['+ DateTimeToStr(Now) + ']');
  WriteLn(oArquivoLog, 'Mensagem........: ' + E.Message);
  WriteLn(oArquivoLog, 'Classe Exceção..: ' + E.ClassName);
  WriteLn(oArquivoLog, 'Formulário......: ' + Screen.ActiveForm.Name);
  WriteLn(oArquivoLog, 'Unit............: ' + Sender.UnitName);
  WriteLn(oArquivoLog, 'Controle Visual.: ' + Screen.ActiveControl.Name);
  WriteLn(oArquivoLog, 'Usuário.........: ' + GetUsuarioSO);
  WriteLn(oArquivoLog, 'Versão Windows..: ' + ObterVersaoWindows);
  WriteLn(oArquivoLog, StringOfChar('-', 80));

  // Fecha o arquivo
  CloseFile(oArquivoLog);
end;

procedure GerarLogErro(Sender : TObject; E: Exception);
var
  sPath : String;
begin
  sPath:=GetAppDataPath;
  ForceDirectories(sPath);
  GravarImagemForm(sPath+GetImageFileName, Screen.ActiveForm);
  AdicionarErroLog(sPath+GetLogFileName, Sender, E);
end;

end.
