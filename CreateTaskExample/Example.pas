unit Example;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Samples.Spin, WindowsTask, Vcl.ComCtrls,
  TpScheduleType, WindowsUtils, TpDayWeek, TpMonthlyParameter, TpMonth;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EdtUser: TEdit;
    Label2: TLabel;
    EdtPassword: TEdit;
    Label3: TLabel;
    MemLineCommand: TMemo;
    Label4: TLabel;
    EdtTaskName: TEdit;
    Label5: TLabel;
    EdtTaskRun: TEdit;
    Label6: TLabel;
    CmbTypeTask: TComboBox;
    Label7: TLabel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabOnce: TTabSheet;
    TabDaily: TTabSheet;
    TabWeekly: TTabSheet;
    TabMonthly: TTabSheet;
    Label9: TLabel;
    EdtOnceDate: TDateTimePicker;
    Label8: TLabel;
    EdtEveryDaily: TSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    EdtEveryWeekly: TSpinEdit;
    Label12: TLabel;
    ChkSeg: TCheckBox;
    ChkTer: TCheckBox;
    ChkQua: TCheckBox;
    ChkQui: TCheckBox;
    ChkSex: TCheckBox;
    ChkSab: TCheckBox;
    ChkDom: TCheckBox;
    RbDayOfMonth: TRadioButton;
    RbDayOfWeek: TRadioButton;
    EdtDayOfMonth: TSpinEdit;
    LblMeses: TLabel;
    CmbEveryMonth: TComboBox;
    CmbDayOfWeekMonth: TComboBox;
    ChkJan: TCheckBox;
    ChkFev: TCheckBox;
    ChkAbr: TCheckBox;
    ChkMar: TCheckBox;
    ChkMaio: TCheckBox;
    ChkJun: TCheckBox;
    ChkAgo: TCheckBox;
    ChkJul: TCheckBox;
    ChkSet: TCheckBox;
    ChkOut: TCheckBox;
    ChkNov: TCheckBox;
    ChkDez: TCheckBox;
    EdtStartTime: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmbTypeTaskChange(Sender: TObject);
    procedure RbDayOfMonthClick(Sender: TObject);
  private
    { Private declarations }
    Task: TWindowsTask;
    procedure ControlTabVisible(Once, Daily, Weekly, Monthly: Boolean);
    procedure RadioControlMonthly;
    function GetDayOfWeek: TTpDayOfWeek;
    function GetMonthly: TTpMonths;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    Task.User := EdtUser.Text;
    Task.Password := EdtPassword.Text;
    Task.Name := EdtTaskName.Text;
    Task.Run := EdtTaskRun.Text;
    Task.StartTime := Now;
    Task.StartDate := Now;

    case Task.Schedule of
      tsOnce:
        Task.Once.RunDay := EdtOnceDate.DateTime;
      tsDaily:
        Task.Daily.Every := EdtEveryDaily.Value;
      tsWeekly:
      begin
        Task.Weekly.Every := EdtEveryWeekly.Value;
        Task.Weekly.DayOfWeek := GetDayOfWeek;
      end;
      tsMonthly:
      begin
        Task.Monthly.Months := GetMonthly;

        case Task.Monthly.MonthParameter of
          tmEvery:
          begin
            Task.Monthly.Day := EdtDayOfMonth.Value;
          end;
          tmDayOfWeekly:
          begin
            Task.Monthly.Every := GetEnumScheduleType(CmbEveryMonth.ItemIndex);
            Task.Monthly.WeekDay := GetEnumWeekDay(CmbDayOfWeekMonth.ItemIndex);
          end;
        end;
      end;
    end;

    MemLineCommand.Lines.Text := Task.GetCommandLine;
    Task.Execute;
  except on E: Exception do
    Application.MessageBox(PChar(e.Message),'Atenção',MB_ICONERROR + MB_OK);
  end;

end;

