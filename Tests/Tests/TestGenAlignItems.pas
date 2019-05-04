unit TestGenAlignItems;

// Generated from gentest/fixtures/YGAlignItemsTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenAlignItems = class
  public
    [Test] procedure AlignItemsStretch;
    [Test] procedure AlignItemsCenter;
    [Test] procedure AlignItemsFlexStart;
    [Test] procedure AlignItemsFlexEnd;
    [Test] procedure AlignBaseline;
    [Test] procedure AlignBaselineChild;
    [Test] procedure AlignBaselineChildMultiline;
    [Test] procedure AlignBaselineChildMultilineOverride;
    [Test] procedure AlignBaselineChildMultilineNoOverrideOnSecondline;
    [Test] procedure AlignBaselineChildTop;
    [Test] procedure AlignBaselineChildTop2;
    [Test] procedure AlignBaselineDoubleNestedChild;
    [Test] procedure AlignBaselineColumn;
    [Test] procedure AlignBaselineChildMargin;
    [Test] procedure AlignBaselineChildPadding;
    [Test] procedure AlignBaselineMultiline;
    [Test] procedure AlignBaselineMultilineColumn;
    [Test] procedure AlignBaselineMultilineColumn2;
    [Test] procedure AlignBaselineMultilineRowAndColumn;
    [Test] procedure AlignItemsCenterChildWithMarginBiggerThanParent;
    [Test] procedure AlignItemsFlexEndChildWithMarginBiggerThanParent;
    [Test] procedure AlignItemsCenterChildWithoutMarginBiggerThanParent;
    [Test] procedure AlignItemsFlexEndChildWithoutMarginBiggerThanParent;
    [Test] procedure AlignCenterShouldSizeBasedOnContent;
    [Test] procedure AlignStrechShouldSizeBasedOnParent;
    [Test] procedure AlignFlexStartWithShrinkingChildren;
    [Test] procedure AlignFlexStartWithStretchingChildren;
    [Test] procedure AlignFlexStartWithShrinkingChildrenWithStretch;
  end;

implementation

{ TTestGenAlignItems }

