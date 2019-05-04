unit TestGenMinMaxDimension;

// Generated from gentest/fixtures/YGMinMaxDimensionTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenMinMaxDimension = class
  public
    [Test] procedure MaxWidth;
    [Test] procedure MaxHeight;
    [Test] procedure MinHeight;
    [Test] procedure MinWidth;
    [Test] procedure JustifyContentMinMax;
    [Test] procedure AlignItemsMinMax;
    [Test] procedure JustifyContentOverflowMinMax;
    [Test] procedure FlexGrowToMin;
    [Test] procedure FlexGrowInAtMostContainer;
    [Test] procedure FlexGrowChild;
    [Test] procedure FlexGrowWithinConstrainedMinMaxColumn;
    [Test] procedure FlexGrowWithinMaxWidth;
    [Test] procedure FlexGrowWithinConstrainedMaxWidth;
    [Test] procedure FlexRootIgnored;
    [Test] procedure FlexGrowRootMinimized;
    [Test] procedure FlexGrowHeightMaximized;
    [Test] procedure FlexGrowWithinConstrainedMinRow;
    [Test] procedure FlexGrowWithinConstrainedMinColumn;
    [Test] procedure FlexGrowWithinConstrainedMaxRow;
    [Test] procedure FlexGrowWithinConstrainedMaxColumn;
    [Test] procedure ChildMinMaxWidthFlexing;
    [Test] procedure MinWidthOverridesWidth;
    [Test] procedure MaxWidthOverridesWidth;
    [Test] procedure MinHeightOverridesHeight;
    [Test] procedure MaxHeightOverridesHeight;
    [Test] procedure MinMaxPercentNoWidthHeight;
  end;

implementation

{ TTestGenMinMaxDimension }

procedure TTestGenMinMaxDimension.MaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MaxWidth := 50;
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
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
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

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MaxHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.MaxHeight := 50;
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
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MinHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MinHeight := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MinWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MinWidth := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.JustifyContentMinMax;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 100;
  Root.MinHeight := 100;
  Root.MaxHeight := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 60;
  RootChild0.Height := 60;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.AlignItemsMinMax;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.MinWidth := 100;
  Root.MaxWidth := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 60;
  RootChild0.Height := 60;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.JustifyContentOverflowMinMax;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.MinHeight := 100;
  Root.MaxHeight := 110;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 50;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(110, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(110, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowToMin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.MinHeight := 100;
  Root.MaxHeight := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowInAtMostContainer;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexBasis := 0;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 0;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMinMaxColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MinHeight := 100;
  Root.MaxHeight := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinMaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.MaxWidth := 100;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.Height := 20;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.MaxWidth := 300;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.Height := 20;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexRootIgnored;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexGrow := 1;
  Root.Width := 100;
  Root.MinHeight := 100;
  Root.MaxHeight := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 200;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 100;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(300, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(300, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowRootMinimized;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.MinHeight := 100;
  Root.MaxHeight := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MinHeight := 100;
  RootChild0.MaxHeight := 500;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexBasis := 200;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Height := 100;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(300, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(300, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(300, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(300, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(200, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowHeightMaximized;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MinHeight := 100;
  RootChild0.MaxHeight := 500;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexBasis := 200;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Height := 100;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(500, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(400, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(400, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(500, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(400, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(400, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMinRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.MinWidth := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMinColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.MinHeight := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMaxRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.MaxWidth := 100;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexShrink := 1;
  RootChild0Child0.FlexBasis := 100;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Width := 50;
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.FlexGrowWithinConstrainedMaxColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.MaxHeight := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := 100;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.ChildMinMaxWidthFlexing;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 120;
  Root.Height := 50;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 0;
  RootChild0.MinWidth := 60;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(50);
  RootChild1.MaxWidth := 20;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(120, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(120, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MinWidthOverridesWidth;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 50;
  Root.MinWidth := 100;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MaxWidthOverridesWidth;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.MaxWidth := 100;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MinHeightOverridesHeight;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Height := 50;
  Root.MinHeight := 100;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MaxHeightOverridesHeight;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Height := 200;
  Root.MaxHeight := 100;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMinMaxDimension.MinMaxPercentNoWidthHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MinWidth := TYogaValue.Percent(10);
  RootChild0.MaxWidth := TYogaValue.Percent(10);
  RootChild0.MinHeight := TYogaValue.Percent(10);
  RootChild0.MaxHeight := TYogaValue.Percent(10);
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

initialization
  TDUnitX.RegisterTestFixture(TTestGenMinMaxDimension);

end.
