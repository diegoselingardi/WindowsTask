unit MonthlyTask;

interface

uses SysUtils, TpDayWeek, TpMonth, TpScheduleType, TpMonthlyParameter;

type
  TMonthlyTask = class
  private
    FEvery: TTpScheduleType;
    FMonths: TTpMonths;
    FDay: Integer;
    FWeekDay: TTpWeekDay;
    FMonthParameter: TTpMonthlyParameter;
    procedure SetDay(const Value: Integer);
    procedure SetWeekDay(const Value: TTpWeekDay);
    procedure SetEvery(const Value: TTpScheduleType);
    procedure SetMonths(const Value: TTpMonths);
    procedure SetMonthParameter(const Value: TTpMonthlyParameter);
  published
    property Day: Integer read FDay write SetDay;
    property Every: TTpScheduleType read FEvery write SetEvery;
    property WeekDay: TTpWeekDay read FWeekDay write SetWeekDay;
    property Months: TTpMonths read FMonths write SetMonths;
    property MonthParameter: TTpMonthlyParameter read FMonthParameter write SetMonthParameter;
    function ScheduleLine: string;
    function ValidateProperties: Boolean;
    constructor Create;
  end;

implementation

{ TMonthly }

constructor TMonthlyTask.Create;
const
  DEFAULT_MONTH_PARAMETER = tmEvery;
begin
  FMonthParameter := DEFAULT_MONTH_PARAMETER;
end;

function TMonthlyTask.ScheduleLine: string;
begin
  ValidateProperties;

  case MonthParameter of
    tmEvery:
      Result := Format('/d %d /m %s', [FDay, GetMonths(FMonths)]);
    tmDayOfWeekly:
      Result := Format('/mo %s /d %s /m %s', [GetScheduleType(FEvery),
        GetWeekDay(WeekDay),  GetMonths(FMonths)]);
  end;
end;

procedure TMonthlyTask.SetDay(const Value: Integer);
begin
  FDay := Value;
end;

procedure TMonthlyTask.SetWeekDay(const Value: TTpWeekDay);
begin
  FWeekDay := Value;
end;

procedure TMonthlyTask.SetEvery(const Value: TTpScheduleType);
begin
  FEvery := Value;
end;

procedure TMonthlyTask.SetMonthParameter(const Value: TTpMonthlyParameter);
const
  DEFAULT_DAY = 1;
  DEFAULT_EVERY = ttFirst;
begin
  FMonthParameter := Value;

  case FMonthParameter of
    tmEvery:
      FDay := DEFAULT_DAY;
    tmDayOfWeekly:
      FEvery := DEFAULT_EVERY;
  end;
end;

procedure TMonthlyTask.SetMonths(const Value: TTpMonths);
begin
  FMonths := Value;
end;

function TMonthlyTask.ValidateProperties: Boolean;
const
  NONE_DAY = 0;
  NONE_MONTHS = [];
begin
  if (FMonthParameter = tmEvery) and (FDay = NONE_DAY) then
    raise Exception.Create('O dia do mês não pode ser menor que um');

  if FMonths = NONE_MONTHS  then
    raise Exception.Create('Tarefa mensal inválida. Selecione um ou mais meses');
end;

end.
