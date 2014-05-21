program ExampleTask;

uses
  Vcl.Forms,
  Example in 'Example.pas' {Form1},
  CaptureConsole in '..\CaptureConsole.pas',
  DailyTask in '..\DailyTask.pas',
  DatabaseConfig in '..\DatabaseConfig.pas',
  MonthlyTask in '..\MonthlyTask.pas',
  OnceTask in '..\OnceTask.pas',
  WeeklyTask in '..\WeeklyTask.pas',
  WindowsTask in '..\WindowsTask.pas',
  WindowsUtils in '..\WindowsUtils.pas',
  TpScheduleType in '..\Enum\TpScheduleType.pas',
  TpDayWeek in '..\Enum\TpDayWeek.pas',
  TpMonth in '..\Enum\TpMonth.pas',
  TpMonthlyParameter in '..\Enum\TpMonthlyParameter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
