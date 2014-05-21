unit TpScheduleType;

interface

uses SysUtils;

type
  TTpSchedule = (tsOnce, tsDaily, tsWeekly, tsMonthly);

  TTpScheduleType = (ttFirst, ttSecond, ttThird, ttFourth, ttLast);

const
  TTpScheduleDesc: array[0..3] of string = ('Uma vez', 'Diariamente',
    'Semanalmente', 'Mensalmente');

  TTpScheduleTypeDesc: array[0..4] of string = ('Primeira(o)',
    'Segunda(o)', 'Terceira(o)', 'Quarta(o)', 'Último');

function GetSchedule(Schedule: TTpSchedule): string;
function GetScheduleType(ScheduleType: TTpScheduleType): string;
function GetPosSchedule(Schedule: TTpSchedule): Integer;
function GetPosScheduleType(ScheduleType: TTpScheduleType): Integer;
function GetEnumSchedule(Index: Integer): TTpSchedule;
function GetEnumScheduleType(Index: Integer): TTpScheduleType;

implementation

function GetSchedule(Schedule: TTpSchedule): string;
begin
  Result := Format('"%s"', [TTpScheduleDesc[integer(Schedule)]]);
end;

function GetScheduleType(ScheduleType: TTpScheduleType): string;
begin
  Result := Format('%s', [TTpScheduleTypeDesc[integer(ScheduleType)]]);
end;

function GetPosSchedule(Schedule: TTpSchedule): Integer;
begin
  Result := integer(Schedule);
end;

function GetEnumSchedule(Index: Integer): TTpSchedule;
begin
  Result := TTpSchedule(Index);
end;

function GetPosScheduleType(ScheduleType: TTpScheduleType): Integer;
begin
  Result := integer(ScheduleType);
end;

function GetEnumScheduleType(Index: Integer): TTpScheduleType;
begin
  Result := TTpScheduleType(Index);
end;

end.
