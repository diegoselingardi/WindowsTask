unit OnceTask;

interface

uses DateUtils;

type
  TOnceTask = class
  private
    FRunDay: TDate;
    procedure SetRunDay(const Value: TDate);
  published
    property RunDay: TDate read FRunDay write SetRunDay;
    constructor Create;
  end;

implementation

{ TOnceTask }

constructor TOnceTask.Create;
begin
  FRunDay := Today;
end;

procedure TOnceTask.SetRunDay(const Value: TDate);
begin
  FRunDay := Value;
end;

end.