procedure TForm1.CmbTypeTaskChange(Sender: TObject);
begin
  Task.Schedule := GetEnumSchedule(CmbTypeTask.ItemIndex);

  case Task.Schedule of
    tsOnce:
      ControlTabVisible(True, False, False, False);
    tsDaily:
      ControlTabVisible(False, True, False, False);
    tsWeekly:
      ControlTabVisible(False, False, True, False);
    tsMonthly:
    begin
      ControlTabVisible(False, False, False, True);
      RbDayOfMonth.Checked := True;
    end;
  end;
end;

procedure TForm1.ControlTabVisible(Once, Daily, Weekly, Monthly: Boolean);
begin
  TabOnce.TabVisible := Once;
  TabDaily.TabVisible := Daily;
  TabWeekly.TabVisible := Weekly;
  TabMonthly.TabVisible := Monthly;
end;

procedure TForm1.FormShow(Sender: TObject);
const
  DEFAULT_TYPE_TASK = tsOnce;
begin
  Task := TWindowsTask.Create;
  EdtUser.Text := GetWindowsUser;
  CmbTypeTask.ItemIndex := GetPosSchedule(DEFAULT_TYPE_TASK);
  EdtStartTime.Time := Now;

  CmbTypeTaskChange(CmbTypeTask);
end;

procedure TForm1.RadioControlMonthly;
const
  DEFAULT_EVERY = ttFirst;
  DEFAULT_DAY_OF_WEEK = twMonday;
  NONE_VALUE = -1;
var
  ActiveCheckBoxMonth: Boolean;
begin
  ActiveCheckBoxMonth := RbDayOfMonth.Checked;

  EdtDayOfMonth.Enabled := RbDayOfMonth.Checked;
  LblMeses.Enabled := RbDayOfMonth.Checked;

  CmbEveryMonth.Enabled := RbDayOfWeek.Checked;
  CmbDayOfWeekMonth.Enabled := RbDayOfWeek.Checked;

  if RbDayOfMonth.Checked then
  begin
    Task.Monthly.MonthParameter := tmEvery;
    CmbEveryMonth.ItemIndex := NONE_VALUE;
    CmbDayOfWeekMonth.ItemIndex := NONE_VALUE;
  end
  else if RbDayOfWeek.Checked then
  begin
    Task.Monthly.MonthParameter := tmDayOfWeekly;
    CmbEveryMonth.ItemIndex := GetPosScheduleType(DEFAULT_EVERY);
    CmbDayOfWeekMonth.ItemIndex := GetPosWeekDay(DEFAULT_DAY_OF_WEEK);
  end;
end;

procedure TForm1.RbDayOfMonthClick(Sender: TObject);
begin
  RadioControlMonthly;
end;

function TForm1.GetDayOfWeek;
const
  NONE_DAY_OF_WEEK = [];
begin
  Result := NONE_DAY_OF_WEEK;

  if ChkSeg.Checked then
    Result := Result + [twMonday];

  if ChkTer.Checked then
    Result := Result + [twTuesday];

  if ChkQua.Checked then
    Result := Result + [twWednesday];

  if ChkQui.Checked then
    Result := Result + [twThursday];

  if ChkSex.Checked then
    Result := Result + [twFriday];

  if ChkSab.Checked then
    Result := Result + [twSaturday];

  if ChkDom.Checked then
    Result := Result + [twSunday];
end;

function TForm1.GetMonthly: TTpMonths;
const
  NONE_MONTH = [];
begin
  Result := NONE_MONTH;

  if ChkJan.Checked then
    Result := Result + [tmJanuary];

  if ChkFev.Checked then
    Result := Result + [tmFebruary];

  if ChkMar.Checked then
    Result := Result + [tmMarch];

  if ChkAbr.Checked then
    Result := Result + [tmApril];

  if ChkMaio.Checked then
    Result := Result + [tmMay];

  if ChkJun.Checked then
    Result := Result + [tmJune];

  if ChkJul.Checked then
    Result := Result + [tmJuly];

  if ChkAgo.Checked then
    Result := Result + [tmAugust];

  if ChkSet.Checked then
    Result := Result + [tmSeptember];

  if ChkOut.Checked then
    Result := Result + [tmOctober];

  if ChkNov.Checked then
    Result := Result + [tmNovember];

  if ChkDez.Checked then
    Result := Result + [tmDecember];
end;

end.
