unit TestGenPercentage;

// Generated from gentest/fixtures/YGPercentageTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenPercentage = class
  public
    [Test] procedure PercentageWidthHeight;
    [Test] procedure PercentagePositionLeftTop;
    [Test] procedure PercentagePositionBottomRight;
    [Test] procedure PercentageFlexBasis;
    [Test] procedure PercentageFlexBasisCross;
    [Test] procedure PercentageFlexBasisCrossMinHeight;
    [Test] procedure PercentageFlexBasisMainMaxHeight;
    [Test] procedure PercentageFlexBasisCrossMaxHeight;
    [Test] procedure PercentageFlexBasisMainMaxWidth;
    [Test] procedure PercentageFlexBasisCrossMaxWidth;
    [Test] procedure PercentageFlexBasisMainMinWidth;
    [Test] procedure PercentageFlexBasisCrossMinWidth;
    [Test] procedure PercentageMultipleNestedWithPaddingMarginAndPercentageValues;
    [Test] procedure PercentageMarginShouldCalculateBasedOnlyOnWidth;
    [Test] procedure PercentagePaddingShouldCalculateBasedOnlyOnWidth;
    [Test] procedure PercentageAbsolutePosition;
    [Test] procedure PercentageWidthHeightUndefinedParentSize;
    [Test] procedure PercentWithinFlexGrow;
    [Test] procedure PercentageContainerInWrappingContainer;
    [Test] procedure PercentAbsolutePosition;
  end;

implementation

{ TTestGenPercentage }

