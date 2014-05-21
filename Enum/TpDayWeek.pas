unit TpDayWeek;

interface

uses SysUtils;

type
  TTpWeekDay = (twMonday, twTuesday, twWednesday, twThursday, twFriday,
    twSaturday, twSunday);

  TTpDayOfWeek = set of TTpWeekDay;

const
  TTpWeekDayDesc: array[0..6] of string = ('seg', 'ter', 'qua', 'qui', 'sex',
    'sáb', 'dom');

function GetDayOfWeek(DayOfWeek: TTpDayOfWeek): string;
function GetWeekDay(WeekDay: TTpWeekDay): string;
function GetPosWeekDay(WeekDay: TTpWeekDay): Integer;
function GetEnumWeekDay(Index: Integer): TTpWeekDay;

implementation

function GetDayOfWeek(DayOfWeek: TTpDayOfWeek): string;
var
  WeekDay: TTpWeekDay;
begin
  for WeekDay := twMonday to twSunday do
  begin
    if WeekDay in DayOfWeek then
      Result := Format('%s,%s',
        [Result, TTpWeekDayDesc[Integer(WeekDay)]]);
  end;

  if not (Result = EmptyStr) then
    Delete(Result, 1, 1);
end;

function GetWeekDay(WeekDay: TTpWeekDay): string;
begin
  Result := Format('"%s"', [TTpWeekDayDesc[integer(WeekDay)]]);
end;

function GetPosWeekDay(WeekDay: TTpWeekDay): Integer;
begin
  Result := integer(WeekDay);
end;

function GetEnumWeekDay(Index: Integer): TTpWeekDay;
begin
  Result := TTpWeekDay(Index);
end;

end.
