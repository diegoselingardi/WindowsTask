unit DatabaseConfig;

interface

uses IniFiles;

  type TDatabaseConfig = class
  private
    FPort: Integer;
    FDatabase: string;
    FUser: string;
    FPassword: string;
    FServer: string;
    procedure SetDatabase(const Value: string);
    procedure SetServer(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetUser(const Value: string);
  public
    constructor Create;
    destructor Destroy; overload;
    property User: string read FUser write SetUser;
    property Password: string read FPassword write SetPassword;
    property Port: Integer read FPort write SetPort;
    property Server: string read FServer write SetServer;
    property Database: string read FDatabase write SetDatabase;
  end;

  type TDatabaseConfigIni = class
  private
    FConfig: TDatabaseConfig;
    procedure SetConfig(const Value: TDatabaseConfig);
    function GetFileName: string;
  public
    constructor Create;
    destructor Destroy; overload;
    property Config: TDatabaseConfig read FConfig write SetConfig;
    procedure Load;
    procedure Save;
  end;

const
  SECTION_NAME = 'Connection';
  DEFAULT_PORT = 5432;
  DEFAULT_SERVER = 'localhost';
  DEFAULT_DATABASENAME = 'folha';

implementation

uses SysUtils;

{ TDatabaseConfig }

constructor TDatabaseConfig.Create;
begin
  
end;

destructor TDatabaseConfig.Destroy;
begin

end;

procedure TDatabaseConfig.SetDatabase(const Value: string);
begin
  FDatabase := Value;
end;

procedure TDatabaseConfig.SetServer(const Value: string);
begin
  FServer := Value;
end;

procedure TDatabaseConfig.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TDatabaseConfig.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TDatabaseConfig.SetUser(const Value: string);
begin
  FUser := Value;
end;

{ TDatabaseConfigIni }

constructor TDatabaseConfigIni.Create;
begin
  FConfig := TDatabaseConfig.Create;
end;

destructor TDatabaseConfigIni.Destroy;
begin
  FConfig.Free;
end;

function TDatabaseConfigIni.GetFileName: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + '\config.ini';
end;

procedure TDatabaseConfigIni.Load;
var
  Ini: TIniFile;
begin

  Ini := TIniFile.Create(GetFileName);
  try
    FConfig.Database := Ini.ReadString(SECTION_NAME, 'Database', DEFAULT_DATABASENAME);
    FConfig.Server := Ini.ReadString(SECTION_NAME, 'Server', DEFAULT_SERVER);
    FConfig.User := Ini.ReadString(SECTION_NAME, 'User_name', '');
    FConfig.Password := Ini.ReadString(SECTION_NAME, 'Password', '');
    FConfig.Port := Ini.ReadInteger(SECTION_NAME, 'Port', DEFAULT_PORT);
  finally
    Ini.Free;
  end;

end;

procedure TDatabaseConfigIni.Save;
var
  Ini: TIniFile;
begin

  Ini := TIniFile.Create(GetFileName);
  try
    Ini.WriteString(SECTION_NAME, 'Database', FConfig.Database);
    Ini.WriteString(SECTION_NAME, 'Server', FConfig.Server);
    Ini.WriteString(SECTION_NAME, 'User_name', FConfig.User);
    Ini.WriteString(SECTION_NAME, 'Password', FConfig.Password);
    Ini.WriteInteger(SECTION_NAME, 'Port', FConfig.Port);
    Ini.UpdateFile;
  finally
    Ini.Free;
  end;

end;

procedure TDatabaseConfigIni.SetConfig(const Value: TDatabaseConfig);
begin
  FConfig := Value;
end;

end.
