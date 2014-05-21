unit DailyTask;

interface

uses SysUtils;

type
  TDailyTask = class
  private
    FEvery: Integer;
    procedure SetEvery(const Value: Integer);
  published
    property Every: Integer read FEvery write SetEvery;
    function ScheduleLine: string;
    procedure ValidatePropertie;
    constructor Create;
  end;

implementation

{ TDailyTask }

constructor TDailyTask.Create;
const
  DEFAULT_DAY = 1;
begin
  FEvery := DEFAULT_DAY;
end;

function TDailyTask.ScheduleLine: string;
begin
  ValidatePropertie;
  Result := Format('/mo %d', [FEvery]);
end;

procedure TDailyTask.SetEvery(const Value: Integer);
begin
  FEvery := Value;
end;

procedure TDailyTask.ValidatePropertie;
const
  NONE_DAY = 0;
begin
  if FEvery = NONE_DAY then
    raise Exception.Create('Valor inválido para a opção "A cada x dias"');
end;

end.
