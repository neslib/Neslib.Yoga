unit TestGenFlexWrap;

// Generated from gentest/fixtures/YGFlexWrapTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenFlexWrap = class
  public
    [Test] procedure WrapColumn;
    [Test] procedure WrapRow;
    [Test] procedure WrapRowAlignItemsFlexEnd;
    [Test] procedure WrapRowAlignItemsCenter;
    [Test] procedure FlexWrapChildrenWithMinMainOverridingFlexBasis;
    [Test] procedure FlexWrapWrapToChildHeight;
    [Test] procedure FlexWrapAlignStretchFitsOneRow;
    [Test] procedure WrapReverseRowAlignContentFlexStart;
    [Test] procedure WrapReverseRowAlignContentCenter;
    [Test] procedure WrapReverseRowSingleLineDifferentSize;
    [Test] procedure WrapReverseRowAlignContentStretch;
    [Test] procedure WrapReverseRowAlignContentSpaceAround;
    [Test] procedure WrapReverseColumnFixedSize;
    [Test] procedure WrappedRowWithinAlignItemsCenter;
    [Test] procedure WrappedRowWithinAlignItemsFlexStart;
    [Test] procedure WrappedRowWithinAlignItemsFlexEnd;
    [Test] procedure WrappedColumnMaxHeight;
    [Test] procedure WrappedColumnMaxHeightFlex;
    [Test] procedure WrapNodesWithContentSizingOverflowingMargin;
    [Test] procedure WrapNodesWithContentSizingMarginCross;
  end;

implementation

{ TTestGenFlexWrap }

procedure TTestGenFlexWrap.WrapColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 30;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 30;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 30;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(60, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(60, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 30;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 30;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 30;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapRowAlignItemsFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexEnd;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 30;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapRowAlignItemsCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 30;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(60, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.FlexWrapChildrenWithMinMainOverridingFlexBasis;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexBasis := 50;
  RootChild0.MinWidth := 55;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexBasis := 50;
  RootChild1.MinWidth := 55;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(55, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(55, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(55, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(55, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.FlexWrapWrapToChildHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.AlignItems := TYogaAlign.FlexStart;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 100;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 100;
  RootChild0Child0Child0.Height := 100;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 100;
  RootChild1.Height := 100;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.FlexWrapAlignStretchFitsOneRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseRowAlignContentFlexStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseRowAlignContentCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Center;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseRowSingleLineDifferentSize;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 300;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(300, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(300, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(270, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(240, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(210, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(180, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseRowAlignContentStretch;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseRowAlignContentSpaceAround;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.SpaceAround;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapReverseColumnFixedSize;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexWrap := TYogaWrap.WrapReverse;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 30;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 30;
  RootChild2.Height := 30;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 30;
  RootChild3.Height := 40;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 30;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(170, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(170, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(170, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(170, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(140, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrappedRowWithinAlignItemsCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 150;
  RootChild0Child0.Height := 80;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Width := 80;
  RootChild0Child1.Height := 80;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrappedRowWithinAlignItemsFlexStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 150;
  RootChild0Child0.Height := 80;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Width := 80;
  RootChild0Child1.Height := 80;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrappedRowWithinAlignItemsFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexEnd;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 150;
  RootChild0Child0.Height := 80;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Width := 80;
  RootChild0Child1.Height := 80;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(160, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrappedColumnMaxHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignContent := TYogaAlign.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 700;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.Height := 500;
  RootChild0.MaxHeight := 200;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.MarginLeft := 20;
  RootChild1.MarginTop := 20;
  RootChild1.MarginRight := 20;
  RootChild1.MarginBottom := 20;
  RootChild1.Width := 200;
  RootChild1.Height := 200;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 100;
  RootChild2.Height := 100;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(700, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(250, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(200, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(250, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(420, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(700, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(350, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(300, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(250, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(180, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrappedColumnMaxHeightFlex;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignContent := TYogaAlign.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 700;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.Width := 100;
  RootChild0.Height := 500;
  RootChild0.MaxHeight := 200;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexShrink := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.MarginLeft := 20;
  RootChild1.MarginTop := 20;
  RootChild1.MarginRight := 20;
  RootChild1.MarginBottom := 20;
  RootChild1.Width := 200;
  RootChild1.Height := 200;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 100;
  RootChild2.Height := 100;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(700, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(300, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(180, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(250, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(180, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(300, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(400, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(700, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(300, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(180, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(250, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(180, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(300, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(400, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapNodesWithContentSizingOverflowingMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
  RootChild0Child1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  RootChild0.Width := 85;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 40;
  RootChild0Child0Child0.Height := 40;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.MarginRight := 10;
  RootChild0.Insert(1, RootChild0Child1);
  
  RootChild0Child1Child0 := TYogaNode.Create;
  RootChild0Child1Child0.Width := 40;
  RootChild0Child1Child0.Height := 40;
  RootChild0Child1.Insert(0, RootChild0Child1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(85, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(415, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(85, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(35, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexWrap.WrapNodesWithContentSizingMarginCross;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
  RootChild0Child1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.FlexWrap := TYogaWrap.Wrap;
  RootChild0.Width := 70;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 40;
  RootChild0Child0Child0.Height := 40;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.MarginTop := 10;
  RootChild0.Insert(1, RootChild0Child1);
  
  RootChild0Child1Child0 := TYogaNode.Create;
  RootChild0Child1Child0.Width := 40;
  RootChild0Child1Child0.Height := 40;
  RootChild0Child1.Insert(0, RootChild0Child1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(70, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(430, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(70, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0Child1Child0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenFlexWrap);

end.