procedure TTestGenPercentage.PercentageWidthHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := TYogaValue.Percent(30);
  RootChild0.Height := TYogaValue.Percent(30);
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(140, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentagePositionLeftTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 400;
  Root.Height := 400;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Left := TYogaValue.Percent(10);
  RootChild0.Top := TYogaValue.Percent(20);
  RootChild0.Width := TYogaValue.Percent(45);
  RootChild0.Height := TYogaValue.Percent(55);
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(400, Root.LayoutWidth);
  Assert.AreEqual<Single>(400, Root.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(180, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(220, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(400, Root.LayoutWidth);
  Assert.AreEqual<Single>(400, Root.LayoutHeight);
  Assert.AreEqual<Single>(260, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(180, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(220, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentagePositionBottomRight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 500;
  Root.Height := 500;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Right := TYogaValue.Percent(20);
  RootChild0.Bottom := TYogaValue.Percent(10);
  RootChild0.Width := TYogaValue.Percent(55);
  RootChild0.Height := TYogaValue.Percent(15);
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(-100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(275, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(500, Root.LayoutWidth);
  Assert.AreEqual<Single>(500, Root.LayoutHeight);
  Assert.AreEqual<Single>(125, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(275, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasis;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(50);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(25);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(125, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(125, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(75, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(125, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(75, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisCross;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(50);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(25);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(125, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(125, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(125, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(125, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(75, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisCrossMinHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MinHeight := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 2;
  RootChild1.MinHeight := TYogaValue.Percent(10);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(140, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(140, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(140, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(140, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisMainMaxHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(10);
  RootChild0.MaxHeight := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(10);
  RootChild1.MaxHeight := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(52, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(148, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(148, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(52, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(148, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisCrossMaxHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(10);
  RootChild0.MaxHeight := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(10);
  RootChild1.MaxHeight := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(120, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(120, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisMainMaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(15);
  RootChild0.MaxWidth := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(10);
  RootChild1.MaxWidth := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisCrossMaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(10);
  RootChild0.MaxWidth := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(15);
  RootChild1.MaxWidth := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(160, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(40, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisMainMinWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(15);
  RootChild0.MinWidth := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(10);
  RootChild1.MinWidth := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageFlexBasisCrossMinWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(10);
  RootChild0.MinWidth := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(15);
  RootChild1.MinWidth := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageMultipleNestedWithPaddingMarginAndPercentageValues;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(10);
  RootChild0.MarginLeft := 5;
  RootChild0.MarginTop := 5;
  RootChild0.MarginRight := 5;
  RootChild0.MarginBottom := 5;
  RootChild0.PaddingLeft := 3;
  RootChild0.PaddingTop := 3;
  RootChild0.PaddingRight := 3;
  RootChild0.PaddingBottom := 3;
  RootChild0.MinWidth := TYogaValue.Percent(60);
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.MarginLeft := 5;
  RootChild0Child0.MarginTop := 5;
  RootChild0Child0.MarginRight := 5;
  RootChild0Child0.MarginBottom := 5;
  RootChild0Child0.PaddingLeft := TYogaValue.Percent(3);
  RootChild0Child0.PaddingTop := TYogaValue.Percent(3);
  RootChild0Child0.PaddingRight := TYogaValue.Percent(3);
  RootChild0Child0.PaddingBottom := TYogaValue.Percent(3);
  RootChild0Child0.Width := TYogaValue.Percent(50);
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.MarginLeft := TYogaValue.Percent(5);
  RootChild0Child0Child0.MarginTop := TYogaValue.Percent(5);
  RootChild0Child0Child0.MarginRight := TYogaValue.Percent(5);
  RootChild0Child0Child0.MarginBottom := TYogaValue.Percent(5);
  RootChild0Child0Child0.PaddingLeft := 3;
  RootChild0Child0Child0.PaddingTop := 3;
  RootChild0Child0Child0.PaddingRight := 3;
  RootChild0Child0Child0.PaddingBottom := 3;
  RootChild0Child0Child0.Width := TYogaValue.Percent(45);
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 4;
  RootChild1.FlexBasis := TYogaValue.Percent(15);
  RootChild1.MinWidth := TYogaValue.Percent(20);
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(190, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(48, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(8, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(8, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(92, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(6, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(58, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(142, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(5, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(5, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(190, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(48, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(8, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(92, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(6, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(58, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(142, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageMarginShouldCalculateBasedOnlyOnWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginLeft := TYogaValue.Percent(10);
  RootChild0.MarginTop := TYogaValue.Percent(10);
  RootChild0.MarginRight := TYogaValue.Percent(10);
  RootChild0.MarginBottom := TYogaValue.Percent(10);
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 10;
  RootChild0Child0.Height := 10;
  RootChild0.Insert(0, RootChild0Child0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(160, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(160, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(60, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentagePaddingShouldCalculateBasedOnlyOnWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.PaddingLeft := TYogaValue.Percent(10);
  RootChild0.PaddingTop := TYogaValue.Percent(10);
  RootChild0.PaddingRight := TYogaValue.Percent(10);
  RootChild0.PaddingBottom := TYogaValue.Percent(10);
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 10;
  RootChild0Child0.Height := 10;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(170, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageAbsolutePosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := TYogaValue.Percent(30);
  RootChild0.Top := TYogaValue.Percent(10);
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageWidthHeightUndefinedParentSize;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := TYogaValue.Percent(50);
  RootChild0.Height := TYogaValue.Percent(50);
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutWidth);
  Assert.AreEqual<Single>(0, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentWithinFlexGrow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 350;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := TYogaValue.Percent(100);
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 100;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(350, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(250, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(350, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(250, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(150, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentageContainerInWrappingContainer;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild0Child0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0.JustifyContent := TYogaJustify.Center;
  RootChild0Child0.Width := TYogaValue.Percent(100);
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.Width := 50;
  RootChild0Child0Child0.Height := 50;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild0Child0Child1 := TYogaNode.Create;
  RootChild0Child0Child1.Width := 50;
  RootChild0Child0Child1.Height := 50;
  RootChild0Child0.Insert(1, RootChild0Child0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0Child1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPercentage.PercentAbsolutePosition;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 60;
  Root.Height := 50;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0.PositionType := TYogaPositionType.Absolute;
  RootChild0.Left := TYogaValue.Percent(50);
  RootChild0.Width := TYogaValue.Percent(100);
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := TYogaValue.Percent(100);
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.Width := TYogaValue.Percent(100);
  RootChild0.Insert(1, RootChild0Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(60, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(60, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(60, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(-60, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0Child1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenPercentage);

end.