procedure TTestGenAlignItems.AlignItemsStretch;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsFlexStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexEnd;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaseline;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildMultiline;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild1Child1: TYogaNode;
  RootChild1Child2: TYogaNode;
  RootChild1Child3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexDirection := TYogaFlexDirection.Row;
  RootChild1.FlexWrap := TYogaWrap.Wrap;
  RootChild1.Width := 50;
  RootChild1.Height := 25;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 25;
  RootChild1Child0.Height := 20;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild1Child1 := TYogaNode.Create;
  RootChild1Child1.Width := 25;
  RootChild1Child1.Height := 10;
  RootChild1.Insert(1, RootChild1Child1);
  
  RootChild1Child2 := TYogaNode.Create;
  RootChild1Child2.Width := 25;
  RootChild1Child2.Height := 20;
  RootChild1.Insert(2, RootChild1Child2);
  
  RootChild1Child3 := TYogaNode.Create;
  RootChild1Child3.Width := 25;
  RootChild1Child3.Height := 10;
  RootChild1.Insert(3, RootChild1Child3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildMultilineOverride;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild1Child1: TYogaNode;
  RootChild1Child2: TYogaNode;
  RootChild1Child3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexDirection := TYogaFlexDirection.Row;
  RootChild1.FlexWrap := TYogaWrap.Wrap;
  RootChild1.Width := 50;
  RootChild1.Height := 25;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 25;
  RootChild1Child0.Height := 20;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild1Child1 := TYogaNode.Create;
  RootChild1Child1.AlignSelf := TYogaAlign.Baseline;
  RootChild1Child1.Width := 25;
  RootChild1Child1.Height := 10;
  RootChild1.Insert(1, RootChild1Child1);
  
  RootChild1Child2 := TYogaNode.Create;
  RootChild1Child2.Width := 25;
  RootChild1Child2.Height := 20;
  RootChild1.Insert(2, RootChild1Child2);
  
  RootChild1Child3 := TYogaNode.Create;
  RootChild1Child3.AlignSelf := TYogaAlign.Baseline;
  RootChild1Child3.Width := 25;
  RootChild1Child3.Height := 10;
  RootChild1.Insert(3, RootChild1Child3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildMultilineNoOverrideOnSecondline;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild1Child1: TYogaNode;
  RootChild1Child2: TYogaNode;
  RootChild1Child3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexDirection := TYogaFlexDirection.Row;
  RootChild1.FlexWrap := TYogaWrap.Wrap;
  RootChild1.Width := 50;
  RootChild1.Height := 25;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 25;
  RootChild1Child0.Height := 20;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild1Child1 := TYogaNode.Create;
  RootChild1Child1.Width := 25;
  RootChild1Child1.Height := 10;
  RootChild1.Insert(1, RootChild1Child1);
  
  RootChild1Child2 := TYogaNode.Create;
  RootChild1Child2.Width := 25;
  RootChild1Child2.Height := 20;
  RootChild1.Insert(2, RootChild1Child2);
  
  RootChild1Child3 := TYogaNode.Create;
  RootChild1Child3.AlignSelf := TYogaAlign.Baseline;
  RootChild1Child3.Width := 25;
  RootChild1Child3.Height := 10;
  RootChild1.Insert(3, RootChild1Child3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child3.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild1Child3.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1Child3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Top := 10;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildTop2;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Top := 5;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineDoubleNestedChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 50;
  RootChild0Child0.Height := 20;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 15;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(15, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(15, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := 5;
  RootChild0.MarginTop := 5;
  RootChild0.MarginRight := 5;
  RootChild0.MarginBottom := 5;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.MarginLeft := 1;
  RootChild1Child0.MarginTop := 1;
  RootChild1Child0.MarginRight := 1;
  RootChild1Child0.MarginBottom := 1;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(44, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(1, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(1, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(44, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(-1, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(1, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineChildPadding;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.PaddingLeft := 5;
  Root.PaddingTop := 5;
  Root.PaddingRight := 5;
  Root.PaddingBottom := 5;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.PaddingLeft := 5;
  RootChild1.PaddingTop := 5;
  RootChild1.PaddingRight := 5;
  RootChild1.PaddingBottom := 5;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(55, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(-5, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(-5, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineMultiline;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
  RootChild2Child0: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 20;
  Root.Insert(2, RootChild2);
  
  RootChild2Child0 := TYogaNode.Create;
  RootChild2Child0.Width := 50;
  RootChild2Child0.Height := 10;
  RootChild2.Insert(0, RootChild2Child0);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 50;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(60, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineMultilineColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
  RootChild2Child0: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 20;
  RootChild1Child0.Height := 20;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 40;
  RootChild2.Height := 70;
  Root.Insert(2, RootChild2);
  
  RootChild2Child0 := TYogaNode.Create;
  RootChild2Child0.Width := 10;
  RootChild2Child0.Height := 10;
  RootChild2.Insert(0, RootChild2Child0);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 20;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(70, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(70, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineMultilineColumn2;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
  RootChild2Child0: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 30;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 20;
  RootChild1Child0.Height := 20;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 40;
  RootChild2.Height := 70;
  Root.Insert(2, RootChild2);
  
  RootChild2Child0 := TYogaNode.Create;
  RootChild2Child0.Width := 10;
  RootChild2Child0.Height := 10;
  RootChild2.Insert(0, RootChild2Child0);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 20;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(70, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(30, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(70, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignBaselineMultilineRowAndColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
  RootChild2Child0: TYogaNode;
  RootChild3: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 20;
  Root.Insert(2, RootChild2);
  
  RootChild2Child0 := TYogaNode.Create;
  RootChild2Child0.Width := 50;
  RootChild2Child0.Height := 10;
  RootChild2.Insert(0, RootChild2Child0);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 20;
  Root.Insert(3, RootChild3);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsCenterChildWithMarginBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.Center;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.MarginLeft := 10;
  RootChild0Child0.MarginRight := 10;
  RootChild0Child0.Width := 52;
  RootChild0Child0.Height := 52;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsFlexEndChildWithMarginBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.FlexEnd;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.MarginLeft := 10;
  RootChild0Child0.MarginRight := 10;
  RootChild0Child0.Width := 52;
  RootChild0Child0.Height := 52;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(52, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsCenterChildWithoutMarginBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.Center;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 72;
  RootChild0Child0.Height := 72;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignItemsFlexEndChildWithoutMarginBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.FlexEnd;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 72;
  RootChild0Child0.Height := 72;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignCenterShouldSizeBasedOnContent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.MarginTop := 20;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.JustifyContent := TYogaJustify.Center;
  RootChild0.FlexShrink := 1;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 20;
  RootChild0Child0Child0.Height := 20;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignStrechShouldSizeBasedOnParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MarginTop := 20;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.JustifyContent := TYogaJustify.Center;
  RootChild0.FlexShrink := 1;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 20;
  RootChild0Child0Child0.Height := 20;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(20, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignFlexStartWithShrinkingChildren;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.FlexStart;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.FlexGrow := 1;
  RootChild0Child0Child0.FlexShrink := 1;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(500, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignFlexStartWithStretchingChildren;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.FlexGrow := 1;
  RootChild0Child0Child0.FlexShrink := 1;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignItems.AlignFlexStartWithShrinkingChildrenWithStretch;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.AlignItems := TYogaAlign.FlexStart;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.FlexGrow := 1;
  RootChild0Child0Child0.FlexShrink := 1;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(500, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(500, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenAlignItems);

end.
