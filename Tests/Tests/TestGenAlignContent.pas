unit TestGenAlignContent;

// Generated from gentest/fixtures/YGAlignContentTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenAlignContent = class
  public
    [Test] procedure AlignContentFlexStart;
    [Test] procedure AlignContentFlexStartWithoutHeightOnChildren;
    [Test] procedure AlignContentFlexStartWithFlex;
    [Test] procedure AlignContentFlexEnd;
    [Test] procedure AlignContentStretch;
    [Test] procedure AlignContentSpacebetween;
    [Test] procedure AlignContentSpacearound;
    [Test] procedure AlignContentStretchRow;
    [Test] procedure AlignContentStretchRowWithChildren;
    [Test] procedure AlignContentStretchRowWithFlex;
    [Test] procedure AlignContentStretchRowWithFlexNoShrink;
    [Test] procedure AlignContentStretchRowWithMargin;
    [Test] procedure AlignContentStretchRowWithPadding;
    [Test] procedure AlignContentStretchRowWithSingleRow;
    [Test] procedure AlignContentStretchRowWithFixedHeight;
    [Test] procedure AlignContentStretchRowWithMaxHeight;
    [Test] procedure AlignContentStretchRowWithMinHeight;
    [Test] procedure AlignContentStretchColumn;
    [Test] procedure AlignContentStretchIsNotOverridingAlignItems;
  end;

implementation

{ TTestGenAlignContent }

procedure TTestGenAlignContent.AlignContentFlexStart;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 130;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 10;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  RootChild4.Height := 10;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(130, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(130, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentFlexStartWithoutHeightOnChildren;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 10;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentFlexStartWithFlex;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 120;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.FlexGrow := 1;
  RootChild3.FlexShrink := 1;
  RootChild3.FlexBasis := TYogaValue.Percent(0);
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(120, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(120, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(120, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(120, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignContent := TYogaAlign.FlexEnd;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 10;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  RootChild4.Height := 10;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretch;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentSpacebetween;
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
  Root.AlignContent := TYogaAlign.SpaceBetween;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 130;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 10;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  RootChild4.Height := 10;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(130, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(130, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentSpacearound;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 140;
  Root.Height := 120;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  RootChild3.Height := 10;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  RootChild4.Height := 10;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(140, Root.LayoutWidth);
  Assert.AreEqual<Single>(120, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(95, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(140, Root.LayoutWidth);
  Assert.AreEqual<Single>(120, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(95, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRow;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithChildren;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0Child0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithFlex;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexShrink := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.FlexGrow := 1;
  RootChild3.FlexShrink := 1;
  RootChild3.FlexBasis := TYogaValue.Percent(0);
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);
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
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithFlexNoShrink;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexShrink := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.FlexGrow := 1;
  RootChild3.FlexBasis := TYogaValue.Percent(0);
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);
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
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithMargin;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.MarginLeft := 10;
  RootChild1.MarginTop := 10;
  RootChild1.MarginRight := 10;
  RootChild1.MarginBottom := 10;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.MarginLeft := 10;
  RootChild3.MarginTop := 10;
  RootChild3.MarginRight := 10;
  RootChild3.MarginBottom := 10;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithPadding;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.PaddingLeft := 10;
  RootChild1.PaddingTop := 10;
  RootChild1.PaddingRight := 10;
  RootChild1.PaddingBottom := 10;
  RootChild1.Width := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.PaddingLeft := 10;
  RootChild3.PaddingTop := 10;
  RootChild3.PaddingRight := 10;
  RootChild3.PaddingBottom := 10;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithSingleRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Stretch;
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

procedure TTestGenAlignContent.AlignContentStretchRowWithFixedHeight;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 60;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithMaxHeight;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.MaxHeight := 20;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchRowWithMinHeight;
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
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 150;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.MinHeight := 80;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Width := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Width := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(90, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
  RootChild3: TYogaNode;
  RootChild4: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.FlexWrap := TYogaWrap.Wrap;
  Root.Width := 100;
  Root.Height := 150;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexShrink := 1;
  RootChild0Child0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexShrink := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 50;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.Height := 50;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.Height := 50;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(150, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(150, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenAlignContent.AlignContentStretchIsNotOverridingAlignItems;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignContent := TYogaAlign.Stretch;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.AlignContent := TYogaAlign.Stretch;
  RootChild0.AlignItems := TYogaAlign.Center;
  RootChild0.Width := 100;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0.Width := 10;
  RootChild0Child0.Height := 10;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(45, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenAlignContent);

end.
