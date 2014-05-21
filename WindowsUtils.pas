unit WindowsUtils;

interface

uses
  Windows, SHFolder;

function GetSpecialFolderPath(folder : integer): string;
function GetWindowsUser: string;

implementation

function GetSpecialFolderPath(folder : integer): string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := path
  else
    Result := '';
end;

function GetWindowsUser: string;
var
  buffer : array[0..255] of char;
  size : dword;
begin
  size := 256;
  GetUserName(buffer, size);
  Result := buffer;
end;

end.
