program YogaPlayground;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMain in 'FMain.pas' {FormMain},
  UPropInfo in 'UPropInfo.pas',
  UTile in 'UTile.pas',
  Neslib.Yoga in '..\Neslib.Yoga.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
