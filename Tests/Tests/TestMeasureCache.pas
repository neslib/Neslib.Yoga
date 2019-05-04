unit TestMeasureCache;

interface

uses
  System.Types,
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestMeasureCache = class
  private
    FMeasureCount: Integer;
  private
    function DoMeasureMax(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoMeasureMin(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoMeasure84_49(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
  public
    [Test] procedure MeasureOnceSingleFlexibleChild;
    [Test] procedure MeasureWithSameExactWidthLargerThanNeededHeight;
    [Test] procedure MeasureWithSameAtMostWidthLargerThanNeededHeight;
    [Test] procedure MeasureWithComputedWidthLargerThanNeededHeight;
    [Test] procedure MeasureWithAtMostComputedWidthUndefinedHeight;
    [Test] procedure RemeasureWithAlreadyMeasuredValueSmallerButStillFloatEqual;
  end;

implementation

{ TTestMeasureCache }

function TTestMeasureCache.DoMeasure84_49(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Inc(FMeasureCount);
  Result := TSizeF.Create(84, 49);
end;

function TTestMeasureCache.DoMeasureMax(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Inc(FMeasureCount);

  if (AWidthMode = TYogaMeasureMode.Undefined) then
    Result.Width := 10
  else
    Result.Width := AWidth;

  if (AHeightMode = TYogaMeasureMode.Undefined) then
    Result.Height := 10
  else
    Result.Height := AHeight;
end;

function TTestMeasureCache.DoMeasureMin(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Inc(FMeasureCount);

  if (AWidthMode = TYogaMeasureMode.Undefined)
    or ((AWidthMode = TYogaMeasureMode.AtMost) and (AWidth > 10))
  then
    Result.Width := 10
  else
    Result.Width := AWidth;

  if (AHeightMode = TYogaMeasureMode.Undefined)
    or ((AHeightMode = TYogaMeasureMode.AtMost) and (AHeight > 10))
  then
    Result.Height := 10
  else
    Result.Height := AHeight;
end;

procedure TTestMeasureCache.MeasureOnceSingleFlexibleChild;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;
  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureMax;
  RootChild0.FlexGrow := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasureCache.MeasureWithAtMostComputedWidthUndefinedHeight;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;

  FMeasureCount := 0;
  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureMin;
  Root.Add(RootChild0);

  Root.CalculateLayout(100, YOGA_UNDEFINED, TYogaDirection.LTR);
  Root.CalculateLayout(10, YOGA_UNDEFINED, TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasureCache.MeasureWithComputedWidthLargerThanNeededHeight;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;

  FMeasureCount := 0;
  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureMin;
  Root.Add(RootChild0);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);
  Root.AlignItems := TYogaAlign.Stretch;
  Root.CalculateLayout(10, 50, TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasureCache.MeasureWithSameAtMostWidthLargerThanNeededHeight;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;

  FMeasureCount := 0;
  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureMin;
  Root.Add(RootChild0);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);
  Root.CalculateLayout(100, 50, TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasureCache.MeasureWithSameExactWidthLargerThanNeededHeight;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;

  FMeasureCount := 0;
  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureMin;
  Root.Add(RootChild0);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);
  Root.CalculateLayout(100, 50, TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasureCache.RemeasureWithAlreadyMeasuredValueSmallerButStillFloatEqual;
var
  Root, RootChild0, RootChild0Child0: TYogaNode;
begin
  FMeasureCount := 0;

  Root := TYogaNode.Create;
  Root.Width := 288;
  Root.Height := 288;
  Root.FlexDirection := TYogaFlexDirection.Row;

  RootChild0 := TYogaNode.Create;
  RootChild0.Padding := 2.88;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  Root.Add(RootChild0);

  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.OnMeasure := DoMeasure84_49;
  RootChild0.Add(RootChild0Child0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestMeasureCache);

end.
