unit TestGenRounding;

// Generated from gentest/fixtures/YGRoundingTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenRounding = class
  public
    [Test] procedure RoundingFlexBasisFlexGrowRowWidthOf100;
    [Test] procedure RoundingFlexBasisFlexGrowRowPrimeNumberWidth;
    [Test] procedure RoundingFlexBasisFlexShrinkRow;
    [Test] procedure RoundingFlexBasisOverridesMainSize;
    [Test] procedure RoundingTotalFractial;
    [Test] procedure RoundingTotalFractialNested;
    [Test] procedure RoundingFractialInput1;
    [Test] procedure RoundingFractialInput2;
    [Test] procedure RoundingFractialInput3;
    [Test] procedure RoundingFractialInput4;
    [Test] procedure RoundingInnerNodeControversyHorizontal;
    [Test] procedure RoundingInnerNodeControversyVertical;
    [Test] procedure RoundingInnerNodeControversyCombined;
  end;

implementation

{ TTestGenRounding }

procedure TTestGenRounding.RoundingFlexBasisFlexGrowRowWidthOf100;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(33, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(33, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(34, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(67, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(33, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(67, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(33, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(33, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(34, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(33, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFlexBasisFlexGrowRowPrimeNumberWidth;
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
  Root.Width := 113;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  Root.Insert(2, RootChild2);
  
  RootChild3 := TYogaNode.Create;
  RootChild3.FlexGrow := 1;
  Root.Insert(3, RootChild3);
  
  RootChild4 := TYogaNode.Create;
  RootChild4.FlexGrow := 1;
  Root.Insert(4, RootChild4);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(113, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(23, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(22, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(68, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(22, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(113, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(68, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(22, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(45, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Assert.AreEqual<Single>(23, RootChild3.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild3.LayoutTop);
  Assert.AreEqual<Single>(22, RootChild3.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild3.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild4.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild4.LayoutTop);
  Assert.AreEqual<Single>(23, RootChild4.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild4.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFlexBasisFlexShrinkRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 101;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := 100;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexBasis := 25;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexBasis := 25;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(101, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(51, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(51, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(76, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(101, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(51, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(25, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(25, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFlexBasisOverridesMainSize;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 113;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 50;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingTotalFractial;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 87.4;
  Root.Height := 113.4;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 0.7;
  RootChild0.FlexBasis := 50.3;
  RootChild0.Height := 20.3;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1.6;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1.1;
  RootChild2.Height := 10.7;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(87, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(59, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(59, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(87, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(59, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(59, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingTotalFractialNested;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child1: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 87.4;
  Root.Height := 113.4;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 0.7;
  RootChild0.FlexBasis := 50.3;
  RootChild0.Height := 20.3;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.FlexGrow := 1;
  RootChild0Child0.FlexBasis := 0.3;
  RootChild0Child0.Bottom := 13.3;
  RootChild0Child0.Height := 9.9;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child1 := TYogaNode.Create;
  RootChild0Child1.FlexGrow := 4;
  RootChild0Child1.FlexBasis := 0.3;
  RootChild0Child1.Top := 13.3;
  RootChild0Child1.Height := 1.1;
  RootChild0.Insert(1, RootChild0Child1);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1.6;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1.1;
  RootChild2.Height := 10.7;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(87, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(59, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(-13, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(12, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(47, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(59, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(87, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(59, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(-13, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(12, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child1.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0Child1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild0Child1.LayoutWidth);
  Assert.AreEqual<Single>(47, RootChild0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(59, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(30, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(87, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFractialInput1;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 113.4;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 50;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFractialInput2;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 113.6;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 50;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(114, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(65, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(65, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(114, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(65, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(65, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFractialInput3;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Top := 0.3;
  Root.Width := 100;
  Root.Height := 113.4;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 50;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(114, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(65, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(114, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(65, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingFractialInput4;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Top := 0.7;
  Root.Width := 100;
  Root.Height := 113.4;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexBasis := 50;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(1, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(1, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(113, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(64, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(64, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(25, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(89, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(24, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingInnerNodeControversyHorizontal;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 320;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.FlexGrow := 1;
  RootChild1Child0.Height := 10;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(320, Root.LayoutWidth);
  Assert.AreEqual<Single>(10, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(107, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(107, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(106, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(106, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(213, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(107, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(320, Root.LayoutWidth);
  Assert.AreEqual<Single>(10, Root.LayoutHeight);
  Assert.AreEqual<Single>(213, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(107, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(107, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(106, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(106, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(107, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingInnerNodeControversyVertical;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Height := 320;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.FlexGrow := 1;
  RootChild1Child0.Width := 10;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(10, Root.LayoutWidth);
  Assert.AreEqual<Single>(320, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(107, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(213, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(10, Root.LayoutWidth);
  Assert.AreEqual<Single>(320, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(107, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(213, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenRounding.RoundingInnerNodeControversyCombined;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild1Child1: TYogaNode;
  RootChild1Child1Child0: TYogaNode;
  RootChild1Child2: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 640;
  Root.Height := 320;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.Height := TYogaValue.Percent(100);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Height := TYogaValue.Percent(100);
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.FlexGrow := 1;
  RootChild1Child0.Width := TYogaValue.Percent(100);
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild1Child1 := TYogaNode.Create;
  RootChild1Child1.FlexGrow := 1;
  RootChild1Child1.Width := TYogaValue.Percent(100);
  RootChild1.Insert(1, RootChild1Child1);
  
  RootChild1Child1Child0 := TYogaNode.Create;
  RootChild1Child1Child0.FlexGrow := 1;
  RootChild1Child1Child0.Width := TYogaValue.Percent(100);
  RootChild1Child1.Insert(0, RootChild1Child1Child0);
  
  RootChild1Child2 := TYogaNode.Create;
  RootChild1Child2.FlexGrow := 1;
  RootChild1Child2.Width := TYogaValue.Percent(100);
  RootChild1.Insert(2, RootChild1Child2);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.Height := TYogaValue.Percent(100);
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(640, Root.LayoutWidth);
  Assert.AreEqual<Single>(320, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(213, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(213, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(107, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(213, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(427, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(213, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(640, Root.LayoutWidth);
  Assert.AreEqual<Single>(320, Root.LayoutHeight);
  Assert.AreEqual<Single>(427, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(213, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(213, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1.LayoutLeft);
  Assert.AreEqual<Single>(107, RootChild1Child1.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child1.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(106, RootChild1Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child2.LayoutLeft);
  Assert.AreEqual<Single>(213, RootChild1Child2.LayoutTop);
  Assert.AreEqual<Single>(214, RootChild1Child2.LayoutWidth);
  Assert.AreEqual<Single>(107, RootChild1Child2.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(213, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(320, RootChild2.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenRounding);

end.
