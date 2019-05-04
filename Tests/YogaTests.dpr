program YogaTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  TestNodeChild in 'Tests\TestNodeChild.pas',
  TestAlignBaseline in 'Tests\TestAlignBaseline.pas',
  TestAspectRatio in 'Tests\TestAspectRatio.pas',
  TestBaselineFunc in 'Tests\TestBaselineFunc.pas',
  TestComputedMargin in 'Tests\TestComputedMargin.pas',
  TestComputedPadding in 'Tests\TestComputedPadding.pas',
  TestDefaultValues in 'Tests\TestDefaultValues.pas',
  TestDirtyMarking in 'Tests\TestDirtyMarking.pas',
  TestEdge in 'Tests\TestEdge.pas',
  TestHadOverflow in 'Tests\TestHadOverflow.pas',
  TestInfiniteHeight in 'Tests\TestInfiniteHeight.pas',
  TestMeasureCache in 'Tests\TestMeasureCache.pas',
  TestMeasureMode in 'Tests\TestMeasureMode.pas',
  TestMeasure in 'Tests\TestMeasure.pas',
  TestRelayout in 'Tests\TestRelayout.pas',
  TestStyle in 'Tests\TestStyle.pas',
  TestZeroOutLayoutRecursively in 'Tests\TestZeroOutLayoutRecursively.pas',
  TestGenAbsolutePosition in 'Tests\TestGenAbsolutePosition.pas',
  TestGenAlignContent in 'Tests\TestGenAlignContent.pas',
  TestGenAlignItems in 'Tests\TestGenAlignItems.pas',
  TestGenAlignSelf in 'Tests\TestGenAlignSelf.pas',
  TestGenAndroidNewsFeed in 'Tests\TestGenAndroidNewsFeed.pas',
  TestGenDimension in 'Tests\TestGenDimension.pas',
  TestGenDisplay in 'Tests\TestGenDisplay.pas',
  TestGenFlex in 'Tests\TestGenFlex.pas',
  TestGenFlexDirection in 'Tests\TestGenFlexDirection.pas',
  TestGenFlexWrap in 'Tests\TestGenFlexWrap.pas',
  TestGenJustifyContent in 'Tests\TestGenJustifyContent.pas',
  TestGenMargin in 'Tests\TestGenMargin.pas',
  TestGenMinMaxDimension in 'Tests\TestGenMinMaxDimension.pas',
  TestGenPadding in 'Tests\TestGenPadding.pas',
  TestGenPercentage in 'Tests\TestGenPercentage.pas',
  TestGenRounding in 'Tests\TestGenRounding.pas',
  TestGenSizeOverflow in 'Tests\TestGenSizeOverflow.pas',
  Neslib.Yoga in '..\Neslib.Yoga.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
