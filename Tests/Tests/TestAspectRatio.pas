unit TestAspectRatio;

interface

uses
  System.Types,
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestAspectRatio = class
  private
    function DoMeasure(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
  public
    [Test] procedure AspectRatioCrossDefined;
    [Test] procedure AspectRatioMainDefined;
    [Test] procedure AspectRatioBothDimensionsDefinedRow;
    [Test] procedure AspectRatioBothDimensionsDefinedColumn;
    [Test] procedure AspectRatioAlignStretch;
    [Test] procedure AspectRatioFlexGrow;
    [Test] procedure AspectRatioFlexShrink;
    [Test] procedure AspectRatioFlexShrink2;
    [Test] procedure AspectRatioBasis;
    [Test] procedure AspectRatioAbsoluteLayoutWidthDefined;
    [Test] procedure AspectRatioAbsoluteLayoutHeightDefined;
    [Test] procedure AspectRatioWithMaxCrossDefined;
    [Test] procedure AspectRatioWithMaxMainDefined;
    [Test] procedure AspectRatioWithMinCrossDefined;
    [Test] procedure AspectRatioWithMinMainDefined;
    [Test] procedure AspectRatioDoubleCross;
    [Test] procedure AspectRatioHalfCross;
    [Test] procedure AspectRatioDoubleMain;
    [Test] procedure AspectRatioHalfMain;
    [Test] procedure AspectRatioWithMeasureFunc;
    [Test] procedure AspectRatioWithHeightFlexGrowRow;
    [Test] procedure AspectRatioWithHeightFlexGrowColumn;
    [Test] procedure AspectRatioHeightAsFlexBasis;
    [Test] procedure AspectRatioWidthAsFlexBasis;
    [Test] procedure AspectRatioOverridesFlexGrowRow;
    [Test] procedure AspectRatioOverridesFlexGrowColumn;
    [Test] procedure AspectRatioLeftRightAbsolute;
    [Test] procedure AspectRatioTopBottomAbsolute;
    [Test] procedure AspectRatioWidthOverridesAlignStretchRow;
    [Test] procedure AspectRatioWidthOverridesAlignStretchColumn;
    [Test] procedure AspectRatioAllowChildOverflowParentSize;
    [Test] procedure AspectRatioDefinedMainWithMargin;
    [Test] procedure AspectRatioDefinedCrossWithMargin;
    [Test] procedure AspectRatioDefinedCrossWithMainMargin;
    [Test] procedure AspectRatioShouldPreferExplicitHeight;
    [Test] procedure AspectRatioShouldPreferExplicitWidth;
    [Test] procedure AspectRatioShouldPreferFlexedDimensions;
  end;

implementation

{ TTestAspectRatio }

procedure TTestAspectRatio.AspectRatioAbsoluteLayoutHeightDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := 0;
  RootChild0.Top := 0;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioAbsoluteLayoutWidthDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := 0;
  RootChild0.Top := 0;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioAlignStretch;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioAllowChildOverflowParentSize;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 4;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);

  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioBasis;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexBasis := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioBothDimensionsDefinedColumn;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioBothDimensionsDefinedRow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioCrossDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioDefinedCrossWithMainMargin;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 1;
  RootChild0.MarginTop := 10;
  RootChild0.MarginBottom := 10;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioDefinedCrossWithMargin;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 1;
  RootChild0.MarginLeft := 10;
  RootChild0.MarginRight := 10;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioDefinedMainWithMargin;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  RootChild0.MarginLeft := 10;
  RootChild0.MarginRight := 10;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioDoubleCross;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 2;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioDoubleMain;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 0.5;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioFlexGrow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioFlexShrink;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 150;
  RootChild0.FlexShrink := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioFlexShrink2;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := TYogaValue.Percent(100);
  RootChild0.FlexShrink := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Height := TYogaValue.Percent(100);
  RootChild1.FlexShrink := 1;
  RootChild1.AspectRatio := 1;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioHalfCross;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 100;
  RootChild0.AspectRatio := 0.5;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioHalfMain;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.AspectRatio := 2;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioHeightAsFlexBasis;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 100;
  RootChild1.FlexGrow := 1;
  RootChild1.AspectRatio := 1;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(75, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(125, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(125, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioLeftRightAbsolute;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := 10;
  RootChild0.Top := 10;
  RootChild0.Right := 10;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioMainDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioOverridesFlexGrowColumn;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 2;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioOverridesFlexGrowRow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 0.5;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioShouldPreferExplicitHeight;
var
  Root, RootChild0, RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.AlignContent := TYogaAlign.Stretch;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Column;
  Root.Add(RootChild0);

  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexDirection := TYogaFlexDirection.Column;
  RootChild0Child0.Height := 100;
  RootChild0Child0.AspectRatio := 2;
  RootChild0.Add(RootChild0Child0);

  Root.CalculateLayout(100, 200, TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);

  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioShouldPreferExplicitWidth;
var
  Root, RootChild0, RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Stretch;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  Root.Add(RootChild0);

  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0.Width := 100;
  RootChild0Child0.AspectRatio := 0.5;
  RootChild0.Add(RootChild0Child0);

  Root.CalculateLayout(200, 100, TYogaDirection.LTR);

  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioShouldPreferFlexedDimensions;
var
  Root, RootChild0, RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Column;
  RootChild0.AspectRatio := 2;
  RootChild0.FlexGrow := 1;
  Root.Add(RootChild0);

  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.AspectRatio := 4;
  RootChild0Child0.FlexGrow := 1;
  RootChild0.Add(RootChild0Child0);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);

  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(400, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioTopBottomAbsolute;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := 10;
  RootChild0.Top := 10;
  RootChild0.Bottom := 10;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWidthAsFlexBasis;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 200;
  Root.Height := 200;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 100;
  RootChild1.FlexGrow := 1;
  RootChild1.AspectRatio := 1;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(75, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(125, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(125, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWidthOverridesAlignStretchColumn;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWidthOverridesAlignStretchRow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithHeightFlexGrowColumn;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 200;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithHeightFlexGrowRow;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 200;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  RootChild0.FlexGrow := 1;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithMaxCrossDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  RootChild0.MaxWidth := 40;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithMaxMainDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.MaxHeight := 40;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithMeasureFunc;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.OnMeasure := DoMeasure;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithMinCrossDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 30;
  RootChild0.MinWidth := 40;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestAspectRatio.AspectRatioWithMinMainDefined;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.MinHeight := 40;
  RootChild0.AspectRatio := 1;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

function TTestAspectRatio.DoMeasure(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  if (AWidthMode = TYogaMeasureMode.Exactly) then
    Result.Width := AWidth
  else
    Result.Width := 50;

  if (AHeightMode = TYogaMeasureMode.Exactly) then
    Result.Height := AHeight
  else
    Result.Height := 50;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestAspectRatio);

end.
