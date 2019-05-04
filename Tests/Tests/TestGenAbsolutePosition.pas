unit TestGenAbsolutePosition;

// Generated from gentest/fixtures/YGAbsolutePositionTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenAbsolutePosition = class
  public
    [Test] procedure AbsoluteLayoutWidthHeightStartTop;
    [Test] procedure AbsoluteLayoutWidthHeightEndBottom;
    [Test] procedure AbsoluteLayoutStartTopEndBottom;
    [Test] procedure AbsoluteLayoutWidthHeightStartTopEndBottom;
    [Test] procedure DoNotClampHeightOfAbsoluteNodeToHeightOfItsOverflowHiddenParent;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentCenter;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentFlexEnd;
    [Test] procedure AbsoluteLayoutJustifyContentCenter;
    [Test] procedure AbsoluteLayoutAlignItemsCenter;
    [Test] procedure AbsoluteLayoutAlignItemsCenterOnChildOnly;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentCenterAndTopPosition;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentCenterAndBottomPosition;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentCenterAndLeftPosition;
    [Test] procedure AbsoluteLayoutAlignItemsAndJustifyContentCenterAndRightPosition;
    [Test] procedure PositionRootWithRtlShouldPositionWithoutdirection;
    [Test] procedure AbsoluteLayoutPercentageBottomBasedOnParentHeight;
    [Test] procedure AbsoluteLayoutInWrapReverseColumnContainer;
    [Test] procedure AbsoluteLayoutInWrapReverseRowContainer;
    [Test] procedure AbsoluteLayoutInWrapReverseColumnContainerFlexEnd;
    [Test] procedure AbsoluteLayoutInWrapReverseRowContainerFlexEnd;
  end;

implementation

{ TTestGenAbsolutePosition }

procedure TTestGenAbsolutePosition.AbsoluteLayoutWidthHeightStartTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Start := 10;
  RootChild0.Top := 10;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutWidthHeightEndBottom;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Stop := 10;
  RootChild0.Bottom := 10;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutStartTopEndBottom;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Start := 10;
  RootChild0.Top := 10;
  RootChild0.Stop := 10;
  RootChild0.Bottom := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutWidthHeightStartTopEndBottom;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Start := 10;
  RootChild0.Top := 10;
  RootChild0.Stop := 10;
  RootChild0.Bottom := 10;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.DoNotClampHeightOfAbsoluteNodeToHeightOfItsOverflowHiddenParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Overflow := TYogaOverflow.Hidden;
  Root.Width := 50;
  Root.Height := 50;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Start := 0;
  RootChild0.Top := 0;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 100;
  RootChild0Child0.Height := 100;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(-50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.AlignItems := TYogaAlign.FlexEnd;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutJustifyContentCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsCenterOnChildOnly;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignSelf := TYogaAlign.Center;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentCenterAndTopPosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Top := 10;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentCenterAndBottomPosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Bottom := 10;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentCenterAndLeftPosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := 5;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutAlignItemsAndJustifyContentCenterAndRightPosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexGrow := 1;
  Root.Width := 110;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Right := 5;
  RootChild0.Width := 60;
  RootChild0.Height := 40;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(110, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.PositionRootWithRtlShouldPositionWithoutdirection;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Left := 72;
  Root.Width := 52;
  Root.Height := 52;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(72, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(72, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutPercentageBottomBasedOnParentHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Top := TYogaValue.Percent(50);
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.PositionType := TYogaPositionType.Absolute;
  RootChild1.Bottom := TYogaValue.Percent(50);
  RootChild1.Width := 10;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.PositionType := TYogaPositionType.Absolute;
  RootChild2.Top := TYogaValue.Percent(10);
  RootChild2.Bottom := TYogaValue.Percent(10);
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutInWrapReverseColumnContainer;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutInWrapReverseRowContainer;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutInWrapReverseColumnContainerFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignSelf := TYogaAlign.FlexEnd;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAbsolutePosition.AbsoluteLayoutInWrapReverseRowContainerFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignSelf := TYogaAlign.FlexEnd;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenAbsolutePosition);

end.
