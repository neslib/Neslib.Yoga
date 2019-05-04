unit TestGenSizeOverflow;

// Generated from gentest/fixtures/YGSizeOverflowTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenSizeOverflow = class
  public
    [Test] procedure NestedOverflowingChild;
    [Test] procedure NestedOverflowingChildInConstraintParent;
    [Test] procedure ParentWrapChildSizeOverflowingParent;
  end;

implementation

{ TTestGenSizeOverflow }

procedure TTestGenSizeOverflow.NestedOverflowingChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 200;
  RootChild0Child0.Height := 200;
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
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(-100, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenSizeOverflow.NestedOverflowingChildInConstraintParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 200;
  RootChild0Child0.Height := 200;
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
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);
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
  Assert.AreEqual<Single>(-100, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenSizeOverflow.ParentWrapChildSizeOverflowingParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.Width := 100;
  RootChild0Child0.Height := 200;
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
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(200, RootChild0Child0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenSizeOverflow);

end.
