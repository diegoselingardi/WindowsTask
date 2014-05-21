unit TpMonth;

interface

uses SysUtils;

type
  TTpMonth = (tmJanuary, tmFebruary, tmMarch, tmApril, tmMay, tmJune, tmJuly,
    tmAugust, tmSeptember, tmOctober, tmNovember, tmDecember);

  TTpMonths = set of TTpMonth;

const
  TTpMonthsDesc: array[0..11] of string = ('jan', 'fev', 'mar', 'abr', 'maio',
    'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez');

function GetMonths(Months: TTpMonths): string;

implementation

function GetMonths(Months: TTpMonths): string;
var
  Month: TTpMonth;
begin

  for Month := tmJanuary to tmDecember do
  begin
    if Month in Months then
      Result := Format('%s,%s',
        [Result, TTpMonthsDesc[Integer(Month)]]);
  end;

  if not (Result = EmptyStr) then
    Delete(Result, 1, 1);
end;

end.
