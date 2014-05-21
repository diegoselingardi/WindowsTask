unit WindowsTask;

interface

uses SysUtils, Dialogs, TpScheduleType, DailyTask, MonthlyTask, OnceTask,
  WeeklyTask, Windows, ShellApi, Classes;

type
  TWindowsTask = class
  private
    FName: string;
    FRun: string;
    FRunParameters: string;
    FPassword: string;
    FUser: string;
    FSchedule: TTpSchedule;
    FStartTime: TTime;
    FStartDate: TDate;
    FMonthly: TMonthlyTask;
    FWeekly: TWeeklyTask;
    FDaily: TDailyTask;
    FOnce: TOnceTask;
    FCommandLine: string;
    procedure SetName(const Value: string);
    procedure SetRun(const Value: string);
    procedure SetRunParameters(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUser(const Value: string);
    procedure SetSchedule(const Value: TTpSchedule);
    procedure SetStartDate(const Value: TDate);
    procedure SetStartTime(const Value: TTime);
    procedure SetDaily(const Value: TDailyTask);
    procedure SetMonthly(const Value: TMonthlyTask);
    procedure SetWeekly(const Value: TWeeklyTask);
    procedure SetOnce(const Value: TOnceTask);
    procedure GenerateCommandLine;
  published
    property Name: string read FName write SetName;
    property Run: string read FRun write SetRun;
    property RunParameters: string read FRunParameters write SetRunParameters;
    property User: string read FUser write SetUser;
    property Password: string read FPassword write SetPassword;
    property Schedule: TTpSchedule read FSchedule write SetSchedule default tsOnce;
    property StartTime: TTime read FStartTime write SetStartTime;
    property StartDate: TDate read FStartDate write SetStartDate;
    property Once: TOnceTask read FOnce write SetOnce;
    property Daily: TDailyTask read FDaily write SetDaily;
    property Weekly: TWeeklyTask read FWeekly write SetWeekly;
    property Monthly: TMonthlyTask read FMonthly write SetMonthly;
    function GetCommandLine: string;
    procedure Execute;
    constructor Create;
  end;

implementation

{ TWindowsTask }

uses CaptureConsole;

procedure TWindowsTask.SetRun(const Value: string);
begin
  FRun := Value;
end;

procedure TWindowsTask.SetRunParameters(const Value: string);
begin
  FRunParameters := Value;
end;

procedure TWindowsTask.SetUser(const Value: string);
begin
  FUser := Value;
end;

constructor TWindowsTask.Create;
const
  DEFAULT_SCHEDULE = tsOnce;
begin
  FSchedule := DEFAULT_SCHEDULE;
end;

procedure TWindowsTask.Execute;
begin
  GenerateCommandLine;
  ShellExecute( 0, 'open', 'cmd', PChar(FCommandLine), nil, SW_HIDE );
end;

procedure TWindowsTask.GenerateCommandLine;
const
  COMMAND_LINE_TASK =
    '/C SCHTASKS /create /tn "%s" /tr "%s" /sc %s -parameters /st %s /sd %s /ru %s /rp %s';
var
  FRunLine: string;
  FScheduleLine: string;
begin
  FScheduleLine := EmptyStr;

  case FSchedule of
    tsOnce:
      FStartDate := FOnce.RunDay;
    tsDaily:
      FScheduleLine := FDaily.ScheduleLine;
    tsWeekly:
      FScheduleLine := FWeekly.ScheduleLine;
    tsMonthly:
      FScheduleLine := FMonthly.ScheduleLine;
  end;

  FRunLine := Format('%s %s', [FRun, FRunParameters]);

  FCommandLine := Format(COMMAND_LINE_TASK, [FName, FRunLine,
    GetSchedule(FSchedule), FormatDateTime('hh:mm:ss', FStartTime),
    FormatDateTime('dd/mm/yyyy', FStartDate), FUser, FPassword]);

  FCommandLine := StringReplace(FCommandLine, '-parameters', FScheduleLine,
    [rfReplaceAll]);
end;

function TWindowsTask.GetCommandLine: string;
begin
  GenerateCommandLine;
  Result := FCommandLine;
end;

procedure TWindowsTask.SetDaily(const Value: TDailyTask);
begin
  FDaily := Value;
end;

procedure TWindowsTask.SetMonthly(const Value: TMonthlyTask);
begin
  FMonthly := Value;
end;

procedure TWindowsTask.SetWeekly(const Value: TWeeklyTask);
begin
  FWeekly := Value;
end;

procedure TWindowsTask.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TWindowsTask.SetSchedule(const Value: TTpSchedule);
begin
  FSchedule := Value;

  if Assigned(FOnce) then
    FreeAndNil(FOnce);

  if Assigned(FDaily) then
    FreeAndNil(FDaily);

  if Assigned(FWeekly) then
    FreeAndNil(FWeekly);

  if Assigned(FMonthly) then
    FreeAndNil(FMonthly);

  case FSchedule of
    tsOnce:
      FOnce := TOnceTask.Create;
    tsDaily:
      FDaily := TDailyTask.Create;
    tsWeekly:
      FWeekly := TWeeklyTask.Create;
    tsMonthly:
      FMonthly := TMonthlyTask.Create;
  end;
end;

procedure TWindowsTask.SetStartDate(const Value: TDate);
begin
  FStartDate := Value;
end;

procedure TWindowsTask.SetStartTime(const Value: TTime);
begin
  FStartTime := Value;
end;

procedure TWindowsTask.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TWindowsTask.SetOnce(const Value: TOnceTask);
begin
  FOnce := Value;
end;

end.
