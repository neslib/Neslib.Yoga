unit TestGenFlexDirection;

// Generated from gentest/fixtures/YGFlexDirectionTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenFlexDirection = class
  public
    [Test] procedure FlexDirectionColumnNoHeight;
    [Test] procedure FlexDirectionRowNoWidth;
    [Test] procedure FlexDirectionColumn;
    [Test] procedure FlexDirectionRow;
    [Test] procedure FlexDirectionColumnReverse;
    [Test] procedure FlexDirectionRowReverse;
  end;

implementation

{ TTestGenFlexDirection }

procedure TTestGenFlexDirection.FlexDirectionColumnNoHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(30, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(30, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexDirection.FlexDirectionRowNoWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(30, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(30, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexDirection.FlexDirectionColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexDirection.FlexDirectionRow;
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
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexDirection.FlexDirectionColumnReverse;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.ColumnReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(90, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(70, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenFlexDirection.FlexDirectionRowReverse;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.RowReverse;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(90, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(70, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenFlexDirection);

end.
