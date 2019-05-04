unit TestGenDisplay;

// Generated from gentest/fixtures/YGDisplayTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenDisplay = class
  public
    [Test] procedure DisplayNone;
    [Test] procedure DisplayNoneFixedSize;
    [Test] procedure DisplayNoneWithMargin;
    [Test] procedure DisplayNoneWithChild;
    [Test] procedure DisplayNoneWithPosition;
  end;

implementation

{ TTestGenDisplay }

procedure TTestGenDisplay.DisplayNone;
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
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Display := TYogaDisplay.None;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenDisplay.DisplayNoneFixedSize;
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
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 20;
  RootChild1.Height := 20;
  RootChild1.Display := TYogaDisplay.None;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenDisplay.DisplayNoneWithMargin;
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
  RootChild0.MarginLeft := 10;
  RootChild0.MarginTop := 10;
  RootChild0.MarginRight := 10;
  RootChild0.MarginBottom := 10;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  RootChild0.Display := TYogaDisplay.None;
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
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenDisplay.DisplayNoneWithChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild1Child0: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(0);
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.FlexShrink := 1;
  RootChild1.FlexBasis := TYogaValue.Percent(0);
  RootChild1.Display := TYogaDisplay.None;
  Root.Insert(1, RootChild1);
  
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.FlexGrow := 1;
  RootChild1Child0.FlexShrink := 1;
  RootChild1Child0.FlexBasis := TYogaValue.Percent(0);
  RootChild1Child0.Width := 20;
  RootChild1Child0.MinWidth := 0;
  RootChild1Child0.MinHeight := 0;
  RootChild1.Insert(0, RootChild1Child0);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.FlexGrow := 1;
  RootChild2.FlexShrink := 1;
  RootChild2.FlexBasis := TYogaValue.Percent(0);
  Root.Insert(2, RootChild2);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenDisplay.DisplayNoneWithPosition;
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
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  RootChild1.Top := 10;
  RootChild1.Display := TYogaDisplay.None;
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
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);
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
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenDisplay);

end.
