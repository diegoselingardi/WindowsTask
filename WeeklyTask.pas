unit WeeklyTask;

interface

uses SysUtils, TpDayWeek;

type
  TWeeklyTask = class
  private
    FEvery: Integer;
    FDayOfWeek: TTpDayOfWeek;
    procedure SetEvery(const Value: Integer);
    procedure SetDayOfWeek(const Value: TTpDayOfWeek);
  published
    property Every: Integer read FEvery write SetEvery;
    property DayOfWeek: TTpDayOfWeek read FDayOfWeek write SetDayOfWeek;
    function ScheduleLine: string;
    procedure ValidateProperties;
    constructor Create;
  end;

implementation

{ TWeeklyTask }

constructor TWeeklyTask.Create;
const
  DEFAULT_DAY_MONTH = 1;
begin
  FEvery := DEFAULT_DAY_MONTH;
end;

function TWeeklyTask.ScheduleLine: string;
begin
  ValidateProperties;
  Result := Format('/mo %d /d %s', [Every, GetDayOfWeek(DayOfWeek)])
end;

procedure TWeeklyTask.SetDayOfWeek(const Value: TTpDayOfWeek);
begin
  FDayOfWeek := Value;
end;

procedure TWeeklyTask.SetEvery(const Value: Integer);
begin
  FEvery := Value;
end;

procedure TWeeklyTask.ValidateProperties;
const
  NONE_EVERY = 0;
  NONE_DAY_OF_WEEK = [];
begin
  if FEvery = NONE_EVERY then
    raise Exception.Create('Valor inválido para a opção "A cada x dias"');

  if FDayOfWeek = NONE_DAY_OF_WEEK  then
    raise Exception.Create('Tarefa semanal inválida. Selecione um ou mais dias');
end;

end.
