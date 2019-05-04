unit TestMeasure;

interface

uses
  System.Types,
  System.SysUtils,
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestMeasure = class
  private
    FMeasureCount: Integer;
  private
    function DoMeasure(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoSimulateWrappingText(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoMeasureAssertNegative(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoMeasure90_10(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
  public
    [Test] procedure DontMeasureSingleGrowShrinkChild;
    [Test] procedure MeasureAbsoluteChildWithNoConstraints;
    [Test] procedure DontMeasureWhenMinEqualsMax;
    [Test] procedure DontMeasureWhenMinEqualsMaxPercentages;
    [Test] procedure MeasureNodesWithMarginAutoAndStretch;
    [Test] procedure DontMeasureWhenMinEqualsMaxMixedWidthPercent;
    [Test] procedure DontMeasureWhenMinEqualsMaxMixedHeightPercent;
    [Test] procedure MeasureEnoughSizeShouldBeInSingleLine;
    [Test] procedure MeasureNotEnoughSizeShouldWrap;
    [Test] procedure MeasureZeroSpaceShouldGrow;
    [Test] procedure MeasureFlexDirectionRowAndPadding;
    [Test] procedure MeasureFlexDirectionColumnAndPadding;
    [Test] procedure MeasureFlexDirectionRowNoPadding;
    [Test] procedure MeasureFlexDirectionRowNoPaddingAlignItemsFlexStart;
    [Test] procedure MeasureWithFixedSize;
    [Test] procedure MeasureWithFlexShrink;
    [Test] procedure MeasureNoPadding;
    [Test] procedure CannotAddChildToNodeWithMeasureFunc;
    [Test] procedure CannotAddNonNullMeasureFuncToNonLeafNode;
    [Test] procedure CanNullifyMeasureFuncOnAnyNode;
    [Test] procedure CantCallNegativeMeasure;
    [Test] procedure CantCallNegativeMeasureHorizontal;
    [Test] procedure PercentWithTextNode;
  end;

implementation

{ TTestMeasure }

procedure TTestMeasure.CannotAddChildToNodeWithMeasureFunc;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.OnMeasure := DoMeasure;

  RootChild0 := TYogaNode.Create;

  Assert.WillRaise(
    procedure
    begin
      Root.Add(RootChild0);
    end, EAssertionFailed);

  RootChild0.Free;
  Root.Free;
end;

procedure TTestMeasure.CannotAddNonNullMeasureFuncToNonLeafNode;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  RootChild0 := TYogaNode.Create;
  Root.Add(RootChild0);

  Assert.WillRaise(
    procedure
    begin
      Root.OnMeasure := DoMeasure;
    end, EAssertionFailed);

  Root.Free;
end;

procedure TTestMeasure.CanNullifyMeasureFuncOnAnyNode;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Add(TYogaNode.Create);
  Root.OnMeasure := nil;
  Assert.IsFalse(Assigned(Root.OnMeasure));
  Root.Free;
end;

procedure TTestMeasure.CantCallNegativeMeasure;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureAssertNegative;
  RootChild0.MarginTop := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Root.Free;
end;

procedure TTestMeasure.CantCallNegativeMeasureHorizontal;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 10;
  Root.Height := 20;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasureAssertNegative;
  RootChild0.MarginStart := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Root.Free;
end;

function TTestMeasure.DoMeasure(const ANode: TYogaNode; const AWidth: Single;
  const AWidthMode: TYogaMeasureMode; const AHeight: Single;
  const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Inc(FMeasureCount);
  Result := TSizeF.Create(10, 10);
end;

function TTestMeasure.DoMeasure90_10(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Result := TSizeF.Create(90, 10);
end;

function TTestMeasure.DoMeasureAssertNegative(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Assert.IsTrue(AWidth >= 0);
  Assert.IsTrue(AHeight >= 0);
  Result := TSizeF.Create(0, 0);
end;

procedure TTestMeasure.DontMeasureSingleGrowShrinkChild;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(0, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasure.DontMeasureWhenMinEqualsMax;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.MinWidth := 10;
  RootChild0.MaxWidth := 10;
  RootChild0.MinHeight := 10;
  RootChild0.MaxHeight := 10;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(0, FMeasureCount);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.DontMeasureWhenMinEqualsMaxMixedHeightPercent;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.MinWidth := 10;
  RootChild0.MaxWidth := 10;
  RootChild0.MinHeight := TYogaValue.Percent(10);
  RootChild0.MaxHeight := TYogaValue.Percent(10);
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(0, FMeasureCount);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.DontMeasureWhenMinEqualsMaxMixedWidthPercent;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.MinWidth := TYogaValue.Percent(10);
  RootChild0.MaxWidth := TYogaValue.Percent(10);
  RootChild0.MinHeight := 10;
  RootChild0.MaxHeight := 10;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(0, FMeasureCount);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.DontMeasureWhenMinEqualsMaxPercentages;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.MinWidth := TYogaValue.Percent(10);
  RootChild0.MaxWidth := TYogaValue.Percent(10);
  RootChild0.MinHeight := TYogaValue.Percent(10);
  RootChild0.MaxHeight := TYogaValue.Percent(10);
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(0, FMeasureCount);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

function TTestMeasure.DoSimulateWrappingText(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  if (AWidthMode = TYogaMeasureMode.Undefined) or (AWidth >= 68) then
    Result := TSizeF.Create(68, 16)
  else
    Result := TSizeF.Create(50, 32);
end;

procedure TTestMeasure.MeasureAbsoluteChildWithNoConstraints;
var
  Root, RootChild0, RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;

  FMeasureCount := 0;

  RootChild0 := TYogaNode.Create;
  Root.Add(RootChild0);

  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.PositionType := TYogaPositionType.Absolute;
  RootChild0Child0.OnMeasure := DoMeasure;
  RootChild0.Add(RootChild0Child0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual(1, FMeasureCount);

  Root.Free;
end;

procedure TTestMeasure.MeasureEnoughSizeShouldBeInSingleLine;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.AlignSelf := TYogaAlign.FlexStart;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(68, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(16, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureFlexDirectionColumnAndPadding;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MarginTop := 20;
  Root.Padding := 25;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(32, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(57, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureFlexDirectionRowAndPadding;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.PaddingLeft := 25;
  Root.PaddingTop := 25;
  Root.PaddingRight := 25;
  Root.PaddingBottom := 25;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureFlexDirectionRowNoPadding;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.MarginTop := 20;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureFlexDirectionRowNoPaddingAlignItemsFlexStart;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.MarginTop := 20;
  Root.Width := 50;
  Root.Height := 50;
  Root.AlignItems := TYogaAlign.FlexStart;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(32, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureNodesWithMarginAutoAndStretch;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;

  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(490, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureNoPadding;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MarginTop := 20;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  RootChild0.FlexShrink := 1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(32, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(32, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureNotEnoughSizeShouldWrap;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 55;

  RootChild0 := TYogaNode.Create;
  RootChild0.AlignSelf := TYogaAlign.FlexStart;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(32, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureWithFixedSize;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MarginTop := 20;
  Root.Padding := 25;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(35, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureWithFlexShrink;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MarginTop := 20;
  Root.Padding := 25;
  Root.Width := 50;
  Root.Height := 50;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoSimulateWrappingText;
  RootChild0.FlexShrink := 1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 5;
  RootChild1.Height := 5;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(25, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(5, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(5, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestMeasure.MeasureZeroSpaceShouldGrow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Height := 200;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.FlexGrow := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Column;
  RootChild0.Padding := 100;
  RootChild0.OnMeasure := DoMeasure;
  Root.Add(RootChild0);

  Root.CalculateLayout(282, YOGA_UNDEFINED, TYogaDirection.LTR);

  Assert.AreEqual<Single>(282, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);

  Root.Free;
end;

procedure TTestMeasure.PercentWithTextNode;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.SpaceBetween;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 100;
  Root.Height := 80;

  RootChild0 := TYogaNode.Create;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.OnMeasure := DoMeasure90_10;
  RootChild1.MaxWidth := TYogaValue.Percent(50);
  RootChild1.PaddingTop := TYogaValue.Percent(50);
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestMeasure);

end.
