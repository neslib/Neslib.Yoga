unit TestMeasureMode;

interface

uses
  System.Types,
  System.Generics.Collections,
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestMeasureMode = class
  private type
    TMeasureConstraint = record
      Width: Single;
      WidthMode: TYogaMeasureMode;
      Height: Single;
      HeightMode: TYogaMeasureMode;
    end;
    TMeasureConstraintList = TList<TMeasureConstraint>;
  private
    FConstraintList: TMeasureConstraintList;
  private
    function DoMeasure(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
  public
    [Test] procedure ExactlyMeasureStretchedChildColumn;
    [Test] procedure ExactlyMeasureStretchedChildRow;
    [Test] procedure AtMostMainAxisColumn;
    [Test] procedure AtMostCrossAxisColumn;
    [Test] procedure AtMostMainAxisRow;
    [Test] procedure AtMostCrossAxisRow;
    [Test] procedure FlexChild;
    [Test] procedure FlexChildWithFlexBasis;
    [Test] procedure OverflowScrollColumn;
    [Test] procedure OverflowScrollRow;
  end;

implementation

{ TTestMeasureMode }

procedure TTestMeasureMode.AtMostCrossAxisColumn;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Width);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].WidthMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.AtMostCrossAxisRow;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.AtMostMainAxisColumn;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.AtMostMainAxisRow;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Width);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].WidthMode);

  Root.Free;
  FConstraintList.Free;
end;

function TTestMeasureMode.DoMeasure(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
var
  Constraint: TMeasureConstraint;
begin
  Constraint.Width := AWidth;
  Constraint.WidthMode := AWidthMode;
  Constraint.Height := AHeight;
  Constraint.HeightMode := AHeightMode;
  FConstraintList.Add(Constraint);

  if (AWidthMode = TYogaMeasureMode.Undefined) then
    Result.Width := 10
  else
    Result.Width := AWidth;

  if (AHeightMode = TYogaMeasureMode.Undefined) then
    Result.Height := 10
  else
    Result.Height := AWidth;
end;

procedure TTestMeasureMode.ExactlyMeasureStretchedChildColumn;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Width);
  Assert.AreEqual(TYogaMeasureMode.Exactly, FConstraintList[0].WidthMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.ExactlyMeasureStretchedChildRow;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);
  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.Exactly, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.FlexChild;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(2, FConstraintList.Count);

  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].HeightMode);

  Assert.AreEqual<Single>(100, FConstraintList[1].Height);
  Assert.AreEqual(TYogaMeasureMode.Exactly, FConstraintList[1].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.FlexChildWithFlexBasis;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 0;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);

  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.Exactly, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.OverflowScrollColumn;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Overflow := TYogaOverflow.Scroll;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);

  Assert.AreEqual<Single>(100, FConstraintList[0].Width);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].WidthMode);

  Assert.IsTrue(YogaIsUndefined(FConstraintList[0].Height));
  Assert.AreEqual(TYogaMeasureMode.Undefined, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

procedure TTestMeasureMode.OverflowScrollRow;
var
  Root, RootChild0: TYogaNode;
begin
  FConstraintList := TMeasureConstraintList.Create;
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Overflow := TYogaOverflow.Scroll;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FConstraintList.Count);

  Assert.IsTrue(YogaIsUndefined(FConstraintList[0].Width));
  Assert.AreEqual(TYogaMeasureMode.Undefined, FConstraintList[0].WidthMode);

  Assert.AreEqual<Single>(100, FConstraintList[0].Height);
  Assert.AreEqual(TYogaMeasureMode.AtMost, FConstraintList[0].HeightMode);

  Root.Free;
  FConstraintList.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestMeasureMode);

end.
